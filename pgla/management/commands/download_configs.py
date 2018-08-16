# -*- coding: utf-8 -*-
import re, os, io
from pgla.settings import CONFIG_PATH
from datetime import datetime
from django.core.management.base import BaseCommand
from django.db.models import Q
from pgla.models import Country
from pgla.helper_functions import get_config_from, returnBrasilList

class Command(BaseCommand):
    args = '<foo bar ...>'
    help = 'our help string comes here'
    root = CONFIG_PATH
    country = {
        "MEXICO": Country.objects.get(name='MEXICO'),
        "ESTADOS UNIDOS": Country.objects.get(name='ESTADOS UNIDOS'),
        "BRASIL": Country.objects.get(name='BRASIL'),
        "COLOMBIA": Country.objects.get(name='COLOMBIA'),
        "CHILE": Country.objects.get(name='CHILE'),
    }
    hostnameRegex = "hostname "

    def downloadMexicoConfigs(self):
        start = datetime.now()
        pe_list = get_config_from(self.country['MEXICO'], 'vpn-chi-catedral-44', command='show ip route ospf | inc /32', l=False)
        p = re.compile("(148|187|189|200|201)\.\d{1,3}\.\d{1,3}\.\d{1,3}\/32")

        for match_pe in p.finditer(pe_list):
            pe = match_pe.group()[:-3]
            print(pe)
            # if pe == '10.160.31.145' or pe == '172.22.115.108' or pe == '201.125.254.0' or pe == '201.125.255.0':
            #    continue

            config = get_config_from(self.country['MEXICO'], pe, l=False)
            if not type(config) == int and "juniper" in config:
                self.hostnameRegex = "host-name "
                config = get_config_from(self.country['MEXICO'], pe, command="show configuration", l=False)

            if not type(config) == int:
                if config.find('Command authorization failed') == -1 or len(config) > 500:
                    p1 = re.compile(self.hostnameRegex)
                    m = p1.search(config)
                    if m:
                        hostname = config[m.end():]
                        hostname = hostname.replace("-RE0;", "").replace("-RE1;", "").replace(";", "").replace("RE0;", "")
                        hostname = hostname[:hostname.find('\n')]
                    else:
                        continue
                    print(hostname)
                    path = os.path.join(self.root, self.country["MEXICO"].name)
                    if not os.path.exists(path):
                        os.makedirs(path)

                    with io.open(os.path.join(path, hostname) + '.txt', 'w', encoding="utf-8") as file:
                        print('Saved')
                        file.write(config)
                    print('Configuration downoloaded for ' + pe)
        end = datetime.now()
        totalMin = (end - start).total_seconds() / 60
        print(totalMin)

    def downloadUSAConfigs(self):
        start = datetime.now()
        pe_list = get_config_from(self.country['ESTADOS UNIDOS'], 'vpn-miami-americas-29', command='show ip route ospf | inc /32', l=False)
        p = re.compile("(148|187|189|200|201)\.\d{1,3}\.\d{1,3}\.\d{1,3}\/32")
        print(Country.objects.get(name='ESTADOS UNIDOS').lg)
        for match_pe in p.finditer(pe_list):
            pe = match_pe.group()[:-3]
            print(pe)
            # if pe == '10.160.31.145' or pe == '172.22.115.108' or pe == '201.125.254.0' or pe == '201.125.255.0':
            #    continue

            config = get_config_from(self.country['ESTADOS UNIDOS'], pe, l=False)
            if not type(config) == int and "juniper" in config:
                self.hostnameRegex = "host-name "
                config = get_config_from(self.country['ESTADOS UNIDOS'], pe, command="show configuration", l=False)

            if not type(config) == int:
                if config.find('Command authorization failed') == -1 or len(config) > 500:
                    p1 = re.compile(self.hostnameRegex)
                    m = p1.search(config)
                    if m:
                        hostname = config[m.end():]
                        hostname = hostname.replace("-RE0;", "")
                        hostname = hostname[:hostname.find('\n')]
                    else:
                        continue
                    print(hostname)
                    path = os.path.join(self.root, self.country["ESTADOS UNIDOS"].name)
                    if not os.path.exists(path):
                        os.makedirs(path)

                    with io.open(os.path.join(path, hostname) + '.txt', 'w', encoding="utf-8") as file:
                        print('Saved')
                        file.write(config)
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
            print('Downloading configs for ' + region)
            html = returnBrasilList('LATAM', region)

            p = re.compile("[A-Z]+[0-9]+.[A-Z]+")
            for match_pe in p.finditer(html):
                pe = match_pe.group()
                config = get_config_from(self.country["BRASIL"], pe, 'show running-config', l=False)
                if config:
                    with open(os.path.join(path, pe) + '.txt', 'w') as file:
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

        lp_list = get_config_from(self.country['COLOMBIA'], 'A9KSANDIEGO',
                                       command='show ip route ospf | inc /32',
                                       l=False)

        p = re.compile("\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\/32")

        for match_pe in p.finditer(lp_list):
            pe = match_pe.group()[:-3]
            print(pe)
            if pe in ['10.160.31.145', '10.160.31.146', '10.244.138.1', '35.200123', '10.10.63.34']:
                continue

            config = get_config_from(self.country['COLOMBIA'], pe,
                                          command='show configuration running-config', l=False)

            if isinstance(config, int):
                continue
            elif 'Invalid input detected' in config or 'Line has invalid autocommand' in config:
                config = get_config_from(self.country['COLOMBIA'], pe,
                                              command='show configuration', l=False)
            elif 'known_hosts' in config:
                print(pe + ' <=== update RSA Keys')
                continue

            if len(config) > 2000:
                print('saved')
                with io.open(os.path.join(path, pe) + '.txt', 'w', encoding="utf-8") as file:
                        file.write(config)

        end = datetime.now()
        totalMin = (end - start).total_seconds() / 60
        print(totalMin)

    def downloadChileConfigs(self):

        path = os.path.join(self.root, 'CHILE')
        if not os.path.exists(path):
            os.makedirs(path)

        start = datetime.now()

        pe_ips = ['172.31.128.51', '172.31.128.53', '172.31.128.52', '172.31.128.63', '172.31.128.42', '172.31.128.18',
                  '172.31.128.23', '172.31.128.22', '172.31.128.31', '172.31.128.3', '172.31.128.6', '172.31.128.11',
                  '172.31.128.10', '172.31.128.15', '172.31.128.13', '172.31.128.101', '172.31.128.81',
                  '172.31.128.91', '172.31.128.93', '172.31.128.72', '172.31.128.131', '172.32.128.102']

        for pe in pe_ips:
            print(pe)

            config = get_config_from(self.country['CHILE'], pe, command='show star', l=False)

            if isinstance(config, int):
                continue
            elif 'Invalid input detected' in config or 'Line has invalid autocommand' in config:
                config = get_config_from(self.country['CHILE'], pe,
                                         command='show configuration', l=False)
            elif 'known_hosts' in config:
                print(pe + ' <=== update RSA Keys')
                continue

            if len(config) > 2000:
                with io.open(os.path.join(path, pe) + '.txt', 'w', encoding="utf-8") as file:
                    file.write(config)

        end = datetime.now()
        totalMin = (end - start).total_seconds() / 60
        print(totalMin)

    def add_arguments(self, parser):
        parser.add_argument('country')

    def handle(self, *args, **options):
        if options['country'] == 'brasil':
            self.downloadBrasilConfigs()
        elif options['country'] == 'colombia':
            self.downloadColombiaConfigs()
        elif options['country'] == 'mexico':
            self.downloadMexicoConfigs()
        elif options['country'] == 'chile':
            self.downloadChileConfigs()
        elif options['country'] == 'usa':
            self.downloadUSAConfigs()
        else:
            print('country not supported')
