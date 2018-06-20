import cmd
import time
import paramiko
import requests
from requests.auth import HTTPBasicAuth

CONNECTION_PROBLEM = -1
INVALID_HOSTNAME = 0
brasil_code_for_command = {'show': 'ISynu%7D', 'ping': 'ISvotm', 'traceroute': 'ISzxgi'}

def getToLastDevice(hostname, password, chan):
    chan.send('ssh' + ' ' + hostname + '\n')
    buff = ''
    while buff.find('login as: ') < 0 and buff.find('Username: ') < 0 and buff.find('password: ') < 0 and buff.find(
            '(yes/no)? ') < 0 and buff.rfind('Connection refused') < 0 and buff.rfind('Connection closed') < 0 \
            and buff.rfind('known_hosts') < 0:
        #print('looking for prompt')
        resp = chan.recv(9999)
        buff += str(resp, errors='ignore')
    if buff.find('Username: ') != -1:
        #print('is user')
        chan.send('' + '\n')
        while not buff.endswith('Password: '):
            #print('is password after user')
            resp = chan.recv(9999)
            buff += str(resp, errors='ignore')
        chan.send(password + '\n')
    elif buff.find('password: ') != -1:
        #print('is password')
        chan.send(password + '\n')
    elif buff.find('(yes/no)? ') != -1:
        #print('is encryp keys')
        chan.send("yes\n")
        while not buff.endswith('password: '):
            #print('is pass after encryp keys')
            resp = chan.recv(9999)
            buff += str(resp, errors='ignore')
        chan.send(password + '\n')
    elif buff.find('Connection refused') == -1:
        return False
    elif buff.find('Connection closed') == -1:
        return False
    elif buff.find('known_hosts') == -1:
        print('known_hosts')
        return False

    buff = ''
    while not buff.endswith('#') and buff.find('RP/0/RSP0/CPU0') == -1 and not buff.endswith('$'):
        resp = chan.recv(9999)
        buff += str(resp, errors='ignore')
    if buff.endswith('$'):
        return False

    return True

def getConfigurationFrom(country, hostname, command='show running-config', list=True):
    lg = country.lg
    config = ''
    if not lg:
        return 2
    if lg.protocol == 'url':
        if country.name == 'MEXICO':
            print('Mexico')
            values = {'ip': hostname, 'cmd': command, 'submit': 'Submit'}
            r = requests.post(lg.path, auth=(lg.username, lg.password),
                              data=values, timeout=2000)
            config = r.text
            p = re.compile("(Invalid)")
            if p.search(config):
                return 0

            config = re.sub("<font color='\#111111\'>", ' ', config, flags=re.IGNORECASE)
            config = re.sub("</font>", ' ', config, flags=re.IGNORECASE)
            config = re.sub("<td width='100'>", ' ', config, flags=re.IGNORECASE)
            config = re.sub("</td>", ' ', config, flags=re.IGNORECASE)
            config = re.sub("     ", "", config, flags=re.IGNORECASE)
            config = re.sub("&nbsp;", " ", config, flags=re.IGNORECASE)
            config = re.sub("<br>", "\n", config, flags=re.IGNORECASE)

        elif country.name == 'BRASIL':
            try:
                response = requests.post(lg.path + '&eqpto=' + hostname, auth=HTTPBasicAuth(lg.username, lg.password), timeout=2000)
            except requests.exceptions.ConnectionError as e:
                return 1  # No connection to Looking Glass

            html = response.text

            p = re.compile('&arg[0-2]\=[a-zA-Z0-9_%]*')

            args = []
            for match in p.finditer(html):
                arg = match.group()
                arg = arg[arg.find('=') + 1:]
                args.append(arg)

            command_code = brasil_code_for_command.get(command.split(' ')[0], '')
            command = command_code + command

            if len(args) == 3:
                url = 'http://10.243.187.170/grb/topologia_rede/www/executar_comandos_telnet_proxy.php?&arg0=' + args[
                    0] + '&arg1=' + args[1] + '&arg2=' + args[2] + '&id_rede=15&comando=' + command
                r = requests.post(url, auth=HTTPBasicAuth(lg.username, lg.password), timeout=2000)
                config = r.text
                config = config[config.find(r"\n") + 2:config.rfind(r"</pre>")]
                config = "\n".join(config.split(r"\n"))
            else:
                return 0

    elif lg.protocol == 'ssh':
        ssh = paramiko.SSHClient()
        ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())

        try:
            ssh.connect(lg.path, username=lg.username, password=lg.password, port=lg.port)
        except:
            return 1

        chan = ssh.invoke_shell()
        time.sleep(1)

        if lg.extras.get('password'):
            password = lg.extras.get('password')
            if getToLastDevice(hostname, password, chan):
                print('connected')
                chan.send('terminal length 0' + '\n')
                chan.send(command + '\n')

                buff = ''
                time.sleep(1)
                while not buff.endswith('#'):
                    resp = chan.recv(9999)
                    buff += str(resp, errors='ignore')
                print('config downloaded')
                config = buff
            else:
                print('Cant connect')
        else:
            print('Define the PE password in the LG object')

        ssh.close()

    return config.split("\n") if list else config

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

    def __init__(self, country, hostname, ios=True, vrf_list=''):
        cmd.Cmd.__init__(self)
        self.prompt = "%s#" % hostname
        self.country = country
        self.hostname = hostname
        self.show_commands = self.show_commands_ios if ios else self.show_commands_xr
        self.vrf_list = vrf_list

    def do_show(self, line):
        """
        For Executing show Commands
        """
        line = "show "+ line
        print(getConfigurationFrom(self.country, self.hostname, line, list=False))

    def do_ping(self, line):
        line = "ping "+ line
        print(getConfigurationFrom(self.country, self.hostname, line, list=False))

    def do_traceroute(self, line):
        line = "traceroute "+ line
        print(getConfigurationFrom(self.country, self.hostname, line, list=False))

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

hostname = '[HOSTNAME]'

class LookingGlass(object):
    path = '[PATH]'
    username = '[USERNAME]'
    password = '[PASSWORD]'
    protocol = '[PROTOCOL]'
    port = [PORT]

class Country(object):
    name = '[COUNTRY]'
    lg = LookingGlass


country = Country()

if __name__ == '__main__':
    while True:


        if hostname == "exit":
            break

        config = getConfigurationFrom(country, hostname, "show version | incl Version", list=False)

        if config == CONNECTION_PROBLEM:
            print("You are not connected to the VPN")
            print("Please connect to the VPN and try again")
        elif config == INVALID_HOSTNAME:
            print("The hostname you entered is not valid")
            print("Please verify the hostname and try again")
        else:
            import re
            from ciscoconfparse import CiscoConfParse
            vrf_list = ()
            p = re.compile("(IOS XR)")
            if p.search(config):
                ios = False
                config = getConfigurationFrom(hostname, "show running-config")
                parser = CiscoConfParse(config)
                for line in parser.find_parents_w_child("^vrf", "address-family"):
                    vrf = line.split(" ")[-1]
                    vrf_list = vrf_list + (vrf,)
                print("IOS XR")
            else:
                ios = True
                config = getConfigurationFrom(hostname, "show running-config")
                parser = CiscoConfParse(config)
                for line in parser.find_parents_w_child("^ip vrf", "rd"):
                    vrf = line.split(" ")[-1]
                    vrf_list = vrf_list + (vrf,)
                print("IOS")
            telmexGlass = TelmexGlass(country, hostname, ios, vrf_list)
            telmexGlass.cmdloop()