import cmd
import requests

pk = '{{ pk }}'
os = '{{ os }}'
hostname = '{{ hostname }}'
vrf_list = {{ vrf_list }}

class TelmexGlass(cmd.Cmd):
    """Simple command processor example."""

    show_commands_ios = ['show version',
                         'show running-config',
                         'show running-config interface',
                         'show ip interface brief',
                         'show atm pvc',
                         'show interface',
                         'show interface description',
                         'show ip arp',
                         'show ip arp summary',
                         'show ip route',
                         'show ip route vrf',
                         'show ip bgp',
                         'show ip bgp vpnv4 vrf',
                         'show ip bgp neighbor',
                         'show ip ospf',
                         'show ip ospf interface',
                         'show ip ospf neighbor',
                         'show ip prefix-list',
                         'show ip vrf',
                         'show route-map',
                         'show access-list',
                         'ping',
                         'ping vrf',
                         'traceroute',
                         'traceroute vrf',
                         ]
    show_commands_xr = ['show version',
                        'show running-config',
                        'show running-config interface',
                        'show configuration',
                        'show configuration running-config',
                        'show ip interface brief',
                        'show arp',
                        'show route',
                        'show route vrf',
                        'show bgp',
                        'show bgp vrf',
                        'show vrf',
                        'show policy-map',
                        'ping',
                        'ping vrf',
                        'traceroute',
                        'traceroute vrf',
                        ]

    def __init__(self, pk, hostname, os, vrf_list=''):
        cmd.Cmd.__init__(self)
        self.url = 'http://127.0.0.1:8000/pgla/exec_command'
        self.pk = pk
        self.prompt = "%s#" % hostname
        self.hostname = hostname
        self.show_commands = self.show_commands_ios if os == 'ios' else self.show_commands_xr
        self.vrf_list = vrf_list

    def do_show(self, line):
        """
        For Executing show Commands
        """
        line = "show " + line
        r = requests.get('%s/%s/%s' % (self.url, self.pk, line.replace(" ", "_")))
        print(r.text)

    def do_ping(self, line):
        line = "ping "+ line
        r = requests.get('%s/%s/%s' % (self.url, self.pk, line.replace(" ", "_")))
        print(r.text)

    def do_traceroute(self, line):
        line = "traceroute "+ line
        r = requests.get('%s/%s/%s' % (self.url, self.pk, line.replace(" ", "_")))
        print(r.text)

    def completedefault(self, text, line, begidx, endidx):
        if line.split(" ")[-2] == "vrf":
            return [vrf for vrf in self.vrf_list if vrf.startswith(text)]

        offs = len(line) - len(text)
        return [s[offs:] for s in self.show_commands if s.startswith(line)]

    def do_exit(self, line):
        return True

    def cmdloop(self):
        try:
            cmd.Cmd.cmdloop(self)
        except KeyboardInterrupt as e:
            self.cmdloop()



if __name__ == '__main__':
    while True:

        if hostname == "exit":
            break

        telmexGlass = TelmexGlass(pk, hostname, os, vrf_list)
        telmexGlass.cmdloop()