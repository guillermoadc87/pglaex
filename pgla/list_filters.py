from __future__ import absolute_import, unicode_literals
from datetime import datetime
from django.contrib import admin
from django.db.models import Q

class LinkListFilter(admin.SimpleListFilter):
    title = 'services'

    parameter_name = 'billing_date'

    year = datetime.now().year

    def lookups(self, request, model_admin):
        years = [(year, year) for year in range(self.year-4, self.year+1)]
        return years

    def queryset(self, request, queryset):
        print('filter')
        if self.value():
            completed = queryset.filter(billing_date__year=self.value())
            print(completed)
            on_hold = queryset.filter(state='INSTALACION SUSPENDIDA')
            print(on_hold)
            provisioning = queryset.filter(~Q(state='DESCONEXION SOLICITADA (DXSO)'),
                                           ~Q(state="INSTALACION SUSPENDIDA"),
                                           billing_date__isnull=True)
            print(provisioning)
            disconnected = queryset.filter(state='DESCONEXION SOLICITADA (DXSO)')
            print(disconnected)
            return completed.union(on_hold, provisioning, disconnected)
        return queryset

    #def value(self):
    #    value = super(LinkListFilter, self).value()
    #    if value is None:
    #        return self.year
    #    return value
