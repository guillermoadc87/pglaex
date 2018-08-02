# -*- coding: utf-8 -*-
import os, re, io, pickle
from django.conf import settings
from pgla.models import Hostname
from pgla.helper_functions import routerIOSFromConfig, regex_list
from django.core.management.base import BaseCommand

class Command(BaseCommand):
    args = '<foo bar ...>'
    help = 'our help string comes here'
    root = os.path.join('pgla', 'configs')

    def updateHostname(self, pe, pePath, country):
        if "txt" in pe:
            pe = pe.replace(".txt", "")
        hostname, created = Hostname.objects.get_or_create(name=pe)
        regex = regex_list.get(country, 0)
        if regex:
            file = io.open(pePath, 'r', encoding="ISO-8859-1")
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
        if settings.CONFIG_PATH:
            path = settings.CONFIG_PATH.split('/')
            Command.root = os.path.join(os.sep, *path)
        self._update_hostnames()