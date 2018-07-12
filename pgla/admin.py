import os
from django.utils import timezone
from datetime import datetime
import calendar
from wsgiref.util import FileWrapper
from jinja2 import Environment, FileSystemLoader, Markup
from import_export.admin import ImportExportModelAdmin
from django import forms
from django.contrib import admin
from django.contrib.auth.admin import UserAdmin
from django.contrib.auth.models import User
from .models import Link, Profile, ProvisionTime, Configuration, Hostname, Photo, LookingGlass, Credentials, Note, Country, Movement

from django.http import HttpResponseRedirect, StreamingHttpResponse
from django.db.models import F, Q
from django.contrib import messages
from django.utils.safestring import mark_safe

from .helper_functions import get_config_from, extract_info, convert_netmask, format_speed, create_template_excel, createRFS
from .helper_functions import INVALID_COMMAND, INVALID_AUTH, INVALID_HOSTNAME, CONNECTION_PROBLEM
from .list_filters import YearListFilter, QuarterListFilter, StateListFilter
from .resources import LinkResource, ProvisionTimeResource
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
    template = 'admin/pgla/link/edit_inline/stacked.html'

class PhotoInline(admin.StackedInline):
    model = Photo
    extra = 1

class NoteInline(admin.TabularInline):
    model = Note
    fields = ('text',)
    extra = 1

class LinkAdmin(ImportExportModelAdmin):
    resource_class = LinkResource
    inlines = (PhotoInline, ConfigurationInline, RelatedInline, NoteInline)
    empty_value_display = '-empty-'
    list_display = ('client', 'pgla', 'nsr', 'movement', 'local_id', 'duedate_ciap', 'billing_date')
    readonly_fields = ('client', 'pgla', 'nsr', 'movement', 'country', 'address', 'cnr')
    search_fields = ('pgla', 'nsr', 'client__name', 'country__name', 'local_id', 'participants__first_name')
    ordering = ('-pgla',)
    list_per_page = 20
    list_filter = (('client', RelatedDropdownFilter), YearListFilter, QuarterListFilter, StateListFilter)
    fieldsets = (
        ('Circuit', {
            'fields': ('client', 'pgla', 'nsr', 'movement', 'local_id', 'country', 'address', 'state', 'cnr')
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
                if obj.config.hostname:
                    import socket
                    from ciscoconfparse import CiscoConfParse
                    try:
                        config = open(os.path.join('pgla', 'configs', obj.country.name, obj.config.hostname.name + '.txt'))
                        parser = CiscoConfParse(config)

                        vrf_list = ()

                        if obj.config.hostname.os == 'ios':
                            for line in parser.find_parents_w_child("^ip vrf", "rd"):
                                vrf = line.split(" ")[-1]
                                vrf_list = vrf_list + (vrf,)
                        elif obj.config.hostname.os == 'xr':
                            for line in parser.find_parents_w_child("^vrf", "address-family"):
                                vrf = line.split(" ")[-1]
                                vrf_list = vrf_list + (vrf,)
                    except FileNotFoundError:
                        pass

                    server_ip = socket.gethostbyname(socket.gethostname())
                    port = request.META['SERVER_PORT']

                    file_loader = FileSystemLoader(os.path.join(os.path.dirname(__file__)))
                    env = Environment(loader=file_loader, trim_blocks=True, lstrip_blocks=True)
                    template = env.get_template('telmex_glass.py')
                    template = template.render(pk=obj.pk,
                                                hostname=obj.config.hostname.name,
                                                os=obj.config.hostname.os,
                                                vrf_list=vrf_list,
                                                server_ip=server_ip,
                                                port=port)

                    response = StreamingHttpResponse(template, content_type="application/py")
                    response['Content-Disposition'] = "attachment; filename=%s.py" % (obj.config.hostname.name,)

                    return response
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
                    elif obj.country.name == 'CHILE':
                        config = get_config_from(obj.country, hostname.name, command='show star')
                    else:
                        config = get_config_from(obj.country, hostname.name)

                    if config == INVALID_HOSTNAME:
                        self.message_user(request, "Incorrect the hostname", level=messages.ERROR)
                    elif config == CONNECTION_PROBLEM:
                        self.message_user(request, "No VPN connection", level=messages.ERROR)
                    elif config == INVALID_AUTH:
                        self.message_user(request, "Wrong credentials", level=messages.ERROR)
                    elif config == INVALID_COMMAND:
                        self.message_user(request, "Invalid command", level=messages.ERROR)
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

                config = obj.config
                config.client = obj.client.name

                if obj.nsr[-1] == 'P':
                    config.cm = '28513:285'
                else:
                    config.cm = '28513:286'

                template = env.get_template('template.j2').render(config=config)
                output = create_template_excel(obj, template)
                response = StreamingHttpResponse(FileWrapper(output), content_type="application/vnd.ms-excel")
                response['Content-Disposition'] = "attachment; filename=%s-%d-%s.xlsx" % (obj.site_name, obj.pgla, obj.nsr)
                return response
            else:
                self.message_user(request, "Upload or manually enter the configuration specs", level=messages.ERROR)
                return HttpResponseRedirect(".")
        elif "rfs" in request.POST:
            rfs_excel = createRFS(obj)
            response = StreamingHttpResponse(FileWrapper(rfs_excel), content_type="application/vnd.ms-excel")
            response['Content-Disposition'] = "attachment; filename=PGLA-" + obj.pgla + "-" + obj.nsr + "-" + obj.movement + ".xlsx"
        return super().response_change(request, obj)

    def get_queryset(self, request):
        qs = super().get_queryset(request)
        if request.user.is_superuser:
            return qs
        else:
            return qs.filter(participants=request.user)

admin.site.register(Link, LinkAdmin)

class ProvisionTimeAdmin(ImportExportModelAdmin):
    change_list_template = 'admin/pgla/provisiontime/change_list.html'
    resource_class = ProvisionTimeResource
    list_display = ('pgla', 'nsr', 'movement', 'reception_ciap', 'billing_date', 'total', 'cnr', 'cycle_time')
    empty_value_display = '-empty-'
    search_fields = ('pgla', 'nsr')
    ordering = ('-pgla',)
    list_per_page = 20
    list_filter = (('client', RelatedDropdownFilter), YearListFilter, QuarterListFilter, StateListFilter)

    def has_add_permission(self, request):
        return False

    def get_queryset(self, request):
        qs = super().get_queryset(request).annotate(total=F('billing_date')-F('reception_ciap'))
        if request.user.is_superuser:
            return qs
        else:
            return qs.filter(participants=request.user)

    def changelist_view(self, request, extra_context=None):
        response = super(ProvisionTimeAdmin, self).changelist_view(request, extra_context=extra_context)

        qs = response.context_data['cl'].queryset
        if qs:
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

            ct_categories = []
            ct_series = [{'name': 'Fastest', 'data': []}, {'name': 'Average', 'data': []}, {'name': 'Slowest', 'data': []}]

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
                    ct_categories.append(country)
                    ct_series[0]['data'].append(fastest)
                    ct_series[1]['data'].append(average)
                    ct_series[2]['data'].append(slowest)

            response.context_data['ct_categories'] = ct_categories
            response.context_data['ct_series'] = ct_series

            # Mothly Stats

            ms_series = [
                {'name': 'Completed', 'type': 'column', 'yAxis': 0, 'data': []},
                {'name': 'Time to Complete', 'type': 'spline', 'yAxis': 1, 'data': [], 'tooltip': {'valueSuffix': ' days'}},
                {'name': 'In Due Date', 'type': 'spline', 'yAxis': 2, 'data': [], 'tooltip': {'valueSuffix': '%'}},
            ]

            ms_categories = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']

            try:
                year = qs.dates('billing_date', 'year')[0].year

                for month in ms_categories:
                    month_number = dict((v, k) for k, v in enumerate(calendar.month_abbr))[month]
                    weekday, total_days = calendar.monthrange(year, month_number)
                    start = datetime(year, month_number, 1)
                    end = datetime(year, month_number, total_days)

                    links_completed = qs.filter(billing_date__gte=start, billing_date__lte=end)

                    not_in_duedate = 0
                    average = []
                    for link in links_completed:
                        if link.reception_ciap and link.billing_date:
                            provision_days = (link.billing_date - link.reception_ciap).days
                            if link.cnr:
                                provision_days -= link.cnr
                            average.append(provision_days)
                            if link.duedate_ciap and link.billing_date > link.duedate_ciap:
                                not_in_duedate += 1

                    if len(average) > 0:
                        average = sum(average) // len(average)
                        number_links_completed = links_completed.count()
                        porcentage_in_duedate = int((1 - float(not_in_duedate) / float(number_links_completed)) * 100)
                    else:
                        average = 0
                        number_links_completed = 0
                        porcentage_in_duedate = 100

                    ms_series[0]['data'].append(number_links_completed)
                    ms_series[1]['data'].append(average)
                    ms_series[2]['data'].append(porcentage_in_duedate)
            except:
                pass

            response.context_data['ms_categories'] = ms_categories
            response.context_data['ms_series'] = ms_series

        return response

    def total(self, obj):
        if obj.total:
            return obj.total.days
        else:
            today = timezone.datetime.now().date()
            return (today - obj.reception_ciap).days

    @mark_safe
    def cycle_time(self, obj):
        total = self.total(obj)

        if obj.cnr:
            total -= obj.cnr

        if obj.movement.days and total > obj.movement.days:
            return '<div style="width:100%%; height:100%%; background-color:red;"><span>%s</span></div>' % total
        elif obj.movement.days and total + 15 > obj.movement.days:
            return '<div style="width:100%%; height:100%%; background-color:orange;"><span>%s</span></div>' % total

        return total
    cycle_time.allow_tags = True

admin.site.register(ProvisionTime, ProvisionTimeAdmin)

class CredentialsInline(admin.StackedInline):
    model = Credentials
    extra = 1

class LookingGlassAdmin(ImportExportModelAdmin):
    inlines = (CredentialsInline,)
    empty_value_display = '-empty-'
    list_display = ('name', 'path', 'username', 'password', 'protocol', 'port')

admin.site.register(LookingGlass, LookingGlassAdmin)

admin.site.register(Country)

admin.site.register(Movement)