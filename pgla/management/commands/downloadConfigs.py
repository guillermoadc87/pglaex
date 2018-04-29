# -*- coding: utf-8 -*-
import re, os
from datetime import datetime
from django.core.management.base import BaseCommand
from django.db.models import Q
from pgla.models import Country
from pgla.helper_functions import getConfigurationFrom, returnBrasilList

class Command(BaseCommand):
    args = '<foo bar ...>'
    help = 'our help string comes here'
    root = os.path.join('pgla', 'Configurations')
    country = {
        "MEXICO": Country.objects.get(name='MEXICO'),
        "BRASIL": Country.objects.get(name='BRASIL'),
        "COLOMBIA": Country.objects.get(name='COLOMBIA'),
    }
    hostnameRegex = "hostname "

    def downloadMexicoConfigs(self):
        start = datetime.now()
        pe_list = getConfigurationFrom(self.country['MEXICO'], 'vpn-chi-catedral-44', command='show ip route ospf | inc /32', list=False)
        p = re.compile("(148|187|189|200|201)\.\d{1,3}\.\d{1,3}\.\d{1,3}\/32")

        for match_pe in p.finditer(pe_list):
            pe = match_pe.group()[:-3]
            print(pe)
            # if pe == '10.160.31.145' or pe == '172.22.115.108' or pe == '201.125.254.0' or pe == '201.125.255.0':
            #    continue

            config = getConfigurationFrom(self.country['MEXICO'], pe, list=False)
            if not type(config) == int and "juniper" in config:
                self.hostnameRegex = "host-name "
                config = getConfigurationFrom(self.country['MEXICO'], pe, command="show configuration", list=False)

            if not type(config) == int:
                if config.find('Command authorization failed') == -1 or len(config) > 500:
                    p1 = re.compile(self.hostnameRegex)
                    m = p1.search(config)
                    if m:
                        hostname = config[m.end():]
                        hostname = hostname.replace(";", "")
                        hostname = hostname[:hostname.find('\n')]
                    else:
                        continue
                    print(hostname)
                    path = os.path.join(self.root, self.country["MEXICO"].name)
                    if not os.path.exists(path):
                        os.makedirs(path)
                    with open(os.path.join(path, hostname), 'w') as file:
                        print('Saved')
                        file.write(config.encode('utf-8'))
                    print('Configuration downoloaded for ' + pe)
        end = datetime.now()
        totalMin = (end - start).total_seconds() / 60
        print(totalMin)

    def downloadBrasilConfigs(self):

        path = os.path.join(self.root, 'BRASIL')
        if not os.path.exists(path):
            os.makedirs(path)

        start = datetime.now()
        html = returnBrasilList('centros', 'latam')
        p = re.compile("[A-Z]+")

        for match_region in p.finditer(html):
            region = match_region.group()
            print('Downloading Configurations for ' + region)
            html = returnBrasilList('LATAM', region)

            p = re.compile("[A-Z]+[0-9]+.[A-Z]+")
            for match_pe in p.finditer(html):
                pe = match_pe.group()
                config = getConfigurationFrom(self.country["BRASIL"], pe, 'show running-config', list=False)
                if config:
                    with open(os.path.join(path, pe), 'w') as file:
                        file.write(config)
                    print(pe + "'s Configuration was Saved")
        end = datetime.now()

        totalMin = (end - start).total_seconds() / 60
        print(totalMin)

    def downloadColombiaConfigs(self):

        path = os.path.join(self.root, 'COLOMBIA')
        if not os.path.exists(path):
            os.makedirs(path)

        start = datetime.now()

        lp_list = getConfigurationFrom(self.country['COLOMBIA'], 'A9KSANDIEGO',
                                       command='show ip route ospf | inc /32',
                                       list=False)

        p = re.compile("\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\/32")

        for match_pe in p.finditer(lp_list):
            pe = match_pe.group()[:-3]
            print(pe)
            config = getConfigurationFrom(self.country['COLOMBIA'], pe,
                                          command='show configuration running-config', list=False)

            if 'Invalid input detected' in config:
                config = getConfigurationFrom(self.country['COLOMBIA'], pe,
                                              command='show configuration', list=False)
            elif 'known_hosts' in config:
                print(pe + ' <=== update RSA Keys')
                continue

            with open(os.path.join(path, pe), 'w') as file:
                    file.write(config)

        end = datetime.now()
        totalMin = (end - start).total_seconds() / 60
        print(totalMin)

    def handle(self, *args, **options):
        self.downloadColombiaConfigs()
