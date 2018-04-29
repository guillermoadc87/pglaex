# -*- coding: utf-8 -*-
import re
from datetime import datetime
from django.core.management.base import BaseCommand
from pgla.helper_functions import getHTMLContentFromPGLA, getAddressSpeedInterfaceProfileFromPGLA, \
                                                getParticipansWithPGLA, fixLocalID, safe_list_get, imp_list, local_id_regex
from bs4 import BeautifulSoup
from bs4.element import Tag
import progressbar
from pgla.models import Client, Link, Country
from django.contrib.auth.models import User

google_api_key = 'AIzaSyDPeDvtjxlZmY7UaVyZepnlZ_oj2M9uccQAIzaSyDPeDvtjxlZmY7UaVyZepnlZ_oj2M9uccQAIzaSyDPeDvtjxlZmY7UaVyZepnlZ_oj2M9uccQ'

class Command(BaseCommand):
    args = '<foo bar ...>'
    help = 'our help string comes here'

    def _update_from_pgla(self, pgla=None):
        url = "http://10.192.5.53/portalGlobal/reportes/reporteEjCIAPDetalle.jsp?tipoReporte=1&estatusserv=ENPROCESO&tiposerv=&fechaInicioPen=&fechaFinPen=&fcambioestatus=&cliente=&nombreCAPL=&nombrePM=&nombreIMP=&nombreIS=&estatus="

        keys = [
            'number', 'client', 'client_segment', 'pm', 'imp', 'ise', 'capl', 'pgla', 'nsr', 'local_ids', 'service', 'carrier',
            'movement',
            'state', 'motive', 'country_a', 'country_b', 'duedate_ciap', 'duedate_acc', 'entraga_ciap',
            'loop-ready', 'recepcion_ciap', 'billing_date', 'cnr', 'ddf', 'daf', 'observation', 'duration',
            'duracion_contract',
        ]

        collection = []

        html = getHTMLContentFromPGLA(url)
        html = html[html.find(
            '<table width="100%" ID="reporte" border="0" cellpadding="1" cellspacing="1" class="bordeTabla">'):]
        soup = BeautifulSoup(html, 'html.parser')

        # nsr = re.compile(nsr)

        for table in soup.table.contents:
            for tbody in table:
                for tr in tbody:
                    td_count = 0
                    document = Link()
                    for td in tr:
                        if isinstance(td, Tag) and len(keys) > td_count:
                            if document.local_id:
                                try:
                                    if document.country:
                                        p = re.compile(local_id_regex.get(document.country, 0))
                                        m = p.search(document.local_id)
                                        document.local_id = m.group()
                                except:
                                    pass
                            elif keys[td_count] == 'country_a':
                                country, created = Country.objects.get_or_create(name=td.string)
                                if created:
                                    country.save()
                                document.country = country
                            elif keys[td_count] == 'pgla':
                                try:
                                    setattr(document, keys[td_count], int(td.string))
                                except ValueError:
                                    pass
                            elif keys[td_count] == 'client':
                                client, created = Client.objects.get_or_create(name=td.string)
                                if created:
                                    client.save()
                                document.client = client
                            elif keys[td_count] == 'cnr':
                                pass
                            elif keys[td_count] in ['billing_date', 'duedate_ciap', 'recepcion_ciap', 'entraga_ciap', 'duedate_acc']:
                                if td.string:
                                    #print(keys[td_count] + ": ", td_count, " "+td.string)
                                    date = datetime.strptime(td.string, '%d/%m/%Y')
                                    if keys[td_count] == 'billing_date':
                                        document.billing_date = date
                                    elif keys[td_count] == 'duedate_ciap':
                                        document.duedate_ciap = date
                                    elif keys[td_count] == 'recepcion_ciap':
                                        document.reception_ciap = date
                                    elif keys[td_count] == 'entraga_ciap':
                                        document.entraga_ciap = date
                                    elif keys[td_count] == 'duedate_acc':
                                        document.duedate_acc = date
                            elif keys[td_count] in ['pm', 'imp', 'is', 'capl']:
                                newString = ' '.join(td.string.split())
                                setattr(document, keys[td_count], newString)
                            else:
                                #print(keys[td_count], td.string)
                                setattr(document, keys[td_count], td.string)
                            #print(td_count, keys[td_count], keys[td_count] in ['billing_date', 'duedate_ciap', 'recepcion_ciap'])
                            td_count += 1

                    if document.imp in imp_list:
                        if pgla:
                            if document.nsr == pgla:
                                collection.append(document)
                                break
                        else:
                            if not re.search("-A[0-9]", document.nsr):
                                collection.append(document)

        for document in collection:
            asip = getAddressSpeedInterfaceProfileFromPGLA(str(document.pgla), document.nsr)
            #print(asip)
            if asip:
                document.site_name = asip.get('site_name')
                document.circuitID = asip.get('circuitID')
                document.address = asip.get('address')
                if asip.get('links'):
                    [setattr(document, key, value) for key, value in asip['links'][0].items()]

            print(document)
            document, created = document.saveMod()

            participants = getParticipansWithPGLA(str(document.pgla))

            if created:
                [document.participants.add(participant) for participant in participants]
                document.invite_users_to_slack()

    def handle(self, *args, **options):
        pgla = safe_list_get(args, 0, 0)
        if not pgla:
            self._update_from_pgla()
        else:
            self._update_from_pgla(pgla=pgla)
