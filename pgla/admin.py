import os, io, copy
from datetime import datetime
import calendar
from wsgiref.util import FileWrapper
from jinja2 import Environment, FileSystemLoader, Markup
from import_export.admin import ImportExportModelAdmin
from pgla.settings import CONFIG_PATH
from django import forms
from django.contrib import admin
from django.contrib.auth.admin import UserAdmin
from django.contrib.auth.models import User
from .models import Link, Profile, ProvisionTime, Configuration, Hostname, Photo, LookingGlass, Credentials, Note, Country, Movement

from django.http import HttpResponseRedirect, StreamingHttpResponse
from django.db.models import F, Q
from django.contrib import messages
from django.utils.safestring import mark_safe

from .helper_functions import get_config_from, extract_info, convert_netmask, format_speed, create_template_excel, create_rfs, safe_list_get
from .helper_functions import INVALID_COMMAND, INVALID_AUTH, INVALID_HOSTNAME, CONNECTION_PROBLEM
from .list_filters import YearListFilter, QuarterListFilter, StateListFilter
from .resources import LinkResource, ProvisionTimeResource
from .actions import duplicate_service, all_days_report, ct_report
from .forms import LinkForm, ProfileAdminForm
from django_admin_listfilter_dropdown.filters import DropdownFilter, RelatedDropdownFilter

admin.site.site_header = 'PGLAEX'



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

class RelatedInline(admin.StackedInline):
    model = Link
    extra = 0
    fields = ('pgla', 'nsr', 'billing_date')
    can_delete = False

    def has_add_permission(self, request):
        return False

class ConfigurationInline(admin.StackedInline):
    model = Configuration
    verbose_name_plural = 'configs'
    template = 'admin/pgla/link/edit_inline/stacked.html'
    fieldsets = (
        ('', {
            'fields': [
                'hostname', 'mgnt_ip', 'pe_ip', 'ce_ip', 'mask', 'rp', 'speed', 'interface', 'profile', 'encap',
                'encapID', 'vrf', 'client_as', 'telmex_as', 'managed']
        }),
    )

    def get_fieldsets(self, request, obj=None):
        if obj.service != 'RPV Multiservicios':
            return ('', {
            'fields': [
                'hostname', 'mgnt_ip', 'pe_ip', 'ce_ip', 'mask', 'rp', 'speed', 'interface', 'encap',
                'encapID', 'client_as', 'telmex_as', 'managed']
            }),
        return self.fieldsets

class PhotoInline(admin.StackedInline):
    model = Photo
    extra = 1

class NoteInline(admin.TabularInline):
    model = Note
    fields = ('text',)
    extra = 1

class ParentAdmin(ImportExportModelAdmin):
    form = LinkForm
    actions = [duplicate_service, all_days_report, ct_report]
    inlines = (PhotoInline, ConfigurationInline, RelatedInline, NoteInline)
    readonly_fields = ('customer', 'pgla', 'nsr', 'country', 'address', 'cnr', 'participants')
    search_fields = ('site_name', 'pgla', 'nsr', 'customer__name', 'country__name', 'local_id', 'participants__first_name')
    ordering = ('-pgla',)
    list_per_page = 20
    fieldsets = (
        ('Circuit', {
            'fields': (
                'customer', 'pgla', 'nsr', 'site_name', 'movement', 'local_id', 'country', 'address', 'state', 'cnr',
                'special_project')
        }),
        ('Technical Details', {
            'fields': ('interface', 'profile', 'speed'),
        }),
        ('Participants', {
            'fields': ('participants',),
        }),
        ('Dates', {
            'fields': (
                ('eorder_date', 'reception_ciap', 'local_order_date'),
                ('duedate_ciap', 'billing_date', 'activation_date'),
            )
        }),
    )

    def has_add_permission(self, request):
        return False

    def get_readonly_fields(self, request, obj=None):
        if request.user.is_superuser:
            return self.readonly_fields
        return self.readonly_fields + ('movement',)

    def get_actions(self, request):
        actions = super(ParentAdmin, self).get_actions(request)
        if 'delete_selected' in actions:
            del actions['delete_selected']
        return actions

    def get_queryset(self, request):
        qs = super().get_queryset(request)
        if request.user.is_superuser:
            return qs
        else:
            return qs.filter(participants=request.user)

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
                        print(os.path.join(CONFIG_PATH, obj.country.name, obj.config.hostname.name + '.txt'))
                        config = open(os.path.join(CONFIG_PATH, obj.country.name, obj.config.hostname.name + '.txt'))
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
                    except FileNotFoundError:
                        self.message_user(request, "Config not found", level=messages.ERROR)
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

                            obj.customer.add_vrf(config_model.vrf)
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
                config.customer = obj.customer.name
                config.interface = obj.interface

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
            rfs_excel = create_rfs(obj)
            response = StreamingHttpResponse(FileWrapper(rfs_excel), content_type="application/vnd.ms-excel")
            response['Content-Disposition'] = "attachment; filename=PGLA-" + str(obj.pgla) + "-" + obj.nsr + "-" + obj.movement.name + ".xlsx"
            return response
        elif "update" in request.POST:
            hostname = obj.config.hostname
            file_path = os.path.join(CONFIG_PATH, obj.country.name, obj.config.hostname.name) + '.txt'

            if obj.config.hostname.os == 'junos':
                config = get_config_from(obj.country, hostname.name, l=False)
            else:
                config = get_config_from(obj.country, hostname.name, command="show configuration", l=False)

            with io.open(file_path, 'w', encoding="ISO-8859-1") as file:
                print('Saved')
                file.write(config)

            hostname.mtime = datetime.fromtimestamp(os.path.getmtime(file_path))
            hostname.save()
            return HttpResponseRedirect(".")
        elif "view_config" in request.POST:
            if obj.config.hostname:
                try:
                    with open(os.path.join(CONFIG_PATH, obj.country.name, obj.config.hostname.name + ".txt")) as file:
                        data = file.readlines()
                        response = StreamingHttpResponse(data, content_type="application/txt")
                        response['Content-Disposition'] = "attachment; filename=%s.txt" % (obj.config.hostname.name,)
                        return response
                except FileNotFoundError:
                    self.message_user(request, "The config file was not found", level=messages.ERROR)
                    return HttpResponseRedirect(".")
        else:
            return super().response_change(request, obj)

class LinkAdmin(ParentAdmin):
    resource_class = LinkResource
    list_display = ('customer', 'pgla', 'nsr', 'movement', 'local_id', 'duedate_ciap', 'billing_date')
    list_filter = (('customer', RelatedDropdownFilter), YearListFilter, QuarterListFilter, StateListFilter)

admin.site.register(Link, LinkAdmin)

class ProvisionTimeAdmin(ParentAdmin):
    resource_class = ProvisionTimeResource
    list_display = ('site_name', 'customer', 'pgla', 'nsr', 'state', 'movement', 'eorder_date', 'reception_ciap', 'eorder_days', 'lo', 'lo_days', 'billing_date', 'activation_days', 'total', 'cnr', 'cycle_time')
    list_filter = (('customer', RelatedDropdownFilter), YearListFilter, QuarterListFilter, StateListFilter)
    date_hierarchy = 'billing_date'

    def get_queryset(self, request):
        qs = super().get_queryset(request).filter(~Q(movement__name='BAJA'), special_project=False)
        return qs

    def changelist_view(self, request, extra_context=None):
        response = super(ProvisionTimeAdmin, self).changelist_view(request, extra_context=extra_context)

        try:
            qs = response.context_data['cl'].queryset
        except (AttributeError, KeyError):
            return response

        date = safe_list_get(qs.dates('billing_date', 'year').order_by('-billing_date'), 0, False)

        if date:
            year = date.year

            # Current States

            links_completed = qs.filter(~Q(state="INSTALACION SUSPENDIDA"), billing_date__year=year)

            links_on_hold = qs.filter(state='INSTALACION SUSPENDIDA')

            links_provisioning = qs.filter(~Q(state='DESCONEXION SOLICITADA (DXSO)'), ~Q(state="INSTALACION SUSPENDIDA"),
                                              billing_date__isnull=True)

            total = links_completed.count() + links_on_hold.count() + links_provisioning.count()

            states = [
                {'name': 'Completed', "y": (links_completed.count() / total) * 100, 'color': 'green'},
                {'name': 'On Hold', 'y': (links_on_hold.count() / total) * 100, 'color': 'orange'},
                {'name': 'Provisioning', 'y': (links_provisioning.count() / total) * 100, 'color': 'blue'}
            ]

            response.context_data['states'] = states

            # Implementation cycle time

            ict_series = [
                {'name': 'Pending CutOver', 'data': [], 'color': 'green'},
                {'name': 'On Hold', 'data': [], 'color': 'orange'},
                {'name': 'Provisioning', 'data': [], 'color': 'blue'}
            ]

            ict_qs = qs.filter(billing_date__year=year)

            if ict_qs:
                provision = 0
                on_hold = 0
                pco = 0
                pco_total = 0
                for link in ict_qs:
                    provision += link.cycle_time

                    if link.cnr:
                        on_hold += link.cnr

                    if link.activation_date:
                        pco += link.activation_days
                        pco_total += 1

                pco_qs = Link.objects.filter(billing_date__year__lt=year, activation_date__year=year)

                if pco_qs:
                    for link in pco_qs:
                        pco += link.activation_days
                        pco_total += 1

                provision = provision / ict_qs.count()
                on_hold = on_hold / ict_qs.count()
                if pco:
                    pco = pco / pco_total
                total_act = provision + on_hold + pco

                ict_series[0]['name'] += ' (%s days)' % (int(pco),)
                ict_series[0]['data'] = [(pco/total_act)*100]
                ict_series[1]['name'] += ' (%s days)' % (int(on_hold),)
                ict_series[1]['data'] = [(on_hold/total_act)*100]
                ict_series[2]['name'] += ' (%s days)' % (int(provision),)
                ict_series[2]['data'] = [(provision/total_act)*100]

            #print(ict_series)
            response.context_data['ict_series'] = ict_series

            # Completion Times

            #ct_categories = []
            ct_series = [{'name': 'Countries', 'data': []}]

            for country in set(qs.values_list('country__name', flat=True)):
                average = []
                links_for_country = qs.filter(country__name=country)
                for link in links_for_country:
                    if link.reception_ciap and link.billing_date:
                        average.append(link.cycle_time)

                if len(average) > 0:
                    average = sum(average) // len(average)
                    ct_series[0]['data'].append({'name': country, 'y': average})

            #response.context_data['ct_categories'] = ct_categories
            response.context_data['ct_series'] = ct_series

            # Mothly Stats

            ms_series = [
                {'name': 'Completed', 'type': 'column', 'yAxis': 0, 'data': []},
                {'name': 'Time to Complete', 'type': 'spline', 'yAxis': 1, 'data': [], 'tooltip': {'valueSuffix': ' days'}},
                {'name': 'In Due Date', 'type': 'spline', 'yAxis': 2, 'data': [], 'tooltip': {'valueSuffix': '%'}},
            ]

            ms_categories = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']

            try:

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

            response.context_data['cl'].queryset = qs.filter(Q(billing_date__year=year) | Q(billing_date__isnull=True))
        return response

    @mark_safe
    def cycle_time(self, obj):
        if obj.movement.days and obj.cycle_time > obj.movement.days:
            return '<div style="width:100%%; height:100%%; background-color:#FF7575;"><span>%s</span></div>' % obj.cycle_time
        elif obj.movement.days and obj.cycle_time + 15 > obj.movement.days:
            return '<div style="width:100%%; height:100%%; background-color:orange;"><span>%s</span></div>' % obj.cycle_time
        return obj.cycle_time

    cycle_time.allow_tags = True

    def lo(self, obj):
        return obj.local_order_date

    def lo_days(self, obj):
        return obj.local_order_days

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