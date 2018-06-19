import os
from io import StringIO
from wsgiref.util import FileWrapper
from jinja2 import Environment, FileSystemLoader, Markup
from import_export.admin import ImportExportModelAdmin
from django import forms
from django.contrib import admin
from django.contrib.auth.admin import UserAdmin
from django.contrib.auth.models import User
from .models import Link, Profile, ProvisionTime, Configuration, Hostname, Photo, LookingGlass, Credentials, Note

from django.http import HttpResponseRedirect, StreamingHttpResponse
from django.db.models import F, Q
from django.contrib import messages

from .helper_functions import local_id_regex, get_config_from, extract_info, placeholderReplace, convert_netmask, format_speed, create_template_excel
from .list_filters import YearListFilter, QuarterListFilter
from .resources import LinkResource
from django_admin_listfilter_dropdown.filters import DropdownFilter, RelatedDropdownFilter

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

class RelatedInline(admin.TabularInline):
    model = Link
    extra = 0
    fields = ('pgla', 'nsr', 'billing_date')
    readonly_fields = ['pgla', 'nsr', 'billing_date']

    def has_add_permission(self, request):
        return False

class ConfigurationInline(admin.StackedInline):
    model = Configuration
    verbose_name_plural = 'configs'

class PhotoInline(admin.StackedInline):
    model = Photo
    extra = 1

class NoteInline(admin.TabularInline):
    model = Note
    extra = 1

class LinkAdmin(ImportExportModelAdmin):
    resource_class = LinkResource
    inlines = (NoteInline, RelatedInline, ConfigurationInline, PhotoInline)
    empty_value_display = '-empty-'
    list_display = ('pgla', 'nsr', 'movement', 'local_id', 'duedate_ciap', 'billing_date')
    readonly_fields = ('pgla', 'nsr', 'movement', 'country', 'address', 'cnr')
    search_fields = ('pgla', 'nsr', 'client__name', 'country__name', 'local_id', 'participants__first_name')
    ordering = ('-pgla',)
    list_per_page = 20
    list_filter = (YearListFilter, QuarterListFilter, ('client', RelatedDropdownFilter),)
    fieldsets = (
        ('Circuit', {
            'fields': ('pgla', 'nsr', 'movement', 'local_id', 'country', 'address', 'state', 'cnr')
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
                        config = get_config_from(obj.country, hostname.name, command='show configuration running-config')
                    elif obj.country.name == 'COLOMBIA' and hostname.os == 'ios':
                        config = get_config_from(obj.country, hostname.name, command='show configuration')
                    else:
                        config = get_config_from(obj.country, hostname.name, command='show running-config')

                    if config == 0:
                        self.message_user(request, "Incorrect the hostname", level=messages.ERROR)
                    elif config == 1:
                        self.message_user(request, "No VPN connection", level=messages.ERROR)
                    else:
                        print('extracting config')
                        interface_config = extract_info(config, obj, hostname, obj.country)
                        print(interface_config)
                        if interface_config:
                            print('saving')
                            config_model, created = Configuration.objects.get_or_create(hostname=hostname, link=obj)
                            config_model.update(interface_config)

                            if created:
                                obj.configuration = config_model
                                obj.save()

                            obj.client.add_vrf(config_model.vrf)
                            print('saved')
                else:
                    self.message_user(request, "This service's country doesnt have a LG", level=messages.ERROR)
            else:
                self.message_user(request, "Please specify a Local-ID", level=messages.ERROR)
            return HttpResponseRedirect(".")
        elif "template" in request.POST:
            if obj.config:
                file_loader = FileSystemLoader(os.path.join(os.path.dirname(__file__)))
                env = Environment(loader=file_loader, trim_blocks=True, lstrip_blocks=True)
                env.filters["convert_netmask"] = convert_netmask
                env.filters["format_speed"] = format_speed
                template = env.get_template('template.j2')
                config = obj.config
                config.client = obj.client.name
                if obj.nsr[-1] == 'P':
                    config.cm = '28513:285'
                else:
                    config.cm = '28513:286'

                output = template.render(config=config)
                #output = create_template_excel(obj, template)
                file = StringIO(output)
                response = StreamingHttpResponse(FileWrapper(file), content_type="application/config")
                response['Content-Disposition'] = "attachment; filename=%d-%s.config" % (obj.pgla, obj.nsr)
                return response
            else:
                self.message_user(request, "Upload or manually enter the configuration specs", level=messages.ERROR)
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
    list_display = ('pgla', 'nsr', 'reception_ciap', 'billing_date', 'cnr', 'real_time_to_provision')
    search_fields = ('pgla', 'nsr')
    ordering = ('-pgla',)
    list_per_page = 20
    list_filter = (YearListFilter, QuarterListFilter, ('client', RelatedDropdownFilter),)

    def has_add_permission(self, request):
        return False

    def get_queryset(self, request):
        qs = super().get_queryset(request).annotate(time_to_provision=F('billing_date')-F('reception_ciap'))
        if request.user.is_superuser:
            return qs
        else:
            return qs.filter(participants=request.user)

    def changelist_view(self, request, extra_context=None):
        response = super(ProvisionTimeAdmin, self).changelist_view(request, extra_context=extra_context)

        qs = response.context_data['cl'].queryset

        # States

        links_completed = qs.filter(~Q(state="INSTALACION SUSPENDIDA"), billing_date__isnull=False)

        links_on_hold = qs.filter(state='INSTALACION SUSPENDIDA')

        links_provisioning = qs.filter(~Q(state='DESCONEXION SOLICITADA (DXSO)'), ~Q(state="INSTALACION SUSPENDIDA"),
                                          billing_date__isnull=True)
        links_disconnected = qs.filter(state='DESCONEXION SOLICITADA (DXSO)')

        states = [
            {"name": 'Completed', "y": links_completed.count(), "drilldown": 'Completed'},
            {'name': 'On Hold', 'y': links_on_hold.count(), "drilldown": 'On_Hold'},
            {'name': 'Provisioning', 'y': links_provisioning.count(), "drilldown": 'Provisioning'},
            {'name': 'Disconnection', 'y': links_disconnected.count(), "drilldown": 'Disconnection'}
        ]

        response.context_data['states'] = states

        # Completion Times

        categories = []
        series = [{'name': 'Fastest', 'data': []}, {'name': 'Average', 'data': []}, {'name': 'Slowest', 'data': []}]

        for country in set(qs.values_list('country__name', flat=True)):
            fastest = float("inf")
            slowest = 0
            average = []
            links_for_country = qs.filter(country__name=country)
            for link in links_for_country:
                if link.reception_ciap and link.billing_date:
                    provision_days = (link.billing_date - link.reception_ciap).days
                    average.append(provision_days)
                    if provision_days < fastest:
                        fastest = provision_days
                    if provision_days > slowest:
                        slowest = provision_days

            if len(average) > 0:
                average = sum(average) // len(average)
                categories.append(country)
                series[0]['data'].append(fastest)
                series[1]['data'].append(average)
                series[2]['data'].append(slowest)

        response.context_data['categories'] = categories
        response.context_data['series'] = series
        return response

    def real_time_to_provision(self, obj):
        if obj.time_to_provision and obj.cnr:
            return obj.time_to_provision.days - obj.cnr
        elif obj.time_to_provision:
            return obj.time_to_provision.days
        else:
            return "Provisioning"

admin.site.register(ProvisionTime, ProvisionTimeAdmin)

class CredentialsInline(admin.StackedInline):
    model = Credentials
    extra = 1

class LookingGlassAdmin(ImportExportModelAdmin):
    inlines = (CredentialsInline,)
    empty_value_display = '-empty-'
    list_display = ('name', 'path', 'username', 'password', 'protocol', 'port')

admin.site.register(LookingGlass, LookingGlassAdmin)