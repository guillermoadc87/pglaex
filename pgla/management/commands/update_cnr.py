# -*- coding: utf-8 -*-
from datetime import datetime
from django.core.management.base import BaseCommand
from django.db.models import Q
import progressbar
from pgla.models import Link

class Command(BaseCommand):
    args = '<foo bar ...>'
    help = 'our help string comes here'

    def _update_cnr(self, nsr=None):
        bar = progressbar.ProgressBar()
        projects = Link.objects.all()
        [project.update_cnr() for project in bar(projects)]

    def handle(self, *args, **options):
        self._update_cnr()
