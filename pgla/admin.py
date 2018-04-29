import os
import json
from io import StringIO
from wsgiref.util import FileWrapper
from django import forms
from django.contrib import admin
from django.contrib.auth.admin import UserAdmin
from django.contrib.auth.models import User
from .models import Link, Profile, ProvisionTime, Configuration, Hostname

from django.http import HttpResponseRedirect, StreamingHttpResponse
from django.db.models import F, Q
from django.contrib import messages
from .helper_functions import local_id_regex, getConfigurationFrom, extract_info, placeholderReplace
from .list_filters import LinkListFilter

admin.site.site_header = 'PGLAEX'

# Register your models here.
class ProfileAdminForm(forms.ModelForm):
    report = forms.MultipleChoiceField(
        required=False,
        choices=[(f.name, f.name) for f in Link._meta.get_fields()],
    )

class ProfileInline(admin.StackedInline):
    model = Profile
    form = ProfileAdminForm
    can_delete = False
    verbose_name_plural = 'Profile'
    fk_name = 'user'

class CustomUserAdmin(UserAdmin):
    inlines = (ProfileInline, )

    def get_inline_instances(self, request, obj=None):
        if not obj:
            return list()
        return super(CustomUserAdmin, self).get_inline_instances(request, obj)

admin.site.unregister(User)
admin.site.register(User, CustomUserAdmin)

class ConfigurationInline(admin.StackedInline):
    model = Configuration
    verbose_name_plural = 'Configurations'

class LinkAdmin(admin.ModelAdmin):
    inlines = (ConfigurationInline,)
    empty_value_display = '-empty-'
    list_display = ('pgla', 'nsr', 'local_id', 'duedate_ciap', 'billing_date')
    readonly_fields = ('pgla', 'nsr', 'country', 'address', 'cnr')
    search_fields = ('pgla', 'nsr', 'client__name', 'country__name', 'local_id', 'participants__first_name')
    date_hierarchy = 'duedate_ciap'
    list_per_page = 20
    fieldsets = (
        ('Circuit', {
            'fields': ('pgla', 'nsr', 'local_id', 'country', 'address', 'state', 'cnr')
        }),
        ('Technical Details', {
            'fields': ('interface', 'profile', 'speed'),
        }),
        ('Participants', {
            'fields': ('participants',),
        }),
        ('Dates', {
            'classes': ('collapse',),
            'fields': (
                ('reception_ciap', 'duedate_ciap', 'billing_date'), ('entraga_ciap', 'duedate_acc', 'activation_date')),
        }),
    )

    def has_add_permission(self, request):
        return False

    def response_change(self, request, obj):
        if "update_cnr" in request.POST:
            obj.update_cnr()
            self.message_user(request, "The CNR was updated")
            return HttpResponseRedirect(".")
        elif "connect" in request.POST:
                try:
                    replacements = {
                        '[HOSTNAME]': obj.config.hostname.name,
                        '[COUNTRY]': obj.country.name,
                        '[PATH]': obj.country.lg.path,
                        '[USERNAME]': obj.country.lg.username,
                        '[PASSWORD]': obj.country.lg.password,
                        '[PROTOCOL]': obj.country.lg.protocol,
                        '[PORT]': str(obj.country.lg.port)
                    }
                    file_path = os.path.join('pgla', 'telmex_glass.py')
                    file_content = placeholderReplace(file_path, replacements)
                    file = StringIO(file_content)
                    response = StreamingHttpResponse(FileWrapper(file), content_type="application/py")
                    response['Content-Disposition'] = "attachment; filename=telmex_glass.py"
                    return response
                except:
                    self.message_user(request, "This service's has no configuration assign (use Get Config)", level=messages.ERROR)
                    return HttpResponseRedirect(".")
        elif "download_config" in request.POST:
            if obj.local_id:
                if obj.country.lg:
                    try:
                        hostname = Hostname.objects.get(local_ids__contains=[obj.local_id])
                    except:
                        self.message_user(request, "This service's is not configured yet", level=messages.ERROR)
                        return HttpResponseRedirect(".")

                    if obj.country.name == 'COLOMBIA' and hostname.os == 'xr':
                        config = getConfigurationFrom(obj.country, hostname, command='show configuration running-config')
                    elif obj.country.name == 'COLOMBIA' and hostname.os == 'ios':
                        config = getConfigurationFrom(obj.country, hostname, command='show configuration')
                    else:
                        config = getConfigurationFrom(obj.country, hostname, command='show running-config')

                    if config == 0:
                        self.message_user(request, "Incorrect the hostname", level=messages.ERROR)
                    elif config == 1:
                        self.message_user(request, "No VPN connection", level=messages.ERROR)
                    else:
                        interface_config = extract_info(config, obj, hostname, obj.country)
                        if interface_config:
                            config_model, created = Configuration.objects.get_or_create(hostname=hostname, link=obj)
                            config_model.update(interface_config)

                            if created:
                                obj.configuration = config_model
                                obj.save()

                            obj.client.add_vrf(config_model.vrf)
                else:
                    self.message_user(request, "This service's country doesnt have a LG", level=messages.ERROR)
            else:
                self.message_user(request, "Please specify a Local-ID", level=messages.ERROR)
            return HttpResponseRedirect(".")
        return super().response_change(request, obj)

    def get_queryset(self, request):
        qs = super().get_queryset(request)
        if request.user.is_superuser:
            return qs
        else:
            return qs.filter(participants=request.user)

admin.site.register(Link, LinkAdmin)

class ProvisionTimeAdmin(admin.ModelAdmin):
    list_display = ('pgla', 'nsr', 'reception_ciap_as_string','billing_date_as_string', 'cnr', 'real_time_to_provision')
    search_fields = ('pgla', 'nsr')
    list_per_page = 20
    list_filter = (LinkListFilter,)

    def has_add_permission(self, request):
        return False

    def get_queryset(self, request):
        qs = super().get_queryset(request).annotate(time_to_provision=F('billing_date')-F('reception_ciap'))
        if request.user.is_superuser:
            return qs
        else:
            return qs.filter(participants=request.user)

    def changelist_view(self, request, extra_context=None):
        qs = self.get_queryset(request)
        print('admin')
        links_completed = qs.filter(billing_date__isnull=False)
        links_on_hold = qs.filter(state='INSTALACION SUSPENDIDA')
        links_provisioning = qs.filter(~Q(state='DESCONEXION SOLICITADA (DXSO)'), ~Q(state="INSTALACION SUSPENDIDA"),
                                          billing_date__isnull=True)
        links_disconnected = qs.filter(state='DESCONEXION SOLICITADA (DXSO)')

        data = [
            {"name": 'Completed', "y": links_completed.count(), "drilldown": 'Completed'},
            {'name': 'On Hold', 'y': links_on_hold.count(), "drilldown": 'On_Hold'},
            {'name': 'Provisioning', 'y': links_provisioning.count(), "drilldown": 'Provisioning'},
            {'name': 'Disconnection', 'y': links_disconnected.count(), "drilldown": 'Disconnection'}
        ]

        return super(ProvisionTimeAdmin, self).changelist_view(request, extra_context={'data': data})

    def real_time_to_provision(self, obj):
        if obj.time_to_provision and obj.cnr:
            return obj.time_to_provision.days - obj.cnr
        elif obj.time_to_provision:
            return obj.time_to_provision.days
        else:
            return "Provisioning"

admin.site.register(ProvisionTime, ProvisionTimeAdmin)