# -*- coding: utf-8 -*-
import re, os
from datetime import datetime
from django.core.management.base import BaseCommand
from django.db.models import Q
from pgla.models import Project, Country
from pgla.helper_functions import getConfigurationFrom

class Command(BaseCommand):
    args = '<foo bar ...>'
    help = 'our help string comes here'
    country = Country.objects.get(name='MEXICO')
    hostnameRegex = "hostname "



    def handle(self, *args, **options):
        self.downloadBrasilConfigs()
