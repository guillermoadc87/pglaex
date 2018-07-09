# -*- coding: utf-8 -*-
import re
from datetime import datetime, timedelta
from django.core.management.base import BaseCommand
from pgla.helper_functions import getHTMLContentFromPGLA, getAddressSpeedInterfaceProfileFromPGLA, \
                                                getParticipansWithPGLA, fixLocalID, safe_list_get, imp_list, local_id_regex
from bs4 import BeautifulSoup
from pgla.models import Client, Link, Country, Movement

google_api_key = 'AIzaSyDPeDvtjxlZmY7UaVyZepnlZ_oj2M9uccQAIzaSyDPeDvtjxlZmY7UaVyZepnlZ_oj2M9uccQAIzaSyDPeDvtjxlZmY7UaVyZepnlZ_oj2M9uccQ'

class Command(BaseCommand):
    args = '<foo bar ...>'
    help = 'our help string comes here'

    def _update_from_pgla(self, delivered):
        from datetime import date
        if delivered:
            state = 'ENTREGADOS'
            start_date = (date.today() - timedelta(1)).strftime('%d/%m/%Y')
            end_date = date.today().strftime('%d/%m/%Y')
        else:
            state = ''
            start_date = ''
            end_date = ''

        #url = "http://10.192.5.53/portalGlobal/reportes/reporteEjCIAPDetalle.jsp?tipoReporte=1&estatusserv=&tiposerv=&fechaInicioPen=&fechaFinPen=&fcambioestatus=&cliente=&nombreCAPL=&nombrePM=&nombreIMP=&nombreIS=&estatus="
        url = "http://10.192.5.53/portalGlobal/reportes/reporteEjCIAPDetalle.jsp?tipoReporte=1&estatusserv=" + state + "&tiposerv=&fechaInicioPen=" + start_date + "&fechaFinPen=" + end_date + "&cliente=&nombreCAPL=&nombrePM=&nombreIMP=&nombreIS=&estatus="
        print(url)
        keys = [
            'number', 'client', 'client_segment', 'pm', 'imp', 'ise', 'capl', 'pgla', 'nsr', 'local_ids', 'service', 'tr', 'carrier', 'te',
            'movement',
            'state', 'motive', 'country_a', 'country_b', 'duedate_ciap', 'duedate_acc', 'entraga_ciap',
            'loop-ready', 'recepcion_ciap', 'billing_date', 'cnr', 'ddf', 'daf', 'observation', 'duration',
            'duracion_contract', 'nrc', 'mrc'
        ]

        collection = []

        html = getHTMLContentFromPGLA(url)

        soup = BeautifulSoup(html, 'html.parser')
        table = soup.find('table', attrs={"class": "bordeTabla", "id": "reporte"})
        table_body = table.find('tbody')
        rows = table_body.find_all('tr')

        for row in rows[2:]:
            td_count = 0
            document = Link()
            cols = row.find_all('td')
            cols = [ele.text.strip() for ele in cols]
            for ele in cols:
                if len(keys) > td_count:
                    if document.local_id:
                        try:
                            if document.country:
                                p = re.compile(local_id_regex.get(document.country, 0))
                                m = p.search(document.local_id)
                                document.local_id = m.group()
                        except:
                            pass
                    elif keys[td_count] == 'cnr':
                        pass
                    elif keys[td_count] == 'country_a':
                        country, created = Country.objects.get_or_create(name=ele)
                        if created:
                            country.save()
                        document.country = country
                    elif keys[td_count] == 'pgla':
                        try:
                            setattr(document, keys[td_count], int(ele))
                        except ValueError:
                            pass
                    elif keys[td_count] == 'client':
                        client, created = Client.objects.get_or_create(name=ele)
                        if created:
                            client.save()
                        document.client = client
                    elif keys[td_count] == 'movement':
                        movement, created = Movement.objects.get_or_create(name=ele)
                        if created:
                            movement.save()
                        document.movement = movement
                    elif keys[td_count] in ['billing_date', 'duedate_ciap', 'recepcion_ciap', 'entraga_ciap',
                                            'duedate_acc']:
                        if ele:
                            # print(keys[td_count] + ": ", td_count, " "+td.string)
                            date = datetime.strptime(ele, '%d/%m/%Y')
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
                        newString = ' '.join(ele.split())
                        setattr(document, keys[td_count], newString)
                    elif keys[td_count] in ['nrc', 'mrc']:
                        ele = ele.replace('\n', '').replace(',', '').replace('$', '').replace(' ', '')
                        setattr(document, keys[td_count], float(ele))
                    else:
                        # print(keys[td_count], td.string)
                        setattr(document, keys[td_count], ele)
                    # print(td_count, keys[td_count], keys[td_count] in ['billing_date', 'duedate_ciap', 'recepcion_ciap'])
                    td_count += 1

            if document.imp in imp_list:
                if not re.search("-Q[0-9]|-A[0-9]", document.nsr):
                    collection.append(document)

        for document in collection:
            print(document.pgla, document.nsr)
            asip = getAddressSpeedInterfaceProfileFromPGLA(str(document.pgla), document.nsr)
            #print(asip)
            if asip:
                document.site_name = asip.get('site_name')
                document.circuitID = asip.get('circuitID')
                document.address = asip.get('address')
                if asip.get('links'):
                    [setattr(document, key, value) for key, value in asip['links'][0].items()]

            document, created = document.saveMod()

            participants = getParticipansWithPGLA(str(document.pgla))

            if created:
                [document.participants.add(participant) for participant in participants]

    def add_arguments(self, parser):
        parser.add_argument('--delivered', dest='delivered', action='store_const', const=True)

    def handle(self, *args, **options):
        self._update_from_pgla(options['delivered'])
