import cmd
import urllib
import requests

pk = '{{ pk }}'
os = '{{ os }}'
hostname = '{{ hostname }}'
vrf_list = {{ vrf_list }}

CONNECTION_PROBLEM = -1
INVALID_HOSTNAME = 0
INVALID_AUTH = 1
INVALID_COMMAND = 2

print_statement = {
    CONNECTION_PROBLEM: 'Connection Problem',
    INVALID_HOSTNAME: 'Invalid Hostname',
    INVALID_AUTH: 'Invalid Authentication',
    INVALID_COMMAND: 'Invalid Command'
}

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
        self.url = 'http://{{ server_ip }}:{{ port }}/pgla/exec_command'
        self.pk = pk
        self.prompt = "%s#" % hostname
        self.hostname = hostname
        self.show_commands = self.show_commands_ios if os == 'ios' else self.show_commands_xr
        self.vrf_list = vrf_list

    def do_show(self, line):
        """
        For Executing show Commands
        """
        command = urllib.parse.quote_plus("show " + line)
        self.exec_command(command)

    def do_ping(self, line):
        command = urllib.parse.quote_plus("ping "+ line)
        self.exec_command(command)

    def do_traceroute(self, line):
        command = urllib.parse.quote_plus("traceroute "+ line)
        self.exec_command(command)

    def completedefault(self, text, line, begidx, endidx):
        if line.split(" ")[-2] == "vrf":
            return [vrf for vrf in self.vrf_list if vrf.startswith(text)]

        offs = len(line) - len(text)
        return [s[offs:] for s in self.show_commands if s.startswith(line)]

    def do_exit(self, line):
        return True

    def exec_command(self, command):
        output = requests.get('%s/%s/%s' % (self.url, self.pk, command)).text

        if output.isdigit() and print_statement.get(int(output), 0):
            print(print_statement.get(int(output)))
        else:
            print(output)

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