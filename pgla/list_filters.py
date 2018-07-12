from __future__ import absolute_import, unicode_literals
from datetime import datetime
from django.contrib import admin
from collections import OrderedDict

year = datetime.now().year
states = {}

class YearListFilter(admin.SimpleListFilter):
    template = 'filter_billing.html'
    title = 'Year'
    parameter_name = 'billing_date'
    years = range(year - 4, year + 1)

    def lookups(self, request, model_admin):
        return [(year, year) for year in self.years]

    def queryset(self, request, queryset):
        if self.value():
            value = int(self.value())
            if value in self.years:
                completed = queryset.filter(billing_date__year=value)

                if year == value:

                    provisioning = queryset.filter(billing_date__isnull=True)

                    completed = completed | provisioning

                return completed
        return queryset

    def value(self):
        value = super(YearListFilter, self).value()
        if value is None:
            return year
        return value

class QuarterListFilter(admin.SimpleListFilter):
    title = 'Quarters'
    parameter_name = 'quarter'
    quarters = OrderedDict({
        'Q1': {'billing_date__month__gte': 1, 'billing_date__month__lte': 3},
        'Q2': {'billing_date__month__gte': 4, 'billing_date__month__lte': 6},
        'Q3': {'billing_date__month__gte': 7, 'billing_date__month__lte': 9},
        'Q4': {'billing_date__month__gte': 10, 'billing_date__month__lte': 12}
        })

    def lookups(self, request, model_admin):
        return [('Q1', 'Q1'), ('Q2', 'Q2'),  ('Q3', 'Q3'),  ('Q4', 'Q4')]

    def queryset(self, request, queryset):
        quarter = self.value()
        if quarter and quarter in self.quarters:
            return queryset.filter(**self.quarters[quarter])
        return queryset

class StateListFilter(admin.SimpleListFilter):
    title = 'State'
    parameter_name = 'state'

    def lookups(self, request, model_admin):
        print(states)
        return [('PROVISIONING', 'PROVISIONING'), ('PENDING ACTIVATION', 'PENDING ACTIVATION')]

    def queryset(self, request, queryset):
        value = self.value()
        if value:
            if value == 'PROVISIONING':
                return queryset.filter(billing_date__isnull=True)
            elif value == 'PENDING ACTIVATION':
                return queryset.filter(activation_date__isnull=True)
        return queryset
