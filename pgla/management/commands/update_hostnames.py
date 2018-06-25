# -*- coding: utf-8 -*-
import os
import re
import io
import pickle
from pgla.models import Hostname
from pgla.helper_functions import routerIOSFromConfig
from django.core.management.base import BaseCommand

regexList = {
    'MEXICO': "(A|C|D|F|S)([B|T]\d{1}|\d{2})-\d{4}-\d{4}",
    'BRASIL': "(HORT|CSL|CEM|SBS|MBB|LDA|MGA|SJC|SOO|GNA|SGO|PAS|PGE|RPO|ULA|GRS|SPO|PAE|CAS|RJO|SJP|SDR|BPI|ITU|CTA|MNS|SOC|CBO|MCO|UPS|FLA|JBO|SRR|PSO|RCO|LNS|VGA|ABS|CSC|YCA|ETA|JVE|LNA|BRU|JAI|SPA|AMA|STB|NTL|MCL|CBM|NHO|PLT|BRE|LGS|GAMA|PTA|FSA|PTS|SBO|CE|FLA|PWM)\/(IP|MULTI|FAST)\/(\d{5})",
    'PERU': "\d{7}",
    'HONDURAS': "\d{6}",
    'GUATEMALA': "\d{8}",
    'CHILE': "\d{2}-\d{2}-\d{10}",
    'COLOMBIA': "\w{3}\d{4}",
    'EL SALVADOR': "IP\d{7}",
    'ESTADOS UNIDOS': 'ITFS\-\d{11}',
    'ARGENTINA': '\d{7}',
    'VENEZUELA': '',
    'ECUADOR': "",
    'AUSTRIA': "",
    'PARAGUAY': "",
    'NICARAGUA': "",
    'ESPAÑA': "",
    "URUGUAY": "",
    'BOLIVIA': "",
    'BERMUDAS': "",
    'CANADA': "",
    'TRINIDAD Y TOBAGO': "",
    'REPUBLICA DOMINICANA': "\d{3}-\d{3}-\d{4}",
    'COSTA RICA': "",
}

class Command(BaseCommand):
    args = '<foo bar ...>'
    help = 'our help string comes here'
    root = os.path.join('pgla', 'configs')

    def updateHostname(self, pe, pePath, country):
        if "txt" in pe:
            pe = pe.replace(".txt", "")
        hostname, created = Hostname.objects.get_or_create(name=pe)
        regex = regexList.get(country, 0)
        if regex:
            file = io.open(pePath, 'r', encoding="utf-8")
            config = file.read()
            p = re.compile(regex)
            hostname.local_ids = [local_id.group() for local_id in p.finditer(config)]
            hostname.os = routerIOSFromConfig(config)
            hostname.save()
            print('updated ', pe)

    def _get_pickle_dic(self, pickleFilePath):
        try:
            file = open(pickleFilePath, 'rb')
            pickleDic = pickle.load(file)
            file.close()
            return pickleDic
        except:
            with open(pickleFilePath, 'wb') as handle:
                emptyDic = {}
                pickle.dump(emptyDic, handle, protocol=pickle.HIGHEST_PROTOCOL)

            with open(pickleFilePath, 'rb') as handle:
                return pickle.load(handle)

    def _update_hostnames(self):
        countryDirList = os.listdir(self.root)
        for countryDir in countryDirList:
            countryDirPath = os.path.join(self.root, countryDir)
            peList = os.listdir(countryDirPath)

            modified = False
            pickleFilePath = os.path.join(os.getcwd(), countryDir + '.pickle')
            pickleDic = self._get_pickle_dic(pickleFilePath)

            for pe in peList:
                pePath = os.path.join(countryDirPath, pe)
                size = os.stat(pePath).st_size
                if not pickleDic.get(pe, 0) or pickleDic.get(pe, 0) != size:
                    if not modified:
                        modified = True
                    pickleDic[pe] = size
                    self.updateHostname(pe, pePath, countryDir)

            if modified:
                with open(pickleFilePath, 'wb') as handle:
                    pickle.dump(pickleDic, handle, protocol=pickle.HIGHEST_PROTOCOL)

    def handle(self, *args, **options):
        self._update_hostnames()