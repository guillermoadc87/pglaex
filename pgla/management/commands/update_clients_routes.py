# -*- coding: utf-8 -*-
import os
import re
from django.core.management.base import BaseCommand
from ciscoconfparse import CiscoConfParse
from pgla.helper_functions import generate_ip, get_config, is_xr, safe_list_get
from bs4 import BeautifulSoup
from bs4.element import Tag
import progressbar
from pgla.models import Client, Project, Country

class Command(BaseCommand):
    args = '<foo bar ...>'
    help = 'our help string comes here'
    root = os.path.join('pgla', 'configs')
    config_files_dirs = {
        'MEXICO': os.path.join(os.getcwd(), 'pgla', 'Configuration', 'MEXICO'),
        'BRASIL': os.path.join(os.getcwd(), 'pgla', 'Configuration', 'BRASIL'),
        'COLOMBIA': os.path.join(os.getcwd(), 'pgla', 'Configuration', 'COLOMBIA')
    }
    countriesWithAccess = ['MEXICO', 'BRASIL', 'COLOMBIA']

    def downloadRoustesForClient(self, client):
        #config_files_dir = self.config_files_dirs[country]
        data = {'BRASIL': [], 'MEXICO': []}
        countryDirList = os.listdir(self.root)
        for countryDir in countryDirList:
            countryDirPath = os.path.join(self.root, countryDir)
            peList = os.listdir(countryDirPath)
            print(countryDir)
            bar = progressbar.ProgressBar()
            for pe in bar(peList):
                pePath = os.path.join(countryDirPath, pe)
                with open(pePath) as pe_config:
                    if ".txt" in pe:
                        pe = pe.split(".txt")[0]
                    parse = CiscoConfParse(pe_config)
                    interfaces = parse.find_parents_w_child("^interface", client.get_vrf())

                    if interfaces:
                        for interface in interfaces:
                            wan = ''
                            inter_config = parse.find_all_children("^%s$" % interface)
                            inter_config_string = " ".join(inter_config)

                            if 'vrf' not in inter_config_string or 'address' not in inter_config_string:
                                continue
                            for line in inter_config:
                                line = line.split()
                                # print(line)
                                if 'vrf' in line:
                                    vrf = line[-1]
                                elif 'address' in line:
                                    if line[-2] != 'address':
                                        wan = line[-2]
                                    else:
                                        wan = line[-1][:-4]
                                    # print(data[f]['wan'], f)
                                    wan = generate_ip(wan)
                            if not wan:
                                continue

                            country = Country.objects.get(name=countryDir)

                            if is_xr(pe_config.read()):
                                routes = get_config(country, pe, "show bgp vrf " + vrf + " nei " + wan + " route", list=False)
                            else:
                                routes = get_config(country, pe, "show ip bgp vpnv4 vrf " + vrf + " nei " + wan + " route", list=False)
                            routes = re.findall("\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\/\d{1,2}", routes)

                            if not routes:
                                continue
                            [data[countryDir].append(route) for route in routes]
        client.routes = data
        client.save()
        print('Done')
        return data

    def _update_clients_routes(self, client):
        try:
            client = Client.objects.get(name=client)
        except Client.DoesNotExist:
            print('No client with that name')
            return


        data = self.downloadRoustesForClient(client)
        print('saving routes ', data)
        #client.routes['BRASIL'] = data
        #print(client.routes)
        #client.save()
        #print(client.routes)

    def handle(self, *args, **options):
        client = safe_list_get(args, 0, 0)
        if client:
            self._update_clients_routes(client)
        else:
            print('Specify client name')
