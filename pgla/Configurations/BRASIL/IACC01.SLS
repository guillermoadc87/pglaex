Building configuration...

Current configuration : 486722 bytes
!
! Last configuration change at 12:36:04 BRA Wed Mar 14 2018
! NVRAM config last updated at 12:36:14 BRA Wed Mar 14 2018 by saip
!
version 15.1
service nagle
no service pad
service tcp-keepalives-in
service tcp-keepalives-out
service timestamps debug datetime msec localtime
service timestamps log datetime msec localtime
service password-encryption
service internal
service sequence-numbers
no service dhcp
no platform punt-keepalive disable-kernel-core
platform shell
!
hostname iacc01.sls
!
boot-start-marker
boot system bootflash:asr1000rp2-advipservicesk9.03.03.02.S.151-2.S2.bin
boot config harddisk:conf_iacc01
boot-end-marker
!
!
vrf definition L2L_INTERURBANO:6489
 rd 4230:6489
 route-target export 4230:6489
 route-target import 4230:6489
 !
 address-family ipv4
 exit-address-family
!
vrf definition Mgmt-intf
 !
 address-family ipv4
 exit-address-family
 !
 address-family ipv6
 exit-address-family
!
logging count
enable secret 5 $1$zopI$ICCYSVRP1GO2gR8gbubkC/
!
spd extended-headroom 1000
aaa new-model
!
!
aaa authentication password-prompt Password:
aaa authentication username-prompt Login:
aaa authentication login admin local
aaa authentication login NOC group tacacs+ local
aaa authorization config-commands
aaa authorization exec default group tacacs+ local 
aaa authorization commands 1 default group tacacs+ local 
aaa authorization commands 6 default group tacacs+ local 
aaa authorization commands 15 default group tacacs+ local 
aaa accounting exec default start-stop group tacacs+
aaa accounting commands 1 default start-stop group tacacs+
aaa accounting commands 6 default start-stop group tacacs+
aaa accounting commands 15 default start-stop group tacacs+
!
!
!
!
!
aaa session-id common
clock timezone BRA -3 0
clock summer-time BRAVER recurring 3 Sun Oct 0:00 3 Sun Feb 0:00
!
flow exporter FNF_EXPORT_MAP
 description PKFCP02.RJO 
 destination 200.244.163.250
 source Loopback7
 transport udp 23213
 template data timeout 30
!
!
flow monitor IPV4_MONITOR_MAP
 description IPv4 input NetFlow with ASs
 record netflow ipv4 original-input
 exporter FNF_EXPORT_MAP
 cache timeout active 1
 cache entries 200000
!
!
flow monitor IPV6_MONITOR_MAP
 description IPv6 input NetFlow with ASs
 record netflow ipv6 original-input
 exporter FNF_EXPORT_MAP
 cache timeout active 1
 cache entries 200000
!
no ip source-route
no ip gratuitous-arps
ip icmp rate-limit unreachable 1000
ip icmp rate-limit unreachable DF 1000
ip spd mode aggressive
ip spd queue max-threshold 1499
ip spd queue min-threshold 1498
!
ip vrf AGU_MPLS:6691
 rd 4230:6691
 route-target export 4230:6691
 route-target export 4230:5155
 route-target import 4230:6691
 route-target import 4230:1337
!
ip vrf AMAGGI:2738
 rd 4230:2738
 route-target export 4230:2738
 route-target export 28513:50576
 route-target export 4230:5155
 route-target import 4230:2738
 route-target import 28513:50576
 route-target import 4230:1337
!
ip vrf ARMATEUS:3394
 rd 4230:3394
 route-target export 4230:3394
 route-target export 4230:3108
 route-target import 4230:3394
 route-target import 4230:3107
 route-target import 4230:1337
!
ip vrf BANCO_CSFSA:7512
 rd 4230:7512
 route-target export 4230:7512
 route-target import 4230:7512
!
ip vrf BBRASIL_NAC:7399
 rd 4230:7399
 mdt default 239.232.0.88
 mdt data 239.232.89.0 0.0.0.255 threshold 1
 mdt log-reuse
 route-target export 4230:7399
 route-target export 4230:7546
 route-target import 4230:7399
 route-target import 4230:7545
!
ip vrf BCOAM:4783
 rd 4230:4783
 route-target export 4230:4783
 route-target import 4230:4783
!
ip vrf BNB:5075
 rd 4230:5075
 route-target export 4230:5075
 route-target export 4230:5155
 route-target import 4230:5075
 route-target import 4230:1337
!
ip vrf BOTICARIO2:3247
 rd 4230:3247
 mdt default 239.232.0.7
 mdt data 239.232.8.0 0.0.0.255 threshold 1
 mdt log-reuse
 route-target export 4230:3247
 route-target export 4230:3108
 route-target import 4230:3247
 route-target import 4230:3107
!
ip vrf BT_CBB:1851
 rd 4230:1851
 route-target export 4230:1851
 route-target import 4230:1851
!
ip vrf CEMAR:3468
 rd 4230:3468
 route-target export 4230:3468
 route-target import 4230:3468
!
ip vrf CENTRAL_UNIMED:6268
 rd 4230:6268
 route-target export 4230:6268
 route-target import 4230:6268
!
ip vrf CGU_NOVA:5325
 rd 4230:5325
 mdt default 239.232.0.25
 mdt data 239.232.49.0 0.0.0.255 threshold 1
 mdt log-reuse
 route-target export 4230:5325
 route-target import 4230:5325
!
ip vrf CIMAR:6974
 rd 4230:6974
 route-target export 4230:6974
 route-target import 4230:6974
!
ip vrf CONAB:4162
 rd 4230:4162
 route-target export 4230:4162
 route-target import 4230:4162
!
ip vrf CORREIOS_2016:155714
 rd 4230:155714
 route-target export 4230:7440
 route-target export 4230:1007
 route-target import 4230:7440
!
ip vrf CPAD:155471
 rd 4230:155471
 route-target export 4230:5928
 route-target import 4230:5928
!
ip vrf CREDISHOP:1661
 rd 4230:1661
 route-target export 4230:1661
 route-target import 4230:1661
 route-target import 4230:1337
!
ip vrf CREFISA:5415
 rd 4230:5415
 route-target export 4230:5415
 route-target export 4230:5155
 route-target import 4230:5415
 route-target import 4230:1337
!
ip vrf DALCAR:5317
 rd 4230:5317
 route-target export 4230:5317
 route-target import 4230:5317
!
ip vrf DNPM:3963
 rd 4230:3963
 export map DNPM_EXPORT_MAP
 route-target export 4230:3963
 route-target import 4230:3963
 route-target import 4230:153482
 route-target import 4230:153535
!
ip vrf DPF_MPLS:155223
 rd 4230:155223
 route-target export 4230:6606
 route-target import 4230:6606
!
ip vrf DPRF_NAC_REMOTO:4295
 rd 4230:4295
 export map DPRF-MAP
 route-target export 4230:4295
 route-target export 1024:1001001
 route-target export 4230:5155
 route-target import 4230:4295
 route-target import 4230:4294
 route-target import 1024:1001323
 route-target import 4230:1337
!
ip vrf EBC_MIDIA:6915
 rd 4230:6915
 route-target export 4230:6915
 route-target import 4230:6915
!
ip vrf EBC_MPLS1:155268
 rd 4230:155268
 route-target export 4230:6806
 route-target import 4230:6806
!
ip vrf EBT_BBR:6286
 rd 4230:6286
 route-target export 4230:6286
 route-target import 4230:6286
!
ip vrf ELEVADORESATLAS:7186
 rd 4230:7186
 route-target export 4230:7186
 route-target import 4230:7186
!
ip vrf ENEVA:6831
 rd 4230:6831
 route-target export 4230:6831
 route-target import 4230:6831
!
ip vrf FOZDOBR:5275
 rd 4230:5275
 route-target export 4230:5275
 route-target import 4230:5275
!
ip vrf GEAP:6919
 rd 4230:6919
 route-target export 4230:6919
 route-target import 4230:6919
!
ip vrf GERDAU_INT:151563
 rd 4230:151563
 route-target export 4230:3096
 route-target export 28513:50072
 route-target import 4230:3096
 route-target import 28513:50072
!
ip vrf GERL3_EBT_CLARO_SPOKE:155596
 rd 4230:155596
 route-target export 4230:7282
 route-target import 4230:7281
!
ip vrf IMIFARMA_EXTRANET:155458
 rd 4230:155458
 import map IMP_SERMA
 route-target export 4230:155458
 route-target export 4230:1663
 route-target export 4230:5155
 route-target import 4230:155458
 route-target import 4230:1663
 route-target import 4230:1337
!
ip vrf INFOSUS:4968
 rd 4230:4968
 route-target export 4230:4968
 route-target import 4230:4968
!
ip vrf ITAUNIBANCO:6388
 rd 4230:6388
 route-target export 4230:6388
 route-target export 4230:3108
 route-target export 4230:5155
 route-target import 4230:6388
 route-target import 4230:3107
 route-target import 4230:1337
!
ip vrf LASA_NOVA:155000
 rd 4230:155000
 route-target export 4230:6236
 route-target export 4230:3108
 route-target export 4230:5110
 route-target import 4230:6236
 route-target import 4230:3107
 route-target import 4230:5109
!
ip vrf LOCALIZA:1291
 rd 4230:1291
 route-target export 4230:1291
 route-target import 4230:1291
!
ip vrf LOJASRIACHUELO:4120
 rd 4230:4120
 route-target export 4230:4120
 route-target import 4230:4120
!
ip vrf MAKRO:7547
 rd 4230:7547
 route-target export 4230:7547
 route-target import 4230:7547
!
ip vrf MAXMIX:6352
 rd 4230:6352
 route-target export 4230:6352
 route-target export 4230:3108
 route-target import 4230:6352
 route-target import 4230:3107
!
ip vrf MPF_NOVA:6114
 rd 4230:6114
 mdt default 239.232.0.233
 mdt data 239.232.234.0 0.0.0.255 threshold 1
 mdt log-reuse
 route-target export 4230:6114
 route-target export 4230:6107
 route-target import 4230:6114
 route-target import 4230:6108
!
ip vrf NACIONALGAS:3635
 rd 4230:3635
 route-target export 4230:3635
 route-target import 4230:3635
!
ip vrf NACSAUDE:4530
 rd 4230:4530
 route-target export 4230:4530
 route-target export 4230:3108
 route-target import 4230:4530
 route-target import 4230:3107
!
ip vrf NORTEL:2634
 rd 4230:2634
 route-target export 4230:2634
 route-target import 4230:2634
!
ip vrf POSTAL_SAUDE:7110
 rd 4230:7110
 route-target export 4230:7110
 route-target export 4230:5155
 route-target import 4230:7110
 route-target import 4230:1337
!
ip vrf RABO:7410
 rd 4230:7410
 route-target export 4230:7410
 route-target export 4230:5155
 route-target import 4230:7410
 route-target import 4230:1337
!
ip vrf REALIP_CLIENTE:5581
 rd 4230:5581
 route-target export 4230:5581
 route-target export 4230:5155
 route-target import 4230:5580
 route-target import 4230:1337
!
ip vrf REDEVIP_BLD_MLPPP:3799
 rd 4230:3799
 route-target export 4230:3108
 route-target import 4230:3107
!
ip vrf RVTECNOLOGIA:6851
 rd 4230:6851
 route-target export 4230:6851
 route-target import 4230:6851
!
ip vrf SABEMI:4503
 rd 4230:4503
 route-target export 4230:4503
 route-target import 4230:4503
!
ip vrf SAGA_BRASIL:7340
 rd 4230:7340
 route-target export 4230:7340
 route-target import 4230:7340
!
ip vrf SCHIN:1097
 rd 4230:1097
 route-target export 4230:1097
 route-target import 4230:1097
!
ip vrf SEBRAEMA:4302
 rd 4230:4302
 route-target export 4230:4302
 route-target export 4230:3108
 route-target export 4230:5155
 route-target import 4230:4302
 route-target import 4230:3107
 route-target import 4230:1337
!
ip vrf SERPRO_SLS_DNIT_01:5893
 rd 4230:5893
 route-target export 4230:5893
 route-target import 4230:5893
!
ip vrf SERPRO_SLS_RFB_03:5904
 rd 4230:5904
 mdt default 239.232.0.126
 mdt data 239.232.127.0 0.0.0.255 threshold 1
 mdt log-reuse
 route-target export 4230:5904
 route-target import 4230:5904
!
ip vrf SERPRO_SLS_RFB_10:5909
 rd 4230:5909
 mdt default 239.232.0.129
 mdt data 239.232.130.0 0.0.0.255 threshold 1
 mdt log-reuse
 route-target export 4230:5909
 route-target import 4230:5909
!
ip vrf SESC:1916
 rd 4230:1916
 mdt default 239.232.0.3
 mdt data 239.232.4.0 0.0.0.255 threshold 1
 mdt log-reuse
 route-target export 4230:1916
 route-target import 4230:1916
!
ip vrf TCU:1628
 rd 4230:1628
 mdt default 239.232.0.1
 mdt data 239.232.2.0 0.0.0.255 threshold 1
 mdt log-reuse
 route-target export 4230:1628
 route-target import 4230:1628
!
ip vrf TENDTUDO:1965
 rd 4230:1965
 route-target export 4230:1965
 route-target import 4230:1965
!
ip vrf TRF1_FM:3152
 rd 4230:3152
 route-target export 4230:3152
 route-target export 4230:5155
 route-target import 4230:3152
 route-target import 4230:1337
!
ip vrf TSE_SPOKE:154234
 rd 4230:154234
 route-target export 4230:4912
 route-target import 4230:4911
!
ip vrf VOTORANTIM:4561
 rd 4230:4561
 route-target export 4230:4561
 route-target import 4230:4561
!
ip vrf WALMART:3141
 rd 4230:3141
 route-target export 4230:3141
 route-target import 4230:3141
!
ip vrf forwarding
!
!
!
!
!
!
!
no ip bootp server
ip domain list embratel.net.br.
ip domain list .
ip domain name embratel.net.br
ip host srv29.embratel.net.br 200.255.125.60
ip host srv06.embratel.net.br 200.255.125.56
ip host wks21.rjo.embratel.net.br 200.255.253.250
ip host wks19.rjo.embratel.net.br 200.255.125.219
ip host wks09.rjo.embratel.net.br 200.255.253.249
ip host srv04.embratel.net.br 200.255.125.45
ip host srv41.embratel.net.br 200.255.125.33
ip name-server 200.255.255.73
ip name-server 200.255.255.65
ip multicast-routing distributed
ip multicast-routing vrf TCU:1628 distributed
ip multicast-routing vrf MPF_NOVA:6114 distributed
ip multicast-routing vrf CGU_NOVA:5325 distributed
ip multicast-routing vrf BBRASIL_NAC:7399 distributed
ip multicast-routing vrf BOTICARIO2:3247 distributed
ip multicast-routing vrf SERPRO_SLS_RFB_03:5904 distributed
ip multicast-routing vrf SERPRO_SLS_RFB_10:5909 distributed
ip multicast-routing vrf SESC:1916 distributed
ip multicast route-limit 100000
ip dhcp bootp ignore
!
!
no ipv6 source-route
ipv6 unicast-routing
!
!
!
no mpls ip propagate-ttl forwarded
mpls ldp igp sync holddown 30000
mpls ldp label
 allocate global host-routes
mpls traffic-eng tunnels
mpls label protocol ldp
!
sampler FNF_SAMPLER_MAP
 mode random 1 out-of 1000
!
multilink bundle-name authenticated
!
!
!
!
!
!
!
!
!
memory free low-watermark processor 80
!
username cong privilege 15 secret 5 $1$l2oY$Wb.fhTSK3r.rxO0GuPEQT.
!
redundancy
 notification-timer 30000
 mode sso
bfd slow-timers 3000
!
!
!
ip rcmd rcp-enable
ip rcmd rsh-enable
ip rcmd remote-host root 200.255.253.250 root enable
ip rcmd remote-host web 200.255.125.219 web enable
ip rcmd remote-host root 200.255.125.219 root enable
ip rcmd remote-host cricket 200.255.125.45 cricket enable
ip rcmd remote-host ativweb 200.255.125.56 ativweb enable
ip rcmd remote-host root 200.255.253.245 root enable
ip rcmd remote-host root 200.255.253.249 root enable
ip rcmd remote-host seg 200.255.125.33 seg enable
ip rcmd remote-host ativweb 200.255.125.60 ativweb enable
ip rcmd remote-host cpm 200.255.253.250 cpm enable
ip ftp source-interface Loopback0
ip tcp window-size 65535
ip tcp path-mtu-discovery age-timer 10
ip telnet source-interface Loopback0
ip tftp source-interface Loopback0
ip ssh time-out 60
ip ssh authentication-retries 5
ip ssh source-interface Loopback0
ip ssh version 2
ip scp server enable
!
class-map match-any MISSAO_CRITICA_NAC
 match ip dscp cs4  af41  af43 
class-map match-all NETWORK_CONTROL_CORREIOS
 match ip dscp cs2  cs6  cs7 
class-map match-all BUSINESS
 match ip dscp cs3  af31  af32  af33 
class-map match-all Video_SERPRO
 match ip dscp af41 
class-map match-all Bulk_Q6
 match ip dscp cs1  af11  af12  af13  cs4 
class-map match-any STANDARD_NAC
 match ip dscp default 
class-map match-any GERENCIAMENTO_CORREIOS
 match ip dscp cs3  af31  af32  af33 
class-map match-all REALTIME
 match ip dscp cs5  ef 
class-map match-any REAL_TIME_VOZ_CORREIOS
 match ip dscp cs5  ef 
class-map match-any MISSAO_CRITICA
 match ip dscp cs4  af42  af43 
class-map match-any SUPORTE_AO_NEGOCIO
 match ip dscp cs2  af21  af23 
class-map match-any REAL_TIME_CORREIOS
 match ip dscp cs4  cs5  ef 
class-map match-all Voz_SERPRO
 match ip dscp cs5  ef 
class-map match-any TEMPO_REAL_NAC
 match ip dscp cs5  ef 
class-map match-all Interativa_Q6
 match ip dscp af21  af22  af23 
class-map match-any TEMPO_REAL_VOZ
 match ip dscp cs5  ef 
class-map match-all NetworkControl_Q6
 match ip dscp cs2  cs6  cs7 
class-map match-all VozVideo_Q6
 match ip dscp af41  cs5  ef 
class-map match-all CoPP-BACKBONE-management
 match access-group name CoPP-BACKBONE-management
class-map match-all CoPP-Normal
 match access-group name CoPP-Normal
class-map match-all BestEffort_Q6
 match ip dscp default 
class-map match-all CoPP-Special-ipv4
 match access-group name CoPP-Special-ipv4
class-map match-all MissaoCritica_SERPRO
 match ip dscp af11  af31  af32  af33 
class-map match-any nni-H2
 match mpls experimental topmost 4 
class-map match-all CoPP-Special
 match access-group name CoPP-Special
class-map match-all CoPP-Arp
 match protocol arp
class-map match-all VozVideo_SERPRO
 match ip dscp af41  cs5  ef 
class-map match-any TEMPO_REAL_VC
 match ip dscp af41 
class-map match-any GERENCIAMENTO
 match ip dscp cs3  af31  af32 
class-map match-all NetworkControl_SERPRO
 match ip dscp cs2  cs6  cs7 
class-map match-any MISSAO_CRITICA_CORREIOS
 match ip dscp af41  af42  af43 
class-map match-all BEST_EFFORT
 match ip dscp default 
class-map match-all MissaoCritica_Q6
 match ip dscp cs3  af31  af32  af33 
class-map match-any NETWORK_CONTROL_NAC
 match ip dscp cs6 
class-map match-any NAO_CRITICO
 match ip dscp cs1  af11  af13 
class-map match-all CoPP-Undesirable
 match access-group name CoPP-Undesirable
class-map match-all BestEffort_SERPRO
 match ip dscp default  af13 
class-map match-all CoPP-BACKBONE-routing
 match access-group name CoPP-BACKBONE-routing
class-map match-any GERENCIAMENTO_NAC
 match ip dscp cs3  af31  af33 
class-map match-all CoPP-Catch-all-ipv4
 match access-group name CoPP-Catch-all-ipv4
class-map match-all CoPP-SUSPECT-management
 match access-group name CoPP-SUSPECT-management
class-map match-all CoPP-ToS
 match ip precedence 6  7 
class-map match-all Video_Q6
 match ip dscp af41 
class-map match-all CoPP-PE-CE-routing
 match access-group name CoPP-PE-CE-routing
class-map match-all Interativa_SERPRO
 match ip dscp af12  af21  af22  af23 
class-map match-all Voz_Q6
 match ip dscp cs5  ef 
!
policy-map QPI_BBONE_N_40000_V1
 class class-default
  police 40000000 conform-action set-mpls-exp-imposition-transmit 0 exceed-action drop 
policy-map QPO_2048K_41_0_35_0_0_2_21
 class Voz_Q6
  priority level 1
  police cir percent 41 conform-action transmit  exceed-action drop 
 class MissaoCritica_Q6
  bandwidth percent 35 
  random-detect dscp-based
  random-detect dscp 24 32 48 1
  random-detect dscp 26 32 48 1
  random-detect dscp 28 32 48 1
  random-detect dscp 30 32 48 1
  queue-limit 96 packets
 class NetworkControl_Q6
  bandwidth percent 2 
  queue-limit 26 packets
 class class-default
  bandwidth percent 21 
  random-detect dscp-based
  random-detect dscp 0 24 40 1
  queue-limit 80 packets
policy-map QDO_2048K_41_0_35_0_0_2_21
 class class-default
  shape average 2048000
  service-policy QPO_2048K_41_0_35_0_0_2_21
policy-map QPO_1024K_13_0_16_48_16_2_4
 class Voz_Q6
  priority level 1
  police cir percent 13 conform-action transmit  exceed-action drop 
 class MissaoCritica_Q6
  bandwidth percent 16 
  random-detect dscp-based
  random-detect dscp 24 12 20 1
  random-detect dscp 26 12 20 1
  random-detect dscp 28 12 20 1
  random-detect dscp 30 12 20 1
  queue-limit 40 packets
 class Interativa_Q6
  bandwidth percent 48 
  random-detect dscp-based
  random-detect dscp 18 24 40 1
  random-detect dscp 20 24 40 1
  random-detect dscp 22 24 40 1
  queue-limit 80 packets
 class Bulk_Q6
  bandwidth percent 16 
  random-detect dscp-based
  random-detect dscp 8 12 20 1
  random-detect dscp 10 12 20 1
  random-detect dscp 12 12 20 1
  random-detect dscp 14 12 20 1
  random-detect dscp 32 12 20 1
  queue-limit 40 packets
 class NetworkControl_Q6
  bandwidth percent 2 
  queue-limit 18 packets
 class class-default
  bandwidth percent 4 
  random-detect dscp-based
  random-detect dscp 0 5 13 1
  queue-limit 26 packets
policy-map QPI_Correios_256K_ARPA_IOS_D_V1
 class REAL_TIME_CORREIOS
  police cir percent 6 conform-action transmit  exceed-action drop 
 class MISSAO_CRITICA_CORREIOS
  police cir percent 40 conform-action transmit  exceed-action set-dscp-transmit af41
 class GERENCIAMENTO_CORREIOS
  police cir percent 9 conform-action transmit  exceed-action set-dscp-transmit af31
 class NETWORK_CONTROL_CORREIOS
  police cir percent 4 conform-action transmit  exceed-action set-dscp-transmit cs6
 class BEST_EFFORT
  police cir percent 40 conform-action transmit  exceed-action set-dscp-transmit default
policy-map QDI_Correios_256K_ARPA_IOS_D_V1
 class class-default
  police cir 256000 conform-action transmit  exceed-action drop 
  service-policy QPI_Correios_256K_ARPA_IOS_D_V1
policy-map QPI_10000K_3_N_0_0_0_0_2_94
 class Voz_Q6
  police cir percent 3 conform-action transmit  exceed-action drop 
 class class-default
  set mpls experimental topmost 0
policy-map QDI_10000K_3_0_0_0_0_2_94
 class class-default
  police rate 10000000  conform-action transmit  exceed-action drop 
  service-policy QPI_10000K_3_N_0_0_0_0_2_94
policy-map QPO_16000K_40_0_35_0_0_1_21
 class Voz_Q6
  priority level 1
  police cir percent 40 conform-action transmit  exceed-action drop 
 class MissaoCritica_Q6
  bandwidth percent 35 
  random-detect dscp-based
  random-detect dscp 24 224 480 1
  random-detect dscp 26 224 480 1
  random-detect dscp 28 224 480 1
  random-detect dscp 30 224 480 1
  queue-limit 960 packets
 class NetworkControl_Q6
  bandwidth percent 1 
  queue-limit 60 packets
 class class-default
  bandwidth percent 21 
  random-detect dscp-based
  random-detect dscp 0 112 240 1
  queue-limit 480 packets
policy-map QDO_16000K_40_0_35_0_0_1_21
 class class-default
  shape average 16000000
  service-policy QPO_16000K_40_0_35_0_0_1_21
policy-map QPO_VIPSIP_VOZ_800_V1
 class Voz_Q6
  priority
  police rate 736000  conform-action transmit  exceed-action drop 
 class NetworkControl_Q6
  bandwidth 64
  queue-limit 32 packets
policy-map QPO_2048K_8_0_59_17_0_2_13
 class Voz_Q6
  priority level 1
  police cir percent 8 conform-action transmit  exceed-action drop 
 class MissaoCritica_Q6
  bandwidth percent 59 
  random-detect dscp-based
  random-detect dscp 24 56 120 1
  random-detect dscp 26 56 120 1
  random-detect dscp 28 56 120 1
  random-detect dscp 30 56 120 1
  queue-limit 240 packets
 class Interativa_Q6
  bandwidth percent 17 
  random-detect dscp-based
  random-detect dscp 18 14 30 1
  random-detect dscp 20 14 30 1
  random-detect dscp 22 14 30 1
  queue-limit 60 packets
 class NetworkControl_Q6
  bandwidth percent 2 
  queue-limit 26 packets
 class class-default
  bandwidth percent 13 
  random-detect dscp-based
  random-detect dscp 0 14 30 1
  queue-limit 60 packets
policy-map QPO_2048K_5_0_6_50_16_2_20
 class Voz_Q6
  priority level 1
  police cir percent 5 conform-action transmit  exceed-action drop 
 class MissaoCritica_Q6
  bandwidth percent 6 
  random-detect dscp-based
  random-detect dscp 24 7 15 1
  random-detect dscp 26 7 15 1
  random-detect dscp 28 7 15 1
  random-detect dscp 30 7 15 1
  queue-limit 30 packets
 class Interativa_Q6
  bandwidth percent 50 
  random-detect dscp-based
  random-detect dscp 18 56 120 1
  random-detect dscp 20 56 120 1
  random-detect dscp 22 56 120 1
  queue-limit 240 packets
 class Bulk_Q6
  bandwidth percent 16 
  random-detect dscp-based
  random-detect dscp 8 14 30 1
  random-detect dscp 10 14 30 1
  random-detect dscp 12 14 30 1
  random-detect dscp 14 14 30 1
  random-detect dscp 32 14 30 1
  queue-limit 60 packets
 class NetworkControl_Q6
  bandwidth percent 2 
  queue-limit 26 packets
 class class-default
  bandwidth percent 20 
  random-detect dscp-based
  random-detect dscp 0 24 40 1
  queue-limit 80 packets
policy-map QDO_2048K_5_0_6_50_16_2_20
 class class-default
  shape average 2048000
  service-policy QPO_2048K_5_0_6_50_16_2_20
policy-map QPO_BBONE_14000_V1
 class class-default
  shape average 14000000 168000
policy-map QPI_10000K_BBrasil_NAC_IACC_V1
 class TEMPO_REAL_NAC
  police cir percent 32 conform-action transmit  exceed-action drop 
 class MISSAO_CRITICA_NAC
  police cir percent 40 conform-action transmit  exceed-action set-dscp-transmit af43
 class GERENCIAMENTO_NAC
  police cir percent 3 conform-action transmit  exceed-action set-dscp-transmit af33
 class NETWORK_CONTROL_NAC
  police cir percent 1 conform-action transmit  exceed-action set-dscp-transmit cs6
 class STANDARD_NAC
  police cir percent 20 conform-action transmit  exceed-action set-dscp-transmit default
policy-map QDI_10000K_BBrasil_NAC_IACC_V1
 class class-default
  police rate 10000000  conform-action transmit  exceed-action drop 
  service-policy QPI_10000K_BBrasil_NAC_IACC_V1
policy-map QPO_BBONE_452_V1
 class class-default
  shape average 452000 5424
policy-map QPO_VIPSIP_VOZ_1200_V1
 class Voz_Q6
  priority
  police rate 1136000  conform-action transmit  exceed-action drop 
 class NetworkControl_Q6
  bandwidth 64
  queue-limit 32 packets
policy-map QDO_VIPSIP_VOZ_1200_V1
 class class-default
  shape average 1200000
  service-policy QPO_VIPSIP_VOZ_1200_V1
policy-map QPI_BBONE_N_24000_V1
 class class-default
  police 24000000 750000 750000 conform-action set-mpls-exp-imposition-transmit 0 exceed-action drop 
policy-map QPI_BBONE_N_600_V1
 class class-default
  police 600000 conform-action set-mpls-exp-imposition-transmit 0 exceed-action drop 
policy-map QPI_2048K_13_N_25_11_0_0_1_1
 class Voz_Q6
  police cir percent 13 conform-action transmit  exceed-action drop 
 class Video_Q6
  police cir percent 25 conform-action set-mpls-exp-imposition-transmit 5 exceed-action drop 
 class MissaoCritica_Q6
  police cir percent 11 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
 class class-default
  set mpls experimental topmost 0
policy-map QDI_2048K_13_25_11_0_0_1_1
 class class-default
  police rate 2048000  conform-action transmit  exceed-action drop 
  service-policy QPI_2048K_13_N_25_11_0_0_1_1
policy-map QOS_POLICY_IN_4P_0P
 class REALTIME
  police cir percent 4 conform-action transmit  exceed-action drop 
 class class-default
  set mpls experimental imposition 0
policy-map QPI_1024_0_155_70_70_473_0B_A_V1
 class MISSAO_CRITICA
  police cir percent 15 conform-action transmit  exceed-action set-dscp-transmit af43
 class GERENCIAMENTO
  police cir percent 7 conform-action transmit  exceed-action set-dscp-transmit af32
 class SUPORTE_AO_NEGOCIO
  police cir percent 7 conform-action transmit  exceed-action set-dscp-transmit af23
 class NAO_CRITICO
  police cir percent 46 conform-action transmit  exceed-action set-dscp-transmit af13
 class class-default
policy-map QPO_SERPRO_2048K_V1
 class VozVideo_SERPRO
  priority
  police cir percent 40 conform-action transmit  exceed-action drop 
 class MissaoCritica_SERPRO
  bandwidth percent 10 
  random-detect dscp-based
 class Interativa_SERPRO
  bandwidth percent 30 
  random-detect dscp-based
 class NetworkControl_SERPRO
  bandwidth percent 1 
 class class-default
  bandwidth percent 16 
  random-detect dscp-based
policy-map QDO_SERPRO_2048K_V1
 class class-default
  shape average 2048000
  service-policy QPO_SERPRO_2048K_V1
policy-map QPO_4096K_8_0_0_0_0_1_89
 class Voz_Q6
  priority level 1
  police cir percent 8 conform-action transmit  exceed-action drop 
 class NetworkControl_Q6
  bandwidth percent 1 
  queue-limit 30 packets
 class class-default
  bandwidth percent 89 
  random-detect dscp-based
  random-detect dscp 0 112 240 1
  queue-limit 480 packets
policy-map QPI_1024K_18_N_0_0_0_0_2_79
 class Voz_Q6
  police cir percent 18 conform-action transmit  exceed-action drop 
 class class-default
  set mpls experimental topmost 0
policy-map QPO_1024K_12_0_34_25_18_2_8
 class Voz_Q6
  priority level 1
  police cir percent 12 conform-action transmit  exceed-action drop 
 class MissaoCritica_Q6
  bandwidth percent 34 
  random-detect dscp-based
  random-detect dscp 24 14 30 1
  random-detect dscp 26 14 30 1
  random-detect dscp 28 14 30 1
  random-detect dscp 30 14 30 1
  queue-limit 60 packets
 class Interativa_Q6
  bandwidth percent 25 
  random-detect dscp-based
  random-detect dscp 18 14 30 1
  random-detect dscp 20 14 30 1
  random-detect dscp 22 14 30 1
  queue-limit 60 packets
 class Bulk_Q6
  bandwidth percent 18 
  random-detect dscp-based
  random-detect dscp 8 12 20 1
  random-detect dscp 10 12 20 1
  random-detect dscp 12 12 20 1
  random-detect dscp 14 12 20 1
  random-detect dscp 32 12 20 1
  queue-limit 40 packets
 class NetworkControl_Q6
  bandwidth percent 2 
  queue-limit 18 packets
 class class-default
  bandwidth percent 8 
  random-detect dscp-based
  random-detect dscp 0 7 15 1
  queue-limit 30 packets
policy-map QDO_1024K_12_0_34_25_18_2_8
 class class-default
  shape average 1024000
  service-policy QPO_1024K_12_0_34_25_18_2_8
policy-map QPO_1024_0_155_70_70_473_0B_A_V1
 class MISSAO_CRITICA
  bandwidth percent 15 
  random-detect dscp-based
  queue-limit 40 packets
 class GERENCIAMENTO
  bandwidth percent 7 
  random-detect dscp-based
  queue-limit 30 packets
 class SUPORTE_AO_NEGOCIO
  bandwidth percent 7 
  random-detect dscp-based
  queue-limit 30 packets
 class NAO_CRITICO
  bandwidth percent 46 
  random-detect dscp-based
  queue-limit 30 packets
 class class-default
  bandwidth percent 20 
  random-detect dscp-based
  queue-limit 40 packets
policy-map QDO_1024_0_155_70_70_473_0B_A_V1
 class class-default
  shape average 1024000
  service-policy QPO_1024_0_155_70_70_473_0B_A_V1
policy-map QPO_4096K_4_0_2_50_0_1_41
 class Voz_Q6
  priority level 1
  police cir percent 4 conform-action transmit  exceed-action drop 
 class MissaoCritica_Q6
  bandwidth percent 2 
  random-detect dscp-based
  random-detect dscp 24 7 15 1
  random-detect dscp 26 7 15 1
  random-detect dscp 28 7 15 1
  random-detect dscp 30 7 15 1
  queue-limit 30 packets
 class Interativa_Q6
  bandwidth percent 50 
  random-detect dscp-based
  random-detect dscp 18 112 240 1
  random-detect dscp 20 112 240 1
  random-detect dscp 22 112 240 1
  queue-limit 480 packets
 class NetworkControl_Q6
  bandwidth percent 1 
  queue-limit 26 packets
 class class-default
  bandwidth percent 41 
  random-detect dscp-based
  random-detect dscp 0 56 120 1
  queue-limit 240 packets
policy-map QPO_1024K_18_0_0_0_0_2_79
 class Voz_Q6
  priority level 1
  police cir percent 18 conform-action transmit  exceed-action drop 
 class NetworkControl_Q6
  bandwidth percent 2 
  queue-limit 18 packets
 class class-default
  bandwidth percent 79 
  random-detect dscp-based
  random-detect dscp 0 32 64 1
  queue-limit 128 packets
policy-map QDO_1024K_18_0_0_0_0_2_79
 class class-default
  shape average 1024000
  service-policy QPO_1024K_18_0_0_0_0_2_79
policy-map QPI_Correios_2048K_ARPA_IOS_D_VID_V1
 class REAL_TIME_CORREIOS
  police cir percent 32 conform-action transmit  exceed-action drop 
 class MISSAO_CRITICA_CORREIOS
  police cir percent 40 conform-action transmit  exceed-action set-dscp-transmit af41
 class GERENCIAMENTO_CORREIOS
  police cir percent 9 conform-action transmit  exceed-action set-dscp-transmit af31
 class NETWORK_CONTROL_CORREIOS
  police cir percent 1 conform-action transmit  exceed-action set-dscp-transmit cs6
 class BEST_EFFORT
  police cir percent 17 conform-action transmit  exceed-action set-dscp-transmit default
policy-map QDI_Correios_2048K_ARPA_IOS_D_VID_V1
 class class-default
  police cir 2048000 conform-action transmit  exceed-action drop 
  service-policy QPI_Correios_2048K_ARPA_IOS_D_VID_V1
policy-map QPO_BBONE_8000_V1
 class class-default
  shape average 8000000 96000
policy-map QPO_VIPSIP_VOZ_400_V1
 class Voz_Q6
  priority
  police rate 336000  conform-action transmit  exceed-action drop 
 class NetworkControl_Q6
  bandwidth 64
  queue-limit 32 packets
policy-map QPO_256K_25_0_4_0_0_7_63
 class Voz_Q6
  priority level 1
  police cir percent 25 conform-action transmit  exceed-action drop 
 class MissaoCritica_Q6
  bandwidth percent 4 
  random-detect dscp-based
  random-detect dscp 24 6 8 1
  random-detect dscp 26 6 8 1
  random-detect dscp 28 6 8 1
  random-detect dscp 30 6 8 1
  queue-limit 16 packets
 class NetworkControl_Q6
  bandwidth percent 7 
  queue-limit 18 packets
 class class-default
  bandwidth percent 63 
  random-detect dscp-based
  random-detect dscp 0 12 20 1
  queue-limit 40 packets
policy-map QPO_2048K_0_0_70_26_0_2_1
 class MissaoCritica_Q6
  bandwidth percent 70 
  random-detect dscp-based
  random-detect dscp 24 56 120 1
  random-detect dscp 26 56 120 1
  random-detect dscp 28 56 120 1
  random-detect dscp 30 56 120 1
  queue-limit 240 packets
 class Interativa_Q6
  bandwidth percent 26 
  random-detect dscp-based
  random-detect dscp 18 32 48 1
  random-detect dscp 20 32 48 1
  random-detect dscp 22 32 48 1
  queue-limit 96 packets
 class NetworkControl_Q6
  bandwidth percent 2 
  queue-limit 26 packets
 class class-default
  bandwidth percent 1 
  random-detect dscp-based
  random-detect dscp 0 5 9 1
  queue-limit 18 packets
policy-map QPO_2048K_13_38_23_0_0_2_23
 class Voz_Q6
  priority level 1
  police cir percent 13 conform-action transmit  exceed-action drop 
 class Video_Q6
  priority level 2
  police cir percent 38 conform-action transmit  exceed-action drop 
 class MissaoCritica_Q6
  bandwidth percent 23 
  random-detect dscp-based
  random-detect dscp 24 24 40 1
  random-detect dscp 26 24 40 1
  random-detect dscp 28 24 40 1
  random-detect dscp 30 24 40 1
  queue-limit 80 packets
 class NetworkControl_Q6
  bandwidth percent 2 
  queue-limit 26 packets
 class class-default
  bandwidth percent 23 
  random-detect dscp-based
  random-detect dscp 0 24 40 1
  queue-limit 80 packets
policy-map QDO_2048K_13_38_23_0_0_2_23
 class class-default
  shape average 2048000
  service-policy QPO_2048K_13_38_23_0_0_2_23
policy-map QPI_4096K_9_N_25_28_14_0_2_20
 class Voz_Q6
  police cir percent 9 conform-action transmit  exceed-action drop 
 class Video_Q6
  police cir percent 25 conform-action set-mpls-exp-imposition-transmit 5 exceed-action drop 
 class MissaoCritica_Q6
  police cir percent 28 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
 class Interativa_Q6
  police cir percent 14 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
 class class-default
  set mpls experimental topmost 0
policy-map QDI_4096K_9_25_28_14_0_2_20
 class class-default
  police rate 4096000  conform-action transmit  exceed-action drop 
  service-policy QPI_4096K_9_N_25_28_14_0_2_20
policy-map QPO_BBONE_34000_V1
 class class-default
  shape average 34000000 408000
policy-map QPI_BBONE_N_6000_V1
 class class-default
  police 6000000 conform-action set-mpls-exp-imposition-transmit 0 exceed-action drop 
policy-map QPI_512K_25_N_0_60_0_0_4_10
 class Voz_Q6
  police cir percent 25 conform-action transmit  exceed-action drop 
 class MissaoCritica_Q6
  police cir percent 60 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
 class class-default
  set mpls experimental topmost 0
policy-map QDI_512K_25_0_60_0_0_4_10
 class class-default
  police rate 512000  conform-action transmit  exceed-action drop 
  service-policy QPI_512K_25_N_0_60_0_0_4_10
policy-map QPO_10000K_10_20_26_0_0_1_40
 class Voz_Q6
  priority level 1
  police cir percent 10 conform-action transmit  exceed-action drop 
 class Video_Q6
  priority level 2
  police cir percent 20 conform-action transmit  exceed-action drop 
 class MissaoCritica_Q6
  bandwidth percent 26 
  random-detect dscp-based
  random-detect dscp 24 112 240 1
  random-detect dscp 26 112 240 1
  random-detect dscp 28 112 240 1
  random-detect dscp 30 112 240 1
  queue-limit 480 packets
 class NetworkControl_Q6
  bandwidth percent 1 
  queue-limit 40 packets
 class class-default
  bandwidth percent 40 
  random-detect dscp-based
  random-detect dscp 0 112 240 1
  queue-limit 480 packets
policy-map QDO_10000K_10_20_26_0_0_1_40
 class class-default
  shape average 10000000
  service-policy QPO_10000K_10_20_26_0_0_1_40
policy-map QPI_10000K_16_N_0_0_0_0_2_81
 class Voz_Q6
  police cir percent 16 conform-action transmit  exceed-action drop 
 class class-default
  set mpls experimental topmost 0
policy-map QDI_10000K_16_0_0_0_0_2_81
 class class-default
  police rate 10000000  conform-action transmit  exceed-action drop 
  service-policy QPI_10000K_16_N_0_0_0_0_2_81
policy-map QPI_1024K_13_N_0_16_48_16_2_4
 class Voz_Q6
  police cir percent 13 conform-action transmit  exceed-action drop 
 class MissaoCritica_Q6
  police cir percent 16 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
 class Interativa_Q6
  police cir percent 48 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
 class Bulk_Q6
  police cir percent 16 conform-action set-mpls-exp-imposition-transmit 4 exceed-action set-mpls-exp-imposition-transmit 1
 class class-default
  set mpls experimental topmost 0
policy-map QDI_1024K_13_0_16_48_16_2_4
 class class-default
  police rate 1024000  conform-action transmit  exceed-action drop 
  service-policy QPI_1024K_13_N_0_16_48_16_2_4
policy-map QPI_BBONE_S_600000_V1
 class class-default
  police 600000000 conform-action set-dscp-transmit default exceed-action drop 
policy-map QPO_4096K_13_37_31_0_16_1_1
 class Voz_Q6
  priority level 1
  police cir percent 13 conform-action transmit  exceed-action drop 
 class Video_Q6
  priority level 2
  police cir percent 37 conform-action transmit  exceed-action drop 
 class MissaoCritica_Q6
  bandwidth percent 31 
  random-detect dscp-based
  random-detect dscp 24 56 120 1
  random-detect dscp 26 56 120 1
  random-detect dscp 28 56 120 1
  random-detect dscp 30 56 120 1
  queue-limit 240 packets
 class Bulk_Q6
  bandwidth percent 16 
  random-detect dscp-based
  random-detect dscp 8 32 48 1
  random-detect dscp 10 32 48 1
  random-detect dscp 12 32 48 1
  random-detect dscp 14 32 48 1
  random-detect dscp 32 32 48 1
  queue-limit 96 packets
 class NetworkControl_Q6
  bandwidth percent 1 
  queue-limit 26 packets
 class class-default
  bandwidth percent 1 
  random-detect dscp-based
  random-detect dscp 0 5 13 1
  queue-limit 26 packets
policy-map QPO_BBONE_1024_V1
 class class-default
  shape average 1024000 12288
policy-map QPO_VIPSIP_VOZ_2600_V1
 class Voz_Q6
  priority
  police rate 2536000  conform-action transmit  exceed-action drop 
 class NetworkControl_Q6
  bandwidth 64
  queue-limit 32 packets
policy-map QPI_4096K_6_N_0_0_0_0_1_91
 class Voz_Q6
  police cir percent 6 conform-action transmit  exceed-action drop 
 class class-default
  set mpls experimental topmost 0
policy-map QDI_4096K_6_0_0_0_0_1_91
 class class-default
  police rate 4096000  conform-action transmit  exceed-action drop 
  service-policy QPI_4096K_6_N_0_0_0_0_1_91
policy-map QPI_BBONE_N_30000_V1
 class class-default
  police 30000000 conform-action set-mpls-exp-imposition-transmit 0 exceed-action drop 
policy-map QPI_BBONE_N_2048_V1
 class class-default
  police 2048000 conform-action set-mpls-exp-imposition-transmit 0 exceed-action drop 
policy-map QDO_2048K_0_0_70_26_0_2_1
 class class-default
  shape average 2048000
  service-policy QPO_2048K_0_0_70_26_0_2_1
policy-map QPI_1024K_30_N_0_0_0_0_2_66
 class Voz_Q6
  police cir percent 30 conform-action transmit  exceed-action drop 
 class class-default
  set mpls experimental topmost 0
policy-map QDI_1024K_30_0_0_0_0_2_66
 class class-default
  police rate 1024000  conform-action transmit  exceed-action drop 
  service-policy QPI_1024K_30_N_0_0_0_0_2_66
policy-map QPO_BBONE_2700_V1
 class class-default
  shape average 2700000 32400
policy-map QPI_10000K_5_N_0_22_19_2_2_34
 class Voz_Q6
  police cir percent 5 conform-action transmit  exceed-action drop 
 class MissaoCritica_Q6
  police cir percent 22 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
 class Interativa_Q6
  police cir percent 19 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
 class Bulk_Q6
  police cir percent 2 conform-action set-mpls-exp-imposition-transmit 4 exceed-action set-mpls-exp-imposition-transmit 1
 class class-default
  set mpls experimental topmost 0
policy-map QDI_10000K_5_0_22_19_2_2_34
 class class-default
  police rate 10000000  conform-action transmit  exceed-action drop 
  service-policy QPI_10000K_5_N_0_22_19_2_2_34
policy-map QPO_BBONE_12200_V1
 class class-default
  shape average 12200000 146400
policy-map QPO_4096K_6_0_0_0_0_1_91
 class Voz_Q6
  priority level 1
  police cir percent 6 conform-action transmit  exceed-action drop 
 class NetworkControl_Q6
  bandwidth percent 1 
  queue-limit 30 packets
 class class-default
  bandwidth percent 91 
  random-detect dscp-based
  random-detect dscp 0 112 240 1
  queue-limit 480 packets
policy-map QPI_2048K_7_N_0_75_0_0_2_15
 class Voz_Q6
  police cir percent 7 conform-action transmit  exceed-action drop 
 class MissaoCritica_Q6
  police cir percent 75 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
 class class-default
  set mpls experimental topmost 0
policy-map QDI_2048K_7_0_75_0_0_2_15
 class class-default
  police rate 2048000  conform-action transmit  exceed-action drop 
  service-policy QPI_2048K_7_N_0_75_0_0_2_15
policy-map QPI_2048K_5_N_0_6_50_16_2_20
 class Voz_Q6
  police cir percent 5 conform-action transmit  exceed-action drop 
 class MissaoCritica_Q6
  police cir percent 6 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
 class Interativa_Q6
  police cir percent 50 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
 class Bulk_Q6
  police cir percent 16 conform-action set-mpls-exp-imposition-transmit 4 exceed-action set-mpls-exp-imposition-transmit 1
 class class-default
  set mpls experimental topmost 0
policy-map QDI_2048K_5_0_6_50_16_2_20
 class class-default
  police rate 2048000  conform-action transmit  exceed-action drop 
  service-policy QPI_2048K_5_N_0_6_50_16_2_20
policy-map QPO_2048K_11_0_41_0_11_1_35
 class Voz_Q6
  priority level 1
  police cir percent 11 conform-action transmit  exceed-action drop 
 class MissaoCritica_Q6
  bandwidth percent 41 
  random-detect dscp-based
  random-detect dscp 24 32 64 1
  random-detect dscp 26 32 64 1
  random-detect dscp 28 32 64 1
  random-detect dscp 30 32 64 1
  queue-limit 128 packets
 class Bulk_Q6
  bandwidth percent 11 
  random-detect dscp-based
  random-detect dscp 8 12 20 1
  random-detect dscp 10 12 20 1
  random-detect dscp 12 12 20 1
  random-detect dscp 14 12 20 1
  random-detect dscp 32 12 20 1
  queue-limit 40 packets
 class NetworkControl_Q6
  bandwidth percent 1 
  queue-limit 18 packets
 class class-default
  bandwidth percent 35 
  random-detect dscp-based
  random-detect dscp 0 32 48 1
  queue-limit 96 packets
policy-map QPO_4096K_3_0_50_13_13_1_17
 class Voz_Q6
  priority level 1
  police cir percent 3 conform-action transmit  exceed-action drop 
 class MissaoCritica_Q6
  bandwidth percent 50 
  random-detect dscp-based
  random-detect dscp 24 112 240 1
  random-detect dscp 26 112 240 1
  random-detect dscp 28 112 240 1
  random-detect dscp 30 112 240 1
  queue-limit 480 packets
 class Interativa_Q6
  bandwidth percent 13 
  random-detect dscp-based
  random-detect dscp 18 32 48 1
  random-detect dscp 20 32 48 1
  random-detect dscp 22 32 48 1
  queue-limit 96 packets
 class Bulk_Q6
  bandwidth percent 13 
  random-detect dscp-based
  random-detect dscp 8 32 48 1
  random-detect dscp 10 32 48 1
  random-detect dscp 12 32 48 1
  random-detect dscp 14 32 48 1
  random-detect dscp 32 32 48 1
  queue-limit 96 packets
 class NetworkControl_Q6
  bandwidth percent 1 
  queue-limit 26 packets
 class class-default
  bandwidth percent 17 
  random-detect dscp-based
  random-detect dscp 0 32 48 1
  queue-limit 96 packets
policy-map QDO_4096K_3_0_50_13_13_1_17
 class class-default
  shape average 4096000
  service-policy QPO_4096K_3_0_50_13_13_1_17
policy-map QPO_BBONE_200000_V1
 class class-default
  shape average 200000000 2400000
policy-map QPO_2048K_7_0_75_0_0_2_15
 class Voz_Q6
  priority level 1
  police cir percent 7 conform-action transmit  exceed-action drop 
 class MissaoCritica_Q6
  bandwidth percent 75 
  random-detect dscp-based
  random-detect dscp 24 56 120 1
  random-detect dscp 26 56 120 1
  random-detect dscp 28 56 120 1
  random-detect dscp 30 56 120 1
  queue-limit 240 packets
 class NetworkControl_Q6
  bandwidth percent 2 
  queue-limit 26 packets
 class class-default
  bandwidth percent 15 
  random-detect dscp-based
  random-detect dscp 0 14 30 1
  queue-limit 60 packets
policy-map QPO_2048K_12_23_9_50_0_2_3
 class Voz_Q6
  priority level 1
  police cir percent 12 conform-action transmit  exceed-action drop 
 class Video_Q6
  priority level 2
  police cir percent 23 conform-action transmit  exceed-action drop 
 class MissaoCritica_Q6
  bandwidth percent 9 
  random-detect dscp-based
  random-detect dscp 24 12 20 1
  random-detect dscp 26 12 20 1
  random-detect dscp 28 12 20 1
  random-detect dscp 30 12 20 1
  queue-limit 40 packets
 class Interativa_Q6
  bandwidth percent 50 
  random-detect dscp-based
  random-detect dscp 18 56 120 1
  random-detect dscp 20 56 120 1
  random-detect dscp 22 56 120 1
  queue-limit 240 packets
 class NetworkControl_Q6
  bandwidth percent 2 
  queue-limit 26 packets
 class class-default
  bandwidth percent 3 
  random-detect dscp-based
  random-detect dscp 0 7 15 1
  queue-limit 30 packets
policy-map QPO_10000K_3_0_0_0_0_2_94
 class Voz_Q6
  priority level 1
  police cir percent 3 conform-action transmit  exceed-action drop 
 class NetworkControl_Q6
  bandwidth percent 2 
  queue-limit 40 packets
 class class-default
  bandwidth percent 94 
  random-detect dscp-based
  random-detect dscp 0 344 600 1
  queue-limit 1200 packets
policy-map QDO_10000K_3_0_0_0_0_2_94
 class class-default
  shape average 10000000
  service-policy QPO_10000K_3_0_0_0_0_2_94
policy-map QPI_512K_BBrasil_NAC_IACC_V1
 class TEMPO_REAL_NAC
  police cir percent 21 conform-action transmit  exceed-action drop 
 class MISSAO_CRITICA_NAC
  police cir percent 40 conform-action transmit  exceed-action set-dscp-transmit af43
 class GERENCIAMENTO_NAC
  police cir percent 15 conform-action transmit  exceed-action set-dscp-transmit af33
 class NETWORK_CONTROL_NAC
  police cir percent 3 conform-action transmit  exceed-action set-dscp-transmit cs6
 class STANDARD_NAC
  police cir percent 20 conform-action transmit  exceed-action set-dscp-transmit default
policy-map QDI_512K_BBrasil_NAC_IACC_V1
 class class-default
  police rate 512000  conform-action transmit  exceed-action drop 
  service-policy QPI_512K_BBrasil_NAC_IACC_V1
policy-map QPO_2048K_16_15_11_25_0_2_30
 class Voz_Q6
  priority level 1
  police cir percent 16 conform-action transmit  exceed-action drop 
 class Video_Q6
  priority level 2
  police cir percent 15 conform-action transmit  exceed-action drop 
 class MissaoCritica_Q6
  bandwidth percent 11 
  random-detect dscp-based
  random-detect dscp 24 12 20 1
  random-detect dscp 26 12 20 1
  random-detect dscp 28 12 20 1
  random-detect dscp 30 12 20 1
  queue-limit 40 packets
 class Interativa_Q6
  bandwidth percent 25 
  random-detect dscp-based
  random-detect dscp 18 32 48 1
  random-detect dscp 20 32 48 1
  random-detect dscp 22 32 48 1
  queue-limit 96 packets
 class NetworkControl_Q6
  bandwidth percent 2 
  queue-limit 26 packets
 class class-default
  bandwidth percent 30 
  random-detect dscp-based
  random-detect dscp 0 32 48 1
  queue-limit 96 packets
policy-map QDO_2048K_16_15_11_25_0_2_30
 class class-default
  shape average 2048000
  service-policy QPO_2048K_16_15_11_25_0_2_30
policy-map QPO_BBONE_100000_V1
 class class-default
  shape average 100000000 1200000
  queue-limit 1536 packets
policy-map QPO_1024K_30_0_0_0_0_2_66
 class Voz_Q6
  priority level 1
  police cir percent 30 conform-action transmit  exceed-action drop 
 class NetworkControl_Q6
  bandwidth percent 2 
  queue-limit 18 packets
 class class-default
  bandwidth percent 66 
  random-detect dscp-based
  random-detect dscp 0 32 48 1
  queue-limit 96 packets
policy-map QPO_BBONE_68000_V1
 class class-default
  shape average 68000000 816000
policy-map QPO_512K_5_0_30_16_4_4_40
 class Voz_Q6
  priority level 1
  police cir percent 5 conform-action transmit  exceed-action drop 
 class MissaoCritica_Q6
  bandwidth percent 30 
  random-detect dscp-based
  random-detect dscp 24 12 20 1
  random-detect dscp 26 12 20 1
  random-detect dscp 28 12 20 1
  random-detect dscp 30 12 20 1
  queue-limit 40 packets
 class Interativa_Q6
  bandwidth percent 16 
  random-detect dscp-based
  random-detect dscp 18 7 15 1
  random-detect dscp 20 7 15 1
  random-detect dscp 22 7 15 1
  queue-limit 30 packets
 class Bulk_Q6
  bandwidth percent 4 
  random-detect dscp-based
  random-detect dscp 8 5 9 1
  random-detect dscp 10 5 9 1
  random-detect dscp 12 5 9 1
  random-detect dscp 14 5 9 1
  random-detect dscp 32 5 9 1
  queue-limit 18 packets
 class NetworkControl_Q6
  bandwidth percent 4 
  queue-limit 18 packets
 class class-default
  bandwidth percent 40 
  random-detect dscp-based
  random-detect dscp 0 12 20 1
  queue-limit 40 packets
policy-map QDO_512K_5_0_30_16_4_4_40
 class class-default
  shape average 512000
  service-policy QPO_512K_5_0_30_16_4_4_40
policy-map QPI_BBONE_N_12000_V1
 class class-default
  police 12000000 conform-action set-mpls-exp-imposition-transmit 0 exceed-action drop 
policy-map QPI_Correios_128K_ARPA_IOS_D_V1
 class REAL_TIME_CORREIOS
  police cir percent 12 conform-action transmit  exceed-action drop 
 class MISSAO_CRITICA_CORREIOS
  police cir percent 40 conform-action transmit  exceed-action set-dscp-transmit af41
 class GERENCIAMENTO_CORREIOS
  police cir percent 9 conform-action transmit  exceed-action set-dscp-transmit af31
 class NETWORK_CONTROL_CORREIOS
  police cir percent 7 conform-action transmit  exceed-action set-dscp-transmit cs6
 class BEST_EFFORT
  police cir percent 32 conform-action transmit  exceed-action set-dscp-transmit default
policy-map QPI_2048K_0_N_0_70_26_0_2_1
 class MissaoCritica_Q6
  police cir percent 70 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
 class Interativa_Q6
  police cir percent 26 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
 class class-default
  set mpls experimental topmost 0
policy-map QPI_BBONE_S_14000_V1
 class class-default
  police 14000000 conform-action set-dscp-transmit default exceed-action drop 
policy-map QPI_2048K_13_N_38_23_0_0_2_23
 class Voz_Q6
  police cir percent 13 conform-action transmit  exceed-action drop 
 class Video_Q6
  police cir percent 38 conform-action set-mpls-exp-imposition-transmit 5 exceed-action drop 
 class MissaoCritica_Q6
  police cir percent 23 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
 class class-default
  set mpls experimental topmost 0
policy-map QPI_BBONE_S_452_V1
 class class-default
  police 452000 conform-action set-dscp-transmit default exceed-action drop 
policy-map QPO_2048K_15_0_0_0_0_2_57
 class Voz_Q6
  priority level 1
  police cir percent 15 conform-action transmit  exceed-action drop 
 class NetworkControl_Q6
  bandwidth percent 2 
  queue-limit 40 packets
 class class-default
  bandwidth percent 57 
  random-detect dscp-based
  random-detect dscp 0 56 120 1
  queue-limit 240 packets
policy-map QPO_512K_BBrasil_NAC_IACC_V1
 class TEMPO_REAL_NAC
  priority level 1
  police cir percent 21 bc 300 ms conform-action transmit  exceed-action drop 
 class MISSAO_CRITICA_NAC
  bandwidth remaining percent 53 
  random-detect dscp-based
  random-detect dscp 32 12 20 1
  random-detect dscp 34 12 20 1
  random-detect dscp 38 12 20 1
  queue-limit 40 packets
 class GERENCIAMENTO_NAC
  bandwidth remaining percent 20 
  random-detect dscp-based
  random-detect dscp 24 7 15 1
  random-detect dscp 26 7 15 1
  random-detect dscp 30 7 15 1
  queue-limit 30 packets
 class NETWORK_CONTROL_NAC
  bandwidth remaining percent 4 
  random-detect dscp-based
  random-detect dscp 48 5 9 1
  queue-limit 18 packets
 class STANDARD_NAC
  bandwidth remaining percent 23 
  random-detect dscp-based
  random-detect dscp 0 7 15 1
  queue-limit 30 packets
policy-map QDO_512K_BBrasil_NAC_IACC_V1
 class class-default
  shape average 512000
  service-policy QPO_512K_BBrasil_NAC_IACC_V1
policy-map QPO_1024K_7_0_50_0_0_2_40
 class Voz_Q6
  priority level 1
  police cir percent 7 conform-action transmit  exceed-action drop 
 class MissaoCritica_Q6
  bandwidth percent 50 
  random-detect dscp-based
  random-detect dscp 24 32 48 1
  random-detect dscp 26 32 48 1
  random-detect dscp 28 32 48 1
  random-detect dscp 30 32 48 1
  queue-limit 96 packets
 class NetworkControl_Q6
  bandwidth percent 2 
  queue-limit 18 packets
 class class-default
  bandwidth percent 40 
  random-detect dscp-based
  random-detect dscp 0 24 40 1
  queue-limit 80 packets
policy-map QPO_BBONE_16000_V1
 class class-default
  shape average 16000000 192000
policy-map QPO_8000K_2_47_26_7_0_1_16
 class Voz_Q6
  priority level 1
  police cir percent 2 conform-action transmit  exceed-action drop 
 class Video_Q6
  priority level 2
  police cir percent 47 conform-action transmit  exceed-action drop 
 class MissaoCritica_Q6
  bandwidth percent 26 
  random-detect dscp-based
  random-detect dscp 24 112 240 1
  random-detect dscp 26 112 240 1
  random-detect dscp 28 112 240 1
  random-detect dscp 30 112 240 1
  queue-limit 480 packets
 class Interativa_Q6
  bandwidth percent 7 
  random-detect dscp-based
  random-detect dscp 18 32 48 1
  random-detect dscp 20 32 48 1
  random-detect dscp 22 32 48 1
  queue-limit 96 packets
 class NetworkControl_Q6
  bandwidth percent 1 
  queue-limit 30 packets
 class class-default
  bandwidth percent 16 
  random-detect dscp-based
  random-detect dscp 0 56 120 1
  queue-limit 240 packets
policy-map QPO_BBONE_1200_V1
 class class-default
  shape average 1200000 14400
policy-map QPI_6000K_12_N_23_16_8_34_2_4
 class Voz_Q6
  police cir percent 12 conform-action transmit  exceed-action drop 
 class Video_Q6
  police cir percent 23 conform-action set-mpls-exp-imposition-transmit 5 exceed-action drop 
 class MissaoCritica_Q6
  police cir percent 16 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
 class Interativa_Q6
  police cir percent 8 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
 class Bulk_Q6
  police cir percent 34 conform-action set-mpls-exp-imposition-transmit 4 exceed-action set-mpls-exp-imposition-transmit 1
 class class-default
  set mpls experimental topmost 0
policy-map QDI_6000K_12_23_16_8_34_2_4
 class class-default
  police rate 6000000  conform-action transmit  exceed-action drop 
  service-policy QPI_6000K_12_N_23_16_8_34_2_4
policy-map QPO_30000K_16_15_10_25_0_1_30
 class Voz_Q6
  priority level 1
  police cir percent 16 conform-action transmit  exceed-action drop 
 class Video_Q6
  priority level 2
  police cir percent 15 conform-action transmit  exceed-action drop 
 class MissaoCritica_Q6
  bandwidth percent 10 
  random-detect dscp-based
  random-detect dscp 24 112 240 1
  random-detect dscp 26 112 240 1
  random-detect dscp 28 112 240 1
  random-detect dscp 30 112 240 1
  queue-limit 480 packets
 class Interativa_Q6
  bandwidth percent 25 
  random-detect dscp-based
  random-detect dscp 18 224 480 1
  random-detect dscp 20 224 480 1
  random-detect dscp 22 224 480 1
  queue-limit 960 packets
 class NetworkControl_Q6
  bandwidth percent 1 
  queue-limit 80 packets
 class class-default
  bandwidth percent 30 
  random-detect dscp-based
  random-detect dscp 0 344 600 1
  queue-limit 1200 packets
policy-map QPO_2048K_16_15_11_0_0_2_30
 class Voz_Q6
  priority level 1
  police cir percent 16 conform-action transmit  exceed-action drop 
 class Video_Q6
  priority level 2
  police cir percent 15 conform-action transmit  exceed-action drop 
 class MissaoCritica_Q6
  bandwidth percent 11 
  random-detect dscp-based
  random-detect dscp 24 14 30 1
  random-detect dscp 26 14 30 1
  random-detect dscp 28 14 30 1
  random-detect dscp 30 14 30 1
  queue-limit 60 packets
 class NetworkControl_Q6
  bandwidth percent 2 
  queue-limit 40 packets
 class class-default
  bandwidth percent 30 
  random-detect dscp-based
  random-detect dscp 0 32 48 1
  queue-limit 96 packets
policy-map QDO_2048K_8_0_59_17_0_2_13
 class class-default
  shape average 2048000
  service-policy QPO_2048K_8_0_59_17_0_2_13
policy-map QPI_2048K_7_N_0_50_0_13_2_27
 class Voz_Q6
  police cir percent 7 conform-action transmit  exceed-action drop 
 class MissaoCritica_Q6
  police cir percent 50 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
 class Bulk_Q6
  police cir percent 13 conform-action set-mpls-exp-imposition-transmit 4 exceed-action set-mpls-exp-imposition-transmit 1
 class class-default
  set mpls experimental topmost 0
policy-map QDI_2048K_7_0_50_0_13_2_27
 class class-default
  police rate 2048000  conform-action transmit  exceed-action drop 
  service-policy QPI_2048K_7_N_0_50_0_13_2_27
policy-map QPI_4096K_4_N_0_2_50_0_1_41
 class Voz_Q6
  police cir percent 4 conform-action transmit  exceed-action drop 
 class MissaoCritica_Q6
  police cir percent 2 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
 class Interativa_Q6
  police cir percent 50 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
 class class-default
  set mpls experimental topmost 0
policy-map QPO_VIPSIP_VOZ_5800_V1
 class Voz_Q6
  priority
  police rate 5736000  conform-action transmit  exceed-action drop 
 class NetworkControl_Q6
  bandwidth 64
  queue-limit 32 packets
policy-map QPO_512K_50_0_10_0_0_4_35
 class Voz_Q6
  priority level 1
  police cir percent 50 conform-action transmit  exceed-action drop 
 class MissaoCritica_Q6
  bandwidth percent 10 
  random-detect dscp-based
  random-detect dscp 24 5 13 1
  random-detect dscp 26 5 13 1
  random-detect dscp 28 5 13 1
  random-detect dscp 30 5 13 1
  queue-limit 26 packets
 class NetworkControl_Q6
  bandwidth percent 4 
  queue-limit 18 packets
 class class-default
  bandwidth percent 35 
  random-detect dscp-based
  random-detect dscp 0 12 20 1
  queue-limit 40 packets
policy-map QPI_Correios_2048K_ARPA_IOS_D_V1
 class REAL_TIME_CORREIOS
  police cir percent 1 conform-action transmit  exceed-action drop 
 class MISSAO_CRITICA_CORREIOS
  police cir percent 40 conform-action transmit  exceed-action set-dscp-transmit af41
 class GERENCIAMENTO_CORREIOS
  police cir percent 9 conform-action transmit  exceed-action set-dscp-transmit af31
 class NETWORK_CONTROL_CORREIOS
  police cir percent 1 conform-action transmit  exceed-action set-dscp-transmit cs6
 class BEST_EFFORT
  police cir percent 48 conform-action transmit  exceed-action set-dscp-transmit default
policy-map QDI_Correios_2048K_ARPA_IOS_D_V1
 class class-default
  police cir 2048000 conform-action transmit  exceed-action drop 
  service-policy QPI_Correios_2048K_ARPA_IOS_D_V1
policy-map QDO_2048K_15_0_0_0_0_2_57
 class class-default
  shape average 2048000
  service-policy QPO_2048K_15_0_0_0_0_2_57
policy-map QDO_VIPSIP_VOZ_2600_V1
 class class-default
  shape average 2600000
  service-policy QPO_VIPSIP_VOZ_2600_V1
policy-map QPI_512K_11_N_0_33_25_16_4_8
 class Voz_Q6
  police cir percent 11 conform-action transmit  exceed-action drop 
 class MissaoCritica_Q6
  police cir percent 33 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
 class Interativa_Q6
  police cir percent 25 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
 class Bulk_Q6
  police cir percent 16 conform-action set-mpls-exp-imposition-transmit 4 exceed-action set-mpls-exp-imposition-transmit 1
 class class-default
  set mpls experimental topmost 0
policy-map QDI_512K_11_0_33_25_16_4_8
 class class-default
  police rate 512000  conform-action transmit  exceed-action drop 
  service-policy QPI_512K_11_N_0_33_25_16_4_8
policy-map QPO_4096K_8_0_1_0_0_1_89
 class Voz_Q6
  priority level 1
  police cir percent 8 conform-action transmit  exceed-action drop 
 class MissaoCritica_Q6
  bandwidth percent 1 
  random-detect dscp-based
  random-detect dscp 24 5 13 1
  random-detect dscp 26 5 13 1
  random-detect dscp 28 5 13 1
  random-detect dscp 30 5 13 1
  queue-limit 26 packets
 class NetworkControl_Q6
  bandwidth percent 1 
  queue-limit 26 packets
 class class-default
  bandwidth percent 89 
  random-detect dscp-based
  random-detect dscp 0 112 240 1
  queue-limit 480 packets
policy-map QPI_2048K_15_N_0_0_0_0_2_57
 class Voz_Q6
  police cir percent 15 conform-action transmit  exceed-action drop 
 class class-default
  set mpls experimental topmost 0
policy-map QPI_BBONE_N_2700_V1
 class class-default
  police 2700000 conform-action set-mpls-exp-imposition-transmit 0 exceed-action drop 
policy-map QPI_1024K_7_N_0_48_19_12_4_9
 class Voz_Q6
  police cir percent 7 conform-action transmit  exceed-action drop 
 class MissaoCritica_Q6
  police cir percent 48 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
 class Interativa_Q6
  police cir percent 19 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
 class Bulk_Q6
  police cir percent 12 conform-action set-mpls-exp-imposition-transmit 4 exceed-action set-mpls-exp-imposition-transmit 1
 class class-default
  set mpls experimental topmost 0
policy-map QPO_SERPRO_4096K_V1
 class VozVideo_SERPRO
  priority
  police cir percent 40 conform-action transmit  exceed-action drop 
 class MissaoCritica_SERPRO
  bandwidth percent 10 
  random-detect dscp-based
  random-detect dscp 10 24 40 1
  random-detect dscp 26 24 40 1
  random-detect dscp 28 24 40 1
  random-detect dscp 30 24 40 1
 class Interativa_SERPRO
  bandwidth percent 30 
  random-detect dscp-based
  random-detect dscp 12 56 120 1
  random-detect dscp 18 56 120 1
  random-detect dscp 20 56 120 1
  random-detect dscp 22 56 120 1
 class NetworkControl_SERPRO
  bandwidth percent 1 
 class class-default
  bandwidth percent 16 
  random-detect dscp-based
  random-detect dscp 0 32 48 1
  random-detect dscp 14 32 48 1
policy-map QDO_SERPRO_4096K_V1
 class class-default
  shape average 4096000
  service-policy QPO_SERPRO_4096K_V1
policy-map QPO_4096K_9_25_28_14_0_2_20
 class Voz_Q6
  priority level 1
  police cir percent 9 conform-action transmit  exceed-action drop 
 class Video_Q6
  priority level 2
  police cir percent 25 conform-action transmit  exceed-action drop 
 class MissaoCritica_Q6
  bandwidth percent 28 
  random-detect dscp-based
  random-detect dscp 24 56 120 1
  random-detect dscp 26 56 120 1
  random-detect dscp 28 56 120 1
  random-detect dscp 30 56 120 1
  queue-limit 240 packets
 class Interativa_Q6
  bandwidth percent 14 
  random-detect dscp-based
  random-detect dscp 18 32 48 1
  random-detect dscp 20 32 48 1
  random-detect dscp 22 32 48 1
  queue-limit 96 packets
 class NetworkControl_Q6
  bandwidth percent 2 
  queue-limit 30 packets
 class class-default
  bandwidth percent 20 
  random-detect dscp-based
  random-detect dscp 0 32 64 1
  queue-limit 128 packets
policy-map QDI_VIPSIP_VOZ_600_V1
 class class-default
  police rate 600000  conform-action transmit  exceed-action drop 
policy-map QPO_6000K_16_15_10_25_0_1_30
 class Voz_Q6
  priority level 1
  police cir percent 16 conform-action transmit  exceed-action drop 
 class Video_Q6
  priority level 2
  police cir percent 15 conform-action transmit  exceed-action drop 
 class MissaoCritica_Q6
  bandwidth percent 10 
  random-detect dscp-based
  random-detect dscp 24 32 48 1
  random-detect dscp 26 32 48 1
  random-detect dscp 28 32 48 1
  random-detect dscp 30 32 48 1
  queue-limit 96 packets
 class Interativa_Q6
  bandwidth percent 25 
  random-detect dscp-based
  random-detect dscp 18 56 120 1
  random-detect dscp 20 56 120 1
  random-detect dscp 22 56 120 1
  queue-limit 240 packets
 class NetworkControl_Q6
  bandwidth percent 1 
  queue-limit 30 packets
 class class-default
  bandwidth percent 30 
  random-detect dscp-based
  random-detect dscp 0 56 120 1
  queue-limit 240 packets
policy-map QDO_6000K_16_15_10_25_0_1_30
 class class-default
  shape average 6000000
  service-policy QPO_6000K_16_15_10_25_0_1_30
policy-map QPO_40000K_10_0_60_0_0_1_26
 class Voz_Q6
  priority level 1
  police cir percent 10 conform-action transmit  exceed-action drop 
 class MissaoCritica_Q6
  bandwidth percent 60 
  random-detect dscp-based
  random-detect dscp 24 388 900 1
  random-detect dscp 26 388 900 1
  random-detect dscp 28 388 900 1
  random-detect dscp 30 388 900 1
  queue-limit 1800 packets
 class NetworkControl_Q6
  bandwidth percent 1 
  queue-limit 96 packets
 class class-default
  bandwidth percent 26 
  random-detect dscp-based
  random-detect dscp 0 388 900 1
  queue-limit 1800 packets
policy-map QDO_40000K_10_0_60_0_0_1_26
 class class-default
  shape average 40000000
  service-policy QPO_40000K_10_0_60_0_0_1_26
policy-map QPI_VIPSIP_VOZ_800_V1
 class class-default
policy-map SaidaIntBackbone_1Gbps
 class class-default
  shape average 1000000000
policy-map QPO_BBONE_400000_V1
 class class-default
  shape average 400000000 4800000
policy-map QPI_2048K_12_C_23_9_50_0_2_3
 class Voz_Q6
  police cir percent 12 conform-action transmit  exceed-action drop 
 class Video_Q6
  police cir percent 23 conform-action set-mpls-exp-imposition-transmit 5 exceed-action drop 
 class MissaoCritica_Q6
  police cir percent 9 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
 class Interativa_Q6
  police cir percent 50 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
 class class-default
  set mpls experimental topmost 0
policy-map QDI_2048K_12_23_9_50_0_2_3
 class class-default
  police rate 2048000  conform-action transmit  exceed-action drop 
  service-policy QPI_2048K_12_C_23_9_50_0_2_3
policy-map QPI_BBONE_S_34000_V1
 class class-default
  police 34000000 conform-action set-dscp-transmit default exceed-action drop 
policy-map QPI_4096K_13_N_37_31_0_16_1_1
 class Voz_Q6
  police cir percent 13 conform-action transmit  exceed-action drop 
 class Video_Q6
  police cir percent 37 conform-action set-mpls-exp-imposition-transmit 5 exceed-action drop 
 class MissaoCritica_Q6
  police cir percent 31 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
 class Bulk_Q6
  police cir percent 16 conform-action set-mpls-exp-imposition-transmit 4 exceed-action set-mpls-exp-imposition-transmit 1
 class class-default
  set mpls experimental topmost 0
policy-map QDI_4096K_13_37_31_0_16_1_1
 class class-default
  police rate 4096000  conform-action transmit  exceed-action drop 
  service-policy QPI_4096K_13_N_37_31_0_16_1_1
policy-map QPI_BBONE_S_300000_V1
 class class-default
  police 300000000 conform-action set-dscp-transmit default exceed-action drop 
policy-map QPI_512K_50_N_0_10_0_0_4_35
 class Voz_Q6
  police cir percent 50 conform-action transmit  exceed-action drop 
 class MissaoCritica_Q6
  police cir percent 10 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
 class class-default
  set mpls experimental topmost 0
policy-map QDI_512K_50_0_10_0_0_4_35
 class class-default
  police rate 512000  conform-action transmit  exceed-action drop 
  service-policy QPI_512K_50_N_0_10_0_0_4_35
policy-map QPO_2048K_7_0_33_0_8_2_49
 class Voz_Q6
  priority level 1
  police cir percent 7 conform-action transmit  exceed-action drop 
 class MissaoCritica_Q6
  bandwidth percent 33 
  random-detect dscp-based
  random-detect dscp 24 32 48 1
  random-detect dscp 26 32 48 1
  random-detect dscp 28 32 48 1
  random-detect dscp 30 32 48 1
  queue-limit 96 packets
 class Bulk_Q6
  bandwidth percent 8 
  random-detect dscp-based
  random-detect dscp 8 12 20 1
  random-detect dscp 10 12 20 1
  random-detect dscp 12 12 20 1
  random-detect dscp 14 12 20 1
  random-detect dscp 32 12 20 1
  queue-limit 40 packets
 class NetworkControl_Q6
  bandwidth percent 2 
  queue-limit 26 packets
 class class-default
  bandwidth percent 49 
  random-detect dscp-based
  random-detect dscp 0 32 64 1
  queue-limit 128 packets
policy-map QDO_2048K_7_0_33_0_8_2_49
 class class-default
  shape average 2048000
  service-policy QPO_2048K_7_0_33_0_8_2_49
policy-map QPO_10000K_BBrasil_NAC_IACC_V1
 class TEMPO_REAL_NAC
  priority level 1
  police cir percent 32 conform-action transmit  exceed-action drop 
 class MISSAO_CRITICA_NAC
  bandwidth remaining percent 63 
  random-detect dscp-based
  random-detect dscp 32 112 240 1
  random-detect dscp 34 112 240 1
  random-detect dscp 38 112 240 1
  queue-limit 480 packets
 class GERENCIAMENTO_NAC
  bandwidth remaining percent 3 
  random-detect dscp-based
  random-detect dscp 24 14 30 1
  random-detect dscp 26 14 30 1
  random-detect dscp 30 14 30 1
  queue-limit 60 packets
 class NETWORK_CONTROL_NAC
  bandwidth remaining percent 2 
  random-detect dscp-based
  random-detect dscp 48 12 20 1
  queue-limit 40 packets
 class STANDARD_NAC
  bandwidth remaining percent 32 
  random-detect dscp-based
  random-detect dscp 0 112 240 1
  queue-limit 480 packets
policy-map QDO_10000K_BBrasil_NAC_IACC_V1
 class class-default
  shape average 10000000
  service-policy QPO_10000K_BBrasil_NAC_IACC_V1
policy-map QPI_2048K_13_N_25_11_0_0_2_1
 class Voz_Q6
  police cir percent 13 conform-action transmit  exceed-action drop 
 class Video_Q6
  police cir percent 25 conform-action set-mpls-exp-imposition-transmit 5 exceed-action drop 
 class MissaoCritica_Q6
  police cir percent 11 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
 class class-default
  set mpls experimental topmost 0
policy-map QPO_1024K_10_24_20_0_40_2_3
 class Voz_Q6
  priority level 1
  police cir percent 10 conform-action transmit  exceed-action drop 
 class Video_Q6
  priority level 2
  police cir percent 24 conform-action transmit  exceed-action drop 
 class MissaoCritica_Q6
  bandwidth percent 20 
  random-detect dscp-based
  random-detect dscp 24 12 20 1
  random-detect dscp 26 12 20 1
  random-detect dscp 28 12 20 1
  random-detect dscp 30 12 20 1
  queue-limit 40 packets
 class Bulk_Q6
  bandwidth percent 40 
  random-detect dscp-based
  random-detect dscp 8 24 40 1
  random-detect dscp 10 24 40 1
  random-detect dscp 12 24 40 1
  random-detect dscp 14 24 40 1
  random-detect dscp 32 24 40 1
  queue-limit 80 packets
 class NetworkControl_Q6
  bandwidth percent 2 
  queue-limit 18 packets
 class class-default
  bandwidth percent 3 
  random-detect dscp-based
  random-detect dscp 0 5 13 1
  queue-limit 26 packets
policy-map QDO_1024K_10_24_20_0_40_2_3
 class class-default
  shape average 1024000
  service-policy QPO_1024K_10_24_20_0_40_2_3
policy-map QPO_BBONE_2600_V1
 class class-default
  shape average 2600000 31200
policy-map QPO_12000K_40_0_35_0_0_1_21
 class Voz_Q6
  priority level 1
  police cir percent 40 conform-action transmit  exceed-action drop 
 class MissaoCritica_Q6
  bandwidth percent 35 
  random-detect dscp-based
  random-detect dscp 24 224 480 1
  random-detect dscp 26 224 480 1
  random-detect dscp 28 224 480 1
  random-detect dscp 30 224 480 1
  queue-limit 960 packets
 class NetworkControl_Q6
  bandwidth percent 1 
  queue-limit 40 packets
 class class-default
  bandwidth percent 21 
  random-detect dscp-based
  random-detect dscp 0 112 240 1
  queue-limit 480 packets
policy-map QPO_2048K_13_25_11_0_0_1_1
 class Voz_Q6
  priority level 1
  police cir percent 13 conform-action transmit  exceed-action drop 
 class Video_Q6
  priority level 2
  police cir percent 25 conform-action transmit  exceed-action drop 
 class MissaoCritica_Q6
  bandwidth percent 11 
  random-detect dscp-based
  random-detect dscp 24 24 40 1
  random-detect dscp 26 24 40 1
  random-detect dscp 28 24 40 1
  random-detect dscp 30 24 40 1
  queue-limit 80 packets
 class NetworkControl_Q6
  bandwidth percent 1 
  queue-limit 40 packets
 class class-default
  bandwidth percent 1 
  random-detect dscp-based
  random-detect dscp 0 12 20 1
  queue-limit 40 packets
policy-map QPI_1024K_11_N_0_50_13_13_2_10
 class Voz_Q6
  police cir percent 11 conform-action transmit  exceed-action drop 
 class MissaoCritica_Q6
  police cir percent 50 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
 class Interativa_Q6
  police cir percent 13 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
 class Bulk_Q6
  police cir percent 13 conform-action set-mpls-exp-imposition-transmit 4 exceed-action set-mpls-exp-imposition-transmit 1
 class class-default
  set mpls experimental topmost 0
policy-map QPO_2048K_15_0_50_20_5_2_7
 class Voz_Q6
  priority level 1
  police cir percent 15 conform-action transmit  exceed-action drop 
 class MissaoCritica_Q6
  bandwidth percent 50 
  random-detect dscp-based
  random-detect dscp 24 56 120 1
  random-detect dscp 26 56 120 1
  random-detect dscp 28 56 120 1
  random-detect dscp 30 56 120 1
  queue-limit 240 packets
 class Interativa_Q6
  bandwidth percent 20 
  random-detect dscp-based
  random-detect dscp 18 24 40 1
  random-detect dscp 20 24 40 1
  random-detect dscp 22 24 40 1
  queue-limit 80 packets
 class Bulk_Q6
  bandwidth percent 5 
  random-detect dscp-based
  random-detect dscp 8 7 15 1
  random-detect dscp 10 7 15 1
  random-detect dscp 12 7 15 1
  random-detect dscp 14 7 15 1
  random-detect dscp 32 7 15 1
  queue-limit 30 packets
 class NetworkControl_Q6
  bandwidth percent 2 
  queue-limit 26 packets
 class class-default
  bandwidth percent 7 
  random-detect dscp-based
  random-detect dscp 0 12 20 1
  queue-limit 40 packets
policy-map QPI_1024K_20_N_20_20_0_10_1_25
 class Voz_Q6
  police cir percent 20 conform-action transmit  exceed-action drop 
 class Video_Q6
  police cir percent 20 conform-action set-mpls-exp-imposition-transmit 5 exceed-action drop 
 class MissaoCritica_Q6
  police cir percent 20 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
 class Bulk_Q6
  police cir percent 10 conform-action set-mpls-exp-imposition-transmit 4 exceed-action set-mpls-exp-imposition-transmit 1
 class class-default
  set mpls experimental topmost 0
policy-map QPI_16000K_0_N_19_0_0_0_1_78
 class Video_Q6
  police cir percent 19 conform-action set-mpls-exp-imposition-transmit 5 exceed-action drop 
 class class-default
  set mpls experimental topmost 0
policy-map QDI_16000K_0_19_0_0_0_1_78
 class class-default
  police rate 16000000  conform-action transmit  exceed-action drop 
  service-policy QPI_16000K_0_N_19_0_0_0_1_78
policy-map QPI_BBONE_S_50000_V1
 class class-default
  police 50000000 conform-action set-dscp-transmit default exceed-action drop 
policy-map QPO_1024K_16_0_0_0_0_2_80
 class Voz_Q6
  priority level 1
  police cir percent 16 conform-action transmit  exceed-action drop 
 class NetworkControl_Q6
  bandwidth percent 2 
  queue-limit 18 packets
 class class-default
  bandwidth percent 80 
  random-detect dscp-based
  random-detect dscp 0 32 64 1
  queue-limit 128 packets
policy-map QPI_BBONE_N_16000_V1
 class class-default
  police 16000000 conform-action set-mpls-exp-imposition-transmit 0 exceed-action drop 
policy-map QPI_1024K_22_N_0_36_22_0_2_17
 class Voz_Q6
  police cir percent 22 conform-action transmit  exceed-action drop 
 class MissaoCritica_Q6
  police cir percent 36 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
 class Interativa_Q6
  police cir percent 22 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
 class class-default
  set mpls experimental topmost 0
policy-map QPI_BBONE_N_1024_V1
 class class-default
  police 1024000 conform-action set-mpls-exp-imposition-transmit 0 exceed-action drop 
policy-map QPI_BBONE_S_200000_V1
 class class-default
  police 200000000 conform-action set-dscp-transmit default exceed-action drop 
policy-map QPO_4096K_25_0_0_0_0_1_71
 class Voz_Q6
  priority level 1
  police cir percent 25 conform-action transmit  exceed-action drop 
 class NetworkControl_Q6
  bandwidth percent 1 
  queue-limit 30 packets
 class class-default
  bandwidth percent 71 
  random-detect dscp-based
  random-detect dscp 0 112 240 1
  queue-limit 480 packets
policy-map QDI_2048K_13_25_11_0_0_2_1
 class class-default
  police rate 2048000  conform-action transmit  exceed-action drop 
  service-policy QPI_2048K_13_N_25_11_0_0_2_1
policy-map QDO_4096K_6_0_0_0_0_1_91
 class class-default
  shape average 4096000
  service-policy QPO_4096K_6_0_0_0_0_1_91
policy-map QPO_8000K_13_6_57_19_0_1_1
 class Voz_Q6
  priority level 1
  police cir percent 13 conform-action transmit  exceed-action drop 
 class Video_Q6
  priority level 2
  police cir percent 6 conform-action transmit  exceed-action drop 
 class MissaoCritica_Q6
  bandwidth percent 57 
  random-detect dscp-based
  random-detect dscp 24 224 480 1
  random-detect dscp 26 224 480 1
  random-detect dscp 28 224 480 1
  random-detect dscp 30 224 480 1
  queue-limit 960 packets
 class Interativa_Q6
  bandwidth percent 19 
  random-detect dscp-based
  random-detect dscp 18 56 120 1
  random-detect dscp 20 56 120 1
  random-detect dscp 22 56 120 1
  queue-limit 240 packets
 class NetworkControl_Q6
  bandwidth percent 1 
  queue-limit 30 packets
 class class-default
  bandwidth percent 1 
  random-detect dscp-based
  random-detect dscp 0 7 15 1
  queue-limit 30 packets
policy-map QDO_8000K_13_6_57_19_0_1_1
 class class-default
  shape average 8000000
  service-policy QPO_8000K_13_6_57_19_0_1_1
policy-map QOS_DTS_IN_2048K_64K_0K
 class class-default
  police rate 2048000  conform-action transmit  exceed-action drop 
  service-policy QOS_POLICY_IN_4P_0P
policy-map QPI_BBONE_DSCP_V1
 class class-default
  set dscp default
policy-map QPI_256K_25_N_0_4_0_0_7_63
 class Voz_Q6
  police cir percent 25 conform-action transmit  exceed-action drop 
 class MissaoCritica_Q6
  police cir percent 4 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
 class class-default
  set mpls experimental topmost 0
policy-map QPI_512K_BBrasil_NAC_IPSAN_IACC_V1
 class TEMPO_REAL_NAC
  police cir percent 21 conform-action transmit  exceed-action drop 
 class MISSAO_CRITICA_NAC
  police cir percent 40 conform-action transmit  exceed-action set-dscp-transmit af43
 class GERENCIAMENTO_NAC
  police cir percent 15 conform-action transmit  exceed-action set-dscp-transmit af33
 class NETWORK_CONTROL_NAC
  police cir percent 3 conform-action transmit  exceed-action set-dscp-transmit cs6
 class STANDARD_NAC
  police cir percent 20 conform-action transmit  exceed-action set-dscp-transmit default
policy-map QDI_512K_BBrasil_NAC_IPSAN_IACC_V1
 class class-default
  police rate 512000  conform-action transmit  exceed-action drop 
  service-policy QPI_512K_BBrasil_NAC_IPSAN_IACC_V1
policy-map QPI_BBONE_S_10240_V1
 class class-default
  police 10240000 conform-action set-dscp-transmit default exceed-action drop 
policy-map QPI_2048K_15_N_0_50_20_5_2_7
 class Voz_Q6
  police cir percent 15 conform-action transmit  exceed-action drop 
 class MissaoCritica_Q6
  police cir percent 50 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
 class Interativa_Q6
  police cir percent 20 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
 class Bulk_Q6
  police cir percent 5 conform-action set-mpls-exp-imposition-transmit 4 exceed-action set-mpls-exp-imposition-transmit 1
 class class-default
  set mpls experimental topmost 0
policy-map QPO_BBONE_2048_V1
 class class-default
  shape average 2048000 24576
policy-map QPI_4096K_4_N_19_2_50_0_2_22
 class Voz_Q6
  police cir percent 4 conform-action transmit  exceed-action drop 
 class Video_Q6
  police cir percent 19 conform-action set-mpls-exp-imposition-transmit 5 exceed-action drop 
 class MissaoCritica_Q6
  police cir percent 2 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
 class Interativa_Q6
  police cir percent 50 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
 class class-default
  set mpls experimental topmost 0
policy-map QPO_1024K_BBrasil_NAC_IPSAN_IACC_V1
 class TEMPO_REAL_NAC
  priority level 1
  police cir percent 25 conform-action transmit  exceed-action drop 
 class MISSAO_CRITICA_NAC
  bandwidth remaining percent 56 
  random-detect dscp-based
  random-detect dscp 32 24 40 1
  random-detect dscp 34 24 40 1
  random-detect dscp 38 24 40 1
  queue-limit 80 packets
  police cir 1024000 conform-action set-dscp-transmit af31 exceed-action set-dscp-transmit af33 violate-action drop 
 class GERENCIAMENTO_NAC
  bandwidth remaining percent 14 
  random-detect dscp-based
  random-detect dscp 24 7 15 1
  random-detect dscp 26 7 15 1
  random-detect dscp 30 7 15 1
  police cir 1024000 conform-action set-dscp-transmit af11 exceed-action set-dscp-transmit af13 violate-action drop 
  queue-limit 30 packets
 class NETWORK_CONTROL_NAC
  bandwidth remaining percent 3 
  random-detect dscp-based
  random-detect dscp 48 5 9 1
  queue-limit 18 packets
 class STANDARD_NAC
  bandwidth remaining percent 27 
  random-detect dscp-based
  random-detect dscp 0 12 20 1
  queue-limit 40 packets
  police cir 1024000 conform-action set-dscp-transmit af21 exceed-action set-dscp-transmit af23 violate-action drop 
policy-map QPI_8000K_2_N_47_26_0_0_1_23
 class Voz_Q6
  police cir percent 2 conform-action transmit  exceed-action drop 
 class Video_Q6
  police cir percent 47 conform-action set-mpls-exp-imposition-transmit 5 exceed-action drop 
 class MissaoCritica_Q6
  police cir percent 26 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
 class class-default
  set mpls experimental topmost 0
policy-map QPO_512K_11_0_33_25_16_4_8
 class Voz_Q6
  priority level 1
  police cir percent 11 conform-action transmit  exceed-action drop 
 class MissaoCritica_Q6
  bandwidth percent 33 
  random-detect dscp-based
  random-detect dscp 24 12 20 1
  random-detect dscp 26 12 20 1
  random-detect dscp 28 12 20 1
  random-detect dscp 30 12 20 1
  queue-limit 40 packets
 class Interativa_Q6
  bandwidth percent 25 
  random-detect dscp-based
  random-detect dscp 18 12 20 1
  random-detect dscp 20 12 20 1
  random-detect dscp 22 12 20 1
  queue-limit 40 packets
 class Bulk_Q6
  bandwidth percent 16 
  random-detect dscp-based
  random-detect dscp 8 7 15 1
  random-detect dscp 10 7 15 1
  random-detect dscp 12 7 15 1
  random-detect dscp 14 7 15 1
  random-detect dscp 32 7 15 1
  queue-limit 30 packets
 class NetworkControl_Q6
  bandwidth percent 4 
  queue-limit 18 packets
 class class-default
  bandwidth percent 8 
  random-detect dscp-based
  random-detect dscp 0 5 13 1
  queue-limit 26 packets
policy-map QPI_8000K_13_N_6_57_19_0_1_1
 class Voz_Q6
  police cir percent 13 conform-action transmit  exceed-action drop 
 class Video_Q6
  police cir percent 6 conform-action set-mpls-exp-imposition-transmit 5 exceed-action drop 
 class MissaoCritica_Q6
  police cir percent 57 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
 class Interativa_Q6
  police cir percent 19 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
 class class-default
  set mpls experimental topmost 0
policy-map QDO_4096K_4_0_2_50_0_1_41
 class class-default
  shape average 4096000
  service-policy QPO_4096K_4_0_2_50_0_1_41
policy-map QDO_4096K_13_37_31_0_16_1_1
 class class-default
  shape average 4096000
  service-policy QPO_4096K_13_37_31_0_16_1_1
policy-map QDI_VIPSIP_VOZ_400_V1
 class class-default
  police rate 400000  conform-action transmit  exceed-action drop 
policy-map QPO_6000K_11_31_36_0_0_1_20
 class Voz_Q6
  priority level 1
  police cir percent 11 conform-action transmit  exceed-action drop 
 class Video_Q6
  priority level 2
  police cir percent 31 conform-action transmit  exceed-action drop 
 class MissaoCritica_Q6
  bandwidth percent 36 
  random-detect dscp-based
  random-detect dscp 24 112 240 1
  random-detect dscp 26 112 240 1
  random-detect dscp 28 112 240 1
  random-detect dscp 30 112 240 1
  queue-limit 480 packets
 class NetworkControl_Q6
  bandwidth percent 1 
  queue-limit 30 packets
 class class-default
  bandwidth percent 20 
  random-detect dscp-based
  random-detect dscp 0 56 120 1
  queue-limit 240 packets
policy-map QDO_6000K_11_31_36_0_0_1_20
 class class-default
  shape average 6000000
  service-policy QPO_6000K_11_31_36_0_0_1_20
policy-map QDI_2048K_13_38_23_0_0_2_23
 class class-default
  police rate 2048000  conform-action transmit  exceed-action drop 
  service-policy QPI_2048K_13_N_38_23_0_0_2_23
policy-map QDO_VIPSIP_VOZ_400_V1
 class class-default
  shape average 400000
  service-policy QPO_VIPSIP_VOZ_400_V1
policy-map QPO_1024K_7_0_48_19_12_4_9
 class Voz_Q6
  priority level 1
  police cir percent 7 conform-action transmit  exceed-action drop 
 class MissaoCritica_Q6
  bandwidth percent 48 
  random-detect dscp-based
  random-detect dscp 24 24 40 1
  random-detect dscp 26 24 40 1
  random-detect dscp 28 24 40 1
  random-detect dscp 30 24 40 1
  queue-limit 80 packets
 class Interativa_Q6
  bandwidth percent 19 
  random-detect dscp-based
  random-detect dscp 18 12 20 1
  random-detect dscp 20 12 20 1
  random-detect dscp 22 12 20 1
  queue-limit 40 packets
 class Bulk_Q6
  bandwidth percent 12 
  random-detect dscp-based
  random-detect dscp 8 7 15 1
  random-detect dscp 10 7 15 1
  random-detect dscp 12 7 15 1
  random-detect dscp 14 7 15 1
  random-detect dscp 32 7 15 1
  queue-limit 30 packets
 class NetworkControl_Q6
  bandwidth percent 4 
  queue-limit 26 packets
 class class-default
  bandwidth percent 9 
  random-detect dscp-based
  random-detect dscp 0 7 15 1
  queue-limit 30 packets
policy-map QDO_256K_25_0_4_0_0_7_63
 class class-default
  shape average 256000
  service-policy QPO_256K_25_0_4_0_0_7_63
policy-map QDI_VIPSIP_VOZ_1200_V1
 class class-default
  police rate 1200000  conform-action transmit  exceed-action drop 
policy-map QPO_8000K_2_47_26_0_0_1_23
 class Voz_Q6
  priority level 1
  police cir percent 2 conform-action transmit  exceed-action drop 
 class Video_Q6
  priority level 2
  police cir percent 47 conform-action transmit  exceed-action drop 
 class MissaoCritica_Q6
  bandwidth percent 26 
  random-detect dscp-based
  random-detect dscp 24 112 240 1
  random-detect dscp 26 112 240 1
  random-detect dscp 28 112 240 1
  random-detect dscp 30 112 240 1
  queue-limit 480 packets
 class NetworkControl_Q6
  bandwidth percent 1 
  queue-limit 30 packets
 class class-default
  bandwidth percent 23 
  random-detect dscp-based
  random-detect dscp 0 56 120 1
  queue-limit 240 packets
policy-map QPI_10000K_10_N_20_26_0_0_1_40
 class Voz_Q6
  police cir percent 10 conform-action transmit  exceed-action drop 
 class Video_Q6
  police cir percent 20 conform-action set-mpls-exp-imposition-transmit 5 exceed-action drop 
 class MissaoCritica_Q6
  police cir percent 26 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
 class class-default
  set mpls experimental topmost 0
policy-map QPO_512K_25_0_60_0_0_4_10
 class Voz_Q6
  priority level 1
  police cir percent 25 conform-action transmit  exceed-action drop 
 class MissaoCritica_Q6
  bandwidth percent 60 
  random-detect dscp-based
  random-detect dscp 24 14 30 1
  random-detect dscp 26 14 30 1
  random-detect dscp 28 14 30 1
  random-detect dscp 30 14 30 1
  queue-limit 60 packets
 class NetworkControl_Q6
  bandwidth percent 4 
  queue-limit 18 packets
 class class-default
  bandwidth percent 10 
  random-detect dscp-based
  random-detect dscp 0 5 13 1
  queue-limit 26 packets
policy-map QDO_512K_25_0_60_0_0_4_10
 class class-default
  shape average 512000
  service-policy QPO_512K_25_0_60_0_0_4_10
policy-map QPI_30000K_16_N_15_10_25_0_1_30
 class Voz_Q6
  police cir percent 16 conform-action transmit  exceed-action drop 
 class Video_Q6
  police cir percent 15 conform-action set-mpls-exp-imposition-transmit 5 exceed-action drop 
 class MissaoCritica_Q6
  police cir percent 10 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
 class Interativa_Q6
  police cir percent 25 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
 class class-default
  set mpls experimental topmost 0
policy-map QDI_30000K_16_15_10_25_0_1_30
 class class-default
  police rate 30000000  conform-action transmit  exceed-action drop 
  service-policy QPI_30000K_16_N_15_10_25_0_1_30
policy-map QPO_34000K_2_7_0_0_0_2_88
 class Voz_Q6
  priority level 1
  police cir percent 2 conform-action transmit  exceed-action drop 
 class Video_Q6
  priority level 2
  police cir percent 7 conform-action transmit  exceed-action drop 
 class NetworkControl_Q6
  bandwidth percent 2 
  queue-limit 96 packets
 class class-default
  bandwidth percent 88 
  random-detect dscp-based
  random-detect dscp 0 388 900 1
  queue-limit 1800 packets
policy-map SAIDA_DCN_GERL3_EBT_CLARO
 class class-default
  shape average 10000000
policy-map QPI_2048K_41_N_0_35_0_0_2_21
 class Voz_Q6
  police cir percent 41 conform-action transmit  exceed-action drop 
 class MissaoCritica_Q6
  police cir percent 35 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
 class class-default
  set mpls experimental topmost 0
policy-map QDI_2048K_41_0_35_0_0_2_21
 class class-default
  police rate 2048000  conform-action transmit  exceed-action drop 
  service-policy QPI_2048K_41_N_0_35_0_0_2_21
policy-map QPO_1024K_4_0_52_0_0_2_29
 class Voz_Q6
  priority level 1
  police cir percent 4 conform-action transmit  exceed-action drop 
 class MissaoCritica_Q6
  bandwidth percent 52 
  random-detect dscp-based
  random-detect dscp 24 32 48 1
  random-detect dscp 26 32 48 1
  random-detect dscp 28 32 48 1
  random-detect dscp 30 32 48 1
  queue-limit 96 packets
 class NetworkControl_Q6
  bandwidth percent 2 
  queue-limit 26 packets
 class class-default
  bandwidth percent 29 
  random-detect dscp-based
  random-detect dscp 0 14 30 1
  queue-limit 60 packets
policy-map QPI_4096K_8_N_0_0_0_0_1_89
 class Voz_Q6
  police cir percent 8 conform-action transmit  exceed-action drop 
 class class-default
  set mpls experimental topmost 0
policy-map QDI_4096K_8_0_0_0_0_1_89
 class class-default
  police rate 4096000  conform-action transmit  exceed-action drop 
  service-policy QPI_4096K_8_N_0_0_0_0_1_89
policy-map QPI_16000K_40_N_0_35_0_0_1_21
 class Voz_Q6
  police cir percent 40 conform-action transmit  exceed-action drop 
 class MissaoCritica_Q6
  police cir percent 35 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
 class class-default
  set mpls experimental topmost 0
policy-map QDI_16000K_40_0_35_0_0_1_21
 class class-default
  police rate 16000000  conform-action transmit  exceed-action drop 
  service-policy QPI_16000K_40_N_0_35_0_0_1_21
policy-map QPI_BBONE_S_10000_V1
 class class-default
  police 10000000 conform-action set-dscp-transmit default exceed-action drop 
policy-map QDI_4096K_4_0_2_50_0_1_41
 class class-default
  police rate 4096000  conform-action transmit  exceed-action drop 
  service-policy QPI_4096K_4_N_0_2_50_0_1_41
policy-map QDI_2048K_0_0_70_26_0_2_1
 class class-default
  police rate 2048000  conform-action transmit  exceed-action drop 
  service-policy QPI_2048K_0_N_0_70_26_0_2_1
policy-map QPI_BBONE_S_400000_V1
 class class-default
  police 400000000 conform-action set-dscp-transmit default exceed-action drop 
policy-map QPI_12000K_13_N_38_21_7_13_1_6
 class Voz_Q6
  police cir percent 13 conform-action transmit  exceed-action drop 
 class Video_Q6
  police cir percent 38 conform-action set-mpls-exp-imposition-transmit 5 exceed-action drop 
 class MissaoCritica_Q6
  police cir percent 21 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
 class Interativa_Q6
  police cir percent 7 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
 class Bulk_Q6
  police cir percent 13 conform-action set-mpls-exp-imposition-transmit 4 exceed-action set-mpls-exp-imposition-transmit 1
 class class-default
  set mpls experimental topmost 0
policy-map QDI_12000K_13_38_21_7_13_1_6
 class class-default
  police rate 12000000  conform-action transmit  exceed-action drop 
  service-policy QPI_12000K_13_N_38_21_7_13_1_6
policy-map QPI_BBONE_N_128_V1
 class class-default
  police 128000 conform-action set-mpls-exp-imposition-transmit 0 exceed-action drop 
policy-map QPO_16000K_11_34_0_0_0_1_53
 class Voz_Q6
  priority level 1
  police cir percent 11 conform-action transmit  exceed-action drop 
 class Video_Q6
  priority level 2
  police cir percent 34 conform-action transmit  exceed-action drop 
 class NetworkControl_Q6
  bandwidth percent 1 
  queue-limit 40 packets
 class class-default
  bandwidth percent 53 
  random-detect dscp-based
  random-detect dscp 0 344 600 1
  queue-limit 1200 packets
policy-map QPO_BBONE_95000_V1
 class class-default
  shape average 95000000 1140000
policy-map QPO_2048K_BBrasil_NAC_IPSAN_IACC_V1
 class TEMPO_REAL_NAC
  priority level 1
  police cir percent 30 conform-action transmit  exceed-action drop 
 class MISSAO_CRITICA_NAC
  bandwidth remaining percent 60 
  random-detect dscp-based
  random-detect dscp 32 32 64 1
  random-detect dscp 34 32 64 1
  random-detect dscp 38 32 64 1
  queue-limit 128 packets
  police cir 2048000 conform-action set-dscp-transmit af31 exceed-action set-dscp-transmit af33 violate-action drop 
 class GERENCIAMENTO_NAC
  bandwidth remaining percent 7 
  random-detect dscp-based
  random-detect dscp 24 7 15 1
  random-detect dscp 26 7 15 1
  random-detect dscp 30 7 15 1
  queue-limit 30 packets
  police cir 2048000 conform-action set-dscp-transmit af11 exceed-action set-dscp-transmit af13 violate-action drop 
 class NETWORK_CONTROL_NAC
  bandwidth remaining percent 3 
  random-detect dscp-based
  random-detect dscp 48 5 13 1
  queue-limit 26 packets
 class STANDARD_NAC
  bandwidth remaining percent 28 
  random-detect dscp-based
  random-detect dscp 0 24 40 1
  queue-limit 80 packets
  police cir 2048000 conform-action set-dscp-transmit af21 exceed-action set-dscp-transmit af23 violate-action drop 
policy-map QPI_2048K_3_N_0_1_0_0_2_93
 class Voz_Q6
  police cir percent 3 conform-action transmit  exceed-action drop 
 class MissaoCritica_Q6
  police cir percent 1 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
 class class-default
  set mpls experimental topmost 0
policy-map QDI_2048K_3_0_1_0_0_2_93
 class class-default
  police rate 2048000  conform-action transmit  exceed-action drop 
  service-policy QPI_2048K_3_N_0_1_0_0_2_93
policy-map PM_V10_QPO_BBONE_50000_V1
policy-map QPO_10000K_30_0_20_10_30_1_5
 class Voz_Q6
  priority level 1
  police cir percent 30 conform-action transmit  exceed-action drop 
 class MissaoCritica_Q6
  bandwidth percent 20 
  random-detect dscp-based
  random-detect dscp 24 112 240 1
  random-detect dscp 26 112 240 1
  random-detect dscp 28 112 240 1
  random-detect dscp 30 112 240 1
  queue-limit 480 packets
 class Interativa_Q6
  bandwidth percent 10 
  random-detect dscp-based
  random-detect dscp 18 56 120 1
  random-detect dscp 20 56 120 1
  random-detect dscp 22 56 120 1
  queue-limit 240 packets
 class Bulk_Q6
  bandwidth percent 30 
  random-detect dscp-based
  random-detect dscp 8 112 240 1
  random-detect dscp 10 112 240 1
  random-detect dscp 12 112 240 1
  random-detect dscp 14 112 240 1
  random-detect dscp 32 112 240 1
  queue-limit 480 packets
 class NetworkControl_Q6
  bandwidth percent 1 
  queue-limit 40 packets
 class class-default
  bandwidth percent 5 
  random-detect dscp-based
  random-detect dscp 0 32 48 1
  queue-limit 96 packets
policy-map QDO_10000K_30_0_20_10_30_1_5
 class class-default
  shape average 10000000
  service-policy QPO_10000K_30_0_20_10_30_1_5
policy-map QPI_BBONE_N_10000_V1
 class class-default
  police 10000000 conform-action set-mpls-exp-imposition-transmit 0 exceed-action drop 
policy-map QPI_2048K_6_N_0_15_23_37_2_16
 class Voz_Q6
  police cir percent 6 conform-action transmit  exceed-action drop 
 class MissaoCritica_Q6
  police cir percent 15 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
 class Interativa_Q6
  police cir percent 23 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
 class Bulk_Q6
  police cir percent 37 conform-action set-mpls-exp-imposition-transmit 4 exceed-action set-mpls-exp-imposition-transmit 1
 class class-default
  set mpls experimental topmost 0
policy-map QPO_VIPSIP_VOZ_18200_V1
 class Voz_Q6
  priority
  police rate 18136000  conform-action transmit  exceed-action drop 
 class NetworkControl_Q6
  bandwidth 64
  queue-limit 32 packets
policy-map QPI_2048K_15_N_0_0_0_0_2_81
 class Voz_Q6
  police cir percent 15 conform-action transmit  exceed-action drop 
 class class-default
  set mpls experimental topmost 0
policy-map QDI_2048K_15_0_0_0_0_2_81
 class class-default
  police rate 2048000  conform-action transmit  exceed-action drop 
  service-policy QPI_2048K_15_N_0_0_0_0_2_81
policy-map QPO_BBONE_500000_V1
 class class-default
  shape average 500000000 6000000
policy-map QPO_2048K_15_0_0_0_0_2_81
 class Voz_Q6
  priority level 1
  police cir percent 15 conform-action transmit  exceed-action drop 
 class NetworkControl_Q6
  bandwidth percent 2 
  queue-limit 26 packets
 class class-default
  bandwidth percent 81 
  random-detect dscp-based
  random-detect dscp 0 56 120 1
  queue-limit 240 packets
policy-map QPI_4096K_4_N_0_2_50_0_2_41
 class Voz_Q6
  police cir percent 4 conform-action transmit  exceed-action drop 
 class MissaoCritica_Q6
  police cir percent 2 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
 class Interativa_Q6
  police cir percent 50 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
 class class-default
  set mpls experimental topmost 0
policy-map QDI_4096K_4_0_2_50_0_2_41
 class class-default
  police rate 4096000  conform-action transmit  exceed-action drop 
  service-policy QPI_4096K_4_N_0_2_50_0_2_41
policy-map QPI_6000K_11_N_31_36_0_0_1_20
 class Voz_Q6
  police cir percent 11 conform-action transmit  exceed-action drop 
 class Video_Q6
  police cir percent 31 conform-action set-mpls-exp-imposition-transmit 5 exceed-action drop 
 class MissaoCritica_Q6
  police cir percent 36 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
 class class-default
  set mpls experimental topmost 0
policy-map QDI_6000K_11_31_36_0_0_1_20
 class class-default
  police rate 6000000  conform-action transmit  exceed-action drop 
  service-policy QPI_6000K_11_N_31_36_0_0_1_20
policy-map QPI_1024K_16_N_0_0_0_0_2_80
 class Voz_Q6
  police cir percent 16 conform-action transmit  exceed-action drop 
 class class-default
  set mpls experimental topmost 0
policy-map QDI_1024K_16_0_0_0_0_2_80
 class class-default
  police rate 1024000  conform-action transmit  exceed-action drop 
  service-policy QPI_1024K_16_N_0_0_0_0_2_80
policy-map QPI_1024K_BBrasil_NAC_IPSAN_IACC_V1
 class TEMPO_REAL_NAC
  police cir percent 25 conform-action transmit  exceed-action drop 
 class MISSAO_CRITICA_NAC
  police cir percent 40 conform-action transmit  exceed-action set-dscp-transmit af43
 class GERENCIAMENTO_NAC
  police cir percent 10 conform-action transmit  exceed-action set-dscp-transmit af33
 class NETWORK_CONTROL_NAC
  police cir percent 2 conform-action transmit  exceed-action set-dscp-transmit cs6
 class STANDARD_NAC
  police cir percent 20 conform-action transmit  exceed-action set-dscp-transmit default
policy-map QPI_SERPRO_1024K_V1
 class Voz_SERPRO
  police cir percent 10 conform-action transmit  exceed-action drop 
 class Video_SERPRO
  police cir percent 30 conform-action transmit  exceed-action drop 
 class MissaoCritica_SERPRO
  police cir percent 10 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
 class Interativa_SERPRO
  police cir percent 30 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
 class class-default
  set mpls experimental imposition 0
policy-map QDI_SERPRO_1024K_V1
 class class-default
  police rate 1024000  conform-action transmit  exceed-action drop 
  service-policy QPI_SERPRO_1024K_V1
policy-map QPI_256K_40_N_0_4_0_0_7_48
 class Voz_Q6
  police cir percent 40 conform-action transmit  exceed-action drop 
 class MissaoCritica_Q6
  police cir percent 4 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
 class class-default
  set mpls experimental topmost 0
policy-map QPO_512K_25_0_55_0_0_4_15
 class Voz_Q6
  priority level 1
  police cir percent 25 conform-action transmit  exceed-action drop 
 class MissaoCritica_Q6
  bandwidth percent 55 
  random-detect dscp-based
  random-detect dscp 24 14 30 1
  random-detect dscp 26 14 30 1
  random-detect dscp 28 14 30 1
  random-detect dscp 30 14 30 1
  queue-limit 60 packets
 class NetworkControl_Q6
  bandwidth percent 4 
  queue-limit 18 packets
 class class-default
  bandwidth percent 15 
  random-detect dscp-based
  random-detect dscp 0 7 15 1
  queue-limit 30 packets
policy-map QDO_1024K_7_0_50_0_0_2_40
 class class-default
  shape average 1024000
  service-policy QPO_1024K_7_0_50_0_0_2_40
policy-map QPI_2048K_4_N_0_0_0_0_2_93
 class Voz_Q6
  police cir percent 4 conform-action transmit  exceed-action drop 
 class class-default
  set mpls experimental topmost 0
policy-map QPI_34000K_2_N_7_0_0_0_2_88
 class Voz_Q6
  police cir percent 2 conform-action transmit  exceed-action drop 
 class Video_Q6
  police cir percent 7 conform-action set-mpls-exp-imposition-transmit 5 exceed-action drop 
 class class-default
  set mpls experimental topmost 0
policy-map QDI_34000K_2_7_0_0_0_2_88
 class class-default
  police rate 34000000  conform-action transmit  exceed-action drop 
  service-policy QPI_34000K_2_N_7_0_0_0_2_88
policy-map QPI_BBONE_N_4096_V1
 class class-default
  police 4096000 conform-action set-mpls-exp-imposition-transmit 0 exceed-action drop 
policy-map QDO_1024K_4_0_52_0_0_2_29
 class class-default
  shape average 1024000
  service-policy QPO_1024K_4_0_52_0_0_2_29
policy-map QPO_10000K_2_0_10_20_0_2_65
 class Voz_Q6
  priority level 1
  police cir percent 2 conform-action transmit  exceed-action drop 
 class MissaoCritica_Q6
  bandwidth percent 10 
  random-detect dscp-based
  random-detect dscp 24 32 64 1
  random-detect dscp 26 32 64 1
  random-detect dscp 28 32 64 1
  random-detect dscp 30 32 64 1
  queue-limit 128 packets
 class Interativa_Q6
  bandwidth percent 20 
  random-detect dscp-based
  random-detect dscp 18 56 120 1
  random-detect dscp 20 56 120 1
  random-detect dscp 22 56 120 1
  queue-limit 240 packets
 class NetworkControl_Q6
  bandwidth percent 2 
  queue-limit 40 packets
 class class-default
  bandwidth percent 65 
  random-detect dscp-based
  random-detect dscp 0 224 480 1
  queue-limit 960 packets
policy-map QDO_10000K_2_0_10_20_0_2_65
 class class-default
  shape average 10000000
  service-policy QPO_10000K_2_0_10_20_0_2_65
policy-map QPI_12000K_40_N_0_35_0_0_1_21
 class Voz_Q6
  police cir percent 40 conform-action transmit  exceed-action drop 
 class MissaoCritica_Q6
  police cir percent 35 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
 class class-default
  set mpls experimental topmost 0
policy-map QDI_12000K_40_0_35_0_0_1_21
 class class-default
  police rate 12000000  conform-action transmit  exceed-action drop 
  service-policy QPI_12000K_40_N_0_35_0_0_1_21
policy-map QPO_Correios_256K_ARPA_IOS_D_V1
 class REAL_TIME_CORREIOS
  priority level 1
  police cir percent 6 conform-action transmit  exceed-action drop 
 class MISSAO_CRITICA_CORREIOS
  bandwidth percent 40 
  random-detect dscp-based
  random-detect dscp 34 16 32 1
  random-detect dscp 36 16 32 1
  random-detect dscp 38 16 32 1
  queue-limit 64 packets
 class GERENCIAMENTO_CORREIOS
  bandwidth percent 9 
  random-detect dscp-based
  random-detect dscp 26 16 32 1
  random-detect dscp 28 16 32 1
  random-detect dscp 30 16 32 1
  queue-limit 64 packets
 class NETWORK_CONTROL_CORREIOS
  bandwidth percent 4 
  random-detect dscp-based
  random-detect dscp 16 16 32 1
  random-detect dscp 48 16 32 1
  random-detect dscp 56 16 32 1
  queue-limit 64 packets
 class BEST_EFFORT
  bandwidth percent 40 
  random-detect dscp-based
  random-detect dscp 0 16 32 1
  queue-limit 64 packets
policy-map QPI_10000K_30_C_0_20_10_30_1_5
 class Voz_Q6
  police cir percent 30 conform-action transmit  exceed-action drop 
 class MissaoCritica_Q6
  police cir percent 20 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
 class Interativa_Q6
  police cir percent 10 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
 class Bulk_Q6
  police cir percent 30 conform-action set-mpls-exp-imposition-transmit 4 exceed-action set-mpls-exp-imposition-transmit 1
 class class-default
  set mpls experimental topmost 0
policy-map QDI_10000K_30_0_20_10_30_1_5
 class class-default
  police rate 10000000  conform-action transmit  exceed-action drop 
  service-policy QPI_10000K_30_C_0_20_10_30_1_5
policy-map QPI_10000K_2_C_0_10_20_0_2_65
 class Voz_Q6
  police cir percent 2 conform-action transmit  exceed-action drop 
 class MissaoCritica_Q6
  police cir percent 10 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
 class Interativa_Q6
  police cir percent 20 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
 class class-default
  set mpls experimental topmost 0
policy-map QDI_10000K_2_0_10_20_0_2_65
 class class-default
  police rate 10000000  conform-action transmit  exceed-action drop 
  service-policy QPI_10000K_2_C_0_10_20_0_2_65
policy-map QDI_8000K_2_47_26_0_0_1_23
 class class-default
  police rate 8000000  conform-action transmit  exceed-action drop 
  service-policy QPI_8000K_2_N_47_26_0_0_1_23
policy-map QPO_1024K_20_20_20_0_10_1_25
 class Voz_Q6
  priority level 1
  police cir percent 20 conform-action transmit  exceed-action drop 
 class Video_Q6
  priority level 2
  police cir percent 20 conform-action transmit  exceed-action drop 
 class MissaoCritica_Q6
  bandwidth percent 20 
  random-detect dscp-based
  random-detect dscp 24 12 20 1
  random-detect dscp 26 12 20 1
  random-detect dscp 28 12 20 1
  random-detect dscp 30 12 20 1
  queue-limit 40 packets
 class Bulk_Q6
  bandwidth percent 10 
  random-detect dscp-based
  random-detect dscp 8 7 15 1
  random-detect dscp 10 7 15 1
  random-detect dscp 12 7 15 1
  random-detect dscp 14 7 15 1
  random-detect dscp 32 7 15 1
  queue-limit 30 packets
 class NetworkControl_Q6
  bandwidth percent 1 
  queue-limit 18 packets
 class class-default
  bandwidth percent 25 
  random-detect dscp-based
  random-detect dscp 0 14 30 1
  queue-limit 60 packets
policy-map QDO_1024K_16_0_0_0_0_2_80
 class class-default
  shape average 1024000
  service-policy QPO_1024K_16_0_0_0_0_2_80
policy-map QPI_40000K_10_N_0_60_0_0_1_26
 class Voz_Q6
  police cir percent 10 conform-action transmit  exceed-action drop 
 class MissaoCritica_Q6
  police cir percent 60 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
 class class-default
  set mpls experimental topmost 0
policy-map QPI_BBONE_N_5400_V1
 class class-default
  police 5400000 conform-action set-mpls-exp-imposition-transmit 0 exceed-action drop 
policy-map QPI_Correios_4096K_ARPA_IOS_DVV_V1
 class REAL_TIME_CORREIOS
  police cir percent 20 conform-action transmit  exceed-action drop 
 class MISSAO_CRITICA_CORREIOS
  police cir percent 40 conform-action transmit  exceed-action set-dscp-transmit af41
 class GERENCIAMENTO_CORREIOS
  police cir percent 9 conform-action transmit  exceed-action set-dscp-transmit af31
 class NETWORK_CONTROL_CORREIOS
  police cir percent 1 conform-action transmit  exceed-action set-dscp-transmit cs6
 class BEST_EFFORT
  police cir percent 29 conform-action transmit  exceed-action set-dscp-transmit default
policy-map QDI_Correios_4096K_ARPA_IOS_DVV_V1
 class class-default
  police cir 4096000 conform-action transmit  exceed-action drop 
  service-policy QPI_Correios_4096K_ARPA_IOS_DVV_V1
policy-map QDO_30000K_16_15_10_25_0_1_30
 class class-default
  shape average 30000000
  service-policy QPO_30000K_16_15_10_25_0_1_30
policy-map QPO_1024K_11_0_50_13_13_2_10
 class Voz_Q6
  priority level 1
  police cir percent 11 conform-action transmit  exceed-action drop 
 class MissaoCritica_Q6
  bandwidth percent 50 
  random-detect dscp-based
  random-detect dscp 24 32 48 1
  random-detect dscp 26 32 48 1
  random-detect dscp 28 32 48 1
  random-detect dscp 30 32 48 1
  queue-limit 96 packets
 class Interativa_Q6
  bandwidth percent 13 
  random-detect dscp-based
  random-detect dscp 18 12 20 1
  random-detect dscp 20 12 20 1
  random-detect dscp 22 12 20 1
  queue-limit 40 packets
 class Bulk_Q6
  bandwidth percent 13 
  random-detect dscp-based
  random-detect dscp 8 12 20 1
  random-detect dscp 10 12 20 1
  random-detect dscp 12 12 20 1
  random-detect dscp 14 12 20 1
  random-detect dscp 32 12 20 1
  queue-limit 40 packets
 class NetworkControl_Q6
  bandwidth percent 2 
  queue-limit 18 packets
 class class-default
  bandwidth percent 10 
  random-detect dscp-based
  random-detect dscp 0 7 15 1
  queue-limit 30 packets
policy-map QPO_4096K_4_19_2_50_0_2_22
 class Voz_Q6
  priority level 1
  police cir percent 4 conform-action transmit  exceed-action drop 
 class Video_Q6
  priority level 2
  police cir percent 19 conform-action transmit  exceed-action drop 
 class MissaoCritica_Q6
  bandwidth percent 2 
  random-detect dscp-based
  random-detect dscp 24 7 15 1
  random-detect dscp 26 7 15 1
  random-detect dscp 28 7 15 1
  random-detect dscp 30 7 15 1
  queue-limit 30 packets
 class Interativa_Q6
  bandwidth percent 50 
  random-detect dscp-based
  random-detect dscp 18 112 240 1
  random-detect dscp 20 112 240 1
  random-detect dscp 22 112 240 1
  queue-limit 480 packets
 class NetworkControl_Q6
  bandwidth percent 2 
  queue-limit 30 packets
 class class-default
  bandwidth percent 22 
  random-detect dscp-based
  random-detect dscp 0 32 64 1
  queue-limit 128 packets
policy-map QDO_4096K_4_19_2_50_0_2_22
 class class-default
  shape average 4096000
  service-policy QPO_4096K_4_19_2_50_0_2_22
policy-map QDO_2048K_13_25_11_0_0_1_1
 class class-default
  shape average 2048000
  service-policy QPO_2048K_13_25_11_0_0_1_1
policy-map QPO_10000K_5_0_22_19_2_2_34
 class Voz_Q6
  priority level 1
  police cir percent 5 conform-action transmit  exceed-action drop 
 class MissaoCritica_Q6
  bandwidth percent 22 
  random-detect dscp-based
  random-detect dscp 24 112 240 1
  random-detect dscp 26 112 240 1
  random-detect dscp 28 112 240 1
  random-detect dscp 30 112 240 1
  queue-limit 480 packets
 class Interativa_Q6
  bandwidth percent 19 
  random-detect dscp-based
  random-detect dscp 18 112 240 1
  random-detect dscp 20 112 240 1
  random-detect dscp 22 112 240 1
  queue-limit 480 packets
 class Bulk_Q6
  bandwidth percent 2 
  random-detect dscp-based
  random-detect dscp 8 24 40 1
  random-detect dscp 10 24 40 1
  random-detect dscp 12 24 40 1
  random-detect dscp 14 24 40 1
  random-detect dscp 32 24 40 1
  queue-limit 80 packets
 class NetworkControl_Q6
  bandwidth percent 2 
  queue-limit 80 packets
 class class-default
  bandwidth percent 34 
  random-detect dscp-based
  random-detect dscp 0 112 240 1
  queue-limit 480 packets
policy-map QDO_10000K_5_0_22_19_2_2_34
 class class-default
  shape average 10000000
  service-policy QPO_10000K_5_0_22_19_2_2_34
policy-map QDO_VIPSIP_VOZ_800_V1
 class class-default
  shape average 800000
  service-policy QPO_VIPSIP_VOZ_800_V1
policy-map QDO_1024K_7_0_48_19_12_4_9
 class class-default
  shape average 1024000
  service-policy QPO_1024K_7_0_48_19_12_4_9
policy-map QDI_4096K_4_19_2_50_0_2_22
 class class-default
  police rate 4096000  conform-action transmit  exceed-action drop 
  service-policy QPI_4096K_4_N_19_2_50_0_2_22
policy-map QPI_1024K_25_N_0_40_0_0_2_32
 class Voz_Q6
  police cir percent 25 conform-action transmit  exceed-action drop 
 class MissaoCritica_Q6
  police cir percent 40 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
 class class-default
  set mpls experimental topmost 0
policy-map QDI_1024K_25_0_40_0_0_2_32
 class class-default
  police rate 1024000  conform-action transmit  exceed-action drop 
  service-policy QPI_1024K_25_N_0_40_0_0_2_32
policy-map QPI_4096K_40_N_0_35_0_0_2_21
 class Voz_Q6
  police cir percent 40 conform-action transmit  exceed-action drop 
 class MissaoCritica_Q6
  police cir percent 35 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
 class class-default
  set mpls experimental topmost 0
policy-map QPO_2048K_3_0_1_0_0_2_93
 class Voz_Q6
  priority level 1
  police cir percent 3 conform-action transmit  exceed-action drop 
 class MissaoCritica_Q6
  bandwidth percent 1 
  random-detect dscp-based
  random-detect dscp 24 5 9 1
  random-detect dscp 26 5 9 1
  random-detect dscp 28 5 9 1
  random-detect dscp 30 5 9 1
  queue-limit 18 packets
 class NetworkControl_Q6
  bandwidth percent 2 
  queue-limit 26 packets
 class class-default
  bandwidth percent 93 
  random-detect dscp-based
  random-detect dscp 0 56 120 1
  queue-limit 240 packets
policy-map QPO_BBONE_128_V1
 class class-default
  shape average 128000 1536
policy-map QPO_4096K_40_0_35_0_0_2_21
 class Voz_Q6
  priority level 1
  police cir percent 40 conform-action transmit  exceed-action drop 
 class MissaoCritica_Q6
  bandwidth percent 35 
  random-detect dscp-based
  random-detect dscp 24 56 120 1
  random-detect dscp 26 56 120 1
  random-detect dscp 28 56 120 1
  random-detect dscp 30 56 120 1
  queue-limit 240 packets
 class NetworkControl_Q6
  bandwidth percent 2 
  queue-limit 30 packets
 class class-default
  bandwidth percent 21 
  random-detect dscp-based
  random-detect dscp 0 32 64 1
  queue-limit 128 packets
policy-map QDO_4096K_40_0_35_0_0_2_21
 class class-default
  shape average 4096000
  service-policy QPO_4096K_40_0_35_0_0_2_21
policy-map QPO_Correios_128K_ARPA_IOS_D_V1
 class REAL_TIME_CORREIOS
  priority level 1
  police cir percent 12 conform-action transmit  exceed-action drop 
 class MISSAO_CRITICA_CORREIOS
  bandwidth percent 40 
  random-detect dscp-based
  random-detect dscp 34 16 32 1
  random-detect dscp 36 16 32 1
  random-detect dscp 38 16 32 1
 class GERENCIAMENTO_CORREIOS
  bandwidth percent 9 
  random-detect dscp-based
  random-detect dscp 26 16 32 1
  random-detect dscp 28 16 32 1
  random-detect dscp 30 16 32 1
 class NETWORK_CONTROL_CORREIOS
  bandwidth percent 6 
  random-detect dscp-based
  random-detect dscp 16 16 32 1
  random-detect dscp 48 16 32 1
  random-detect dscp 56 16 32 1
 class BEST_EFFORT
  bandwidth percent 32 
  random-detect dscp-based
  random-detect dscp 0 16 32 1
policy-map QDO_2048K_12_23_9_50_0_2_3
 class class-default
  shape average 2048000
  service-policy QPO_2048K_12_23_9_50_0_2_3
policy-map QPI_BBONE_S_6000_V1
 class class-default
  police 6000000 conform-action set-dscp-transmit default exceed-action drop 
policy-map QDO_VIPSIP_VOZ_5800_V1
 class class-default
  shape average 5800000
  service-policy QPO_VIPSIP_VOZ_5800_V1
policy-map QPI_BBONE_N_2600_V1
 class class-default
  police 2600000 conform-action set-mpls-exp-imposition-transmit 0 exceed-action drop 
policy-map Entrada_DCN_GERL3_EBT_CLARO
 class class-default
  set mpls experimental topmost 2
policy-map QPO_1024K_25_0_40_0_0_2_32
 class Voz_Q6
  priority level 1
  police cir percent 25 conform-action transmit  exceed-action drop 
 class MissaoCritica_Q6
  bandwidth percent 40 
  random-detect dscp-based
  random-detect dscp 24 24 40 1
  random-detect dscp 26 24 40 1
  random-detect dscp 28 24 40 1
  random-detect dscp 30 24 40 1
  queue-limit 80 packets
 class NetworkControl_Q6
  bandwidth percent 2 
  queue-limit 18 packets
 class class-default
  bandwidth percent 32 
  random-detect dscp-based
  random-detect dscp 0 14 30 1
  queue-limit 60 packets
policy-map QDO_1024K_25_0_40_0_0_2_32
 class class-default
  shape average 1024000
  service-policy QPO_1024K_25_0_40_0_0_2_32
policy-map QDO_1024K_BBrasil_NAC_IPSAN_IACC_V1
 class class-default
  shape average 1024000 account user-defined 18
  service-policy QPO_1024K_BBrasil_NAC_IPSAN_IACC_V1
policy-map QPI_4096K_3_N_0_0_0_0_1_46
 class Voz_Q6
  police cir percent 3 conform-action transmit  exceed-action drop 
 class class-default
  set mpls experimental topmost 0
policy-map QPO_10000K_16_0_0_0_0_2_81
 class Voz_Q6
  priority level 1
  police cir percent 16 conform-action transmit  exceed-action drop 
 class NetworkControl_Q6
  bandwidth percent 2 
  queue-limit 40 packets
 class class-default
  bandwidth percent 81 
  random-detect dscp-based
  random-detect dscp 0 224 480 1
  queue-limit 960 packets
policy-map QPI_2048K_11_N_0_41_0_11_1_35
 class Voz_Q6
  police cir percent 11 conform-action transmit  exceed-action drop 
 class MissaoCritica_Q6
  police cir percent 41 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
 class Bulk_Q6
  police cir percent 11 conform-action set-mpls-exp-imposition-transmit 4 exceed-action set-mpls-exp-imposition-transmit 1
 class class-default
  set mpls experimental topmost 0
policy-map QPO_BBONE_600_V1
 class class-default
  shape average 600000 7200
policy-map QPI_1024K_12_N_0_34_25_18_2_8
 class Voz_Q6
  police cir percent 12 conform-action transmit  exceed-action drop 
 class MissaoCritica_Q6
  police cir percent 34 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
 class Interativa_Q6
  police cir percent 25 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
 class Bulk_Q6
  police cir percent 18 conform-action set-mpls-exp-imposition-transmit 4 exceed-action set-mpls-exp-imposition-transmit 1
 class class-default
  set mpls experimental topmost 0
policy-map CoPP
 class CoPP-Special
  police 32000 4470 4470 conform-action transmit  exceed-action transmit 
 class CoPP-Undesirable
  police 32000 4470 4470 conform-action drop  exceed-action drop 
 class CoPP-BACKBONE-routing
  police 32000 4470 4470 conform-action transmit  exceed-action transmit 
 class CoPP-PE-CE-routing
  police 32000 4470 4470 conform-action transmit  exceed-action transmit 
 class CoPP-ToS
  police 32000 4470 4470 conform-action transmit  exceed-action transmit 
 class CoPP-BACKBONE-management
  police 32000 4470 4470 conform-action transmit  exceed-action transmit 
 class CoPP-SUSPECT-management
  police 32000 4470 4470 conform-action drop  exceed-action drop 
 class CoPP-Normal
  police 256000 16000 16000 conform-action transmit  exceed-action drop 
 class CoPP-Catch-all-ipv4
  police 32000 4470 4470 conform-action transmit  exceed-action transmit 
 class CoPP-Arp
  police 32000 4470 4470 conform-action transmit  exceed-action transmit 
 class class-default
  police 32000 4470 4470 conform-action transmit  exceed-action transmit 
policy-map QPI_BBONE_N_1200_V1
 class class-default
  police 1200000 conform-action set-mpls-exp-imposition-transmit 0 exceed-action drop 
policy-map QPI_BBONE_N_800_V1
 class class-default
  police 800000 conform-action set-mpls-exp-imposition-transmit 0 exceed-action drop 
policy-map QDI_2048K_6_0_15_23_37_2_16
 class class-default
  police rate 2048000  conform-action transmit  exceed-action drop 
  service-policy QPI_2048K_6_N_0_15_23_37_2_16
policy-map QPI_BBONE_S_500000_V1
 class class-default
  police 500000000 conform-action set-dscp-transmit default exceed-action drop 
policy-map QPO_4096K_7_0_0_0_0_2_89
 class Voz_Q6
  priority level 1
  police cir percent 7 conform-action transmit  exceed-action drop 
 class NetworkControl_Q6
  bandwidth percent 2 
  queue-limit 30 packets
 class class-default
  bandwidth percent 89 
  random-detect dscp-based
  random-detect dscp 0 112 240 1
  queue-limit 480 packets
policy-map QDO_4096K_7_0_0_0_0_2_89
 class class-default
  shape average 4096000
  service-policy QPO_4096K_7_0_0_0_0_2_89
policy-map QPO_1024K_0_0_40_30_21_2_6
 class MissaoCritica_Q6
  bandwidth percent 40 
  random-detect dscp-based
  random-detect dscp 24 24 40 1
  random-detect dscp 26 24 40 1
  random-detect dscp 28 24 40 1
  random-detect dscp 30 24 40 1
  queue-limit 80 packets
 class Interativa_Q6
  bandwidth percent 30 
  random-detect dscp-based
  random-detect dscp 18 14 30 1
  random-detect dscp 20 14 30 1
  random-detect dscp 22 14 30 1
  queue-limit 60 packets
 class Bulk_Q6
  bandwidth percent 21 
  random-detect dscp-based
  random-detect dscp 8 12 20 1
  random-detect dscp 10 12 20 1
  random-detect dscp 12 12 20 1
  random-detect dscp 14 12 20 1
  random-detect dscp 32 12 20 1
  queue-limit 40 packets
 class NetworkControl_Q6
  bandwidth percent 2 
  queue-limit 18 packets
 class class-default
  bandwidth percent 6 
  random-detect dscp-based
  random-detect dscp 0 5 13 1
  queue-limit 26 packets
policy-map QDO_1024K_0_0_40_30_21_2_6
 class class-default
  shape average 1024000
  service-policy QPO_1024K_0_0_40_30_21_2_6
policy-map QPI_2048K_21_N_0_35_20_0_1_21
 class Voz_Q6
  police cir percent 21 conform-action transmit  exceed-action drop 
 class MissaoCritica_Q6
  police cir percent 35 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
 class Interativa_Q6
  police cir percent 20 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
 class class-default
  set mpls experimental topmost 0
policy-map QDI_2048K_15_0_0_0_0_2_57
 class class-default
  police rate 2048000  conform-action transmit  exceed-action drop 
  service-policy QPI_2048K_15_N_0_0_0_0_2_57
policy-map QPO_6000K_12_23_16_8_34_2_4
 class Voz_Q6
  priority level 1
  police cir percent 12 conform-action transmit  exceed-action drop 
 class Video_Q6
  priority level 2
  police cir percent 23 conform-action transmit  exceed-action drop 
 class MissaoCritica_Q6
  bandwidth percent 16 
  random-detect dscp-based
  random-detect dscp 24 32 64 1
  random-detect dscp 26 32 64 1
  random-detect dscp 28 32 64 1
  random-detect dscp 30 32 64 1
  queue-limit 128 packets
 class Interativa_Q6
  bandwidth percent 8 
  random-detect dscp-based
  random-detect dscp 18 24 40 1
  random-detect dscp 20 24 40 1
  random-detect dscp 22 24 40 1
  queue-limit 80 packets
 class Bulk_Q6
  bandwidth percent 34 
  random-detect dscp-based
  random-detect dscp 8 112 240 1
  random-detect dscp 10 112 240 1
  random-detect dscp 12 112 240 1
  random-detect dscp 14 112 240 1
  random-detect dscp 32 112 240 1
  queue-limit 480 packets
 class NetworkControl_Q6
  bandwidth percent 2 
  queue-limit 40 packets
 class class-default
  bandwidth percent 4 
  random-detect dscp-based
  random-detect dscp 0 12 20 1
  queue-limit 40 packets
policy-map QDO_6000K_12_23_16_8_34_2_4
 class class-default
  shape average 6000000
  service-policy QPO_6000K_12_23_16_8_34_2_4
policy-map QPO_1024K_15_0_20_10_0_4_50
 class Voz_Q6
  priority level 1
  police cir percent 15 conform-action transmit  exceed-action drop 
 class MissaoCritica_Q6
  bandwidth percent 20 
  random-detect dscp-based
  random-detect dscp 24 12 20 1
  random-detect dscp 26 12 20 1
  random-detect dscp 28 12 20 1
  random-detect dscp 30 12 20 1
  queue-limit 40 packets
 class Interativa_Q6
  bandwidth percent 10 
  random-detect dscp-based
  random-detect dscp 18 7 15 1
  random-detect dscp 20 7 15 1
  random-detect dscp 22 7 15 1
  queue-limit 30 packets
 class NetworkControl_Q6
  bandwidth percent 4 
  queue-limit 26 packets
 class class-default
  bandwidth percent 50 
  random-detect dscp-based
  random-detect dscp 0 32 48 1
  queue-limit 96 packets
policy-map QDO_1024K_15_0_20_10_0_4_50
 class class-default
  shape average 1024000
  service-policy QPO_1024K_15_0_20_10_0_4_50
policy-map QDI_4096K_3_0_0_0_0_1_46
 class class-default
  police rate 4096000  conform-action transmit  exceed-action drop 
  service-policy QPI_4096K_3_N_0_0_0_0_1_46
policy-map QPO_2048K_4_0_0_0_0_2_93
 class Voz_Q6
  priority level 1
  police cir percent 4 conform-action transmit  exceed-action drop 
 class NetworkControl_Q6
  bandwidth percent 2 
  queue-limit 26 packets
 class class-default
  bandwidth percent 93 
  random-detect dscp-based
  random-detect dscp 0 56 120 1
  queue-limit 240 packets
policy-map QDO_2048K_4_0_0_0_0_2_93
 class class-default
  shape average 2048000
  service-policy QPO_2048K_4_0_0_0_0_2_93
policy-map QDI_Correios_128K_ARPA_IOS_D_V1
 class class-default
  police rate 128000  conform-action transmit  exceed-action drop 
  service-policy QPI_Correios_128K_ARPA_IOS_D_V1
policy-map QDO_512K_25_0_55_0_0_4_15
 class class-default
  shape average 512000
  service-policy QPO_512K_25_0_55_0_0_4_15
policy-map QDO_16000K_11_34_0_0_0_1_53
 class class-default
  shape average 16000000
  service-policy QPO_16000K_11_34_0_0_0_1_53
policy-map QPO_BBONE_4096_V1
 class class-default
  shape average 4096000 49152
policy-map QPI_256K_19_N_0_57_0_0_7_16
 class Voz_Q6
  police cir percent 19 conform-action transmit  exceed-action drop 
 class MissaoCritica_Q6
  police cir percent 57 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
 class class-default
  set mpls experimental topmost 0
policy-map QPI_1024K_BBrasil_NAC_IACC_V1
 class TEMPO_REAL_NAC
  police cir percent 25 conform-action transmit  exceed-action drop 
 class MISSAO_CRITICA_NAC
  police cir percent 40 conform-action transmit  exceed-action set-dscp-transmit af43
 class GERENCIAMENTO_NAC
  police cir percent 10 conform-action transmit  exceed-action set-dscp-transmit af33
 class NETWORK_CONTROL_NAC
  police cir percent 2 conform-action transmit  exceed-action set-dscp-transmit cs6
 class STANDARD_NAC
  police cir percent 20 conform-action transmit  exceed-action set-dscp-transmit default
policy-map QDI_1024K_BBrasil_NAC_IACC_V1
 class class-default
  police rate 1024000  conform-action transmit  exceed-action drop 
  service-policy QPI_1024K_BBrasil_NAC_IACC_V1
policy-map QPI_2048K_9_N_49_13_0_0_2_26
 class Voz_Q6
  police cir percent 9 conform-action transmit  exceed-action drop 
 class Video_Q6
  police cir percent 49 conform-action set-mpls-exp-imposition-transmit 5 exceed-action drop 
 class MissaoCritica_Q6
  police cir percent 13 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
 class class-default
  set mpls experimental topmost 0
policy-map QDI_2048K_9_49_13_0_0_2_26
 class class-default
  police rate 2048000  conform-action transmit  exceed-action drop 
  service-policy QPI_2048K_9_N_49_13_0_0_2_26
policy-map QPI_4096K_25_N_0_0_0_0_1_71
 class Voz_Q6
  police cir percent 25 conform-action transmit  exceed-action drop 
 class class-default
  set mpls experimental topmost 0
policy-map QDI_4096K_25_0_0_0_0_1_71
 class class-default
  police rate 4096000  conform-action transmit  exceed-action drop 
  service-policy QPI_4096K_25_N_0_0_0_0_1_71
policy-map QPO_Correios_4096K_ARPA_IOS_DVV_V1
 class REAL_TIME_CORREIOS
  priority
  police cir percent 20 conform-action transmit  exceed-action drop 
 class MISSAO_CRITICA_CORREIOS
  bandwidth percent 40 
  random-detect dscp-based
  queue-limit 256 packets
 class GERENCIAMENTO_CORREIOS
  bandwidth percent 9 
  random-detect dscp-based
  queue-limit 256 packets
 class NETWORK_CONTROL_CORREIOS
  bandwidth percent 1 
  random-detect dscp-based
 class BEST_EFFORT
  bandwidth percent 29 
  random-detect dscp-based
  queue-limit 256 packets
policy-map QPI_16000K_11_N_34_0_0_0_1_53
 class Voz_Q6
  police cir percent 11 conform-action transmit  exceed-action drop 
 class Video_Q6
  police cir percent 34 conform-action set-mpls-exp-imposition-transmit 5 exceed-action drop 
 class class-default
  set mpls experimental topmost 0
policy-map QDI_16000K_11_34_0_0_0_1_53
 class class-default
  police rate 16000000  conform-action transmit  exceed-action drop 
  service-policy QPI_16000K_11_N_34_0_0_0_1_53
policy-map QPI_1024K_15_N_0_20_10_0_4_50
 class Voz_Q6
  police cir percent 15 conform-action transmit  exceed-action drop 
 class MissaoCritica_Q6
  police cir percent 20 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
 class Interativa_Q6
  police cir percent 10 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
 class class-default
  set mpls experimental topmost 0
policy-map QDI_1024K_15_0_20_10_0_4_50
 class class-default
  police rate 1024000  conform-action transmit  exceed-action drop 
  service-policy QPI_1024K_15_N_0_20_10_0_4_50
policy-map QPI_4096K_13_N_0_62_0_0_2_22
 class Voz_Q6
  police cir percent 13 conform-action transmit  exceed-action drop 
 class MissaoCritica_Q6
  police cir percent 62 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
 class class-default
  set mpls experimental topmost 0
policy-map QDI_2048K_4_0_0_0_0_2_93
 class class-default
  police rate 2048000  conform-action transmit  exceed-action drop 
  service-policy QPI_2048K_4_N_0_0_0_0_2_93
policy-map QPI_1024K_6_N_0_36_27_19_2_8
 class Voz_Q6
  police cir percent 6 conform-action transmit  exceed-action drop 
 class MissaoCritica_Q6
  police cir percent 36 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
 class Interativa_Q6
  police cir percent 27 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
 class Bulk_Q6
  police cir percent 19 conform-action set-mpls-exp-imposition-transmit 4 exceed-action set-mpls-exp-imposition-transmit 1
 class class-default
  set mpls experimental topmost 0
policy-map QPO_2048K_7_0_50_0_13_2_27
 class Voz_Q6
  priority level 1
  police cir percent 7 conform-action transmit  exceed-action drop 
 class MissaoCritica_Q6
  bandwidth percent 50 
  random-detect dscp-based
  random-detect dscp 24 56 120 1
  random-detect dscp 26 56 120 1
  random-detect dscp 28 56 120 1
  random-detect dscp 30 56 120 1
  queue-limit 240 packets
 class Bulk_Q6
  bandwidth percent 13 
  random-detect dscp-based
  random-detect dscp 8 14 30 1
  random-detect dscp 10 14 30 1
  random-detect dscp 12 14 30 1
  random-detect dscp 14 14 30 1
  random-detect dscp 32 14 30 1
  queue-limit 60 packets
 class NetworkControl_Q6
  bandwidth percent 2 
  queue-limit 26 packets
 class class-default
  bandwidth percent 27 
  random-detect dscp-based
  random-detect dscp 0 32 48 1
  queue-limit 96 packets
policy-map QDI_40000K_10_0_60_0_0_1_26
 class class-default
  police rate 40000000  conform-action transmit  exceed-action drop 
  service-policy QPI_40000K_10_N_0_60_0_0_1_26
policy-map QPO_BBONE_30000_V1
 class class-default
  shape average 30000000 360000
policy-map QPI_512K_25_N_0_55_0_0_4_15
 class Voz_Q6
  police cir percent 25 conform-action transmit  exceed-action drop 
 class MissaoCritica_Q6
  police cir percent 55 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
 class class-default
  set mpls experimental topmost 0
policy-map QDI_512K_25_0_55_0_0_4_15
 class class-default
  police rate 512000  conform-action transmit  exceed-action drop 
  service-policy QPI_512K_25_N_0_55_0_0_4_15
policy-map QPO_VIPSIP_VOZ_1500_V1
 class Voz_Q6
  priority
  police rate 1432000  conform-action transmit  exceed-action drop 
 class NetworkControl_Q6
  bandwidth 64
  queue-limit 32 packets
policy-map QPO_BBONE_5400_V1
 class class-default
  shape average 5400000 64800
policy-map QDI_VIPSIP_VOZ_18200_V1
 class class-default
  police rate 18200000  conform-action transmit  exceed-action drop 
policy-map QPI_BBONE_N_6144_V1
 class class-default
  police 6144000 conform-action set-mpls-exp-imposition-transmit 0 exceed-action drop 
policy-map QPI_BBONE_S_155000_V1
 class class-default
  police 155000000 conform-action set-dscp-transmit default exceed-action drop 
policy-map QDI_VIPSIP_VOZ_800_V1
 class class-default
  service-policy QPI_VIPSIP_VOZ_800_V1
policy-map QDO_512K_50_0_10_0_0_4_35
 class class-default
  shape average 512000
  service-policy QPO_512K_50_0_10_0_0_4_35
policy-map QDI_1024K_20_20_20_0_10_1_25
 class class-default
  police rate 1024000  conform-action transmit  exceed-action drop 
  service-policy QPI_1024K_20_N_20_20_0_10_1_25
policy-map QPI_1024K_7_N_0_50_0_0_2_40
 class Voz_Q6
  police cir percent 7 conform-action transmit  exceed-action drop 
 class MissaoCritica_Q6
  police cir percent 50 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
 class class-default
  set mpls experimental topmost 0
policy-map QPO_BBONE_20000_V1
 class class-default
  shape average 20000000 240000
policy-map QPI_SERPRO_20M_V1
 class Voz_SERPRO
  police cir percent 10 conform-action transmit  exceed-action drop 
 class Video_SERPRO
  police cir percent 30 conform-action transmit  exceed-action drop 
 class MissaoCritica_SERPRO
  police cir percent 10 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
 class Interativa_SERPRO
  police cir percent 30 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
 class class-default
  set mpls experimental imposition 0
policy-map QDI_SERPRO_20M_V1
 class class-default
  service-policy QPI_SERPRO_20M_V1
policy-map QPI_6000K_2_N_7_64_0_0_2_24
 class Voz_Q6
  police cir percent 2 conform-action transmit  exceed-action drop 
 class Video_Q6
  police cir percent 7 conform-action set-mpls-exp-imposition-transmit 5 exceed-action drop 
 class MissaoCritica_Q6
  police cir percent 64 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
 class class-default
  set mpls experimental topmost 0
policy-map QDI_6000K_2_7_64_0_0_2_24
 class class-default
  police rate 6000000  conform-action transmit  exceed-action drop 
  service-policy QPI_6000K_2_N_7_64_0_0_2_24
policy-map QPO_1024K_BBrasil_NAC_IACC_V1
 class TEMPO_REAL_NAC
  priority level 1
  police cir percent 25 conform-action transmit  exceed-action drop 
 class MISSAO_CRITICA_NAC
  bandwidth remaining percent 56 
  random-detect dscp-based
  random-detect dscp 32 24 40 1
  random-detect dscp 34 24 40 1
  random-detect dscp 38 24 40 1
  queue-limit 80 packets
 class GERENCIAMENTO_NAC
  bandwidth remaining percent 14 
  random-detect dscp-based
  random-detect dscp 24 7 15 1
  random-detect dscp 26 7 15 1
  random-detect dscp 30 7 15 1
  queue-limit 30 packets
 class NETWORK_CONTROL_NAC
  bandwidth remaining percent 3 
  random-detect dscp-based
  random-detect dscp 48 5 9 1
  queue-limit 18 packets
 class STANDARD_NAC
  bandwidth remaining percent 27 
  random-detect dscp-based
  random-detect dscp 0 12 20 1
  queue-limit 40 packets
policy-map QPI_SERPRO_4096K_V1
 class Voz_SERPRO
  police cir percent 10 conform-action transmit  exceed-action drop 
 class Video_SERPRO
  police cir percent 30 conform-action transmit  exceed-action drop 
 class MissaoCritica_SERPRO
  police cir percent 10 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
 class Interativa_SERPRO
  police cir percent 30 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
 class class-default
  set mpls experimental imposition 0
policy-map QDI_1024K_7_0_48_19_12_4_9
 class class-default
  police rate 1024000  conform-action transmit  exceed-action drop 
  service-policy QPI_1024K_7_N_0_48_19_12_4_9
policy-map QDI_1024K_18_0_0_0_0_2_79
 class class-default
  police rate 1024000  conform-action transmit  exceed-action drop 
  service-policy QPI_1024K_18_N_0_0_0_0_2_79
policy-map QPO_BBONE_300000_V1
 class class-default
  shape average 300000000 3600000
policy-map QPO_SERPRO_1024K_V1
 class VozVideo_SERPRO
  priority
  police cir percent 40 conform-action transmit  exceed-action drop 
 class MissaoCritica_SERPRO
  bandwidth percent 10 
  random-detect dscp-based
 class Interativa_SERPRO
  bandwidth percent 30 
  random-detect dscp-based
 class NetworkControl_SERPRO
  bandwidth percent 1 
 class class-default
  bandwidth percent 16 
  random-detect dscp-based
policy-map QDO_SERPRO_1024K_V1
 class class-default
  shape average 1024000
  service-policy QPO_SERPRO_1024K_V1
policy-map QPO_Correios_2048K_ARPA_IOS_D_V1
 class REAL_TIME_CORREIOS
  priority level 1
  police cir percent 1 conform-action transmit  exceed-action drop 
 class MISSAO_CRITICA_CORREIOS
  bandwidth percent 40 
  random-detect dscp-based
  random-detect dscp 34 32 64 1
  random-detect dscp 36 32 64 1
  random-detect dscp 38 32 64 1
  queue-limit 128 packets
 class GERENCIAMENTO_CORREIOS
  bandwidth percent 9 
  random-detect dscp-based
  random-detect dscp 26 32 64 1
  random-detect dscp 28 32 64 1
  random-detect dscp 30 32 64 1
  queue-limit 128 packets
 class NETWORK_CONTROL_CORREIOS
  bandwidth percent 1 
  random-detect dscp-based
  random-detect dscp 16 32 64 1
  random-detect dscp 48 32 64 1
  random-detect dscp 56 32 64 1
  queue-limit 64 packets
 class BEST_EFFORT
  bandwidth percent 48 
  random-detect dscp-based
  random-detect dscp 0 32 64 1
  queue-limit 180 packets
policy-map QPI_BBONE_N_95000_V1
 class class-default
  police 95000000 conform-action set-mpls-exp-imposition-transmit 0 exceed-action drop 
policy-map QDI_1024K_11_0_50_13_13_2_10
 class class-default
  police rate 1024000  conform-action transmit  exceed-action drop 
  service-policy QPI_1024K_11_N_0_50_13_13_2_10
policy-map QPO_16000K_0_19_0_0_0_1_78
 class Video_Q6
  priority level 2
  police cir percent 19 conform-action transmit  exceed-action drop 
 class NetworkControl_Q6
  bandwidth percent 1 
  queue-limit 60 packets
 class class-default
  bandwidth percent 78 
  random-detect dscp-based
  random-detect dscp 0 388 900 1
  queue-limit 1800 packets
policy-map QDO_16000K_0_19_0_0_0_1_78
 class class-default
  shape average 16000000
  service-policy QPO_16000K_0_19_0_0_0_1_78
policy-map QPO_VIPSIP_VOZ_2700_V1
 class Voz_Q6
  priority
  police rate 2632000  conform-action transmit  exceed-action drop 
 class NetworkControl_Q6
  bandwidth 64
  queue-limit 32 packets
policy-map QPI_BBONE_N_34000_V1
 class class-default
  police 34000000 conform-action set-mpls-exp-imposition-transmit 0 exceed-action drop 
policy-map QDI_4096K_40_0_35_0_0_2_21
 class class-default
  police rate 4096000  conform-action transmit  exceed-action drop 
  service-policy QPI_4096K_40_N_0_35_0_0_2_21
policy-map QPO_2048K_21_0_35_20_0_1_21
 class Voz_Q6
  priority level 1
  police cir percent 21 conform-action transmit  exceed-action drop 
 class MissaoCritica_Q6
  bandwidth percent 35 
  random-detect dscp-based
  random-detect dscp 24 32 48 1
  random-detect dscp 26 32 48 1
  random-detect dscp 28 32 48 1
  random-detect dscp 30 32 48 1
  queue-limit 96 packets
 class Interativa_Q6
  bandwidth percent 20 
  random-detect dscp-based
  random-detect dscp 18 24 40 1
  random-detect dscp 20 24 40 1
  random-detect dscp 22 24 40 1
  queue-limit 80 packets
 class NetworkControl_Q6
  bandwidth percent 1 
  queue-limit 18 packets
 class class-default
  bandwidth percent 21 
  random-detect dscp-based
  random-detect dscp 0 24 40 1
  queue-limit 80 packets
policy-map QDO_2048K_21_0_35_20_0_1_21
 class class-default
  shape average 2048000
  service-policy QPO_2048K_21_0_35_20_0_1_21
policy-map QDI_256K_19_0_57_0_0_7_16
 class class-default
  police rate 256000  conform-action transmit  exceed-action drop 
  service-policy QPI_256K_19_N_0_57_0_0_7_16
policy-map QDO_1024K_20_20_20_0_10_1_25
 class class-default
  shape average 1024000
  service-policy QPO_1024K_20_20_20_0_10_1_25
policy-map QPO_12000K_13_38_21_7_13_1_6
 class Voz_Q6
  priority level 1
  police cir percent 13 conform-action transmit  exceed-action drop 
 class Video_Q6
  priority level 2
  police cir percent 38 conform-action transmit  exceed-action drop 
 class MissaoCritica_Q6
  bandwidth percent 21 
  random-detect dscp-based
  random-detect dscp 24 112 240 1
  random-detect dscp 26 112 240 1
  random-detect dscp 28 112 240 1
  random-detect dscp 30 112 240 1
  queue-limit 480 packets
 class Interativa_Q6
  bandwidth percent 7 
  random-detect dscp-based
  random-detect dscp 18 32 64 1
  random-detect dscp 20 32 64 1
  random-detect dscp 22 32 64 1
  queue-limit 128 packets
 class Bulk_Q6
  bandwidth percent 13 
  random-detect dscp-based
  random-detect dscp 8 56 120 1
  random-detect dscp 10 56 120 1
  random-detect dscp 12 56 120 1
  random-detect dscp 14 56 120 1
  random-detect dscp 32 56 120 1
  queue-limit 240 packets
 class NetworkControl_Q6
  bandwidth percent 1 
  queue-limit 40 packets
 class class-default
  bandwidth percent 6 
  random-detect dscp-based
  random-detect dscp 0 32 48 1
  queue-limit 96 packets
policy-map QPO_BBONE_50000_V1
 class class-default
  shape average 50000000 600000
  service-policy PM_V10_QPO_BBONE_50000_V1
policy-map QPI_2048K_16_N_15_11_0_0_2_30
 class Voz_Q6
  police cir percent 16 conform-action transmit  exceed-action drop 
 class Video_Q6
  police cir percent 15 conform-action set-mpls-exp-imposition-transmit 5 exceed-action drop 
 class MissaoCritica_Q6
  police cir percent 11 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
 class class-default
  set mpls experimental topmost 0
policy-map QDI_2048K_16_15_11_0_0_2_30
 class class-default
  police rate 2048000  conform-action transmit  exceed-action drop 
  service-policy QPI_2048K_16_N_15_11_0_0_2_30
policy-map QDO_1024K_13_0_16_48_16_2_4
 class class-default
  shape average 1024000
  service-policy QPO_1024K_13_0_16_48_16_2_4
policy-map QDO_12000K_40_0_35_0_0_1_21
 class class-default
  shape average 12000000
  service-policy QPO_12000K_40_0_35_0_0_1_21
policy-map QPI_BBONE_S_4096_V1
 class class-default
  police 4096000 conform-action set-dscp-transmit default exceed-action drop 
policy-map QPO_Correios_2048K_ARPA_IOS_D_VID_V1
 class REAL_TIME_CORREIOS
  priority level 1
  police cir percent 32 conform-action transmit  exceed-action drop 
 class MISSAO_CRITICA_CORREIOS
  bandwidth percent 40 
  random-detect dscp-based
  random-detect dscp 34 32 64 1
  random-detect dscp 36 32 64 1
  random-detect dscp 38 32 64 1
  queue-limit 128 packets
 class GERENCIAMENTO_CORREIOS
  bandwidth percent 9 
  random-detect dscp-based
  random-detect dscp 26 32 64 1
  random-detect dscp 28 32 64 1
  random-detect dscp 30 32 64 1
  queue-limit 128 packets
 class NETWORK_CONTROL_CORREIOS
  bandwidth percent 1 
  random-detect dscp-based
  random-detect dscp 16 32 64 1
  random-detect dscp 48 32 64 1
  random-detect dscp 56 32 64 1
  queue-limit 64 packets
 class BEST_EFFORT
  bandwidth percent 17 
  random-detect dscp-based
  random-detect dscp 0 32 64 1
  queue-limit 180 packets
policy-map QPO_6000K_2_7_72_0_0_2_16
 class Voz_Q6
  priority level 1
  police cir percent 2 conform-action transmit  exceed-action drop 
 class Video_Q6
  priority level 2
  police cir percent 7 conform-action transmit  exceed-action drop 
 class MissaoCritica_Q6
  bandwidth percent 72 
  random-detect dscp-based
  random-detect dscp 24 224 480 1
  random-detect dscp 26 224 480 1
  random-detect dscp 28 224 480 1
  random-detect dscp 30 224 480 1
  queue-limit 960 packets
 class NetworkControl_Q6
  bandwidth percent 2 
  queue-limit 40 packets
 class class-default
  bandwidth percent 16 
  random-detect dscp-based
  random-detect dscp 0 32 64 1
  queue-limit 128 packets
policy-map QPI_SERPRO_2048K_V1
 class Voz_SERPRO
  police cir percent 10 conform-action transmit  exceed-action drop 
 class Video_SERPRO
  police cir percent 30 conform-action transmit  exceed-action drop 
 class MissaoCritica_SERPRO
  police cir percent 10 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
 class Interativa_SERPRO
  police cir percent 30 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
 class class-default
  set mpls experimental imposition 0
policy-map QDI_SERPRO_2048K_V1
 class class-default
  police rate 2048000  conform-action transmit  exceed-action drop 
  service-policy QPI_SERPRO_2048K_V1
policy-map QDO_Correios_4096K_ARPA_IOS_DVV_V1
 class class-default
  shape average 4096000
  service-policy QPO_Correios_4096K_ARPA_IOS_DVV_V1
policy-map QPO_6000K_2_7_64_0_0_2_24
 class Voz_Q6
  priority level 1
  police cir percent 2 conform-action transmit  exceed-action drop 
 class Video_Q6
  priority level 2
  police cir percent 7 conform-action transmit  exceed-action drop 
 class MissaoCritica_Q6
  bandwidth percent 64 
  random-detect dscp-based
  random-detect dscp 24 112 240 1
  random-detect dscp 26 112 240 1
  random-detect dscp 28 112 240 1
  random-detect dscp 30 112 240 1
  queue-limit 480 packets
 class NetworkControl_Q6
  bandwidth percent 2 
  queue-limit 40 packets
 class class-default
  bandwidth percent 24 
  random-detect dscp-based
  random-detect dscp 0 56 120 1
  queue-limit 240 packets
policy-map QDI_1024K_12_0_34_25_18_2_8
 class class-default
  police rate 1024000  conform-action transmit  exceed-action drop 
  service-policy QPI_1024K_12_N_0_34_25_18_2_8
policy-map QDI_256K_25_0_4_0_0_7_63
 class class-default
  police rate 256000  conform-action transmit  exceed-action drop 
  service-policy QPI_256K_25_N_0_4_0_0_7_63
policy-map QPO_6000K_9_9_54_0_0_2_25
 class Voz_Q6
  priority level 1
  police cir percent 9 conform-action transmit  exceed-action drop 
 class Video_Q6
  priority level 2
  police cir percent 9 conform-action transmit  exceed-action drop 
 class MissaoCritica_Q6
  bandwidth percent 54 
  random-detect dscp-based
  random-detect dscp 24 112 240 1
  random-detect dscp 26 112 240 1
  random-detect dscp 28 112 240 1
  random-detect dscp 30 112 240 1
  queue-limit 480 packets
 class NetworkControl_Q6
  bandwidth percent 2 
  queue-limit 40 packets
 class class-default
  bandwidth percent 25 
  random-detect dscp-based
  random-detect dscp 0 56 120 1
  queue-limit 240 packets
policy-map QDO_6000K_9_9_54_0_0_2_25
 class class-default
  shape average 6000000
  service-policy QPO_6000K_9_9_54_0_0_2_25
policy-map QDO_512K_11_0_33_25_16_4_8
 class class-default
  shape average 512000
  service-policy QPO_512K_11_0_33_25_16_4_8
policy-map QPI_4096K_8_N_0_1_0_0_1_89
 class Voz_Q6
  police cir percent 8 conform-action transmit  exceed-action drop 
 class MissaoCritica_Q6
  police cir percent 1 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
 class class-default
  set mpls experimental topmost 0
policy-map QDI_4096K_8_0_1_0_0_1_89
 class class-default
  police rate 4096000  conform-action transmit  exceed-action drop 
  service-policy QPI_4096K_8_N_0_1_0_0_1_89
policy-map QDO_4096K_9_25_28_14_0_2_20
 class class-default
  shape average 4096000
  service-policy QPO_4096K_9_25_28_14_0_2_20
policy-map QPO_BBONE_10240_V1
 class class-default
  shape average 10240000 122880
policy-map QPI_2048K_16_N_15_11_25_0_2_30
 class Voz_Q6
  police cir percent 16 conform-action transmit  exceed-action drop 
 class Video_Q6
  police cir percent 15 conform-action set-mpls-exp-imposition-transmit 5 exceed-action drop 
 class MissaoCritica_Q6
  police cir percent 11 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
 class Interativa_Q6
  police cir percent 25 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
 class class-default
  set mpls experimental topmost 0
policy-map QPI_2048K_7_N_0_33_0_8_2_49
 class Voz_Q6
  police cir percent 7 conform-action transmit  exceed-action drop 
 class MissaoCritica_Q6
  police cir percent 33 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
 class Bulk_Q6
  police cir percent 8 conform-action set-mpls-exp-imposition-transmit 4 exceed-action set-mpls-exp-imposition-transmit 1
 class class-default
  set mpls experimental topmost 0
policy-map QDI_1024_0_155_70_70_473_0B_A_V1
 class class-default
  police rate 1024000  conform-action transmit  exceed-action drop 
  service-policy QPI_1024_0_155_70_70_473_0B_A_V1
policy-map QPO_BBONE_6144_V1
 class class-default
  shape average 6144000 73728
policy-map QDI_VIPSIP_VOZ_1500_V1
 class class-default
  police rate 1500000  conform-action transmit  exceed-action drop 
policy-map QPI_BBONE_S_30000_V1
 class class-default
  police 30000000 conform-action set-dscp-transmit default exceed-action drop 
policy-map QPO_VIPSIP_VOZ_600_V1
 class Voz_Q6
  priority
  police rate 536000  conform-action transmit  exceed-action drop 
 class NetworkControl_Q6
  bandwidth 64
  queue-limit 32 packets
policy-map QDO_2048K_11_0_41_0_11_1_35
 class class-default
  shape average 2048000
  service-policy QPO_2048K_11_0_41_0_11_1_35
policy-map QDO_1024K_BBrasil_NAC_IACC_V1
 class class-default
  shape average 1024000
  service-policy QPO_1024K_BBrasil_NAC_IACC_V1
policy-map QPI_1024K_0_N_0_40_30_21_2_6
 class MissaoCritica_Q6
  police cir percent 40 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
 class Interativa_Q6
  police cir percent 30 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
 class Bulk_Q6
  police cir percent 21 conform-action set-mpls-exp-imposition-transmit 4 exceed-action set-mpls-exp-imposition-transmit 1
 class class-default
  set mpls experimental topmost 0
policy-map QDO_2048K_7_0_75_0_0_2_15
 class class-default
  shape average 2048000
  service-policy QPO_2048K_7_0_75_0_0_2_15
policy-map QPO_SERPRO_20M_V1
 class VozVideo_SERPRO
  priority
  police cir percent 40 conform-action transmit  exceed-action drop 
 class MissaoCritica_SERPRO
  bandwidth percent 10 
  random-detect dscp-based
 class Interativa_SERPRO
  bandwidth percent 30 
  random-detect dscp-based
 class NetworkControl_SERPRO
  bandwidth percent 1 
 class class-default
  bandwidth percent 16 
  random-detect dscp-based
policy-map QDO_SERPRO_20M_V1
 class class-default
  shape average 20000000
  service-policy QPO_SERPRO_20M_V1
policy-map QPO_Correios_1024K_ARPA_IOS_D_V1
 class REAL_TIME_CORREIOS
  priority level 1
  police cir percent 2 conform-action transmit  exceed-action drop 
 class MISSAO_CRITICA_CORREIOS
  bandwidth percent 40 
  random-detect dscp-based
 class GERENCIAMENTO_CORREIOS
  bandwidth percent 9 
  random-detect dscp-based
 class NETWORK_CONTROL_CORREIOS
  bandwidth percent 1 
  random-detect dscp-based
 class BEST_EFFORT
  bandwidth percent 47 
  random-detect dscp-based
policy-map QPO_Correios_4096K_ARPA_IOS_D_V1
 class REAL_TIME_CORREIOS
  priority
  police cir percent 1 conform-action transmit  exceed-action drop 
 class MISSAO_CRITICA_CORREIOS
  bandwidth percent 40 
  random-detect dscp-based
 class GERENCIAMENTO_CORREIOS
  bandwidth percent 9 
  random-detect dscp-based
 class NETWORK_CONTROL_CORREIOS
  bandwidth percent 1 
  random-detect dscp-based
 class BEST_EFFORT
  bandwidth percent 48 
  random-detect dscp-based
policy-map REMARCA_EXP_METRO
 class nni-H2
  set mpls experimental topmost 5
 class class-default
policy-map QDO_2048K_3_0_1_0_0_2_93
 class class-default
  shape average 2048000
  service-policy QPO_2048K_3_0_1_0_0_2_93
policy-map QPI_BBONE_S_20000_V1
 class class-default
  police 20000000 conform-action set-dscp-transmit default exceed-action drop 
policy-map QPI_BBONE_S_8000_V1
 class class-default
  police 8000000 conform-action set-dscp-transmit default exceed-action drop 
policy-map QPI_BBONE_N_1500_V1
 class class-default
  police 1500000 conform-action set-mpls-exp-imposition-transmit 0 exceed-action drop 
policy-map QPI_6000K_2_N_7_72_0_0_2_16
 class Voz_Q6
  police cir percent 2 conform-action transmit  exceed-action drop 
 class Video_Q6
  police cir percent 7 conform-action set-mpls-exp-imposition-transmit 5 exceed-action drop 
 class MissaoCritica_Q6
  police cir percent 72 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
 class class-default
  set mpls experimental topmost 0
policy-map QPO_2048K_13_25_11_0_0_2_1
 class Voz_Q6
  priority level 1
  police cir percent 13 conform-action transmit  exceed-action drop 
 class Video_Q6
  priority level 2
  police cir percent 25 conform-action transmit  exceed-action drop 
 class MissaoCritica_Q6
  bandwidth percent 11 
  random-detect dscp-based
  random-detect dscp 24 24 40 1
  random-detect dscp 26 24 40 1
  random-detect dscp 28 24 40 1
  random-detect dscp 30 24 40 1
  queue-limit 80 packets
 class NetworkControl_Q6
  bandwidth percent 2 
  queue-limit 40 packets
 class class-default
  bandwidth percent 1 
  random-detect dscp-based
  random-detect dscp 0 12 20 1
  queue-limit 40 packets
policy-map QPO_256K_40_0_4_0_0_7_48
 class Voz_Q6
  priority level 1
  police cir percent 40 conform-action transmit  exceed-action drop 
 class MissaoCritica_Q6
  bandwidth percent 4 
  random-detect dscp-based
  random-detect dscp 24 6 8 1
  random-detect dscp 26 6 8 1
  random-detect dscp 28 6 8 1
  random-detect dscp 30 6 8 1
  queue-limit 16 packets
 class NetworkControl_Q6
  bandwidth percent 7 
  queue-limit 18 packets
 class class-default
  bandwidth percent 48 
  random-detect dscp-based
  random-detect dscp 0 7 15 1
  queue-limit 30 packets
policy-map QDO_256K_40_0_4_0_0_7_48
 class class-default
  shape average 256000
  service-policy QPO_256K_40_0_4_0_0_7_48
policy-map QDO_Correios_1024K_ARPA_IOS_D_V1
 class class-default
  shape average 1024000
  service-policy QPO_Correios_1024K_ARPA_IOS_D_V1
policy-map QPI_4096K_7_N_0_0_0_0_2_89
 class Voz_Q6
  police cir percent 7 conform-action transmit  exceed-action drop 
 class class-default
  set mpls experimental topmost 0
policy-map QDI_4096K_7_0_0_0_0_2_89
 class class-default
  police rate 4096000  conform-action transmit  exceed-action drop 
  service-policy QPI_4096K_7_N_0_0_0_0_2_89
policy-map QPO_BBONE_10000_V1
 class class-default
  shape average 10000000 120000
policy-map QDI_1024K_22_0_36_22_0_2_17
 class class-default
  police rate 1024000  conform-action transmit  exceed-action drop 
  service-policy QPI_1024K_22_N_0_36_22_0_2_17
policy-map QPO_BBONE_24000_V1
 class class-default
  shape average 24000000 288000 288000
policy-map QPO_BBONE_12000_V1
 class class-default
  shape average 12000000 144000
policy-map QPI_6000K_16_N_15_10_25_0_1_30
 class Voz_Q6
  police cir percent 16 conform-action transmit  exceed-action drop 
 class Video_Q6
  police cir percent 15 conform-action set-mpls-exp-imposition-transmit 5 exceed-action drop 
 class MissaoCritica_Q6
  police cir percent 10 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
 class Interativa_Q6
  police cir percent 25 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
 class class-default
  set mpls experimental topmost 0
policy-map QDO_2048K_16_15_11_0_0_2_30
 class class-default
  shape average 2048000
  service-policy QPO_2048K_16_15_11_0_0_2_30
policy-map QPI_Correios_1024K_ARPA_IOS_D_V1
 class REAL_TIME_CORREIOS
  police cir percent 2 conform-action transmit  exceed-action drop 
 class MISSAO_CRITICA_CORREIOS
  police cir percent 40 conform-action transmit  exceed-action set-dscp-transmit af41
 class GERENCIAMENTO_CORREIOS
  police cir percent 9 conform-action transmit  exceed-action set-dscp-transmit af31
 class NETWORK_CONTROL_CORREIOS
  police cir percent 1 conform-action transmit  exceed-action set-dscp-transmit cs6
 class BEST_EFFORT
  police cir percent 47 conform-action transmit  exceed-action set-dscp-transmit default
policy-map QDO_4096K_8_0_0_0_0_1_89
 class class-default
  shape average 4096000
  service-policy QPO_4096K_8_0_0_0_0_1_89
policy-map QPI_BBONE_S_1024_V1
 class class-default
  police 1024000 conform-action set-dscp-transmit default exceed-action drop 
policy-map QPO_BBONE_256_V1
 class class-default
  shape average 256000 3072
policy-map ZERA-EXP-Saida
 class class-default
  set mpls experimental imposition 0
policy-map QDI_256K_40_0_4_0_0_7_48
 class class-default
  police rate 256000  conform-action transmit  exceed-action drop 
  service-policy QPI_256K_40_N_0_4_0_0_7_48
policy-map QDI_VIPSIP_VOZ_5400_V1
 class class-default
  police rate 5400000  conform-action transmit  exceed-action drop 
policy-map QPI_512K_5_N_0_30_16_4_4_40
 class Voz_Q6
  police cir percent 5 conform-action transmit  exceed-action drop 
 class MissaoCritica_Q6
  police cir percent 30 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
 class Interativa_Q6
  police cir percent 16 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
 class Bulk_Q6
  police cir percent 4 conform-action set-mpls-exp-imposition-transmit 4 exceed-action set-mpls-exp-imposition-transmit 1
 class class-default
  set mpls experimental topmost 0
policy-map QPI_1024K_4_N_0_52_0_0_2_29
 class Voz_Q6
  police cir percent 4 conform-action transmit  exceed-action drop 
 class MissaoCritica_Q6
  police cir percent 52 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
 class class-default
  set mpls experimental topmost 0
policy-map QPO_2048K_9_49_13_0_0_2_26
 class Voz_Q6
  priority level 1
  police cir percent 9 conform-action transmit  exceed-action drop 
 class Video_Q6
  priority level 2
  police cir percent 49 conform-action transmit  exceed-action drop 
 class MissaoCritica_Q6
  bandwidth percent 13 
  random-detect dscp-based
  random-detect dscp 24 14 30 1
  random-detect dscp 26 14 30 1
  random-detect dscp 28 14 30 1
  random-detect dscp 30 14 30 1
  queue-limit 60 packets
 class NetworkControl_Q6
  bandwidth percent 2 
  queue-limit 26 packets
 class class-default
  bandwidth percent 26 
  random-detect dscp-based
  random-detect dscp 0 32 48 1
  queue-limit 96 packets
policy-map QPI_4096K_16_N_50_0_0_0_1_31
 class Voz_Q6
  police cir percent 16 conform-action transmit  exceed-action drop 
 class Video_Q6
  police cir percent 50 conform-action set-mpls-exp-imposition-transmit 5 exceed-action drop 
 class class-default
  set mpls experimental topmost 0
policy-map QPI_BBONE_N_8000_V1
 class class-default
  police 8000000 conform-action set-mpls-exp-imposition-transmit 0 exceed-action drop 
policy-map QPI_BBONE_N_256_V1
 class class-default
  police 256000 conform-action set-mpls-exp-imposition-transmit 0 exceed-action drop 
policy-map QDO_2048K_BBrasil_NAC_IPSAN_IACC_V1
 class class-default
  shape average 2048000 account user-defined 18
  service-policy QPO_2048K_BBrasil_NAC_IPSAN_IACC_V1
policy-map QPI_6000K_9_N_9_54_0_0_2_25
 class Voz_Q6
  police cir percent 9 conform-action transmit  exceed-action drop 
 class Video_Q6
  police cir percent 9 conform-action set-mpls-exp-imposition-transmit 5 exceed-action drop 
 class MissaoCritica_Q6
  police cir percent 54 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
 class class-default
  set mpls experimental topmost 0
policy-map QDI_6000K_9_9_54_0_0_2_25
 class class-default
  police rate 6000000  conform-action transmit  exceed-action drop 
  service-policy QPI_6000K_9_N_9_54_0_0_2_25
policy-map QDO_Correios_256K_ARPA_IOS_D_V1
 class class-default
  shape average 256000
  service-policy QPO_Correios_256K_ARPA_IOS_D_V1
policy-map QPO_256K_19_0_57_0_0_7_16
 class Voz_Q6
  priority level 1
  police cir percent 19 conform-action transmit  exceed-action drop 
 class MissaoCritica_Q6
  bandwidth percent 57 
  random-detect dscp-based
  random-detect dscp 24 12 20 1
  random-detect dscp 26 12 20 1
  random-detect dscp 28 12 20 1
  random-detect dscp 30 12 20 1
  queue-limit 40 packets
 class NetworkControl_Q6
  bandwidth percent 7 
  queue-limit 18 packets
 class class-default
  bandwidth percent 16 
  random-detect dscp-based
  random-detect dscp 0 5 13 1
  queue-limit 26 packets
policy-map QPI_BBONE_S_100000_V1
 class class-default
  police 100000000 conform-action set-dscp-transmit default exceed-action drop 
policy-map QPI_BBONE_S_68000_V1
 class class-default
  police 68000000 conform-action set-dscp-transmit default exceed-action drop 
policy-map QDI_6000K_2_7_72_0_0_2_16
 class class-default
  police rate 6000000  conform-action transmit  exceed-action drop 
  service-policy QPI_6000K_2_N_7_72_0_0_2_16
policy-map QPO_BBONE_40000_V1
 class class-default
  shape average 40000000 480000
policy-map QPO_BBONE_512_V1
 class class-default
  shape average 512000 6144
policy-map QDO_256K_19_0_57_0_0_7_16
 class class-default
  shape average 256000
  service-policy QPO_256K_19_0_57_0_0_7_16
policy-map QDI_VIPSIP_VOZ_2600_V1
 class class-default
  police rate 2600000  conform-action transmit  exceed-action drop 
policy-map QPI_BBONE_S_6144_V1
 class class-default
  police 6144000 conform-action set-dscp-transmit default exceed-action drop 
policy-map QPO_4096K_13_0_62_0_0_2_22
 class Voz_Q6
  priority level 1
  police cir percent 13 conform-action transmit  exceed-action drop 
 class MissaoCritica_Q6
  bandwidth percent 62 
  random-detect dscp-based
  random-detect dscp 24 112 240 1
  random-detect dscp 26 112 240 1
  random-detect dscp 28 112 240 1
  random-detect dscp 30 112 240 1
  queue-limit 480 packets
 class NetworkControl_Q6
  bandwidth percent 2 
  queue-limit 30 packets
 class class-default
  bandwidth percent 22 
  random-detect dscp-based
  random-detect dscp 0 32 64 1
  queue-limit 128 packets
policy-map QDO_4096K_13_0_62_0_0_2_22
 class class-default
  shape average 4096000
  service-policy QPO_4096K_13_0_62_0_0_2_22
policy-map QPI_BBONE_S_16000_V1
 class class-default
  police 16000000 conform-action set-dscp-transmit default exceed-action drop 
policy-map QDO_Correios_2048K_ARPA_IOS_D_V1
 class class-default
  shape average 2048000
  service-policy QPO_Correios_2048K_ARPA_IOS_D_V1
policy-map QPO_4096K_16_50_0_0_0_1_31
 class Voz_Q6
  priority level 1
  police cir percent 16 conform-action transmit  exceed-action drop 
 class Video_Q6
  priority level 2
  police cir percent 50 conform-action transmit  exceed-action drop 
 class NetworkControl_Q6
  bandwidth percent 1 
  queue-limit 26 packets
 class class-default
  bandwidth percent 31 
  random-detect dscp-based
  random-detect dscp 0 56 120 1
  queue-limit 240 packets
policy-map QPO_VIPSIP_VOZ_5400_V1
 class Voz_Q6
  priority
  police rate 5336000  conform-action transmit  exceed-action drop 
 class NetworkControl_Q6
  bandwidth 64
  queue-limit 32 packets
policy-map QDO_VIPSIP_VOZ_5400_V1
 class class-default
  shape average 5400000
  service-policy QPO_VIPSIP_VOZ_5400_V1
policy-map QDI_4096K_13_0_62_0_0_2_22
 class class-default
  police rate 4096000  conform-action transmit  exceed-action drop 
  service-policy QPI_4096K_13_N_0_62_0_0_2_22
policy-map QDI_1024K_7_0_50_0_0_2_40
 class class-default
  police rate 1024000  conform-action transmit  exceed-action drop 
  service-policy QPI_1024K_7_N_0_50_0_0_2_40
policy-map QPI_2048K_BBrasil_NAC_IPSAN_IACC_V1
 class TEMPO_REAL_NAC
  police cir percent 30 conform-action transmit  exceed-action drop 
 class MISSAO_CRITICA_NAC
  police cir percent 40 conform-action transmit  exceed-action set-dscp-transmit af43
 class GERENCIAMENTO_NAC
  police cir percent 5 conform-action transmit  exceed-action set-dscp-transmit af33
 class NETWORK_CONTROL_NAC
  police cir percent 1 conform-action transmit  exceed-action set-dscp-transmit cs6
 class STANDARD_NAC
  police cir percent 20 conform-action transmit  exceed-action set-dscp-transmit default
policy-map QDI_2048K_BBrasil_NAC_IPSAN_IACC_V1
 class class-default
  police rate 2048000  conform-action transmit  exceed-action drop 
  service-policy QPI_2048K_BBrasil_NAC_IPSAN_IACC_V1
policy-map QDO_VIPSIP_VOZ_2700_V1
 class class-default
  shape average 2700000
  service-policy QPO_VIPSIP_VOZ_2700_V1
policy-map QDO_8000K_2_47_26_7_0_1_16
 class class-default
  shape average 8000000
  service-policy QPO_8000K_2_47_26_7_0_1_16
policy-map QDI_1024K_BBrasil_NAC_IPSAN_IACC_V1
 class class-default
  police rate 1024000  conform-action transmit  exceed-action drop 
  service-policy QPI_1024K_BBrasil_NAC_IPSAN_IACC_V1
policy-map QPO_BBONE_1500_V1
 class class-default
  shape average 1500000 18000
policy-map QPI_BBONE_N_12200_V1
 class class-default
  police 12200000 conform-action set-mpls-exp-imposition-transmit 0 exceed-action drop 
policy-map QPO_BBONE_6000_V1
 class class-default
  shape average 6000000 72000
policy-map QPI_4096K_3_N_0_50_13_13_1_17
 class Voz_Q6
  police cir percent 3 conform-action transmit  exceed-action drop 
 class MissaoCritica_Q6
  police cir percent 50 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
 class Interativa_Q6
  police cir percent 13 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
 class Bulk_Q6
  police cir percent 13 conform-action set-mpls-exp-imposition-transmit 4 exceed-action set-mpls-exp-imposition-transmit 1
 class class-default
  set mpls experimental topmost 0
policy-map QDO_1024K_30_0_0_0_0_2_66
 class class-default
  shape average 1024000
  service-policy QPO_1024K_30_0_0_0_0_2_66
policy-map QOS_DTS_OUT_2048K_64K_0K
 class class-default
  shape average 2048000
policy-map QDO_1024K_11_0_50_13_13_2_10
 class class-default
  shape average 1024000
  service-policy QPO_1024K_11_0_50_13_13_2_10
policy-map QPO_4096K_4_0_2_50_0_2_41
 class Voz_Q6
  priority level 1
  police cir percent 4 conform-action transmit  exceed-action drop 
 class MissaoCritica_Q6
  bandwidth percent 2 
  random-detect dscp-based
  random-detect dscp 24 7 15 1
  random-detect dscp 26 7 15 1
  random-detect dscp 28 7 15 1
  random-detect dscp 30 7 15 1
  queue-limit 30 packets
 class Interativa_Q6
  bandwidth percent 50 
  random-detect dscp-based
  random-detect dscp 18 112 240 1
  random-detect dscp 20 112 240 1
  random-detect dscp 22 112 240 1
  queue-limit 480 packets
 class NetworkControl_Q6
  bandwidth percent 2 
  queue-limit 30 packets
 class class-default
  bandwidth percent 41 
  random-detect dscp-based
  random-detect dscp 0 56 120 1
  queue-limit 240 packets
policy-map QDO_4096K_4_0_2_50_0_2_41
 class class-default
  shape average 4096000
  service-policy QPO_4096K_4_0_2_50_0_2_41
policy-map QPO_4096K_3_0_0_0_0_1_46
 class Voz_Q6
  priority level 1
  police cir percent 3 conform-action transmit  exceed-action drop 
 class NetworkControl_Q6
  bandwidth percent 1 
  queue-limit 96 packets
 class class-default
  bandwidth percent 46 
  random-detect dscp-based
  random-detect dscp 0 112 240 1
  queue-limit 480 packets
policy-map QDO_4096K_3_0_0_0_0_1_46
 class class-default
  shape average 4096000
  service-policy QPO_4096K_3_0_0_0_0_1_46
policy-map QPI_8000K_2_N_47_26_7_0_1_16
 class Voz_Q6
  police cir percent 2 conform-action transmit  exceed-action drop 
 class Video_Q6
  police cir percent 47 conform-action set-mpls-exp-imposition-transmit 5 exceed-action drop 
 class MissaoCritica_Q6
  police cir percent 26 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
 class Interativa_Q6
  police cir percent 7 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
 class class-default
  set mpls experimental topmost 0
policy-map QDI_8000K_2_47_26_7_0_1_16
 class class-default
  police rate 8000000  conform-action transmit  exceed-action drop 
  service-policy QPI_8000K_2_N_47_26_7_0_1_16
policy-map QPO_BBONE_1000000_V1
 class class-default
  shape average 1000000000 12000000
policy-map QDO_4096K_16_50_0_0_0_1_31
 class class-default
  shape average 4096000
  service-policy QPO_4096K_16_50_0_0_0_1_31
policy-map QDO_4096K_25_0_0_0_0_1_71
 class class-default
  shape average 4096000
  service-policy QPO_4096K_25_0_0_0_0_1_71
policy-map QDI_2048K_11_0_41_0_11_1_35
 class class-default
  police rate 2048000  conform-action transmit  exceed-action drop 
  service-policy QPI_2048K_11_N_0_41_0_11_1_35
policy-map QDI_2048K_7_0_33_0_8_2_49
 class class-default
  police rate 2048000  conform-action transmit  exceed-action drop 
  service-policy QPI_2048K_7_N_0_33_0_8_2_49
policy-map QDO_VIPSIP_VOZ_600_V1
 class class-default
  shape average 600000
  service-policy QPO_VIPSIP_VOZ_600_V1
policy-map QDI_1024K_4_0_52_0_0_2_29
 class class-default
  police rate 1024000  conform-action transmit  exceed-action drop 
  service-policy QPI_1024K_4_N_0_52_0_0_2_29
policy-map QPI_1024K_10_N_24_20_0_40_2_3
 class Voz_Q6
  police cir percent 10 conform-action transmit  exceed-action drop 
 class Video_Q6
  police cir percent 24 conform-action set-mpls-exp-imposition-transmit 5 exceed-action drop 
 class MissaoCritica_Q6
  police cir percent 20 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
 class Bulk_Q6
  police cir percent 40 conform-action set-mpls-exp-imposition-transmit 4 exceed-action set-mpls-exp-imposition-transmit 1
 class class-default
  set mpls experimental topmost 0
policy-map QDI_1024K_10_24_20_0_40_2_3
 class class-default
  police rate 1024000  conform-action transmit  exceed-action drop 
  service-policy QPI_1024K_10_N_24_20_0_40_2_3
policy-map QPO_1024K_22_0_36_22_0_2_17
 class Voz_Q6
  priority level 1
  police cir percent 22 conform-action transmit  exceed-action drop 
 class MissaoCritica_Q6
  bandwidth percent 36 
  random-detect dscp-based
  random-detect dscp 24 14 30 1
  random-detect dscp 26 14 30 1
  random-detect dscp 28 14 30 1
  random-detect dscp 30 14 30 1
  queue-limit 60 packets
 class Interativa_Q6
  bandwidth percent 22 
  random-detect dscp-based
  random-detect dscp 18 12 20 1
  random-detect dscp 20 12 20 1
  random-detect dscp 22 12 20 1
  queue-limit 40 packets
 class NetworkControl_Q6
  bandwidth percent 2 
  queue-limit 18 packets
 class class-default
  bandwidth percent 17 
  random-detect dscp-based
  random-detect dscp 0 12 20 1
  queue-limit 40 packets
policy-map QDO_4096K_8_0_1_0_0_1_89
 class class-default
  shape average 4096000
  service-policy QPO_4096K_8_0_1_0_0_1_89
policy-map QDO_12000K_13_38_21_7_13_1_6
 class class-default
  shape average 12000000
  service-policy QPO_12000K_13_38_21_7_13_1_6
policy-map QDO_VIPSIP_VOZ_18200_V1
 class class-default
  shape average 18200000
  service-policy QPO_VIPSIP_VOZ_18200_V1
policy-map QDO_Correios_4096K_ARPA_IOS_D_V1
 class class-default
  shape average 4096000
  service-policy QPO_Correios_4096K_ARPA_IOS_D_V1
policy-map QDI_1024K_6_0_36_27_19_2_8
 class class-default
  police rate 1024000  conform-action transmit  exceed-action drop 
  service-policy QPI_1024K_6_N_0_36_27_19_2_8
policy-map QDO_2048K_13_25_11_0_0_2_1
 class class-default
  shape average 2048000
  service-policy QPO_2048K_13_25_11_0_0_2_1
policy-map QPO_BBONE_400_V1
 class class-default
  shape average 400000 4800
policy-map QDO_6000K_2_7_64_0_0_2_24
 class class-default
  shape average 6000000
  service-policy QPO_6000K_2_7_64_0_0_2_24
policy-map QDI_SERPRO_4096K_V1
 class class-default
  police rate 4096000  conform-action transmit  exceed-action drop 
  service-policy QPI_SERPRO_4096K_V1
policy-map QPI_BBONE_N_512_V1
 class class-default
  police 512000 conform-action set-mpls-exp-imposition-transmit 0 exceed-action drop 
policy-map QDI_2048K_15_0_50_20_5_2_7
 class class-default
  police rate 2048000  conform-action transmit  exceed-action drop 
  service-policy QPI_2048K_15_N_0_50_20_5_2_7
policy-map QDO_2048K_9_49_13_0_0_2_26
 class class-default
  shape average 2048000
  service-policy QPO_2048K_9_49_13_0_0_2_26
policy-map QDO_2048K_15_0_50_20_5_2_7
 class class-default
  shape average 2048000
  service-policy QPO_2048K_15_0_50_20_5_2_7
policy-map QPO_1024K_6_0_36_27_19_2_8
 class Voz_Q6
  priority level 1
  police cir percent 6 conform-action transmit  exceed-action drop 
 class MissaoCritica_Q6
  bandwidth percent 36 
  random-detect dscp-based
  random-detect dscp 24 14 30 1
  random-detect dscp 26 14 30 1
  random-detect dscp 28 14 30 1
  random-detect dscp 30 14 30 1
  queue-limit 60 packets
 class Interativa_Q6
  bandwidth percent 27 
  random-detect dscp-based
  random-detect dscp 18 14 30 1
  random-detect dscp 20 14 30 1
  random-detect dscp 22 14 30 1
  queue-limit 60 packets
 class Bulk_Q6
  bandwidth percent 19 
  random-detect dscp-based
  random-detect dscp 8 12 20 1
  random-detect dscp 10 12 20 1
  random-detect dscp 12 12 20 1
  random-detect dscp 14 12 20 1
  random-detect dscp 32 12 20 1
  queue-limit 40 packets
 class NetworkControl_Q6
  bandwidth percent 2 
  queue-limit 18 packets
 class class-default
  bandwidth percent 8 
  random-detect dscp-based
  random-detect dscp 0 7 15 1
  queue-limit 30 packets
policy-map QDO_1024K_6_0_36_27_19_2_8
 class class-default
  shape average 1024000
  service-policy QPO_1024K_6_0_36_27_19_2_8
policy-map QPI_BBONE_N_400_V1
 class class-default
  police 400000 conform-action set-mpls-exp-imposition-transmit 0 exceed-action drop 
policy-map QDO_34000K_2_7_0_0_0_2_88
 class class-default
  shape average 34000000
  service-policy QPO_34000K_2_7_0_0_0_2_88
policy-map QDO_1024K_22_0_36_22_0_2_17
 class class-default
  shape average 1024000
  service-policy QPO_1024K_22_0_36_22_0_2_17
policy-map QPI_BBONE_S_2048_V1
 class class-default
  police 2048000 conform-action set-dscp-transmit default exceed-action drop 
policy-map QDI_VIPSIP_VOZ_2700_V1
 class class-default
  police rate 2700000  conform-action transmit  exceed-action drop 
policy-map QDO_10000K_16_0_0_0_0_2_81
 class class-default
  shape average 10000000
  service-policy QPO_10000K_16_0_0_0_0_2_81
policy-map QDI_6000K_16_15_10_25_0_1_30
 class class-default
  police rate 6000000  conform-action transmit  exceed-action drop 
  service-policy QPI_6000K_16_N_15_10_25_0_1_30
policy-map QDI_512K_5_0_30_16_4_4_40
 class class-default
  police rate 512000  conform-action transmit  exceed-action drop 
  service-policy QPI_512K_5_N_0_30_16_4_4_40
policy-map QDI_2048K_21_0_35_20_0_1_21
 class class-default
  police rate 2048000  conform-action transmit  exceed-action drop 
  service-policy QPI_2048K_21_N_0_35_20_0_1_21
policy-map QDO_2048K_15_0_0_0_0_2_81
 class class-default
  shape average 2048000
  service-policy QPO_2048K_15_0_0_0_0_2_81
policy-map QPO_BBONE_155000_V1
 class class-default
  shape average 155000000 1860000
policy-map QDO_VIPSIP_VOZ_1500_V1
 class class-default
  shape average 1500000
  service-policy QPO_VIPSIP_VOZ_1500_V1
policy-map QDI_10000K_10_20_26_0_0_1_40
 class class-default
  police rate 10000000  conform-action transmit  exceed-action drop 
  service-policy QPI_10000K_10_N_20_26_0_0_1_40
policy-map QPI_2048K_8_N_0_59_17_0_2_13
 class Voz_Q6
  police cir percent 8 conform-action transmit  exceed-action drop 
 class MissaoCritica_Q6
  police cir percent 59 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
 class Interativa_Q6
  police cir percent 17 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
 class class-default
  set mpls experimental topmost 0
policy-map QPO_2048K_6_0_15_23_37_2_16
 class Voz_Q6
  priority level 1
  police cir percent 6 conform-action transmit  exceed-action drop 
 class MissaoCritica_Q6
  bandwidth percent 15 
  random-detect dscp-based
  random-detect dscp 24 14 30 1
  random-detect dscp 26 14 30 1
  random-detect dscp 28 14 30 1
  random-detect dscp 30 14 30 1
  queue-limit 60 packets
 class Interativa_Q6
  bandwidth percent 23 
  random-detect dscp-based
  random-detect dscp 18 24 40 1
  random-detect dscp 20 24 40 1
  random-detect dscp 22 24 40 1
  queue-limit 80 packets
 class Bulk_Q6
  bandwidth percent 37 
  random-detect dscp-based
  random-detect dscp 8 32 48 1
  random-detect dscp 10 32 48 1
  random-detect dscp 12 32 48 1
  random-detect dscp 14 32 48 1
  random-detect dscp 32 32 48 1
  queue-limit 96 packets
 class NetworkControl_Q6
  bandwidth percent 2 
  queue-limit 26 packets
 class class-default
  bandwidth percent 16 
  random-detect dscp-based
  random-detect dscp 0 14 30 1
  queue-limit 60 packets
policy-map QPI_BBONE_S_1000000_V1
 class class-default
  police 1000000000 conform-action set-dscp-transmit default exceed-action drop 
policy-map QDO_2048K_7_0_50_0_13_2_27
 class class-default
  shape average 2048000
  service-policy QPO_2048K_7_0_50_0_13_2_27
policy-map QDI_Correios_1024K_ARPA_IOS_D_V1
 class class-default
  police cir 1024000 conform-action transmit  exceed-action drop 
  service-policy QPI_Correios_1024K_ARPA_IOS_D_V1
policy-map QDO_6000K_2_7_72_0_0_2_16
 class class-default
  shape average 6000000
  service-policy QPO_6000K_2_7_72_0_0_2_16
policy-map QPO_BBONE_600000_V1
 class class-default
  shape average 600000000 7200000
policy-map QDI_VIPSIP_VOZ_5800_V1
 class class-default
  police rate 5800000  conform-action transmit  exceed-action drop 
policy-map QPO_BBONE_800_V1
 class class-default
  shape average 800000 9600
policy-map SaidaIntBackbone_10Gbps
 class class-default
  shape average 10000000000
policy-map QPO_512K_BBrasil_NAC_IPSAN_IACC_V1
 class TEMPO_REAL_NAC
  priority level 1
  police cir percent 21 bc 300 ms conform-action transmit  exceed-action drop 
 class MISSAO_CRITICA_NAC
  bandwidth remaining percent 53 
  random-detect dscp-based
  random-detect dscp 32 12 20 1
  random-detect dscp 34 12 20 1
  random-detect dscp 38 12 20 1
  queue-limit 40 packets
  police cir 512000 conform-action set-dscp-transmit af31 exceed-action set-dscp-transmit af33 violate-action drop 
 class GERENCIAMENTO_NAC
  bandwidth remaining percent 20 
  random-detect dscp-based
  random-detect dscp 24 7 15 1
  random-detect dscp 26 7 15 1
  random-detect dscp 30 7 15 1
  queue-limit 30 packets
  police cir 512000 conform-action set-dscp-transmit af11 exceed-action set-dscp-transmit af13 violate-action drop 
 class NETWORK_CONTROL_NAC
  bandwidth remaining percent 4 
  random-detect dscp-based
  random-detect dscp 48 5 9 1
  queue-limit 18 packets
 class STANDARD_NAC
  bandwidth remaining percent 23 
  random-detect dscp-based
  random-detect dscp 0 7 15 1
  queue-limit 30 packets
  police cir 512000 conform-action set-dscp-transmit af21 exceed-action set-dscp-transmit af23 violate-action drop 
policy-map QDI_1024K_0_0_40_30_21_2_6
 class class-default
  police rate 1024000  conform-action transmit  exceed-action drop 
  service-policy QPI_1024K_0_N_0_40_30_21_2_6
policy-map QDI_2048K_16_15_11_25_0_2_30
 class class-default
  police rate 2048000  conform-action transmit  exceed-action drop 
  service-policy QPI_2048K_16_N_15_11_25_0_2_30
policy-map QDO_2048K_6_0_15_23_37_2_16
 class class-default
  shape average 2048000
  service-policy QPO_2048K_6_0_15_23_37_2_16
policy-map QDO_Correios_2048K_ARPA_IOS_D_VID_V1
 class class-default
  shape average 2048000
  service-policy QPO_Correios_2048K_ARPA_IOS_D_VID_V1
policy-map QDI_8000K_13_6_57_19_0_1_1
 class class-default
  police rate 8000000  conform-action transmit  exceed-action drop 
  service-policy QPI_8000K_13_N_6_57_19_0_1_1
policy-map QDO_512K_BBrasil_NAC_IPSAN_IACC_V1
 class class-default
  shape average 512000 account user-defined 18
  service-policy QPO_512K_BBrasil_NAC_IPSAN_IACC_V1
policy-map QDI_4096K_16_50_0_0_0_1_31
 class class-default
  police rate 4096000  conform-action transmit  exceed-action drop 
  service-policy QPI_4096K_16_N_50_0_0_0_1_31
policy-map QDI_4096K_3_0_50_13_13_1_17
 class class-default
  police rate 4096000  conform-action transmit  exceed-action drop 
  service-policy QPI_4096K_3_N_0_50_13_13_1_17
policy-map QDI_2048K_8_0_59_17_0_2_13
 class class-default
  police rate 2048000  conform-action transmit  exceed-action drop 
  service-policy QPI_2048K_8_N_0_59_17_0_2_13
policy-map QDO_Correios_128K_ARPA_IOS_D_V1
 class class-default
  shape average 128000
  service-policy QPO_Correios_128K_ARPA_IOS_D_V1
policy-map QDO_8000K_2_47_26_0_0_1_23
 class class-default
  shape average 8000000
  service-policy QPO_8000K_2_47_26_0_0_1_23
!
!
! 
!
!
!
!
!
!
!
!
interface Null0
 no ip unreachables
!
interface Loopback0
 description endereco de Acesso ao Roteador 
 ip address 200.244.29.160 255.255.255.255
 no ip redirects
 no ip unreachables
 no ip proxy-arp
 ip pim sparse-mode
 ipv6 address 2804:A8::200:244:29:160/128
 hold-queue 2000 in
!
interface Loopback7
 description Loopback Gerencia Peakflow
 ip address 200.244.7.51 255.255.255.255
!
interface Loopback2018
 description ENDERECO BGP - SIVNET
 ip address 200.253.180.69 255.255.255.255
 shutdown
!
interface Loopback2002251884
 description TCU | BGP | 65000
 ip vrf forwarding TCU:1628
 no ip address
 no clns route-cache
!
interface Loopback2002251885
 description TCU | BGP | 65000
 ip vrf forwarding TCU:1628
 ip address 10.253.52.20 255.255.255.255
 no clns route-cache
!
interface GigabitEthernet0/0/0
 vrf forwarding L2L_INTERURBANO:6489
 dampening
 mtu 9096
 ip address 10.19.205.166 255.255.255.252
 no ip redirects
 ip mtu 1500
 load-interval 30
 no negotiation auto
 mpls bgp forwarding
 bfd interval 100 min_rx 100 multiplier 3
 service-policy input REMARCA_EXP_METRO
 service-policy output SaidaIntBackbone_10Gbps
!
interface GigabitEthernet0/0/1
 vrf forwarding L2L_INTERURBANO:6489
 dampening
 mtu 9096
 ip address 10.19.205.218 255.255.255.252
 no ip redirects
 ip mtu 1500
 load-interval 30
 no negotiation auto
 mpls bgp forwarding
 bfd interval 100 min_rx 100 multiplier 3
 service-policy input REMARCA_EXP_METRO
 service-policy output SaidaIntBackbone_10Gbps
!
interface GigabitEthernet0/0/2
 vrf forwarding L2L_INTERURBANO:6489
 dampening
 mtu 9096
 ip address 10.19.205.222 255.255.255.252
 no ip redirects
 ip mtu 1500
 load-interval 30
 no negotiation auto
 mpls bgp forwarding
 bfd interval 100 min_rx 100 multiplier 3
 service-policy input REMARCA_EXP_METRO
 service-policy output SaidaIntBackbone_10Gbps
!
interface GigabitEthernet0/0/3
 no ip address
 shutdown
 negotiation auto
!
interface GigabitEthernet0/0/4
 description LINK ETH | 1000M | SLSUSIT/SLSUSME/1G/010 | 7609SR_SLS_US-01 GIG 1/7 
 no ip address
 load-interval 30
 no negotiation auto
!
interface GigabitEthernet0/0/4.15257
 description REDE_BJNET  | 400M | SIS/IP/00179 | (SIS/IP/00179)
 bandwidth 400000
 encapsulation dot1Q 1525 second-dot1q 7
 ip address 189.23.73.101 255.255.255.252
 no ip proxy-arp
 ipv6 address 2804:A8:2:9A::D5/126
 ipv6 enable
 service-policy input QPI_BBONE_S_400000_V1
 service-policy output QPO_BBONE_400000_V1
!
interface GigabitEthernet0/0/4.15282
 description SIVNET  | 600M | SIS/IP/00028 | (SIS/IP/00028)
 bandwidth 600000
 encapsulation dot1Q 1528 second-dot1q 2
 ip address 201.45.138.41 255.255.255.252
 no ip proxy-arp
 service-policy input QPI_BBONE_S_600000_V1
 service-policy output QPO_BBONE_600000_V1
!
interface GigabitEthernet0/1/0
 description RESERVADO PARA RESERVADO PARA PROJETO CLARO_L3 | FONTAIN | 2121-7389 | 18/10/2017
 no ip address
 shutdown
 negotiation auto
!
interface GigabitEthernet0/1/1
 no ip address
 shutdown
 negotiation auto
!
interface GigabitEthernet0/1/2
 no ip address
 shutdown
 negotiation auto
!
interface GigabitEthernet0/1/3
 no ip address
 shutdown
 negotiation auto
!
interface GigabitEthernet0/1/4
 no ip address
 shutdown
 negotiation auto
!
interface GigabitEthernet2/0/0
 description LINK ETH | 1000M | SLSUSIT/SLSUSME/1G/001 | 7609SR_SLS_US-01 Gi1/1
 no ip address
 load-interval 30
 no negotiation auto
!
interface GigabitEthernet2/0/0.15002
 description GRANEL  | 20M | SLS/IP/05245 | (SLS/IP/05245)
 bandwidth 20000
 encapsulation dot1Q 1500 second-dot1q 2
 ip address 200.172.12.25 255.255.255.252
 no ip proxy-arp
 service-policy input QPI_BBONE_S_20000_V1
 service-policy output QPO_BBONE_20000_V1
!
interface GigabitEthernet2/0/0.15003
 description UCB  | 4096K | SLS/IP/05638 | (SLS/IP/05638)
 bandwidth 4096
 encapsulation dot1Q 1500 second-dot1q 3
 ip address 200.241.95.137 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_4096_V1
 service-policy output QPO_BBONE_4096_V1
!
interface GigabitEthernet2/0/0.15004
 description DIMENSAOENGE  | 10M | SLS/IP/05576 | (SLS/IP/05576)
 bandwidth 10000
 encapsulation dot1Q 1500 second-dot1q 4
 ip address 200.172.13.25 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_10000_V1
 service-policy output QPO_BBONE_10000_V1
!
interface GigabitEthernet2/0/0.15006
 description CORREDOR LOGISTICA E INFRA.  | 10M | SLS/IP/05659 | (SLS/IP/05659)
 bandwidth 10000
 encapsulation dot1Q 1500 second-dot1q 6
 ip address 200.241.95.185 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_10000_V1
 service-policy output QPO_BBONE_10000_V1
!
interface GigabitEthernet2/0/0.15017
 description UNIAO COMERC BARAO  | 1500K | SLS/VL/9833118600 | (SLS/VL/9833118600)
 bandwidth 1500
 encapsulation dot1Q 1501 second-dot1q 7
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.241.95.177 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QDI_VIPSIP_VOZ_1500_V1
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet2/0/0.15019
 description DIMENSAOENGE  | 1500K | SLS/VL/9833115750 | (SLS/VL/9833115750)
 bandwidth 1500
 encapsulation dot1Q 1501 second-dot1q 9
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.241.95.197 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QDI_VIPSIP_VOZ_1500_V1
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet2/0/0.15032
 description ODEBRECHT AMBIENTAL  | 10M | PCL/IP/00135 | (PCL/IP/00135)
 bandwidth 10000
 encapsulation dot1Q 1503 second-dot1q 2
 ip address 200.179.213.165 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_10000_V1
 service-policy output QPO_BBONE_10000_V1
!
interface GigabitEthernet2/0/0.15043
 description ODEBRECHT AMBIENTAL  | 1500K | PCL/VL/9838785888 | (PCL/VL/9838785888)
 bandwidth 1500
 encapsulation dot1Q 1504 second-dot1q 3
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 201.45.205.21 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QDI_VIPSIP_VOZ_1500_V1
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet2/0/0.15045
 description CLARO  | 18200K | SLS/VL/9821080450 | (SLS/VL/9821080450)
 bandwidth 18200
 encapsulation dot1Q 1504 second-dot1q 5
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 201.45.205.145 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QDI_VIPSIP_VOZ_18200_V1
 service-policy output QDO_VIPSIP_VOZ_18200_V1
!
interface GigabitEthernet2/0/0.15046
 description ITAU UNIBANCO  | 1500K | SJE/VL/9833137300 | (SJE/VL/9833137300)
 bandwidth 1500
 encapsulation dot1Q 1504 second-dot1q 6
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 201.45.205.153 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QDI_VIPSIP_VOZ_1500_V1
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet2/0/0.15049
 description MATEUS  | 1500K | SJE/VL/9833134630 | (SJE/VL/9833134630)
 bandwidth 1500
 encapsulation dot1Q 1504 second-dot1q 9
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.179.228.1 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QDI_VIPSIP_VOZ_1500_V1
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet2/0/0.15054
 description ODEBRECHT  | 4096K | SLS/IP/05889 | (SLS/IP/05889) | BGP_AS65000
 bandwidth 4096
 encapsulation dot1Q 1505 second-dot1q 4
 ip vrf forwarding FOZDOBR:5275
 ip address 201.45.205.17 255.255.255.252
 no ip proxy-arp
 service-policy input QPI_BBONE_N_4096_V1
 service-policy output QPO_BBONE_4096_V1
!
interface GigabitEthernet2/0/0.15083
 description NACIONALGAS  | 2048K | SLS/IP/00605 | (SLS/IP/00605) | BGP_AS65131
 bandwidth 2048
 encapsulation dot1Q 1508 second-dot1q 3
 ip vrf forwarding NACIONALGAS:3635
 ip address 189.23.28.145 255.255.255.252
 no ip proxy-arp
 service-policy input QDI_2048K_7_0_50_0_13_2_27
 service-policy output QDO_2048K_7_0_50_0_13_2_27
!
interface GigabitEthernet2/0/0.15168
!
interface GigabitEthernet2/0/0.150010
 description CONSORCIO TEGRAM - ITAQUI  | 10M | SLS/IP/05675 | (SLS/IP/05675)
 bandwidth 10000
 encapsulation dot1Q 1500 second-dot1q 10
 ip address 200.241.95.141 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_10000_V1
 service-policy output QPO_BBONE_10000_V1
!
interface GigabitEthernet2/0/0.150012
 description AMAGGI  | 10M | SLS/IP/05732 | (SLS/IP/05732)
 bandwidth 10000
 encapsulation dot1Q 1500 second-dot1q 12
 ip address 200.179.213.9 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_10000_V1
 service-policy output QPO_BBONE_10000_V1
!
interface GigabitEthernet2/0/0.150013
 description TERMINAL CORREDOR NORTE  | 10M | SLS/IP/05698 | (SLS/IP/05698)
 bandwidth 10000
 encapsulation dot1Q 1500 second-dot1q 13
 ip address 200.241.95.145 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_10000_V1
 service-policy output QPO_BBONE_10000_V1
!
interface GigabitEthernet2/0/0.150014
 description GLENCORE SERVICOS  | 10M | SLS/IP/05667 | (SLS/IP/05667)
 bandwidth 10000
 encapsulation dot1Q 1500 second-dot1q 14
 ip address 200.241.95.149 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_10000_V1
 service-policy output QPO_BBONE_10000_V1
!
interface GigabitEthernet2/0/0.150017
 description CIMAR  | 4096K | SLS/IP/05782 | (SLS/IP/05782)
 bandwidth 4096
 encapsulation dot1Q 1500 second-dot1q 17
 ip address 200.179.213.129 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_4096_V1
 service-policy output QPO_BBONE_4096_V1
!
interface GigabitEthernet2/0/0.150024
 description ALCAN  | 20M | SLS/IP/00458 | (SLS/IP/00458)
 bandwidth 20000
 encapsulation dot1Q 1500 second-dot1q 24
 ip address 200.249.175.141 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_20000_V1
 service-policy output QPO_BBONE_20000_V1
!
interface GigabitEthernet2/0/0.150032
 description COMERCIALROFE  | 10M | SLS/IP/05971 | (SLS/IP/05971)
 bandwidth 10000
 encapsulation dot1Q 1500 second-dot1q 32
 ip address 201.45.205.201 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_10000_V1
 service-policy output QPO_BBONE_10000_V1
!
interface GigabitEthernet2/0/0.150035
 description RISA  | 10M | SLS/IP/06000 | (SLS/IP/06000)
 bandwidth 10000
 encapsulation dot1Q 1500 second-dot1q 35
 ip address 201.45.221.185 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_10000_V1
 service-policy output QPO_BBONE_10000_V1
!
interface GigabitEthernet2/0/0.150116
 description GLENCORE SERVICOS  | 1500K | SLS/VL/9833347133 | (SLS/VL/9833347133)
 bandwidth 1500
 encapsulation dot1Q 1501 second-dot1q 16
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 201.45.205.121 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QDI_VIPSIP_VOZ_1500_V1
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet2/0/0.150118
 description TERMINAL CORREDOR NORTE  | 1500K | SLS/VL/9833348100 | (SLS/VL/9833348100)
 bandwidth 1500
 encapsulation dot1Q 1501 second-dot1q 18
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.179.213.137 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QDI_VIPSIP_VOZ_1500_V1
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet2/0/0.150121
 description CORREDOR LOGISTICA E INFRA.  | 1500K | SLS/VL/9833135150 | (SLS/VL/9833135150)
 bandwidth 1500
 encapsulation dot1Q 1501 second-dot1q 21
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 201.45.221.41 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet2/0/0.150123
 description SCHIN  | 1500K | SLS/VL/9833012750 | (SLS/VL/9833012750)
 bandwidth 1500
 encapsulation dot1Q 1501 second-dot1q 23
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 201.45.205.29 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QDI_VIPSIP_VOZ_1500_V1
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet2/0/0.150125
 description AMAGGI  | 1500K | SLS/VL/9821088600 | (SLS/VL/9821088600)
 bandwidth 1500
 encapsulation dot1Q 1501 second-dot1q 25
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 201.45.205.137 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QDI_VIPSIP_VOZ_1500_V1
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet2/0/0.150126
 description CIMAR  | 1500K | SLS/VL/9840091800 | (SLS/VL/9840091800)
 bandwidth 1500
 encapsulation dot1Q 1501 second-dot1q 26
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 201.45.205.193 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QDI_VIPSIP_VOZ_1500_V1
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet2/0/0.150127
 description RODOPRADO  | 1500K | SLS/VL/9832414133 | (SLS/VL/9832414133)
 bandwidth 1500
 encapsulation dot1Q 1501 second-dot1q 27
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.241.95.213 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QDI_VIPSIP_VOZ_1500_V1
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet2/0/0.150129
 description GASPAR  | 400K | SLS/VL/9832441205 | (SLS/VL/9832441205)
 bandwidth 400
 encapsulation dot1Q 1501 second-dot1q 29
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 201.45.221.21 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QDI_VIPSIP_VOZ_400_V1
 service-policy output QDO_VIPSIP_VOZ_400_V1
!
interface GigabitEthernet2/0/0.150131
 description VOTORANTIM  | 1500K | SLS/VL/9832119600 | (SLS/VL/9832119600)
 bandwidth 1500
 encapsulation dot1Q 1501 second-dot1q 31
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 201.45.221.129 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QDI_VIPSIP_VOZ_1500_V1
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet2/0/0.150133
 description COMERCIALROFE  | 1200K | SLS/VL/9821067373 | (SLS/VL/9821067373)
 bandwidth 1200
 encapsulation dot1Q 1501 second-dot1q 33
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.179.213.101 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QDI_VIPSIP_VOZ_1200_V1
 service-policy output QDO_VIPSIP_VOZ_1200_V1
!
interface GigabitEthernet2/0/0.150134
 description RISA  | 400K | SLS/VL/9821094480 | (SLS/VL/9821094480)
 bandwidth 400
 encapsulation dot1Q 1501 second-dot1q 34
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 201.45.205.165 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QDI_VIPSIP_VOZ_400_V1
 service-policy output QDO_VIPSIP_VOZ_400_V1
!
interface GigabitEthernet2/0/0.150136
 description CONSORCIO TEGRAM - ITAQUI  | 1500K | SLS/VL/9840097170 | (SLS/VL/9840097170)
 bandwidth 1500
 encapsulation dot1Q 1501 second-dot1q 36
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 201.45.221.193 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet2/0/0.150215
 description SCHIN  | 4096K | SLS/IP/05772 | (SLS/IP/05772) | BGP_AS65476
 bandwidth 4096
 encapsulation dot1Q 1502 second-dot1q 15
 ip vrf forwarding SCHIN:1097
 ip address 200.179.213.37 255.255.255.252
 no ip proxy-arp
 service-policy input QPI_BBONE_N_4096_V1
 service-policy output QPO_BBONE_4096_V1
!
interface GigabitEthernet2/0/0.150219
 description CIMAR  | 2048K | SLS/IP/05839 | (SLS/IP/05839) | BGP_AS65000
 bandwidth 2048
 encapsulation dot1Q 1502 second-dot1q 19
 ip vrf forwarding CIMAR:6974
 ip address 200.179.213.145 255.255.255.252
 no ip proxy-arp
 service-policy input QPI_BBONE_N_2048_V1
 service-policy output QPO_BBONE_2048_V1
!
interface GigabitEthernet2/0/0.150220
 description VOTORANTIM  | 4096K | SLS/IP/05777 | (SLS/IP/05777) | BGP_AS64854
 bandwidth 4096
 encapsulation dot1Q 1502 second-dot1q 20
 ip vrf forwarding VOTORANTIM:4561
 ip address 200.179.213.157 255.255.255.252
 no ip proxy-arp
 service-policy input QDI_4096K_9_25_28_14_0_2_20
 service-policy output QDO_4096K_9_25_28_14_0_2_20
!
interface GigabitEthernet2/0/0.150222
 description AMAGGI  | 1024K | SLS/IP/05843 | (SLS/IP/05843)
 bandwidth 1024
 encapsulation dot1Q 1502 second-dot1q 22
 ip vrf forwarding AMAGGI:2738
 ip address 200.179.213.181 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QDI_1024K_4_0_52_0_0_2_29
 service-policy output QDO_1024K_4_0_52_0_0_2_29
!
interface GigabitEthernet2/0/0.150228
 description GASPAR  | 2048K | SLS/IP/05945 | (SLS/IP/05945)
 bandwidth 2048
 encapsulation dot1Q 1502 second-dot1q 28
 ip address 201.45.221.17 255.255.255.252
 no ip proxy-arp
 service-policy input QPI_BBONE_S_2048_V1
 service-policy output QPO_BBONE_2048_V1
!
interface GigabitEthernet2/0/0.150310
 description FAMA  | 50M | SLS/IP/05993 | (SLS/IP/05993)
 bandwidth 50000
 encapsulation dot1Q 1503 second-dot1q 10
 ip address 200.172.12.161 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_50000_V1
 service-policy output QPO_BBONE_50000_V1
!
interface GigabitEthernet2/0/0.150413
 description TRANSUL  | 800K | SLS/VL/9821061880 | (SLS/VL/9821061880)
 bandwidth 800
 encapsulation dot1Q 1504 second-dot1q 13
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.179.126.141 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QDI_VIPSIP_VOZ_800_V1
 service-policy output QDO_VIPSIP_VOZ_800_V1
!
interface GigabitEthernet2/0/0.150512
 description TENDTUDO  | 2048K | SJE/IP/00174 | (SJE/IP/00174)
 bandwidth 2048
 encapsulation dot1Q 1505 second-dot1q 12
 ip vrf forwarding TENDTUDO:1965
 ip address 200.179.228.253 255.255.255.252
 no ip proxy-arp
 service-policy input QOS_DTS_IN_2048K_64K_0K
 service-policy output QOS_DTS_OUT_2048K_64K_0K
!
interface GigabitEthernet2/0/0.150918
 description GASTROMED ACAILANDIA  | 6000K | ACD/IP/00164 | (ACD/IP/00164)
 bandwidth 6000
 encapsulation dot1Q 1509 second-dot1q 18
 ip address 187.29.255.229 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_6000_V1
 service-policy output QPO_BBONE_6000_V1
!
interface GigabitEthernet2/0/0.370226
 service-policy input QDI_Correios_4096K_ARPA_IOS_DVV_V1
 service-policy output QDO_Correios_4096K_ARPA_IOS_DVV_V1
!
interface GigabitEthernet2/0/0.1503202
 description ACO MARANHAO  | 10M | SLS/IP/04575 | (SLS/IP/04575)
 bandwidth 10000
 encapsulation dot1Q 1503 second-dot1q 202
 ip address 200.241.80.69 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_10000_V1
 service-policy output QPO_BBONE_10000_V1
!
interface GigabitEthernet2/0/0.1503204
 description TRANSUL  | 20M | SLS/IP/05601 | (SLS/IP/05601)
 bandwidth 20000
 encapsulation dot1Q 1503 second-dot1q 204
 ip address 200.241.95.53 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_20000_V1
 service-policy output QPO_BBONE_20000_V1
!
interface GigabitEthernet2/0/0.1503207
 description RODOPRADO  | 4096K | SLS/IP/05652 | (SLS/IP/05652)
 bandwidth 4096
 encapsulation dot1Q 1503 second-dot1q 207
 ip address 200.241.95.69 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_4096_V1
 service-policy output QPO_BBONE_4096_V1
!
interface GigabitEthernet2/0/0.1503209
 description CISNEBRANCO  | 10M | SLS/IP/06155 | (SLS/IP/06155)
 bandwidth 10000
 encapsulation dot1Q 1503 second-dot1q 209
 ip address 200.241.80.197 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_10000_V1
 service-policy output QPO_BBONE_10000_V1
!
interface GigabitEthernet2/0/0.1503212
 description MAXXIMO  | 10M | SLS/IP/05713 | (SLS/IP/05713)
 bandwidth 10000
 encapsulation dot1Q 1503 second-dot1q 212
 ip address 200.241.95.113 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_10000_V1
 service-policy output QPO_BBONE_10000_V1
!
interface GigabitEthernet2/0/0.1503213
 description DBL INDUSTRIA  | 10M | SLS/IP/05701 | (SLS/IP/05701)
 bandwidth 10000
 encapsulation dot1Q 1503 second-dot1q 213
 ip address 200.241.95.109 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_10000_V1
 service-policy output QPO_BBONE_10000_V1
!
interface GigabitEthernet2/0/0.1503214
 description R M M S DE OLIVEIRA  | 400M | SLS/IP/05191 | (SLS/IP/05191) | BLK-SAIP-INADIMP/20170913-177/POR-T3PER
 bandwidth 400000
 encapsulation dot1Q 1503 second-dot1q 214
 no ip redirects
 no ip proxy-arp
 shutdown
 service-policy input QPI_BBONE_S_400000_V1
 service-policy output QPO_BBONE_400000_V1
!
interface GigabitEthernet2/0/0.1503215
 description JESUS OLIVEIRA  | 10M | SJE/IP/00147 | (SJE/IP/00147)
 bandwidth 10000
 encapsulation dot1Q 1503 second-dot1q 215
 ip address 200.179.213.69 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_10000_V1
 service-policy output QPO_BBONE_10000_V1
!
interface GigabitEthernet2/0/0.1504103
 description WIPY  | 800K | SLS/VL/9833111580 | (SLS/VL/9833111580)
 bandwidth 800
 encapsulation dot1Q 1504 second-dot1q 103
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.241.95.241 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QDI_VIPSIP_VOZ_800_V1
 service-policy output QDO_VIPSIP_VOZ_800_V1
!
interface GigabitEthernet2/0/0.1504216
 description MAXXIMO  | 800K | SLS/VL/9832411426 | (SLS/VL/9832411426)
 bandwidth 800
 encapsulation dot1Q 1504 second-dot1q 216
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.179.213.229 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QDI_VIPSIP_VOZ_800_V1
 service-policy output QDO_VIPSIP_VOZ_800_V1
!
interface GigabitEthernet2/0/1
 description LINK ETH | 1000M | SLSUSIT/SLSUSME/1G/008 | 7609SR_SLS_US-01 GE1/12
 no ip address
 load-interval 30
 no negotiation auto
!
interface GigabitEthernet2/0/1.15002
 description RIO ANIL TRANSPORTE  | 14000K | SLS/IP/04183 | (SLS/IP/04183)
 bandwidth 14000
 encapsulation dot1Q 1500 second-dot1q 2
 ip address 200.241.80.45 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 shutdown
 service-policy input QPI_BBONE_S_14000_V1
 service-policy output QPO_BBONE_14000_V1
!
interface GigabitEthernet2/0/1.15008
 description BIPMAR  | 200M | SLS/IP/03732 | (SLS/IP/03732)
 bandwidth 200000
 encapsulation dot1Q 1500 second-dot1q 8
 ip address 200.253.132.97 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_200000_V1
 service-policy output QPO_BBONE_200000_V1
!
interface GigabitEthernet2/0/1.15024
 description REDE_CORREIOS  | 1024K | SLS/IP/06087 | (SLS/IP/06087) | BGP_AS65001
 bandwidth 1024
 encapsulation dot1Q 1502 second-dot1q 4
 ip vrf forwarding CORREIOS_2016:155714
 ip address 172.18.75.113 255.255.255.252
 no ip proxy-arp
 service-policy input QDI_Correios_1024K_ARPA_IOS_D_V1
 service-policy output QDO_Correios_1024K_ARPA_IOS_D_V1
!
interface GigabitEthernet2/0/1.15025
 description REDE_CORREIOS  | 2048K | SLS/IP/06035 | (SLS/IP/06035) | BGP_AS65001
 bandwidth 2048
 encapsulation dot1Q 1502 second-dot1q 5
 ip vrf forwarding CORREIOS_2016:155714
 ip address 172.18.75.53 255.255.255.252
 no ip proxy-arp
 service-policy input QDI_Correios_2048K_ARPA_IOS_D_V1
 service-policy output QDO_Correios_2048K_ARPA_IOS_D_V1
!
interface GigabitEthernet2/0/1.15026
 description REDE_CORREIOS  | 4096K | SLS/IP/06041 | (SLS/IP/06041) | BGP_AS65001
 bandwidth 4096
 encapsulation dot1Q 1502 second-dot1q 6
 ip vrf forwarding CORREIOS_2016:155714
 ip address 172.18.88.57 255.255.255.252
 no ip proxy-arp
 service-policy input QPI_BBONE_N_4096_V1
 service-policy output QDO_Correios_4096K_ARPA_IOS_D_V1
!
interface GigabitEthernet2/0/1.15027
 description REDE_CORREIOS  | 256K | SLS/IP/06027 | (SLS/IP/06027) | BGP_AS65001
 bandwidth 256
 encapsulation dot1Q 1502 second-dot1q 7
 ip vrf forwarding CORREIOS_2016:155714
 ip address 172.18.77.81 255.255.255.252
 no ip proxy-arp
 service-policy input QDI_Correios_256K_ARPA_IOS_D_V1
 service-policy output QDO_Correios_256K_ARPA_IOS_D_V1
!
interface GigabitEthernet2/0/1.15042
 description PGJMARANHAO  | 300M | SLS/IP/06031 | (SLS/IP/06031)
 bandwidth 300000
 encapsulation dot1Q 1504 second-dot1q 2
 ip address 201.45.221.249 255.255.255.252
 no ip proxy-arp
 service-policy input QPI_BBONE_S_300000_V1
 service-policy output QPO_BBONE_300000_V1
!
interface GigabitEthernet2/0/1.15072
 description ZRGUEDES  | 100M | BLA/IP/00224 | (BLA/IP/00224)
 bandwidth 100000
 encapsulation dot1Q 1507 second-dot1q 2
 ip address 189.53.11.173 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_100000_V1
 service-policy output QPO_BBONE_100000_V1
!
interface GigabitEthernet2/0/1.15078
 description RMARRUDA  | 10M | BLA/IP/00235 | (BLA/IP/00235)
 bandwidth 10000
 encapsulation dot1Q 1507 second-dot1q 8
 ip address 200.241.95.233 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_10000_V1
 service-policy output QPO_BBONE_10000_V1
!
interface GigabitEthernet2/0/1.15102
 description INSTITUTO_ACQUA  | 10M | SIS/IP/00219 | (SIS/IP/00219)
 bandwidth 10000
 encapsulation dot1Q 1510 second-dot1q 2
 ip address 200.179.213.45 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_10000_V1
 service-policy output QPO_BBONE_10000_V1
!
interface GigabitEthernet2/0/1.15105
 description F_G_LAURIA  | 300M | SIS/IP/00216 | (SIS/IP/00216)
 bandwidth 300000
 encapsulation dot1Q 1510 second-dot1q 5
 ip address 187.29.255.129 255.255.255.252
 no ip proxy-arp
 service-policy input QPI_BBONE_S_300000_V1
 service-policy output QPO_BBONE_300000_V1
!
interface GigabitEthernet2/0/1.15106
 description AVNET  | 300M | SIS/IP/00049 | (SIS/IP/00049)
 bandwidth 300000
 encapsulation dot1Q 1510 second-dot1q 6
 ip address 187.28.122.73 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_300000_V1
 service-policy output QPO_BBONE_300000_V1
!
interface GigabitEthernet2/0/1.15113
 description INSTITUTO_ACQUA  | 1500K | SIS/VL/9832021600 | (SIS/VL/9832021600)
 bandwidth 1500
 encapsulation dot1Q 1511 second-dot1q 3
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.179.228.65 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QDI_VIPSIP_VOZ_1500_V1
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet2/0/1.150318
!
interface GigabitEthernet2/0/1.150711
 description ANTONIO MOREIRA  | 100M | BLA/IP/00268 | (BLA/IP/00268) | BLK-SAIP-APEDIDO/2017073-1516/POR-DENISVM
 bandwidth 100000
 encapsulation dot1Q 1507 second-dot1q 11
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 shutdown
 service-policy input QPI_BBONE_S_100000_V1
 service-policy output QPO_BBONE_100000_V1
!
interface GigabitEthernet2/0/2
 no ip address
 no ip proxy-arp
 shutdown
 no negotiation auto
 ipv6 enable
 ipv6 nd dad attempts 0
 ipv6 nd ra suppress
!
interface GigabitEthernet2/0/3
 description LINK ETH | 400M | BLACRDM/SLSUSIT/400M/001 | DM4650_BLACR-IS01 GPC 04
 bandwidth 400000
 no ip address
 no ip redirects
 no ip proxy-arp
 load-interval 30
 no negotiation auto
!
interface GigabitEthernet2/0/3.2
 description CEMAR  | 1024K | BLA/IP/00041 | (BLA/IP/00041) | BGP_AS64707
 bandwidth 1024
 encapsulation dot1Q 2
 ip vrf forwarding CEMAR:3468
 no ip proxy-arp
 shutdown
 service-policy input QDI_1024K_16_0_0_0_0_2_80
 service-policy output QDO_1024K_16_0_0_0_0_2_80
!
interface GigabitEthernet2/0/3.3
 description BNB  | 2048K | BLA/IP/00260 | (BLA/IP/00260) | BGP_AS65000
 bandwidth 2048
 encapsulation dot1Q 3
 ip vrf forwarding BNB:5075
 ip address 189.53.11.185 255.255.255.252
 no ip proxy-arp
 service-policy input QDI_2048K_21_0_35_20_0_1_21
 service-policy output QDO_2048K_21_0_35_20_0_1_21
!
interface GigabitEthernet2/0/3.4
 description BANCO_DO_BRASIL_SA  | 10M | BLA/IP/00321 | (BLA/IP/00321)
 bandwidth 10000
 encapsulation dot1Q 4
 ip address 201.45.205.37 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_10000_V1
 service-policy output QPO_BBONE_10000_V1
!
interface GigabitEthernet2/0/3.5
 description RABOBANK  | 4096K | BLA/MULTI/60549 | (BLA/MULTI/60549) | BGP_AS65000
 bandwidth 4096
 encapsulation dot1Q 5
 ip vrf forwarding RABO:7410
 ip address 201.30.37.161 255.255.255.252
 no ip proxy-arp
 service-policy input QDI_4096K_4_19_2_50_0_2_22
 service-policy output QDO_4096K_4_19_2_50_0_2_22
!
interface GigabitEthernet2/0/3.6
 description MPF_NOVA  | 2048K | BLA/IP/00303 | (BLA/IP/00303) | BGP_AS65001
 bandwidth 2048
 encapsulation dot1Q 6
 ip vrf forwarding MPF_NOVA:6114
 ip address 192.168.35.149 255.255.255.252
 no ip proxy-arp
 ip pim sparse-mode
 service-policy input QDI_2048K_41_0_35_0_0_2_21
 service-policy output QDO_2048K_41_0_35_0_0_2_21
!
interface GigabitEthernet2/0/3.7
 description CEAGRO AGRONEGOCIOS  | 4096K | BLA/MULTI/45091 | (BLA/MULTI/45091)
 bandwidth 4096
 encapsulation dot1Q 7
 ip address 200.241.80.213 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_4096_V1
 service-policy output QPO_BBONE_4096_V1
!
interface GigabitEthernet2/0/3.8
 description MINISTERIO PUBLICO DA UNIAO  | 4096K | BLA/MULTI/61358 | (BLA/MULTI/61358)
 bandwidth 4096
 encapsulation dot1Q 8
 ip vrf forwarding MPF_NOVA:6114
 no ip proxy-arp
 ip pim sparse-mode
 shutdown
 service-policy input QDI_4096K_40_0_35_0_0_2_21
 service-policy output QDO_4096K_40_0_35_0_0_2_21
!
interface GigabitEthernet2/0/3.10
 description SEBRAEMA  | 2048K | BLA/IP/00054 | (BLA/IP/00054) | BGP_AS64617
 bandwidth 2048
 encapsulation dot1Q 10
 ip vrf forwarding SEBRAEMA:4302
 ip address 200.243.186.81 255.255.255.252
 no ip proxy-arp
 service-policy input QDI_2048K_3_0_1_0_0_2_93
 service-policy output QDO_2048K_3_0_1_0_0_2_93
!
interface GigabitEthernet2/0/3.11
 description ARMATEUS  | 10M | BLA/IP/00036 | (BLA/IP/00036) | BGP_AS65533
 bandwidth 10000
 encapsulation dot1Q 11
 ip vrf forwarding ARMATEUS:3394
 ip address 189.43.120.125 255.255.255.252
 no ip proxy-arp
 service-policy input QDI_10000K_3_0_0_0_0_2_94
 service-policy output QDO_10000K_3_0_0_0_0_2_94
!
interface GigabitEthernet2/0/3.14
 description BCOAM  | 1024K | BLA/IP/00063 | (BLA/IP/00063) | BGP_AS65330
 bandwidth 1024
 encapsulation dot1Q 14
 ip vrf forwarding BCOAM:4783
 ip address 200.179.211.237 255.255.255.252
 no ip proxy-arp
 service-policy input QDI_1024K_11_0_50_13_13_2_10
 service-policy output QDO_1024K_11_0_50_13_13_2_10
!
interface GigabitEthernet2/0/3.15
 description SERPRO  | 1024K | BLA/IP/00192 | (BLA/IP/00192) | BGP_AS65003
 bandwidth 1024
 encapsulation dot1Q 15
 ip vrf forwarding SERPRO_SLS_RFB_03:5904
 ip address 10.53.2.181 255.255.255.252
 no ip proxy-arp
 ip pim sparse-mode
 service-policy input QDI_SERPRO_1024K_V1
 service-policy output QDO_SERPRO_1024K_V1
!
interface GigabitEthernet2/0/3.16
 description CARGILL  | 4096K | BLA/MULTI/59495 | (BLA/MULTI/59495)
 bandwidth 4096
 encapsulation dot1Q 16
 ip address 200.241.80.161 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_4096_V1
 service-policy output QPO_BBONE_4096_V1
!
interface GigabitEthernet2/0/3.17
 description BBRASIL_NAC  | 512K | BLA/IP/00297 | (BLA/IP/00297) | BGP_AS65321
 bandwidth 512
 encapsulation dot1Q 17
 ip vrf forwarding BBRASIL_NAC:7399
 ip address 10.66.205.37 255.255.255.252
 no ip proxy-arp
 service-policy input QDI_512K_BBrasil_NAC_IPSAN_IACC_V1
 service-policy output QDO_512K_BBrasil_NAC_IPSAN_IACC_V1
!
interface GigabitEthernet2/0/3.19
 description CEMAR  | 4096K | BLA/MULTI/60956 | (BLA/MULTI/60956)
 bandwidth 4096
 encapsulation dot1Q 19
 ip vrf forwarding CEMAR:3468
 ip address 189.43.197.225 255.255.255.252
 no ip proxy-arp
 service-policy input QDI_4096K_8_0_1_0_0_1_89
 service-policy output QDO_4096K_8_0_1_0_0_1_89
!
interface GigabitEthernet2/0/3.21
 description CREDISHOP  | 256K | BLA/IP/00174 | (BLA/IP/00174) | BGP_AS64518
 bandwidth 256
 encapsulation dot1Q 21
 ip vrf forwarding CREDISHOP:1661
 ip address 200.167.34.109 255.255.255.252
 no ip proxy-arp
 service-policy input QDI_256K_25_0_4_0_0_7_63
 service-policy output QDO_256K_25_0_4_0_0_7_63
!
interface GigabitEthernet2/0/3.22
 description TRF  | 6144K | BLA/MULTI/57212 | (BLA/MULTI/57212)
 bandwidth 6144
 encapsulation dot1Q 22
 ip vrf forwarding TRF1_FM:3152
 ip address 189.53.11.245 255.255.255.252
 no ip proxy-arp
 service-policy input QPI_BBONE_N_6144_V1
 service-policy output QPO_BBONE_6144_V1
!
interface GigabitEthernet2/0/3.30
 description BCOAM  | 1024K | CRN/IP/00006 | (CRN/IP/00006) | BGP_AS65330
 bandwidth 1024
 encapsulation dot1Q 30
 ip vrf forwarding BCOAM:4783
 ip address 200.208.29.193 255.255.255.252
 no ip proxy-arp
 service-policy input QPI_BBONE_N_1024_V1
 service-policy output QPO_BBONE_1024_V1
!
interface GigabitEthernet2/0/3.33
 description LASA_NOVA  | 2048K | BLA/IP/00296 | (BLA/IP/00296)
 bandwidth 2048
 encapsulation dot1Q 33
 ip vrf forwarding LASA_NOVA:155000
 ip address 200.172.10.253 255.255.255.252
 no ip proxy-arp
 service-policy input QDI_2048K_13_38_23_0_0_2_23
 service-policy output QDO_2048K_13_38_23_0_0_2_23
!
interface GigabitEthernet2/0/3.34
 description IMIFARMA_EXTRANET  | 512K | BLA/IP/00302 | (BLA/IP/00302) | BGP_AS65000
 bandwidth 512
 encapsulation dot1Q 34
 ip vrf forwarding IMIFARMA_EXTRANET:155458
 ip address 200.172.12.89 255.255.255.252
 no ip proxy-arp
 service-policy input QDI_512K_5_0_30_16_4_4_40
 service-policy output QDO_512K_5_0_30_16_4_4_40
!
interface GigabitEthernet2/0/3.36
 description REDE_CORREIOS  | 128K | BLA/IP/00308 | (BLA/IP/00308) | BGP_AS65001
 bandwidth 128
 encapsulation dot1Q 36
 ip vrf forwarding CORREIOS_2016:155714
 ip address 172.18.66.69 255.255.255.252
 no ip proxy-arp
 service-policy input QDI_Correios_128K_ARPA_IOS_D_V1
 service-policy output QDO_Correios_128K_ARPA_IOS_D_V1
!
interface GigabitEthernet2/0/3.37
 description REDE_CORREIOS  | 256K | BLA/IP/00309 | (BLA/IP/00309) | BGP_AS65001
 bandwidth 256
 encapsulation dot1Q 37
 ip vrf forwarding CORREIOS_2016:155714
 ip address 172.18.66.65 255.255.255.252
 no ip proxy-arp
 service-policy input QDI_Correios_256K_ARPA_IOS_D_V1
 service-policy output QDO_Correios_256K_ARPA_IOS_D_V1
!
interface GigabitEthernet2/0/3.45
 description BBRASIL_NAC  | 2048K | BLA/IP/00179 | (BLA/IP/00179) | BGP_AS65321
 bandwidth 2048
 encapsulation dot1Q 45
 ip vrf forwarding BBRASIL_NAC:7399
 ip address 10.66.136.189 255.255.255.252
 no ip proxy-arp
 service-policy input QDI_2048K_BBrasil_NAC_IPSAN_IACC_V1
 service-policy output QDO_2048K_BBrasil_NAC_IPSAN_IACC_V1
!
interface GigabitEthernet2/0/3.49
 description BANCO BRADESCO  | 1500K | BLA/VL/9921410215 | (BLA/VL/9921410215)
 bandwidth 1500
 encapsulation dot1Q 49
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 201.45.205.129 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QDI_VIPSIP_VOZ_1500_V1
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet2/0/3.50
 description ALPHA  | 1500K | BLA/VL/9935429494 | (BLA/VL/9935429494)
 bandwidth 1500
 encapsulation dot1Q 50
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.179.228.161 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QDI_VIPSIP_VOZ_1500_V1
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet2/0/3.70
 description BRASILCAR  | 20M | BLA/IP/00245 | (BLA/IP/00245)
 bandwidth 20000
 encapsulation dot1Q 70
 ip address 200.252.158.201 255.255.255.252
 no ip proxy-arp
 service-policy input QPI_BBONE_S_20000_V1
 service-policy output QPO_BBONE_20000_V1
!
interface GigabitEthernet2/0/3.82
 description PLANETA  | 4096K | BLA/MULTI/57937 | (BLA/MULTI/57937)
 bandwidth 4096
 encapsulation dot1Q 82
 ip address 200.179.212.201 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_4096_V1
 service-policy output QPO_BBONE_4096_V1
!
interface GigabitEthernet2/0/3.97
 description CREFISA  | 512K | BLA/IP/00300 | (BLA/IP/00300) | BGP_AS65000
 bandwidth 512
 encapsulation dot1Q 97
 ip vrf forwarding CREFISA:5415
 ip address 200.172.12.217 255.255.255.252
 no ip proxy-arp
 service-policy input QDI_512K_50_0_10_0_0_4_35
 service-policy output QDO_512K_50_0_10_0_0_4_35
!
interface GigabitEthernet2/0/3.100
 description COMARIVE  | 10M | BLA/IP/00294 | (BLA/IP/00294)
 bandwidth 10000
 encapsulation dot1Q 100
 ip address 201.45.220.41 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_10000_V1
 service-policy output QPO_BBONE_10000_V1
!
interface GigabitEthernet2/0/3.101
 description CEFOR  | 4096K | BLA/IP/00301 | (BLA/IP/00301)
 bandwidth 4096
 encapsulation dot1Q 101
 ip address 200.241.80.229 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_4096_V1
 service-policy output QPO_BBONE_4096_V1
!
interface GigabitEthernet2/0/3.123
 description CEF  | 1500K | BLA/VL/9935429900 | (BLA/VL/9935429900)
 bandwidth 1500
 encapsulation dot1Q 123
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.172.12.53 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet2/0/3.127
 description M DE J NUNES MOREIRA  | 10M | BLA/IP/00247 | (BLA/IP/00247)
 bandwidth 10000
 encapsulation dot1Q 127
 ip address 200.179.212.101 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_10000_V1
 service-policy output QPO_BBONE_10000_V1
!
interface GigabitEthernet2/0/3.135
 description ITAUNIBANCO  | 1024K | BLA/IP/00288 | (BLA/IP/00288) | BGP_AS65001
 bandwidth 1024
 encapsulation dot1Q 135
 ip vrf forwarding ITAUNIBANCO:6388
 ip address 200.179.212.153 255.255.255.252
 no ip proxy-arp
 service-policy input QDI_1024K_10_24_20_0_40_2_3
 service-policy output QDO_1024K_10_24_20_0_40_2_3
!
interface GigabitEthernet2/0/3.142
 description DPRF  | 2048K | BLA/IP/00194 | (BLA/IP/00194) | BGP_AS65000
 bandwidth 2048
 encapsulation dot1Q 142
 ip vrf forwarding DPRF_NAC_REMOTO:4295
 ip address 10.18.250.29 255.255.255.252
 no ip proxy-arp
 service-policy input QDI_2048K_15_0_0_0_0_2_81
 service-policy output QDO_2048K_15_0_0_0_0_2_81
!
interface GigabitEthernet2/0/3.204
 description PETROSOJA  | 10M | BLA/IP/00211 | (BLA/IP/00211) | BLK-SAIP-APEDIDO/20171117-1036/POR-T3RCI
 bandwidth 10000
 encapsulation dot1Q 204
 no ip proxy-arp
 ip verify unicast source reachable-via any allow-self-ping
 shutdown
 service-policy input QPI_BBONE_S_10000_V1
 service-policy output QPO_BBONE_10000_V1
!
interface GigabitEthernet2/0/3.214
 description AGRINVEST BRASIL  | 10M | BLA/IP/00199 | (BLA/IP/00199)
 bandwidth 10000
 encapsulation dot1Q 214
 ip address 200.172.11.89 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_10000_V1
 service-policy output QPO_BBONE_10000_V1
!
interface GigabitEthernet2/0/3.219
 description AMBEV  | 2048K | BLA/IP/00286 | (BLA/IP/00286) | BGP_AS64638
 bandwidth 2048
 encapsulation dot1Q 219
 ip vrf forwarding BT_CBB:1851
 ip address 200.179.212.113 255.255.255.252
 no ip proxy-arp
 service-policy input QDI_2048K_7_0_33_0_8_2_49
 service-policy output QDO_2048K_7_0_33_0_8_2_49
!
interface GigabitEthernet2/0/3.222
 description BBRASIL_NAC  | 1024K | BLA/IP/00277 | (BLA/IP/00277) | BGP_AS65321
 bandwidth 1024
 encapsulation dot1Q 222
 ip vrf forwarding BBRASIL_NAC:7399
 ip address 10.66.205.153 255.255.255.252
 no ip proxy-arp
 service-policy input QDI_1024K_BBrasil_NAC_IPSAN_IACC_V1
 service-policy output QDO_1024K_BBrasil_NAC_IPSAN_IACC_V1
!
interface GigabitEthernet2/0/3.224
 description ABC-INDUSTRIA  | 10M | BLA/IP/00295 | (BLA/IP/00295)
 bandwidth 10000
 encapsulation dot1Q 224
 ip address 201.30.37.25 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_10000_V1
 service-policy output QPO_BBONE_10000_V1
!
interface GigabitEthernet2/0/3.304
 description PLANETA  | 1500K | BLA/VL/9921411500 | (BLA/VL/9921411500)
 bandwidth 1500
 encapsulation dot1Q 304
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 201.30.37.29 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet2/0/3.305
 description CARGILL  | 1500K | BLA/VL/9935429400 | (BLA/VL/9935429400)
 bandwidth 1500
 encapsulation dot1Q 305
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.172.12.145 255.255.255.252
 no ip proxy-arp
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet2/0/3.333
 description RISA  | 600K | BLA/VL/9935416500 | (BLA/VL/9935416500)
 bandwidth 600
 encapsulation dot1Q 333
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.172.13.177 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy output QDO_VIPSIP_VOZ_600_V1
!
interface GigabitEthernet2/0/3.359
 description TRF  | 4096K | BLA/MULTI/57212 | (BLA/MULTI/57212) | BGP_AS65348
 bandwidth 4096
 encapsulation dot1Q 359
 ip vrf forwarding TRF1_FM:3152
 ip address 189.53.11.245 255.255.255.252
 no ip proxy-arp
 shutdown
 service-policy input QPI_BBONE_N_4096_V1
 service-policy output QPO_BBONE_4096_V1
!
interface GigabitEthernet2/0/3.421
 description ELETRO BRASIL  | 10M | BLA/IP/00204 | (BLA/IP/00204)
 bandwidth 10000
 encapsulation dot1Q 421
 ip address 189.53.11.189 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_10000_V1
 service-policy output QPO_BBONE_10000_V1
!
interface GigabitEthernet2/0/4
 description LINK ETH | SLSUSDM/SLSUSIT/1G/006 | IACC01.SLS 2/0/4
 bandwidth 1000000
 no ip address
 no ip proxy-arp
 load-interval 30
 no negotiation auto
!
interface GigabitEthernet2/0/4.101
 description TCU  | 8000K | SLS/IP/05546 | (SLS/IP/05546) | BGP_AS65000
 bandwidth 8000
 encapsulation dot1Q 101
 ip vrf forwarding TCU:1628
 ip address 200.241.95.17 255.255.255.252
 no ip proxy-arp
 ip pim sparse-mode
 service-policy input QDI_8000K_2_47_26_0_0_1_23
 service-policy output QDO_8000K_2_47_26_0_0_1_23
!
interface GigabitEthernet2/0/4.102
 description EBX HOLDING  | 16000K | SIL/IP/00102 | (SIL/IP/00102) | BGP_AS65000
 bandwidth 16000
 encapsulation dot1Q 102
 ip vrf forwarding ENEVA:6831
 ip address 200.172.11.209 255.255.255.252
 no ip proxy-arp
 service-policy input QDI_16000K_11_34_0_0_0_1_53
 service-policy output QDO_16000K_11_34_0_0_0_1_53
!
interface GigabitEthernet2/0/4.105
 description TSE  | 24000K | SLS/IP/03555 | (SLS/IP/03555) | BGP_AS64642
 bandwidth 24000
 encapsulation dot1Q 105
 ip vrf forwarding TSE_SPOKE:154234
 ip address 187.28.122.109 255.255.255.252
 no ip proxy-arp
 service-policy input QPI_BBONE_N_24000_V1
 service-policy output QPO_BBONE_24000_V1
!
interface GigabitEthernet2/0/4.106
 description BBRASIL  | 16000K | SLS/IP/06277 | (SLS/IP/06277)
 bandwidth 16000
 encapsulation dot1Q 106
 ip address 200.179.126.173 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_16000_V1
 service-policy output QPO_BBONE_16000_V1
!
interface GigabitEthernet2/0/4.107
 description CERVEJARIAPETROPOLIS  | 4096K | SIS/IP/00208 | (SIS/IP/00208)
 bandwidth 4096
 encapsulation dot1Q 107
 ip address 201.45.220.49 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 shutdown
 service-policy input QPI_BBONE_S_4096_V1
 service-policy output QPO_BBONE_4096_V1
!
interface GigabitEthernet2/0/4.109
 description E.C. ALEGRIA  | 10M | SJE/IP/00121 | (SJE/IP/00121)
 bandwidth 10000
 encapsulation dot1Q 109
 ip address 200.172.10.57 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_10000_V1
 service-policy output QPO_BBONE_10000_V1
!
interface GigabitEthernet2/0/4.110
 description ELO_CONTACT_CENTER_SERVICOS  | 20M | SLS/IP/05232 | (SLS/IP/05232)
 bandwidth 20000
 encapsulation dot1Q 110
 ip address 200.241.80.13 255.255.255.252
 no ip proxy-arp
 service-policy input QPI_BBONE_S_20000_V1
 service-policy output QPO_BBONE_20000_V1
!
interface GigabitEthernet2/0/4.112
 description ENEVA  | 10M | SIL/IP/00110 | (SIL/IP/00110) | BLK-SAIP-APEDIDO/20180117-920/POR-T3RCI
 bandwidth 10000
 encapsulation dot1Q 112
 no ip proxy-arp
 shutdown
 service-policy input QPI_BBONE_N_10000_V1
 service-policy output QPO_BBONE_10000_V1
!
interface GigabitEthernet2/0/4.113
 description EBC  | 16000K | SLS/IP/05786 | (SLS/IP/05786)
 bandwidth 16000
 encapsulation dot1Q 113
 ip vrf forwarding EBC_MIDIA:6915
 ip address 200.179.213.97 255.255.255.252
 no ip proxy-arp
 service-policy input QDI_16000K_0_19_0_0_0_1_78
 service-policy output QDO_16000K_0_19_0_0_0_1_78
!
interface GigabitEthernet2/0/4.114
 description GALGANI E LUNA  | 10M | SLS/IP/04817 | (SLS/IP/04817)
 bandwidth 10000
 encapsulation dot1Q 114
 ip address 200.172.10.81 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_10000_V1
 service-policy output QPO_BBONE_10000_V1
!
interface GigabitEthernet2/0/4.115
 description EBC  | 6000K | SLS/IP/05669 | (SLS/IP/05669) | BGP_AS65000
 bandwidth 6000
 encapsulation dot1Q 115
 ip vrf forwarding EBC_MPLS1:155268
 ip address 189.53.11.53 255.255.255.252
 no ip proxy-arp
 service-policy input QPI_BBONE_N_6000_V1
 service-policy output QPO_BBONE_6000_V1
!
interface GigabitEthernet2/0/4.116
 description M. SAMPAIO SILVA  | 10M | SLS/IP/04829 | (SLS/IP/04829)
 bandwidth 10000
 encapsulation dot1Q 116
 ip address 200.172.10.89 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_10000_V1
 service-policy output QPO_BBONE_10000_V1
!
interface GigabitEthernet2/0/4.117
 description GEAUNAMOTOS  | 10M | BLA/IP/00195 | (BLA/IP/00195)
 bandwidth 10000
 encapsulation dot1Q 117
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 shutdown
 service-policy input QPI_BBONE_S_10000_V1
 service-policy output QPO_BBONE_10000_V1
!
interface GigabitEthernet2/1/0
 description LINK ETH | 1000M | SLSUSIT/SLSUSME/1G/002 | 7609SR_SLS_US-01 Gi2/1
 no ip address
 load-interval 30
 no negotiation auto
!
interface GigabitEthernet2/1/0.15064
 description ARGAMASSAS  | 4096K | SLS/IP/05863 | (SLS/IP/05863)
 bandwidth 4096
 encapsulation dot1Q 1506 second-dot1q 4
 ip address 200.179.213.205 255.255.255.252
 no ip proxy-arp
 service-policy input QPI_BBONE_S_4096_V1
 service-policy output QPO_BBONE_4096_V1
!
interface GigabitEthernet2/1/0.15068
 description CERVEJARIAPETROPOLIS  | 8000K | SLS/IP/05916 | (SLS/IP/05916)
 bandwidth 8000
 encapsulation dot1Q 1506 second-dot1q 8
 ip address 201.45.205.189 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_8000_V1
 service-policy output QPO_BBONE_8000_V1
!
interface GigabitEthernet2/1/0.15069
 description VIACAO PERICUMA  | 4096K | SLS/IP/05946 | (SLS/IP/05946)
 bandwidth 4096
 encapsulation dot1Q 1506 second-dot1q 9
 ip address 201.45.221.13 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_4096_V1
 service-policy output QPO_BBONE_4096_V1
!
interface GigabitEthernet2/1/0.15076
 description CLARO  | 5400K | SLS/VL/9833117300 | (SLS/VL/9833117300)
 bandwidth 5400
 encapsulation dot1Q 1507 second-dot1q 6
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 201.45.205.85 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QDI_VIPSIP_VOZ_5400_V1
 service-policy output QDO_VIPSIP_VOZ_5400_V1
!
interface GigabitEthernet2/1/0.15082
 description MIN JUSTICA  | 10M | SLS/IP/05075 | (SLS/IP/05075) | BGP_AS65000
 bandwidth 10000
 encapsulation dot1Q 1508 second-dot1q 2
 ip vrf forwarding DPRF_NAC_REMOTO:4295
 ip address 10.18.250.1 255.255.255.252
 no ip proxy-arp
 service-policy input QDI_10000K_10_20_26_0_0_1_40
 service-policy output QDO_10000K_10_20_26_0_0_1_40
!
interface GigabitEthernet2/1/0.15092
 description LUZEIROS  | 10M | SLS/IP/03641 | (SLS/IP/03641)
 bandwidth 10000
 encapsulation dot1Q 1509 second-dot1q 2
 ip address 187.28.122.141 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_10000_V1
 service-policy output QPO_BBONE_10000_V1
!
interface GigabitEthernet2/1/0.15093
 description LUZEIROS  | 10M | SLS/IP/03807 | (SLS/IP/03807)
 bandwidth 10000
 encapsulation dot1Q 1509 second-dot1q 3
 ip address 200.253.132.157 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_10000_V1
 service-policy output QPO_BBONE_10000_V1
!
interface GigabitEthernet2/1/0.15106
 description CIMENTO VERDE DO BRASIL  | 1500K | SLS/VL/9833115252 | (SLS/VL/9833115252)
 bandwidth 1500
 encapsulation dot1Q 1510 second-dot1q 6
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.179.213.169 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet2/1/0.15126
 description C&A MODAS  | 2048K | SJE/IP/00158 | (SJE/IP/00158)
 bandwidth 2048
 encapsulation dot1Q 1512 second-dot1q 6
 ip address 201.45.205.53 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_2048_V1
 service-policy output QPO_BBONE_2048_V1
!
interface GigabitEthernet2/1/0.15132
 description CEF  | 1500K | SLS/VL/9832394142 | (SLS/VL/9832394142)
 bandwidth 1500
 encapsulation dot1Q 1513 second-dot1q 2
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.179.213.105 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QDI_VIPSIP_VOZ_1500_V1
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet2/1/0.15133
 description RIACHUELO  | 1500K | SJE/VL/9833135530 | (SJE/VL/9833135530)
 bandwidth 1500
 encapsulation dot1Q 1513 second-dot1q 3
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 201.45.205.61 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet2/1/0.15134
 description C&A  | 1500K | SJE/VL/9833133633 | (SJE/VL/9833133633)
 bandwidth 1500
 encapsulation dot1Q 1513 second-dot1q 4
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 201.45.205.69 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet2/1/0.15137
 description MATEUS  | 1500K | SJE/VL/9833135080 | (SJE/VL/9833135080)
 bandwidth 1500
 encapsulation dot1Q 1513 second-dot1q 7
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 201.45.205.173 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet2/1/0.15145
 description LOJASRIACHUELO  | 1024K | SJE/IP/00157 | (SJE/IP/00157) | BGP_AS65519
 bandwidth 1024
 encapsulation dot1Q 1514 second-dot1q 5
 ip vrf forwarding LOJASRIACHUELO:4120
 ip address 201.45.205.57 255.255.255.252
 no ip proxy-arp
 service-policy input QDI_1024K_13_0_16_48_16_2_4
 service-policy output QDO_1024K_13_0_16_48_16_2_4
!
interface GigabitEthernet2/1/0.15149
 description LASA_NOVA  | 2048K | SJE/IP/00167 | (SJE/IP/00167)
 bandwidth 2048
 encapsulation dot1Q 1514 second-dot1q 9
 ip vrf forwarding LASA_NOVA:155000
 ip address 201.45.205.117 255.255.255.252
 no ip proxy-arp
 service-policy input QDI_2048K_13_38_23_0_0_2_23
 service-policy output QDO_2048K_13_38_23_0_0_2_23
!
interface GigabitEthernet2/1/0.150610
 description KRUK E LOPES  | 4096K | SLS/IP/05952 | (SLS/IP/05952) | BLK-SAIP-APEDIDO/2017125-950/POR-T3RCI
 bandwidth 4096
 encapsulation dot1Q 1506 second-dot1q 10
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 shutdown
 service-policy input QPI_BBONE_S_4096_V1
 service-policy output QPO_BBONE_4096_V1
!
interface GigabitEthernet2/1/0.150614
 description REDEMAQUINAS  | 4096K | SLS/IP/06026 | (SLS/IP/06026)
 bandwidth 4096
 encapsulation dot1Q 1506 second-dot1q 14
 ip address 201.45.205.181 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_4096_V1
 service-policy output QPO_BBONE_4096_V1
!
interface GigabitEthernet2/1/0.150616
 description DAN_DISTRIBUIDORA_SAO_LUIS  | 10M | SLS/IP/05063 | (SLS/IP/05063)
 bandwidth 10000
 encapsulation dot1Q 1506 second-dot1q 16
 ip address 189.52.211.97 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_10000_V1
 service-policy output QPO_BBONE_10000_V1
!
interface GigabitEthernet2/1/0.150618
 description D'MARI  | 10M | SLS/IP/05224 | (SLS/IP/05224)
 bandwidth 10000
 encapsulation dot1Q 1506 second-dot1q 18
 ip address 187.29.255.225 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_10000_V1
 service-policy output QPO_BBONE_10000_V1
!
interface GigabitEthernet2/1/0.150620
 description UTILDROGAS  | 4096K | SLS/IP/06113 | (SLS/IP/06113)
 bandwidth 4096
 encapsulation dot1Q 1506 second-dot1q 20
 ip address 189.53.11.109 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_4096_V1
 service-policy output QPO_BBONE_4096_V1
!
interface GigabitEthernet2/1/0.150623
 description LOCALIZA  | 4096K | SLS/IP/06204 | (SLS/IP/06204)
 bandwidth 4096
 encapsulation dot1Q 1506 second-dot1q 23
 ip address 200.179.126.1 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_4096_V1
 service-policy output QPO_BBONE_4096_V1
!
interface GigabitEthernet2/1/0.150625
 description LOCALIZA  | 4096K | SLS/IP/06012 | (SLS/IP/06012)
 bandwidth 4096
 encapsulation dot1Q 1506 second-dot1q 25
 ip address 187.28.122.161 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_4096_V1
 service-policy output QPO_BBONE_4096_V1
!
interface GigabitEthernet2/1/0.150627
 description LINX_TELECOMUNICACOES  | 6000K | SLS/IP/06320 | (SLS/IP/06320)
 bandwidth 6000
 encapsulation dot1Q 1506 second-dot1q 27
 ip address 200.179.230.25 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 shutdown
 service-policy input QPI_BBONE_S_6000_V1
 service-policy output QPO_BBONE_6000_V1
!
interface GigabitEthernet2/1/0.150712
 description GERDAU  | 1500K | SLS/VL/9832183800 | (SLS/VL/9832183800)
 bandwidth 1500
 encapsulation dot1Q 1507 second-dot1q 12
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 201.45.221.161 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QDI_VIPSIP_VOZ_1500_V1
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet2/1/0.150713
 description REDEMAQUINAS | 800K | SLS/VL/9832762000 | (SLS/VL/9832762000)
 bandwidth 400
 encapsulation dot1Q 1507 second-dot1q 13
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.241.95.61 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QDI_VIPSIP_VOZ_400_V1
 service-policy output QDO_VIPSIP_VOZ_400_V1
!
interface GigabitEthernet2/1/0.150715
 description DAN DISTRIBUIDORA  | 800K | SLS/VL/9821061488 | (SLS/VL/9821061488)
 bandwidth 800
 encapsulation dot1Q 1507 second-dot1q 15
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.179.228.213 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QDI_VIPSIP_VOZ_800_V1
 service-policy output QDO_VIPSIP_VOZ_800_V1
!
interface GigabitEthernet2/1/0.150717
 description DMARI  | 1200K | SLS/VL/9840095555 | (SLS/VL/9840095555)
 bandwidth 1200
 encapsulation dot1Q 1507 second-dot1q 17
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.179.228.9 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QDI_VIPSIP_VOZ_1200_V1
 service-policy output QDO_VIPSIP_VOZ_1200_V1
!
interface GigabitEthernet2/1/0.150719
 description ARGAMASSAS  | 400K | SLS/VL/9833115280 | (SLS/VL/9833115280)
 bandwidth 400
 encapsulation dot1Q 1507 second-dot1q 19
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.179.228.37 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy output QDO_VIPSIP_VOZ_400_V1
!
interface GigabitEthernet2/1/0.150721
 description FERRONORTE  | 800K | SLS/VL/9832194100 | (SLS/VL/9832194100)
 bandwidth 800
 encapsulation dot1Q 1507 second-dot1q 21
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.179.228.177 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QDI_VIPSIP_VOZ_800_V1
 service-policy output QDO_VIPSIP_VOZ_800_V1
!
interface GigabitEthernet2/1/0.150722
 description FERRONORTE  | 1500K | SLS/VL/9833343960 | (SLS/VL/9833343960)
 bandwidth 1500
 encapsulation dot1Q 1507 second-dot1q 22
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.179.228.117 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QDI_VIPSIP_VOZ_1500_V1
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet2/1/0.150724
 description DELLAVOLPE  | 1500K | SLS/VL/9821077518 | (SLS/VL/9821077518)
 bandwidth 1500
 encapsulation dot1Q 1507 second-dot1q 24
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.179.228.145 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QDI_VIPSIP_VOZ_1500_V1
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet2/1/0.150826
 description GERDAU_INT  | 2048K | SLS/IP/01984 | (SLS/IP/01984) | BGP_AS65214
 bandwidth 2048
 encapsulation dot1Q 1508 second-dot1q 26
 ip vrf forwarding GERDAU_INT:151563
 ip address 10.241.51.1 255.255.255.252
 no ip proxy-arp
 service-policy input QDI_2048K_8_0_59_17_0_2_13
 service-policy output QDO_2048K_8_0_59_17_0_2_13
!
interface GigabitEthernet2/1/0.150911
 description CECME  | 10M | SLS/IP/05987 | (SLS/IP/05987)
 bandwidth 10000
 encapsulation dot1Q 1509 second-dot1q 11
 ip address 201.45.221.149 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_10000_V1
 service-policy output QPO_BBONE_10000_V1
!
interface GigabitEthernet2/1/0.150917
 description J B COMERCIO EMPREENDIMENTOS  | 4096K | SLS/IP/06229 | (SLS/IP/06229)
 bandwidth 4096
 encapsulation dot1Q 1509 second-dot1q 17
 ip address 200.179.126.65 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_4096_V1
 service-policy output QPO_BBONE_4096_V1
!
interface GigabitEthernet2/1/0.150919
 description CANOPUS CONSTRUCOES LTDA  | 20M | SLS/IP/06288 | (SLS/IP/06288)
 bandwidth 20000
 encapsulation dot1Q 1509 second-dot1q 19
 ip address 200.179.126.205 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_20000_V1
 service-policy output QPO_BBONE_20000_V1
!
interface GigabitEthernet2/1/0.150921
 description BANCO_DO_BRASIL_SA  | 10M | SLS/IP/06304 | (SLS/IP/06304)
 bandwidth 10000
 encapsulation dot1Q 1509 second-dot1q 21
 ip address 200.179.230.1 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_10000_V1
 service-policy output QPO_BBONE_10000_V1
!
interface GigabitEthernet2/1/0.151012
 description CECME  | 400K | SLS/VL/9833116080 | (SLS/VL/9833116080)
 bandwidth 400
 encapsulation dot1Q 1510 second-dot1q 12
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 201.45.221.153 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy output QDO_VIPSIP_VOZ_400_V1
!
interface GigabitEthernet2/1/0.151013
 description BRANDAO  | 1500K | SLS/VL/9832166666 | (SLS/VL/9832166666)
 bandwidth 1500
 encapsulation dot1Q 1510 second-dot1q 13
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.179.228.109 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QDI_VIPSIP_VOZ_1500_V1
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet2/1/0.151014
 description ANATEL  | 1500K | SLS/VL/9832146000 | (SLS/VL/9832146000)
 bandwidth 1500
 encapsulation dot1Q 1510 second-dot1q 14
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.241.95.45 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet2/1/0.151016
 description LUZEIROS  | 1500K | SLS/VL/9833114949 | (SLS/VL/9833114949)
 bandwidth 1500
 encapsulation dot1Q 1510 second-dot1q 16
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.179.228.225 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QDI_VIPSIP_VOZ_1500_V1
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet2/1/0.151018
 description JB_COMERCIO  | 600K | SLS/VL/9840093888 | (SLS/VL/9840093888)
 bandwidth 600
 encapsulation dot1Q 1510 second-dot1q 18
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.179.126.57 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QDI_VIPSIP_VOZ_600_V1
 service-policy output QDO_VIPSIP_VOZ_600_V1
!
interface GigabitEthernet2/1/0.151115
 description EBX HOLDING  | 34000K | SLS/IP/05180 | (SLS/IP/05180)
 bandwidth 34000
 encapsulation dot1Q 1511 second-dot1q 15
 ip vrf forwarding ENEVA:6831
 ip address 200.172.13.173 255.255.255.252
 no ip proxy-arp
 service-policy input QDI_34000K_2_7_0_0_0_2_88
 service-policy output QDO_34000K_2_7_0_0_0_2_88
!
interface GigabitEthernet2/1/0.151120
 description NACSAUDE  | 2048K | SLS/IP/02135 | (SLS/IP/02135)
 bandwidth 2048
 encapsulation dot1Q 1511 second-dot1q 20
 ip vrf forwarding NACSAUDE:4530
 ip address 200.252.158.81 255.255.255.252
 no ip proxy-arp
 service-policy input QDI_2048K_9_49_13_0_0_2_26
 service-policy output QDO_2048K_9_49_13_0_0_2_26
!
interface GigabitEthernet2/1/0.151122
 description ELEVADORES  | 1024K | SLS/IP/05941 | (SLS/IP/05941)
 bandwidth 1024
 encapsulation dot1Q 1511 second-dot1q 22
 ip vrf forwarding ELEVADORESATLAS:7186
 no ip proxy-arp
 shutdown
 service-policy input QDI_1024K_0_0_40_30_21_2_6
 service-policy output QDO_1024K_0_0_40_30_21_2_6
!
interface GigabitEthernet2/1/0.151212
 description LN_INCORPORACOES  | 10M | SLS/IP/04203 | (SLS/IP/04203)
 bandwidth 10000
 encapsulation dot1Q 1512 second-dot1q 12
 ip address 200.241.80.57 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_10000_V1
 service-policy output QPO_BBONE_10000_V1
!
interface GigabitEthernet2/1/0.151215
 description REVEST  | 4096K | SLS/IP/05970 | (SLS/IP/05970)
 bandwidth 4096
 encapsulation dot1Q 1512 second-dot1q 15
 ip address 201.45.221.97 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_4096_V1
 service-policy output QPO_BBONE_4096_V1
!
interface GigabitEthernet2/1/0.151219
 description JAV DISTRIBUICAO  | 10M | SLS/IP/05570 | (SLS/IP/05570)
 bandwidth 10000
 encapsulation dot1Q 1512 second-dot1q 19
 ip address 201.30.37.129 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_10000_V1
 service-policy output QPO_BBONE_10000_V1
!
interface GigabitEthernet2/1/0.151222
 description MINISTERIO SAUDE  | 30M | SLS/IP/06178 | (SLS/IP/06178)
 bandwidth 30000
 encapsulation dot1Q 1512 second-dot1q 22
 ip address 200.179.228.185 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_30000_V1
 service-policy output QPO_BBONE_30000_V1
!
interface GigabitEthernet2/1/0.151224
 description JEVA  | 6000K | SLS/IP/04084 | (SLS/IP/04084)
 bandwidth 6000
 encapsulation dot1Q 1512 second-dot1q 24
 ip address 200.252.158.1 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_6000_V1
 service-policy output QPO_BBONE_6000_V1
!
interface GigabitEthernet2/1/0.151226
 description BBRASIL_NAC  | 10M | SLS/IP/06296 | (SLS/IP/06296)
 bandwidth 10000
 encapsulation dot1Q 1512 second-dot1q 26
 ip address 200.179.126.213 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_10000_V1
 service-policy output QPO_BBONE_10000_V1
!
interface GigabitEthernet2/1/0.151313
 description LN_INCORPORACOES  | 1500K | SLS/VL/9821095555 | (SLS/VL/9821095555)
 bandwidth 1500
 encapsulation dot1Q 1513 second-dot1q 13
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 201.45.221.89 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QDI_VIPSIP_VOZ_1500_V1
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet2/1/0.151314
 description REVEST  | 400K | SLS/VL/9832463104 | (SLS/VL/9832463104)
 bandwidth 400
 encapsulation dot1Q 1513 second-dot1q 14
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 201.45.221.101 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QDI_VIPSIP_VOZ_400_V1
 service-policy output QDO_VIPSIP_VOZ_400_V1
!
interface GigabitEthernet2/1/0.151316
 description HRO  | 400K | SLS/VL/9821072760 | (SLS/VL/9821072760)
 bandwidth 400
 encapsulation dot1Q 1513 second-dot1q 16
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 201.45.221.125 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QDI_VIPSIP_VOZ_400_V1
 service-policy output QDO_VIPSIP_VOZ_400_V1
!
interface GigabitEthernet2/1/0.151320
 description JAV DISTRIBUICAO  | 1500K | SLS/VL/9833138700 | (SLS/VL/9833138700)
 bandwidth 1500
 encapsulation dot1Q 1513 second-dot1q 20
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.179.228.153 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QDI_VIPSIP_VOZ_1500_V1
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet2/1/0.151323
 description CAEMA  | 1500K | SLS/VL/9832258525 | (SLS/VL/9832258525)
 bandwidth 1500
 encapsulation dot1Q 1513 second-dot1q 23
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.179.213.41 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QDI_VIPSIP_VOZ_1500_V1
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet2/1/0.151325
 description ENTREPOSTO COMERCIAL  | 1500K | SLS/VL/9821076800 | (SLS/VL/9821076800)
 bandwidth 1500
 encapsulation dot1Q 1513 second-dot1q 25
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.241.95.1 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QDI_VIPSIP_VOZ_1500_V1
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet2/1/0.151410
 description LASA_NOVA  | 2048K | SLS/IP/05912 | (SLS/IP/05912)
 bandwidth 2048
 encapsulation dot1Q 1514 second-dot1q 10
 ip vrf forwarding LASA_NOVA:155000
 ip address 201.45.221.9 255.255.255.252
 no ip proxy-arp
 service-policy input QDI_2048K_13_38_23_0_0_2_23
 service-policy output QDO_2048K_13_38_23_0_0_2_23
!
interface GigabitEthernet2/1/0.151411
 description BBRASIL_NAC  | 1024K | SLS/IP/04599 | (SLS/IP/04599) | BGP_AS65321
 bandwidth 1024
 encapsulation dot1Q 1514 second-dot1q 11
 ip vrf forwarding BBRASIL_NAC:7399
 ip address 10.66.177.9 255.255.255.252
 no ip proxy-arp
 service-policy input QDI_1024K_BBrasil_NAC_IACC_V1
 service-policy output QDO_1024K_BBrasil_NAC_IACC_V1
!
interface GigabitEthernet2/1/0.151417
 description REDE_CORREIOS  | 256K | SLS/IP/06099 | (SLS/IP/06099) | BGP_AS65001
 bandwidth 256
 encapsulation dot1Q 1514 second-dot1q 17
 ip vrf forwarding CORREIOS_2016:155714
 ip address 172.18.73.9 255.255.255.252
 no ip proxy-arp
 service-policy input QPI_BBONE_N_256_V1
 service-policy output QDO_Correios_256K_ARPA_IOS_D_V1
!
interface GigabitEthernet2/1/0.151418
 description BOTICARIO  | 2048K | SLS/IP/06133 | (SLS/IP/06133) | BGP_AS65100
 bandwidth 2048
 encapsulation dot1Q 1514 second-dot1q 18
 ip vrf forwarding BOTICARIO2:3247
 ip address 200.179.228.149 255.255.255.252
 no ip proxy-arp
 ip pim sparse-mode
 service-policy input QDI_2048K_5_0_6_50_16_2_20
 service-policy output QDO_2048K_5_0_6_50_16_2_20
!
interface GigabitEthernet2/1/0.151421
 description MAKRO  | 2048K | SLS/IP/06160 | (SLS/IP/06160) | BGP_AS65001
 bandwidth 2048
 encapsulation dot1Q 1514 second-dot1q 21
 ip vrf forwarding MAKRO:7547
 ip address 200.179.228.173 255.255.255.252
 no ip proxy-arp
 service-policy input QDI_2048K_15_0_50_20_5_2_7
 service-policy output QDO_2048K_15_0_50_20_5_2_7
!
interface GigabitEthernet2/1/0.1500117
 description INAGRO  | 4096K | SLS/IP/05305 | (SLS/IP/05305)
 bandwidth 4096
 encapsulation dot1Q 1500 second-dot1q 117
 ip address 189.53.11.129 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_4096_V1
 service-policy output QPO_BBONE_4096_V1
!
interface GigabitEthernet2/1/0.1500119
 description ATLANTICA SERVICOS  | 20M | SLS/IP/03841 | (SLS/IP/03841)
 bandwidth 20000
 encapsulation dot1Q 1500 second-dot1q 119
 ip address 200.253.132.149 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_20000_V1
 service-policy output QPO_BBONE_20000_V1
!
interface GigabitEthernet2/1/0.1500123
 description FERRAZ E PINHEIRO  | 20M | SLS/IP/06174 | (SLS/IP/06174)
 bandwidth 20000
 encapsulation dot1Q 1500 second-dot1q 123
 ip address 200.241.95.73 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_20000_V1
 service-policy output QPO_BBONE_20000_V1
!
interface GigabitEthernet2/1/0.1500125
 description GESAC  | 4096K | SLS/IP/06181 | (SLS/IP/06181)
 bandwidth 4096
 encapsulation dot1Q 1500 second-dot1q 125
 ip address 200.252.158.233 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_4096_V1
 service-policy output QPO_BBONE_4096_V1
!
interface GigabitEthernet2/1/0.1500128
 description SINDICATO DO MARANH  | 4096K | SLS/IP/06203 | (SLS/IP/06203)
 bandwidth 4096
 encapsulation dot1Q 1500 second-dot1q 128
 ip address 200.179.228.221 255.255.255.252
 no ip proxy-arp
 service-policy input QPI_BBONE_S_4096_V1
 service-policy output QPO_BBONE_4096_V1
!
interface GigabitEthernet2/1/0.1500133
 description JEVA  | 6000K | SLS/IP/04091 | (SLS/IP/04091)
 bandwidth 6000
 encapsulation dot1Q 1500 second-dot1q 133
 ip address 200.179.126.85 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_6000_V1
 service-policy output QPO_BBONE_6000_V1
!
interface GigabitEthernet2/1/0.1500137
 description BANCO_DO_BRASIL  | 10M | SLS/IP/06293 | (SLS/IP/06293)
 bandwidth 10000
 encapsulation dot1Q 1500 second-dot1q 137
 ip address 200.179.126.201 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_10000_V1
 service-policy output QPO_BBONE_10000_V1
!
interface GigabitEthernet2/1/0.1500138
 description BANCO_DO_BRASIL  | 16000K | SLS/IP/06282 | (SLS/IP/06282)
 bandwidth 16000
 encapsulation dot1Q 1500 second-dot1q 138
 ip address 200.179.126.209 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_16000_V1
 service-policy output QPO_BBONE_16000_V1
!
interface GigabitEthernet2/1/0.1500139
 description OAB  | 8000K | SLS/IP/06286 | (SLS/IP/06286)
 bandwidth 8000
 encapsulation dot1Q 1500 second-dot1q 139
 ip address 200.179.126.221 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_8000_V1
 service-policy output QPO_BBONE_8000_V1
!
interface GigabitEthernet2/1/0.1500140
 description BBRASIL_NAC  | 10M | SLS/IP/06292 | (SLS/IP/06292)
 bandwidth 10000
 encapsulation dot1Q 1500 second-dot1q 140
 ip address 200.179.126.241 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_10000_V1
 service-policy output QPO_BBONE_10000_V1
!
interface GigabitEthernet2/1/0.1500141
 description BANCOAMAZONIA  | 6000K | SLS/IP/06321 | (SLS/IP/06321)
 bandwidth 6000
 encapsulation dot1Q 1500 second-dot1q 141
 ip address 200.179.228.249 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_6000_V1
 service-policy output QPO_BBONE_6000_V1
!
interface GigabitEthernet2/1/0.1500142
 description BANCO_DO_BRASIL_SA  | 16000K | SLS/IP/06236 | (SLS/IP/06236)
 bandwidth 16000
 encapsulation dot1Q 1500 second-dot1q 142
 ip address 200.179.213.29 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_16000_V1
 service-policy output QPO_BBONE_16000_V1
!
interface GigabitEthernet2/1/0.1500143
 description COOP_RCAT  | 4096K | SLS/IP/06322 | (SLS/IP/06322)
 bandwidth 4096
 encapsulation dot1Q 1500 second-dot1q 143
 ip address 200.179.230.9 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_4096_V1
 service-policy output QPO_BBONE_4096_V1
!
interface GigabitEthernet2/1/0.1500201
 description TEMPLOMAIOR  | 50M | SLS/IP/00142 | (SLS/IP/00142)
 bandwidth 50000
 encapsulation dot1Q 1500 second-dot1q 201
 ip address 200.253.132.37 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_50000_V1
 service-policy output QPO_BBONE_50000_V1
!
interface GigabitEthernet2/1/0.1500204
 description LABCEDRO  | 50M | SLS/IP/05122 | (SLS/IP/05122)
 bandwidth 50000
 encapsulation dot1Q 1500 second-dot1q 204
 ip address 200.172.11.117 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_50000_V1
 service-policy output QPO_BBONE_50000_V1
!
interface GigabitEthernet2/1/0.1500205
 description UNIHOSP  | 50M | SLS/IP/00084 | (SLS/IP/00084)
 bandwidth 50000
 encapsulation dot1Q 1500 second-dot1q 205
 ip address 200.249.174.69 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_50000_V1
 service-policy output QPO_BBONE_50000_V1
!
interface GigabitEthernet2/1/0.1500207
 description CEA  | 2048K | SLS/IP/05527 | (SLS/IP/05527)
 bandwidth 2048
 encapsulation dot1Q 1500 second-dot1q 207
 ip address 200.252.158.197 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_2048_V1
 service-policy output QPO_BBONE_2048_V1
!
interface GigabitEthernet2/1/0.1500211
 description CEA  | 2048K | SLS/IP/05526 | (SLS/IP/05526)
 bandwidth 2048
 encapsulation dot1Q 1500 second-dot1q 211
 ip address 187.28.122.45 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_2048_V1
 service-policy output QPO_BBONE_2048_V1
!
interface GigabitEthernet2/1/0.1500212
 description POLYSEL COMERCIO  | 20M | SLS/IP/05650 | (SLS/IP/05650) | BLK-SAIP-APEDIDO/2018031-2157/POR-T3RCI
 bandwidth 20000
 encapsulation dot1Q 1500 second-dot1q 212
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 shutdown
 service-policy input QPI_BBONE_S_20000_V1
 service-policy output QPO_BBONE_20000_V1
!
interface GigabitEthernet2/1/0.1500213
 description APAE_MA  | 20M | SLS/IP/05025 | (SLS/IP/05025)
 bandwidth 20000
 encapsulation dot1Q 1500 second-dot1q 213
 ip address 200.243.109.165 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_20000_V1
 service-policy output QPO_BBONE_20000_V1
!
interface GigabitEthernet2/1/0.1500214
 description CEFOR  | 20M | SLS/IP/03733 | (SLS/IP/03733)
 bandwidth 20000
 encapsulation dot1Q 1500 second-dot1q 214
 ip address 189.23.28.105 255.255.255.252
 no ip proxy-arp
 service-policy input QPI_BBONE_S_20000_V1
 service-policy output QPO_BBONE_20000_V1
!
interface GigabitEthernet2/1/0.1500215
 description H M BOGEA  | 4096K | SLS/IP/05300 | (SLS/IP/05300)
 bandwidth 4096
 encapsulation dot1Q 1500 second-dot1q 215
 ip address 200.172.11.241 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_4096_V1
 service-policy output QPO_BBONE_4096_V1
!
interface GigabitEthernet2/1/0.1500217
 description M& L SERVICOS  | 4096K | SLS/IP/05731 | (SLS/IP/05731)
 bandwidth 4096
 encapsulation dot1Q 1500 second-dot1q 217
 ip address 200.241.95.173 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_4096_V1
 service-policy output QPO_BBONE_4096_V1
!
interface GigabitEthernet2/1/0.1500219
 description INSTITUTO FLORENCE  | 16000K | SLS/IP/05318 | (SLS/IP/05318)
 bandwidth 16000
 encapsulation dot1Q 1500 second-dot1q 219
 ip address 200.172.10.77 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_16000_V1
 service-policy output QPO_BBONE_16000_V1
!
interface GigabitEthernet2/1/0.1500220
 description LABGASPAR  | 14000K | SLS/IP/00556 | (SLS/IP/00556)
 bandwidth 14000
 encapsulation dot1Q 1500 second-dot1q 220
 ip address 189.52.166.13 255.255.255.252
 no ip proxy-arp
 service-policy input QPI_BBONE_S_14000_V1
 service-policy output QPO_BBONE_14000_V1
!
interface GigabitEthernet2/1/0.1500221
 description UNICEF  | 10M | SLS/IP/05770 | (SLS/IP/05770)
 bandwidth 10000
 encapsulation dot1Q 1500 second-dot1q 221
 ip address 200.179.213.33 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_10000_V1
 service-policy output QPO_BBONE_10000_V1
!
interface GigabitEthernet2/1/0.1500227
 description JDSLIMA  | 4096K | SLS/IP/05827 | (SLS/IP/05827)
 bandwidth 4096
 encapsulation dot1Q 1500 second-dot1q 227
 ip address 200.179.213.161 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_4096_V1
 service-policy output QPO_BBONE_4096_V1
!
interface GigabitEthernet2/1/0.1500228
 description SENAR  | 14000K | SLS/IP/05203 | (SLS/IP/05203)
 bandwidth 14000
 encapsulation dot1Q 1500 second-dot1q 228
 ip address 200.172.13.201 255.255.255.252
 no ip proxy-arp
 service-policy input QPI_BBONE_S_14000_V1
 service-policy output QPO_BBONE_14000_V1
!
interface GigabitEthernet2/1/0.1500229
 description SPACECOMM  | 4096K | SLS/IP/05846 | (SLS/IP/05846)
 bandwidth 4096
 encapsulation dot1Q 1500 second-dot1q 229
 ip address 200.179.213.173 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_4096_V1
 service-policy output QPO_BBONE_4096_V1
!
interface GigabitEthernet2/1/0.1500231
 description INSTITUTO DE HEMOTERAPIA  | 10M | SLS/IP/05903 | (SLS/IP/05903)
 bandwidth 10000
 encapsulation dot1Q 1500 second-dot1q 231
 ip address 201.45.205.113 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_10000_V1
 service-policy output QPO_BBONE_10000_V1
!
interface GigabitEthernet2/1/0.1500232
 description J DOUGLAS DOS SANTOS  | 20M | SLS/IP/05918 | (SLS/IP/05918)
 bandwidth 20000
 encapsulation dot1Q 1500 second-dot1q 232
 ip address 201.45.205.169 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_20000_V1
 service-policy output QPO_BBONE_20000_V1
!
interface GigabitEthernet2/1/0.1500234
 description CDL SLS  | 10M | SLS/IP/04735 | (SLS/IP/04735)
 bandwidth 10000
 encapsulation dot1Q 1500 second-dot1q 234
 ip address 200.241.80.201 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_10000_V1
 service-policy output QPO_BBONE_10000_V1
!
interface GigabitEthernet2/1/0.1500236
 description ASSEFAZ  | 4096K | SLS/IP/05940 | (SLS/IP/05940)
 bandwidth 4096
 encapsulation dot1Q 1500 second-dot1q 236
 ip address 201.45.205.241 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_4096_V1
 service-policy output QPO_BBONE_4096_V1
!
interface GigabitEthernet2/1/0.1500237
 description PROSEMA CORRETORA  | 10M | SLS/IP/05541 | (SLS/IP/05541)
 bandwidth 10000
 encapsulation dot1Q 1500 second-dot1q 237
 ip address 201.30.37.53 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_10000_V1
 service-policy output QPO_BBONE_10000_V1
!
interface GigabitEthernet2/1/0.1500238
 description C. J. F. CLARINDO & CIA  | 4096K | SLS/IP/05729 | (SLS/IP/05729)
 bandwidth 4096
 encapsulation dot1Q 1500 second-dot1q 238
 ip address 189.52.211.221 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_4096_V1
 service-policy output QPO_BBONE_4096_V1
!
interface GigabitEthernet2/1/0.1500239
 description SOGASTRO  | 2048K | SLS/IP/05980 | (SLS/IP/05980)
 bandwidth 2048
 encapsulation dot1Q 1500 second-dot1q 239
 ip address 200.241.95.93 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_2048_V1
 service-policy output QPO_BBONE_2048_V1
!
interface GigabitEthernet2/1/0.1500240
 description PROSEGUR  | 2048K | SLS/IP/05989 | (SLS/IP/05989) | BLK-SAIP-APEDIDO/20180222-1045/POR-RPA01
 bandwidth 2048
 encapsulation dot1Q 1500 second-dot1q 240
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 shutdown
 service-policy input QPI_BBONE_S_2048_V1
 service-policy output QPO_BBONE_2048_V1
!
interface GigabitEthernet2/1/0.1500241
 description MONTELLO  | 10M | SLS/IP/01885 | (SLS/IP/01885)
 bandwidth 10000
 encapsulation dot1Q 1500 second-dot1q 241
 ip address 200.243.109.141 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_10000_V1
 service-policy output QPO_BBONE_10000_V1
!
interface GigabitEthernet2/1/0.1500242
 description CENTROMEDICO  | 20M | SLS/IP/03821 | (SLS/IP/03821)
 bandwidth 20000
 encapsulation dot1Q 1500 second-dot1q 242
 ip address 187.28.240.29 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_20000_V1
 service-policy output QPO_BBONE_20000_V1
!
interface GigabitEthernet2/1/0.1500243
 description SERVIPORTO  | 10M | SLS/IP/05996 | (SLS/IP/05996)
 bandwidth 10000
 encapsulation dot1Q 1500 second-dot1q 243
 ip address 200.179.213.85 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_10000_V1
 service-policy output QPO_BBONE_10000_V1
!
interface GigabitEthernet2/1/0.1500244
 description SOLARBR  | 4096K | SLS/IP/06022 | (SLS/IP/06022)
 bandwidth 4096
 encapsulation dot1Q 1500 second-dot1q 244
 ip address 200.241.95.57 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_4096_V1
 service-policy output QPO_BBONE_4096_V1
!
interface GigabitEthernet2/1/0.1501101
 description UNIHOSP  | 2600K | SLS/VL/9821072107 | (SLS/VL/9821072107)
 bandwidth 2600
 encapsulation dot1Q 1501 second-dot1q 101
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.179.213.21 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QDI_VIPSIP_VOZ_2600_V1
 service-policy output QDO_VIPSIP_VOZ_2600_V1
!
interface GigabitEthernet2/1/0.1501102
 description JDSLIMA  | 800K | SLS/VL/9821080400 | (SLS/VL/9821080400)
 bandwidth 800
 encapsulation dot1Q 1501 second-dot1q 102
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.179.213.149 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QDI_VIPSIP_VOZ_800_V1
 service-policy output QDO_VIPSIP_VOZ_800_V1
!
interface GigabitEthernet2/1/0.1501103
 description BIPMAR  | 800K | SLS/VL/9833116166 | (SLS/VL/9833116166)
 bandwidth 800
 encapsulation dot1Q 1501 second-dot1q 103
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.179.213.197 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QDI_VIPSIP_VOZ_800_V1
 service-policy output QDO_VIPSIP_VOZ_800_V1
!
interface GigabitEthernet2/1/0.1501104
 description BV  | 1500K | SLS/VL/9831981900 | (SLS/VL/9831981900)
 bandwidth 1500
 encapsulation dot1Q 1501 second-dot1q 104
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.179.213.221 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QDI_VIPSIP_VOZ_1500_V1
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet2/1/0.1501105
 description CEF  | 1500K | SLS/VL/9832663910 | (SLS/VL/9832663910)
 bandwidth 1500
 encapsulation dot1Q 1501 second-dot1q 105
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 201.45.205.77 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QDI_VIPSIP_VOZ_1500_V1
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet2/1/0.1501106
 description TRIUNFO  | 800K | SLS/VL/9831317777 | (SLS/VL/9831317777)
 bandwidth 800
 encapsulation dot1Q 1501 second-dot1q 106
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 201.45.205.105 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QDI_VIPSIP_VOZ_800_V1
 service-policy output QDO_VIPSIP_VOZ_800_V1
!
interface GigabitEthernet2/1/0.1501107
 description CDL SLS  | 800K | SLS/VL/9832129000 | (SLS/VL/9832129000)
 bandwidth 800
 encapsulation dot1Q 1501 second-dot1q 107
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 201.45.205.209 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QDI_VIPSIP_VOZ_800_V1
 service-policy output QDO_VIPSIP_VOZ_800_V1
!
interface GigabitEthernet2/1/0.1501108
 description PROSEMA CORRETORA  | 1500K | SLS/VL/9838789999 | (SLS/VL/9838789999)
 bandwidth 1500
 encapsulation dot1Q 1501 second-dot1q 108
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 201.45.221.177 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QDI_VIPSIP_VOZ_1500_V1
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet2/1/0.1501110
 description SOGASTRO  | 800K | SLS/VL/9821090431 | (SLS/VL/9821090431)
 bandwidth 800
 encapsulation dot1Q 1501 second-dot1q 110
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 201.45.205.205 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QDI_VIPSIP_VOZ_800_V1
 service-policy output QDO_VIPSIP_VOZ_800_V1
!
interface GigabitEthernet2/1/0.1501111
 description MONTELLO  | 800K | SLS/VL/9821077100 | (SLS/VL/9821077100)
 bandwidth 800
 encapsulation dot1Q 1501 second-dot1q 111
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 201.45.205.45 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QDI_VIPSIP_VOZ_800_V1
 service-policy output QDO_VIPSIP_VOZ_800_V1
!
interface GigabitEthernet2/1/0.1501113
 description SERVIPORTO  | 800K | SLS/VL/9832325590 | (SLS/VL/9832325590)
 bandwidth 800
 encapsulation dot1Q 1501 second-dot1q 113
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.241.95.85 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QDI_VIPSIP_VOZ_800_V1
 service-policy output QDO_VIPSIP_VOZ_800_V1
!
interface GigabitEthernet2/1/0.1501114
 description H M BOGEA | 800K | SLS/VL/9832618000 | (SLS/VL/98326180000)
 bandwidth 800
 encapsulation dot1Q 1501 second-dot1q 114
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 201.45.221.237 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QDI_VIPSIP_VOZ_800_V1
 service-policy output QDO_VIPSIP_VOZ_800_V1
!
interface GigabitEthernet2/1/0.1501120
 description ATLANTICA SERVICOS  | 1500K | SLS/VL/9830893400 | (SLS/VL/9830893400)
 bandwidth 1500
 encapsulation dot1Q 1501 second-dot1q 120
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.241.95.165 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QDI_VIPSIP_VOZ_1500_V1
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet2/1/0.1501121
 description BRADESCOSEGUROS  | 1500K | SLS/VL/9821075030 | (SLS/VL/9821075030)
 bandwidth 1500
 encapsulation dot1Q 1501 second-dot1q 121
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.179.228.93 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QDI_VIPSIP_VOZ_1500_V1
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet2/1/0.1501122
 description FERRONORTE  | 1500K | SLS/VL/9838784100 | (SLS/VL/9838784100)
 bandwidth 1500
 encapsulation dot1Q 1501 second-dot1q 122
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.179.228.125 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QDI_VIPSIP_VOZ_1500_V1
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet2/1/0.1501124
 description FERRAZ E PINHEIRO  | 1200K | SLS/VL/9840096161 | (SLS/VL/9840096161)
 bandwidth 1200
 encapsulation dot1Q 1501 second-dot1q 124
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 201.45.221.169 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QDI_VIPSIP_VOZ_1200_V1
 service-policy output QDO_VIPSIP_VOZ_1200_V1
!
interface GigabitEthernet2/1/0.1501126
 description CAEMA  | 1500K | SLS/VL/9832195000 | (SLS/VL/9832195000)
 bandwidth 1500
 encapsulation dot1Q 1501 second-dot1q 126
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.179.228.85 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QDI_VIPSIP_VOZ_1500_V1
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet2/1/0.1501129
 description SINDICATO DO MARANH  | 400K | SLS/VL/9832326454 | (SLS/VL/9832326454)
 bandwidth 400
 encapsulation dot1Q 1501 second-dot1q 129
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.179.228.241 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QDI_VIPSIP_VOZ_400_V1
 service-policy output QDO_VIPSIP_VOZ_400_V1
!
interface GigabitEthernet2/1/0.1501131
 description APAE_MA  | 1500K | SLS/VL/9832164200 | (SLS/VL/9832164200)
 bandwidth 1500
 encapsulation dot1Q 1501 second-dot1q 131
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.179.126.5 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QDI_VIPSIP_VOZ_1500_V1
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet2/1/0.1501132
 description ASSEFAZ  | 1500K | SLS/VL/9832322584 | (SLS/VL/9832322584)
 bandwidth 1500
 encapsulation dot1Q 1501 second-dot1q 132
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.179.126.13 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QDI_VIPSIP_VOZ_1500_V1
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet2/1/0.1501135
 description BRADESCO  | 1500K | SLS/VL/9838789100 | (SLS/VL/9838789100)
 bandwidth 1500
 encapsulation dot1Q 1501 second-dot1q 135
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.179.126.125 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QDI_VIPSIP_VOZ_1500_V1
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet2/1/0.1501136
 description BRADESCO  | 1500K | SLS/VL/9821097720 | (SLS/VL/9821097720)
 bandwidth 1500
 encapsulation dot1Q 1501 second-dot1q 136
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.179.126.177 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QDI_VIPSIP_VOZ_1500_V1
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet2/1/0.1501144
 description COOP_RCAT  | 800K | SLS/VL/9831981600 | (SLS/VL/9831981600)
 bandwidth 800
 encapsulation dot1Q 1501 second-dot1q 144
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.179.230.13 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QDI_VIPSIP_VOZ_800_V1
 service-policy output QDO_VIPSIP_VOZ_800_V1
!
interface GigabitEthernet2/1/0.1502116
 description REDE_CORREIOS  | 4096K | SLS/IP/06050 | (SLS/IP/06050) | BGP_AS65001
 bandwidth 4096
 encapsulation dot1Q 1502 second-dot1q 116
 ip vrf forwarding CORREIOS_2016:155714
 ip address 172.18.91.209 255.255.255.252
 no ip proxy-arp
 service-policy input QDI_Correios_4096K_ARPA_IOS_DVV_V1
 service-policy output QDO_Correios_4096K_ARPA_IOS_DVV_V1
!
interface GigabitEthernet2/1/0.1502134
 description BASA  | 4096K | SLS/IP/05960 | (SLS/IP/05960) | BGP_AS65330
 bandwidth 4096
 encapsulation dot1Q 1502 second-dot1q 134
 ip vrf forwarding BCOAM:4783
 ip address 200.252.158.89 255.255.255.252
 no ip proxy-arp
 service-policy input QDI_4096K_3_0_50_13_13_1_17
 service-policy output QDO_4096K_3_0_50_13_13_1_17
!
interface GigabitEthernet2/1/0.1502301
 description TCU  | 8000K | SLS/IP/05547 | (SLS/IP/05547)
 bandwidth 8000
 encapsulation dot1Q 1502 second-dot1q 301
 ip vrf forwarding TCU:1628
 ip address 200.241.95.13 255.255.255.252
 no ip proxy-arp
 ip pim sparse-mode
 service-policy input QDI_8000K_2_47_26_0_0_1_23
 service-policy output QDO_8000K_2_47_26_0_0_1_23
!
interface GigabitEthernet2/1/0.1502303
 description DNPM  | 10M | SLS/IP/00820 | (SLS/IP/00820)
 bandwidth 10000
 encapsulation dot1Q 1502 second-dot1q 303
 ip vrf forwarding DNPM:3963
 ip address 189.53.11.73 255.255.255.252
 no ip proxy-arp
 service-policy input QDI_10000K_5_0_22_19_2_2_34
 service-policy output QDO_10000K_5_0_22_19_2_2_34
!
interface GigabitEthernet2/1/0.1502304
 description TRF1  | 95000K | SLS/IP/00185 | (SLS/IP/00185) | BGP_AS65348
 bandwidth 95000
 encapsulation dot1Q 1502 second-dot1q 304
 ip vrf forwarding TRF1_FM:3152
 ip address 200.241.80.61 255.255.255.252
 no ip proxy-arp
 service-policy input QPI_BBONE_N_95000_V1
 service-policy output QPO_BBONE_95000_V1
!
interface GigabitEthernet2/1/0.1502305
 description SERPRO  | 20M | SLS/IP/04943 | (SLS/IP/04943)
 bandwidth 20000
 encapsulation dot1Q 1502 second-dot1q 305
 ip vrf forwarding SERPRO_SLS_DNIT_01:5893
 ip address 10.218.13.209 255.255.255.252
 no ip proxy-arp
 service-policy input QDI_SERPRO_20M_V1
 service-policy output QDO_SERPRO_20M_V1
!
interface GigabitEthernet2/1/0.1502306
 description MPU  | 16000K | SLS/IP/05000 | (SLS/IP/05000)
 bandwidth 16000
 encapsulation dot1Q 1502 second-dot1q 306
 ip vrf forwarding MPF_NOVA:6114
 ip address 192.168.34.37 255.255.255.252
 no ip proxy-arp
 ip pim sparse-mode
 service-policy input QDI_16000K_40_0_35_0_0_1_21
 service-policy output QDO_16000K_40_0_35_0_0_1_21
!
interface GigabitEthernet2/1/0.1502308
 description CPAD  | 6000K | SLS/IP/05902 | (SLS/IP/05902) | BGP_AS65372
 bandwidth 6000
 encapsulation dot1Q 1502 second-dot1q 308
 ip vrf forwarding CPAD:155471
 ip address 201.45.205.185 255.255.255.252
 no ip proxy-arp
 service-policy input QDI_6000K_9_9_54_0_0_2_25
 service-policy output QDO_6000K_9_9_54_0_0_2_25
!
interface GigabitEthernet2/1/0.1502309
 description BOMPRECO  | 10M | SLS/IP/00528 | (SLS/IP/00528) | BGP_AS65371
 bandwidth 10000
 encapsulation dot1Q 1502 second-dot1q 309
 ip vrf forwarding WALMART:3141
 ip address 201.45.138.173 255.255.255.252
 no ip proxy-arp
 service-policy input QDI_10000K_30_0_20_10_30_1_5
 service-policy output QDO_10000K_30_0_20_10_30_1_5
!
interface GigabitEthernet2/1/0.1502310
 description SABEMI INTERMEDIADORA  | 4096K | SLS/IP/05550 | (SLS/IP/05550) | BGP_AS65436
 bandwidth 4096
 encapsulation dot1Q 1502 second-dot1q 310
 ip vrf forwarding SABEMI:4503
 ip address 189.52.211.253 255.255.255.252
 no ip proxy-arp
 service-policy input QDI_4096K_13_0_62_0_0_2_22
 service-policy output QDO_4096K_13_0_62_0_0_2_22
!
interface GigabitEthernet2/1/0.1503111
 description CEA  | 2048K | SLS/IP/05528 | (SLS/IP/05528)
 bandwidth 2048
 encapsulation dot1Q 1503 second-dot1q 111
 ip address 189.53.246.237 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_2048_V1
 service-policy output QPO_BBONE_2048_V1
!
interface GigabitEthernet2/1/0.1503133
 description COLEGIO DOM BOSCO  | 100M | SLS/IP/06130 | (SLS/IP/06130)
 bandwidth 100000
 encapsulation dot1Q 1503 second-dot1q 133
 ip address 187.28.240.25 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_100000_V1
 service-policy output QPO_BBONE_100000_V1
!
interface GigabitEthernet2/1/0.1503134
 description ALVORADA MOTO  | 10M | SLS/IP/05126 | (SLS/IP/05126)
 bandwidth 10000
 encapsulation dot1Q 1503 second-dot1q 134
 ip address 200.172.182.173 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_10000_V1
 service-policy output QPO_BBONE_10000_V1
!
interface GigabitEthernet2/1/0.1503135
 description COBRA  | 10M | SLS/IP/06109 | (SLS/IP/06109)
 bandwidth 10000
 encapsulation dot1Q 1503 second-dot1q 135
 ip address 200.179.228.53 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_10000_V1
 service-policy output QPO_BBONE_10000_V1
!
interface GigabitEthernet2/1/0.1503137
 description BK_BRASIL  | 2048K | SLS/IP/06129 | (SLS/IP/06129)
 bandwidth 2048
 encapsulation dot1Q 1503 second-dot1q 137
 ip address 189.52.211.53 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_2048_V1
 service-policy output QPO_BBONE_2048_V1
!
interface GigabitEthernet2/1/0.1503141
 description LINX  | 2048K | SLS/IP/06127 | (SLS/IP/06127)
 bandwidth 2048
 encapsulation dot1Q 1503 second-dot1q 141
 ip address 200.179.228.133 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_2048_V1
 service-policy output QPO_BBONE_2048_V1
!
interface GigabitEthernet2/1/0.1503147
 description BBRASIL  | 16000K | SLS/IP/06206 | (SLS/IP/06206)
 bandwidth 16000
 encapsulation dot1Q 1503 second-dot1q 147
 ip address 200.179.228.233 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_16000_V1
 service-policy output QPO_BBONE_16000_V1
!
interface GigabitEthernet2/1/0.1503148
 description G5_LOGISTICA  | 10M | SLS/IP/06201 | (SLS/IP/06201)
 bandwidth 10000
 encapsulation dot1Q 1503 second-dot1q 148
 ip address 200.179.228.237 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_10000_V1
 service-policy output QPO_BBONE_10000_V1
!
interface GigabitEthernet2/1/0.1503149
 description ORGANIZACAO_ALVES  | 10M | SLS/IP/06166 | (SLS/IP/06166)
 bandwidth 10000
 encapsulation dot1Q 1503 second-dot1q 149
 ip address 200.179.229.37 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_10000_V1
 service-policy output QPO_BBONE_10000_V1
!
interface GigabitEthernet2/1/0.1503152
 description SESC  | 34000K | SLS/IP/05815 | (SLS/IP/05815)
 bandwidth 34000
 encapsulation dot1Q 1503 second-dot1q 152
 ip address 200.179.213.53 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_34000_V1
 service-policy output QPO_BBONE_34000_V1
!
interface GigabitEthernet2/1/0.1503153
 description LOCALIZA  | 10M | SLS/IP/06228 | (SLS/IP/06228)
 bandwidth 10000
 encapsulation dot1Q 1503 second-dot1q 153
 ip address 201.45.205.161 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_10000_V1
 service-policy output QPO_BBONE_10000_V1
!
interface GigabitEthernet2/1/0.1503155
 description DISOLCLOUD  | 4096K | SLS/IP/06222 | (SLS/IP/06222)
 bandwidth 4096
 encapsulation dot1Q 1503 second-dot1q 155
 ip address 200.179.126.21 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_4096_V1
 service-policy output QPO_BBONE_4096_V1
!
interface GigabitEthernet2/1/0.1503158
 description DALCAR  | 20M | SLS/IP/04042 | (SLS/IP/04042)
 bandwidth 20000
 encapsulation dot1Q 1503 second-dot1q 158
 ip address 200.249.169.29 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_20000_V1
 service-policy output QPO_BBONE_20000_V1
!
interface GigabitEthernet2/1/0.1503164
 description BEL_SUL_ADMINISTRACAO  | 8000K | SLS/IP/06235 | (SLS/IP/06235)
 bandwidth 8000
 encapsulation dot1Q 1503 second-dot1q 164
 ip address 200.179.126.41 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_8000_V1
 service-policy output QPO_BBONE_8000_V1
!
interface GigabitEthernet2/1/0.1503168
 description LINX TELECOMUNICACOES  | 10M | SLS/IP/06208 | (SLS/IP/06208)
 bandwidth 10000
 encapsulation dot1Q 1503 second-dot1q 168
 ip address 200.179.126.81 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_10000_V1
 service-policy output QPO_BBONE_10000_V1
!
interface GigabitEthernet2/1/0.1503169
 description BK_BRASIL  | 4096K | SLS/IP/06216 | (SLS/IP/06216)
 bandwidth 4096
 encapsulation dot1Q 1503 second-dot1q 169
 ip address 200.179.126.97 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_4096_V1
 service-policy output QPO_BBONE_4096_V1
!
interface GigabitEthernet2/1/0.1503170
 description GDX_CORRETORA  | 10M | SLS/IP/06030 | (SLS/IP/06030)
 bandwidth 10000
 encapsulation dot1Q 1503 second-dot1q 170
 ip address 200.179.214.149 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_10000_V1
 service-policy output QPO_BBONE_10000_V1
!
interface GigabitEthernet2/1/0.1503171
 description LOCALIZA  | 10M | SLS/IP/05792 | (SLS/IP/05792)
 bandwidth 10000
 encapsulation dot1Q 1503 second-dot1q 171
 ip address 189.53.246.101 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_10000_V1
 service-policy output QPO_BBONE_10000_V1
!
interface GigabitEthernet2/1/0.1503173
 description BBRASIL_NAC  | 16000K | SLS/IP/06238 | (SLS/IP/06238)
 bandwidth 16000
 encapsulation dot1Q 1503 second-dot1q 173
 ip address 200.179.126.157 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_16000_V1
 service-policy output QPO_BBONE_16000_V1
!
interface GigabitEthernet2/1/0.1503176
 description DAYCOVAL  | 8000K | SLS/IP/05937 | (SLS/IP/05937)
 bandwidth 8000
 encapsulation dot1Q 1503 second-dot1q 176
 ip address 189.53.246.61 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_8000_V1
 service-policy output QPO_BBONE_8000_V1
!
interface GigabitEthernet2/1/0.1503178
 description BANCO_DO_BRASIL_SA  | 16000K | SLS/IP/06240 | (SLS/IP/06240)
 bandwidth 16000
 encapsulation dot1Q 1503 second-dot1q 178
 ip address 200.179.213.113 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_16000_V1
 service-policy output QPO_BBONE_16000_V1
!
interface GigabitEthernet2/1/0.1503180
 description CENTRAL_UNIMED  | 20M | SLS/IP/05904 | (SLS/IP/05904)
 bandwidth 20000
 encapsulation dot1Q 1503 second-dot1q 180
 ip address 201.45.205.101 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_20000_V1
 service-policy output QPO_BBONE_20000_V1
!
interface GigabitEthernet2/1/0.1503183
 description BANCO_DO_BRASIL_SA  | 16000K | SLS/IP/06239 | (SLS/IP/06239)
 bandwidth 16000
 encapsulation dot1Q 1503 second-dot1q 183
 ip address 200.179.126.193 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_16000_V1
 service-policy output QPO_BBONE_16000_V1
!
interface GigabitEthernet2/1/0.1503184
 description OAB  | 8000K | SLS/IP/06285 | (SLS/IP/06285)
 bandwidth 8000
 encapsulation dot1Q 1503 second-dot1q 184
 ip address 200.179.126.217 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_8000_V1
 service-policy output QPO_BBONE_8000_V1
!
interface GigabitEthernet2/1/0.1503185
 description OAB  | 34000K | SLS/IP/06284 | (SLS/IP/06284)
 bandwidth 34000
 encapsulation dot1Q 1503 second-dot1q 185
 ip address 200.241.95.205 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_34000_V1
 service-policy output QPO_BBONE_34000_V1
!
interface GigabitEthernet2/1/0.1503186
 description FEDERACAO  | 10M | SLS/IP/04839 | (SLS/IP/04839)
 bandwidth 10000
 encapsulation dot1Q 1503 second-dot1q 186
 ip address 189.52.190.49 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_10000_V1
 service-policy output QPO_BBONE_10000_V1
!
interface GigabitEthernet2/1/0.1503187
 description BBRASIL  | 10M | SLS/IP/06297 | (SLS/IP/06297)
 bandwidth 10000
 encapsulation dot1Q 1503 second-dot1q 187
 ip address 200.179.126.225 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_10000_V1
 service-policy output QPO_BBONE_10000_V1
!
interface GigabitEthernet2/1/0.1503188
 description BANCO_DO_BRASIL_SA  | 10M | SLS/IP/06307 | (SLS/IP/06307)
 bandwidth 10000
 encapsulation dot1Q 1503 second-dot1q 188
 ip address 200.179.126.237 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_10000_V1
 service-policy output QPO_BBONE_10000_V1
!
interface GigabitEthernet2/1/0.1503189
 description BEL_SUL_ADMINISTRACAO  | 20M | SLS/IP/06323 | (SLS/IP/06323)
 bandwidth 20000
 encapsulation dot1Q 1503 second-dot1q 189
 ip address 200.179.230.21 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_20000_V1
 service-policy output QPO_BBONE_20000_V1
!
interface GigabitEthernet2/1/0.1503190
 description SOMAR  | 20M | SLS/IP/05173 | (SLS/IP/05173)
 bandwidth 20000
 encapsulation dot1Q 1503 second-dot1q 190
 ip address 187.29.255.217 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_20000_V1
 service-policy output QPO_BBONE_20000_V1
!
interface GigabitEthernet2/1/0.1503200
 description JOSE_LUIZ_DOS_REIS  | 10M | SLS/IP/06015 | (SLS/IP/06015)
 bandwidth 10000
 encapsulation dot1Q 1503 second-dot1q 200
 ip address 201.45.221.205 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_10000_V1
 service-policy output QPO_BBONE_10000_V1
!
interface GigabitEthernet2/1/0.1503201
 description COBRAPE  | 10M | SLS/IP/05559 | (SLS/IP/05559)
 bandwidth 10000
 encapsulation dot1Q 1503 second-dot1q 201
 ip address 200.172.10.209 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_10000_V1
 service-policy output QPO_BBONE_10000_V1
!
interface GigabitEthernet2/1/0.1503206
 description DUVEL  | 20M | SLS/IP/04024 | (SLS/IP/04024)
 bandwidth 20000
 encapsulation dot1Q 1503 second-dot1q 206
 ip address 200.209.190.185 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_20000_V1
 service-policy output QPO_BBONE_20000_V1
!
interface GigabitEthernet2/1/0.1503213
 description LOGOS  | 10M | SLS/IP/03897 | (SLS/IP/03897)
 bandwidth 10000
 encapsulation dot1Q 1503 second-dot1q 213
 ip address 200.249.171.241 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_10000_V1
 service-policy output QPO_BBONE_10000_V1
!
interface GigabitEthernet2/1/0.1503215
 description GRAN CAR  | 10M | SLS/IP/05651 | (SLS/IP/05651)
 bandwidth 10000
 encapsulation dot1Q 1503 second-dot1q 215
 ip address 200.241.95.41 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_10000_V1
 service-policy output QPO_BBONE_10000_V1
!
interface GigabitEthernet2/1/0.1503216
 description DOMIN  | 34M | SLS/IP/02133 | (SLS/IP/02133)
 bandwidth 34000
 encapsulation dot1Q 1503 second-dot1q 216
 ip address 200.249.174.93 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_34000_V1
 service-policy output QPO_BBONE_34000_V1
!
interface GigabitEthernet2/1/0.1503218
 description E LINDOSO  | 155000K | SLS/IP/05656 | (SLS/IP/05656)
 bandwidth 155000
 encapsulation dot1Q 1503 second-dot1q 218
 ip address 200.241.95.125 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_155000_V1
 service-policy output QPO_BBONE_155000_V1
!
interface GigabitEthernet2/1/0.1503219
 description POSTO NATUREZA E SERVICOS  | 4096K | SLS/IP/05717 | (SLS/IP/05717) | BLK-SAIP-APEDIDO/20170811-1423/POR-DENISVM
 bandwidth 4096
 encapsulation dot1Q 1503 second-dot1q 219
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 shutdown
 service-policy input QPI_BBONE_S_4096_V1
 service-policy output QPO_BBONE_4096_V1
!
interface GigabitEthernet2/1/0.1503221
 description SAMCAL  | 20M | SLS/IP/05163 | (SLS/IP/05163)
 bandwidth 20000
 encapsulation dot1Q 1503 second-dot1q 221
 ip address 187.29.255.197 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_20000_V1
 service-policy output QPO_BBONE_20000_V1
!
interface GigabitEthernet2/1/0.1503223
 description ASSUNCAO E ROCHA  | 50M | SLS/IP/05252 | (SLS/IP/05252)
 bandwidth 50000
 encapsulation dot1Q 1503 second-dot1q 223
 ip address 200.172.11.201 255.255.255.252
 no ip proxy-arp
 service-policy input QPI_BBONE_S_50000_V1
 service-policy output QPO_BBONE_50000_V1
!
interface GigabitEthernet2/1/0.1503225
 description J LEITE GALVAO  | 4096K | SLS/IP/05768 | (SLS/IP/05768)
 bandwidth 4096
 encapsulation dot1Q 1503 second-dot1q 225
 ip address 200.241.95.249 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_4096_V1
 service-policy output QPO_BBONE_4096_V1
!
interface GigabitEthernet2/1/0.1503227
 description CONSELHO REGIONAL  | 4096K | SLS/IP/05778 | (SLS/IP/05778)
 bandwidth 4096
 encapsulation dot1Q 1503 second-dot1q 227
 ip address 200.241.95.157 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_4096_V1
 service-policy output QPO_BBONE_4096_V1
!
interface GigabitEthernet2/1/0.1503228
 description CRESCIMENTO  | 10M | SLS/IP/02487 | (SLS/IP/02487)
 bandwidth 10000
 encapsulation dot1Q 1503 second-dot1q 228
 ip address 200.243.109.233 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_10000_V1
 service-policy output QPO_BBONE_10000_V1
!
interface GigabitEthernet2/1/0.1503230
 description CENTRO_NEFROLOGIA  | 4096K | SLS/IP/05794 | (SLS/IP/05794)
 bandwidth 4096
 encapsulation dot1Q 1503 second-dot1q 230
 ip address 200.179.213.49 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_4096_V1
 service-policy output QPO_BBONE_4096_V1
!
interface GigabitEthernet2/1/0.1503233
 description VALENCA_ADVOGADOS  | 4096K | SLS/IP/05826 | (SLS/IP/05826) | BLK-SAIP-APEDIDO/20170320-830/POR-DENISVM
 bandwidth 4096
 encapsulation dot1Q 1503 second-dot1q 233
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 shutdown
 service-policy input QPI_BBONE_S_4096_V1
 service-policy output QPO_BBONE_4096_V1
!
interface GigabitEthernet2/1/0.1503235
 description HRO  | 10M | SLS/IP/05831 | (SLS/IP/05831)
 bandwidth 10000
 encapsulation dot1Q 1503 second-dot1q 235
 ip address 200.179.213.133 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_10000_V1
 service-policy output QPO_BBONE_10000_V1
!
interface GigabitEthernet2/1/0.1503236
 description TAGUATUR  | 20M | SLS/IP/01429 | (SLS/IP/01429)
 bandwidth 20000
 encapsulation dot1Q 1503 second-dot1q 236
 ip address 200.249.174.197 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_20000_V1
 service-policy output QPO_BBONE_20000_V1
!
interface GigabitEthernet2/1/0.1503237
 description ENTREPOSTO COMERCIAL  | 10M | SLS/IP/04503 | (SLS/IP/04503)
 bandwidth 10000
 encapsulation dot1Q 1503 second-dot1q 237
 ip address 200.241.80.41 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_10000_V1
 service-policy output QPO_BBONE_10000_V1
!
interface GigabitEthernet2/1/0.1503238
 description ENTREPOSTO  | 10M | SLS/IP/05403 | (SLS/IP/05403)
 bandwidth 10000
 encapsulation dot1Q 1503 second-dot1q 238
 ip address 201.30.36.5 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_10000_V1
 service-policy output QPO_BBONE_10000_V1
!
interface GigabitEthernet2/1/0.1503240
 description PREVIDENCIA COMPLEMENTAR  | 10M | SLS/IP/05861 | (SLS/IP/05861)
 bandwidth 10000
 encapsulation dot1Q 1503 second-dot1q 240
 ip address 200.179.213.93 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_10000_V1
 service-policy output QPO_BBONE_10000_V1
!
interface GigabitEthernet2/1/0.1503242
 description AVANTI  | 4096K | SLS/IP/05879 | (SLS/IP/05879)
 bandwidth 4096
 encapsulation dot1Q 1503 second-dot1q 242
 ip address 200.179.213.245 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_4096_V1
 service-policy output QPO_BBONE_4096_V1
!
interface GigabitEthernet2/1/0.1503243
 description A RENOVAR UTILIDADES  | 10M | SLS/IP/03874 | (SLS/IP/03874)
 bandwidth 10000
 encapsulation dot1Q 1503 second-dot1q 243
 ip address 187.28.240.77 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_10000_V1
 service-policy output QPO_BBONE_10000_V1
!
interface GigabitEthernet2/1/0.1503244
 description LASTRO  | 4096K | SLS/IP/05388 | (SLS/IP/05388)
 bandwidth 4096
 encapsulation dot1Q 1503 second-dot1q 244
 ip address 200.172.182.185 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_4096_V1
 service-policy output QPO_BBONE_4096_V1
!
interface GigabitEthernet2/1/0.1503245
 description LUCAS PORTO  | 10M | SLS/IP/05919 | (SLS/IP/05919)
 bandwidth 10000
 encapsulation dot1Q 1503 second-dot1q 245
 ip address 189.53.246.81 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_10000_V1
 service-policy output QPO_BBONE_10000_V1
!
interface GigabitEthernet2/1/0.1503249
 description PASA PLANO ASSIST SAUDE  | 10M | SLS/IP/05102 | (SLS/IP/05102)
 bandwidth 10000
 encapsulation dot1Q 1503 second-dot1q 249
 ip address 200.172.11.101 255.255.255.252
 no ip proxy-arp
 service-policy input QPI_BBONE_S_10000_V1
 service-policy output QPO_BBONE_10000_V1
!
interface GigabitEthernet2/1/0.1503250
 description RIHAPPY  | 2048K | SLS/IP/05968 | (SLS/IP/05968)
 bandwidth 2048
 encapsulation dot1Q 1503 second-dot1q 250
 ip vrf forwarding REDEVIP_BLD_MLPPP:3799
 ip address 201.45.221.113 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_2048_V1
 service-policy output QPO_BBONE_2048_V1
!
interface GigabitEthernet2/1/0.1503251
 description GRANDE RIO COMERCIO  | 10M | SLS/IP/05284 | (SLS/IP/05284)
 bandwidth 10000
 encapsulation dot1Q 1503 second-dot1q 251
 ip address 189.53.11.241 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_10000_V1
 service-policy output QPO_BBONE_10000_V1
!
interface GigabitEthernet2/1/0.1503252
 description GRANORTE  | 10M | SLS/IP/06029 | (SLS/IP/06029)
 bandwidth 10000
 encapsulation dot1Q 1503 second-dot1q 252
 ip address 201.45.221.233 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_10000_V1
 service-policy output QPO_BBONE_10000_V1
!
interface GigabitEthernet2/1/0.1503253
 description COOP ECONO CRED  | 4096K | SLS/IP/05367 | (SLS/IP/05367)
 bandwidth 4096
 encapsulation dot1Q 1503 second-dot1q 253
 ip address 200.172.182.197 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_4096_V1
 service-policy output QPO_BBONE_4096_V1
!
interface GigabitEthernet2/1/0.1504101
 description COBRAPE STCP  | 1500K | SLS/VL/9840091200 | (SLS/VL/9840091200)
 bandwidth 1500
 encapsulation dot1Q 1504 second-dot1q 101
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.241.95.5 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QDI_VIPSIP_VOZ_1500_V1
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet2/1/0.1504103
 description DOMIN  | 1500K | SLS/VL/9821062900 | (SLS/VL/9821062900)
 bandwidth 1500
 encapsulation dot1Q 1504 second-dot1q 103
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.241.95.77 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QDI_VIPSIP_VOZ_1500_V1
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet2/1/0.1504104
 description UNITAXISLS  | 800K | SLS/VL/9832321111 | (SLS/VL/9832321111)
 bandwidth 800
 encapsulation dot1Q 1504 second-dot1q 104
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.241.95.101 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QDI_VIPSIP_VOZ_800_V1
 service-policy output QDO_VIPSIP_VOZ_800_V1
!
interface GigabitEthernet2/1/0.1504106
 description POSTO NATUREZA E SERVICOS  | 1500K | SLS/VL/9833113200 | (SLS/VL/9833113200)
 bandwidth 1500
 encapsulation dot1Q 1504 second-dot1q 106
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.179.213.1 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QDI_VIPSIP_VOZ_1500_V1
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet2/1/0.1504108
 description CONSELHO REGIONAL  | 1500K | SLS/VL/9832322882 | (SLS/VL/9832322882)
 bandwidth 1500
 encapsulation dot1Q 1504 second-dot1q 108
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.179.213.13 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QDI_VIPSIP_VOZ_1500_V1
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet2/1/0.1504109
 description CENTRO_NEFROLOGIA  | 800K | SLS/VL/9832360071 | (SLS/VL/9832360071)
 bandwidth 800
 encapsulation dot1Q 1504 second-dot1q 109
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.179.213.61 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QDI_VIPSIP_VOZ_800_V1
 service-policy output QDO_VIPSIP_VOZ_800_V1
!
interface GigabitEthernet2/1/0.1504112
 description DUVEL  | 2600K | SLS/VL/9821083000 | (SLS/VL/9821083000)
 bandwidth 2600
 encapsulation dot1Q 1504 second-dot1q 112
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.179.213.185 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QDI_VIPSIP_VOZ_2600_V1
 service-policy output QDO_VIPSIP_VOZ_2600_V1
!
interface GigabitEthernet2/1/0.1504113
 description HRO  | 400K | SLS/VL/9821072750 | (SLS/VL/9821072750)
 bandwidth 400
 encapsulation dot1Q 1504 second-dot1q 113
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 201.45.205.1 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy output QDO_VIPSIP_VOZ_400_V1
!
interface GigabitEthernet2/1/0.1504114
 description AVANTI  | 400K | SLS/VL/9833110390 | (SLS/VL/9833110390)
 bandwidth 400
 encapsulation dot1Q 1504 second-dot1q 114
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.179.213.237 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QDI_VIPSIP_VOZ_400_V1
 service-policy output QDO_VIPSIP_VOZ_400_V1
!
interface GigabitEthernet2/1/0.1504116
 description LASTRO  | 400K | SLS/VL/9840096630 | (SLS/VL/9840096630)
 bandwidth 400
 encapsulation dot1Q 1504 second-dot1q 116
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 201.45.205.93 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QDI_VIPSIP_VOZ_400_V1
 service-policy output QDO_VIPSIP_VOZ_400_V1
!
interface GigabitEthernet2/1/0.1504118
 description VIDASRESGATE  | 1500K | SLS/VL/9821079900 | (SLS/VL/9821079900)
 bandwidth 1500
 encapsulation dot1Q 1504 second-dot1q 118
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 201.45.205.221 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QDI_VIPSIP_VOZ_1500_V1
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet2/1/0.1504119
 description LOCALIZA  | 1500K | SLS/VL/9821093900 | (SLS/VL/9821093900)
 bandwidth 1500
 encapsulation dot1Q 1504 second-dot1q 119
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 201.45.205.233 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QDI_VIPSIP_VOZ_1500_V1
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet2/1/0.1504120
 description JGS CORRETORES  | 400K | SLS/VL/9832688844 | (SLS/VL/9832688844)
 bandwidth 400
 encapsulation dot1Q 1504 second-dot1q 120
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 201.45.221.33 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QDI_VIPSIP_VOZ_400_V1
 service-policy output QDO_VIPSIP_VOZ_400_V1
!
interface GigabitEthernet2/1/0.1504121
 description BRADESCO  | 1500K | SLS/VL/9838783100 | (SLS/VL/9838783100)
 bandwidth 1500
 encapsulation dot1Q 1504 second-dot1q 121
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 201.45.221.65 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QDI_VIPSIP_VOZ_1500_V1
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet2/1/0.1504122
 description GRANORTE  | 1500K | SLS/VL/9832619000 | (SLS/VL/9832619000)
 bandwidth 1500
 encapsulation dot1Q 1504 second-dot1q 122
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 201.45.205.253 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QDI_VIPSIP_VOZ_1500_V1
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet2/1/0.1504123
 description GRANDE RIO COMERCIO  | 1500K | SLS/VL/9833115700 | (SLS/VL/9833115700)
 bandwidth 1500
 encapsulation dot1Q 1504 second-dot1q 123
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 201.45.221.225 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QDI_VIPSIP_VOZ_1500_V1
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet2/1/0.1504125
 description JOSE_LUIZ_DOS_REIS  | 1500K | SLS/VL/9833118530 | (SLS/VL/9833118530)
 bandwidth 1500
 encapsulation dot1Q 1504 second-dot1q 125
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 201.45.221.209 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QDI_VIPSIP_VOZ_1500_V1
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet2/1/0.1504126
 description SEBRAE  | 1500K | SLS001/CNG/08005700800 | (SLS001/CNG/08005700800)
 bandwidth 1500
 encapsulation dot1Q 1504 second-dot1q 126
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.179.228.17 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QDI_VIPSIP_VOZ_1500_V1
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet2/1/0.1504131
 description TOKSTOK  | 1500K | SLS/VL/9821062050 | (SLS/VL/9821062050)
 bandwidth 1500
 encapsulation dot1Q 1504 second-dot1q 131
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.179.213.177 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QDI_VIPSIP_VOZ_1500_V1
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet2/1/0.1504132
 description SAO_LUIS_ADM  | 800K | SLS/VL/9833133760 | (SLS/VL/9833133760)
 bandwidth 800
 encapsulation dot1Q 1504 second-dot1q 132
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.179.228.33 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QDI_VIPSIP_VOZ_800_V1
 service-policy output QDO_VIPSIP_VOZ_800_V1
!
interface GigabitEthernet2/1/0.1504136
 description PROGEN  | 1500K | SLS/VL/9833118500 | (SLS/VL/9833118500)
 bandwidth 1500
 encapsulation dot1Q 1504 second-dot1q 136
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.179.228.57 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QDI_VIPSIP_VOZ_1500_V1
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet2/1/0.1504138
 description MOVIDA  | 1500K | SLS/VL/9821079280 | (SLS/VL/9821079280)
 bandwidth 1500
 encapsulation dot1Q 1504 second-dot1q 138
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.179.228.101 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QDI_VIPSIP_VOZ_1500_V1
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet2/1/0.1504142
 description ILHA MEDICAL LTDA  | 1500K | SLS/VL/9838782000 | (SLS/VL/9838782000)
 bandwidth 1500
 encapsulation dot1Q 1504 second-dot1q 142
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.179.228.137 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QDI_VIPSIP_VOZ_1500_V1
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet2/1/0.1504143
 description TCE-MA  | 2600K | SLS/VL/9820166000 | (SLS/VL/9820166000)
 bandwidth 2600
 encapsulation dot1Q 1504 second-dot1q 143
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.179.228.73 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QDI_VIPSIP_VOZ_2600_V1
 service-policy output QDO_VIPSIP_VOZ_2600_V1
!
interface GigabitEthernet2/1/0.1504146
 description CAEMA  | 1500K | SLS/VL/9832366635 | (SLS/VL/9832366635)
 bandwidth 1500
 encapsulation dot1Q 1504 second-dot1q 146
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.179.228.205 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QDI_VIPSIP_VOZ_1500_V1
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet2/1/0.1504150
 description CEF  | 5800K | SLS/VL/9838771500 | (SLS/VL/9838771500)
 bandwidth 5400
 encapsulation dot1Q 1504 second-dot1q 150
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 201.45.205.245 255.255.255.252
 no ip proxy-arp
 service-policy input QDI_VIPSIP_VOZ_5800_V1
 service-policy output QDO_VIPSIP_VOZ_5800_V1
!
interface GigabitEthernet2/1/0.1504156
 description DISOLCLOUD  | 452K | SLS/VH/9833347900 | (SLS/VH/9833347900)
 bandwidth 452
 encapsulation dot1Q 1504 second-dot1q 156
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.179.126.25 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_452_V1
 service-policy output QPO_BBONE_452_V1
!
interface GigabitEthernet2/1/0.1504159
 description CAUE_VEICULOS  | 1500K | SLS/VL/9832147000 | (SLS/VL/9832147000)
 bandwidth 1500
 encapsulation dot1Q 1504 second-dot1q 159
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 201.45.221.73 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QDI_VIPSIP_VOZ_1500_V1
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet2/1/0.1504161
 description GEAP  | 1500K | SLS/VL/9821064340 | (SLS/VL/9821064340)
 bandwidth 1500
 encapsulation dot1Q 1504 second-dot1q 161
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.179.126.33 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QDI_VIPSIP_VOZ_1500_V1
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet2/1/0.1504166
 description LOJASRENNER  | 1500K | SLS/VL/9838783737 | (SLS/VL/9838783737)
 bandwidth 1500
 encapsulation dot1Q 1504 second-dot1q 166
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.179.126.89 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QDI_VIPSIP_VOZ_1500_V1
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet2/1/0.1504172
 description GDX_CORRETORA  | 400K | SLS/VL/9821075000 | (SLS/VL/9821075000)
 bandwidth 400
 encapsulation dot1Q 1504 second-dot1q 172
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.179.214.153 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy output QDO_VIPSIP_VOZ_400_V1
!
interface GigabitEthernet2/1/0.1504174
 description LOCALIA  | 1500K | SLS/VL/9832489410 | (SLS/VL/9832489410)
 bandwidth 1500
 encapsulation dot1Q 1504 second-dot1q 174
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.179.126.149 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QDI_VIPSIP_VOZ_1500_V1
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet2/1/0.1504175
 description BANCO BRADESCO  | 1500K | SLS/VL/9840091765 | (SLS/VL/9840091765)
 bandwidth 1500
 encapsulation dot1Q 1504 second-dot1q 175
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.179.126.161 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QDI_VIPSIP_VOZ_1500_V1
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet2/1/0.1504181
 description CENTRAL_UNIMED  | 2700K | SLS/VL/9833012800 | (SLS/VL/9833012800)
 bandwidth 2700
 encapsulation dot1Q 1504 second-dot1q 181
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.179.213.209 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QDI_VIPSIP_VOZ_2700_V1
 service-policy output QDO_VIPSIP_VOZ_2700_V1
!
interface GigabitEthernet2/1/0.1504254
 description FEDERACAO  | 1500K | SLS/VL/9821095400 | (SLS/VL/9821095400)
 bandwidth 1500
 encapsulation dot1Q 1504 second-dot1q 254
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.179.126.229 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QDI_VIPSIP_VOZ_1500_V1
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet2/1/0.1505128
 description MAXMIX  | 512K | SLS/IP/06056 | (SLS/IP/06056) | BGP_AS65000
 bandwidth 512
 encapsulation dot1Q 1505 second-dot1q 128
 ip vrf forwarding MAXMIX:6352
 ip address 200.179.228.25 255.255.255.252
 no ip proxy-arp
 service-policy input QDI_512K_25_0_60_0_0_4_10
 service-policy output QDO_512K_25_0_60_0_0_4_10
!
interface GigabitEthernet2/1/0.1505129
 description CONAB  | 12000K | SLS/IP/01213 | (SLS/IP/01213) | BGP_AS65495
 bandwidth 12000
 encapsulation dot1Q 1505 second-dot1q 129
 ip vrf forwarding CONAB:4162
 ip address 189.53.246.41 255.255.255.252
 no ip proxy-arp
 service-policy input QDI_12000K_13_38_21_7_13_1_6
 service-policy output QDO_12000K_13_38_21_7_13_1_6
!
interface GigabitEthernet2/1/0.1505130
 description REDE_CORREIOS  | 128K | SLS/IP/06088 | (SLS/IP/06088) | BGP_AS65001
 bandwidth 128
 encapsulation dot1Q 1505 second-dot1q 130
 ip vrf forwarding CORREIOS_2016:155714
 ip address 172.18.77.29 255.255.255.252
 no ip proxy-arp
 service-policy input QDI_Correios_128K_ARPA_IOS_D_V1
 service-policy output QDO_Correios_128K_ARPA_IOS_D_V1
!
interface GigabitEthernet2/1/0.1505139
 description BBRASIL_NAC  | 10M | SLS/IP/06149 | (SLS/IP/06149) | BGP_AS65321
 bandwidth 10000
 encapsulation dot1Q 1505 second-dot1q 139
 ip vrf forwarding BBRASIL_NAC:7399
 ip address 10.66.210.129 255.255.255.252
 no ip proxy-arp
 service-policy input QDI_10000K_BBrasil_NAC_IACC_V1
 service-policy output QDO_10000K_BBrasil_NAC_IACC_V1
!
interface GigabitEthernet2/1/0.1505140
 description NACSAUDE  | 256K | SLS/IP/02135 | (SLS/IP/02135) | BGP_AS64895
 bandwidth 256
 encapsulation dot1Q 1505 second-dot1q 140
 ip vrf forwarding NACSAUDE:4530
 ip address 200.252.158.81 255.255.255.252
 no ip proxy-arp
 shutdown
 service-policy input QDI_256K_40_0_4_0_0_7_48
 service-policy output QDO_256K_40_0_4_0_0_7_48
!
interface GigabitEthernet2/1/0.1505145
 description RV_TECNOLOGIA  | 1024K | SLS/IP/06173 | (SLS/IP/06173) | BGP_AS65000
 bandwidth 1024
 encapsulation dot1Q 1505 second-dot1q 145
 ip vrf forwarding RVTECNOLOGIA:6851
 ip address 200.241.245.129 255.255.255.252
 no ip proxy-arp
 service-policy input QPI_BBONE_N_1024_V1
 service-policy output QPO_BBONE_1024_V1
!
interface GigabitEthernet2/1/0.1505154
 description DALCAR  | 2048K | SLS/IP/04073 | (SLS/IP/04073) | BGP_AS65000
 bandwidth 2048
 encapsulation dot1Q 1505 second-dot1q 154
 ip vrf forwarding DALCAR:5317
 ip address 187.28.240.173 255.255.255.252
 no ip proxy-arp
 service-policy input QPI_BBONE_N_2048_V1
 service-policy output QPO_BBONE_2048_V1
!
interface GigabitEthernet2/1/0.1505160
 description GEAP  | 1024K | SLS/IP/05820 | (SLS/IP/05820) | BGP_AS65000
 bandwidth 1024
 encapsulation dot1Q 1505 second-dot1q 160
 ip vrf forwarding GEAP:6919
 ip address 187.29.255.21 255.255.255.252
 no ip proxy-arp
 service-policy input QDI_1024K_15_0_20_10_0_4_50
 service-policy output QDO_1024K_15_0_20_10_0_4_50
!
interface GigabitEthernet2/1/0.1505162
 description BANCO_CSFSA  | 2048K | SLS/IP/06219 | (SLS/IP/06219) | BGP_AS65000
 bandwidth 2048
 encapsulation dot1Q 1505 second-dot1q 162
 ip vrf forwarding BANCO_CSFSA:7512
 ip address 200.179.126.45 255.255.255.252
 no ip proxy-arp
 bfd interval 150 min_rx 150 multiplier 3
 service-policy input QDI_2048K_4_0_0_0_0_2_93
 service-policy output QDO_2048K_4_0_0_0_0_2_93
!
interface GigabitEthernet2/1/0.1505163
 description SAGA_BRASIL  | 4096K | SLS/IP/06217 | (SLS/IP/06217) | BGP_AS65000
 bandwidth 4096
 encapsulation dot1Q 1505 second-dot1q 163
 ip vrf forwarding SAGA_BRASIL:7340
 ip address 201.57.136.109 255.255.255.252
 no ip proxy-arp
 service-policy input QPI_BBONE_N_4096_V1
 service-policy output QPO_BBONE_4096_V1
!
interface GigabitEthernet2/1/0.1505167
 description LASA  | 2048K | SLS/IP/06233 | (SLS/IP/06233) | BGP_AS65316
 bandwidth 2048
 encapsulation dot1Q 1505 second-dot1q 167
 ip vrf forwarding LASA_NOVA:155000
 ip address 200.179.126.77 255.255.255.252
 no ip proxy-arp
 service-policy input QDI_2048K_13_38_23_0_0_2_23
 service-policy output QDO_2048K_13_38_23_0_0_2_23
!
interface GigabitEthernet2/1/0.1505177
 description INFOSUS  | 6000K | SLS/IP/06156 | (SLS/IP/06156)
 bandwidth 6000
 encapsulation dot1Q 1505 second-dot1q 177
 ip vrf forwarding INFOSUS:4968
 ip address 192.168.100.209 255.255.255.252
 no ip proxy-arp
 service-policy input QDI_6000K_16_15_10_25_0_1_30
 service-policy output QDO_6000K_16_15_10_25_0_1_30
!
interface GigabitEthernet2/1/0.1505179
 description CENTRAL_UNIMED  | 10M | SLS/IP/05823 | (SLS/IP/05823)
 bandwidth 10000
 encapsulation dot1Q 1505 second-dot1q 179
 ip vrf forwarding CENTRAL_UNIMED:6268
 ip address 200.179.213.193 255.255.255.252
 no ip proxy-arp
 service-policy input QPI_BBONE_N_10000_V1
 service-policy output QPO_BBONE_10000_V1
!
interface GigabitEthernet2/1/0.1505182
 description SESC  | 4096K | SLS/IP/05619 | (SLS/IP/05619) | BGP_AS65000
 bandwidth 4096
 encapsulation dot1Q 1505 second-dot1q 182
 ip vrf forwarding SESC:1916
 ip address 200.172.182.109 255.255.255.252
 no ip proxy-arp
 ip pim sparse-mode
 service-policy input QDI_4096K_3_0_0_0_0_1_46
 service-policy output QDO_4096K_3_0_0_0_0_1_46
!
interface GigabitEthernet2/1/0.1505300
 description IMIFARMA  | 512K | SLS/IP/05865 | (SLS/IP/05865) | BGP_AS65000
 bandwidth 512
 encapsulation dot1Q 1505 second-dot1q 300
 ip vrf forwarding IMIFARMA_EXTRANET:155458
 ip address 200.179.213.217 255.255.255.252
 no ip proxy-arp
 service-policy input QDI_512K_5_0_30_16_4_4_40
 service-policy output QDO_512K_5_0_30_16_4_4_40
!
interface GigabitEthernet2/1/0.1505301
 description MIN JUSTICA  | 6000K | SLS/IP/05558 | (SLS/IP/05558)
 bandwidth 6000
 encapsulation dot1Q 1505 second-dot1q 301
 ip vrf forwarding DPF_MPLS:155223
 ip address 200.241.95.21 255.255.255.252
 no ip proxy-arp
 service-policy input QDI_6000K_11_31_36_0_0_1_20
 service-policy output QDO_6000K_11_31_36_0_0_1_20
!
interface GigabitEthernet2/1/0.1505303
 description INFOSUS  | 30M | SLS/IP/03710 | (SLS/IP/03710)
 bandwidth 30000
 encapsulation dot1Q 1505 second-dot1q 303
 ip vrf forwarding INFOSUS:4968
 ip address 192.168.100.45 255.255.255.252
 no ip proxy-arp
 service-policy input QDI_30000K_16_15_10_25_0_1_30
 service-policy output QDO_30000K_16_15_10_25_0_1_30
!
interface GigabitEthernet2/1/0.1505305
 description POSTALSAUDE  | 2048K | SLS/IP/05925 | (SLS/IP/05925) | BGP_AS65000
 bandwidth 2048
 encapsulation dot1Q 1505 second-dot1q 305
 ip vrf forwarding POSTAL_SAUDE:7110
 ip address 172.25.98.1 255.255.255.252
 no ip proxy-arp
 service-policy input QDI_2048K_11_0_41_0_11_1_35
 service-policy output QDO_2048K_11_0_41_0_11_1_35
!
interface GigabitEthernet2/1/0.1505306
 description LOCALIZA  | 1024K | SLS/IP/00182 | (SLS/IP/00182) | BLK-SAIP-APEDIDO/20170929-1658/POR-T3PER
 bandwidth 1024
 encapsulation dot1Q 1505 second-dot1q 306
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 shutdown
 service-policy input QDI_1024K_7_0_48_19_12_4_9
 service-policy output QDO_1024K_7_0_48_19_12_4_9
!
interface GigabitEthernet2/1/0.1505307
 description BBRASIL_NAC  | 512K | SLS/IP/05453 | (SLS/IP/05453) | BGP_AS65321
 bandwidth 512
 encapsulation dot1Q 1505 second-dot1q 307
 ip vrf forwarding BBRASIL_NAC:7399
 ip address 10.66.141.129 255.255.255.252
 no ip proxy-arp
 service-policy input QDI_512K_BBrasil_NAC_IACC_V1
 service-policy output QDO_512K_BBrasil_NAC_IACC_V1
!
interface GigabitEthernet2/1/0.1505308
 description LASA  | 2048K | SLS/IP/05905 | (SLS/IP/05905)
 bandwidth 2048
 encapsulation dot1Q 1505 second-dot1q 308
 ip vrf forwarding LASA_NOVA:155000
 ip address 201.45.221.57 255.255.255.252
 no ip proxy-arp
 service-policy input QDI_2048K_13_38_23_0_0_2_23
 service-policy output QDO_2048K_13_38_23_0_0_2_23
!
interface GigabitEthernet2/1/0.1505309
 description CGU_NOVA  | 6000K | SLS/IP/05316 | (SLS/IP/05316)
 bandwidth 6000
 encapsulation dot1Q 1505 second-dot1q 309
 ip vrf forwarding CGU_NOVA:5325
 ip address 201.45.221.109 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 ip pim sparse-mode
 ip igmp join-group 224.1.1.1
 service-policy input QDI_6000K_12_23_16_8_34_2_4
 service-policy output QDO_6000K_12_23_16_8_34_2_4
!
interface GigabitEthernet2/1/0.1505311
 description AGU_MPLS  | 40M | SLS/IP/05998 | (SLS/IP/05998) | BGP_AS65669
 bandwidth 40000
 encapsulation dot1Q 1505 second-dot1q 311
 ip vrf forwarding AGU_MPLS:6691
 ip address 200.241.95.65 255.255.255.252
 no ip proxy-arp
 service-policy input QDI_40000K_10_0_60_0_0_1_26
 service-policy output QDO_40000K_10_0_60_0_0_1_26
!
interface GigabitEthernet2/1/0.1505313
 description FERTIMPORT  | 1024K | SLS/IP/06013 | (SLS/IP/06013) | BGP_AS65001
 bandwidth 1024
 encapsulation dot1Q 1505 second-dot1q 313
 ip vrf forwarding EBT_BBR:6286
 ip address 201.45.221.201 255.255.255.252
 no ip proxy-arp
 service-policy input QDI_1024K_20_20_20_0_10_1_25
 service-policy output QDO_1024K_20_20_20_0_10_1_25
!
interface GigabitEthernet2/1/0.1506201
 description FERRONORTE  | 10M | SLS/IP/05699 | (SLS/IP/05699)
 bandwidth 10000
 encapsulation dot1Q 1506 second-dot1q 201
 ip address 200.241.95.229 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_10000_V1
 service-policy output QPO_BBONE_10000_V1
!
interface GigabitEthernet2/1/0.1506202
 description SOLARIS  | 10M | SLS/IP/05789 | (SLS/IP/05789)
 bandwidth 10000
 encapsulation dot1Q 1506 second-dot1q 202
 ip address 200.179.213.81 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_10000_V1
 service-policy output QPO_BBONE_10000_V1
!
interface GigabitEthernet2/1/0.1507101
 description SOLARIS  | 1500K | SLS/VL/9832589800 | (SLS/VL/9832589800)
 bandwidth 1500
 encapsulation dot1Q 1507 second-dot1q 101
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.179.213.73 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QDI_VIPSIP_VOZ_1500_V1
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet2/1/0.1508301
 description NORTEL  | 2048K | SLS/IP/00236 | (SLS/IP/00236) | BGP_AS65056
 bandwidth 2048
 encapsulation dot1Q 1508 second-dot1q 301
 ip vrf forwarding NORTEL:2634
 ip address 200.209.190.241 255.255.255.252
 no ip proxy-arp
 service-policy input QDI_2048K_7_0_75_0_0_2_15
 service-policy output QDO_2048K_7_0_75_0_0_2_15
!
interface GigabitEthernet2/1/0.1509202
 description VEGA_ENGENHARIA  | 10M | SLS/IP/05763 | (SLS/IP/05763)
 bandwidth 10000
 encapsulation dot1Q 1509 second-dot1q 202
 ip address 200.241.95.253 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_10000_V1
 service-policy output QPO_BBONE_10000_V1
!
interface GigabitEthernet2/1/0.1509203
 description MOCELIN EMPRE_TURISTICOS  | 14000K | SLS/IP/05120 | (SLS/IP/05120)
 bandwidth 14000
 encapsulation dot1Q 1509 second-dot1q 203
 ip address 200.172.13.109 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_14000_V1
 service-policy output QPO_BBONE_14000_V1
!
interface GigabitEthernet2/1/0.1512102
 description IRACEMA  | 4096K | SLS/IP/06126 | (SLS/IP/06126)
 bandwidth 4096
 encapsulation dot1Q 1512 second-dot1q 102
 ip address 200.241.95.37 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_4096_V1
 service-policy output QPO_BBONE_4096_V1
!
interface GigabitEthernet2/1/0.1513101
 description EDUCATOR ENSINO  | 1500K | SLS/VL/9833115454 | (SLS/VL/9833115454)
 bandwidth 1500
 encapsulation dot1Q 1513 second-dot1q 101
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.241.95.221 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QDI_VIPSIP_VOZ_1500_V1
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet2/1/1
 no ip address
 shutdown
 negotiation auto
!
interface GigabitEthernet2/1/2
 no ip address
 shutdown
 negotiation auto
!
interface GigabitEthernet2/1/3
 description LINK ETH | 1000M | SLSUSDM/SLSUSIT/1G/007 | DM4650_SLSUS-IS04 GPC 2
 no ip address
 no ip proxy-arp
 load-interval 30
 no negotiation auto
!
interface GigabitEthernet2/1/3.19
 description GAMAMELO  | 1500K | SLS/VL/9820167676 | (SLS/VL/9820167676)
 bandwidth 1500
 encapsulation dot1Q 19
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 201.45.221.81 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QDI_VIPSIP_VOZ_1500_V1
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet2/1/3.46
 description CEF  | 1500K | SJE/VL/9832243695 | (SJE/VL/9832243695)
 bandwidth 1500
 encapsulation dot1Q 46
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.241.95.161 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QDI_VIPSIP_VOZ_1500_V1
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet2/1/3.47
 description CEF  | 1500K | RSI/VL/9833451715 | (RSI/VL/9833451715)
 bandwidth 1500
 encapsulation dot1Q 47
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 201.45.221.1 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QDI_VIPSIP_VOZ_1500_V1
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet2/1/3.50
 description BRADESCO  | 1500K | SLS/VL/9821062090 | (SLS/VL/9821062090)
 bandwidth 1500
 encapsulation dot1Q 50
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.179.126.101 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QDI_VIPSIP_VOZ_1500_V1
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet2/1/3.51
 description BRADESCO  | 1500K | CDO/VL/9931130017 | (CDO/VL/9931130017)
 bandwidth 1500
 encapsulation dot1Q 51
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.179.126.133 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QDI_VIPSIP_VOZ_1500_V1
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet2/1/3.56
 description BONO_TRANSPORTES  | 1500K | SJE/VL/9832460533 | (SJE/VL/9832460533)
 bandwidth 1500
 encapsulation dot1Q 56
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.241.95.117 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QDI_VIPSIP_VOZ_1500_V1
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet2/1/3.57
 description CEF  | 1500K | STY/VL/9835150000 | (STY/VL/9835150000)
 bandwidth 1500
 encapsulation dot1Q 57
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.179.228.197 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QDI_VIPSIP_VOZ_1500_V1
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet2/1/3.59
 description MAPFRE  | 1500K | SLS/VL/9838771970 | (SLS/VL/9838771970)
 bandwidth 1500
 encapsulation dot1Q 59
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.179.126.49 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QDI_VIPSIP_VOZ_1500_V1
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet2/1/3.60
 description BRADESCO  | 1500K | SLS/VL/9838789400 | (SLS/VL/9838789400)
 bandwidth 1500
 encapsulation dot1Q 60
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.179.126.69 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QDI_VIPSIP_VOZ_1500_V1
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet2/1/3.61
 description BRADESCO  | 1500K | SLS/VL/9840091280 | (SLS/VL/9840091280)
 bandwidth 1500
 encapsulation dot1Q 61
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.179.126.185 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QDI_VIPSIP_VOZ_1500_V1
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet2/1/3.65
 description RIO ANIL  | 1500K | SLS/VL/9821065544 | (SLS/VL/9821065544)
 bandwidth 1500
 encapsulation dot1Q 65
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.179.126.249 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QDI_VIPSIP_VOZ_1500_V1
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet2/1/3.104
 description IMIFARMA  | 512K | SLS/IP/05893 | (SLS/IP/05893) | BGP_AS65000
 bandwidth 512
 encapsulation dot1Q 104
 ip vrf forwarding IMIFARMA_EXTRANET:155458
 ip address 201.45.205.133 255.255.255.252
 no ip proxy-arp
 service-policy input QDI_512K_5_0_30_16_4_4_40
 service-policy output QDO_512K_5_0_30_16_4_4_40
!
interface GigabitEthernet2/1/4
 description LINK ETH | 1000M | SISKBDM/SLSUSIT/1G/001 | DM4650_SISKB-IS01 GPC 1
 bandwidth 1000000
 no ip address
 no ip proxy-arp
 load-interval 30
 no negotiation auto
!
interface GigabitEthernet2/1/4.2
 description DISTR. AUTOMOTORES BACABAL  | 400K | BBL/VL/9936216161 | (BBL/VL/9936216161)
 bandwidth 400
 encapsulation dot1Q 2
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.179.213.249 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy output QDO_VIPSIP_VOZ_400_V1
!
interface GigabitEthernet2/1/4.3
 description BCOAM  | 1024K | BBL/IP/00053 | (BBL/IP/00053)
 bandwidth 1024
 encapsulation dot1Q 3
 ip vrf forwarding BCOAM:4783
 ip address 201.45.221.53 255.255.255.252
 no ip proxy-arp
 service-policy input QDI_1024K_11_0_50_13_13_2_10
 service-policy output QDO_1024K_11_0_50_13_13_2_10
!
interface GigabitEthernet2/1/4.4
 description PROSEGUR  | 1024K | BBL/IP/00238 | (BBL/IP/00238)
 bandwidth 1024
 encapsulation dot1Q 4
 ip address 201.45.221.145 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_1024_V1
 service-policy output QPO_BBONE_1024_V1
!
interface GigabitEthernet2/1/4.5
 description LASA_NOVA  | 2048K | SIS/IP/00195 | (SIS/IP/00195) | BGP_AS65316
 bandwidth 2048
 encapsulation dot1Q 5
 ip vrf forwarding LASA_NOVA:155000
 ip address 187.28.122.13 255.255.255.252
 no ip proxy-arp
 service-policy input QDI_2048K_13_38_23_0_0_2_23
 service-policy output QDO_2048K_13_38_23_0_0_2_23
!
interface GigabitEthernet2/1/4.6
 description DPRF_NAC_SIS1  | 2048K | SIS/IP/00167 | (SIS/IP/00167) | BGP_AS65000
 bandwidth 2048
 encapsulation dot1Q 6
 ip vrf forwarding DPRF_NAC_REMOTO:4295
 ip address 10.18.250.13 255.255.255.252
 no ip proxy-arp
 service-policy input QDI_2048K_15_0_0_0_0_2_57
 service-policy output QDO_2048K_15_0_0_0_0_2_57
!
interface GigabitEthernet2/1/4.7
 description FERRONORTE  | 4096K | SIS/MULTI/45676 | (SIS/MULTI/45676)
 bandwidth 4096
 encapsulation dot1Q 7
 ip address 187.28.240.49 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_4096_V1
 service-policy output QPO_BBONE_4096_V1
!
interface GigabitEthernet2/1/4.8
 description BCOAM  | 1024K | SIS/IP/00046 | (SIS/IP/00046) | BGP_AS65330
 bandwidth 1024
 encapsulation dot1Q 8
 ip vrf forwarding BCOAM:4783
 ip address 200.172.12.185 255.255.255.252
 no ip proxy-arp
 service-policy input QDI_1024K_11_0_50_13_13_2_10
 service-policy output QDO_1024K_11_0_50_13_13_2_10
!
interface GigabitEthernet2/1/4.9
 description NACIONAL VEICULOS PECAS  | 4096K | SIS/MULTI/47146 | (SIS/MULTI/47146)
 bandwidth 4096
 encapsulation dot1Q 9
 ip address 200.172.10.141 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_4096_V1
 service-policy output QPO_BBONE_4096_V1
!
interface GigabitEthernet2/1/4.10
 description CEMAR  | 1024K | SIS/IP/00223 | (SIS/IP/00223) | BGP_AS64707
 bandwidth 1024
 encapsulation dot1Q 10
 ip vrf forwarding CEMAR:3468
 ip address 200.179.126.197 255.255.255.252
 no ip proxy-arp
 service-policy input QDI_1024K_18_0_0_0_0_2_79
 service-policy output QDO_1024K_18_0_0_0_0_2_79
!
interface GigabitEthernet2/1/4.11
 description P PEREIRA AMBROSIO | 4096K | BBL/MULTI/59903 | (BBL/MULTI/59903) | BLK-SAIP-APEDIDO/20171030-1217/POR-T3DORT
 bandwidth 4096
 encapsulation dot1Q 11
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 shutdown
 service-policy input QPI_BBONE_S_4096_V1
 service-policy output QPO_BBONE_4096_V1
!
interface GigabitEthernet2/1/4.12
 description CEF  | 1500K | SIS/VL/9836811200 | (SIS/VL/9836811200)
 bandwidth 1500
 encapsulation dot1Q 12
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 201.45.221.213 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QDI_VIPSIP_VOZ_1500_V1
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet2/1/4.13
 description CREFISA  | 512K | SIS/IP/00213 | (SIS/IP/00213) | BGP_AS65000
 bandwidth 512
 encapsulation dot1Q 13
 ip vrf forwarding CREFISA:5415
 ip address 200.172.12.173 255.255.255.252
 no ip proxy-arp
 service-policy input QDI_512K_50_0_10_0_0_4_35
 service-policy output QDO_512K_50_0_10_0_0_4_35
!
interface GigabitEthernet2/1/4.14
 description INFOSUS  | 2048K | SIS/IP/00174 | (SIS/IP/00174) | BGP_AS65000
 bandwidth 2048
 encapsulation dot1Q 14
 ip vrf forwarding INFOSUS:4968
 ip address 192.168.105.145 255.255.255.252
 no ip proxy-arp
 service-policy input QDI_2048K_16_15_11_25_0_2_30
 service-policy output QDO_2048K_16_15_11_25_0_2_30
!
interface GigabitEthernet2/1/4.15
 description ARMATEUS  | 4096K | SIS/MULTI/59945 | (SIS/MULTI/59945) | BGP_AS65533
 bandwidth 4096
 encapsulation dot1Q 15
 ip vrf forwarding ARMATEUS:3394
 ip address 189.43.197.201 255.255.255.252
 no ip proxy-arp
 service-policy input QDI_4096K_7_0_0_0_0_2_89
 service-policy output QDO_4096K_7_0_0_0_0_2_89
!
interface GigabitEthernet2/1/4.16
 description SERPRO  | 1024K | SIS/IP/00166 | (SIS/IP/00166) | BGP_AS65003
 bandwidth 1024
 encapsulation dot1Q 16
 ip vrf forwarding SERPRO_SLS_RFB_10:5909
 ip address 10.53.2.157 255.255.255.252
 no ip proxy-arp
 ip pim sparse-mode
 service-policy input QDI_SERPRO_1024K_V1
 service-policy output QDO_SERPRO_1024K_V1
!
interface GigabitEthernet2/1/4.18
 description BNB  | 1024K | ZED/IP/00129 | (ZED/IP/00129) | BGP_AS65000
 bandwidth 1024
 encapsulation dot1Q 18
 ip vrf forwarding BNB:5075
 ip address 189.23.73.61 255.255.255.252
 no ip proxy-arp
 service-policy input QDI_1024K_22_0_36_22_0_2_17
 service-policy output QDO_1024K_22_0_36_22_0_2_17
!
interface GigabitEthernet2/1/4.19
 description DISTRIBUIDORA AUTOMOTORES  | 4096K | SIS/MULTI/46130 | (SIS/MULTI/46130)
 bandwidth 4096
 encapsulation dot1Q 19
 ip address 200.172.11.205 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_4096_V1
 service-policy output QPO_BBONE_4096_V1
!
interface GigabitEthernet2/1/4.20
 description BNB  | 1024K | SIS/IP/00194 | (SIS/IP/00194) | BGP_AS65000
 bandwidth 1024
 encapsulation dot1Q 20
 ip vrf forwarding BNB:5075
 ip address 189.52.211.217 255.255.255.252
 no ip proxy-arp
 service-policy input QDI_1024K_22_0_36_22_0_2_17
 service-policy output QDO_1024K_22_0_36_22_0_2_17
!
interface GigabitEthernet2/1/4.21
 description ANTONIO_P_GASPAR  | 4096K | SIS/MULTI/54355 | (SIS/MULTI/54355)
 bandwidth 4096
 encapsulation dot1Q 21
 ip address 189.53.246.249 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_4096_V1
 service-policy output QPO_BBONE_4096_V1
!
interface GigabitEthernet2/1/4.22
 description DPRF  | 1024K | SIS/IP/00202 | (SIS/IP/00202) | BGP_AS65000
 bandwidth 1024
 encapsulation dot1Q 22
 ip vrf forwarding DPRF_NAC_REMOTO:4295
 ip address 10.18.250.17 255.255.255.252
 no ip proxy-arp
 service-policy input QDI_1024K_30_0_0_0_0_2_66
 service-policy output QDO_1024K_30_0_0_0_0_2_66
!
interface GigabitEthernet2/1/4.23
 description MARANHAO MOTOS  | 4096K | SIS/MULTI/56830 | (SIS/MULTI/56830)
 bandwidth 4096
 encapsulation dot1Q 23
 ip address 189.52.211.165 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_4096_V1
 service-policy output QPO_BBONE_4096_V1
!
interface GigabitEthernet2/1/4.24
 description MINISTERIO SAUDE  | 2048K | ZED/IP/00124 | (ZED/IP/00124) | BGP_AS65000
 bandwidth 2048
 encapsulation dot1Q 24
 ip vrf forwarding INFOSUS:4968
 ip address 192.168.105.149 255.255.255.252
 no ip proxy-arp
 service-policy input QDI_2048K_13_25_11_0_0_1_1
 service-policy output QDO_2048K_13_25_11_0_0_1_1
!
interface GigabitEthernet2/1/4.26
 description JEVA  | 6144K | SIS/MULTI/47588 | (SIS/MULTI/47588)
 bandwidth 6144
 encapsulation dot1Q 26
 ip address 189.52.211.241 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_6144_V1
 service-policy output QPO_BBONE_6144_V1
!
interface GigabitEthernet2/1/4.28
 description BCOAM  | 1024K | SIS/IP/00224 | (SIS/IP/00224) | BGP_AS65330
 bandwidth 1024
 encapsulation dot1Q 28
 ip vrf forwarding BCOAM:4783
 ip address 200.179.126.245 255.255.255.252
 no ip proxy-arp
 service-policy input QDI_1024K_6_0_36_27_19_2_8
 service-policy output QDO_1024K_6_0_36_27_19_2_8
!
interface GigabitEthernet2/1/4.50
 description DISTRIBUIDORA AUTOMOTORES  | 400K | SIS/VL/9836536000 | (SIS/VL/9836536000)
 bandwidth 400
 encapsulation dot1Q 50
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.241.95.169 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QDI_VIPSIP_VOZ_400_V1
 service-policy output QDO_VIPSIP_VOZ_400_V1
!
interface GigabitEthernet2/1/4.51
 description BRADESCO  | 1500K | SIS/VL/9832021020 | (SIS/VL/9832021020)
 bandwidth 1500
 encapsulation dot1Q 51
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.179.126.109 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QDI_VIPSIP_VOZ_1500_V1
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet2/1/4.52
 description BANCO BRADESCO SA  | 1500K | BBL/VL/9933010034 | (BBL/VL/9933010034)
 bandwidth 1500
 encapsulation dot1Q 52
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.179.126.117 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QDI_VIPSIP_VOZ_1500_V1
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet2/1/4.104
 description AVNET  | 100M | SIS/IP/00049 | (SIS/IP/00049)
 bandwidth 100000
 encapsulation dot1Q 104
 ip address 187.28.122.73 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 shutdown
 service-policy input QPI_BBONE_S_100000_V1
 service-policy output QPO_BBONE_100000_V1
!
interface TenGigabitEthernet3/0/0
 description Ligacao SW01.SLS | 10G | SLSUSIT/SLSUSIT/10G/001 | (porta 2/3 do sw01.sls)
 dampening
 mtu 9180
 ip address 200.244.63.82 255.255.255.224
 no ip redirects
 no ip unreachables
 no ip proxy-arp
 ip flow monitor IPV4_MONITOR_MAP sampler FNF_SAMPLER_MAP input
 ip pim sparse-mode
 ip ospf cost 10
 ip ospf hello-interval 1
 load-interval 30
 mpls ip
 mpls label protocol ldp
 mpls traffic-eng tunnels
 ip rsvp bandwidth 10000000 10000000 sub-pool 5000000
!
interface TenGigabitEthernet4/0/0
 description Ligacao SW02.SLS | 10G | SLSUSIT/SLSUSIT/10G/002 | (porta 2/3 do sw02.sls)
 dampening
 mtu 9180
 ip address 200.244.63.114 255.255.255.224
 no ip redirects
 no ip unreachables
 no ip proxy-arp
 ip flow monitor IPV4_MONITOR_MAP sampler FNF_SAMPLER_MAP input
 ip pim sparse-mode
 ip ospf cost 10
 ip ospf hello-interval 1
 load-interval 30
 mpls ip
 mpls label protocol ldp
 mpls traffic-eng tunnels
 ip rsvp bandwidth 10000000 10000000 sub-pool 5000000
!
interface GigabitEthernet5/0/0
 description LINK ETH | 1000M | SLSITHME/SLSUSIT/1G/001 | IPRAN CLARO: MASLS17-RMC01 GE 5/1/1
 no ip address
 no ip redirects
 no ip proxy-arp
 load-interval 30
 no negotiation auto
 ipv6 enable
!
interface GigabitEthernet5/0/0.4001
 description GERL3_EBT_CLARO | GER-L3
 bandwidth 10000
 encapsulation dot1Q 4001
 ip vrf forwarding GERL3_EBT_CLARO_SPOKE:155596
 ip address 2.0.0.85 255.255.255.252
 service-policy input Entrada_DCN_GERL3_EBT_CLARO
 service-policy output SAIDA_DCN_GERL3_EBT_CLARO
!
interface GigabitEthernet5/0/0.15012
 description MARANHAO TELECOM LTDA ME  | 1000M | SLS/IP/06280 | (SLS/IP/06280) | BGP_AS262503
 bandwidth 1000000
 encapsulation dot1Q 1501 second-dot1q 2
 ip address 200.179.230.5 255.255.255.252
 no ip proxy-arp
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 service-policy input QPI_BBONE_S_1000000_V1
 service-policy output QPO_BBONE_1000000_V1
!
interface GigabitEthernet5/0/1
 no ip address
 shutdown
 negotiation auto
!
interface GigabitEthernet5/0/2
 no ip address
 shutdown
 negotiation auto
!
interface GigabitEthernet5/0/3
 no ip address
 shutdown
 negotiation auto
!
interface GigabitEthernet5/0/4
 no ip address
 shutdown
 negotiation auto
!
interface GigabitEthernet0
 vrf forwarding Mgmt-intf
 no ip address
 shutdown
 negotiation auto
!
router ospf 21
 router-id 200.244.29.160
 log-adjacency-changes detail
 max-lsa 70000 85 warning-only
 nsf cisco
 timers throttle spf 50 50 2000
 timers throttle lsa 0 20 2000
 timers lsa arrival 20
 timers pacing flood 25
 timers pacing retransmission 30
 redistribute maximum-prefix 20000 85 warning-only
 passive-interface default
 no passive-interface TenGigabitEthernet3/0/0
 no passive-interface TenGigabitEthernet4/0/0
 no passive-interface Loopback0
 network 200.244.29.0 0.0.0.255 area 98
 network 200.244.63.64 0.0.0.31 area 98
 network 200.244.63.96 0.0.0.31 area 98
 maximum-paths 8
 mpls ldp sync
 mpls traffic-eng router-id Loopback0
 mpls traffic-eng area 98
 mpls traffic-eng multicast-intact
!
router bgp 4230
 bgp router-id 200.244.29.160
 bgp always-compare-med
 bgp log-neighbor-changes
 bgp graceful-restart restart-time 120
 bgp graceful-restart stalepath-time 360
 bgp graceful-restart
 bgp maxas-limit 100
 no bgp default ipv4-unicast
 neighbor IBGP_FULL peer-group
 neighbor IBGP_FULL remote-as 4230
 neighbor IBGP_FULL update-source Loopback0
 neighbor PARTIAL-ROUTING peer-group
 neighbor RR-IPV6 peer-group
 neighbor RR-IPV6 remote-as 4230
 neighbor RR-IPV6 update-source Loopback0
 neighbor FULL-ROUTING-IPV6 peer-group
 neighbor FULL-ROUTING-IPV6 disable-connected-check
 neighbor PARTIAL-ROUTING-IPV6 peer-group
 neighbor PARTIAL-ROUTING-IPV6 disable-connected-check
 neighbor NO-ROUTES_BGP-LIGHT-IPV6 peer-group
 neighbor NO-ROUTES_BGP-LIGHT-IPV6 disable-connected-check
 neighbor DEFAULT-ROUTE_BGP-LIGHT-IPV6 peer-group
 neighbor DEFAULT-ROUTE_BGP-LIGHT-IPV6 disable-connected-check
 neighbor PEAKFLOW peer-group
 neighbor PEAKFLOW remote-as 4230
 neighbor PEAKFLOW password 7 071F244D450F150A00000103567E
 neighbor PEAKFLOW update-source Loopback7
 neighbor 2804:A8:2:9A::4E remote-as 263571
 neighbor 2804:A8:2:9A::4E peer-group FULL-ROUTING-IPV6
 neighbor 2804:A8:2:9A::4E description SLS/IP/05191 | BGP FULL RSERV01.BHE
 neighbor 2804:A8:2:9A::7A remote-as 263936
 neighbor 2804:A8:2:9A::7A peer-group FULL-ROUTING-IPV6
 neighbor 2804:A8:2:9A::7A description BLA/IP/00200 | BGP FULL
 neighbor 2804:A8:2:9A::7A shutdown
 neighbor 2804:A8:2:9A::D6 remote-as 266353
 neighbor 2804:A8:2:9A::D6 peer-group FULL-ROUTING-IPV6
 neighbor 2804:A8:2:9A::D6 description SIS/IP/00179 | BGP FULL
 neighbor 2804:A8:2:9A::122 remote-as 263936
 neighbor 2804:A8:2:9A::122 peer-group FULL-ROUTING-IPV6
 neighbor 2804:A8:2:9A::122 description | BGP FULL
 neighbor 2804:A8:2:9A::122 shutdown
 neighbor 2804:A8:2:9A::126 remote-as 263936
 neighbor 2804:A8:2:9A::126 peer-group FULL-ROUTING-IPV6
 neighbor 2804:A8:2:9A::126 description BLA/IP/00026 | BGP FULL
 neighbor 2804:A8:2:9A::2EE remote-as 266161
 neighbor 2804:A8:2:9A::2EE peer-group FULL-ROUTING-IPV6
 neighbor 2804:A8:2:9A::2EE description SLS/IP/04771
 neighbor 177.91.52.1 remote-as 263430
 neighbor 177.91.52.1 description SLS/IP/05108
 neighbor 177.91.52.1 ebgp-multihop 5
 neighbor 187.29.255.130 remote-as 28246
 neighbor 187.29.255.130 peer-group PARTIAL-ROUTING
 neighbor 187.29.255.130 description SIS/IP/00216 | BGP FULL 
 neighbor 187.29.255.130 ebgp-multihop 5
 neighbor 189.23.73.102 remote-as 266353
 neighbor 189.23.73.102 peer-group PARTIAL-ROUTING
 neighbor 189.23.73.102 description SIS/IP/00179 | BGP FULL RSERV01.SDR
 neighbor 189.23.73.102 ebgp-multihop 5
 neighbor 200.172.12.190 remote-as 263528
 neighbor 200.172.12.190 peer-group PARTIAL-ROUTING
 neighbor 200.172.12.190 description SLS/IP/05507 | BGP FULL RSERV01.SDR
 neighbor 200.172.12.190 ebgp-multihop 5
 neighbor 200.172.13.162 remote-as 263571
 neighbor 200.172.13.162 peer-group PARTIAL-ROUTING
 neighbor 200.172.13.162 description SLS/IP/05191 | BGP FULL RSERV01.BHE
 neighbor 200.172.13.162 ebgp-multihop 5
 neighbor 200.179.213.218 remote-as 65000
 neighbor 200.179.213.218 description SLS/IP/05865
 neighbor 200.179.230.6 remote-as 262503
 neighbor 200.179.230.6 peer-group PARTIAL-ROUTING
 neighbor 200.179.230.6 description SLS/IP/06280 | BGP FULL RSERV01.SPO
 neighbor 200.179.230.6 ebgp-multihop 5
 neighbor 200.241.80.134 remote-as 263362
 neighbor 200.241.80.134 peer-group PARTIAL-ROUTING
 neighbor 200.241.80.134 description SLS/IP/05027 | BGP FULL (RSERV01.SDR)
 neighbor 200.241.80.134 ebgp-multihop 5
 neighbor 200.244.28.30 remote-as 4230
 neighbor 200.244.28.30 description VRR01.FLA
 neighbor 200.244.28.30 update-source Loopback0
 neighbor 200.244.28.32 remote-as 4230
 neighbor 200.244.28.32 description VRR01.SDR
 neighbor 200.244.28.32 update-source Loopback0
 neighbor 200.244.29.136 peer-group RR-IPV6
 neighbor 200.244.29.136 description RR01.RCE
 neighbor 200.244.29.137 peer-group RR-IPV6
 neighbor 200.244.29.137 description RR02.RCE
 neighbor 200.244.41.104 peer-group IBGP_FULL
 neighbor 200.244.41.104 description IBGP_DIST02.SLS
 neighbor 200.244.41.105 peer-group IBGP_FULL
 neighbor 200.244.41.105 description IBGP_DIST01.SLS
 neighbor 200.244.162.250 peer-group PEAKFLOW
 neighbor 200.244.162.250 description PKFCP02.RJO
 neighbor 201.45.138.42 remote-as 28246
 neighbor 201.45.138.42 peer-group PARTIAL-ROUTING
 neighbor 201.45.138.42 description SIS/IP/00028 | BGP FULL RSERV01.SDR
 neighbor 201.45.138.42 ebgp-multihop 2
 !
 address-family ipv4
  bgp nexthop route-map NEGA_ROTA_DEFAULT
  bgp nexthop trigger delay 1
  redistribute connected route-map CONNECTED
  redistribute static route-map STATIC
  neighbor IBGP_FULL send-community
  neighbor IBGP_FULL next-hop-self
  neighbor IBGP_FULL route-map RR_IPV4_IN in
  neighbor PARTIAL-ROUTING remove-private-as
  neighbor PARTIAL-ROUTING distribute-list 1 in
  neighbor PARTIAL-ROUTING route-map PARTIAL-ROUTING_OUT out
  neighbor 177.91.52.1 activate
  neighbor 177.91.52.1 default-originate
  neighbor 177.91.52.1 remove-private-as
  neighbor 177.91.52.1 soft-reconfiguration inbound
  neighbor 177.91.52.1 distribute-list 1 in
  neighbor 177.91.52.1 route-map OLC_SERVICOS_IN in
  neighbor 177.91.52.1 route-map PARTIAL-ROUTING_OUT out
  neighbor 177.91.52.1 maximum-prefix 200 85
  neighbor 187.29.255.130 activate
  neighbor 187.29.255.130 route-map LAURIA_IN in
  neighbor 187.29.255.130 maximum-prefix 200 85
  neighbor 189.23.73.102 activate
  neighbor 189.23.73.102 route-map REDE_BJNET_IN in
  neighbor 189.23.73.102 maximum-prefix 200 85
  neighbor 200.172.12.190 activate
  neighbor 200.172.12.190 soft-reconfiguration inbound
  neighbor 200.172.12.190 route-map VIACOM_IN in
  neighbor 200.172.12.190 maximum-prefix 200 85
  neighbor 200.172.13.162 activate
  neighbor 200.172.13.162 route-map R_M_M_S_DE_OLIVEIRA_IN in
  neighbor 200.172.13.162 maximum-prefix 200 85
  neighbor 200.179.230.6 activate
  neighbor 200.179.230.6 route-map TELECOMLTDAME_IN in
  neighbor 200.179.230.6 maximum-prefix 200 85
  neighbor 200.241.80.134 activate
  neighbor 200.241.80.134 route-map SPEEDNET_IN in
  neighbor 200.241.80.134 maximum-prefix 200 85
  neighbor 200.244.41.104 activate
  neighbor 200.244.41.105 activate
  neighbor 200.244.162.250 activate
  neighbor 201.45.138.42 activate
  neighbor 201.45.138.42 route-map SIVNET_BLD_IN in
  neighbor 201.45.138.42 maximum-prefix 5000 90
 exit-address-family
 !
 address-family vpnv4
  bgp dampening
  neighbor 200.244.28.30 activate
  neighbor 200.244.28.30 send-community both
  neighbor 200.244.28.30 next-hop-self
  neighbor 200.244.28.32 activate
  neighbor 200.244.28.32 send-community both
  neighbor 200.244.28.32 next-hop-self
 exit-address-family
 !
 address-family ipv4 mdt
  bgp dampening
  neighbor 200.244.28.30 activate
  neighbor 200.244.28.30 send-community both
  neighbor 200.244.28.30 next-hop-self
  neighbor 200.244.28.32 activate
  neighbor 200.244.28.32 send-community both
  neighbor 200.244.28.32 next-hop-self
 exit-address-family
 !
 address-family ipv6
  redistribute connected route-map CONNECTED_TO_BGP_IPV6
  redistribute static route-map STATIC_TO_BGP_IPV6
  neighbor RR-IPV6 send-community
  neighbor RR-IPV6 route-map RR_IPV6_IN in
  neighbor RR-IPV6 send-label
  neighbor FULL-ROUTING-IPV6 remove-private-as
  neighbor FULL-ROUTING-IPV6 route-map FULL-ROUTING_OUT_IPV6 out
  neighbor PARTIAL-ROUTING-IPV6 remove-private-as
  neighbor PARTIAL-ROUTING-IPV6 route-map PARTIAL-ROUTING_OUT_IPV6 out
  neighbor NO-ROUTES_BGP-LIGHT-IPV6 remove-private-as
  neighbor NO-ROUTES_BGP-LIGHT-IPV6 route-map NO-ROUTES out
  neighbor DEFAULT-ROUTE_BGP-LIGHT-IPV6 default-originate
  neighbor DEFAULT-ROUTE_BGP-LIGHT-IPV6 remove-private-as
  neighbor DEFAULT-ROUTE_BGP-LIGHT-IPV6 route-map NO-ROUTES out
  neighbor 2804:A8:2:9A::4E activate
  neighbor 2804:A8:2:9A::4E default-originate
  neighbor 2804:A8:2:9A::4E prefix-list PREFIXOS_IPV6_CLIENTES_IN in
  neighbor 2804:A8:2:9A::4E route-map CLIENTES_IPV6_RANGE_PROPRIO_COMMON_POLICY_IN in
  neighbor 2804:A8:2:9A::4E filter-list 118 in
  neighbor 2804:A8:2:9A::7A activate
  neighbor 2804:A8:2:9A::7A default-originate
  neighbor 2804:A8:2:9A::7A prefix-list PREFIXOS_IPV6_CLIENTES_IN in
  neighbor 2804:A8:2:9A::7A route-map CLIENTES_IPV6_RANGE_PROPRIO_COMMON_POLICY_IN in
  neighbor 2804:A8:2:9A::7A filter-list 122 in
  neighbor 2804:A8:2:9A::D6 activate
  neighbor 2804:A8:2:9A::D6 default-originate
  neighbor 2804:A8:2:9A::D6 prefix-list PREFIXOS_IPV6_CLIENTES_IN in
  neighbor 2804:A8:2:9A::D6 route-map CLIENTES_IPV6_RANGE_PROPRIO_COMMON_POLICY_IN in
  neighbor 2804:A8:2:9A::D6 filter-list 123 in
  neighbor 2804:A8:2:9A::122 activate
  neighbor 2804:A8:2:9A::122 default-originate
  neighbor 2804:A8:2:9A::122 prefix-list PREFIXOS_IPV6_CLIENTES_IN in
  neighbor 2804:A8:2:9A::122 route-map CLIENTES_IPV6_RANGE_PROPRIO_COMMON_POLICY_IN in
  neighbor 2804:A8:2:9A::122 filter-list 119 in
  neighbor 2804:A8:2:9A::126 activate
  neighbor 2804:A8:2:9A::126 default-originate
  neighbor 2804:A8:2:9A::126 prefix-list PREFIXOS_IPV6_CLIENTES_IN in
  neighbor 2804:A8:2:9A::126 route-map CLIENTES_IPV6_RANGE_PROPRIO_COMMON_POLICY_IN in
  neighbor 2804:A8:2:9A::126 filter-list 122 in
  neighbor 2804:A8:2:9A::2EE activate
  neighbor 2804:A8:2:9A::2EE default-originate
  neighbor 2804:A8:2:9A::2EE prefix-list PREFIXOS_IPV6_CLIENTES_IN in
  neighbor 2804:A8:2:9A::2EE route-map CLIENTES_IPV6_RANGE_PROPRIO_COMMON_POLICY_IN in
  neighbor 2804:A8:2:9A::2EE filter-list 104 in
  neighbor 200.244.29.136 activate
  neighbor 200.244.29.137 activate
 exit-address-family
 !
 address-family vpnv6
  neighbor 200.244.28.30 activate
  neighbor 200.244.28.30 send-community both
  neighbor 200.244.28.30 next-hop-self
  neighbor 200.244.28.32 activate
  neighbor 200.244.28.32 send-community both
  neighbor 200.244.28.32 next-hop-self
 exit-address-family
 !
 address-family ipv4 vrf AGU_MPLS:6691
  bgp dampening
  redistribute connected
  redistribute static
  neighbor 200.241.95.66 remote-as 65669
  neighbor 200.241.95.66 description SLS/IP/05998
  neighbor 200.241.95.66 activate
  neighbor 200.241.95.66 send-community both
  maximum-paths eibgp 3
 exit-address-family
 !
 address-family ipv4 vrf AMAGGI:2738
  bgp dampening
  redistribute connected
  redistribute static
 exit-address-family
 !
 address-family ipv4 vrf ARMATEUS:3394
  bgp dampening
  redistribute connected route-map SBC_CLIENTE
  redistribute static
  neighbor 189.43.120.126 remote-as 65533
  neighbor 189.43.120.126 description BLA/IP/00036
  neighbor 189.43.120.126 activate
  neighbor 189.43.120.126 send-community both
  neighbor 189.43.197.202 remote-as 65533
  neighbor 189.43.197.202 description SIS/MULTI/59945
  neighbor 189.43.197.202 activate
  neighbor 189.43.197.202 send-community both
 exit-address-family
 !
 address-family ipv4 vrf BANCO_CSFSA:7512
  bgp dampening
  redistribute connected
  redistribute static
  neighbor 200.179.126.46 remote-as 65000
  neighbor 200.179.126.46 description SLS/IP/06219
  neighbor 200.179.126.46 fall-over bfd
  neighbor 200.179.126.46 activate
  neighbor 200.179.126.46 send-community both
 exit-address-family
 !
 address-family ipv4 vrf BBRASIL_NAC:7399
  bgp dampening
  redistribute connected
  redistribute static
  neighbor 10.66.136.190 remote-as 65321
  neighbor 10.66.136.190 description BLA/IP/00179
  neighbor 10.66.136.190 timers 10 30
  neighbor 10.66.136.190 activate
  neighbor 10.66.136.190 send-community both
  neighbor 10.66.136.190 route-map BB-LT2-NAC-REMOTOS-IN in
  neighbor 10.66.136.190 route-map BB-LT2-NAC-REMOTOS-OUT out
  neighbor 10.66.141.130 remote-as 65321
  neighbor 10.66.141.130 description SLS/IP/05453
  neighbor 10.66.141.130 timers 10 30
  neighbor 10.66.141.130 activate
  neighbor 10.66.141.130 send-community both
  neighbor 10.66.141.130 route-map BB-LT2-NAC-REMOTOS-IN in
  neighbor 10.66.141.130 route-map BB-LT2-NAC-REMOTOS-OUT out
  neighbor 10.66.177.10 remote-as 65321
  neighbor 10.66.177.10 description SLS/IP/04599
  neighbor 10.66.177.10 timers 10 30
  neighbor 10.66.177.10 activate
  neighbor 10.66.177.10 send-community both
  neighbor 10.66.177.10 route-map BB-LT2-NAC-REMOTOS-IN in
  neighbor 10.66.177.10 route-map BB-LT2-NAC-REMOTOS-OUT out
  neighbor 10.66.205.38 remote-as 65321
  neighbor 10.66.205.38 description BLA/IP/00297
  neighbor 10.66.205.38 timers 10 30
  neighbor 10.66.205.38 activate
  neighbor 10.66.205.38 send-community both
  neighbor 10.66.205.38 route-map BB-LT2-NAC-REMOTOS-IN in
  neighbor 10.66.205.38 route-map BB-LT2-NAC-REMOTOS-OUT out
  neighbor 10.66.205.154 remote-as 65321
  neighbor 10.66.205.154 description BLA/IP/00277
  neighbor 10.66.205.154 timers 10 30
  neighbor 10.66.205.154 activate
  neighbor 10.66.205.154 send-community both
  neighbor 10.66.205.154 route-map BB-LT2-NAC-REMOTOS-IN in
  neighbor 10.66.205.154 route-map BB-LT2-NAC-REMOTOS-OUT out
  neighbor 10.66.210.130 remote-as 65321
  neighbor 10.66.210.130 description SLS/IP/06149
  neighbor 10.66.210.130 timers 10 30
  neighbor 10.66.210.130 activate
  neighbor 10.66.210.130 send-community both
  neighbor 10.66.210.130 route-map BB-LT2-NAC-REMOTOS-IN in
  neighbor 10.66.210.130 route-map BB-LT2-NAC-REMOTOS-OUT out
  neighbor 10.66.237.82 remote-as 65321
  neighbor 10.66.237.82 description SLS/IP/04599
  neighbor 10.66.237.82 timers 10 30
  neighbor 10.66.237.82 activate
  neighbor 10.66.237.82 send-community both
  neighbor 10.66.237.82 route-map BB-LT2-NAC-REMOTOS-IN in
  neighbor 10.66.237.82 route-map BB-LT2-NAC-REMOTOS-OUT out
  maximum-paths eibgp 2
 exit-address-family
 !
 address-family ipv4 vrf BCOAM:4783
  bgp dampening
  redistribute connected
  redistribute static
  neighbor 200.172.12.186 remote-as 65330
  neighbor 200.172.12.186 description SIS/IP/00046
  neighbor 200.172.12.186 activate
  neighbor 200.172.12.186 send-community both
  neighbor 200.179.126.246 remote-as 65330
  neighbor 200.179.126.246 description SIS/IP/00224
  neighbor 200.179.126.246 activate
  neighbor 200.179.126.246 send-community both
  neighbor 200.179.211.238 remote-as 65330
  neighbor 200.179.211.238 description BLA/IP/00063
  neighbor 200.179.211.238 activate
  neighbor 200.179.211.238 send-community both
  neighbor 200.208.29.194 remote-as 65330
  neighbor 200.208.29.194 description CRN/IP/00006
  neighbor 200.208.29.194 activate
  neighbor 200.208.29.194 send-community both
  neighbor 200.252.158.90 remote-as 65330
  neighbor 200.252.158.90 description SLS/IP/05960
  neighbor 200.252.158.90 activate
  neighbor 200.252.158.90 send-community both
  neighbor 201.45.221.54 remote-as 65330
  neighbor 201.45.221.54 description BBL/IP/00053
  neighbor 201.45.221.54 activate
  neighbor 201.45.221.54 send-community both
  maximum-paths eibgp 2
 exit-address-family
 !
 address-family ipv4 vrf BNB:5075
  bgp dampening
  redistribute connected
  redistribute static
  neighbor 189.23.73.62 remote-as 65000
  neighbor 189.23.73.62 description ZED/IP/00129
  neighbor 189.23.73.62 activate
  neighbor 189.23.73.62 send-community both
  neighbor 189.52.211.218 remote-as 65000
  neighbor 189.52.211.218 description SIS/IP/00194
  neighbor 189.52.211.218 activate
  neighbor 189.52.211.218 send-community both
  neighbor 189.53.11.186 remote-as 65000
  neighbor 189.53.11.186 description BLA/IP/00260
  neighbor 189.53.11.186 activate
  neighbor 189.53.11.186 send-community both
  maximum-paths eibgp 2
 exit-address-family
 !
 address-family ipv4 vrf BOTICARIO2:3247
  bgp dampening
  redistribute connected route-map SBC_CLIENTE
  redistribute static
  neighbor 200.179.228.150 remote-as 65100
  neighbor 200.179.228.150 description SLS/IP/06133
  neighbor 200.179.228.150 activate
  neighbor 200.179.228.150 send-community both
  maximum-paths eibgp 2
 exit-address-family
 !
 address-family ipv4 vrf BT_CBB:1851
  bgp dampening
  redistribute connected
  redistribute static
  neighbor 200.179.212.114 remote-as 64638
  neighbor 200.179.212.114 description BLA/IP/00286
  neighbor 200.179.212.114 activate
  neighbor 200.179.212.114 send-community both
  maximum-paths eibgp 2
 exit-address-family
 !
 address-family ipv4 vrf CEMAR:3468
  bgp dampening
  redistribute connected
  redistribute static
  neighbor 189.43.197.226 remote-as 64707
  neighbor 189.43.197.226 description BLA/MULTI/60956
  neighbor 189.43.197.226 activate
  neighbor 189.43.197.226 send-community both
  neighbor 200.179.126.198 remote-as 64707
  neighbor 200.179.126.198 description SIS/IP/00223
  neighbor 200.179.126.198 activate
  neighbor 200.179.126.198 send-community both
 exit-address-family
 !
 address-family ipv4 vrf CENTRAL_UNIMED:6268
  bgp dampening
  redistribute connected
  redistribute static
  neighbor 200.179.213.194 remote-as 65278
  neighbor 200.179.213.194 description SLS/IP/05823
  neighbor 200.179.213.194 activate
  neighbor 200.179.213.194 send-community both
 exit-address-family
 !
 address-family ipv4 vrf CGU_NOVA:5325
  bgp dampening
  redistribute connected
  redistribute static
  maximum-paths eibgp 2
 exit-address-family
 !
 address-family ipv4 vrf CIMAR:6974
  bgp dampening
  redistribute connected
  redistribute static
  neighbor 200.179.213.146 remote-as 65000
  neighbor 200.179.213.146 description SLS/IP/05839
  neighbor 200.179.213.146 activate
  neighbor 200.179.213.146 send-community both
 exit-address-family
 !
 address-family ipv4 vrf CONAB:4162
  bgp dampening
  redistribute connected
  redistribute static
  neighbor 189.53.246.42 remote-as 65495
  neighbor 189.53.246.42 description SLS/IP/01213
  neighbor 189.53.246.42 activate
  neighbor 189.53.246.42 send-community both
 exit-address-family
 !
 address-family ipv4 vrf CORREIOS_2016:155714
  bgp dampening
  redistribute connected route-map RM_ECT_CONNECTED
  redistribute static
  neighbor 172.18.66.66 remote-as 65001
  neighbor 172.18.66.66 description BLA/IP/00309
  neighbor 172.18.66.66 password 7 106C2E293A32313F
  neighbor 172.18.66.66 activate
  neighbor 172.18.66.66 send-community both
  neighbor 172.18.66.70 remote-as 65001
  neighbor 172.18.66.70 description BLA/IP/00308
  neighbor 172.18.66.70 password 7 06242811736B2A2D
  neighbor 172.18.66.70 activate
  neighbor 172.18.66.70 send-community both
  neighbor 172.18.73.10 remote-as 65001
  neighbor 172.18.73.10 description SLS/IP/06099
  neighbor 172.18.73.10 password 7 0224236B34232C15
  neighbor 172.18.73.10 activate
  neighbor 172.18.73.10 send-community both
  neighbor 172.18.75.54 remote-as 65001
  neighbor 172.18.75.54 description SLS/IP/06035
  neighbor 172.18.75.54 password 7 096E693926203426
  neighbor 172.18.75.54 activate
  neighbor 172.18.75.54 send-community both
  neighbor 172.18.75.114 remote-as 65001
  neighbor 172.18.75.114 description SLS/IP/06087
  neighbor 172.18.75.114 password 7 072D067C712C3A31
  neighbor 172.18.75.114 activate
  neighbor 172.18.75.114 send-community both
  neighbor 172.18.77.30 remote-as 65001
  neighbor 172.18.77.30 description SLS/IP/06088
  neighbor 172.18.77.30 password 7 08036B7E363C2623
  neighbor 172.18.77.30 activate
  neighbor 172.18.77.30 send-community both
  neighbor 172.18.77.82 remote-as 65001
  neighbor 172.18.77.82 description SLS/IP/06027
  neighbor 172.18.77.82 password 7 0529213F1E696D3D
  neighbor 172.18.77.82 activate
  neighbor 172.18.77.82 send-community both
  neighbor 172.18.88.58 remote-as 65001
  neighbor 172.18.88.58 description SLS/IP/06041
  neighbor 172.18.88.58 password 7 08036B7E363C2623
  neighbor 172.18.88.58 activate
  neighbor 172.18.88.58 send-community both
  neighbor 172.18.91.210 remote-as 65001
  neighbor 172.18.91.210 description SLS/IP/06050
  neighbor 172.18.91.210 password 7 04792C3630046F7A
  neighbor 172.18.91.210 activate
  neighbor 172.18.91.210 send-community both
  maximum-paths eibgp 2
 exit-address-family
 !
 address-family ipv4 vrf CPAD:155471
  bgp dampening
  redistribute connected
  redistribute static
  neighbor 201.45.205.186 remote-as 65372
  neighbor 201.45.205.186 description SLS/IP/05902
  neighbor 201.45.205.186 activate
  neighbor 201.45.205.186 send-community both
  maximum-paths eibgp 2
 exit-address-family
 !
 address-family ipv4 vrf CREDISHOP:1661
  bgp dampening
  redistribute connected
  redistribute static
  neighbor 200.167.34.110 remote-as 64518
  neighbor 200.167.34.110 description BLA/IP/00174
  neighbor 200.167.34.110 activate
  neighbor 200.167.34.110 send-community both
 exit-address-family
 !
 address-family ipv4 vrf CREFISA:5415
  bgp dampening
  redistribute connected
  redistribute static
  neighbor 200.172.12.174 remote-as 65000
  neighbor 200.172.12.174 description SIS/IP/00213
  neighbor 200.172.12.174 activate
  neighbor 200.172.12.174 send-community both
  neighbor 200.172.12.218 remote-as 65000
  neighbor 200.172.12.218 description BLA/IP/00300
  neighbor 200.172.12.218 activate
  neighbor 200.172.12.218 send-community both
  maximum-paths eibgp 3
 exit-address-family
 !
 address-family ipv4 vrf DALCAR:5317
  bgp dampening
  redistribute connected
  redistribute static
  neighbor 187.28.240.174 remote-as 65000
  neighbor 187.28.240.174 description SLS/IP/04073
  neighbor 187.28.240.174 activate
  neighbor 187.28.240.174 send-community both
 exit-address-family
 !
 address-family ipv4 vrf DNPM:3963
  bgp dampening
  redistribute connected
  redistribute static
  neighbor 189.53.11.74 remote-as 65448
  neighbor 189.53.11.74 description SLS/IP/00820
  neighbor 189.53.11.74 activate
  neighbor 189.53.11.74 send-community both
  neighbor 189.53.11.74 as-override
  maximum-paths eibgp 2
 exit-address-family
 !
 address-family ipv4 vrf DPF_MPLS:155223
  bgp dampening
  redistribute connected
  redistribute static
  neighbor 200.241.95.22 remote-as 65100
  neighbor 200.241.95.22 description SLS/IP/05558
  neighbor 200.241.95.22 activate
  neighbor 200.241.95.22 send-community both
  maximum-paths eibgp 2
 exit-address-family
 !
 address-family ipv4 vrf DPRF_NAC_REMOTO:4295
  bgp dampening
  redistribute connected
  redistribute static
  neighbor 10.18.250.2 remote-as 65000
  neighbor 10.18.250.2 description SLS/IP/05075
  neighbor 10.18.250.2 activate
  neighbor 10.18.250.2 send-community both
  neighbor 10.18.250.14 remote-as 65000
  neighbor 10.18.250.14 description SIS/IP/00167
  neighbor 10.18.250.14 activate
  neighbor 10.18.250.14 send-community both
  neighbor 10.18.250.14 soft-reconfiguration inbound
  neighbor 10.18.250.18 remote-as 65000
  neighbor 10.18.250.18 description SIS/IP/00202
  neighbor 10.18.250.18 activate
  neighbor 10.18.250.18 send-community both
  neighbor 10.18.250.18 as-override
  neighbor 10.18.250.18 soft-reconfiguration inbound
  neighbor 10.18.250.30 remote-as 65000
  neighbor 10.18.250.30 description BLA/IP/00194
  neighbor 10.18.250.30 activate
  neighbor 10.18.250.30 send-community both
 exit-address-family
 !
 address-family ipv4 vrf EBC_MIDIA:6915
  bgp dampening
  redistribute connected
  redistribute static
  neighbor 200.179.213.98 remote-as 65000
  neighbor 200.179.213.98 description SLS/IP/05786
  neighbor 200.179.213.98 activate
  neighbor 200.179.213.98 send-community both
  maximum-paths eibgp 2
 exit-address-family
 !
 address-family ipv4 vrf EBC_MPLS1:155268
  bgp dampening
  redistribute connected
  redistribute static
  neighbor 189.53.11.54 remote-as 65000
  neighbor 189.53.11.54 description SLS/IP/05669
  neighbor 189.53.11.54 activate
  neighbor 189.53.11.54 send-community both
  maximum-paths eibgp 2
 exit-address-family
 !
 address-family ipv4 vrf EBT_BBR:6286
  bgp dampening
  redistribute connected
  redistribute static
  neighbor 201.45.221.202 remote-as 65001
  neighbor 201.45.221.202 description SLS/IP/06013
  neighbor 201.45.221.202 activate
  neighbor 201.45.221.202 send-community both
  maximum-paths eibgp 2
 exit-address-family
 !
 address-family ipv4 vrf ELEVADORESATLAS:7186
  bgp dampening
  redistribute connected
  redistribute static
 exit-address-family
 !
 address-family ipv4 vrf ENEVA:6831
  bgp dampening
  redistribute connected
  redistribute static
  neighbor 200.172.11.210 remote-as 65000
  neighbor 200.172.11.210 description SIL/IP/00102
  neighbor 200.172.11.210 activate
  neighbor 200.172.11.210 send-community both
  neighbor 200.172.13.174 remote-as 65000
  neighbor 200.172.13.174 description SLS/IP/05180
  neighbor 200.172.13.174 activate
  neighbor 200.172.13.174 send-community both
  neighbor 201.45.221.62 remote-as 64923
  neighbor 201.45.221.62 description SIL/IP/00110
  neighbor 201.45.221.62 activate
  neighbor 201.45.221.62 send-community both
  maximum-paths eibgp 2
 exit-address-family
 !
 address-family ipv4 vrf FOZDOBR:5275
  bgp dampening
  redistribute connected
  redistribute static
  neighbor 201.45.205.18 remote-as 65000
  neighbor 201.45.205.18 description SLS/IP/05889
  neighbor 201.45.205.18 activate
  neighbor 201.45.205.18 send-community both
 exit-address-family
 !
 address-family ipv4 vrf GEAP:6919
  bgp dampening
  redistribute connected
  redistribute static
  neighbor 187.29.255.22 remote-as 65000
  neighbor 187.29.255.22 description SLS/IP/05820
  neighbor 187.29.255.22 activate
  neighbor 187.29.255.22 send-community both
 exit-address-family
 !
 address-family ipv4 vrf GERDAU_INT:151563
  bgp dampening
  redistribute connected route-map LATAM_TELMEX_286
  redistribute static route-map LATAM_TELMEX_286
  neighbor 10.241.51.2 remote-as 65214
  neighbor 10.241.51.2 description SLS/IP/01984
  neighbor 10.241.51.2 activate
  neighbor 10.241.51.2 send-community both
  neighbor 10.241.51.2 route-map LATAM_TELMEX_286 in
  maximum-paths eibgp 2
 exit-address-family
 !
 address-family ipv4 vrf GERL3_EBT_CLARO_SPOKE:155596
  bgp dampening
  redistribute connected
  redistribute static
  neighbor 2.0.0.86 remote-as 65098
  neighbor 2.0.0.86 description GERL3_EBT_CLARO
  neighbor 2.0.0.86 activate
  neighbor 2.0.0.86 send-community both
 exit-address-family
 !
 address-family ipv4 vrf IMIFARMA_EXTRANET:155458
  bgp dampening
  redistribute connected
  redistribute static
  neighbor 200.172.12.90 remote-as 65000
  neighbor 200.172.12.90 description BLA/IP/00302
  neighbor 200.172.12.90 activate
  neighbor 200.172.12.90 send-community both
  neighbor 200.179.213.218 remote-as 65000
  neighbor 200.179.213.218 description SLS/IP/05865
  neighbor 200.179.213.218 activate
  neighbor 200.179.213.218 send-community both
  neighbor 201.45.205.134 remote-as 65000
  neighbor 201.45.205.134 description SLS/IP/05893
  neighbor 201.45.205.134 activate
  neighbor 201.45.205.134 send-community both
 exit-address-family
 !
 address-family ipv4 vrf INFOSUS:4968
  bgp dampening
  redistribute connected
  redistribute static
  neighbor 192.168.100.46 remote-as 65000
  neighbor 192.168.100.46 description SLS/IP/03710
  neighbor 192.168.100.46 activate
  neighbor 192.168.100.46 send-community both
  neighbor 192.168.100.210 remote-as 65000
  neighbor 192.168.100.210 description SLS/IP/06156
  neighbor 192.168.100.210 activate
  neighbor 192.168.100.210 send-community both
  neighbor 192.168.105.146 remote-as 65000
  neighbor 192.168.105.146 description SIS/IP/00174
  neighbor 192.168.105.146 activate
  neighbor 192.168.105.146 send-community both
  neighbor 192.168.105.150 remote-as 65000
  neighbor 192.168.105.150 description ZED/IP/00124
  neighbor 192.168.105.150 activate
  neighbor 192.168.105.150 send-community both
  maximum-paths eibgp 2
 exit-address-family
 !
 address-family ipv4 vrf ITAUNIBANCO:6388
  bgp dampening
  redistribute connected route-map SBC_CLIENTE
  redistribute static
  neighbor 200.179.212.154 remote-as 65001
  neighbor 200.179.212.154 description BLA/IP/00288
  neighbor 200.179.212.154 activate
  neighbor 200.179.212.154 send-community both
  maximum-paths eibgp 2
 exit-address-family
 !
 address-family ipv4 vrf L2L_INTERURBANO:6489
  neighbor 10.19.205.165 remote-as 64598
  neighbor 10.19.205.165 fall-over bfd
  neighbor 10.19.205.165 activate
  neighbor 10.19.205.165 send-label
  neighbor 10.19.205.217 remote-as 64598
  neighbor 10.19.205.217 fall-over bfd
  neighbor 10.19.205.217 activate
  neighbor 10.19.205.217 send-label
  neighbor 10.19.205.221 remote-as 64598
  neighbor 10.19.205.221 fall-over bfd
  neighbor 10.19.205.221 activate
  neighbor 10.19.205.221 send-label
  maximum-paths 3
 exit-address-family
 !
 address-family ipv4 vrf LASA_NOVA:155000
  bgp dampening
  redistribute connected route-map SBC_CLIENTE
  redistribute static
  neighbor 187.28.122.14 remote-as 65316
  neighbor 187.28.122.14 description SIS/IP/00195
  neighbor 187.28.122.14 activate
  neighbor 187.28.122.14 send-community both
  neighbor 200.172.10.254 remote-as 65316
  neighbor 200.172.10.254 description BLA/IP/00296
  neighbor 200.172.10.254 activate
  neighbor 200.172.10.254 send-community both
  neighbor 200.179.126.78 remote-as 65316
  neighbor 200.179.126.78 description SLS/IP/06233
  neighbor 200.179.126.78 activate
  neighbor 200.179.126.78 send-community both
  neighbor 201.45.205.118 remote-as 65316
  neighbor 201.45.205.118 description SJE/IP/00167
  neighbor 201.45.205.118 activate
  neighbor 201.45.205.118 send-community both
  neighbor 201.45.221.10 remote-as 65316
  neighbor 201.45.221.10 description SLS/IP/05912
  neighbor 201.45.221.10 activate
  neighbor 201.45.221.10 send-community both
  neighbor 201.45.221.58 remote-as 65316
  neighbor 201.45.221.58 description SLS/IP/05905
  neighbor 201.45.221.58 activate
  neighbor 201.45.221.58 send-community both
  maximum-paths eibgp 4
 exit-address-family
 !
 address-family ipv4 vrf LOCALIZA:1291
  bgp dampening
  redistribute connected
  redistribute static
  maximum-paths eibgp 4
 exit-address-family
 !
 address-family ipv4 vrf LOJASRIACHUELO:4120
  bgp dampening
  redistribute connected
  redistribute static
  neighbor 201.45.205.58 remote-as 65519
  neighbor 201.45.205.58 description SJE/IP/00157
  neighbor 201.45.205.58 activate
  neighbor 201.45.205.58 send-community both
  maximum-paths eibgp 2
 exit-address-family
 !
 address-family ipv4 vrf MAKRO:7547
  bgp dampening
  redistribute connected
  redistribute static
  neighbor 200.179.228.174 remote-as 65001
  neighbor 200.179.228.174 description SLS/IP/06160
  neighbor 200.179.228.174 activate
  neighbor 200.179.228.174 send-community both
  maximum-paths eibgp 2
 exit-address-family
 !
 address-family ipv4 vrf MAXMIX:6352
  bgp dampening
  redistribute connected route-map SBC_CLIENTE
  redistribute static
  neighbor 200.179.228.26 remote-as 65000
  neighbor 200.179.228.26 description SLS/IP/06056
  neighbor 200.179.228.26 activate
  neighbor 200.179.228.26 send-community both
 exit-address-family
 !
 address-family ipv4 vrf MPF_NOVA:6114
  bgp dampening
  redistribute connected
  redistribute static
  neighbor 192.168.34.38 remote-as 65001
  neighbor 192.168.34.38 description SLS/IP/05000
  neighbor 192.168.34.38 activate
  neighbor 192.168.34.38 send-community both
  neighbor 192.168.35.150 remote-as 65001
  neighbor 192.168.35.150 description BLA/IP/00303
  neighbor 192.168.35.150 activate
  neighbor 192.168.35.150 send-community both
  maximum-paths eibgp 3
 exit-address-family
 !
 address-family ipv4 vrf NACIONALGAS:3635
  bgp dampening
  redistribute connected
  redistribute static
  neighbor 189.23.28.146 remote-as 65131
  neighbor 189.23.28.146 description SLS/IP/00605
  neighbor 189.23.28.146 activate
  neighbor 189.23.28.146 send-community both
  maximum-paths eibgp 2
 exit-address-family
 !
 address-family ipv4 vrf NACSAUDE:4530
  bgp dampening
  redistribute connected route-map SBC_CLIENTE
  redistribute static
  neighbor 200.252.158.82 remote-as 64895
  neighbor 200.252.158.82 description SLS/IP/02135
  neighbor 200.252.158.82 activate
  neighbor 200.252.158.82 send-community both
 exit-address-family
 !
 address-family ipv4 vrf NORTEL:2634
  bgp dampening
  redistribute connected
  redistribute static
  neighbor 200.209.190.242 remote-as 65056
  neighbor 200.209.190.242 description SLS/IP/00236
  neighbor 200.209.190.242 activate
  neighbor 200.209.190.242 send-community both
  maximum-paths eibgp 2
 exit-address-family
 !
 address-family ipv4 vrf POSTAL_SAUDE:7110
  bgp dampening
  redistribute connected
  redistribute static
  neighbor 172.25.98.2 remote-as 65000
  neighbor 172.25.98.2 description SLS/IP/05925
  neighbor 172.25.98.2 activate
  neighbor 172.25.98.2 send-community both
 exit-address-family
 !
 address-family ipv4 vrf RABO:7410
  bgp dampening
  redistribute connected
  redistribute static
  neighbor 201.30.37.162 remote-as 65000
  neighbor 201.30.37.162 description BLA/MULTI/60549
  neighbor 201.30.37.162 activate
  neighbor 201.30.37.162 send-community both
 exit-address-family
 !
 address-family ipv4 vrf REALIP_CLIENTE:5581
  bgp dampening
  redistribute connected route-map REALIP_CLIENTE
  redistribute static route-map REALIP_CLIENTE
 exit-address-family
 !
 address-family ipv4 vrf REDEVIP_BLD_MLPPP:3799
  bgp dampening
  redistribute connected route-map SBC_CLIENTE
 exit-address-family
 !
 address-family ipv4 vrf RVTECNOLOGIA:6851
  bgp dampening
  redistribute connected
  redistribute static
  neighbor 200.241.245.130 remote-as 65000
  neighbor 200.241.245.130 description SLS/IP/06173
  neighbor 200.241.245.130 activate
  neighbor 200.241.245.130 send-community both
 exit-address-family
 !
 address-family ipv4 vrf SABEMI:4503
  bgp dampening
  redistribute connected
  redistribute static
  neighbor 189.52.211.254 remote-as 65436
  neighbor 189.52.211.254 description SLS/IP/05550
  neighbor 189.52.211.254 activate
  neighbor 189.52.211.254 send-community both
 exit-address-family
 !
 address-family ipv4 vrf SAGA_BRASIL:7340
  bgp dampening
  redistribute connected
  redistribute static
  neighbor 201.57.136.110 remote-as 65000
  neighbor 201.57.136.110 description SLS/IP/06217
  neighbor 201.57.136.110 activate
  neighbor 201.57.136.110 send-community both
 exit-address-family
 !
 address-family ipv4 vrf SCHIN:1097
  bgp dampening
  redistribute connected
  redistribute static
  neighbor 200.179.213.38 remote-as 65476
  neighbor 200.179.213.38 description SLS/IP/05772
  neighbor 200.179.213.38 activate
  neighbor 200.179.213.38 send-community both
  maximum-paths eibgp 2
 exit-address-family
 !
 address-family ipv4 vrf SEBRAEMA:4302
  bgp dampening
  redistribute connected route-map SBC_CLIENTE
  redistribute static
  neighbor 200.243.186.82 remote-as 64617
  neighbor 200.243.186.82 description BLA/IP/00054
  neighbor 200.243.186.82 activate
  neighbor 200.243.186.82 send-community both
 exit-address-family
 !
 address-family ipv4 vrf SERPRO_SLS_DNIT_01:5893
  bgp dampening
  redistribute connected
  redistribute static
  neighbor 10.218.13.210 remote-as 65013
  neighbor 10.218.13.210 description SLS/IP/04943
  neighbor 10.218.13.210 activate
  neighbor 10.218.13.210 send-community both
 exit-address-family
 !
 address-family ipv4 vrf SERPRO_SLS_RFB_03:5904
  bgp dampening
  redistribute connected
  redistribute static
  neighbor 10.53.2.182 remote-as 65003
  neighbor 10.53.2.182 description BLA/IP/00192
  neighbor 10.53.2.182 activate
  neighbor 10.53.2.182 send-community both
 exit-address-family
 !
 address-family ipv4 vrf SERPRO_SLS_RFB_10:5909
  bgp dampening
  redistribute connected
  redistribute static
  neighbor 10.53.2.158 remote-as 65003
  neighbor 10.53.2.158 description SIS/IP/00166
  neighbor 10.53.2.158 activate
  neighbor 10.53.2.158 send-community both
 exit-address-family
 !
 address-family ipv4 vrf SESC:1916
  bgp dampening
  redistribute connected
  redistribute static
  neighbor 200.172.182.110 remote-as 65000
  neighbor 200.172.182.110 description SLS/IP/05619
  neighbor 200.172.182.110 activate
  neighbor 200.172.182.110 send-community both
  maximum-paths eibgp 2
 exit-address-family
 !
 address-family ipv4 vrf TCU:1628
  bgp dampening
  redistribute connected
  redistribute static
  neighbor 10.253.52.19 remote-as 65000
  neighbor 10.253.52.19 ebgp-multihop 255
  neighbor 10.253.52.19 update-source Loopback2002251885
  neighbor 10.253.52.19 activate
  neighbor 10.253.52.19 send-community both
  maximum-paths eibgp 2
 exit-address-family
 !
 address-family ipv4 vrf TENDTUDO:1965
  bgp dampening
  redistribute connected
  redistribute static
  neighbor 200.179.228.254 remote-as 65000
  neighbor 200.179.228.254 description SJE/IP/00174
  neighbor 200.179.228.254 activate
  neighbor 200.179.228.254 send-community both
 exit-address-family
 !
 address-family ipv4 vrf TRF1_FM:3152
  bgp dampening
  redistribute connected
  redistribute static
  neighbor 189.53.11.246 remote-as 65348
  neighbor 189.53.11.246 description BLA/MULTI/57212
  neighbor 189.53.11.246 activate
  neighbor 189.53.11.246 send-community both
  neighbor 200.241.80.62 remote-as 65348
  neighbor 200.241.80.62 description SLS/IP/00185
  neighbor 200.241.80.62 activate
  neighbor 200.241.80.62 send-community both
 exit-address-family
 !
 address-family ipv4 vrf TSE_SPOKE:154234
  bgp dampening
  redistribute connected
  redistribute static
  neighbor 187.28.122.110 remote-as 64642
  neighbor 187.28.122.110 description SLS/IP/03555
  neighbor 187.28.122.110 activate
  neighbor 187.28.122.110 send-community both
  maximum-paths eibgp 2
 exit-address-family
 !
 address-family ipv4 vrf VOTORANTIM:4561
  bgp dampening
  redistribute connected
  redistribute static
  neighbor 200.179.213.158 remote-as 64854
  neighbor 200.179.213.158 description SLS/IP/05777
  neighbor 200.179.213.158 activate
  neighbor 200.179.213.158 send-community both
  maximum-paths eibgp 2
 exit-address-family
 !
 address-family ipv4 vrf WALMART:3141
  bgp dampening
  redistribute connected
  redistribute static
  neighbor 201.45.138.174 remote-as 65371
  neighbor 201.45.138.174 description SLS/IP/00528
  neighbor 201.45.138.174 activate
  neighbor 201.45.138.174 send-community both
 exit-address-family
!
ip forward-protocol nd
!
ip extcommunity-list 185 permit RT:4230:1663
ip extcommunity-list 186 permit RT:4230:155458
ip bgp-community new-format
ip community-list 1 permit 4230:1
ip community-list 2 permit 4230:2
ip community-list 3 permit 4230:30
ip community-list 3 permit 4230:31
ip community-list 3 permit 4230:32
ip community-list 3 permit 4230:33
ip community-list 4 permit 4230:4
ip community-list 5 permit 4230:5
ip community-list 11 permit 4230:11
ip community-list 21 permit 4230:21
ip community-list 30 permit 4230:30
ip community-list 31 permit 4230:31
ip community-list 32 permit 4230:32
ip community-list 33 permit 4230:33
ip community-list 50 permit 4230:50
ip community-list 61 permit 4230:61
ip community-list 62 permit 4230:62
ip community-list 63 permit 4230:63
ip community-list 80 permit 4230:80
ip community-list 101 permit 4230:101
ip community-list 102 permit 4230:102
ip community-list 107 permit 4230:107
ip community-list 108 permit 4230:108
ip community-list 109 permit 4230:109
ip community-list 111 permit 4230:111
ip community-list 112 permit 4230:112
ip community-list 113 permit 4230:113
ip community-list 114 permit 4230:114
ip community-list 115 permit 4230:115
ip community-list 116 permit 4230:116
ip community-list 117 permit 4230:117
ip community-list 118 permit 4230:118
ip community-list 119 permit 4230:119
ip community-list 120 permit 4230:120
ip community-list 121 permit 4230:121
ip community-list 122 permit 4230:122
ip community-list 123 permit 4230:123
ip community-list 124 permit 4230:124
ip community-list 125 permit 4230:125
ip community-list 126 permit 4230:126
ip community-list 127 permit 4230:127
ip community-list 128 permit 4230:128
ip community-list 129 permit 4230:129
ip community-list 131 permit 4230:131
ip community-list 132 permit 4230:132
ip community-list 133 permit 4230:133
ip community-list 134 permit 4230:134
ip community-list 135 permit 4230:135
ip community-list 141 permit 4230:141
ip community-list 142 permit 4230:142
ip community-list 143 permit 4230:143
ip community-list 144 permit 4230:144
ip community-list 145 permit 4230:145
ip community-list 148 permit 4230:148
ip community-list 151 permit 4230:151
ip community-list 152 permit 4230:152
ip community-list 154 permit 4230:154
ip community-list 161 permit 4230:161
ip community-list 162 permit 4230:162
ip community-list 163 permit 4230:163
ip community-list 165 permit 4230:165
ip community-list 167 permit 4230:167
ip community-list 168 permit 4230:168
ip community-list 169 permit 4230:169
ip community-list 171 permit 4230:171
ip community-list 172 permit 4230:172
ip community-list 173 permit 4230:173
ip community-list 174 permit 4230:174
ip community-list 175 permit 4230:175
ip community-list 176 permit 4230:176
ip community-list 179 permit 4230:179
ip community-list 181 permit 4230:181
ip community-list 182 permit 4230:182
ip community-list 183 permit 4230:183
ip community-list 184 permit 4230:184
ip community-list 185 permit 4230:185
ip community-list 186 permit 4230:186
ip community-list 187 permit 4230:187
ip community-list 188 permit 4230:188
ip community-list 191 permit 4230:191
ip community-list 192 permit 4230:192
ip community-list 193 permit 4230:193
ip community-list 194 permit 4230:194
ip community-list 195 permit 4230:195
ip community-list 196 permit 4230:196
ip community-list 198 permit 4230:198
ip community-list 221 permit 65522:211
ip community-list 221 permit 65522:221
ip community-list 221 permit 65533:311
ip community-list 221 permit 65533:321
ip community-list 421 permit 65521:121
ip community-list 421 permit 65521:103
ip community-list 421 permit 65521:105
ip community-list 421 permit 65521:107
ip community-list 421 permit 65531:131
ip community-list 421 permit 65531:103
ip community-list 421 permit 65531:107
ip community-list 421 permit 65521:130
ip community-list 441 permit 65121:201
ip community-list 441 permit 65121:301
ip community-list 441 permit 65121:203
ip community-list 441 permit 65121:303
ip community-list 441 permit 65121:205
ip community-list 441 permit 65121:305
ip community-list 441 permit 65121:206
ip community-list 441 permit 65121:306
ip community-list 441 permit 65121:207
ip community-list 441 permit 65121:307
ip community-list 441 permit 65121:208
ip community-list 441 permit 65121:308
ip community-list 441 permit 65121:209
ip community-list 441 permit 65121:309
ip community-list 441 permit 65121:210
ip community-list 441 permit 65121:310
ip community-list 441 permit 65121:211
ip community-list 441 permit 65121:311
ip community-list 441 permit 65121:212
ip community-list 441 permit 65121:215
ip community-list 441 permit 65215:201
ip community-list 441 permit 65215:403
ip community-list 441 permit 65215:405
ip community-list 441 permit 65215:406
ip community-list 441 permit 65215:407
ip community-list 441 permit 65215:408
ip community-list 441 permit 65215:410
ip community-list 441 permit 65031:103
ip community-list 441 permit 65031:106
ip community-list 441 permit 65031:107
ip community-list 441 permit 65031:108
ip community-list 441 permit 65031:110
ip community-list 442 permit 65121:203
ip community-list 442 permit 65121:206
ip community-list 442 permit 65121:208
ip community-list 442 permit 65121:214
ip community-list 442 permit 65121:215
ip community-list 443 permit 65121:302
ip community-list 443 permit 65121:203
ip community-list 443 permit 65121:303
ip community-list 443 permit 65121:205
ip community-list 443 permit 65121:305
ip community-list 443 permit 65121:206
ip community-list 443 permit 65121:306
ip community-list 443 permit 65121:207
ip community-list 443 permit 65121:307
ip community-list 443 permit 65121:208
ip community-list 443 permit 65121:308
ip community-list 443 permit 65121:209
ip community-list 443 permit 65121:309
ip community-list 443 permit 65121:210
ip community-list 443 permit 65121:310
ip community-list 443 permit 65121:211
ip community-list 443 permit 65121:311
ip community-list 443 permit 65121:312
ip community-list 443 permit 65121:315
ip community-list 443 permit 65215:302
ip community-list 443 permit 65215:403
ip community-list 443 permit 65215:405
ip community-list 443 permit 65215:406
ip community-list 443 permit 65215:407
ip community-list 443 permit 65215:408
ip community-list 443 permit 65215:410
ip community-list 443 permit 65031:302
ip community-list 443 permit 65031:103
ip community-list 443 permit 65031:106
ip community-list 443 permit 65031:107
ip community-list 443 permit 65031:108
ip community-list 443 permit 65031:110
ip community-list 444 permit 65121:303
ip community-list 444 permit 65121:306
ip community-list 444 permit 65121:308
ip community-list 444 permit 65121:314
ip community-list 444 permit 65121:315
ip community-list standard BLACKHOLE-NAC-CLIENTE permit 4230:10000
ip community-list standard BLACKHOLE-NAC-EBT permit 4230:10001
ip community-list standard BLACKHOLE-INTL-CLIENTE permit 4230:10002
ip community-list standard BLACKHOLE-INTL-EBT permit 4230:10003
ip community-list standard GBLX-BLACKHOLE permit 3549:666
ip community-list standard MCI-BLACKHOLE permit 701:9999
ip community-list standard SPRINT-BLACKHOLE permit 1239:66
ip community-list standard BLACKHOLE-MIA-CLIENTE permit 4230:10004
ip community-list standard BLACKHOLE-MIA-EBT permit 4230:10005
ip community-list standard VOZ permit 65000:869
ip community-list standard TINET-BLACKHOLE permit 3257:2666
ip community-list standard INTELIQUENT-BLACKHOLE permit 3257:2666
ip community-list standard TELIASONERA-BLACKHOLE permit 1299:999
ip community-list standard BLACKHOLE-NAC-EDGE-CLIENTE permit 4230:10000
ip community-list standard BLACKHOLE-NAC-EDGE-EBT permit 4230:10001
ip community-list standard BLACKHOLE-INTERNAC-CLIENTE permit 4230:10002
ip community-list standard BLACKHOLE-NAC-INTL-CLIENTE permit 4230:10004
ip community-list standard TATA-BLACKHOLE permit 64999:0
ip community-list standard BLACKHOLE-PE-NAC-CLIENTE permit 4230:10008
ip community-list standard BLACKHOLE-PE-NAC-EBT permit 4230:10009
ip community-list standard BLACKHOLE-PE-CLIENTE permit 4230:10006
ip community-list standard BLACKHOLE-PE-EBT permit 4230:10007
ip community-list expanded TST10 permit 1024:23
ip community-list expanded TST11 permit 1024:324
ip community-list expanded TST12 permit 1024:323
ip community-list expanded TST13 permit 1024:200
ip community-list expanded ANTT-VOIP permit 1224:323
ip community-list expanded ANTT-VOIP permit 1124:323
ip community-list expanded DPRF-VOIP permit 1024:1323
ip community-list expanded DPRF-GERENCIA permit 1024:1001
ip community-list expanded VRF_DNPM_VOIP permit 323:323
ip as-path access-list 1 permit ^$
ip as-path access-list 102 permit ^(28611_)+$
ip as-path access-list 103 permit ^(28324_)+$
ip as-path access-list 104 permit ^(266161_)+$
ip as-path access-list 106 permit ^(22431_)+$
ip as-path access-list 108 permit ^(19090_)+$
ip as-path access-list 109 permit ^(4.515_)+$
ip as-path access-list 109 permit ^(262659_)+$
ip as-path access-list 110 permit ^(28349_)+$
ip as-path access-list 111 permit ^(28349_)+$
ip as-path access-list 112 permit ^(53080_)+$
ip as-path access-list 114 permit ^(262892_)+$
ip as-path access-list 115 permit ^(263362_)+$
ip as-path access-list 115 permit ^(263362_)+(262503_)+$
ip as-path access-list 116 permit ^(263528_)+$
ip as-path access-list 117 permit ^(263430_)+$
ip as-path access-list 118 permit ^(263571_)+$
ip as-path access-list 120 permit ^(28246_)+$
ip as-path access-list 121 permit ^(263049_)+$
ip as-path access-list 122 permit ^(263936_)+$
ip as-path access-list 123 permit ^(266353_)+$
ip as-path access-list 124 permit ^(262503_)+$
ip flow-export source Loopback0
ip flow-export version 9 origin-as
ip flow-export destination 200.244.163.247 23213
no ip http server
no ip http secure-server
ip pim ssm range 99
ip pim vrf TCU:1628 rp-address 10.232.127.1 override
ip pim vrf MPF_NOVA:6114 rp-address 192.168.253.1 override
ip pim vrf CGU_NOVA:5325 rp-address 192.168.30.6 override
ip pim vrf BBRASIL_NAC:7399 rp-address 10.53.128.254 override
ip pim vrf BOTICARIO2:3247 rp-address 172.18.0.1 override
ip pim vrf SERPRO_SLS_RFB_03:5904 rp-address 10.2.29.61 SERPRO_SPO override
ip pim vrf SERPRO_SLS_RFB_03:5904 rp-address 10.2.28.61 SERPRO_CTA override
ip pim vrf SERPRO_SLS_RFB_03:5904 rp-address 10.51.0.254 SERPRO_BSA override
ip pim vrf SERPRO_SLS_RFB_03:5904 rp-address 10.2.41.61 SERPRO_BLM override
ip pim vrf SERPRO_SLS_RFB_03:5904 rp-address 10.2.43.61 SERPRO_FLA override
ip pim vrf SERPRO_SLS_RFB_03:5904 rp-address 10.6.24.225 SERPRO_RCE override
ip pim vrf SERPRO_SLS_RFB_03:5904 rp-address 10.55.0.56 SERPRO_SDR override
ip pim vrf SERPRO_SLS_RFB_03:5904 rp-address 10.2.56.61 SERPRO_BHE override
ip pim vrf SERPRO_SLS_RFB_03:5904 rp-address 10.2.44.61 SERPRO_RJO override
ip pim vrf SERPRO_SLS_RFB_03:5904 rp-address 10.2.27.61 SERPRO_PAE override
ip pim vrf SERPRO_SLS_RFB_10:5909 rp-address 10.2.29.61 SERPRO_SPO override
ip pim vrf SERPRO_SLS_RFB_10:5909 rp-address 10.2.28.61 SERPRO_CTA override
ip pim vrf SERPRO_SLS_RFB_10:5909 rp-address 10.51.0.254 SERPRO_BSA override
ip pim vrf SERPRO_SLS_RFB_10:5909 rp-address 10.2.41.61 SERPRO_BLM override
ip pim vrf SERPRO_SLS_RFB_10:5909 rp-address 10.2.43.61 SERPRO_FLA override
ip pim vrf SERPRO_SLS_RFB_10:5909 rp-address 10.6.24.225 SERPRO_RCE override
ip pim vrf SERPRO_SLS_RFB_10:5909 rp-address 10.55.0.56 SERPRO_SDR override
ip pim vrf SERPRO_SLS_RFB_10:5909 rp-address 10.2.56.61 SERPRO_BHE override
ip pim vrf SERPRO_SLS_RFB_10:5909 rp-address 10.2.44.61 SERPRO_RJO override
ip pim vrf SERPRO_SLS_RFB_10:5909 rp-address 10.2.27.61 SERPRO_PAE override
ip pim vrf SESC:1916 rp-address 10.10.0.1 override
ip route 10.0.0.0 255.0.0.0 Null0 tag 200
ip route 100.64.0.0 255.192.0.0 Null0 tag 200
ip route 169.254.0.0 255.255.0.0 Null0 tag 200
ip route 172.16.0.0 255.240.0.0 Null0 tag 200
ip route 187.28.0.0 255.255.0.0 Null0 tag 200
ip route 187.28.44.0 255.255.255.240 GigabitEthernet2/0/1.15042 201.45.221.250
ip route 187.28.44.32 255.255.255.240 GigabitEthernet2/1/0.1503185 200.241.95.206
ip route 187.28.44.48 255.255.255.240 GigabitEthernet2/0/3.224 201.30.37.26
ip route 187.28.44.64 255.255.255.240 GigabitEthernet2/1/0.1500237 201.30.37.54
ip route 187.28.44.176 255.255.255.240 GigabitEthernet2/1/0.1503155 200.179.126.22
ip route 187.28.44.224 255.255.255.240 GigabitEthernet2/1/0.1500244 200.241.95.58
ip route 187.28.44.240 255.255.255.240 GigabitEthernet2/1/0.151222 200.179.228.186
ip route 187.28.86.0 255.255.255.0 GigabitEthernet2/0/1.15042 201.45.221.250
ip route 187.28.122.218 255.255.255.255 GigabitEthernet2/0/1.15042 201.45.221.250
ip route 187.29.0.0 255.255.0.0 Null0 tag 200
ip route 187.30.0.0 255.255.0.0 Null0 tag 200
ip route 189.2.0.0 255.255.0.0 Null0 tag 200
ip route 189.3.0.0 255.255.0.0 Null0 tag 200
ip route 189.3.25.216 255.255.255.248 GigabitEthernet2/1/0.1504156 200.179.126.26
ip route 189.3.101.16 255.255.255.240 GigabitEthernet2/1/0.1500214 189.23.28.106
ip route 189.3.101.112 255.255.255.240 GigabitEthernet2/1/0.1500239 200.241.95.94
ip route 189.3.102.0 255.255.255.240 GigabitEthernet2/1/0.15126 201.45.205.54
ip route 189.3.154.32 255.255.255.240 GigabitEthernet2/1/0.1503176 189.53.246.62
ip route 189.3.154.96 255.255.255.240 GigabitEthernet2/1/0.1500243 200.179.213.86
ip route 189.3.155.32 255.255.255.240 GigabitEthernet2/1/0.1503178 200.179.213.114
ip route 189.3.155.64 255.255.255.240 GigabitEthernet2/1/0.1503171 189.53.246.102
ip route 189.3.155.112 255.255.255.240 GigabitEthernet2/0/3.82 200.179.212.202
ip route 189.3.221.64 255.255.255.240 GigabitEthernet2/1/0.1500236 201.45.205.242
ip route 189.3.222.144 255.255.255.240 GigabitEthernet2/1/0.151215 201.45.221.98
ip route 189.3.222.208 255.255.255.240 GigabitEthernet2/0/3.100 201.45.220.42
ip route 189.3.222.240 255.255.255.240 GigabitEthernet2/1/0.15092 187.28.122.142
ip route 189.16.0.0 255.255.0.0 Null0 tag 200
ip route 189.16.241.64 255.255.255.240 GigabitEthernet2/1/0.150610 201.45.221.30
ip route 189.16.241.80 255.255.255.240 GigabitEthernet2/1/0.150614 201.45.205.182
ip route 189.16.241.96 255.255.255.240 GigabitEthernet2/1/4.11 200.172.10.134
ip route 189.16.241.144 255.255.255.240 GigabitEthernet2/0/1.15008 200.253.132.98
ip route 189.16.241.160 255.255.255.240 GigabitEthernet2/1/0.1503168 200.179.126.82
ip route 189.16.241.192 255.255.255.240 GigabitEthernet2/1/0.1500125 200.252.158.234
ip route 189.16.241.208 255.255.255.240 GigabitEthernet2/1/0.1503137 189.52.211.54
ip route 189.16.248.16 255.255.255.240 GigabitEthernet2/1/0.150616 189.52.211.98
ip route 189.16.255.0 255.255.255.240 GigabitEthernet2/1/0.1503250 201.45.221.114
ip route 189.16.255.16 255.255.255.240 GigabitEthernet0/0/4.15257 189.23.73.102
ip route 189.16.255.80 255.255.255.240 GigabitEthernet2/1/0.150625 187.28.122.162
ip route 189.16.255.96 255.255.255.240 GigabitEthernet2/1/0.1503149 200.179.229.38
ip route 189.16.255.112 255.255.255.240 GigabitEthernet2/1/0.1500212 200.241.95.26
ip route 189.16.255.144 255.255.255.240 GigabitEthernet2/1/0.1503189 200.179.230.22
ip route 189.16.255.160 255.255.255.240 GigabitEthernet2/1/0.150917 200.179.126.66
ip route 189.16.255.176 255.255.255.240 GigabitEthernet2/0/0.1503213 200.241.95.110
ip route 189.16.255.208 255.255.255.240 GigabitEthernet2/1/0.150620 189.53.11.110
ip route 189.16.255.224 255.255.255.240 GigabitEthernet2/1/0.15093 200.253.132.158
ip route 189.17.0.0 255.255.0.0 Null0 tag 200
ip route 189.17.21.80 255.255.255.240 GigabitEthernet2/1/0.1503190 187.29.255.218
ip route 189.17.21.160 255.255.255.240 GigabitEthernet2/1/0.1500242 187.28.240.30
ip route 189.17.21.208 255.255.255.240 GigabitEthernet2/0/0.15032 200.179.213.166
ip route 189.17.21.224 255.255.255.240 GigabitEthernet2/0/0.15004 200.172.13.26
ip route 189.17.22.16 255.255.255.240 GigabitEthernet2/0/3.4 201.45.205.38
ip route 189.17.22.32 255.255.255.240 GigabitEthernet2/1/0.1500123 200.241.95.74
ip route 189.17.22.48 255.255.255.240 GigabitEthernet2/1/0.1503180 201.45.205.102
ip route 189.17.22.64 255.255.255.240 GigabitEthernet2/1/0.1503252 201.45.221.234
ip route 189.17.22.128 255.255.255.240 GigabitEthernet2/0/1.150711 200.172.10.242
ip route 189.17.22.176 255.255.255.240 GigabitEthernet2/0/0.150035 201.45.221.186
ip route 189.17.22.192 255.255.255.240 GigabitEthernet2/1/0.1500142 200.179.213.30
ip route 189.17.65.128 255.255.255.240 GigabitEthernet2/1/0.1500141 200.179.228.250
ip route 189.17.65.144 255.255.255.240 GigabitEthernet2/1/0.1503111 189.53.246.238
ip route 189.17.65.240 255.255.255.240 GigabitEthernet2/1/0.1503141 200.179.228.134
ip route 189.17.66.0 255.255.255.240 GigabitEthernet2/1/0.1503153 201.45.205.162
ip route 189.17.66.48 255.255.255.240 GigabitEthernet2/1/0.151224 200.252.158.2
ip route 189.17.66.112 255.255.255.240 GigabitEthernet2/1/0.1500133 200.179.126.86
ip route 189.17.66.160 255.255.255.240 GigabitEthernet2/1/0.1503170 200.179.214.150
ip route 189.17.66.176 255.255.255.240 GigabitEthernet2/1/0.1500128 200.179.228.222
ip route 189.17.66.208 255.255.255.240 GigabitEthernet2/1/0.1503147 200.179.228.234
ip route 189.17.131.48 255.255.255.240 GigabitEthernet2/1/0.15068 201.45.205.190
ip route 189.17.131.64 255.255.255.240 GigabitEthernet2/1/4.21 189.53.246.250
ip route 189.17.131.176 255.255.255.240 GigabitEthernet2/1/0.1512102 200.241.95.38
ip route 189.17.173.0 255.255.255.240 GigabitEthernet2/1/0.1500221 200.179.213.34
ip route 189.17.173.16 255.255.255.240 GigabitEthernet2/1/0.1503243 187.28.240.78
ip route 189.17.173.64 255.255.255.240 GigabitEthernet2/1/0.1503169 200.179.126.98
ip route 189.17.173.96 255.255.255.240 GigabitEthernet2/1/0.1500227 200.179.213.162
ip route 189.17.173.160 255.255.255.240 GigabitEthernet2/1/0.1506201 200.241.95.230
ip route 189.17.173.240 255.255.255.240 GigabitEthernet2/0/4.107 201.45.220.50
ip route 189.17.174.192 255.255.255.240 GigabitEthernet2/1/0.1503134 200.172.182.174
ip route 189.17.228.80 255.255.255.240 GigabitEthernet2/1/0.1500117 189.53.11.130
ip route 189.22.0.0 255.255.0.0 Null0 tag 200
ip route 189.22.180.48 255.255.255.240 GigabitEthernet2/1/0.1503173 200.179.126.158
ip route 189.22.180.80 255.255.255.240 GigabitEthernet2/0/3.16 200.241.80.162
ip route 189.22.180.128 255.255.255.240 GigabitEthernet2/0/0.1503209 200.241.80.198
ip route 189.22.180.160 255.255.255.240 GigabitEthernet2/1/0.1503164 200.179.126.42
ip route 189.22.181.208 255.255.255.240 GigabitEthernet2/0/4.106 200.179.126.174
ip route 189.22.226.32 255.255.255.240 GigabitEthernet2/0/3.214 200.172.11.90
ip route 189.22.226.160 255.255.255.240 GigabitEthernet2/1/0.1500231 201.45.205.114
ip route 189.22.228.192 255.255.255.240 GigabitEthernet2/1/0.1500215 200.172.11.242
ip route 189.22.238.176 255.255.255.240 GigabitEthernet2/1/0.1503200 201.45.221.206
ip route 189.23.0.0 255.255.0.0 Null0 tag 200
ip route 189.23.27.48 255.255.255.240 GigabitEthernet2/0/0.150010 200.241.95.142
ip route 189.23.140.16 255.255.255.240 GigabitEthernet2/1/0.1500143 200.179.230.10
ip route 189.23.142.128 255.255.255.240 GigabitEthernet2/1/0.1503183 200.179.126.194
ip route 189.23.142.144 255.255.255.240 GigabitEthernet2/0/4.109 200.172.10.58
ip route 189.23.142.176 255.255.255.240 GigabitEthernet2/1/0.1503225 200.241.95.250
ip route 189.23.142.192 255.255.255.240 GigabitEthernet2/1/0.1503152 200.179.213.54
ip route 189.23.142.224 255.255.255.240 GigabitEthernet2/0/0.150032 201.45.205.202
ip route 189.23.232.48 255.255.255.240 GigabitEthernet2/1/0.1503237 200.241.80.42
ip route 189.23.232.64 255.255.255.240 GigabitEthernet2/1/0.151212 200.241.80.58
ip route 189.23.232.160 255.255.255.240 GigabitEthernet2/0/0.1503202 200.241.80.70
ip route 189.23.232.224 255.255.255.240 GigabitEthernet2/1/0.1500138 200.179.126.210
ip route 189.42.0.0 255.255.0.0 Null0 tag 200
ip route 189.42.206.16 255.255.255.240 GigabitEthernet2/1/0.1500137 200.179.126.202
ip route 189.43.0.0 255.255.0.0 Null0 tag 200
ip route 189.43.16.64 255.255.255.240 GigabitEthernet2/1/0.150911 201.45.221.150
ip route 189.43.17.64 255.255.255.240 GigabitEthernet2/1/0.1503251 189.53.11.242
ip route 189.43.17.208 255.255.255.240 GigabitEthernet2/1/0.150919 200.179.126.206
ip route 189.43.71.128 255.255.255.128 GigabitEthernet2/0/0.150024 200.249.175.142
ip route 189.43.142.128 255.255.255.240 GigabitEthernet2/1/0.1500211 187.28.122.46
ip route 189.43.142.144 255.255.255.240 GigabitEthernet2/1/0.1500207 200.252.158.198
ip route 189.43.142.160 255.255.255.240 GigabitEthernet2/1/0.151219 201.30.37.130
ip route 189.43.142.176 255.255.255.240 GigabitEthernet2/1/0.1503201 200.172.10.210
ip route 189.43.143.128 255.255.255.240 GigabitEthernet2/1/0.151226 200.179.126.214
ip route 189.43.143.208 255.255.255.240 GigabitEthernet2/1/0.1503249 200.172.11.102
ip route 189.43.143.240 255.255.255.240 GigabitEthernet2/1/0.1503230 200.179.213.50
ip route 189.43.181.32 255.255.255.240 GigabitEthernet2/1/0.1503184 200.179.126.218
ip route 189.43.181.48 255.255.255.240 GigabitEthernet2/1/0.1503188 200.179.126.238
ip route 189.43.181.64 255.255.255.240 GigabitEthernet2/1/0.1503227 200.241.95.158
ip route 189.43.181.80 255.255.255.240 GigabitEthernet2/1/4.9 200.172.10.142
ip route 189.43.181.112 255.255.255.240 GigabitEthernet2/1/0.1500139 200.179.126.222
ip route 189.52.0.0 255.255.0.0 Null0 tag 200
ip route 189.52.165.64 255.255.255.240 GigabitEthernet2/1/0.150921 200.179.230.2
ip route 189.52.165.128 255.255.255.240 GigabitEthernet2/0/4.116 200.172.10.90
ip route 189.52.165.144 255.255.255.240 GigabitEthernet2/1/0.1503187 200.179.126.226
ip route 189.52.165.160 255.255.255.240 GigabitEthernet2/1/0.1500140 200.179.126.242
ip route 189.52.165.176 255.255.255.240 GigabitEthernet2/1/0.1503148 200.179.228.238
ip route 189.52.170.0 255.255.255.240 GigabitEthernet2/1/0.15069 201.45.221.14
ip route 189.52.170.48 255.255.255.240 GigabitEthernet5/0/0.15012 200.179.230.6
ip route 189.52.170.208 255.255.255.240 GigabitEthernet2/0/0.1503212 200.241.95.114
ip route 189.52.171.16 255.255.255.240 GigabitEthernet2/1/4.26 189.52.211.242
ip route 189.53.0.0 255.255.0.0 Null0 tag 200
ip route 189.86.0.0 255.255.0.0 Null0 tag 200
ip route 189.87.0.0 255.255.0.0 Null0 tag 200
ip route 189.88.0.0 255.255.0.0 Null0 tag 200
ip route 192.0.0.0 255.255.255.0 Null0 tag 200
ip route 192.0.2.0 255.255.255.0 Null0 tag 200
ip route 192.88.99.0 255.255.255.0 Null0 tag 200
ip route 192.168.0.0 255.255.0.0 Null0 tag 200
ip route 198.18.0.0 255.254.0.0 Null0 tag 200
ip route 198.51.100.0 255.255.255.0 Null0 tag 200
ip route 200.10.159.0 255.255.255.0 Null0 tag 200
ip route 200.10.159.254 255.255.255.255 Null0 tag 200
ip route 200.166.0.0 255.255.0.0 Null0 tag 200
ip route 200.166.97.96 255.255.255.240 GigabitEthernet2/0/0.150228 201.45.221.18
ip route 200.166.99.0 255.255.255.240 GigabitEthernet2/1/4.104 187.28.122.74
ip route 200.166.99.0 255.255.255.240 GigabitEthernet2/0/1.15106 187.28.122.74
ip route 200.166.99.96 255.255.255.240 GigabitEthernet2/1/0.1500240 201.45.221.142
ip route 200.166.101.80 255.255.255.240 GigabitEthernet2/0/3.204 200.172.11.2
ip route 200.167.0.0 255.255.0.0 Null0 tag 200
ip route 200.167.65.128 255.255.255.128 GigabitEthernet2/1/0.1500213 200.243.109.166
ip route 200.167.68.144 255.255.255.240 GigabitEthernet2/0/0.150017 200.179.213.130
ip route 200.167.68.176 255.255.255.240 GigabitEthernet5/0/0 201.45.221.50
ip route 200.167.148.32 255.255.255.240 GigabitEthernet2/1/0.150627 200.179.230.26
ip route 200.167.151.32 255.255.255.240 GigabitEthernet2/1/0.1503215 200.241.95.42
ip route 200.167.151.64 255.255.255.240 GigabitEthernet2/1/0.1500238 189.52.211.222
ip route 200.167.151.80 255.255.255.240 GigabitEthernet2/1/0.1503218 200.241.95.126
ip route 200.167.151.96 255.255.255.240 GigabitEthernet2/1/0.1503219 200.241.95.130
ip route 200.167.151.112 255.255.255.240 GigabitEthernet2/0/0.150013 200.241.95.146
ip route 200.172.0.0 255.255.0.0 Null0 tag 200
ip route 200.172.200.128 255.255.255.128 GigabitEthernet2/1/0.1503228 200.243.109.234
ip route 200.172.203.192 255.255.255.240 GigabitEthernet2/0/0.15006 200.241.95.186
ip route 200.172.203.224 255.255.255.240 GigabitEthernet2/1/0.1509202 200.241.95.254
ip route 200.174.0.0 255.255.0.0 Null0 tag 200
ip route 200.178.0.0 255.255.0.0 Null0 tag 200
ip route 200.179.0.0 255.255.0.0 Null0 tag 200
ip route 200.182.0.0 255.255.0.0 Null0 tag 200
ip route 200.183.0.0 255.255.0.0 Null0 tag 200
ip route 200.191.0.0 255.255.0.0 Null0 tag 200
ip route 200.200.0.0 255.255.0.0 Null0 tag 200
ip route 200.208.0.0 255.255.0.0 Null0 tag 200
ip route 200.209.0.0 255.255.0.0 Null0 tag 200
ip route 200.209.37.128 255.255.255.240 GigabitEthernet2/0/0.1503204 200.241.95.54
ip route 200.209.188.96 255.255.255.240 GigabitEthernet2/1/0.1503133 187.28.240.26
ip route 200.210.0.0 255.255.0.0 Null0 tag 200
ip route 200.211.0.0 255.255.0.0 Null0 tag 200
ip route 200.212.0.0 255.255.0.0 Null0 tag 200
ip route 200.213.0.0 255.255.0.0 Null0 tag 200
ip route 200.214.0.0 255.255.0.0 Null0 tag 200
ip route 200.227.0.0 255.255.0.0 Null0 tag 200
ip route 200.228.0.0 255.255.0.0 Null0 tag 200
ip route 200.230.0.0 255.255.0.0 Null0 tag 200
ip route 200.231.0.0 255.255.0.0 Null0 tag 200
ip route 200.241.0.0 255.255.0.0 Null0 tag 200
ip route 200.241.82.48 255.255.255.240 GigabitEthernet2/1/4.4 201.45.221.146
ip route 200.241.82.64 255.255.255.240 GigabitEthernet2/0/1.15102 200.179.213.46
ip route 200.241.82.80 255.255.255.240 GigabitEthernet2/0/0.150014 200.241.95.150
ip route 200.241.82.112 255.255.255.240 GigabitEthernet2/1/0.1500217 200.241.95.174
ip route 200.241.82.208 255.255.255.240 GigabitEthernet2/1/0.1500219 200.172.10.78
ip route 200.241.86.16 255.255.255.240 GigabitEthernet2/1/0.1503244 200.172.182.186
ip route 200.241.93.0 255.255.255.128 GigabitEthernet2/1/0.1500234 200.241.80.202
ip route 200.242.0.0 255.255.0.0 Null0 tag 200
ip route 200.243.0.0 255.255.0.0 Null0 tag 200
ip route 200.243.105.208 255.255.255.240 GigabitEthernet2/0/4.110 200.241.80.14
ip route 200.243.105.224 255.255.255.240 GigabitEthernet2/1/0.150618 187.29.255.226
ip route 200.244.0.0 255.255.0.0 Null0 tag 200
ip route 200.245.0.0 255.255.0.0 Null0 tag 200
ip route 200.246.0.0 255.255.0.0 Null0 tag 200
ip route 200.247.0.0 255.255.0.0 Null0 tag 200
ip route 200.248.0.0 255.255.0.0 Null0 tag 200
ip route 200.249.0.0 255.255.0.0 Null0 tag 200
ip route 200.249.73.0 255.255.255.128 GigabitEthernet2/1/0.1503216 200.249.174.94
ip route 200.249.77.0 255.255.255.128 GigabitEthernet2/1/0.1500205 200.249.174.70
ip route 200.249.84.0 255.255.255.128 GigabitEthernet2/1/0.1503236 200.249.174.198
ip route 200.249.85.128 255.255.255.128 GigabitEthernet2/1/0.1503206 200.209.190.186
ip route 200.249.164.128 255.255.255.128 GigabitEthernet2/1/0.1503158 200.249.169.30
ip route 200.250.0.0 255.255.0.0 Null0 tag 200
ip route 200.251.0.0 255.255.0.0 Null0 tag 200
ip route 200.252.0.0 255.255.0.0 Null0 tag 200
ip route 200.253.0.0 255.255.0.0 Null0 tag 200
ip route 200.253.128.144 255.255.255.240 GigabitEthernet2/0/1.15072 189.53.11.174
ip route 200.253.128.160 255.255.255.240 GigabitEthernet2/1/0.1503221 187.29.255.198
ip route 200.253.128.176 255.255.255.240 GigabitEthernet2/0/3.127 200.179.212.102
ip route 200.253.153.48 255.255.255.240 GigabitEthernet2/0/3.70 200.252.158.202
ip route 200.253.153.112 255.255.255.240 GigabitEthernet2/1/0.1503233 200.179.213.122
ip route 200.253.154.184 255.255.255.248 GigabitEthernet2/1/0.1503186 189.52.190.50
ip route 200.253.155.0 255.255.255.128 GigabitEthernet2/1/0.1500201 200.253.132.38
ip route 200.253.156.0 255.255.255.128 GigabitEthernet2/1/0.1503213 200.249.171.242
ip route 200.253.157.112 255.255.255.240 GigabitEthernet2/1/0.1503253 200.172.182.198
ip route 200.253.158.240 255.255.255.240 GigabitEthernet2/1/0.1503238 201.30.36.6
ip route 200.254.0.0 255.255.0.0 Null0 tag 200
ip route 200.255.0.0 255.255.0.0 Null0 tag 200
ip route 201.30.0.0 255.255.0.0 Null0 tag 200
ip route 201.31.0.0 255.255.0.0 Null0 tag 200
ip route 201.38.0.0 255.255.0.0 Null0 tag 200
ip route 201.38.47.48 255.255.255.240 GigabitEthernet2/1/0.1503235 200.179.213.134
ip route 201.38.233.16 255.255.255.240 GigabitEthernet2/1/0.1500220 189.52.166.14
ip route 201.38.234.32 255.255.255.240 GigabitEthernet2/1/0.1506202 200.179.213.82
ip route 201.39.0.0 255.255.0.0 Null0 tag 200
ip route 201.39.89.48 255.255.255.240 GigabitEthernet2/1/0.1503245 189.53.246.82
ip route 201.39.196.224 255.255.255.240 GigabitEthernet2/0/0.15003 200.241.95.138
ip route 201.39.197.240 255.255.255.240 200.172.13.162
ip route 201.44.0.0 255.255.0.0 Null0 tag 200
ip route 201.45.0.0 255.255.0.0 Null0 tag 200
ip route 201.56.0.0 255.255.0.0 Null0 tag 200
ip route 201.57.0.0 255.255.0.0 Null0 tag 200
ip route 201.57.40.64 255.255.255.240 GigabitEthernet2/0/1.15002 200.241.80.46
ip route 201.57.40.160 255.255.255.240 GigabitEthernet2/0/3.7 200.241.80.214
ip route 201.57.41.192 255.255.255.240 GigabitEthernet2/1/0.1503223 200.172.11.202
ip route 201.57.41.208 255.255.255.240 GigabitEthernet2/1/4.19 200.172.11.206
ip route 201.57.41.224 255.255.255.240 GigabitEthernet2/0/0.15002 200.172.12.26
ip route 201.57.98.192 255.255.255.240 GigabitEthernet2/0/4.114 200.172.10.82
ip route 201.57.98.224 255.255.255.240 GigabitEthernet2/0/4.117 200.172.13.62
ip route 201.57.100.128 255.255.255.240 GigabitEthernet2/0/0.1503207 200.241.95.70
ip route 201.57.171.208 255.255.255.240 GigabitEthernet2/1/0.1500232 201.45.205.170
ip route 201.57.172.80 255.255.255.240 GigabitEthernet2/0/0.150918 187.29.255.230
ip route 201.64.0.0 255.255.0.0 Null0 tag 200
ip route 201.65.0.0 255.255.0.0 Null0 tag 200
ip route 201.65.76.128 255.255.255.128 GigabitEthernet2/1/0.1500241 200.243.109.142
ip route 201.65.78.144 255.255.255.240 GigabitEthernet2/1/4.23 189.52.211.166
ip route 201.65.78.160 255.255.255.240 GigabitEthernet2/1/0.1500119 200.253.132.150
ip route 201.65.78.176 255.255.255.240 GigabitEthernet2/1/0.1500228 200.172.13.202
ip route 201.65.78.224 255.255.255.240 GigabitEthernet2/1/0.1500204 200.172.11.118
ip route 201.65.119.144 255.255.255.240 GigabitEthernet2/1/0.150623 200.179.126.2
ip route 201.65.121.96 255.255.255.240 GigabitEthernet2/1/0.1503245 189.53.246.82
ip route 201.65.221.112 255.255.255.240 GigabitEthernet2/0/0.150310 200.172.12.162
ip route 201.65.223.208 255.255.255.240 GigabitEthernet2/1/0.1503135 200.179.228.54
ip route 201.65.223.240 255.255.255.240 GigabitEthernet2/1/4.7 187.28.240.50
ip route 201.72.0.0 255.255.0.0 Null0 tag 200
ip route 201.73.0.0 255.255.0.0 Null0 tag 200
ip route 201.73.62.96 255.255.255.240 GigabitEthernet2/0/0.150012 200.179.213.10
ip route 201.73.194.0 255.255.255.240 GigabitEthernet2/0/3.421 189.53.11.190
ip route 201.73.194.160 255.255.255.240 GigabitEthernet2/1/0.15064 200.179.213.206
ip route 201.73.194.240 255.255.255.240 GigabitEthernet2/1/0.1503242 200.179.213.246
ip route 201.73.204.160 255.255.255.248 GigabitEthernet2/1/0.1503186 189.52.190.50
ip route 201.73.205.176 255.255.255.240 GigabitEthernet2/0/3.101 200.241.80.230
ip route 201.73.254.80 255.255.255.240 GigabitEthernet2/1/0.1503240 200.179.213.94
ip route 201.73.254.96 255.255.255.240 GigabitEthernet2/1/0.1500229 200.179.213.174
ip route 201.73.254.160 255.255.255.240 GigabitEthernet2/1/0.1509203 200.172.13.110
ip route 201.73.254.176 255.255.255.240 GigabitEthernet2/0/0.1503215 200.179.213.70
ip route 201.90.0.0 255.255.0.0 Null0 tag 200
ip route 201.90.110.208 255.255.255.240 GigabitEthernet2/0/1.15078 200.241.95.234
ip route 203.0.113.0 255.255.255.0 Null0 tag 200
ip route vrf REALIP_CLIENTE:5581 189.3.25.216 255.255.255.248 GigabitEthernet2/1/0.1504156 200.179.126.26
ip route vrf REALIP_CLIENTE:5581 200.172.12.152 255.255.255.252 GigabitEthernet2/0/3.123 200.172.12.54
ip route vrf REALIP_CLIENTE:5581 200.179.126.8 255.255.255.252 GigabitEthernet2/1/0.1501131 200.179.126.6
ip route vrf REALIP_CLIENTE:5581 200.179.126.16 255.255.255.252 GigabitEthernet2/1/0.1501132 200.179.126.14
ip route vrf REALIP_CLIENTE:5581 200.179.126.28 255.255.255.252 GigabitEthernet2/1/0.150724 200.179.228.146
ip route vrf REALIP_CLIENTE:5581 200.179.126.36 255.255.255.252 GigabitEthernet2/1/0.1504161 200.179.126.34
ip route vrf REALIP_CLIENTE:5581 200.179.126.52 255.255.255.252 GigabitEthernet2/1/3.59 200.179.126.50
ip route vrf REALIP_CLIENTE:5581 200.179.126.60 255.255.255.252 GigabitEthernet2/1/0.151018 200.179.126.58
ip route vrf REALIP_CLIENTE:5581 200.179.126.72 255.255.255.252 GigabitEthernet2/1/3.60 200.179.126.70
ip route vrf REALIP_CLIENTE:5581 200.179.126.92 255.255.255.252 GigabitEthernet2/1/0.1504166 200.179.126.90
ip route vrf REALIP_CLIENTE:5581 200.179.126.104 255.255.255.252 GigabitEthernet2/1/3.50 200.179.126.102
ip route vrf REALIP_CLIENTE:5581 200.179.126.112 255.255.255.252 GigabitEthernet2/1/4.51 200.179.126.110
ip route vrf REALIP_CLIENTE:5581 200.179.126.120 255.255.255.252 GigabitEthernet2/1/4.52 200.179.126.118
ip route vrf REALIP_CLIENTE:5581 200.179.126.128 255.255.255.252 GigabitEthernet2/1/0.1501135 200.179.126.126
ip route vrf REALIP_CLIENTE:5581 200.179.126.136 255.255.255.252 GigabitEthernet2/1/3.51 200.179.126.134
ip route vrf REALIP_CLIENTE:5581 200.179.126.144 255.255.255.252 GigabitEthernet2/0/0.150413 200.179.126.142
ip route vrf REALIP_CLIENTE:5581 200.179.126.152 255.255.255.252 GigabitEthernet2/1/0.1504174 200.179.126.150
ip route vrf REALIP_CLIENTE:5581 200.179.126.164 255.255.255.252 GigabitEthernet2/1/0.1504175 200.179.126.162
ip route vrf REALIP_CLIENTE:5581 200.179.126.168 255.255.255.252 GigabitEthernet2/0/3.49 201.45.205.130
ip route vrf REALIP_CLIENTE:5581 200.179.126.180 255.255.255.252 GigabitEthernet2/1/0.1501136 200.179.126.178
ip route vrf REALIP_CLIENTE:5581 200.179.126.188 255.255.255.252 GigabitEthernet2/1/3.61 200.179.126.186
ip route vrf REALIP_CLIENTE:5581 200.179.126.252 255.255.255.252 GigabitEthernet2/1/3.65 200.179.126.250
ip route vrf REALIP_CLIENTE:5581 200.179.212.12 255.255.255.252 GigabitEthernet2/0/3.333 200.172.13.178
ip route vrf REALIP_CLIENTE:5581 200.179.212.188 255.255.255.252 GigabitEthernet2/0/3.304 201.30.37.30
ip route vrf REALIP_CLIENTE:5581 200.179.213.64 255.255.255.252 GigabitEthernet2/1/0.1504109 200.179.213.62
ip route vrf REALIP_CLIENTE:5581 200.179.213.152 255.255.255.252 GigabitEthernet2/1/0.1501102 200.179.213.150
ip route vrf REALIP_CLIENTE:5581 200.179.213.200 255.255.255.252 GigabitEthernet2/1/0.1501103 200.179.213.198
ip route vrf REALIP_CLIENTE:5581 200.179.213.232 255.255.255.252 GigabitEthernet2/0/0.1504216 200.179.213.230
ip route vrf REALIP_CLIENTE:5581 200.179.213.240 255.255.255.252 GigabitEthernet2/1/0.1504114 200.179.213.238
ip route vrf REALIP_CLIENTE:5581 200.179.214.156 255.255.255.252 GigabitEthernet2/1/0.1504172 200.179.214.154
ip route vrf REALIP_CLIENTE:5581 200.179.228.4 255.255.255.252 GigabitEthernet2/0/0.15049 200.179.228.2
ip route vrf REALIP_CLIENTE:5581 200.179.228.12 255.255.255.252 GigabitEthernet2/1/0.150717 200.179.228.10
ip route vrf REALIP_CLIENTE:5581 200.179.228.20 255.255.255.252 GigabitEthernet2/1/0.1504126 200.179.228.18
ip route vrf REALIP_CLIENTE:5581 200.179.228.28 255.255.255.252 GigabitEthernet2/1/0.151325 200.241.95.2
ip route vrf REALIP_CLIENTE:5581 200.179.228.40 255.255.255.252 GigabitEthernet2/1/0.150719 200.179.228.38
ip route vrf REALIP_CLIENTE:5581 200.179.228.48 255.255.255.252 GigabitEthernet2/1/0.1504132 200.179.228.34
ip route vrf REALIP_CLIENTE:5581 200.179.228.60 255.255.255.252 GigabitEthernet2/1/0.1504136 200.179.228.58
ip route vrf REALIP_CLIENTE:5581 200.179.228.68 255.255.255.252 GigabitEthernet2/0/1.15113 200.179.228.66
ip route vrf REALIP_CLIENTE:5581 200.179.228.76 255.255.255.252 GigabitEthernet2/1/0.1504143 200.179.228.74
ip route vrf REALIP_CLIENTE:5581 200.179.228.80 255.255.255.252 GigabitEthernet2/1/0.1501120 200.241.95.166
ip route vrf REALIP_CLIENTE:5581 200.179.228.96 255.255.255.252 GigabitEthernet2/1/0.1501121 200.179.228.94
ip route vrf REALIP_CLIENTE:5581 200.179.228.104 255.255.255.252 GigabitEthernet2/1/0.1504138 200.179.228.102
ip route vrf REALIP_CLIENTE:5581 200.179.228.112 255.255.255.252 GigabitEthernet2/1/0.151013 200.179.228.110
ip route vrf REALIP_CLIENTE:5581 200.179.228.120 255.255.255.252 GigabitEthernet2/1/0.150722 200.179.228.118
ip route vrf REALIP_CLIENTE:5581 200.179.228.128 255.255.255.252 GigabitEthernet2/1/0.1501122 200.179.228.126
ip route vrf REALIP_CLIENTE:5581 200.179.228.140 255.255.255.252 GigabitEthernet2/1/0.1504142 200.179.228.138
ip route vrf REALIP_CLIENTE:5581 200.179.228.156 255.255.255.252 GigabitEthernet2/1/0.151320 200.179.228.154
ip route vrf REALIP_CLIENTE:5581 200.179.228.164 255.255.255.252 GigabitEthernet2/0/3.50 200.179.228.162
ip route vrf REALIP_CLIENTE:5581 200.179.228.168 255.255.255.252 GigabitEthernet2/1/0.151014 200.241.95.46
ip route vrf REALIP_CLIENTE:5581 200.179.228.180 255.255.255.252 GigabitEthernet2/1/0.150721 200.179.228.178
ip route vrf REALIP_CLIENTE:5581 200.179.228.188 255.255.255.252 GigabitEthernet2/1/0.1501126 200.179.228.86
ip route vrf REALIP_CLIENTE:5581 200.179.228.192 255.255.255.252 GigabitEthernet2/1/0.1504150 201.45.205.246
ip route vrf REALIP_CLIENTE:5581 200.179.228.200 255.255.255.252 GigabitEthernet2/1/3.57 200.179.228.198
ip route vrf REALIP_CLIENTE:5581 200.179.228.208 255.255.255.252 GigabitEthernet2/1/0.1504146 200.179.228.206
ip route vrf REALIP_CLIENTE:5581 200.179.228.216 255.255.255.252 GigabitEthernet2/1/0.150715 200.179.228.214
ip route vrf REALIP_CLIENTE:5581 200.179.228.228 255.255.255.252 GigabitEthernet2/1/0.151016 200.179.228.226
ip route vrf REALIP_CLIENTE:5581 200.179.228.244 255.255.255.252 GigabitEthernet2/1/0.1501129 200.179.228.242
ip route vrf REALIP_CLIENTE:5581 200.179.230.16 255.255.255.252 GigabitEthernet2/1/0.1501144 200.179.230.14
ip route vrf REALIP_CLIENTE:5581 200.241.95.48 255.255.255.252 GigabitEthernet2/1/4.2 200.179.213.250
ip route vrf REALIP_CLIENTE:5581 200.241.95.104 255.255.255.252 GigabitEthernet2/1/0.1504104 200.241.95.102
ip route vrf REALIP_CLIENTE:5581 200.241.95.152 255.255.255.252 GigabitEthernet2/1/0.1501113 200.241.95.86
ip route vrf REALIP_CLIENTE:5581 200.241.95.208 255.255.255.252 GigabitEthernet2/1/0.151323 200.179.213.42
ip route vrf REALIP_CLIENTE:5581 200.241.95.236 255.255.255.252 GigabitEthernet2/1/0.150713 200.241.95.62
ip route vrf REALIP_CLIENTE:5581 200.241.95.244 255.255.255.252 GigabitEthernet2/0/0.1504103 200.241.95.242
ip route vrf REALIP_CLIENTE:5581 201.45.205.4 255.255.255.252 GigabitEthernet2/1/0.1504113 201.45.205.2
ip route vrf REALIP_CLIENTE:5581 201.45.205.48 255.255.255.252 GigabitEthernet2/1/0.1501111 201.45.205.46
ip route vrf REALIP_CLIENTE:5581 201.45.205.124 255.255.255.252 GigabitEthernet2/0/0.150116 201.45.205.122
ip route vrf REALIP_CLIENTE:5581 201.45.205.140 255.255.255.252 GigabitEthernet2/0/0.150125 201.45.205.138
ip route vrf REALIP_CLIENTE:5581 201.45.205.156 255.255.255.252 GigabitEthernet2/0/0.15046 201.45.205.154
ip route vrf REALIP_CLIENTE:5581 201.45.205.196 255.255.255.252 GigabitEthernet2/0/0.150126 201.45.205.194
ip route vrf REALIP_CLIENTE:5581 201.45.205.212 255.255.255.252 GigabitEthernet2/1/0.1501107 201.45.205.210
ip route vrf REALIP_CLIENTE:5581 201.45.205.216 255.255.255.252 GigabitEthernet2/1/0.1504131 200.179.213.178
ip route vrf REALIP_CLIENTE:5581 201.45.205.224 255.255.255.252 GigabitEthernet2/1/0.1504118 201.45.205.222
ip route vrf REALIP_CLIENTE:5581 201.45.205.228 255.255.255.252 GigabitEthernet2/1/3.56 200.241.95.118
ip route vrf REALIP_CLIENTE:5581 201.45.205.232 255.255.255.252 GigabitEthernet2/1/0.1504119 201.45.205.234
ip route vrf REALIP_CLIENTE:5581 201.45.205.248 255.255.255.252 GigabitEthernet2/1/0.1501110 201.45.205.206
ip route vrf REALIP_CLIENTE:5581 201.45.221.0 255.255.255.252 GigabitEthernet2/1/3.47 201.45.221.2
ip route vrf REALIP_CLIENTE:5581 201.45.221.24 255.255.255.252 GigabitEthernet2/0/0.150129 201.45.221.22
ip route vrf REALIP_CLIENTE:5581 201.45.221.36 255.255.255.252 GigabitEthernet2/1/0.1504120 201.45.221.34
ip route vrf REALIP_CLIENTE:5581 201.45.221.44 255.255.255.252 GigabitEthernet2/0/0.150121 201.45.221.42
ip route vrf REALIP_CLIENTE:5581 201.45.221.48 255.255.255.252 GigabitEthernet2/1/4.50 200.241.95.170
ip route vrf REALIP_CLIENTE:5581 201.45.221.68 255.255.255.252 GigabitEthernet2/1/0.1504121 201.45.221.66
ip route vrf REALIP_CLIENTE:5581 201.45.221.84 255.255.255.252 GigabitEthernet2/1/3.19 201.45.221.82
ip route vrf REALIP_CLIENTE:5581 201.45.221.92 255.255.255.252 GigabitEthernet2/1/0.151313 201.45.221.90
ip route vrf REALIP_CLIENTE:5581 201.45.221.104 255.255.255.252 GigabitEthernet2/1/0.151314 201.45.221.102
ip route vrf REALIP_CLIENTE:5581 201.45.221.116 255.255.255.252 GigabitEthernet2/0/0.150134 201.45.205.166
ip route vrf REALIP_CLIENTE:5581 201.45.221.120 255.255.255.252 GigabitEthernet2/1/0.1504122 201.45.205.254
ip route vrf REALIP_CLIENTE:5581 201.45.221.132 255.255.255.252 GigabitEthernet2/0/0.150131 201.45.221.130
ip route vrf REALIP_CLIENTE:5581 201.45.221.136 255.255.255.252 GigabitEthernet2/1/0.151316 201.45.221.126
ip route vrf REALIP_CLIENTE:5581 201.45.221.156 255.255.255.252 GigabitEthernet2/1/0.151012 201.45.221.154
ip route vrf REALIP_CLIENTE:5581 201.45.221.164 255.255.255.252 GigabitEthernet2/1/0.150712 201.45.221.162
ip route vrf REALIP_CLIENTE:5581 201.45.221.172 255.255.255.252 GigabitEthernet2/0/0.150133 200.179.213.102
ip route vrf REALIP_CLIENTE:5581 201.45.221.180 255.255.255.252 GigabitEthernet2/1/0.1501108 201.45.221.178
ip route vrf REALIP_CLIENTE:5581 201.45.221.196 255.255.255.252 GigabitEthernet2/0/0.150136 201.45.221.194
ip route vrf REALIP_CLIENTE:5581 201.45.221.216 255.255.255.252 GigabitEthernet2/1/4.12 201.45.221.214
ip route vrf REALIP_CLIENTE:5581 201.45.221.220 255.255.255.252 GigabitEthernet2/1/0.1504125 201.45.221.210
ip route vrf REALIP_CLIENTE:5581 201.45.221.228 255.255.255.252 GigabitEthernet2/1/0.1504123 201.45.221.226
ip route vrf REALIP_CLIENTE:5581 201.45.221.240 255.255.255.252 GigabitEthernet2/1/0.1501114 201.45.221.238
ip route vrf REALIP_CLIENTE:5581 201.45.221.252 255.255.255.252 GigabitEthernet2/1/0.1501124 201.45.221.170
ip route vrf TCU:1628 10.253.52.19 255.255.255.255 GigabitEthernet2/0/4.101 200.241.95.18
ip route vrf TCU:1628 10.253.52.19 255.255.255.255 GigabitEthernet2/1/0.1502301 200.241.95.14
ip route vrf AMAGGI:2738 172.17.103.0 255.255.255.0 GigabitEthernet2/0/0.150222 200.179.213.182
ip route vrf AMAGGI:2738 172.17.112.0 255.255.252.0 GigabitEthernet2/0/0.150222 200.179.213.182
ip route vrf LOCALIZA:1291 10.5.13.0 255.255.255.0 GigabitEthernet2/1/0.1505306 200.209.190.14
ip route vrf LOCALIZA:1291 10.5.14.106 255.255.255.255 GigabitEthernet2/1/0.1505306 200.209.190.14
ip route vrf CGU_NOVA:5325 10.19.0.0 255.255.0.0 GigabitEthernet2/1/0.1505309 201.45.221.110
ip route vrf CGU_NOVA:5325 10.208.44.0 255.255.255.0 GigabitEthernet2/1/0.1505309 201.45.221.110
ip route vrf REDEVIP_BLD_MLPPP:3799 0.0.0.0 0.0.0.0 200.230.224.25 global
ip route vrf REDEVIP_BLD_MLPPP:3799 0.0.0.0 0.0.0.0 200.230.224.45 global
ip route vrf REDEVIP_BLD_MLPPP:3799 0.0.0.0 0.0.0.0 200.244.41.18 global
ip route vrf REDEVIP_BLD_MLPPP:3799 0.0.0.0 0.0.0.0 200.244.41.23 global
ip route vrf REDEVIP_BLD_MLPPP:3799 189.16.255.0 255.255.255.240 GigabitEthernet2/1/0.1503250 201.45.221.114
ip route vrf SERPRO_SLS_RFB_03:5904 10.6.51.229 255.255.255.255 GigabitEthernet2/0/3.15 10.53.2.182
ip route vrf SERPRO_SLS_RFB_03:5904 10.53.93.0 255.255.255.0 GigabitEthernet2/0/3.15 10.53.2.182
ip ospf name-lookup
ip tacacs source-interface Loopback0
!
ip access-list standard SERPRO_BHE
 permit 239.56.0.0 0.0.255.255
ip access-list standard SERPRO_BLM
 permit 239.52.0.0 0.0.255.255
ip access-list standard SERPRO_BSA
 permit 239.51.0.0 0.0.255.255
ip access-list standard SERPRO_CTA
 permit 239.59.0.0 0.0.255.255
ip access-list standard SERPRO_FLA
 permit 239.53.0.0 0.0.255.255
ip access-list standard SERPRO_PAE
 permit 239.60.0.0 0.0.255.255
ip access-list standard SERPRO_RCE
 permit 239.54.0.0 0.0.255.255
ip access-list standard SERPRO_RJO
 permit 239.57.0.0 0.0.255.255
ip access-list standard SERPRO_SDR
 permit 239.55.0.0 0.0.255.255
ip access-list standard SERPRO_SPO
 permit 239.58.0.0 0.0.255.255
!
ip access-list extended CoPP-BACKBONE-management
 remark Host FW-GRC
 permit tcp host 200.214.41.124 any range 22 telnet
 remark Hosts CISCO
 permit tcp host 64.104.3.161 any range 22 telnet
 permit tcp host 64.104.196.21 any range 22 telnet
 permit tcp host 173.38.244.216 any range 22 telnet
 permit tcp host 173.38.245.16 any range 22 telnet
 remark Hosts Brasil-center
 permit tcp host 200.255.220.21 any range 22 telnet
 permit tcp host 200.255.220.22 any range 22 telnet
 remark SubNet NOC/Seguranca
 permit tcp 200.179.210.0 0.0.0.255 any range 22 telnet
 permit tcp 200.255.125.0 0.0.0.255 any range 22 telnet
 permit tcp 200.255.160.0 0.0.0.255 any range 22 telnet
 permit tcp 200.255.218.192 0.0.0.63 any range 22 telnet
 permit tcp 200.255.253.0 0.0.0.255 any range 22 telnet
 permit tcp 200.255.255.64 0.0.0.63 any range 22 telnet
 remark SubNet Config RJO/SPO
 permit tcp 200.245.255.0 0.0.0.255 any range 22 telnet
 permit tcp 200.255.122.0 0.0.0.31 any range 22 telnet
 remark Hosts/Subnets Cisco EPN / Nokia
 permit tcp 200.230.5.0 0.0.0.255 any range 22 telnet
 permit tcp 200.244.11.0 0.0.0.255 any range 22 telnet
 permit tcp 200.230.5.0 0.0.0.255 range 22 telnet any
 permit tcp 200.244.11.0 0.0.0.255 range 22 telnet any
 remark Subnets Peakflow
 permit tcp 200.230.9.0 0.0.0.255 any range 22 telnet
 permit tcp 200.244.9.0 0.0.0.255 any range 22 telnet
 permit tcp 200.244.110.0 0.0.1.255 any range 22 telnet
 permit tcp 200.230.9.0 0.0.0.255 range 22 telnet any
 permit tcp 200.244.9.0 0.0.0.255 range 22 telnet any
 permit tcp 200.244.110.0 0.0.1.255 range 22 telnet any
 remark Subnets Caninho
 permit tcp 200.230.91.0 0.0.0.255 any range 22 telnet
 permit tcp 200.230.92.0 0.0.0.255 any range 22 telnet
 permit tcp 200.230.91.0 0.0.0.255 range 22 telnet any
 permit tcp 200.230.92.0 0.0.0.255 range 22 telnet any
 remark Subnets Loopback0 Backbone
 permit tcp 200.230.16.0 0.0.1.255 any range 22 telnet
 permit tcp 200.230.224.0 0.0.0.255 any range 22 telnet
 permit tcp 200.230.248.0 0.0.1.255 any range 22 telnet
 permit tcp 200.244.17.0 0.0.0.255 any range 22 telnet
 permit tcp 200.244.27.0 0.0.0.255 any range 22 telnet
 permit tcp 200.244.28.0 0.0.1.255 any range 22 telnet
 permit tcp 200.244.41.0 0.0.0.255 any range 22 telnet
 permit tcp 200.230.16.0 0.0.1.255 range 22 telnet any
 permit tcp 200.230.224.0 0.0.0.255 range 22 telnet any
 permit tcp 200.230.248.0 0.0.1.255 range 22 telnet any
 permit tcp 200.244.17.0 0.0.0.255 range 22 telnet any
 permit tcp 200.244.27.0 0.0.0.255 range 22 telnet any
 permit tcp 200.244.28.0 0.0.1.255 range 22 telnet any
 permit tcp 200.244.41.0 0.0.0.255 range 22 telnet any
 remark Subnets Uplinks Backbone
 permit tcp 200.230.0.0 0.0.3.255 any range 22 telnet
 permit tcp 200.230.4.0 0.0.0.255 any range 22 telnet
 permit tcp 200.230.21.0 0.0.0.255 any range 22 telnet
 permit tcp 200.230.24.0 0.0.1.255 any range 22 telnet
 permit tcp 200.230.26.0 0.0.0.255 any range 22 telnet
 permit tcp 200.230.28.0 0.0.1.255 any range 22 telnet
 permit tcp 200.230.130.0 0.0.1.255 any range 22 telnet
 permit tcp 200.230.140.0 0.0.1.255 any range 22 telnet
 permit tcp 200.230.151.0 0.0.0.255 any range 22 telnet
 permit tcp 200.230.156.0 0.0.0.255 any range 22 telnet
 permit tcp 200.230.158.0 0.0.1.255 any range 22 telnet
 permit tcp 200.230.162.0 0.0.0.255 any range 22 telnet
 permit tcp 200.230.211.0 0.0.0.255 any range 22 telnet
 permit tcp 200.230.212.0 0.0.3.255 any range 22 telnet
 permit tcp 200.230.216.0 0.0.0.255 any range 22 telnet
 permit tcp 200.230.218.0 0.0.1.255 any range 22 telnet
 permit tcp 200.230.220.0 0.0.1.255 any range 22 telnet
 permit tcp 200.230.228.0 0.0.3.255 any range 22 telnet
 permit tcp 200.230.232.0 0.0.3.255 any range 22 telnet
 permit tcp 200.230.234.0 0.0.1.255 any range 22 telnet
 permit tcp 200.230.241.0 0.0.0.255 any range 22 telnet
 permit tcp 200.230.242.0 0.0.1.255 any range 22 telnet
 permit tcp 200.230.244.0 0.0.3.255 any range 22 telnet
 permit tcp 200.230.251.0 0.0.0.255 any range 22 telnet
 permit tcp 200.230.252.0 0.0.3.255 any range 22 telnet
 permit tcp 200.230.0.0 0.0.3.255 range 22 telnet any
 permit tcp 200.230.4.0 0.0.0.255 range 22 telnet any
 permit tcp 200.230.21.0 0.0.0.255 range 22 telnet any
 permit tcp 200.230.24.0 0.0.1.255 range 22 telnet any
 permit tcp 200.230.26.0 0.0.0.255 range 22 telnet any
 permit tcp 200.230.28.0 0.0.1.255 range 22 telnet any
 permit tcp 200.230.130.0 0.0.1.255 range 22 telnet any
 permit tcp 200.230.140.0 0.0.1.255 range 22 telnet any
 permit tcp 200.230.151.0 0.0.0.255 range 22 telnet any
 permit tcp 200.230.156.0 0.0.0.255 range 22 telnet any
 permit tcp 200.230.158.0 0.0.1.255 range 22 telnet any
 permit tcp 200.230.162.0 0.0.0.255 range 22 telnet any
 permit tcp 200.230.211.0 0.0.0.255 range 22 telnet any
 permit tcp 200.230.212.0 0.0.3.255 range 22 telnet any
 permit tcp 200.230.216.0 0.0.0.255 range 22 telnet any
 permit tcp 200.230.218.0 0.0.1.255 range 22 telnet any
 permit tcp 200.230.220.0 0.0.1.255 range 22 telnet any
 permit tcp 200.230.228.0 0.0.3.255 range 22 telnet any
 permit tcp 200.230.232.0 0.0.3.255 range 22 telnet any
 permit tcp 200.230.234.0 0.0.1.255 range 22 telnet any
 permit tcp 200.230.241.0 0.0.0.255 range 22 telnet any
 permit tcp 200.230.242.0 0.0.1.255 range 22 telnet any
 permit tcp 200.230.244.0 0.0.3.255 range 22 telnet any
 permit tcp 200.230.251.0 0.0.0.255 range 22 telnet any
 permit tcp 200.230.252.0 0.0.3.255 range 22 telnet any
 permit tcp 200.244.1.0 0.0.0.255 any range 22 telnet
 permit tcp 200.244.3.0 0.0.0.255 any range 22 telnet
 permit tcp 200.244.4.0 0.0.0.255 any range 22 telnet
 permit tcp 200.244.18.0 0.0.1.255 any range 22 telnet
 permit tcp 200.244.21.0 0.0.0.255 any range 22 telnet
 permit tcp 200.244.22.0 0.0.1.255 any range 22 telnet
 permit tcp 200.244.24.0 0.0.1.255 any range 22 telnet
 permit tcp 200.244.40.0 0.0.0.255 any range 22 telnet
 permit tcp 200.244.44.0 0.0.0.255 any range 22 telnet
 permit tcp 200.244.49.0 0.0.0.255 any range 22 telnet
 permit tcp 200.244.63.0 0.0.0.255 any range 22 telnet
 permit tcp 200.244.66.0 0.0.1.255 any range 22 telnet
 permit tcp 200.244.68.0 0.0.1.255 any range 22 telnet
 permit tcp 200.244.74.0 0.0.1.255 any range 22 telnet
 permit tcp 200.244.80.0 0.0.1.255 any range 22 telnet
 permit tcp 200.244.90.0 0.0.0.255 any range 22 telnet
 permit tcp 200.244.140.0 0.0.0.255 any range 22 telnet
 permit tcp 200.244.150.0 0.0.0.255 any range 22 telnet
 permit tcp 200.244.160.0 0.0.0.255 any range 22 telnet
 permit tcp 200.244.162.0 0.0.1.255 any range 22 telnet
 permit tcp 200.244.164.0 0.0.3.255 any range 22 telnet
 permit tcp 200.244.168.0 0.0.3.255 any range 22 telnet
 permit tcp 200.244.172.0 0.0.0.255 any range 22 telnet
 permit tcp 200.244.211.0 0.0.0.255 any range 22 telnet
 permit tcp 200.244.212.0 0.0.3.255 any range 22 telnet
 permit tcp 200.244.216.0 0.0.0.255 any range 22 telnet
 permit tcp 200.244.1.0 0.0.0.255 range 22 telnet any
 permit tcp 200.244.3.0 0.0.0.255 range 22 telnet any
 permit tcp 200.244.4.0 0.0.0.255 range 22 telnet any
 permit tcp 200.244.18.0 0.0.1.255 range 22 telnet any
 permit tcp 200.244.21.0 0.0.0.255 range 22 telnet any
 permit tcp 200.244.22.0 0.0.1.255 range 22 telnet any
 permit tcp 200.244.24.0 0.0.1.255 range 22 telnet any
 permit tcp 200.244.40.0 0.0.0.255 range 22 telnet any
 permit tcp 200.244.44.0 0.0.0.255 range 22 telnet any
 permit tcp 200.244.49.0 0.0.0.255 range 22 telnet any
 permit tcp 200.244.63.0 0.0.0.255 range 22 telnet any
 permit tcp 200.244.66.0 0.0.1.255 range 22 telnet any
 permit tcp 200.244.68.0 0.0.1.255 range 22 telnet any
 permit tcp 200.244.74.0 0.0.1.255 range 22 telnet any
 permit tcp 200.244.80.0 0.0.1.255 range 22 telnet any
 permit tcp 200.244.90.0 0.0.0.255 range 22 telnet any
 permit tcp 200.244.140.0 0.0.0.255 range 22 telnet any
 permit tcp 200.244.150.0 0.0.0.255 range 22 telnet any
 permit tcp 200.244.160.0 0.0.0.255 range 22 telnet any
 permit tcp 200.244.162.0 0.0.1.255 range 22 telnet any
 permit tcp 200.244.164.0 0.0.3.255 range 22 telnet any
 permit tcp 200.244.168.0 0.0.3.255 range 22 telnet any
 permit tcp 200.244.172.0 0.0.0.255 range 22 telnet any
 permit tcp 200.244.211.0 0.0.0.255 range 22 telnet any
 permit tcp 200.244.212.0 0.0.3.255 range 22 telnet any
 permit tcp 200.244.216.0 0.0.0.255 range 22 telnet any
 remark Hosts/Subnets com permissao de acesso SNMP
 permit udp host 200.214.41.124 any eq snmp
 permit udp host 200.179.55.2 any eq snmp
 permit udp 200.179.210.0 0.0.0.255 any eq snmp
 permit udp host 200.246.244.82 any eq snmp
 permit udp 200.255.125.0 0.0.0.255 any eq snmp
 permit udp 200.255.160.0 0.0.0.255 any eq snmp
 permit udp 200.255.218.192 0.0.0.63 any eq snmp
 permit udp 200.255.253.0 0.0.0.255 any eq snmp
 permit udp 200.255.254.0 0.0.0.255 any eq snmp
 permit udp host 200.255.255.67 any eq snmp
 permit udp 200.230.5.0 0.0.0.255 any eq snmp
 permit udp 200.244.11.0 0.0.0.255 any eq snmp
 permit udp 200.230.9.0 0.0.0.255 any eq snmp
 permit udp 200.244.9.0 0.0.0.255 any eq snmp
 permit udp 200.244.110.0 0.0.1.255 any eq snmp
 permit udp host 200.244.162.246 any eq snmp
 permit udp host 200.244.162.250 any eq snmp
 permit udp host 200.244.162.251 any eq snmp
 permit udp host 200.244.163.246 any eq snmp
 permit udp host 200.244.163.250 any eq snmp
 permit udp host 200.244.163.251 any eq snmp
 permit udp host 200.255.251.214 any eq snmp
 permit udp 201.65.190.32 0.0.0.31 any eq snmp
 permit udp host 200.255.253.242 eq ntp any
 permit udp host 200.245.255.33 eq ntp any
 permit udp host 200.255.255.73 eq domain any
 permit udp host 200.255.255.65 eq domain any
 permit udp host 200.255.255.66 eq domain any
 permit udp host 200.255.255.70 eq domain any
 permit udp host 200.255.125.211 eq domain any
 permit tcp 200.255.125.0 0.0.0.255 range ftp-data ftp any
 permit tcp 200.255.253.0 0.0.0.255 range ftp-data ftp any
 permit tcp 200.255.160.0 0.0.0.255 range ftp-data ftp any
 permit tcp 200.179.210.0 0.0.0.255 range ftp-data ftp any
 permit tcp 200.255.218.192 0.0.0.63 range ftp-data ftp any
 permit udp 200.255.253.0 0.0.0.255 eq tftp any
 permit udp 200.255.125.0 0.0.0.255 eq tftp any
 permit udp 200.255.160.0 0.0.0.255 eq tftp any
 permit udp 200.179.210.0 0.0.0.255 eq tftp any
 permit udp 200.255.218.192 0.0.0.63 eq tftp any
 permit udp 200.255.125.0 0.0.0.255 gt 1024 any
 permit tcp 200.255.125.0 0.0.0.255 gt 1024 any
 permit udp 200.255.253.0 0.0.0.255 gt 1024 any
 permit tcp 200.255.253.0 0.0.0.255 gt 1024 any
 permit udp 200.255.160.0 0.0.0.255 gt 1024 any
 permit tcp 200.255.160.0 0.0.0.255 gt 1024 any
 permit udp 200.179.210.0 0.0.0.255 gt 1024 any
 permit tcp 200.179.210.0 0.0.0.255 gt 1024 any
 permit udp 200.255.218.192 0.0.0.63 gt 1024 any
 permit tcp 200.255.218.192 0.0.0.63 gt 1024 any
 permit udp any any range 33434 33534
 permit tcp host 200.255.125.33 any eq cmd
 permit tcp host 200.255.125.60 any eq cmd
 permit tcp host 200.255.125.219 any eq cmd
 permit tcp host 200.255.125.45 any eq cmd
 permit tcp host 200.255.125.56 any eq cmd
 permit tcp host 200.255.253.249 any eq cmd
 permit tcp host 200.255.253.250 any eq cmd
 permit tcp host 200.255.125.33 lt 1024 any lt 1024
 permit tcp host 200.255.125.60 lt 1024 any lt 1024
 permit tcp host 200.255.125.219 lt 1024 any lt 1024
 permit tcp host 200.255.125.45 lt 1024 any lt 1024
 permit tcp host 200.255.125.56 lt 1024 any lt 1024
 permit tcp host 200.255.253.249 lt 1024 any lt 1024
 permit tcp host 200.255.253.250 lt 1024 any lt 1024
 permit udp host 200.230.5.4 eq syslog any
 permit udp host 200.230.5.132 eq syslog any
 permit udp host 200.255.125.217 eq syslog any
 permit udp host 200.255.125.218 eq syslog any
 permit tcp host 200.255.125.216 eq tacacs any
 permit tcp host 200.255.125.215 eq tacacs any
ip access-list extended CoPP-BACKBONE-routing
 permit tcp 200.230.16.0 0.0.0.255 any eq bgp
 permit tcp 200.230.92.0 0.0.0.255 any eq bgp
 permit tcp 200.230.224.0 0.0.0.255 any eq bgp
 permit tcp 200.230.248.0 0.0.1.255 any eq bgp
 permit tcp 200.230.16.0 0.0.0.255 eq bgp any
 permit tcp 200.230.92.0 0.0.0.255 eq bgp any
 permit tcp 200.230.224.0 0.0.0.255 eq bgp any
 permit tcp 200.230.248.0 0.0.1.255 eq bgp any
 permit tcp 200.244.27.0 0.0.0.255 any eq bgp
 permit tcp 200.244.28.0 0.0.1.255 any eq bgp
 permit tcp 200.244.41.0 0.0.0.255 any eq bgp
 permit tcp 200.244.27.0 0.0.0.255 eq bgp any
 permit tcp 200.244.28.0 0.0.1.255 eq bgp any
 permit tcp 200.244.41.0 0.0.0.255 eq bgp any
 permit tcp host 200.230.242.248 eq bgp any
 permit tcp host 200.230.243.249 eq bgp any
 permit tcp host 200.230.242.249 eq bgp any
 permit tcp host 200.230.243.248 eq bgp any
 permit tcp host 200.230.242.250 eq bgp any
 permit tcp host 200.230.243.250 eq bgp any
 permit tcp 201.65.190.32 0.0.0.31 eq bgp any
 permit tcp 200.230.9.0 0.0.0.255 eq bgp any
 permit tcp 200.244.9.0 0.0.0.255 eq bgp any
 permit tcp 200.244.111.0 0.0.0.255 eq bgp any
 permit tcp host 200.244.150.24 eq bgp any
 permit tcp host 200.244.150.25 eq bgp any
 permit tcp host 200.244.150.88 eq bgp any
 permit tcp host 200.244.150.89 eq bgp any
 permit tcp host 200.244.162.244 eq bgp any
 permit tcp host 200.244.162.245 eq bgp any
 permit tcp host 200.244.162.246 eq bgp any
 permit tcp host 200.244.162.247 eq bgp any
 permit tcp host 200.244.163.247 eq bgp any
 permit tcp host 200.244.165.249 eq bgp any
 permit tcp host 200.244.162.252 eq bgp any
 permit tcp host 200.244.164.250 eq bgp any
 permit tcp host 200.244.163.252 eq bgp any
 permit tcp host 200.244.165.250 eq bgp any
 permit tcp host 200.244.162.250 eq bgp any
 permit tcp host 200.244.163.251 eq bgp any
 permit tcp host 200.244.162.251 eq bgp any
 permit tcp host 200.244.163.250 eq bgp any
 permit tcp host 200.244.165.252 eq bgp any
 permit tcp host 200.244.162.248 eq bgp any
 permit tcp host 200.244.163.248 eq bgp any
 permit tcp host 200.244.169.28 eq bgp any
 permit tcp host 200.244.169.27 eq bgp any
 permit tcp host 200.230.243.125 eq bgp any
 permit tcp host 200.230.242.125 eq bgp any
 permit tcp host 200.244.169.60 eq bgp any
 permit tcp host 200.244.169.59 eq bgp any
 permit tcp host 200.244.164.120 eq bgp any
 permit tcp host 200.244.165.120 eq bgp any
 permit tcp host 200.244.165.124 eq bgp any
 permit tcp host 200.244.165.119 eq bgp any
 permit tcp host 200.230.242.248 any eq bgp
 permit tcp host 200.230.243.249 any eq bgp
 permit tcp host 200.230.242.249 any eq bgp
 permit tcp host 200.230.243.248 any eq bgp
 permit tcp host 200.230.242.250 any eq bgp
 permit tcp host 200.230.243.250 any eq bgp
 permit tcp 201.65.190.32 0.0.0.31 any eq bgp
 permit tcp 200.230.9.0 0.0.0.255 any eq bgp
 permit tcp 200.244.9.0 0.0.0.255 any eq bgp
 permit tcp 200.244.111.0 0.0.0.255 any eq bgp
 permit tcp host 200.244.150.24 any eq bgp
 permit tcp host 200.244.150.25 any eq bgp
 permit tcp host 200.244.150.88 any eq bgp
 permit tcp host 200.244.150.89 any eq bgp
 permit tcp host 200.244.162.244 any eq bgp
 permit tcp host 200.244.162.245 any eq bgp
 permit tcp host 200.244.162.246 any eq bgp
 permit tcp host 200.244.162.247 any eq bgp
 permit tcp host 200.244.163.247 any eq bgp
 permit tcp host 200.244.165.249 any eq bgp
 permit tcp host 200.244.162.252 any eq bgp
 permit tcp host 200.244.164.250 any eq bgp
 permit tcp host 200.244.163.252 any eq bgp
 permit tcp host 200.244.165.250 any eq bgp
 permit tcp host 200.244.162.250 any eq bgp
 permit tcp host 200.244.163.251 any eq bgp
 permit tcp host 200.244.162.251 any eq bgp
 permit tcp host 200.244.163.250 any eq bgp
 permit tcp host 200.244.165.252 any eq bgp
 permit tcp host 200.244.162.248 any eq bgp
 permit tcp host 200.244.163.248 any eq bgp
 permit tcp host 200.244.169.28 any eq bgp
 permit tcp host 200.244.169.27 any eq bgp
 permit tcp host 200.230.243.125 any eq bgp
 permit tcp host 200.230.242.125 any eq bgp
 permit tcp host 200.244.169.60 any eq bgp
 permit tcp host 200.244.169.59 any eq bgp
 permit tcp host 200.244.164.120 any eq bgp
 permit tcp host 200.244.165.120 any eq bgp
 permit tcp host 200.244.165.124 any eq bgp
 permit tcp host 200.244.165.119 any eq bgp
 permit ospf 200.244.0.0 0.0.255.255 any
 permit ospf 200.230.0.0 0.0.255.255 any
 permit udp 200.244.0.0 0.0.255.255 any eq 646
 permit udp 200.230.0.0 0.0.255.255 any eq 646
 permit udp 201.125.236.32 0.0.0.31 any eq 646
 permit udp 201.125.237.240 0.0.0.3 any eq 646
 permit udp 201.125.236.32 0.0.0.31 eq 646 any
 permit udp 201.125.237.240 0.0.0.3 eq 646 any
 permit tcp host 201.125.195.243 eq 646 any
 permit tcp host 201.125.195.241 eq 646 any
 permit tcp host 201.125.195.243 any eq 646
 permit tcp host 201.125.195.241 any eq 646
 permit tcp 200.230.16.0 0.0.0.255 any eq 646
 permit tcp 200.230.92.0 0.0.0.255 any eq 646
 permit tcp 200.230.224.0 0.0.0.255 any eq 646
 permit tcp 200.230.248.0 0.0.1.255 any eq 646
 permit tcp 200.230.16.0 0.0.0.255 eq 646 any
 permit tcp 200.230.92.0 0.0.0.255 eq 646 any
 permit tcp 200.230.224.0 0.0.0.255 eq 646 any
 permit tcp 200.230.248.0 0.0.1.255 eq 646 any
 permit tcp 200.244.27.0 0.0.0.255 any eq 646
 permit tcp 200.244.28.0 0.0.1.255 any eq 646
 permit tcp 200.244.41.0 0.0.0.255 any eq 646
 permit tcp 200.244.27.0 0.0.0.255 eq 646 any
 permit tcp 200.244.28.0 0.0.1.255 eq 646 any
 permit tcp 200.244.41.0 0.0.0.255 eq 646 any
 permit 46 200.244.0.0 0.0.255.255 any
 permit 46 200.230.0.0 0.0.255.255 any
 permit udp any any eq 3784
 permit pim 200.244.0.0 0.0.255.255 any
 permit pim 200.230.0.0 0.0.255.255 any
ip access-list extended CoPP-Catch-all-ipv4
 permit tcp any any
 permit udp any any
 permit icmp any any
 permit ip any any
ip access-list extended CoPP-Normal
 permit icmp any any fragments
 permit icmp any any ttl-exceeded
 permit icmp any any traceroute
 permit icmp any any port-unreachable
 permit icmp any any echo-reply
 permit icmp any any echo
 permit icmp any any packet-too-big
 permit ip any any fragments
ip access-list extended CoPP-PE-CE-routing
 permit tcp any eq bgp any
 permit tcp any any eq bgp
 permit udp any host 224.0.0.9 eq rip
 permit pim any any
 permit ospf any any
 permit udp any host 224.0.0.2 eq 1985
 permit 112 any any
 permit igmp any any
 permit eigrp any any
ip access-list extended CoPP-SUSPECT-management
 permit tcp any any range 22 telnet
 permit udp any any eq snmp
 permit udp any any eq ntp
 permit udp any any range 20 21
 permit tcp any any eq cmd
 permit tcp any lt 1024 any lt 1024
ip access-list extended CoPP-Special
 permit gre any any
 permit esp any any
 permit 41 any any
 permit ahp any any
 permit 115 any any
 permit udp any any eq isakmp
 permit udp any eq isakmp any
ip access-list extended CoPP-Undesirable
 permit tcp any any fragments
 permit udp any any fragments
 permit udp any any eq 1434
 permit tcp any any eq bgp rst
ip access-list extended REALIP_EXTRANET_OUT
 permit ip 189.52.61.0 0.0.0.255 any
 permit ip 189.52.62.0 0.0.0.255 any
 permit icmp any any echo
 permit icmp any any echo-reply
 permit icmp any any traceroute
 deny   ip any any
ip access-list extended iACL
 remark iACL Device Hardening
 permit gre any any
 permit esp any any
 permit 41 any any
 permit ahp any any
 permit 115 any any
 permit icmp any any ttl-exceeded
 permit icmp any any traceroute
 permit icmp any any port-unreachable
 permit icmp any any echo-reply
 permit icmp any any echo
 permit icmp any any packet-too-big
 permit tcp any range 22 telnet any gt 1024 established
 remark Hosts/Subnets Cisco EPN / Nokia
 deny   ip any 200.230.5.0 0.0.0.255
 deny   ip any 200.244.11.0 0.0.0.255
 deny   ip 200.230.5.0 0.0.0.255 any
 deny   ip 200.244.11.0 0.0.0.255 any
 remark Subnets Peakflow
 deny   ip any 200.230.7.0 0.0.0.255
 deny   ip any 200.230.9.0 0.0.0.255
 deny   ip any 200.244.7.0 0.0.0.255
 deny   ip any 200.244.9.0 0.0.0.255
 deny   ip any 200.244.110.0 0.0.1.255
 deny   ip 200.230.7.0 0.0.0.255 any
 deny   ip 200.230.9.0 0.0.0.255 any
 deny   ip 200.244.7.0 0.0.0.255 any
 deny   ip 200.244.9.0 0.0.0.255 any
 deny   ip 200.244.110.0 0.0.1.255 any
 remark Subnets Caninho
 deny   ip any 200.230.91.0 0.0.0.255
 deny   ip any 200.230.92.0 0.0.0.255
 deny   ip 200.230.91.0 0.0.0.255 any
 deny   ip 200.230.92.0 0.0.0.255 any
 remark Blocos de Loopbacks
 deny   ip any 200.230.16.0 0.0.1.255
 deny   ip any 200.230.224.0 0.0.0.255
 deny   ip any 200.230.248.0 0.0.1.255
 deny   ip any 200.244.17.0 0.0.0.255
 deny   ip any 200.244.27.0 0.0.0.255
 deny   ip any 200.244.28.0 0.0.1.255
 deny   ip any 200.244.41.0 0.0.0.255
 deny   ip 200.230.16.0 0.0.1.255 any
 deny   ip 200.230.224.0 0.0.0.255 any
 deny   ip 200.230.248.0 0.0.1.255 any
 deny   ip 200.244.17.0 0.0.0.255 any
 deny   ip 200.244.27.0 0.0.0.255 any
 deny   ip 200.244.28.0 0.0.1.255 any
 deny   ip 200.244.41.0 0.0.0.255 any
 remark Blocos Services Loopbacks Mobile
 deny   ip any 200.230.44.0 0.0.1.255
 deny   ip any 200.230.46.0 0.0.0.255
 deny   ip any 200.244.192.0 0.0.1.255
 deny   ip any 200.244.194.0 0.0.0.255
 deny   ip 200.230.44.0 0.0.1.255 any
 deny   ip 200.230.46.0 0.0.0.255 any
 deny   ip 200.244.192.0 0.0.1.255 any
 deny   ip 200.244.194.0 0.0.0.255 any
 remark Blocos MAN/WAN
 deny   ip any 200.230.0.0 0.0.3.255
 deny   ip any 200.230.4.0 0.0.0.255
 deny   ip any 200.230.21.0 0.0.0.255
 deny   ip any 200.230.24.0 0.0.1.255
 deny   ip any 200.230.26.0 0.0.0.255
 deny   ip any 200.230.28.0 0.0.1.255
 deny   ip any 200.230.130.0 0.0.1.255
 deny   ip any 200.230.140.0 0.0.1.255
 deny   ip any 200.230.151.0 0.0.0.255
 deny   ip any 200.230.156.0 0.0.0.255
 deny   ip any 200.230.158.0 0.0.1.255
 deny   ip any 200.230.162.0 0.0.0.255
 deny   ip any 200.230.211.0 0.0.0.255
 deny   ip any 200.230.212.0 0.0.3.255
 deny   ip any 200.230.216.0 0.0.0.255
 deny   ip any 200.230.218.0 0.0.1.255
 deny   ip any 200.230.220.0 0.0.1.255
 deny   ip any 200.230.228.0 0.0.3.255
 deny   ip any 200.230.232.0 0.0.3.255
 deny   ip any 200.230.234.0 0.0.1.255
 deny   ip any 200.230.241.0 0.0.0.255
 deny   ip any 200.230.242.0 0.0.1.255
 deny   ip any 200.230.244.0 0.0.3.255
 deny   ip any 200.230.251.0 0.0.0.255
 deny   ip any 200.230.252.0 0.0.3.255
 deny   ip 200.230.0.0 0.0.3.255 any
 deny   ip 200.230.4.0 0.0.0.255 any
 deny   ip 200.230.21.0 0.0.0.255 any
 deny   ip 200.230.24.0 0.0.1.255 any
 deny   ip 200.230.26.0 0.0.0.255 any
 deny   ip 200.230.28.0 0.0.1.255 any
 deny   ip 200.230.130.0 0.0.1.255 any
 deny   ip 200.230.140.0 0.0.1.255 any
 deny   ip 200.230.151.0 0.0.0.255 any
 deny   ip 200.230.156.0 0.0.0.255 any
 deny   ip 200.230.158.0 0.0.1.255 any
 deny   ip 200.230.162.0 0.0.0.255 any
 deny   ip 200.230.211.0 0.0.0.255 any
 deny   ip 200.230.212.0 0.0.3.255 any
 deny   ip 200.230.216.0 0.0.0.255 any
 deny   ip 200.230.218.0 0.0.1.255 any
 deny   ip 200.230.220.0 0.0.1.255 any
 deny   ip 200.230.228.0 0.0.3.255 any
 deny   ip 200.230.232.0 0.0.3.255 any
 deny   ip 200.230.234.0 0.0.1.255 any
 deny   ip 200.230.241.0 0.0.0.255 any
 deny   ip 200.230.242.0 0.0.1.255 any
 deny   ip 200.230.244.0 0.0.3.255 any
 deny   ip 200.230.251.0 0.0.0.255 any
 deny   ip 200.230.252.0 0.0.3.255 any
 deny   ip any 200.244.1.0 0.0.0.255
 deny   ip any 200.244.3.0 0.0.0.255
 deny   ip any 200.244.4.0 0.0.0.255
 deny   ip any 200.244.18.0 0.0.1.255
 deny   ip any 200.244.21.0 0.0.0.255
 deny   ip any 200.244.22.0 0.0.1.255
 deny   ip any 200.244.24.0 0.0.1.255
 deny   ip any 200.244.40.0 0.0.0.255
 deny   ip any 200.244.44.0 0.0.0.255
 deny   ip any 200.244.49.0 0.0.0.255
 deny   ip any 200.244.63.0 0.0.0.255
 deny   ip any 200.244.66.0 0.0.1.255
 deny   ip any 200.244.68.0 0.0.1.255
 deny   ip any 200.244.74.0 0.0.1.255
 deny   ip any 200.244.80.0 0.0.1.255
 deny   ip any 200.244.90.0 0.0.0.255
 deny   ip any 200.244.140.0 0.0.0.255
 deny   ip any 200.244.150.0 0.0.0.255
 deny   ip any 200.244.160.0 0.0.0.255
 deny   ip any 200.244.162.0 0.0.1.255
 deny   ip any 200.244.164.0 0.0.3.255
 deny   ip any 200.244.168.0 0.0.3.255
 deny   ip any 200.244.172.0 0.0.0.255
 deny   ip any 200.244.211.0 0.0.0.255
 deny   ip any 200.244.212.0 0.0.3.255
 deny   ip any 200.244.216.0 0.0.0.255
 deny   ip 200.244.1.0 0.0.0.255 any
 deny   ip 200.244.3.0 0.0.0.255 any
 deny   ip 200.244.4.0 0.0.0.255 any
 deny   ip 200.244.18.0 0.0.1.255 any
 deny   ip 200.244.21.0 0.0.0.255 any
 deny   ip 200.244.22.0 0.0.1.255 any
 deny   ip 200.244.24.0 0.0.1.255 any
 deny   ip 200.244.40.0 0.0.0.255 any
 deny   ip 200.244.44.0 0.0.0.255 any
 deny   ip 200.244.49.0 0.0.0.255 any
 deny   ip 200.244.63.0 0.0.0.255 any
 deny   ip 200.244.66.0 0.0.1.255 any
 deny   ip 200.244.68.0 0.0.1.255 any
 deny   ip 200.244.74.0 0.0.1.255 any
 deny   ip 200.244.80.0 0.0.1.255 any
 deny   ip 200.244.90.0 0.0.0.255 any
 deny   ip 200.244.140.0 0.0.0.255 any
 deny   ip 200.244.150.0 0.0.0.255 any
 deny   ip 200.244.160.0 0.0.0.255 any
 deny   ip 200.244.162.0 0.0.1.255 any
 deny   ip 200.244.164.0 0.0.3.255 any
 deny   ip 200.244.168.0 0.0.3.255 any
 deny   ip 200.244.172.0 0.0.0.255 any
 deny   ip 200.244.211.0 0.0.0.255 any
 deny   ip 200.244.212.0 0.0.3.255 any
 deny   ip 200.244.216.0 0.0.0.255 any
 remark Deny RFCs 1918 5735 6598
 deny   ip 0.0.0.0 0.255.255.255 any
 deny   ip 10.0.0.0 0.255.255.255 any
 deny   ip 100.64.0.0 0.63.255.255 any
 deny   ip 127.0.0.0 0.255.255.255 any
 deny   ip 169.254.0.0 0.0.255.255 any
 deny   ip 172.16.0.0 0.15.255.255 any
 deny   ip 192.0.0.0 0.0.0.255 any
 deny   ip 192.0.2.0 0.0.0.255 any
 deny   ip 192.88.99.0 0.0.0.255 any
 deny   ip 192.168.0.0 0.0.255.255 any
 deny   ip 198.18.0.0 0.1.255.255 any
 deny   ip 198.51.100.0 0.0.0.255 any
 deny   ip 203.0.113.0 0.0.0.255 any
 deny   ip 224.0.0.0 15.255.255.255 any
 deny   ip 240.0.0.0 15.255.255.255 any
 permit ip any any
!
!
ip prefix-list REDE_IMIFARMA seq 5 permit 0.0.0.0/0 le 32
!
ip prefix-list REDE_SERMA seq 5 permit 0.0.0.0/0
ip prefix-list REDE_SERMA seq 10 permit 172.31.5.250/32
!
ip prefix-list ROTA_DEFAULT seq 5 permit 0.0.0.0/0
logging esm config
logging trap debugging
logging source-interface Loopback0
logging 200.255.125.217
logging 200.255.125.218
logging 200.230.5.4
logging 200.230.5.132
access-list 1 deny   0.0.0.0
access-list 1 deny   10.0.0.0 0.255.255.255
access-list 1 deny   172.16.0.0 0.15.255.255
access-list 1 deny   187.28.0.0 0.0.255.255
access-list 1 deny   187.29.0.0 0.0.255.255
access-list 1 deny   187.30.0.0 0.0.255.255
access-list 1 deny   189.2.0.0 0.0.255.255
access-list 1 deny   189.3.0.0 0.0.255.255
access-list 1 deny   189.16.0.0 0.0.255.255
access-list 1 deny   189.17.0.0 0.0.255.255
access-list 1 deny   189.22.0.0 0.0.255.255
access-list 1 deny   189.23.0.0 0.0.255.255
access-list 1 deny   189.42.0.0 0.0.255.255
access-list 1 deny   189.43.0.0 0.0.255.255
access-list 1 deny   189.52.0.0 0.0.255.255
access-list 1 deny   189.53.0.0 0.0.255.255
access-list 1 deny   189.86.0.0 0.0.255.255
access-list 1 deny   189.87.0.0 0.0.255.255
access-list 1 deny   189.88.0.0 0.0.255.255
access-list 1 deny   192.168.0.0 0.0.255.255
access-list 1 deny   200.10.159.0 0.0.0.255
access-list 1 deny   200.166.0.0 0.0.255.255
access-list 1 deny   200.167.0.0 0.0.255.255
access-list 1 deny   200.172.0.0 0.0.255.255
access-list 1 deny   200.174.0.0 0.0.255.255
access-list 1 deny   200.178.0.0 0.0.255.255
access-list 1 deny   200.179.0.0 0.0.255.255
access-list 1 deny   200.182.0.0 0.0.255.255
access-list 1 deny   200.183.0.0 0.0.255.255
access-list 1 deny   200.200.0.0 0.0.255.255
access-list 1 deny   200.208.0.0 0.0.255.255
access-list 1 deny   200.209.0.0 0.0.255.255
access-list 1 deny   200.210.0.0 0.0.255.255
access-list 1 deny   200.211.0.0 0.0.255.255
access-list 1 deny   200.212.0.0 0.0.255.255
access-list 1 deny   200.213.0.0 0.0.255.255
access-list 1 deny   200.214.0.0 0.0.255.255
access-list 1 deny   200.228.0.0 0.0.255.255
access-list 1 deny   200.230.0.0 0.0.255.255
access-list 1 deny   200.231.0.0 0.0.255.255
access-list 1 deny   200.241.0.0 0.0.255.255
access-list 1 deny   200.242.0.0 0.0.255.255
access-list 1 deny   200.243.0.0 0.0.255.255
access-list 1 deny   200.244.0.0 0.0.255.255
access-list 1 deny   200.245.0.0 0.0.255.255
access-list 1 deny   200.246.0.0 0.0.255.255
access-list 1 deny   200.247.0.0 0.0.255.255
access-list 1 deny   200.248.0.0 0.0.255.255
access-list 1 deny   200.249.0.0 0.0.255.255
access-list 1 deny   200.250.0.0 0.0.255.255
access-list 1 deny   200.251.0.0 0.0.255.255
access-list 1 deny   200.252.0.0 0.0.255.255
access-list 1 deny   200.253.0.0 0.0.255.255
access-list 1 deny   200.254.0.0 0.0.255.255
access-list 1 deny   200.255.0.0 0.0.255.255
access-list 1 deny   201.30.0.0 0.0.255.255
access-list 1 deny   201.31.0.0 0.0.255.255
access-list 1 deny   201.38.0.0 0.0.255.255
access-list 1 deny   201.39.0.0 0.0.255.255
access-list 1 deny   201.44.0.0 0.0.255.255
access-list 1 deny   201.45.0.0 0.0.255.255
access-list 1 deny   201.56.0.0 0.0.255.255
access-list 1 deny   201.57.0.0 0.0.255.255
access-list 1 deny   201.64.0.0 0.0.255.255
access-list 1 deny   201.65.0.0 0.0.255.255
access-list 1 deny   201.72.0.0 0.0.255.255
access-list 1 deny   201.73.0.0 0.0.255.255
access-list 1 deny   201.90.0.0 0.0.255.255
access-list 1 permit any
access-list 11 remark Hosts NOC EMBRATEL
access-list 11 permit 200.255.253.250
access-list 11 permit 200.255.125.20
access-list 11 permit 200.255.125.56
access-list 11 permit 200.255.125.60
access-list 11 permit 200.255.125.219
access-list 11 permit 200.255.253.31
access-list 11 permit 200.255.254.30
access-list 11 remark Host EPN RJOAM e RJOEN
access-list 11 permit 200.230.5.0 0.0.0.255
access-list 11 permit 200.244.11.0 0.0.0.255
access-list 12 remark Host FW-GRC
access-list 12 permit 200.214.41.124
access-list 12 permit 173.38.245.16
access-list 12 remark Hosts CISCO
access-list 12 permit 64.104.3.161
access-list 12 remark Host Cisco NatKit/CNC
access-list 12 permit 200.255.255.67
access-list 12 permit 173.38.244.216
access-list 12 permit 64.104.196.21
access-list 12 remark Hosts Brasil-center
access-list 12 permit 200.255.220.22
access-list 12 permit 200.255.220.21
access-list 12 remark SubNet NOC
access-list 12 permit 200.255.125.0 0.0.0.255
access-list 12 permit 200.255.253.0 0.0.0.255
access-list 12 permit 200.255.254.0 0.0.0.255
access-list 12 remark Subnet Seguranca
access-list 12 permit 200.255.160.0 0.0.0.255
access-list 12 permit 200.179.210.0 0.0.0.255
access-list 12 permit 200.255.218.192 0.0.0.63
access-list 12 remark SubNet Config SPO
access-list 12 permit 200.245.255.0 0.0.0.255
access-list 12 remark SubNet Config RJO
access-list 12 permit 200.255.122.0 0.0.0.31
access-list 12 remark Hosts/Subnets Cisco EPN / Nokia
access-list 12 permit 200.230.5.0 0.0.0.255
access-list 12 permit 200.244.11.0 0.0.0.255
access-list 12 remark Subnets Peakflow
access-list 12 permit 200.230.9.0 0.0.0.255
access-list 12 permit 200.244.9.0 0.0.0.255
access-list 12 permit 200.244.110.0 0.0.1.255
access-list 12 remark Subnets Caninho
access-list 12 permit 200.230.91.0 0.0.0.255
access-list 12 permit 200.230.92.0 0.0.0.255
access-list 12 remark Subnets Loopback0 Backbone
access-list 12 permit 200.230.16.0 0.0.1.255
access-list 12 permit 200.230.224.0 0.0.0.255
access-list 12 permit 200.230.248.0 0.0.1.255
access-list 12 permit 200.244.17.0 0.0.0.255
access-list 12 permit 200.244.27.0 0.0.0.255
access-list 12 permit 200.244.28.0 0.0.1.255
access-list 12 permit 200.244.41.0 0.0.0.255
access-list 12 remark Subnets Uplinks Backbone
access-list 12 permit 200.230.0.0 0.0.3.255
access-list 12 permit 200.230.4.0 0.0.0.255
access-list 12 permit 200.230.21.0 0.0.0.255
access-list 12 permit 200.230.24.0 0.0.1.255
access-list 12 permit 200.230.26.0 0.0.0.255
access-list 12 permit 200.230.28.0 0.0.1.255
access-list 12 permit 200.230.130.0 0.0.1.255
access-list 12 permit 200.230.140.0 0.0.1.255
access-list 12 permit 200.230.151.0 0.0.0.255
access-list 12 permit 200.230.156.0 0.0.0.255
access-list 12 permit 200.230.158.0 0.0.1.255
access-list 12 permit 200.230.162.0 0.0.0.255
access-list 12 permit 200.230.211.0 0.0.0.255
access-list 12 permit 200.230.212.0 0.0.3.255
access-list 12 permit 200.230.216.0 0.0.0.255
access-list 12 permit 200.230.218.0 0.0.1.255
access-list 12 permit 200.230.220.0 0.0.1.255
access-list 12 permit 200.230.228.0 0.0.3.255
access-list 12 permit 200.230.232.0 0.0.3.255
access-list 12 permit 200.230.234.0 0.0.1.255
access-list 12 permit 200.230.241.0 0.0.0.255
access-list 12 permit 200.230.242.0 0.0.1.255
access-list 12 permit 200.230.244.0 0.0.3.255
access-list 12 permit 200.230.251.0 0.0.0.255
access-list 12 permit 200.230.252.0 0.0.3.255
access-list 12 permit 200.244.1.0 0.0.0.255
access-list 12 permit 200.244.3.0 0.0.0.255
access-list 12 permit 200.244.4.0 0.0.0.255
access-list 12 permit 200.244.18.0 0.0.1.255
access-list 12 permit 200.244.21.0 0.0.0.255
access-list 12 permit 200.244.22.0 0.0.1.255
access-list 12 permit 200.244.24.0 0.0.1.255
access-list 12 permit 200.244.40.0 0.0.0.255
access-list 12 permit 200.244.44.0 0.0.0.255
access-list 12 permit 200.244.49.0 0.0.0.255
access-list 12 permit 200.244.63.0 0.0.0.255
access-list 12 permit 200.244.66.0 0.0.1.255
access-list 12 permit 200.244.68.0 0.0.1.255
access-list 12 permit 200.244.74.0 0.0.1.255
access-list 12 permit 200.244.80.0 0.0.1.255
access-list 12 permit 200.244.90.0 0.0.0.255
access-list 12 permit 200.244.140.0 0.0.0.255
access-list 12 permit 200.244.150.0 0.0.0.255
access-list 12 permit 200.244.160.0 0.0.0.255
access-list 12 permit 200.244.162.0 0.0.1.255
access-list 12 permit 200.244.164.0 0.0.3.255
access-list 12 permit 200.244.168.0 0.0.3.255
access-list 12 permit 200.244.172.0 0.0.0.255
access-list 12 permit 200.244.211.0 0.0.0.255
access-list 12 permit 200.244.212.0 0.0.3.255
access-list 12 permit 200.244.216.0 0.0.0.255
access-list 13 permit 200.255.251.214
access-list 13 remark Hosts/Subnets com permissao de acesso SNMP
access-list 13 remark Hosts GRC
access-list 13 permit 200.214.41.124
access-list 13 remark Hosts/Subnets Servidores/Infra
access-list 13 permit 200.179.55.2
access-list 13 permit 200.244.162.250
access-list 13 permit 200.244.163.251
access-list 13 permit 200.244.162.251
access-list 13 permit 200.244.163.250
access-list 13 permit 200.244.162.246
access-list 13 permit 200.244.163.246
access-list 13 permit 200.255.255.67
access-list 13 permit 200.246.244.82
access-list 13 permit 200.179.210.0 0.0.0.255
access-list 13 permit 200.255.125.0 0.0.0.255
access-list 13 permit 200.255.160.0 0.0.0.255
access-list 13 permit 200.255.218.192 0.0.0.63
access-list 13 permit 200.255.253.0 0.0.0.255
access-list 13 permit 200.255.254.0 0.0.0.255
access-list 13 remark Hosts/Subnets Cisco EPN / Nokia
access-list 13 permit 200.230.5.0 0.0.0.255
access-list 13 permit 200.244.11.0 0.0.0.255
access-list 13 remark Hosts/Subnets PeakFlow
access-list 13 permit 200.230.9.0 0.0.0.255
access-list 13 permit 200.244.9.0 0.0.0.255
access-list 13 permit 200.244.110.0 0.0.1.255
access-list 13 permit 201.65.190.32 0.0.0.31
access-list 14 permit 200.255.125.20
access-list 14 remark Hosts Cariden-MATE e GRB-TE
access-list 14 permit 200.255.253.31
access-list 14 permit 200.255.254.30
access-list 14 remark Subnets Cisco EPN / Nokia
access-list 14 permit 200.230.5.0 0.0.0.255
access-list 14 permit 200.244.11.0 0.0.0.255
access-list 50 permit 200.255.254.217
access-list 50 permit 200.255.254.218
access-list 50 permit 200.255.125.97
access-list 50 permit 200.255.125.20
access-list 69 permit 200.255.125.0 0.0.0.255
access-list 99 permit 239.232.0.0 0.0.255.255
access-list 99 permit 239.233.0.0 0.0.255.255
access-list 2550 deny   ip host 0.0.0.0 host 255.255.255.255
access-list 2550 deny   ip 10.0.0.0 0.255.255.255 any
access-list 2550 deny   ip 172.16.0.0 0.15.255.255 any
access-list 2550 deny   ip 187.28.0.0 0.0.255.255 host 255.255.0.0
access-list 2550 deny   ip 187.29.0.0 0.0.255.255 host 255.255.0.0
access-list 2550 deny   ip 187.30.0.0 0.0.255.255 host 255.255.0.0
access-list 2550 deny   ip 189.2.0.0 0.0.255.255 host 255.255.0.0
access-list 2550 deny   ip 189.3.0.0 0.0.255.255 host 255.255.0.0
access-list 2550 deny   ip 189.16.0.0 0.0.255.255 host 255.255.0.0
access-list 2550 deny   ip 189.17.0.0 0.0.255.255 host 255.255.0.0
access-list 2550 deny   ip 189.22.0.0 0.0.255.255 host 255.255.0.0
access-list 2550 deny   ip 189.23.0.0 0.0.255.255 host 255.255.0.0
access-list 2550 deny   ip 189.42.0.0 0.0.255.255 host 255.255.0.0
access-list 2550 deny   ip 189.43.0.0 0.0.255.255 host 255.255.0.0
access-list 2550 deny   ip 189.52.0.0 0.0.255.255 host 255.255.0.0
access-list 2550 deny   ip 189.53.0.0 0.0.255.255 host 255.255.0.0
access-list 2550 deny   ip 189.86.0.0 0.0.255.255 host 255.255.0.0
access-list 2550 deny   ip 189.87.0.0 0.0.255.255 host 255.255.0.0
access-list 2550 deny   ip 189.88.0.0 0.0.255.255 host 255.255.0.0
access-list 2550 deny   ip 192.168.0.0 0.0.255.255 any
access-list 2550 deny   ip 200.244.161.0 0.0.0.255 any
access-list 2550 deny   ip 200.230.2.0 0.0.0.255 any
access-list 2550 deny   ip 200.10.159.0 0.0.0.255 host 255.255.255.0
access-list 2550 deny   ip 200.166.0.0 0.0.255.255 host 255.255.0.0
access-list 2550 deny   ip 200.167.0.0 0.0.255.255 host 255.255.0.0
access-list 2550 deny   ip 200.172.0.0 0.0.255.255 host 255.255.0.0
access-list 2550 deny   ip 200.174.0.0 0.0.255.255 host 255.255.0.0
access-list 2550 deny   ip 200.178.0.0 0.0.255.255 host 255.255.0.0
access-list 2550 deny   ip 200.179.0.0 0.0.255.255 host 255.255.0.0
access-list 2550 deny   ip 200.182.0.0 0.0.255.255 host 255.255.0.0
access-list 2550 deny   ip 200.183.0.0 0.0.255.255 host 255.255.0.0
access-list 2550 deny   ip 200.191.0.0 0.0.255.255 host 255.255.0.0
access-list 2550 deny   ip 200.200.0.0 0.0.255.255 host 255.255.0.0
access-list 2550 deny   ip 200.208.0.0 0.0.255.255 host 255.255.0.0
access-list 2550 deny   ip 200.209.0.0 0.0.255.255 host 255.255.0.0
access-list 2550 deny   ip 200.210.0.0 0.0.255.255 host 255.255.0.0
access-list 2550 deny   ip 200.211.0.0 0.0.255.255 host 255.255.0.0
access-list 2550 deny   ip 200.212.0.0 0.0.255.255 host 255.255.0.0
access-list 2550 deny   ip 200.213.0.0 0.0.255.255 host 255.255.0.0
access-list 2550 deny   ip 200.214.0.0 0.0.255.255 host 255.255.0.0
access-list 2550 deny   ip 200.227.0.0 0.0.255.255 host 255.255.0.0
access-list 2550 deny   ip 200.228.0.0 0.0.255.255 host 255.255.0.0
access-list 2550 deny   ip 200.230.0.0 0.0.255.255 host 255.255.0.0
access-list 2550 deny   ip 200.231.0.0 0.0.255.255 host 255.255.0.0
access-list 2550 deny   ip 200.241.0.0 0.0.255.255 host 255.255.0.0
access-list 2550 deny   ip 200.242.0.0 0.0.255.255 host 255.255.0.0
access-list 2550 deny   ip 200.243.0.0 0.0.255.255 host 255.255.0.0
access-list 2550 deny   ip 200.244.0.0 0.0.255.255 host 255.255.0.0
access-list 2550 deny   ip 200.245.0.0 0.0.255.255 host 255.255.0.0
access-list 2550 deny   ip 200.246.0.0 0.0.255.255 host 255.255.0.0
access-list 2550 deny   ip 200.247.0.0 0.0.255.255 host 255.255.0.0
access-list 2550 deny   ip 200.248.0.0 0.0.255.255 host 255.255.0.0
access-list 2550 deny   ip 200.249.0.0 0.0.255.255 host 255.255.0.0
access-list 2550 deny   ip 200.250.0.0 0.0.255.255 host 255.255.0.0
access-list 2550 deny   ip 200.251.0.0 0.0.255.255 host 255.255.0.0
access-list 2550 deny   ip 200.252.0.0 0.0.255.255 host 255.255.0.0
access-list 2550 deny   ip 200.253.0.0 0.0.255.255 host 255.255.0.0
access-list 2550 deny   ip 200.254.0.0 0.0.255.255 host 255.255.0.0
access-list 2550 deny   ip 200.255.0.0 0.0.255.255 host 255.255.0.0
access-list 2550 deny   ip 201.39.0.0 0.0.255.255 host 255.255.0.0
access-list 2550 deny   ip 201.65.0.0 0.0.255.255 host 255.255.0.0
access-list 2550 deny   ip 201.72.0.0 0.0.255.255 host 255.255.0.0
access-list 2550 deny   ip 201.73.0.0 0.0.255.255 host 255.255.0.0
access-list 2550 deny   ip 201.30.0.0 0.0.255.255 host 255.255.0.0
access-list 2550 deny   ip 201.31.0.0 0.0.255.255 host 255.255.0.0
access-list 2550 deny   ip 201.38.0.0 0.0.255.255 host 255.255.0.0
access-list 2550 deny   ip 201.44.0.0 0.0.255.255 host 255.255.0.0
access-list 2550 deny   ip 201.45.0.0 0.0.255.255 host 255.255.0.0
access-list 2550 deny   ip 201.56.0.0 0.0.255.255 host 255.255.0.0
access-list 2550 deny   ip 201.57.0.0 0.0.255.255 host 255.255.0.0
access-list 2550 deny   ip 201.64.0.0 0.0.255.255 host 255.255.0.0
access-list 2550 deny   ip 201.90.0.0 0.0.255.255 host 255.255.0.0
access-list 2550 permit ip any any
ipv6 route ::FFFF:200.10.159.254/128 Null0 tag 200
ipv6 route 2001:DB8::/32 Null0 tag 200
ipv6 route 2804:A8::/32 Null0 tag 200
ipv6 route FC00::/7 Null0 tag 200
ipv6 route FEC0::/10 Null0 tag 200
!
!
ipv6 prefix-list PREFIXOS_IPV6_CLIENTES_IN seq 5 deny ::/0
ipv6 prefix-list PREFIXOS_IPV6_CLIENTES_IN seq 10 deny ::1/128
ipv6 prefix-list PREFIXOS_IPV6_CLIENTES_IN seq 15 deny ::/128
ipv6 prefix-list PREFIXOS_IPV6_CLIENTES_IN seq 20 deny ::/96
ipv6 prefix-list PREFIXOS_IPV6_CLIENTES_IN seq 25 deny ::FFFF:0.0.0.0/96
ipv6 prefix-list PREFIXOS_IPV6_CLIENTES_IN seq 30 deny ::/8 le 128
ipv6 prefix-list PREFIXOS_IPV6_CLIENTES_IN seq 35 deny FE80::/10 le 128
ipv6 prefix-list PREFIXOS_IPV6_CLIENTES_IN seq 40 deny FEC0::/10 le 128
ipv6 prefix-list PREFIXOS_IPV6_CLIENTES_IN seq 45 deny FC00::/7 le 128
ipv6 prefix-list PREFIXOS_IPV6_CLIENTES_IN seq 50 deny FF00::/8 le 128
ipv6 prefix-list PREFIXOS_IPV6_CLIENTES_IN seq 55 deny 2001:DB8::/32 le 128
ipv6 prefix-list PREFIXOS_IPV6_CLIENTES_IN seq 60 deny 2804:A8::/32 le 128
ipv6 prefix-list PREFIXOS_IPV6_CLIENTES_IN seq 65 permit ::/0 le 128
!
ipv6 prefix-list PREFIXO_IPV6_CONNECTED_TO_BGP seq 5 permit 2804:A8::/32 ge 48
route-map REALIP_CLIENTE permit 10
 set community 4230:5581
!
route-map R_M_M_S_DE_OLIVEIRA_IN permit 10
 match as-path 118
 set community 4230:21 4230:30 4230:198
!
route-map CEUMA_IN permit 10
 match as-path 104
 set community 4230:11 4230:30 4230:195
!
route-map BBRASIL_CE_OUT permit 10
 match community 421
!
route-map RM_ECT_CONNECTED permit 10
 set community 0:2120
!
route-map TELECOMLTDAME_IN permit 10
 match as-path 124
 set community 4230:21 4230:30 4230:198 additive
!
route-map PARTIAL-ROUTING_OUT_IPV6 deny 10
 match community 50
!
route-map PARTIAL-ROUTING_OUT_IPV6 permit 20
 match community 2 3 5
!
route-map STATIC deny 5
 match tag 200
!
route-map STATIC permit 10
 match ip address 2550
 set origin igp
 set community 4230:50 4230:198
!
route-map NO-ROUTES deny 10
!
route-map IBGP_BLACKHOLE-NAC_IN permit 10
 match community BLACKHOLE-NAC-CLIENTE BLACKHOLE-NAC-EBT
 set ip next-hop 200.10.159.254
!
route-map IBGP_BLACKHOLE-NAC_IN permit 20
!
route-map PARTIAL-ROUTING_OUT deny 10
 match community 50
!
route-map PARTIAL-ROUTING_OUT permit 20
 match community 5
!
route-map PARTIAL-ROUTING_OUT permit 30
 match community 2 3
!
route-map NO-ROUTES_OUT deny 10
!
route-map CONNECTED_TO_BGP_IPV6 permit 10
 match ipv6 address prefix-list PREFIXO_IPV6_CONNECTED_TO_BGP
 set origin igp
 set community 4230:21 4230:50 4230:198
!
route-map BB-LT2-NAC-REMOTOS-IN permit 10
 match community 442
!
route-map BB-LT3-NAC-REMOTOS-IN permit 10
 match community 444
!
route-map SPEEDNET_IN permit 10
 match as-path 115
 set community 4230:21 4230:30 4230:198
!
route-map OLC_SERVICOS_IN permit 10
 match as-path 117
 set community 4230:21 4230:30 4230:198 additive
!
route-map IMP_SERMA permit 10
 match ip address prefix-list REDE_SERMA
 match extcommunity 185
!
route-map IMP_SERMA permit 20
 match ip address prefix-list REDE_IMIFARMA
 match extcommunity 186
!
route-map REDE_BJNET_IN permit 10
 match as-path 123
 set community 4230:21 4230:30 4230:198
!
route-map VIACOM_IN permit 10
 match as-path 116
 set community 4230:21 4230:30 4230:198 additive
!
route-map LATAM_TELMEX_286, permit 10
!
route-map CLIENTES_IPv4_RANGE_PROPRIO_COMMON_POLICY_IN permit 5
 continue 10
 set community 4230:11 4230:113
!
route-map CLIENTES_IPv4_RANGE_PROPRIO_COMMON_POLICY_IN permit 10
 match community BLACKHOLE-NAC-CLIENTE
 set local-preference 120
 set weight 65535
 set community 4230:50 4230:10000 additive
 set ip next-hop 200.10.159.254
!
route-map CLIENTES_IPv4_RANGE_PROPRIO_COMMON_POLICY_IN permit 20
 match community BLACKHOLE-MIA-CLIENTE
 set local-preference 120
 set weight 65535
 set community 4230:50 4230:10004 additive
!
route-map CLIENTES_IPv4_RANGE_PROPRIO_COMMON_POLICY_IN permit 30
 match community BLACKHOLE-INTL-CLIENTE
 set local-preference 120
 set weight 65535
 set community 4230:50 4230:10002 additive
!
route-map CLIENTES_IPv4_RANGE_PROPRIO_COMMON_POLICY_IN permit 100
 match community 80
 continue 200
 set local-preference 80
 set community 4230:80 additive
!
route-map CLIENTES_IPv4_RANGE_PROPRIO_COMMON_POLICY_IN permit 110
 match community 120
 continue 200
 set local-preference 120
 set community 4230:120 additive
!
route-map CLIENTES_IPv4_RANGE_PROPRIO_COMMON_POLICY_IN permit 200
 match community 61
 continue 300
 set community 4230:61 additive
!
route-map CLIENTES_IPv4_RANGE_PROPRIO_COMMON_POLICY_IN permit 210
 match community 62
 continue 300
 set community 4230:62 additive
!
route-map CLIENTES_IPv4_RANGE_PROPRIO_COMMON_POLICY_IN permit 220
 match community 63
 continue 300
 set community 4230:63 additive
!
route-map CLIENTES_IPv4_RANGE_PROPRIO_COMMON_POLICY_IN permit 300
 match community 30
 set community 4230:30 additive
!
route-map CLIENTES_IPv4_RANGE_PROPRIO_COMMON_POLICY_IN permit 310
 match community 31
 set community 4230:31 additive
!
route-map CLIENTES_IPv4_RANGE_PROPRIO_COMMON_POLICY_IN permit 320
 match community 32
 set community 4230:32 additive
!
route-map CLIENTES_IPv4_RANGE_PROPRIO_COMMON_POLICY_IN permit 330
 match community 33
 set community 4230:33 additive
!
route-map CLIENTES_IPv4_RANGE_PROPRIO_COMMON_POLICY_IN permit 340
 match community 4
 set community 4230:4 additive
!
route-map CLIENTES_IPv4_RANGE_PROPRIO_COMMON_POLICY_IN permit 350
 set community 4230:30 additive
!
route-map LUCENA_IN permit 10
 match as-path 122
 set community 4230:21 4230:30 4230:198
!
route-map BBRASIL_MARCA_SOO permit 10
 set extcommunity soo 65521:1
!
route-map DEFAULT_ROUTE permit 10
 set community 4230:50
!
route-map NEGA_ROTA_DEFAULT deny 10
 match ip address prefix-list ROTA_DEFAULT
!
route-map NEGA_ROTA_DEFAULT permit 20
!
route-map DNPM_EXPORT_MAP permit 20
 match community VRF_DNPM_VOIP
 set extcommunity rt 4230:153482
!
route-map DNPM_EXPORT_MAP permit 40
!
route-map SBC_CLIENTE permit 10
 set community 4230:3108
!
route-map FULL-ROUTING_OUT_IPV6 deny 10
 match community 50
!
route-map FULL-ROUTING_OUT_IPV6 permit 20
 match community 1 2 3 5
!
route-map LAURIA_IN permit 10
 match as-path 120
 set community 4230:21 4230:30 4230:198
!
route-map COELHOEFERNANDES_IN permit 10
 match as-path 121
 set community 4230:21 4230:30 4230:198
!
route-map SIVNET_BLD_IN permit 10
 match as-path 120
 set community 4230:21 4230:30 4230:31 4230:198
!
route-map CONNECTED permit 10
 match ip address 2550
 set origin igp
 set community 4230:50 4230:198
!
route-map LATAM_TELMEX_286 permit 10
 set community 28513:286 28513:1281
!
route-map LATAM_TELMEX_285 permit 10
 set community 28513:285 28513:1281
!
route-map IBGP_RR-CLIENT_PARTIAL_OUT permit 10
 match as-path 1
!
route-map IBGP_RR-CLIENT_PARTIAL_OUT permit 20
 match community 2 3 4
!
route-map CLIENTES_IPV6_RANGE_PROPRIO_COMMON_POLICY_IN permit 5
 continue 10
 set community 4230:21 4230:198
!
route-map CLIENTES_IPV6_RANGE_PROPRIO_COMMON_POLICY_IN permit 10
 match community BLACKHOLE-NAC-EDGE-CLIENTE
 set local-preference 120
 set weight 65535
 set community 4230:50 4230:10000 additive
 set ipv6 next-hop ::FFFF:200.10.159.254
!
route-map CLIENTES_IPV6_RANGE_PROPRIO_COMMON_POLICY_IN permit 20
 match community BLACKHOLE-NAC-INTL-CLIENTE
 set local-preference 120
 set weight 65535
 set community 4230:50 4230:10004 additive
!
route-map CLIENTES_IPV6_RANGE_PROPRIO_COMMON_POLICY_IN permit 30
 match community BLACKHOLE-INTERNAC-CLIENTE
 set local-preference 120
 set weight 65535
 set community 4230:50 4230:10002 additive
!
route-map CLIENTES_IPV6_RANGE_PROPRIO_COMMON_POLICY_IN permit 100
 match community 80
 continue 200
 set local-preference 80
 set community 4230:80 additive
!
route-map CLIENTES_IPV6_RANGE_PROPRIO_COMMON_POLICY_IN permit 110
 match community 120
 continue 200
 set local-preference 120
 set community 4230:120 additive
!
route-map CLIENTES_IPV6_RANGE_PROPRIO_COMMON_POLICY_IN permit 200
 match community 61
 continue 300
 set community 4230:61 additive
!
route-map CLIENTES_IPV6_RANGE_PROPRIO_COMMON_POLICY_IN permit 210
 match community 62
 continue 300
 set community 4230:62 additive
!
route-map CLIENTES_IPV6_RANGE_PROPRIO_COMMON_POLICY_IN permit 220
 match community 63
 continue 300
 set community 4230:63 additive
!
route-map CLIENTES_IPV6_RANGE_PROPRIO_COMMON_POLICY_IN permit 300
 match community 30
 set community 4230:30 additive
!
route-map CLIENTES_IPV6_RANGE_PROPRIO_COMMON_POLICY_IN permit 310
 match community 31
 set community 4230:31 additive
!
route-map CLIENTES_IPV6_RANGE_PROPRIO_COMMON_POLICY_IN permit 320
 match community 32
 set community 4230:32 additive
!
route-map CLIENTES_IPV6_RANGE_PROPRIO_COMMON_POLICY_IN permit 330
 match community 33
 set community 4230:33 additive
!
route-map CLIENTES_IPV6_RANGE_PROPRIO_COMMON_POLICY_IN permit 340
 match community 4
 set community 4230:4 4230:50 additive
!
route-map CLIENTES_IPV6_RANGE_PROPRIO_COMMON_POLICY_IN permit 350
 set community 4230:30 additive
!
route-map CLIENTES_IPV6_RANGE_EBT_COMMON_POLICY_IN permit 5
 continue 10
 set community 4230:21 4230:50 4230:198
!
route-map CLIENTES_IPV6_RANGE_EBT_COMMON_POLICY_IN permit 10
 match community BLACKHOLE-NAC-EDGE-CLIENTE
 set local-preference 120
 set weight 65535
 set community 4230:10000 additive
 set ipv6 next-hop ::FFFF:200.10.159.254
!
route-map CLIENTES_IPV6_RANGE_EBT_COMMON_POLICY_IN permit 20
 match community BLACKHOLE-NAC-INTL-CLIENTE
 set local-preference 120
 set weight 65535
 set community 4230:10004 additive
!
route-map CLIENTES_IPV6_RANGE_EBT_COMMON_POLICY_IN permit 30
 match community BLACKHOLE-INTERNAC-CLIENTE
 set local-preference 120
 set weight 65535
 set community 4230:10002 additive
!
route-map CLIENTES_IPV6_RANGE_EBT_COMMON_POLICY_IN permit 100
 match community 80
 set local-preference 80
 set community 4230:80 additive
!
route-map CLIENTES_IPV6_RANGE_EBT_COMMON_POLICY_IN permit 110
 match community 120
 set local-preference 120
 set community 4230:120 additive
!
route-map STATIC_TO_BGP_IPV6 deny 10
 match tag 200
!
route-map STATIC_TO_BGP_IPV6 permit 20
 set origin igp
 set community 4230:21 4230:50 4230:198
!
route-map DPRF-MAP permit 10
 description Rede VoIP
 match community DPRF-VOIP
 set extcommunity rt 1024:1001323
!
route-map DPRF-MAP permit 20
 description Rede Gerencia
 match community DPRF-GERENCIA
 set extcommunity rt 1024:1001001
!
route-map BB-LT3-NAC-REMOTOS-OUT permit 10
 match community 443
!
route-map BB-LT2-NAC-REMOTOS-OUT permit 10
 match community 441
!
route-map RR_IPV4_IN permit 10
 match community BLACKHOLE-NAC-CLIENTE BLACKHOLE-NAC-EBT BLACKHOLE-PE-NAC-CLIENTE BLACKHOLE-PE-NAC-EBT BLACKHOLE-PE-CLIENTE BLACKHOLE-PE-EBT
 set ip next-hop 200.10.159.254
!
route-map RR_IPV4_IN deny 20
 match community BLACKHOLE-INTL-CLIENTE BLACKHOLE-INTL-EBT BLACKHOLE-MIA-CLIENTE BLACKHOLE-MIA-EBT
!
route-map RR_IPV4_IN permit 100
!
route-map RR_IPV6_IN permit 10
 match community BLACKHOLE-NAC-EDGE-CLIENTE
 set ipv6 next-hop ::FFFF:200.10.159.254
!
route-map RR_IPV6_IN permit 20
 match community BLACKHOLE-NAC-EDGE-EBT
 set ipv6 next-hop ::FFFF:200.10.159.254
!
route-map RR_IPV6_IN deny 30
 match community BLACKHOLE-INTL-CLIENTE BLACKHOLE-INTL-EBT BLACKHOLE-MIA-CLIENTE BLACKHOLE-MIA-EBT
!
route-map RR_IPV6_IN permit 100
!
snmp-server user u2 g2 v2c 
snmp-server group g2 v2c 
snmp-server group g2 v2c context ospf21 access 69
snmp-server group AUTHGROUP v3 auth 
snmp-server group PRIVGROUP v3 priv 
snmp-server view EXCLUDEBADMIB iso included
snmp-server view EXCLUDEBADMIB snmpUsmMIB excluded
snmp-server view EXCLUDEBADMIB snmpVacmMIB excluded
snmp-server view EXCLUDEBADMIB snmpCommunityMIB excluded
snmp-server view EXCLUDEBADMIB ciscoFlashMIB excluded
snmp-server community fmvs7b1a RO ipv6 SNMP_IPV6 13
snmp-server community com_ospf RO
snmp-server community sdklwepo RO 13
snmp-server trap link ietf
snmp-server trap-source Loopback0
snmp-server enable traps snmp authentication linkdown linkup coldstart warmstart
snmp-server enable traps tty
snmp-server enable traps atm subif
snmp-server enable traps bgp
snmp-server enable traps config
snmp-server enable traps rf
snmp-server enable traps alarms informational
snmp-server host 200.255.125.56 ldsp46!) 
snmp-server host 200.255.125.60 ldsp46!) 
snmp-server host 200.255.253.245 ldsp46!) 
snmp-server host 200.255.253.249 ldsp46!) 
snmp-server host 200.255.253.250 ldsp46!) 
snmp-server host 200.255.125.56 ldsp46! 
snmp-server context ospf21
snmp ifmib ifalias long
snmp mib community-map  com_ospf context ospf21 security-name u2
mpls ldp router-id Loopback0 force
!
tacacs-server host 200.255.125.216
tacacs-server key 7 094F5B0710091E1C0C1905
!
!
ipv6 access-list SNMP_IPV6
 deny ipv6 any any
!
ipv6 access-list FiltroPacotesIPv6
 deny ipv6 host ::1 any
 deny ipv6 ::/96 any
 deny ipv6 FF00::/8 any
 deny ipv6 ::FFFF:0.0.0.0/96 any
 deny ipv6 2804:A8::/48 any
 permit ipv6 any any
!
ipv6 access-list VTY_IPV6
 deny ipv6 any any
!
control-plane
 service-policy input CoPP
!
!
!
!
privilege exec level 1 traceroute
privilege exec level 1 ping
privilege exec level 0 enable
privilege exec level 0 disable
privilege exec level 1 show
privilege exec level 15 no
banner motd ^C
CC
                ============================================================
                =                  INTERNET via Embratel                   =
                ============================================================
                Voce deve possuir autorizacao para acessar este equipamento.
                      Todas as conexoes sao monitoradas e registradas.
                ============================================================
^C
alias exec sr sh ip route
alias exec cr clear ip route
!
line con 0
 exec-timeout 60 0
 login authentication NOC
 stopbits 1
line aux 0
 stopbits 1
line vty 0 4
 session-timeout 20 
 access-class 12 in
 exec-timeout 20 0
 ipv6 access-class VTY_IPV6 in
 login authentication NOC
 transport input telnet ssh
line vty 5 9
 session-timeout 20 
 access-class 11 in
 exec-timeout 20 0
 ipv6 access-class VTY_IPV6 in
 login authentication NOC
 transport input telnet ssh
line vty 10 11
 session-timeout 20 
 access-class 14 in
 exec-timeout 20 0
 ipv6 access-class VTY_IPV6 in
 login authentication NOC
 transport input telnet ssh
line vty 12 15
 session-timeout 20 
 access-class 12 in
 exec-timeout 20 0
 login authentication NOC
!
ntp source Loopback0
ntp server 200.245.255.33
ntp server 200.255.253.242
end

iacc01.sls#
