Building configuration...

Current configuration : 534686 bytes
!
! Last configuration change at 05:13:58 BRA Thu Mar 15 2018 by guico
! NVRAM config last updated at 16:07:10 BRA Wed Mar 14 2018 by rglange
!
upgrade fpd auto
version 12.0
service nagle
no service pad
service tcp-keepalives-in
service tcp-keepalives-out
service timestamps debug datetime msec localtime
service timestamps log datetime msec localtime
service password-encryption
service internal
service sequence-numbers
!
hostname gacc02.sls
!
boot-start-marker
boot system flash disk0:c12kprp-k4p-mz-eng-sp-120-33S13_Embratel15
boot-end-marker
!
!
redundancy
 mode sso
logging count
logging console notifications
aaa new-model
aaa authentication password-prompt Password:
aaa authentication username-prompt Login:
aaa authentication login NOC tacacs+ local
aaa authentication login admin local
aaa authorization exec default tacacs+ local
aaa authorization commands 1 default tacacs+ local
aaa authorization commands 6 default tacacs+ local
aaa authorization commands 15 default tacacs+ local
aaa accounting exec default wait-start tacacs+
aaa accounting commands 1 default wait-start tacacs+
aaa accounting commands 6 default wait-start tacacs+
aaa accounting commands 15 default wait-start tacacs+
enable secret level 6 5 $1$9ce6$vDygDNqN2R59ple0JvQzK1
enable secret 5 $1$/iS8$QYxAo5gqmSG0TBbGjZ7FR1
!
username cong privilege 15 secret 5 $1$wgkR$N7PYR5iFc8V4IiqWVD5q5/
spd extended-headroom 1000
monitor event-trace rlc all enable
clock timezone BRA -3
clock summer-time BRAVER recurring 3 Sun Oct 0:00 3 Sun Feb 0:00
sensor fanspeed-control off
!
!
hw-module slot 6 ip multicast hw-accelerate source-table size 512 offset 0
hw-module slot 7 ip multicast hw-accelerate source-table size 512 offset 0
hw-module slot 6 qos interface queues 8
hw-module slot 7 qos interface queues 8
hw-module slot 0 np mode feature
hw-module slot 1 np mode feature
hw-module slot 3 np mode feature
hw-module slot 4 np mode feature
hw-module slot 0 qos policing-granularity 8
hw-module slot 1 qos policing-granularity 8
hw-module slot 3 qos policing-granularity 8
hw-module slot 4 qos policing-granularity 8
hw-module slot 0 process-max-time 50
hw-module slot 1 process-max-time 50
hw-module slot 3 process-max-time 50
hw-module slot 4 process-max-time 50
hw-module slot 6 process-max-time 50
hw-module slot 7 process-max-time 50
hw-module slot 8 process-max-time 50
hw-module slot 9 process-max-time 50
hw-module slot 0 ip rtp compression-connections 32000
hw-module slot 0 ip tcp compression-connections 500
hw-module slot 1 ip rtp compression-connections 32000
hw-module slot 1 ip tcp compression-connections 500
hw-module slot 3 ip rtp compression-connections 32000
hw-module slot 3 ip tcp compression-connections 500
hw-module slot 4 ip rtp compression-connections 32000
hw-module slot 4 ip tcp compression-connections 500
!
!
!
!
!
!
!
ip subnet-zero
no ip source-route
ip routing protocol purge interface
no ip gratuitous-arps
ip icmp rate-limit unreachable 1000
ip icmp rate-limit unreachable DF 1000
ip spd mode aggressive
ip spd queue max-threshold 1499
ip spd queue min-threshold 1498
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
ip flow-cache timeout active 1
ip cef table hardware resource-failure action punt 
ip cef table loadinfo force
ip cef linecard ipc memory 20000 
ip cef linecard ipc service-timer 50
no ip finger
ip tcp window-size 65535
ip tcp path-mtu-discovery
ip telnet source-interface Loopback0
ip tftp source-interface Loopback0
ip ftp source-interface Loopback0
no ip bootp server
ip domain-list embratel.net.br.
ip domain-list .
ip host srv06.embratel.net.br 200.255.125.56
ip host srv29.embratel.net.br 200.255.125.60
ip host wks21.rjo.embratel.net.br 200.255.253.250
ip host wks09.rjo.embratel.net.br 200.255.253.249
ip host wks19.rjo.embratel.net.br 200.255.125.219
ip host srv04.embratel.net.br 200.255.125.45
ip host srv41.embratel.net.br 200.255.125.33
ip host supv01 10.201.98.253
ip domain-name embratel.net.br
ip name-server 200.255.255.73
ip name-server 200.255.255.65
ip vrf ABNAMRO:2803
 rd 4230:2803
 route-target export 4230:2803
 route-target import 4230:2803
!
ip vrf ABNOTECNH:4953
 rd 4230:4953
 route-target export 4230:4953
 route-target import 4230:4953
!
ip vrf ABRROAMING:1249
 rd 4230:1249
 route-target export 4230:1249
 route-target import 4230:124
!
ip vrf ANVISA:4356
 rd 4230:4356
 export map ANVISA_EXPORT_MAP
 route-target export 4230:4356
 route-target import 4230:4356
 route-target import 4230:153817
 route-target import 4230:4357
!
ip vrf BBRASIL:1588
 rd 4230:1588
 route-target export 4230:1588
 route-target import 4230:1588
 mdt default 239.232.0.0
 mdt data 239.232.1.0 0.0.0.255 threshold 1
 mdt log-reuse
!
ip vrf BBRASIL_NAC:7399
 rd 4230:7399
 route-target export 4230:7399
 route-target import 4230:7399
 mdt default 239.232.0.88
 mdt data 239.232.89.0 0.0.0.255 threshold 1
 mdt log-reuse
!
ip vrf BBRASIL_PAE:7041
 rd 4230:7041
 route-target export 4230:7041
 route-target import 4230:7041
 mdt default 239.233.0.29
 mdt data 239.233.30.0 0.0.0.255 threshold 1
 mdt log-reuse
!
ip vrf BCOAM:4783
 rd 4230:4783
 route-target export 4230:4783
 route-target import 4230:4783
!
ip vrf BCOVOTOFILIAL:6826
 rd 4230:6826
 route-target export 4230:6826
 route-target import 4230:6826
!
ip vrf BNB:5075
 rd 4230:5075
 route-target export 4230:5075
 route-target export 4230:5155
 route-target import 4230:5075
 route-target import 4230:1337
!
ip vrf BRADEL:6618
 rd 4230:6618
 route-target export 4230:6618
 route-target import 4230:6618
!
ip vrf BRASILIANAENC_NOVA:6317
 rd 4230:6317
 route-target export 4230:6317
 route-target export 4230:5155
 route-target import 4230:6317
 route-target import 4230:1337
!
ip vrf BYTENNIS:3608
 rd 4230:3608
 route-target export 4230:3608
 route-target export 4230:3108
 route-target export 4230:5155
 route-target import 4230:3608
 route-target import 4230:3107
 route-target import 4230:1337
!
ip vrf CASSI:3904
 rd 4230:3904
 route-target export 4230:3904
 route-target import 4230:3904
 mdt default 239.232.0.15
 mdt data 239.232.16.0 0.0.0.255 threshold 1
 mdt log-reuse
!
ip vrf CBE:4734
 rd 4230:4734
 route-target export 4230:4734
 route-target import 4230:4734
!
ip vrf CETIP:6164
 rd 4230:6164
 route-target export 4230:6164
 route-target import 4230:6164
!
ip vrf CIEE:3214
 rd 4230:3214
 route-target export 4230:3214
 route-target import 4230:3214
!
ip vrf CIMED:2611
 rd 4230:2611
 route-target export 4230:2611
 route-target export 4230:5155
 route-target import 4230:2611
 route-target import 4230:1337
!
ip vrf COBRA:1706
 rd 4230:1706
 route-target export 4230:1706
 route-target export 4230:3108
 route-target import 4230:1706
 route-target import 4230:3107
!
ip vrf CORREIOS_2016:7440
 rd 4230:7440
 route-target export 4230:7440
 route-target export 4230:1007
 route-target import 4230:7440
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
 route-target import 4230:1337
!
ip vrf DIASBRANCO:1569
 rd 4230:1569
 route-target export 4230:1569
 route-target export 4230:3108
 route-target import 4230:1569
 route-target import 4230:1337
 route-target import 4230:3107
!
ip vrf DIST_TIETE_FILIAL:5599
 rd 4230:5599
 route-target export 4230:5599
 route-target import 4230:5599
 route-target import 4230:1337
!
ip vrf DPF_MPLS:6606
 rd 4230:6606
 route-target export 4230:6606
 route-target import 4230:6606
!
ip vrf ELEVADORESATLAS:7186
 rd 4230:7186
 route-target export 4230:7186
 route-target export 4230:5155
 route-target import 4230:7186
 route-target import 4230:1337
!
ip vrf FUNASA:3094
 rd 4230:3094
 route-target export 4230:3094
 route-target import 4230:3094
 route-target import 4230:1337
 mdt default 239.232.0.243
 mdt data 239.232.244.0 0.0.0.255 threshold 1
 mdt log-reuse
!
ip vrf HERVAL:4202
 rd 4230:4202
 route-target export 4230:4202
 route-target export 4230:3108
 route-target export 4230:5155
 route-target import 4230:4202
 route-target import 4230:3107
 route-target import 4230:1337
!
ip vrf IBI_LOJAS:4639
 rd 4230:4639
 route-target export 4230:6518
 route-target import 4230:6518
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
ip vrf INFRAERO:4781
 rd 4230:4781
 route-target export 4230:4781
 route-target import 4230:4781
!
ip vrf INPE:5430
 rd 4230:5430
 route-target export 4230:5430
 route-target import 4230:5430
 route-target import 4230:1337
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
ip vrf IURD:1265
 rd 4230:1265
 route-target export 4230:1265
 route-target export 4230:5155
 route-target import 4230:1265
 route-target import 4230:1337
!
ip vrf JOLIVAN:3739
 rd 4230:3739
 route-target export 4230:3739
 route-target import 4230:3739
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
ip vrf LEO:1056
 rd 4230:1056
 route-target export 4230:1056
 route-target import 4230:1056
!
ip vrf LOJARENNER:1513
 rd 4230:1513
 route-target export 4230:1513
 route-target export 4230:5155
 route-target export 4230:3108
 route-target import 4230:1513
 route-target import 4230:1337
 route-target import 4230:3107
!
ip vrf LOJASRIACHUELO:4120
 rd 4230:4120
 route-target export 4230:4120
 route-target import 4230:4120
!
ip vrf MAPA_MPLS:6409
 rd 4230:6409
 route-target export 4230:6409
 route-target import 4230:6409
!
ip vrf MARTINS:1786
 rd 4230:1786
 route-target export 4230:1786
 route-target import 4230:1786
!
ip vrf MOURA:1648
 rd 4230:1648
 route-target export 4230:1648
 route-target export 28513:51407
 route-target import 4230:1648
 route-target import 28513:51407
!
ip vrf MPF_NOVA:6114
 rd 4230:6114
 route-target export 4230:6114
 route-target export 4230:6107
 route-target import 4230:6114
 route-target import 4230:6108
 mdt default 239.232.0.233
 mdt data 239.232.234.0 0.0.0.255 threshold 1
 mdt log-reuse
!
ip vrf NGN-GER:1416
 rd 4230:1416
 route-target export 4230:1416
 route-target import 4230:1416
 route-target import 4230:900
!
ip vrf NGN-VIPLINEIP:2628
 rd 4230:2628
 route-target export 4230:2628
 route-target import 4230:2628
 route-target import 4230:900
!
ip vrf NGN-VOZ:1417
 rd 4230:1417
 route-target export 4230:1417
 route-target export 4230:4515
 route-target import 4230:1417
 route-target import 4230:4515
!
ip vrf OMNILIFE:6246
 rd 4230:6246
 route-target export 4230:6246
 route-target export 28513:50131
 route-target import 4230:6246
 route-target import 28513:50131
!
ip vrf PAULINAS:2475
 rd 4230:2475
 route-target export 4230:2475
 route-target export 4230:3108
 route-target import 4230:2475
 route-target import 4230:3107
 route-target import 4230:1337
!
ip vrf PGJMARANHAO:7435
 rd 4230:7435
 route-target export 4230:7435
 route-target import 4230:7435
!
ip vrf POLIPECAS:3158
 rd 4230:3158
 route-target export 4230:3158
 route-target import 4230:3158
!
ip vrf PROV_LIST:4379
 rd 4230:4379
 route-target export 4230:4379
 route-target export 4230:5110
 route-target import 4230:4379
 route-target import 4230:5109
!
ip vrf REALIP_CLIENTE:5581
 rd 4230:5581
 route-target export 4230:5581
 route-target export 4230:5155
 route-target import 4230:5580
 route-target import 4230:1337
!
ip vrf RIHAPPY:4005
 rd 4230:4005
 route-target export 4230:4005
 route-target export 4230:3108
 route-target import 4230:4005
 route-target import 4230:3107
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
ip vrf SENAI_NOVA:7712
 rd 4230:7712
 route-target export 4230:7712
 route-target import 4230:7712
!
ip vrf SERPRO_SLS_DETRAN_01:5897
 rd 4230:5897
 route-target export 4230:5897
 route-target import 4230:5897
!
ip vrf SERPRO_SLS_DNIT_03:5896
 rd 4230:5896
 route-target export 4230:5896
 route-target import 4230:5896
!
ip vrf SERPRO_SLS_DNIT_06:5894
 rd 4230:5894
 route-target export 4230:5894
 route-target import 4230:5894
!
ip vrf SET_MA:3377
 rd 4230:3377
 route-target export 4230:3377
 route-target export 4230:6262
 route-target import 4230:3377
 route-target import 4230:6262
!
ip vrf SHV_GAS:152562
 rd 4230:152562
 route-target export 4230:3469
 route-target import 4230:3469
!
ip vrf SUPERMMACIEL:3754
 rd 4230:3754
 route-target export 4230:3754
 route-target export 4230:3108
 route-target export 4230:5155
 route-target import 4230:3754
 route-target import 4230:3107
 route-target import 4230:1337
!
ip vrf TECBAN:1221
 rd 4230:1221
 route-target export 4230:1221
 route-target import 4230:1273
!
ip vrf TECELAGEMAV:2642
 rd 4230:2642
 route-target export 4230:2642
 route-target import 4230:2642
!
ip vrf TENDTUDO:1965
 rd 4230:1965
 route-target export 4230:1965
 route-target export 4230:5155
 route-target import 4230:1965
 route-target import 4230:1337
!
ip vrf TESTE_REDE_ACESSO:6672
 rd 4230:6672
 route-target export 4230:6672
 route-target import 4230:6672
!
ip vrf TESTE_TMX:200002
 rd 4230:200002
 route-target export 4230:200001
 route-target import 4230:200001
!
ip vrf TEXACO:4523
 rd 4230:4523
 import map TEXACO_EXTR_SERMA_IPIR
 route-target export 4230:4523
 route-target import 4230:4523
 route-target import 4230:1912
 route-target import 4230:1663
!
ip vrf TPES:6701
 rd 4230:6701
 route-target export 4230:6701
 route-target export 4230:5155
 route-target import 4230:6701
 route-target import 4230:1337
!
ip vrf TRT16:3540
 rd 4230:3540
 export map TRT-XX_EXPORT_MAP
 route-target export 4230:3540
 route-target export 1024:1231323
 route-target import 4230:3540
 route-target import 1024:1230323
!
ip vrf TRT_NACIONAL:153663
 rd 4230:153663
 route-target export 4230:4219
 route-target import 4230:4219
!
ip vrf UBEE:1597
 rd 4230:1597
 route-target export 4230:1597
 route-target import 4230:1597
!
ip vrf UNICRED:1647
 rd 4230:1647
 route-target export 4230:1647
 route-target import 4230:1647
!
ip vrf VESPER-1XRTT:3997
 rd 4230:3997
 route-target export 4230:3997
 route-target import 4230:3997
!
ip vrf VOLVO_APAVEL:3193
 rd 4230:3193
 route-target export 4230:3193
 route-target import 4230:3193
 route-target import 4230:151524
 route-target import 4230:1337
!
ip vrf WIMAX_EBT:3855
 rd 4230:3855
 route-target export 4230:3855
 route-target export 4230:3108
 route-target import 4230:3855
 route-target import 4230:3107
!
ip multicast-routing distributed
ip multicast-routing vrf BBRASIL_NAC:7399 distributed
ip multicast-routing vrf BBRASIL:1588 distributed
ip multicast-routing vrf BBRASIL_PAE:7041 distributed
ip multicast-routing vrf CASSI:3904 distributed
ip multicast-routing vrf FUNASA:3094 distributed
ip multicast-routing vrf MPF_NOVA:6114 distributed
ip ssh time-out 60
ip ssh authentication-retries 5
ip ssh source-interface Loopback0
ip ssh version 2
ip scp server enable
ip receive access-list 2598
!
class-map match-any MISSAO_CRITICA_NAC
  match ip dscp 32  34  38 
class-map match-any SILVER_BEST_EFFORT_MCI
  match ip precedence 0  1  2  3 
  match ip precedence 4  5  6  7 
class-map match-all NETWORK_CONTROL_CORREIOS
  match ip dscp 16  48  56 
class-map match-all BUSINESS
  match ip dscp 24  26  28  30 
class-map match-all Video_SERPRO
  match ip dscp 34 
class-map match-all Bulk_Q6
  match ip dscp 8  10  12  14  32 
class-map match-any STANDARD_NAC
  match ip dscp 0 
class-map match-any GERENCIAMENTO_CORREIOS
  match ip dscp 24  26  28  30 
class-map match-all REALTIME
  match ip dscp 40  46 
class-map match-any REAL_TIME_VOZ_CORREIOS
  match ip dscp 40  46 
class-map match-any MISSAO_CRITICA
  match ip dscp 32  36  38 
class-map match-any SUPORTE_AO_NEGOCIO
  match ip dscp 16  18  22 
class-map match-all RV_MLPPP_Sinalizacao
  match access-group 2121
class-map match-any REAL_TIME_CORREIOS
  match ip dscp 32  40  46 
class-map match-all Voz_SERPRO
  match ip dscp 40  46 
class-map match-any TEMPO_REAL_NAC
  match ip dscp 40  46 
class-map match-all RV_MLPPP_Voz
  match access-group 2123
class-map match-all Interativa_Q6
  match ip dscp 18  20  22 
class-map match-any TEMPO_REAL_VOZ
  match ip dscp 40  46 
class-map match-any SILVER_AF4x_MCI
  match ip dscp 32  34  36  38 
class-map match-any STANDARD
  match ip dscp 0 
class-map match-any SILVER_AF3x_MCI
  match ip dscp 24  26  28  30 
  match ip dscp 48  56 
class-map match-any SILVER_AF2x_MCI
  match ip dscp 16  18  20  22 
class-map match-all NetworkControl_Q6
  match ip dscp 16  48  56 
class-map match-all CS3
  match ip dscp 24 
class-map match-all CS4
  match ip dscp 32 
class-map match-all CS5
  match ip dscp 40 
class-map match-all VozVideo_Q6
  match ip dscp 34  40  46 
class-map match-all CoPP-BACKBONE-management
  match access-group name CoPP-BACKBONE-management
class-map match-all CoPP-Normal
  match access-group name CoPP-Normal
class-map match-all BestEffort_Q6
  match ip dscp 0 
class-map match-all MissaoCritica_SERPRO
  match ip dscp 10  26  28  30 
class-map match-all Gerencia_ECT
  match ip dscp 30 
class-map match-all CoPP-Special
  match access-group name CoPP-Special
class-map match-all CoPP-Arp
  match protocol arp
class-map match-all Voz
  match ip dscp 46 
class-map match-any GOLD_EF_MCI
  match ip dscp 40  46 
class-map match-all VozVideo_SERPRO
  match ip dscp 34  40  46 
class-map match-any NETWORK_CONTROL
  match ip dscp 16  48  56 
class-map match-any TEMPO_REAL_VC
  match ip dscp 34 
class-map match-any GERENCIAMENTO
  match ip dscp 24  26  28 
class-map match-all NetworkControl_SERPRO
  match ip dscp 16  48  56 
class-map match-all Video
  match ip dscp 34 
class-map match-any MISSAO_CRITICA_CORREIOS
  match ip dscp 34  36  38 
class-map match-all BEST_EFFORT
  match ip dscp 0 
class-map match-all MissaoCritica_Q6
  match ip dscp 24  26  28  30 
class-map match-any NETWORK_CONTROL_NAC
  match ip dscp 48 
class-map match-any NAO_CRITICO
  match ip dscp 8  10  14 
class-map match-all RV_MLPPP_BestEffort
  match ip dscp 0 
class-map match-all CoPP-Undesirable
  match access-group name CoPP-Undesirable
class-map match-all BestEffort_SERPRO
  match ip dscp 0  14 
class-map match-all CoPP-BACKBONE-routing
  match access-group name CoPP-BACKBONE-routing
class-map match-any GERENCIAMENTO_NAC
  match ip dscp 24  26  30 
class-map match-all MissaoCritica_ECT
  match ip dscp 26 
class-map match-all CoPP-Catch-all-ipv4
  match access-group name CoPP-Catch-all-ipv4
class-map match-all CoPP-SUSPECT-management
  match access-group name CoPP-SUSPECT-management
class-map match-all Video_Q6
  match ip dscp 34 
class-map match-all CoPP-ToS
  match ip precedence 6  7 
class-map match-all RV_MLPPP_NetWorkControl
  match access-group 2122
class-map match-all CoPP-PE-CE-routing
  match access-group name CoPP-PE-CE-routing
class-map match-all Interativa_SERPRO
  match ip dscp 12  18  20  22 
class-map match-all Voz_Q6
  match ip dscp 40  46 
!
!
policy-map QPO_BBONE_20000_V1
  class class-default
    shape average 20000000
policy-map QPI_A_512K_13_N_0_35_25_18_4_4
  class Voz_Q6
   police cir percent 13 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 35 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Interativa_Q6
   police cir percent 25 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Bulk_Q6
   police cir percent 18 conform-action set-mpls-exp-imposition-transmit 4 exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map PM_V10_QPO_BBONE_200_V1
policy-map QPO_BBONE_200_V1
  class class-default
    shape average 200000
   service-policy PM_V10_QPO_BBONE_200_V1
policy-map QPI_A_2048K_0_N_0_50_0_16_2_31
  class MissaoCritica_Q6
   police cir percent 50 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Bulk_Q6
   police cir percent 16 conform-action set-mpls-exp-imposition-transmit 4 exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_A_1024K_11_C_0_50_13_13_2_10
  class Voz_Q6
   police cir percent 11 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 50 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Interativa_Q6
   police cir percent 13 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Bulk_Q6
   police cir percent 13 conform-action set-mpls-exp-imposition-transmit 4 exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPO_6144K_11_34_0_0_0_2_52
  class VozVideo_Q6
    priority
   police cir percent 45 conform-action transmit  exceed-action drop 
  class NetworkControl_Q6
    bandwidth percent 2
  class class-default
    bandwidth percent 52
    random-detect dscp-based
    random-detect dscp 0 40 ms 120 ms 1
policy-map QPI_A_256K_31_C_0_21_13_26_7_1
  class Voz_Q6
   police cir percent 62 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 21 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Interativa_Q6
   police cir percent 13 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Bulk_Q6
   police cir percent 26 conform-action set-mpls-exp-imposition-transmit 4 exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_A_2048K_13_N_25_11_0_0_2_1
  class Voz_Q6
   police cir percent 13 conform-action transmit  exceed-action drop 
  class Video_Q6
   police cir percent 25 conform-action set-mpls-exp-imposition-transmit 5 exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 11 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QDI_A_2048K_13_25_11_0_0_2_1
  class class-default
   police rate 2048000 child-conform-aware conform-action transmit  exceed-action drop 
   service-policy QPI_A_2048K_13_N_25_11_0_0_2_1
policy-map PM_V10_QPO_BBONE_30000_V1
policy-map QPO_BBONE_30000_V1
  class class-default
    shape average 30000000
   service-policy PM_V10_QPO_BBONE_30000_V1
policy-map QPO_1024K_BBrasil_NAC_GACC_V1
  class TEMPO_REAL_NAC
    priority
   police cir percent 25 conform-action transmit  exceed-action drop 
  class MISSAO_CRITICA_NAC
    bandwidth percent 40
    bandwidth remaining percent 40
    random-detect dscp-based
    random-detect dscp 32 24 packets 40 packets 1
    random-detect dscp 34 24 packets 40 packets 1
    random-detect dscp 38 24 packets 40 packets 1
    queue-limit 80 packets
  class GERENCIAMENTO_NAC
    bandwidth percent 10
    bandwidth remaining percent 10
    random-detect dscp-based
    random-detect dscp 24 7 packets 15 packets 1
    random-detect dscp 26 7 packets 15 packets 1
    random-detect dscp 30 7 packets 15 packets 1
    queue-limit 30 packets
  class NETWORK_CONTROL_NAC
    bandwidth percent 2
    bandwidth remaining percent 2
    random-detect dscp-based
    random-detect dscp 48 5 packets 9 packets 1
    queue-limit 18 packets
  class STANDARD_NAC
    bandwidth percent 20
    bandwidth remaining percent 20
    random-detect dscp-based
    random-detect dscp 0 12 packets 20 packets 1
    queue-limit 40 packets
policy-map QDO_1024K_BBrasil_NAC_GACC_V1
  class class-default
    shape average 1024000
   service-policy QPO_1024K_BBrasil_NAC_GACC_V1
policy-map QPI_A_1024K_14_N_0_6_46_8_2_23
  class Voz_Q6
   police cir percent 14 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 6 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Interativa_Q6
   police cir percent 46 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Bulk_Q6
   police cir percent 8 conform-action set-mpls-exp-imposition-transmit 4 exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map WAN_IN_OMEGA_TER
policy-map QPI_A_2048K_13_N_25_11_0_0_1_1
  class Voz_Q6
   police cir percent 13 conform-action transmit  exceed-action drop 
  class Video_Q6
   police cir percent 25 conform-action set-mpls-exp-imposition-transmit 5 exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 11 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QDI_A_2048K_13_25_11_0_0_1_1
  class class-default
   police rate 2048000 child-conform-aware conform-action transmit  exceed-action drop 
   service-policy QPI_A_2048K_13_N_25_11_0_0_1_1
policy-map QPI_A_4096K_10_N_40_25_13_0_1_10
  class Voz_Q6
   police cir percent 10 conform-action transmit  exceed-action drop 
  class Video_Q6
   police cir percent 40 conform-action set-mpls-exp-imposition-transmit 5 exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 25 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Interativa_Q6
   police cir percent 13 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QDI_A_4096K_10_40_25_13_0_1_10
  class class-default
   police rate 4096000 child-conform-aware conform-action transmit  exceed-action drop 
   service-policy QPI_A_4096K_10_N_40_25_13_0_1_10
policy-map QPO_SERPRO_512K_V1
  class Voz_SERPRO
    priority
   police cir percent 9 conform-action transmit  exceed-action drop 
  class MissaoCritica_SERPRO
    bandwidth percent 20
    random-detect dscp-based
    random-detect dscp 10 7 packets 15 packets 1
    random-detect dscp 26 7 packets 15 packets 1
    random-detect dscp 28 7 packets 15 packets 1
    random-detect dscp 30 7 packets 15 packets 1
  class Interativa_SERPRO
    bandwidth percent 41
    random-detect dscp-based
    random-detect dscp 12 12 packets 20 packets 1
    random-detect dscp 18 12 packets 20 packets 1
    random-detect dscp 20 12 packets 20 packets 1
    random-detect dscp 22 12 packets 20 packets 1
  class NetworkControl_SERPRO
    bandwidth percent 3
  class class-default
    bandwidth percent 23
    random-detect dscp-based
    random-detect dscp 0 7 packets 15 packets 1
    random-detect dscp 14 7 packets 15 packets 1
policy-map QPO_A_1024K_14_0_6_46_8_2_23
  class Voz_Q6
    priority
   police cir percent 14 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 6
    bandwidth remaining percent 6
    random-detect dscp-based
    random-detect dscp 24 5 packets 13 packets 1
    random-detect dscp 26 5 packets 13 packets 1
    random-detect dscp 28 5 packets 13 packets 1
    random-detect dscp 30 5 packets 13 packets 1
    queue-limit 26 packets
  class Interativa_Q6
    bandwidth percent 46
    bandwidth remaining percent 46
    random-detect dscp-based
    random-detect dscp 18 24 packets 40 packets 1
    random-detect dscp 20 24 packets 40 packets 1
    random-detect dscp 22 24 packets 40 packets 1
    queue-limit 80 packets
  class Bulk_Q6
    bandwidth percent 8
    bandwidth remaining percent 8
    random-detect dscp-based
    random-detect dscp 8 7 packets 15 packets 1
    random-detect dscp 10 7 packets 15 packets 1
    random-detect dscp 12 7 packets 15 packets 1
    random-detect dscp 14 7 packets 15 packets 1
    random-detect dscp 32 7 packets 15 packets 1
    queue-limit 30 packets
  class NetworkControl_Q6
    bandwidth percent 2
    bandwidth remaining percent 2
    queue-limit 18 packets
  class class-default
    bandwidth percent 23
    bandwidth remaining percent 23
    random-detect dscp-based
    random-detect dscp 0 12 packets 20 packets 1
    queue-limit 40 packets
policy-map QDO_A_1024K_14_0_6_46_8_2_23
  class class-default
    shape average 1024000
   service-policy QPO_A_1024K_14_0_6_46_8_2_23
policy-map PM_V10_QPO_BBONE_32000_V1
policy-map QPO_BBONE_32000_V1
  class class-default
    shape average 32000000
   service-policy PM_V10_QPO_BBONE_32000_V1
policy-map QPO_BBONE_10000_V1
  class class-default
    shape average 10000000
policy-map QPI_A_1024K_19_N_0_8_38_0_2_32
  class Voz_Q6
   police cir percent 19 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 8 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Interativa_Q6
   police cir percent 38 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map PM_V10_QPO_BBONE_256_V1
policy-map QPO_BBONE_256_V1
  class class-default
    shape average 256000
   service-policy PM_V10_QPO_BBONE_256_V1
policy-map PM_V10_QPO_BBONE_512_V1
policy-map QPO_BBONE_512_V1
  class class-default
    shape average 512000
   service-policy PM_V10_QPO_BBONE_512_V1
policy-map QPO_A_2048K_13_25_11_0_0_1_1
  class VozVideo_Q6
    priority
   police cir percent 38 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 11
    bandwidth remaining percent 11
    random-detect dscp-based
    random-detect dscp 24 24 packets 40 packets 1
    random-detect dscp 26 24 packets 40 packets 1
    random-detect dscp 28 24 packets 40 packets 1
    random-detect dscp 30 24 packets 40 packets 1
    queue-limit 80 packets
  class NetworkControl_Q6
    bandwidth percent 1
    bandwidth remaining percent 1
    queue-limit 40 packets
  class class-default
    bandwidth percent 1
    bandwidth remaining percent 1
    random-detect dscp-based
    random-detect dscp 0 12 packets 20 packets 1
    queue-limit 40 packets
policy-map QDO_A_2048K_13_25_11_0_0_1_1
  class class-default
    shape average 2048000
   service-policy QPO_A_2048K_13_25_11_0_0_1_1
policy-map QPO_A_4096K_10_40_25_13_0_1_10
  class VozVideo_Q6
    priority
   police cir percent 50 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 25
    bandwidth remaining percent 25
    random-detect dscp-based
    random-detect dscp 24 56 packets 120 packets 1
    random-detect dscp 26 56 packets 120 packets 1
    random-detect dscp 28 56 packets 120 packets 1
    random-detect dscp 30 56 packets 120 packets 1
    queue-limit 240 packets
  class Interativa_Q6
    bandwidth percent 13
    bandwidth remaining percent 13
    random-detect dscp-based
    random-detect dscp 18 32 packets 48 packets 1
    random-detect dscp 20 32 packets 48 packets 1
    random-detect dscp 22 32 packets 48 packets 1
    queue-limit 96 packets
  class NetworkControl_Q6
    bandwidth percent 1
    bandwidth remaining percent 1
    queue-limit 26 packets
  class class-default
    bandwidth percent 10
    bandwidth remaining percent 10
    random-detect dscp-based
    random-detect dscp 0 24 packets 40 packets 1
    queue-limit 80 packets
policy-map QDO_A_4096K_10_40_25_13_0_1_10
  class class-default
    shape average 4096000
   service-policy QPO_A_4096K_10_40_25_13_0_1_10
policy-map QPI_SERPRO_512K_V1
  class Voz_SERPRO
   police cir percent 9 conform-action transmit  exceed-action drop 
  class MissaoCritica_SERPRO
   police cir percent 20 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Interativa_SERPRO
   police cir percent 41 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QDI_A_1024K_14_0_6_46_8_2_23
  class class-default
   police rate 1024000 child-conform-aware conform-action transmit  exceed-action drop 
   service-policy QPI_A_1024K_14_N_0_6_46_8_2_23
policy-map QPI_A_4096K_12_N_0_8_8_13_1_57
  class Voz_Q6
   police cir percent 12 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 8 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Interativa_Q6
   police cir percent 8 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Bulk_Q6
   police cir percent 13 conform-action set-mpls-exp-imposition-transmit 4 exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_A_2048K_6_N_19_16_18_27_1_12
  class Voz_Q6
   police cir percent 6 conform-action transmit  exceed-action drop 
  class Video_Q6
   police cir percent 19 conform-action set-mpls-exp-imposition-transmit 5 exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 16 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Interativa_Q6
   police cir percent 18 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Bulk_Q6
   police cir percent 27 conform-action set-mpls-exp-imposition-transmit 4 exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPO_BBONE_34000_V1
  class class-default
    shape average 34000000
policy-map QPI_A_256K_38_N_0_7_0_0_7_47
  class Voz_Q6
   police cir percent 38 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 7 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_A_256K_39_N_0_7_0_0_7_46
  class Voz_Q6
   police cir percent 39 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 7 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map PM_V10_QPO_BBONE_10240_V1
policy-map QPO_BBONE_10240_V1
  class class-default
    shape average 10240000
   service-policy PM_V10_QPO_BBONE_10240_V1
policy-map QPI_A_512K_25_N_0_2_0_0_4_68
  class Voz_Q6
   police cir percent 25 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 2 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_A_256K_22_N_0_29_22_13_7_6
  class Voz_Q6
   police cir percent 22 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 29 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Interativa_Q6
   police cir percent 22 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Bulk_Q6
   police cir percent 13 conform-action set-mpls-exp-imposition-transmit 4 exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_BBONE_S_68000_V1
  class class-default
   police 68000000 2125000 2125000 conform-action set-dscp-transmit default exceed-action drop 
policy-map PM_V10_QPO_BBONE_400_V1
policy-map QPO_BBONE_400_V1
  class class-default
    shape average 400000
   service-policy PM_V10_QPO_BBONE_400_V1
policy-map QPI_BBONE_S_960_V1
  class class-default
   police 960000 30000 30000 conform-action set-dscp-transmit default exceed-action drop 
policy-map QPO_A_2048K_13_25_11_0_0_2_1
  class VozVideo_Q6
    priority
   police cir percent 38 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 11
    bandwidth remaining percent 11
    random-detect dscp-based
    random-detect dscp 24 24 packets 40 packets 1
    random-detect dscp 26 24 packets 40 packets 1
    random-detect dscp 28 24 packets 40 packets 1
    random-detect dscp 30 24 packets 40 packets 1
    queue-limit 80 packets
  class NetworkControl_Q6
    bandwidth percent 2
    bandwidth remaining percent 2
    queue-limit 40 packets
  class class-default
    bandwidth percent 1
    bandwidth remaining percent 1
    random-detect dscp-based
    random-detect dscp 0 12 packets 20 packets 1
    queue-limit 40 packets
policy-map QDO_A_2048K_13_25_11_0_0_2_1
  class class-default
    shape average 2048000
   service-policy QPO_A_2048K_13_25_11_0_0_2_1
policy-map PM_V10_QPO_BBONE_50000_V1
policy-map QPO_BBONE_50000_V1
  class class-default
    shape average 50000000
   service-policy PM_V10_QPO_BBONE_50000_V1
policy-map QPI_A_4096K_3_N_0_0_0_0_1_46
  class Voz_Q6
   police cir percent 3 conform-action transmit  exceed-action drop 
  class class-default
   set mpls experimental imposition 0
policy-map QPI_1024K_BBrasil_NAC_GACC_V1
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
policy-map QDI_1024K_BBrasil_NAC_GACC_V1
  class class-default
   police rate 1024000 conform-action transmit  exceed-action drop 
   service-policy QPI_1024K_BBrasil_NAC_GACC_V1
policy-map QPI_A_1024K_25_N_0_40_0_0_2_31
  class Voz_Q6
   police cir percent 25 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 40 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_A_512K_10_N_30_35_0_0_4_20
  class Voz_Q6
   police cir percent 10 conform-action transmit  exceed-action drop 
  class Video_Q6
   police cir percent 30 conform-action set-mpls-exp-imposition-transmit 5 exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 35 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_A_256K_10_N_0_0_4_4_7_74
  class Voz_Q6
   police cir percent 10 conform-action transmit  exceed-action drop 
  class Interativa_Q6
   police cir percent 4 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Bulk_Q6
   police cir percent 4 conform-action set-mpls-exp-imposition-transmit 4 exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPO_A_1024K_25_0_40_0_0_2_32
  class Voz_Q6
    priority
   police cir percent 25 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 40
    bandwidth remaining percent 40
    random-detect dscp-based
    random-detect dscp 24 24 packets 40 packets 1
    random-detect dscp 26 24 packets 40 packets 1
    random-detect dscp 28 24 packets 40 packets 1
    random-detect dscp 30 24 packets 40 packets 1
    queue-limit 80 packets
  class NetworkControl_Q6
    bandwidth percent 2
    bandwidth remaining percent 2
    queue-limit 18 packets
  class class-default
    bandwidth percent 32
    bandwidth remaining percent 32
    random-detect dscp-based
    random-detect dscp 0 14 packets 30 packets 1
    queue-limit 60 packets
policy-map QDO_A_1024K_25_0_40_0_0_2_32
  class class-default
    shape average 1024000
   service-policy QPO_A_1024K_25_0_40_0_0_2_32
policy-map QPI_A_1024K_11_N_0_50_13_13_2_10
  class Voz_Q6
   police cir percent 11 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 50 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Interativa_Q6
   police cir percent 13 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Bulk_Q6
   police cir percent 13 conform-action set-mpls-exp-imposition-transmit 4 exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QDI_A_1024K_11_0_50_13_13_2_10
  class class-default
   police rate 1024000 child-conform-aware conform-action transmit  exceed-action drop 
   service-policy QPI_A_1024K_11_N_0_50_13_13_2_10
policy-map QPI_A_512K_11_N_0_33_25_18_4_8
  class Voz_Q6
   police cir percent 11 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 33 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Interativa_Q6
   police cir percent 25 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Bulk_Q6
   police cir percent 18 conform-action set-mpls-exp-imposition-transmit 4 exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPO_A_2048K_3_0_5_3_0_2_86
  class Voz_Q6
    priority
   police cir percent 3 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 5
    bandwidth remaining percent 5
    random-detect dscp-based
    random-detect dscp 24 7 packets 15 packets 1
    random-detect dscp 26 7 packets 15 packets 1
    random-detect dscp 28 7 packets 15 packets 1
    random-detect dscp 30 7 packets 15 packets 1
    queue-limit 30 packets
  class Interativa_Q6
    bandwidth percent 3
    bandwidth remaining percent 3
    random-detect dscp-based
    random-detect dscp 18 7 packets 15 packets 1
    random-detect dscp 20 7 packets 15 packets 1
    random-detect dscp 22 7 packets 15 packets 1
    queue-limit 30 packets
  class NetworkControl_Q6
    bandwidth percent 2
    bandwidth remaining percent 2
    queue-limit 26 packets
  class class-default
    bandwidth percent 86
    bandwidth remaining percent 86
    random-detect dscp-based
    random-detect dscp 0 56 packets 120 packets 1
    queue-limit 240 packets
policy-map QDO_A_2048K_3_0_5_3_0_2_86
  class class-default
    shape average 2048000
   service-policy QPO_A_2048K_3_0_5_3_0_2_86
policy-map QPI_BBONE_S_32000_V1
  class class-default
   police 32000000 1000000 1000000 conform-action set-dscp-transmit default exceed-action drop 
policy-map QPI_BBONE_S_10000_V1
  class class-default
   police 10000000 312500 312500 conform-action set-dscp-transmit default exceed-action drop 
policy-map QPI_A_512K_5_N_0_0_13_0_4_77
  class Voz_Q6
   police cir percent 5 conform-action transmit  exceed-action drop 
  class Interativa_Q6
   police cir percent 13 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_BBONE_S_1000000_V1
  class class-default
   police cir 1000000000 bc 31250000 be 31250000 conform-action set-dscp-transmit default exceed-action drop 
policy-map PM_V10_QPO_BBONE_128_V1
policy-map QPO_BBONE_128_V1
  class class-default
    shape average 128000
   service-policy PM_V10_QPO_BBONE_128_V1
policy-map QPO_A_2048K_7_0_49_25_10_2_6
  class Voz_Q6
    priority
   police cir percent 7 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 49
    bandwidth remaining percent 49
    random-detect dscp-based
    random-detect dscp 24 32 packets 64 packets 1
    random-detect dscp 26 32 packets 64 packets 1
    random-detect dscp 28 32 packets 64 packets 1
    random-detect dscp 30 32 packets 64 packets 1
    queue-limit 128 packets
  class Interativa_Q6
    bandwidth percent 25
    bandwidth remaining percent 25
    random-detect dscp-based
    random-detect dscp 18 32 packets 48 packets 1
    random-detect dscp 20 32 packets 48 packets 1
    random-detect dscp 22 32 packets 48 packets 1
    queue-limit 96 packets
  class Bulk_Q6
    bandwidth percent 10
    bandwidth remaining percent 10
    random-detect dscp-based
    random-detect dscp 8 12 packets 20 packets 1
    random-detect dscp 10 12 packets 20 packets 1
    random-detect dscp 12 12 packets 20 packets 1
    random-detect dscp 14 12 packets 20 packets 1
    random-detect dscp 32 12 packets 20 packets 1
    queue-limit 40 packets
  class NetworkControl_Q6
    bandwidth percent 2
    bandwidth remaining percent 2
    queue-limit 26 packets
  class class-default
    bandwidth percent 6
    bandwidth remaining percent 6
    random-detect dscp-based
    random-detect dscp 0 7 packets 15 packets 1
    queue-limit 30 packets
policy-map QDO_A_2048K_7_0_49_25_10_2_6
  class class-default
    shape average 2048000
   service-policy QPO_A_2048K_7_0_49_25_10_2_6
policy-map QPI_BBONE_S_20000_V1
  class class-default
   police 20000000 625000 625000 conform-action set-dscp-transmit default exceed-action drop 
policy-map PM_V10_QPO_BBONE_800_V1
policy-map QPO_BBONE_800_V1
  class class-default
    shape average 800000
   service-policy PM_V10_QPO_BBONE_800_V1
policy-map QPI_A_2048K_7_N_0_49_25_10_2_6
  class Voz_Q6
   police cir percent 7 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 49 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Interativa_Q6
   police cir percent 25 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Bulk_Q6
   police cir percent 10 conform-action set-mpls-exp-imposition-transmit 4 exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_A_256K_19_N_0_38_22_0_7_13
  class Voz_Q6
   police cir percent 19 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 38 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Interativa_Q6
   police cir percent 22 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_A_1024K_25_N_0_40_0_0_2_32
  class Voz_Q6
   police cir percent 25 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 40 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_A_2048K_6_N_0_1_0_0_2_90
  class Voz_Q6
   police cir percent 6 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 1 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QDI_A_2048K_6_0_1_0_0_2_90
  class class-default
   police rate 2048000 child-conform-aware conform-action transmit  exceed-action drop 
   service-policy QPI_A_2048K_6_N_0_1_0_0_2_90
policy-map QPI_BBONE_S_30000_V1
  class class-default
   police 30000000 937500 937500 conform-action set-dscp-transmit default exceed-action drop 
policy-map QPO_A_1024K_25_0_40_0_0_2_31
  class Voz_Q6
    priority
   police cir percent 25 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 40
    bandwidth remaining percent 40
    random-detect dscp-based
    random-detect dscp 24 24 packets 40 packets 1
    random-detect dscp 26 24 packets 40 packets 1
    random-detect dscp 28 24 packets 40 packets 1
    random-detect dscp 30 24 packets 40 packets 1
    queue-limit 80 packets
  class NetworkControl_Q6
    bandwidth percent 2
    bandwidth remaining percent 2
    queue-limit 18 packets
  class class-default
    bandwidth percent 31
    bandwidth remaining percent 31
    random-detect dscp-based
    random-detect dscp 0 14 packets 30 packets 1
    queue-limit 60 packets
policy-map QDO_A_1024K_25_0_40_0_0_2_31
  class class-default
    shape average 1024000
   service-policy QPO_A_1024K_25_0_40_0_0_2_31
policy-map QPO_A_256K_10_0_0_4_4_7_74
  class Voz_Q6
    priority
   police cir percent 10 conform-action transmit  exceed-action drop 
  class Interativa_Q6
    bandwidth percent 4
    bandwidth remaining percent 4
    random-detect dscp-based
    random-detect dscp 18 6 packets 8 packets 1
    random-detect dscp 20 6 packets 8 packets 1
    random-detect dscp 22 6 packets 8 packets 1
    queue-limit 16 packets
  class Bulk_Q6
    bandwidth percent 4
    bandwidth remaining percent 4
    random-detect dscp-based
    random-detect dscp 8 6 packets 8 packets 1
    random-detect dscp 10 6 packets 8 packets 1
    random-detect dscp 12 6 packets 8 packets 1
    random-detect dscp 14 6 packets 8 packets 1
    random-detect dscp 32 6 packets 8 packets 1
    queue-limit 16 packets
  class NetworkControl_Q6
    bandwidth percent 7
    bandwidth remaining percent 7
    queue-limit 18 packets
  class class-default
    bandwidth percent 74
    bandwidth remaining percent 74
    random-detect dscp-based
    random-detect dscp 0 12 packets 20 packets 1
    queue-limit 40 packets
policy-map QDO_A_256K_10_0_0_4_4_7_74
  class class-default
    shape average 256000
   service-policy QPO_A_256K_10_0_0_4_4_7_74
policy-map QPI_A_512K_0_N_0_19_0_69_4_7
  class MissaoCritica_Q6
   police cir percent 19 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Bulk_Q6
   police cir percent 69 conform-action set-mpls-exp-imposition-transmit 4 exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QDI_A_512K_0_0_19_0_69_4_7
  class class-default
   police rate 512000 child-conform-aware conform-action transmit  exceed-action drop 
   service-policy QPI_A_512K_0_N_0_19_0_69_4_7
policy-map QPI_A_1024K_0_N_0_40_30_21_2_6
  class MissaoCritica_Q6
   police cir percent 40 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Interativa_Q6
   police cir percent 30 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Bulk_Q6
   police cir percent 21 conform-action set-mpls-exp-imposition-transmit 4 exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_A_2048K_3_N_0_5_3_0_2_86
  class Voz_Q6
   police cir percent 3 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 5 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Interativa_Q6
   police cir percent 3 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map PM_V10_QPO_BBONE_68000_V1
policy-map QPO_BBONE_68000_V1
  class class-default
    shape average 68000000
   service-policy PM_V10_QPO_BBONE_68000_V1
policy-map QPI_A_512K_31_C_0_21_14_28_4_1
  class Voz_Q6
   police cir percent 62 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 21 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Interativa_Q6
   police cir percent 14 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Bulk_Q6
   police cir percent 28 conform-action set-mpls-exp-imposition-transmit 4 exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_A_1024K_13_N_0_25_0_0_2_55
  class Voz_Q6
   police cir percent 13 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 25 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_A_4096K_7_N_36_25_19_7_2_3
  class Voz_Q6
   police cir percent 7 conform-action transmit  exceed-action drop 
  class Video_Q6
   police cir percent 36 conform-action set-mpls-exp-imposition-transmit 5 exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 25 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Interativa_Q6
   police cir percent 19 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Bulk_Q6
   police cir percent 7 conform-action set-mpls-exp-imposition-transmit 4 exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_A_2048K_5_N_0_1_0_0_2_91
  class Voz_Q6
   police cir percent 5 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 1 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map PM_V10_QPO_BBONE_960_V1
policy-map QPO_BBONE_960_V1
  class class-default
    shape average 960000
   service-policy PM_V10_QPO_BBONE_960_V1
policy-map QPI_A_512K_5_N_0_15_0_0_4_75
  class Voz_Q6
   police cir percent 5 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 15 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPO_A_2048K_6_0_1_0_0_2_90
  class Voz_Q6
    priority
   police cir percent 6 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 1
    bandwidth remaining percent 1
    random-detect dscp-based
    random-detect dscp 24 5 packets 9 packets 1
    random-detect dscp 26 5 packets 9 packets 1
    random-detect dscp 28 5 packets 9 packets 1
    random-detect dscp 30 5 packets 9 packets 1
    queue-limit 18 packets
  class NetworkControl_Q6
    bandwidth percent 2
    bandwidth remaining percent 2
    queue-limit 26 packets
  class class-default
    bandwidth percent 90
    bandwidth remaining percent 90
    random-detect dscp-based
    random-detect dscp 0 56 packets 120 packets 1
    queue-limit 240 packets
policy-map QDO_A_2048K_6_0_1_0_0_2_90
  class class-default
    shape average 2048000
   service-policy QPO_A_2048K_6_0_1_0_0_2_90
policy-map QPI_BBONE_S_50000_V1
  class class-default
   police 50000000 1562500 1562500 conform-action set-dscp-transmit default exceed-action drop 
policy-map QOS_POLICY_IN_A_4P_0P
  class REALTIME
   police cir percent 4 conform-action transmit  exceed-action drop 
  class class-default
   set mpls experimental imposition 0
policy-map QOS_DTS_IN_A_960K_32K_0K
  class class-default
   police rate 960000 child-conform-aware conform-action transmit  exceed-action drop 
   service-policy QOS_POLICY_IN_A_4P_0P
policy-map QDI_A_1024K_25_0_40_0_0_2_31
  class class-default
   police rate 1024000 child-conform-aware conform-action transmit  exceed-action drop 
   service-policy QPI_A_1024K_25_N_0_40_0_0_2_31
policy-map QDI_A_256K_10_0_0_4_4_7_74
  class class-default
   police rate 256000 child-conform-aware conform-action transmit  exceed-action drop 
   service-policy QPI_A_256K_10_N_0_0_4_4_7_74
policy-map QPO_A_512K_0_0_19_0_69_4_7
  class MissaoCritica_Q6
    bandwidth percent 19
    bandwidth remaining percent 19
    random-detect dscp-based
    random-detect dscp 24 7 packets 15 packets 1
    random-detect dscp 26 7 packets 15 packets 1
    random-detect dscp 28 7 packets 15 packets 1
    random-detect dscp 30 7 packets 15 packets 1
    queue-limit 30 packets
  class Bulk_Q6
    bandwidth percent 69
    bandwidth remaining percent 69
    random-detect dscp-based
    random-detect dscp 8 14 packets 30 packets 1
    random-detect dscp 10 14 packets 30 packets 1
    random-detect dscp 12 14 packets 30 packets 1
    random-detect dscp 14 14 packets 30 packets 1
    random-detect dscp 32 14 packets 30 packets 1
    queue-limit 60 packets
  class NetworkControl_Q6
    bandwidth percent 4
    bandwidth remaining percent 4
    queue-limit 18 packets
  class class-default
    bandwidth percent 7
    bandwidth remaining percent 7
    random-detect dscp-based
    random-detect dscp 0 5 packets 13 packets 1
    queue-limit 26 packets
policy-map QDO_A_512K_0_0_19_0_69_4_7
  class class-default
    shape average 512000
   service-policy QPO_A_512K_0_0_19_0_69_4_7
policy-map QPI_A_256K_13_N_0_4_0_0_7_75
  class Voz_Q6
   police cir percent 13 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 4 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_A_512K_0_N_0_27_27_15_4_26
  class MissaoCritica_Q6
   police cir percent 27 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Interativa_Q6
   police cir percent 27 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Bulk_Q6
   police cir percent 15 conform-action set-mpls-exp-imposition-transmit 4 exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_A_2048K_5_N_0_0_0_0_2_92
  class Voz_Q6
   police cir percent 5 conform-action transmit  exceed-action drop 
  class class-default
   set mpls experimental imposition 0
policy-map QDI_A_1024K_25_0_40_0_0_2_32
  class class-default
   police rate 1024000 child-conform-aware conform-action transmit  exceed-action drop 
   service-policy QPI_A_1024K_25_N_0_40_0_0_2_32
policy-map QPO_A_1024K_11_0_50_13_13_2_10
  class Voz_Q6
    priority
   police cir percent 11 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 50
    bandwidth remaining percent 50
    random-detect dscp-based
    random-detect dscp 24 32 packets 48 packets 1
    random-detect dscp 26 32 packets 48 packets 1
    random-detect dscp 28 32 packets 48 packets 1
    random-detect dscp 30 32 packets 48 packets 1
    queue-limit 96 packets
  class Interativa_Q6
    bandwidth percent 13
    bandwidth remaining percent 13
    random-detect dscp-based
    random-detect dscp 18 12 packets 20 packets 1
    random-detect dscp 20 12 packets 20 packets 1
    random-detect dscp 22 12 packets 20 packets 1
    queue-limit 40 packets
  class Bulk_Q6
    bandwidth percent 13
    bandwidth remaining percent 13
    random-detect dscp-based
    random-detect dscp 8 12 packets 20 packets 1
    random-detect dscp 10 12 packets 20 packets 1
    random-detect dscp 12 12 packets 20 packets 1
    random-detect dscp 14 12 packets 20 packets 1
    random-detect dscp 32 12 packets 20 packets 1
    queue-limit 40 packets
  class NetworkControl_Q6
    bandwidth percent 2
    bandwidth remaining percent 2
    queue-limit 18 packets
  class class-default
    bandwidth percent 10
    bandwidth remaining percent 10
    random-detect dscp-based
    random-detect dscp 0 7 packets 15 packets 1
    queue-limit 30 packets
policy-map QDO_A_1024K_11_0_50_13_13_2_10
  class class-default
    shape average 1024000
   service-policy QPO_A_1024K_11_0_50_13_13_2_10
policy-map QPI_A_256K_13_N_0_0_4_4_7_71
  class Voz_Q6
   police cir percent 13 conform-action transmit  exceed-action drop 
  class Interativa_Q6
   police cir percent 4 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Bulk_Q6
   police cir percent 4 conform-action set-mpls-exp-imposition-transmit 4 exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QDI_A_2048K_3_0_5_3_0_2_86
  class class-default
   police rate 2048000 child-conform-aware conform-action transmit  exceed-action drop 
   service-policy QPI_A_2048K_3_N_0_5_3_0_2_86
policy-map MARCA-VESPER-SIN
  class class-default
   set dscp 46
policy-map QPI_BBONE_S_34000_V1
  class class-default
   police 34000000 1062500 1062500 conform-action set-dscp-transmit default exceed-action drop 
policy-map QPI_BBONE_S_10240_V1
  class class-default
   police 10240000 320000 320000 conform-action set-dscp-transmit default exceed-action drop 
policy-map QDI_A_2048K_7_0_49_25_10_2_6
  class class-default
   police rate 2048000 child-conform-aware conform-action transmit  exceed-action drop 
   service-policy QPI_A_2048K_7_N_0_49_25_10_2_6
policy-map QOS_POLICY_OUT_A_13P_78P
  class REALTIME
    priority
   police cir percent 13 conform-action transmit  exceed-action drop 
  class BUSINESS
    bandwidth percent 78
    random-detect dscp-based
    random-detect dscp 24 24 packets 40 packets 1
    random-detect dscp 26 24 packets 40 packets 1
    random-detect dscp 28 24 packets 40 packets 1
    random-detect dscp 30 24 packets 40 packets 1
policy-map QPO_A_4096K_3_0_0_0_0_1_46
  class Voz_Q6
    priority
   police cir percent 3 conform-action transmit  exceed-action drop 
  class NetworkControl_Q6
    bandwidth percent 1
    bandwidth remaining percent 1
    queue-limit 96 packets
  class class-default
    bandwidth percent 46
    bandwidth remaining percent 46
    random-detect dscp-based
    random-detect dscp 0 112 packets 240 packets 1
    queue-limit 480 packets
policy-map QPI_BBONE_N_400_V1
  class class-default
   police 400000 12500 12500 conform-action set-mpls-exp-imposition-transmit 0 exceed-action drop 
policy-map QPO_A_4096K_12_0_8_8_13_1_57
  class Voz_Q6
    priority
   police cir percent 12 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 8
    bandwidth remaining percent 8
    random-detect dscp-based
    random-detect dscp 24 14 packets 30 packets 1
    random-detect dscp 26 14 packets 30 packets 1
    random-detect dscp 28 14 packets 30 packets 1
    random-detect dscp 30 14 packets 30 packets 1
    queue-limit 60 packets
  class Interativa_Q6
    bandwidth percent 8
    bandwidth remaining percent 8
    random-detect dscp-based
    random-detect dscp 18 14 packets 30 packets 1
    random-detect dscp 20 14 packets 30 packets 1
    random-detect dscp 22 14 packets 30 packets 1
    queue-limit 60 packets
  class Bulk_Q6
    bandwidth percent 13
    bandwidth remaining percent 13
    random-detect dscp-based
    random-detect dscp 8 32 packets 48 packets 1
    random-detect dscp 10 32 packets 48 packets 1
    random-detect dscp 12 32 packets 48 packets 1
    random-detect dscp 14 32 packets 48 packets 1
    random-detect dscp 32 32 packets 48 packets 1
    queue-limit 96 packets
  class NetworkControl_Q6
    bandwidth percent 1
    bandwidth remaining percent 1
    queue-limit 26 packets
  class class-default
    bandwidth percent 57
    bandwidth remaining percent 57
    random-detect dscp-based
    random-detect dscp 0 112 packets 240 packets 1
    queue-limit 480 packets
policy-map QPO_A_2048K_6_19_16_18_27_1_12
  class VozVideo_Q6
    priority
   police cir percent 25 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 16
    bandwidth remaining percent 16
    random-detect dscp-based
    random-detect dscp 24 14 packets 30 packets 1
    random-detect dscp 26 14 packets 30 packets 1
    random-detect dscp 28 14 packets 30 packets 1
    random-detect dscp 30 14 packets 30 packets 1
    queue-limit 60 packets
  class Interativa_Q6
    bandwidth percent 18
    bandwidth remaining percent 18
    random-detect dscp-based
    random-detect dscp 18 14 packets 30 packets 1
    random-detect dscp 20 14 packets 30 packets 1
    random-detect dscp 22 14 packets 30 packets 1
    queue-limit 60 packets
  class Bulk_Q6
    bandwidth percent 27
    bandwidth remaining percent 27
    random-detect dscp-based
    random-detect dscp 8 32 packets 48 packets 1
    random-detect dscp 10 32 packets 48 packets 1
    random-detect dscp 12 32 packets 48 packets 1
    random-detect dscp 14 32 packets 48 packets 1
    random-detect dscp 32 32 packets 48 packets 1
    queue-limit 96 packets
  class NetworkControl_Q6
    bandwidth percent 1
    bandwidth remaining percent 1
    queue-limit 18 packets
  class class-default
    bandwidth percent 12
    bandwidth remaining percent 12
    random-detect dscp-based
    random-detect dscp 0 12 packets 20 packets 1
    queue-limit 40 packets
policy-map QPO_A_256K_38_0_7_0_0_7_47
  class Voz_Q6
    priority
   police cir percent 38 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 7
    bandwidth remaining percent 7
    random-detect dscp-based
    random-detect dscp 24 5 packets 9 packets 1
    random-detect dscp 26 5 packets 9 packets 1
    random-detect dscp 28 5 packets 9 packets 1
    random-detect dscp 30 5 packets 9 packets 1
    queue-limit 18 packets
  class NetworkControl_Q6
    bandwidth percent 7
    bandwidth remaining percent 7
    queue-limit 18 packets
  class class-default
    bandwidth percent 47
    bandwidth remaining percent 47
    random-detect dscp-based
    random-detect dscp 0 7 packets 15 packets 1
    queue-limit 30 packets
policy-map QPO_A_256K_39_0_7_0_0_7_46
  class Voz_Q6
    priority
   police cir percent 39 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 7
    bandwidth remaining percent 7
    random-detect dscp-based
    random-detect dscp 18 5 packets 7 packets 1
    random-detect dscp 20 5 packets 7 packets 1
    random-detect dscp 22 5 packets 7 packets 1
    random-detect dscp 24 5 packets 9 packets 1
    random-detect dscp 26 5 packets 9 packets 1
    random-detect dscp 28 5 packets 9 packets 1
    random-detect dscp 30 5 packets 9 packets 1
    queue-limit 14 packets
  class NetworkControl_Q6
    bandwidth percent 7
    bandwidth remaining percent 7
    queue-limit 18 packets
  class class-default
    bandwidth percent 46
    bandwidth remaining percent 46
    random-detect dscp-based
    random-detect dscp 0 7 packets 15 packets 1
    queue-limit 30 packets
policy-map QPO_A_512K_25_0_2_0_0_4_68
  class Voz_Q6
    priority
   police cir percent 25 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 2
    bandwidth remaining percent 2
    random-detect dscp-based
    random-detect dscp 24 6 packets 8 packets 1
    random-detect dscp 26 6 packets 8 packets 1
    random-detect dscp 28 6 packets 8 packets 1
    random-detect dscp 30 6 packets 8 packets 1
    queue-limit 16 packets
  class NetworkControl_Q6
    bandwidth percent 4
    bandwidth remaining percent 4
    queue-limit 18 packets
  class class-default
    bandwidth percent 68
    bandwidth remaining percent 68
    random-detect dscp-based
    random-detect dscp 0 14 packets 30 packets 1
    queue-limit 60 packets
policy-map QPO_A_256K_22_0_29_22_13_7_6
  class Voz_Q6
    priority
   police cir percent 22 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 29
    bandwidth remaining percent 29
    random-detect dscp-based
    random-detect dscp 24 7 packets 15 packets 1
    random-detect dscp 26 7 packets 15 packets 1
    random-detect dscp 28 7 packets 15 packets 1
    random-detect dscp 30 7 packets 15 packets 1
    queue-limit 30 packets
  class Interativa_Q6
    bandwidth percent 22
    bandwidth remaining percent 22
    random-detect dscp-based
    random-detect dscp 18 5 packets 13 packets 1
    random-detect dscp 20 5 packets 13 packets 1
    random-detect dscp 22 5 packets 13 packets 1
    queue-limit 26 packets
  class Bulk_Q6
    bandwidth percent 13
    bandwidth remaining percent 13
    random-detect dscp-based
    random-detect dscp 8 5 packets 13 packets 1
    random-detect dscp 10 5 packets 13 packets 1
    random-detect dscp 12 5 packets 13 packets 1
    random-detect dscp 14 5 packets 13 packets 1
    random-detect dscp 32 5 packets 13 packets 1
    queue-limit 26 packets
  class NetworkControl_Q6
    bandwidth percent 7
    bandwidth remaining percent 7
    queue-limit 18 packets
  class class-default
    bandwidth percent 6
    bandwidth remaining percent 6
    random-detect dscp-based
    random-detect dscp 0 6 packets 8 packets 1
    queue-limit 16 packets
policy-map QPI_6144K_11_N_34_0_0_0_2_52
  class Voz_Q6
   police cir percent 11 conform-action transmit  exceed-action drop 
  class Video_Q6
   police cir percent 34 conform-action set-mpls-exp-imposition-transmit 5 exceed-action drop 
  class class-default
   set mpls experimental imposition 0
policy-map QDI_6144K_11_34_0_0_0_2_52
  class class-default
   police rate 6144000 conform-action transmit  exceed-action drop 
   service-policy QPI_6144K_11_N_34_0_0_0_2_52
policy-map QPI_BBONE_N_512_V1
  class class-default
   police 512000 16000 16000 conform-action set-mpls-exp-imposition-transmit 0 exceed-action drop 
policy-map QPO_A_1024K_19_0_8_38_0_2_32
  class Voz_Q6
    priority
   police cir percent 19 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 8
    bandwidth remaining percent 8
    random-detect dscp-based
    random-detect dscp 24 7 packets 15 packets 1
    random-detect dscp 26 7 packets 15 packets 1
    random-detect dscp 28 7 packets 15 packets 1
    random-detect dscp 30 7 packets 15 packets 1
    queue-limit 30 packets
  class Interativa_Q6
    bandwidth percent 38
    bandwidth remaining percent 38
    random-detect dscp-based
    random-detect dscp 18 24 packets 40 packets 1
    random-detect dscp 20 24 packets 40 packets 1
    random-detect dscp 22 24 packets 40 packets 1
    queue-limit 80 packets
  class NetworkControl_Q6
    bandwidth percent 2
    bandwidth remaining percent 2
    queue-limit 18 packets
  class class-default
    bandwidth percent 32
    bandwidth remaining percent 32
    random-detect dscp-based
    random-detect dscp 0 14 packets 30 packets 1
    queue-limit 60 packets
policy-map QPI_BBONE_N_256_V1
  class class-default
   police 256000 8000 8000 conform-action set-mpls-exp-imposition-transmit 0 exceed-action drop 
policy-map QDO_6144K_11_34_0_0_0_2_52
  class class-default
    shape average 6144000
   service-policy QPO_6144K_11_34_0_0_0_2_52
policy-map QPO_A_512K_31_0_21_14_28_4_1
  class Voz_Q6
    priority
   police cir percent 31 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 21
    bandwidth remaining percent 21
    random-detect dscp-based
    random-detect dscp 24 7 packets 15 packets 1
    random-detect dscp 26 7 packets 15 packets 1
    random-detect dscp 28 7 packets 15 packets 1
    random-detect dscp 30 7 packets 15 packets 1
    queue-limit 30 packets
  class Interativa_Q6
    bandwidth percent 14
    bandwidth remaining percent 14
    random-detect dscp-based
    random-detect dscp 18 7 packets 15 packets 1
    random-detect dscp 20 7 packets 15 packets 1
    random-detect dscp 22 7 packets 15 packets 1
    queue-limit 30 packets
  class Bulk_Q6
    bandwidth percent 28
    bandwidth remaining percent 28
    random-detect dscp-based
    random-detect dscp 8 12 packets 20 packets 1
    random-detect dscp 10 12 packets 20 packets 1
    random-detect dscp 12 12 packets 20 packets 1
    random-detect dscp 14 12 packets 20 packets 1
    random-detect dscp 32 12 packets 20 packets 1
    queue-limit 40 packets
  class NetworkControl_Q6
    bandwidth percent 4
    bandwidth remaining percent 4
    queue-limit 18 packets
  class class-default
    bandwidth percent 1
    bandwidth remaining percent 1
    random-detect dscp-based
    random-detect dscp 0 5 packets 7 packets 1
    queue-limit 14 packets
policy-map QPO_A_512K_13_0_35_25_18_4_4
  class Voz_Q6
    priority
   police cir percent 13 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 35
    bandwidth remaining percent 35
    random-detect dscp-based
    random-detect dscp 24 12 packets 20 packets 1
    random-detect dscp 26 12 packets 20 packets 1
    random-detect dscp 28 12 packets 20 packets 1
    random-detect dscp 30 12 packets 20 packets 1
    queue-limit 40 packets
  class Interativa_Q6
    bandwidth percent 25
    bandwidth remaining percent 25
    random-detect dscp-based
    random-detect dscp 18 12 packets 20 packets 1
    random-detect dscp 20 12 packets 20 packets 1
    random-detect dscp 22 12 packets 20 packets 1
    queue-limit 40 packets
  class Bulk_Q6
    bandwidth percent 18
    bandwidth remaining percent 18
    random-detect dscp-based
    random-detect dscp 8 7 packets 15 packets 1
    random-detect dscp 10 7 packets 15 packets 1
    random-detect dscp 12 7 packets 15 packets 1
    random-detect dscp 14 7 packets 15 packets 1
    random-detect dscp 32 7 packets 15 packets 1
    queue-limit 30 packets
  class NetworkControl_Q6
    bandwidth percent 4
    bandwidth remaining percent 4
    queue-limit 18 packets
  class class-default
    bandwidth percent 4
    bandwidth remaining percent 4
    random-detect dscp-based
    random-detect dscp 0 5 packets 9 packets 1
    queue-limit 18 packets
policy-map QPI_BBONE_N_200_V1
  class class-default
   police 200000 6250 6250 conform-action set-mpls-exp-imposition-transmit 0 exceed-action drop 
policy-map QPO_A_2048K_0_0_50_0_16_2_31
  class MissaoCritica_Q6
    bandwidth percent 50
    bandwidth remaining percent 50
    random-detect dscp-based
    random-detect dscp 24 56 packets 120 packets 1
    random-detect dscp 26 56 packets 120 packets 1
    random-detect dscp 28 56 packets 120 packets 1
    random-detect dscp 30 56 packets 120 packets 1
    queue-limit 240 packets
  class Bulk_Q6
    bandwidth percent 16
    bandwidth remaining percent 16
    random-detect dscp-based
    random-detect dscp 8 14 packets 30 packets 1
    random-detect dscp 10 14 packets 30 packets 1
    random-detect dscp 12 14 packets 30 packets 1
    random-detect dscp 14 14 packets 30 packets 1
    random-detect dscp 32 14 packets 30 packets 1
    queue-limit 60 packets
  class NetworkControl_Q6
    bandwidth percent 2
    bandwidth remaining percent 2
    queue-limit 26 packets
  class class-default
    bandwidth percent 31
    bandwidth remaining percent 31
    random-detect dscp-based
    random-detect dscp 0 32 packets 48 packets 1
    queue-limit 96 packets
policy-map MARCA-VESPER-VOZ
  class class-default
   set dscp 46
policy-map QPO_A_256K_13_0_4_0_0_7_75
  class Voz_Q6
    priority
   police cir percent 13 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 4
    bandwidth remaining percent 4
    random-detect dscp-based
    random-detect dscp 24 6 packets 8 packets 1
    random-detect dscp 26 6 packets 8 packets 1
    random-detect dscp 28 6 packets 8 packets 1
    random-detect dscp 30 6 packets 8 packets 1
    queue-limit 16 packets
  class NetworkControl_Q6
    bandwidth percent 7
    bandwidth remaining percent 7
    queue-limit 18 packets
  class class-default
    bandwidth percent 75
    bandwidth remaining percent 75
    random-detect dscp-based
    random-detect dscp 0 12 packets 20 packets 1
    queue-limit 40 packets
policy-map LAN_IN_OMEGA_TER
policy-map QOS_POLICY_OUT_A_4P_0P
  class REALTIME
    priority
   police cir percent 4 conform-action transmit  exceed-action drop 
policy-map QPO_A_512K_0_0_27_27_15_4_26
  class MissaoCritica_Q6
    bandwidth percent 27
    bandwidth remaining percent 27
    random-detect dscp-based
    random-detect dscp 24 12 packets 20 packets 1
    random-detect dscp 26 12 packets 20 packets 1
    random-detect dscp 28 12 packets 20 packets 1
    random-detect dscp 30 12 packets 20 packets 1
    queue-limit 40 packets
  class Interativa_Q6
    bandwidth percent 27
    bandwidth remaining percent 27
    random-detect dscp-based
    random-detect dscp 18 12 packets 20 packets 1
    random-detect dscp 20 12 packets 20 packets 1
    random-detect dscp 22 12 packets 20 packets 1
    queue-limit 40 packets
  class Bulk_Q6
    bandwidth percent 15
    bandwidth remaining percent 15
    random-detect dscp-based
    random-detect dscp 8 7 packets 15 packets 1
    random-detect dscp 10 7 packets 15 packets 1
    random-detect dscp 12 7 packets 15 packets 1
    random-detect dscp 14 7 packets 15 packets 1
    random-detect dscp 32 7 packets 15 packets 1
    queue-limit 30 packets
  class NetworkControl_Q6
    bandwidth percent 4
    bandwidth remaining percent 4
    queue-limit 18 packets
  class class-default
    bandwidth percent 26
    bandwidth remaining percent 26
    random-detect dscp-based
    random-detect dscp 0 12 packets 20 packets 1
    queue-limit 40 packets
policy-map QPO_A_2048K_5_0_0_0_0_2_92
  class Voz_Q6
    priority
   police cir percent 5 conform-action transmit  exceed-action drop 
  class NetworkControl_Q6
    bandwidth percent 2
    bandwidth remaining percent 2
    queue-limit 26 packets
  class class-default
    bandwidth percent 92
    bandwidth remaining percent 92
    random-detect dscp-based
    random-detect dscp 0 56 packets 120 packets 1
    queue-limit 240 packets
policy-map QPO_A_256K_13_0_0_4_4_7_71
  class Voz_Q6
    priority
   police cir percent 13 conform-action transmit  exceed-action drop 
  class Interativa_Q6
    bandwidth percent 4
    bandwidth remaining percent 4
    random-detect dscp-based
    random-detect dscp 18 6 packets 8 packets 1
    random-detect dscp 20 6 packets 8 packets 1
    random-detect dscp 22 6 packets 8 packets 1
    queue-limit 16 packets
  class Bulk_Q6
    bandwidth percent 4
    bandwidth remaining percent 4
    random-detect dscp-based
    random-detect dscp 8 6 packets 8 packets 1
    random-detect dscp 10 6 packets 8 packets 1
    random-detect dscp 12 6 packets 8 packets 1
    random-detect dscp 14 6 packets 8 packets 1
    random-detect dscp 32 6 packets 8 packets 1
    queue-limit 16 packets
  class NetworkControl_Q6
    bandwidth percent 7
    bandwidth remaining percent 7
    queue-limit 18 packets
  class class-default
    bandwidth percent 71
    bandwidth remaining percent 71
    random-detect dscp-based
    random-detect dscp 0 12 packets 20 packets 1
    queue-limit 40 packets
policy-map QPO_A_512K_5_0_15_0_0_4_75
  class Voz_Q6
    priority
   police cir percent 5 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 15
    bandwidth remaining percent 15
    random-detect dscp-based
    random-detect dscp 24 7 packets 15 packets 1
    random-detect dscp 26 7 packets 15 packets 1
    random-detect dscp 28 7 packets 15 packets 1
    random-detect dscp 30 7 packets 15 packets 1
    queue-limit 30 packets
  class NetworkControl_Q6
    bandwidth percent 4
    bandwidth remaining percent 4
    queue-limit 18 packets
  class class-default
    bandwidth percent 75
    bandwidth remaining percent 75
    random-detect dscp-based
    random-detect dscp 0 24 packets 40 packets 1
    queue-limit 80 packets
policy-map QPO_A_256K_31_0_21_13_26_7_1
  class Voz_Q6
    priority
   police cir percent 31 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 21
    bandwidth remaining percent 21
    random-detect dscp-based
    random-detect dscp 24 5 packets 13 packets 1
    random-detect dscp 26 5 packets 13 packets 1
    random-detect dscp 28 5 packets 13 packets 1
    random-detect dscp 30 5 packets 13 packets 1
    queue-limit 26 packets
  class Interativa_Q6
    bandwidth percent 13
    bandwidth remaining percent 13
    random-detect dscp-based
    random-detect dscp 18 5 packets 13 packets 1
    random-detect dscp 20 5 packets 13 packets 1
    random-detect dscp 22 5 packets 13 packets 1
    queue-limit 26 packets
  class Bulk_Q6
    bandwidth percent 26
    bandwidth remaining percent 26
    random-detect dscp-based
    random-detect dscp 8 7 packets 15 packets 1
    random-detect dscp 10 7 packets 15 packets 1
    random-detect dscp 12 7 packets 15 packets 1
    random-detect dscp 14 7 packets 15 packets 1
    random-detect dscp 32 7 packets 15 packets 1
    queue-limit 30 packets
  class NetworkControl_Q6
    bandwidth percent 7
    bandwidth remaining percent 7
    queue-limit 18 packets
  class class-default
    bandwidth percent 1
    bandwidth remaining percent 1
    random-detect dscp-based
    random-detect dscp 0 5 packets 7 packets 1
    queue-limit 14 packets
policy-map QPO_A_1024K_13_0_25_0_0_2_55
  class Voz_Q6
    priority
   police cir percent 13 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 25
    bandwidth remaining percent 25
    random-detect dscp-based
    random-detect dscp 24 14 packets 30 packets 1
    random-detect dscp 26 14 packets 30 packets 1
    random-detect dscp 28 14 packets 30 packets 1
    random-detect dscp 30 14 packets 30 packets 1
    queue-limit 60 packets
  class NetworkControl_Q6
    bandwidth percent 2
    bandwidth remaining percent 2
    queue-limit 26 packets
  class class-default
    bandwidth percent 55
    bandwidth remaining percent 55
    random-detect dscp-based
    random-detect dscp 0 32 packets 48 packets 1
    queue-limit 96 packets
policy-map QPO_A_4096K_7_36_25_19_7_2_3
  class VozVideo_Q6
    priority
   police cir percent 43 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 25
    bandwidth remaining percent 25
    random-detect dscp-based
    random-detect dscp 24 56 packets 120 packets 1
    random-detect dscp 26 56 packets 120 packets 1
    random-detect dscp 28 56 packets 120 packets 1
    random-detect dscp 30 56 packets 120 packets 1
    queue-limit 240 packets
  class Interativa_Q6
    bandwidth percent 19
    bandwidth remaining percent 19
    random-detect dscp-based
    random-detect dscp 18 32 packets 64 packets 1
    random-detect dscp 20 32 packets 64 packets 1
    random-detect dscp 22 32 packets 64 packets 1
    queue-limit 128 packets
  class Bulk_Q6
    bandwidth percent 7
    bandwidth remaining percent 7
    random-detect dscp-based
    random-detect dscp 8 14 packets 30 packets 1
    random-detect dscp 10 14 packets 30 packets 1
    random-detect dscp 12 14 packets 30 packets 1
    random-detect dscp 14 14 packets 30 packets 1
    random-detect dscp 32 14 packets 30 packets 1
    queue-limit 60 packets
  class NetworkControl_Q6
    bandwidth percent 2
    bandwidth remaining percent 2
    queue-limit 30 packets
  class class-default
    bandwidth percent 3
    bandwidth remaining percent 3
    random-detect dscp-based
    random-detect dscp 0 12 packets 20 packets 1
    queue-limit 40 packets
policy-map QPO_A_2048K_5_0_1_0_0_2_91
  class Voz_Q6
    priority
   police cir percent 5 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 1
    bandwidth remaining percent 1
    random-detect dscp-based
    random-detect dscp 24 5 packets 9 packets 1
    random-detect dscp 26 5 packets 9 packets 1
    random-detect dscp 28 5 packets 9 packets 1
    random-detect dscp 30 5 packets 9 packets 1
    queue-limit 18 packets
  class NetworkControl_Q6
    bandwidth percent 2
    bandwidth remaining percent 2
    queue-limit 26 packets
  class class-default
    bandwidth percent 91
    bandwidth remaining percent 91
    random-detect dscp-based
    random-detect dscp 0 56 packets 120 packets 1
    queue-limit 240 packets
policy-map QPO_A_256K_19_0_38_22_0_7_13
  class Voz_Q6
    priority
   police cir percent 19 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 38
    bandwidth remaining percent 38
    random-detect dscp-based
    random-detect dscp 24 7 packets 15 packets 1
    random-detect dscp 26 7 packets 15 packets 1
    random-detect dscp 28 7 packets 15 packets 1
    random-detect dscp 30 7 packets 15 packets 1
    queue-limit 30 packets
  class Interativa_Q6
    bandwidth percent 22
    bandwidth remaining percent 22
    random-detect dscp-based
    random-detect dscp 18 5 packets 13 packets 1
    random-detect dscp 20 5 packets 13 packets 1
    random-detect dscp 22 5 packets 13 packets 1
    queue-limit 26 packets
  class NetworkControl_Q6
    bandwidth percent 7
    bandwidth remaining percent 7
    queue-limit 18 packets
  class class-default
    bandwidth percent 13
    bandwidth remaining percent 13
    random-detect dscp-based
    random-detect dscp 0 5 packets 13 packets 1
    queue-limit 26 packets
policy-map QPO_A_1024K_0_0_40_30_21_2_6
  class MissaoCritica_Q6
    bandwidth percent 40
    bandwidth remaining percent 40
    random-detect dscp-based
    random-detect dscp 24 24 packets 40 packets 1
    random-detect dscp 26 24 packets 40 packets 1
    random-detect dscp 28 24 packets 40 packets 1
    random-detect dscp 30 24 packets 40 packets 1
    queue-limit 80 packets
  class Interativa_Q6
    bandwidth percent 30
    bandwidth remaining percent 30
    random-detect dscp-based
    random-detect dscp 18 14 packets 30 packets 1
    random-detect dscp 20 14 packets 30 packets 1
    random-detect dscp 22 14 packets 30 packets 1
    queue-limit 60 packets
  class Bulk_Q6
    bandwidth percent 21
    bandwidth remaining percent 21
    random-detect dscp-based
    random-detect dscp 8 12 packets 20 packets 1
    random-detect dscp 10 12 packets 20 packets 1
    random-detect dscp 12 12 packets 20 packets 1
    random-detect dscp 14 12 packets 20 packets 1
    random-detect dscp 32 12 packets 20 packets 1
    queue-limit 40 packets
  class NetworkControl_Q6
    bandwidth percent 2
    bandwidth remaining percent 2
    queue-limit 18 packets
  class class-default
    bandwidth percent 6
    bandwidth remaining percent 6
    random-detect dscp-based
    random-detect dscp 0 5 packets 13 packets 1
    queue-limit 26 packets
policy-map QPI_BBONE_N_800_V1
  class class-default
   police 800000 25000 25000 conform-action set-mpls-exp-imposition-transmit 0 exceed-action drop 
policy-map QOS_POLICY_OUT_A_25P_51P
  class REALTIME
    priority
   police cir percent 25 conform-action transmit  exceed-action drop 
  class BUSINESS
    bandwidth percent 51
    random-detect dscp-based
    random-detect dscp 24 7 packets 15 packets 1
    random-detect dscp 26 7 packets 15 packets 1
    random-detect dscp 28 7 packets 15 packets 1
    random-detect dscp 30 7 packets 15 packets 1
policy-map QPO_A_512K_5_0_0_13_0_4_77
  class Voz_Q6
    priority
   police cir percent 5 conform-action transmit  exceed-action drop 
  class Interativa_Q6
    bandwidth percent 13
    bandwidth remaining percent 13
    random-detect dscp-based
    random-detect dscp 18 7 packets 15 packets 1
    random-detect dscp 20 7 packets 15 packets 1
    random-detect dscp 22 7 packets 15 packets 1
    queue-limit 30 packets
  class NetworkControl_Q6
    bandwidth percent 4
    bandwidth remaining percent 4
    queue-limit 18 packets
  class class-default
    bandwidth percent 77
    bandwidth remaining percent 77
    random-detect dscp-based
    random-detect dscp 0 24 packets 40 packets 1
    queue-limit 80 packets
policy-map QPI_BBONE_N_128_V1
  class class-default
   police 128000 4470 4470 conform-action set-mpls-exp-imposition-transmit 0 exceed-action drop 
policy-map ZERA-EXP-Saida
  class class-default
   set mpls experimental imposition 0
policy-map QPO_A_512K_10_30_35_0_0_4_20
  class VozVideo_Q6
    priority
   police cir percent 40 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 35
    bandwidth remaining percent 35
    random-detect dscp-based
    random-detect dscp 24 12 packets 20 packets 1
    random-detect dscp 26 12 packets 20 packets 1
    random-detect dscp 28 12 packets 20 packets 1
    random-detect dscp 30 12 packets 20 packets 1
    queue-limit 40 packets
  class NetworkControl_Q6
    bandwidth percent 4
    bandwidth remaining percent 4
    queue-limit 18 packets
  class class-default
    bandwidth percent 20
    bandwidth remaining percent 20
    random-detect dscp-based
    random-detect dscp 0 7 packets 15 packets 1
    queue-limit 30 packets
policy-map QPO_A_512K_11_0_33_25_18_4_8
  class Voz_Q6
    priority
   police cir percent 11 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 33
    bandwidth remaining percent 33
    random-detect dscp-based
    random-detect dscp 24 12 packets 20 packets 1
    random-detect dscp 26 12 packets 20 packets 1
    random-detect dscp 28 12 packets 20 packets 1
    random-detect dscp 30 12 packets 20 packets 1
    queue-limit 40 packets
  class Interativa_Q6
    bandwidth percent 25
    bandwidth remaining percent 25
    random-detect dscp-based
    random-detect dscp 18 12 packets 20 packets 1
    random-detect dscp 20 12 packets 20 packets 1
    random-detect dscp 22 12 packets 20 packets 1
    queue-limit 40 packets
  class Bulk_Q6
    bandwidth percent 18
    bandwidth remaining percent 18
    random-detect dscp-based
    random-detect dscp 8 7 packets 15 packets 1
    random-detect dscp 10 7 packets 15 packets 1
    random-detect dscp 12 7 packets 15 packets 1
    random-detect dscp 14 7 packets 15 packets 1
    random-detect dscp 32 7 packets 15 packets 1
    queue-limit 30 packets
  class NetworkControl_Q6
    bandwidth percent 4
    bandwidth remaining percent 4
    queue-limit 18 packets
  class class-default
    bandwidth percent 8
    bandwidth remaining percent 8
    random-detect dscp-based
    random-detect dscp 0 5 packets 13 packets 1
    queue-limit 26 packets
policy-map QPO_A_256K_22_0_50_0_0_7_19
  class Voz_Q6
    priority
   police cir percent 22 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 50
    bandwidth remaining percent 50
    random-detect dscp-based
    random-detect dscp 24 12 packets 20 packets 1
    random-detect dscp 26 12 packets 20 packets 1
    random-detect dscp 28 12 packets 20 packets 1
    random-detect dscp 30 12 packets 20 packets 1
    queue-limit 40 packets
  class NetworkControl_Q6
    bandwidth percent 7
    bandwidth remaining percent 7
    queue-limit 18 packets
  class class-default
    bandwidth percent 19
    bandwidth remaining percent 19
    random-detect dscp-based
    random-detect dscp 0 5 packets 13 packets 1
    queue-limit 26 packets
policy-map QPO_A_2048K_8_0_50_0_0_2_39
  class Voz_Q6
    priority
   police cir percent 8 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 50
    bandwidth remaining percent 50
    random-detect dscp-based
    random-detect dscp 24 56 packets 120 packets 1
    random-detect dscp 26 56 packets 120 packets 1
    random-detect dscp 28 56 packets 120 packets 1
    random-detect dscp 30 56 packets 120 packets 1
    queue-limit 240 packets
  class NetworkControl_Q6
    bandwidth percent 2
    bandwidth remaining percent 2
    queue-limit 26 packets
  class class-default
    bandwidth percent 39
    bandwidth remaining percent 39
    random-detect dscp-based
    random-detect dscp 0 32 packets 64 packets 1
    queue-limit 128 packets
policy-map QPO_A_1024K_10_0_2_0_0_4_83
  class Voz_Q6
    priority
   police cir percent 10 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 2
    bandwidth remaining percent 2
    random-detect dscp-based
    random-detect dscp 24 5 packets 9 packets 1
    random-detect dscp 26 5 packets 9 packets 1
    random-detect dscp 28 5 packets 9 packets 1
    random-detect dscp 30 5 packets 9 packets 1
    queue-limit 18 packets
  class NetworkControl_Q6
    bandwidth percent 4
    bandwidth remaining percent 4
    queue-limit 26 packets
  class class-default
    bandwidth percent 83
    bandwidth remaining percent 83
    random-detect dscp-based
    random-detect dscp 0 32 packets 64 packets 1
    queue-limit 128 packets
policy-map MARCA-GER
  class class-default
   set dscp 16
policy-map QPO_A_256K_19_0_25_0_0_7_47
  class Voz_Q6
    priority
   police cir percent 19 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 25
    bandwidth remaining percent 25
    random-detect dscp-based
    random-detect dscp 24 7 packets 15 packets 1
    random-detect dscp 26 7 packets 15 packets 1
    random-detect dscp 28 7 packets 15 packets 1
    random-detect dscp 30 7 packets 15 packets 1
    queue-limit 30 packets
  class NetworkControl_Q6
    bandwidth percent 7
    bandwidth remaining percent 7
    queue-limit 18 packets
  class class-default
    bandwidth percent 47
    bandwidth remaining percent 47
    random-detect dscp-based
    random-detect dscp 0 7 packets 15 packets 1
    queue-limit 30 packets
policy-map QPO_A_256K_10_0_60_13_0_7_9
  class Voz_Q6
    priority
   police cir percent 10 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 60
    bandwidth remaining percent 60
    random-detect dscp-based
    random-detect dscp 24 12 packets 20 packets 1
    random-detect dscp 26 12 packets 20 packets 1
    random-detect dscp 28 12 packets 20 packets 1
    random-detect dscp 30 12 packets 20 packets 1
    queue-limit 40 packets
  class Interativa_Q6
    bandwidth percent 13
    bandwidth remaining percent 13
    random-detect dscp-based
    random-detect dscp 18 5 packets 13 packets 1
    random-detect dscp 20 5 packets 13 packets 1
    random-detect dscp 22 5 packets 13 packets 1
    queue-limit 26 packets
  class NetworkControl_Q6
    bandwidth percent 7
    bandwidth remaining percent 7
    queue-limit 18 packets
  class class-default
    bandwidth percent 9
    bandwidth remaining percent 9
    random-detect dscp-based
    random-detect dscp 0 5 packets 9 packets 1
    queue-limit 18 packets
policy-map QPO_A_2048K_10_21_11_20_11_2_24
  class VozVideo_Q6
    priority
   police cir percent 31 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 11
    bandwidth remaining percent 11
    random-detect dscp-based
    random-detect dscp 24 12 packets 20 packets 1
    random-detect dscp 26 12 packets 20 packets 1
    random-detect dscp 28 12 packets 20 packets 1
    random-detect dscp 30 12 packets 20 packets 1
    queue-limit 40 packets
  class Interativa_Q6
    bandwidth percent 20
    bandwidth remaining percent 20
    random-detect dscp-based
    random-detect dscp 18 24 packets 40 packets 1
    random-detect dscp 20 24 packets 40 packets 1
    random-detect dscp 22 24 packets 40 packets 1
    queue-limit 80 packets
  class Bulk_Q6
    bandwidth percent 11
    bandwidth remaining percent 11
    random-detect dscp-based
    random-detect dscp 8 12 packets 20 packets 1
    random-detect dscp 10 12 packets 20 packets 1
    random-detect dscp 12 12 packets 20 packets 1
    random-detect dscp 14 12 packets 20 packets 1
    random-detect dscp 32 12 packets 20 packets 1
    queue-limit 40 packets
  class NetworkControl_Q6
    bandwidth percent 2
    bandwidth remaining percent 2
    queue-limit 26 packets
  class class-default
    bandwidth percent 24
    bandwidth remaining percent 24
    random-detect dscp-based
    random-detect dscp 0 24 packets 40 packets 1
    queue-limit 80 packets
policy-map QPI_BBONE_N_1500_V1
  class class-default
   police 1504000 47000 47000 conform-action set-mpls-exp-imposition-transmit 0 exceed-action drop 
policy-map QPO_A_2048K_7_0_50_0_0_2_40
  class Voz_Q6
    priority
   police cir percent 7 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 50
    bandwidth remaining percent 50
    random-detect dscp-based
    random-detect dscp 24 56 packets 120 packets 1
    random-detect dscp 26 56 packets 120 packets 1
    random-detect dscp 28 56 packets 120 packets 1
    random-detect dscp 30 56 packets 120 packets 1
    queue-limit 240 packets
  class NetworkControl_Q6
    bandwidth percent 2
    bandwidth remaining percent 2
    queue-limit 26 packets
  class class-default
    bandwidth percent 40
    bandwidth remaining percent 40
    random-detect dscp-based
    random-detect dscp 0 32 packets 64 packets 1
    queue-limit 128 packets
policy-map QPI_64_0_0_40_8_0_0_0B_A_V1
  class MISSAO_CRITICA
   police cir percent 63 conform-action transmit  exceed-action set-dscp-transmit af43
  class GERENCIAMENTO
   police cir percent 13 conform-action transmit  exceed-action set-dscp-transmit af32
policy-map QPI_BBONE_N_6144_V1
  class class-default
   police 6144000 192000 192000 conform-action set-mpls-exp-imposition-transmit 0 exceed-action drop 
policy-map QPI_BBONE_N_1024_V1
  class class-default
   police 1024000 32000 32000 conform-action set-mpls-exp-imposition-transmit 0 exceed-action drop 
policy-map QPI_Correios_128K_PPP_IOS_D_V1
  class REAL_TIME_CORREIOS
   police cir percent 12 conform-action transmit  exceed-action drop 
  class MISSAO_CRITICA_CORREIOS
   police cir percent 40 conform-action transmit  exceed-action set-dscp-transmit af41
  class GERENCIAMENTO_CORREIOS
   police cir percent 9 conform-action transmit  exceed-action set-dscp-transmit af31
  class NETWORK_CONTROL_CORREIOS
   police cir percent 7 conform-action transmit  exceed-action set-dscp-transmit cs6
policy-map QPI_512K_BBrasil_NAC_GACC_V1
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
policy-map QPO_A_2048K_21_0_35_20_0_2_21
  class Voz_Q6
    priority
   police cir percent 21 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 35
    bandwidth remaining percent 35
    random-detect dscp-based
    random-detect dscp 24 32 packets 48 packets 1
    random-detect dscp 26 32 packets 48 packets 1
    random-detect dscp 28 32 packets 48 packets 1
    random-detect dscp 30 32 packets 48 packets 1
    queue-limit 96 packets
  class Interativa_Q6
    bandwidth percent 20
    bandwidth remaining percent 20
    random-detect dscp-based
    random-detect dscp 18 24 packets 40 packets 1
    random-detect dscp 20 24 packets 40 packets 1
    random-detect dscp 22 24 packets 40 packets 1
    queue-limit 80 packets
  class NetworkControl_Q6
    bandwidth percent 2
    bandwidth remaining percent 2
    queue-limit 26 packets
  class class-default
    bandwidth percent 21
    bandwidth remaining percent 21
    random-detect dscp-based
    random-detect dscp 0 24 packets 40 packets 1
    queue-limit 80 packets
policy-map QPO_A_512K_13_0_46_24_8_4_4
  class Voz_Q6
    priority
   police cir percent 13 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 46
    bandwidth remaining percent 46
    random-detect dscp-based
    random-detect dscp 24 12 packets 20 packets 1
    random-detect dscp 26 12 packets 20 packets 1
    random-detect dscp 28 12 packets 20 packets 1
    random-detect dscp 30 12 packets 20 packets 1
    queue-limit 40 packets
  class Interativa_Q6
    bandwidth percent 24
    bandwidth remaining percent 24
    random-detect dscp-based
    random-detect dscp 18 7 packets 15 packets 1
    random-detect dscp 20 7 packets 15 packets 1
    random-detect dscp 22 7 packets 15 packets 1
    queue-limit 30 packets
  class Bulk_Q6
    bandwidth percent 8
    bandwidth remaining percent 8
    random-detect dscp-based
    random-detect dscp 8 5 packets 13 packets 1
    random-detect dscp 10 5 packets 13 packets 1
    random-detect dscp 12 5 packets 13 packets 1
    random-detect dscp 14 5 packets 13 packets 1
    random-detect dscp 32 5 packets 13 packets 1
    queue-limit 26 packets
  class NetworkControl_Q6
    bandwidth percent 4
    bandwidth remaining percent 4
    queue-limit 18 packets
  class class-default
    bandwidth percent 4
    bandwidth remaining percent 4
    random-detect dscp-based
    random-detect dscp 0 5 packets 9 packets 1
    queue-limit 18 packets
policy-map QPO_A_512K_25_0_50_0_0_4_19
  class Voz_Q6
    priority
   police cir percent 25 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 50
    bandwidth remaining percent 50
    random-detect dscp-based
    random-detect dscp 24 14 packets 30 packets 1
    random-detect dscp 26 14 packets 30 packets 1
    random-detect dscp 28 14 packets 30 packets 1
    random-detect dscp 30 14 packets 30 packets 1
    queue-limit 60 packets
  class NetworkControl_Q6
    bandwidth percent 4
    bandwidth remaining percent 4
    queue-limit 18 packets
  class class-default
    bandwidth percent 19
    bandwidth remaining percent 19
    random-detect dscp-based
    random-detect dscp 0 7 packets 15 packets 1
    queue-limit 30 packets
policy-map QPO_A_2048K_30_0_20_2_35_2_10
  class Voz_Q6
    priority
   police cir percent 30 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 20
    bandwidth remaining percent 20
    random-detect dscp-based
    random-detect dscp 24 24 packets 40 packets 1
    random-detect dscp 26 24 packets 40 packets 1
    random-detect dscp 28 24 packets 40 packets 1
    random-detect dscp 30 24 packets 40 packets 1
    queue-limit 80 packets
  class Interativa_Q6
    bandwidth percent 2
    bandwidth remaining percent 2
    random-detect dscp-based
    random-detect dscp 18 5 packets 13 packets 1
    random-detect dscp 20 5 packets 13 packets 1
    random-detect dscp 22 5 packets 13 packets 1
    queue-limit 26 packets
  class Bulk_Q6
    bandwidth percent 35
    bandwidth remaining percent 35
    random-detect dscp-based
    random-detect dscp 8 32 packets 48 packets 1
    random-detect dscp 10 32 packets 48 packets 1
    random-detect dscp 12 32 packets 48 packets 1
    random-detect dscp 14 32 packets 48 packets 1
    random-detect dscp 32 32 packets 48 packets 1
    queue-limit 96 packets
  class NetworkControl_Q6
    bandwidth percent 2
    bandwidth remaining percent 2
    queue-limit 26 packets
  class class-default
    bandwidth percent 10
    bandwidth remaining percent 10
    random-detect dscp-based
    random-detect dscp 0 12 packets 20 packets 1
    queue-limit 40 packets
policy-map QPO_64_0_0_40_8_0_0_0B_A_V1
  class MISSAO_CRITICA
    bandwidth percent 63
    bandwidth remaining percent 63
    random-detect dscp-based
    random-detect dscp 32 5 packets 13 packets 1
    random-detect dscp 36 5 packets 13 packets 1
    random-detect dscp 38 5 packets 13 packets 1
    queue-limit 26 packets
  class GERENCIAMENTO
    bandwidth percent 13
    bandwidth remaining percent 13
    random-detect dscp-based
    random-detect dscp 24 5 packets 7 packets 1
    random-detect dscp 26 5 packets 7 packets 1
    random-detect dscp 28 5 packets 7 packets 1
    queue-limit 14 packets
  class class-default
    bandwidth percent 24
    bandwidth remaining percent 24
    random-detect dscp-based
    random-detect dscp 0 6 packets 8 packets 1
    queue-limit 16 packets
policy-map QPO_A_1024K_13_0_16_48_16_2_4
  class Voz_Q6
    priority
   police cir percent 13 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 16
    bandwidth remaining percent 16
    random-detect dscp-based
    random-detect dscp 24 12 packets 20 packets 1
    random-detect dscp 26 12 packets 20 packets 1
    random-detect dscp 28 12 packets 20 packets 1
    random-detect dscp 30 12 packets 20 packets 1
    queue-limit 40 packets
  class Interativa_Q6
    bandwidth percent 48
    bandwidth remaining percent 48
    random-detect dscp-based
    random-detect dscp 18 24 packets 40 packets 1
    random-detect dscp 20 24 packets 40 packets 1
    random-detect dscp 22 24 packets 40 packets 1
    queue-limit 80 packets
  class Bulk_Q6
    bandwidth percent 16
    bandwidth remaining percent 16
    random-detect dscp-based
    random-detect dscp 8 12 packets 20 packets 1
    random-detect dscp 10 12 packets 20 packets 1
    random-detect dscp 12 12 packets 20 packets 1
    random-detect dscp 14 12 packets 20 packets 1
    random-detect dscp 32 12 packets 20 packets 1
    queue-limit 40 packets
  class NetworkControl_Q6
    bandwidth percent 2
    bandwidth remaining percent 2
    queue-limit 18 packets
  class class-default
    bandwidth percent 4
    bandwidth remaining percent 4
    random-detect dscp-based
    random-detect dscp 0 5 packets 13 packets 1
    queue-limit 26 packets
policy-map QPO_A_512K_13_0_41_18_13_4_10
  class Voz_Q6
    priority
   police cir percent 13 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 41
    bandwidth remaining percent 41
    random-detect dscp-based
    random-detect dscp 24 12 packets 20 packets 1
    random-detect dscp 26 12 packets 20 packets 1
    random-detect dscp 28 12 packets 20 packets 1
    random-detect dscp 30 12 packets 20 packets 1
    queue-limit 40 packets
  class Interativa_Q6
    bandwidth percent 18
    bandwidth remaining percent 18
    random-detect dscp-based
    random-detect dscp 18 7 packets 15 packets 1
    random-detect dscp 20 7 packets 15 packets 1
    random-detect dscp 22 7 packets 15 packets 1
    queue-limit 30 packets
  class Bulk_Q6
    bandwidth percent 13
    bandwidth remaining percent 13
    random-detect dscp-based
    random-detect dscp 8 7 packets 15 packets 1
    random-detect dscp 10 7 packets 15 packets 1
    random-detect dscp 12 7 packets 15 packets 1
    random-detect dscp 14 7 packets 15 packets 1
    random-detect dscp 32 7 packets 15 packets 1
    queue-limit 30 packets
  class NetworkControl_Q6
    bandwidth percent 4
    bandwidth remaining percent 4
    queue-limit 18 packets
  class class-default
    bandwidth percent 10
    bandwidth remaining percent 10
    random-detect dscp-based
    random-detect dscp 0 5 packets 13 packets 1
    queue-limit 26 packets
policy-map QPO_Correios_128K_PPP_IOS_D_V1
  class REAL_TIME_CORREIOS
    priority
   police cir percent 12 conform-action transmit  exceed-action drop 
  class MISSAO_CRITICA_CORREIOS
    bandwidth percent 40
    random-detect dscp-based
    random-detect dscp 34 16 packets 32 packets 1
    random-detect dscp 36 16 packets 32 packets 1
    random-detect dscp 38 16 packets 32 packets 1
  class GERENCIAMENTO_CORREIOS
    bandwidth percent 9
    random-detect dscp-based
    random-detect dscp 26 16 packets 32 packets 1
    random-detect dscp 28 16 packets 32 packets 1
    random-detect dscp 30 16 packets 32 packets 1
  class NETWORK_CONTROL_CORREIOS
    bandwidth percent 6
    random-detect dscp-based
    random-detect dscp 16 16 packets 32 packets 1
    random-detect dscp 48 16 packets 32 packets 1
    random-detect dscp 56 16 packets 32 packets 1
  class BEST_EFFORT
    bandwidth percent 32
    random-detect dscp-based
    random-detect dscp 0 16 packets 32 packets 1
policy-map QPO_512K_BBrasil_NAC_GACC_V1
  class TEMPO_REAL_NAC
    priority
   police cir percent 21 bc 300 ms conform-action transmit  exceed-action drop 
  class MISSAO_CRITICA_NAC
    bandwidth percent 40
    bandwidth remaining percent 40
    random-detect dscp-based
    random-detect dscp 32 12 packets 20 packets 1
    random-detect dscp 34 12 packets 20 packets 1
    random-detect dscp 38 12 packets 20 packets 1
    queue-limit 40 packets
  class GERENCIAMENTO_NAC
    bandwidth percent 15
    bandwidth remaining percent 15
    random-detect dscp-based
    random-detect dscp 24 7 packets 15 packets 1
    random-detect dscp 26 7 packets 15 packets 1
    random-detect dscp 30 7 packets 15 packets 1
    queue-limit 30 packets
  class NETWORK_CONTROL_NAC
    bandwidth percent 3
    bandwidth remaining percent 3
    random-detect dscp-based
    random-detect dscp 48 5 packets 9 packets 1
    queue-limit 18 packets
  class STANDARD_NAC
    bandwidth percent 20
    bandwidth remaining percent 20
    random-detect dscp-based
    random-detect dscp 0 7 packets 15 packets 1
    queue-limit 30 packets
policy-map QPO_A_2048K_16_40_6_0_25_2_10
  class VozVideo_Q6
    priority
   police cir percent 56 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 6
    bandwidth remaining percent 6
    random-detect dscp-based
    random-detect dscp 24 7 packets 15 packets 1
    random-detect dscp 26 7 packets 15 packets 1
    random-detect dscp 28 7 packets 15 packets 1
    random-detect dscp 30 7 packets 15 packets 1
    queue-limit 30 packets
  class Bulk_Q6
    bandwidth percent 25
    bandwidth remaining percent 25
    random-detect dscp-based
    random-detect dscp 8 32 packets 48 packets 1
    random-detect dscp 10 32 packets 48 packets 1
    random-detect dscp 12 32 packets 48 packets 1
    random-detect dscp 14 32 packets 48 packets 1
    random-detect dscp 32 32 packets 48 packets 1
    queue-limit 96 packets
  class NetworkControl_Q6
    bandwidth percent 2
    bandwidth remaining percent 2
    queue-limit 26 packets
  class class-default
    bandwidth percent 10
    bandwidth remaining percent 10
    random-detect dscp-based
    random-detect dscp 0 12 packets 20 packets 1
    queue-limit 40 packets
policy-map ZERA-DSCP
  class class-default
   set dscp 0
policy-map QPO_A_2048K_0_0_47_20_20_2_10
  class MissaoCritica_Q6
    bandwidth percent 47
    bandwidth remaining percent 47
    random-detect dscp-based
    random-detect dscp 24 32 packets 64 packets 1
    random-detect dscp 26 32 packets 64 packets 1
    random-detect dscp 28 32 packets 64 packets 1
    random-detect dscp 30 32 packets 64 packets 1
    queue-limit 128 packets
  class Interativa_Q6
    bandwidth percent 20
    bandwidth remaining percent 20
    random-detect dscp-based
    random-detect dscp 18 24 packets 40 packets 1
    random-detect dscp 20 24 packets 40 packets 1
    random-detect dscp 22 24 packets 40 packets 1
    queue-limit 80 packets
  class Bulk_Q6
    bandwidth percent 20
    bandwidth remaining percent 20
    random-detect dscp-based
    random-detect dscp 8 24 packets 40 packets 1
    random-detect dscp 10 24 packets 40 packets 1
    random-detect dscp 12 24 packets 40 packets 1
    random-detect dscp 14 24 packets 40 packets 1
    random-detect dscp 32 24 packets 40 packets 1
    queue-limit 80 packets
  class NetworkControl_Q6
    bandwidth percent 2
    bandwidth remaining percent 2
    queue-limit 26 packets
  class class-default
    bandwidth percent 10
    bandwidth remaining percent 10
    random-detect dscp-based
    random-detect dscp 0 12 packets 20 packets 1
    queue-limit 40 packets
policy-map QPO_A_2048K_0_23_0_0_0_2_74
  class Video_Q6
    priority
   police cir percent 23 conform-action transmit  exceed-action drop 
  class NetworkControl_Q6
    bandwidth percent 2
    bandwidth remaining percent 2
    queue-limit 26 packets
  class class-default
    bandwidth percent 74
    bandwidth remaining percent 74
    random-detect dscp-based
    random-detect dscp 0 56 packets 120 packets 1
    queue-limit 240 packets
policy-map QPO_A_1024K_18_0_29_29_0_2_20
  class Voz_Q6
    priority
   police cir percent 18 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 29
    bandwidth remaining percent 29
    random-detect dscp-based
    random-detect dscp 24 14 packets 30 packets 1
    random-detect dscp 26 14 packets 30 packets 1
    random-detect dscp 28 14 packets 30 packets 1
    random-detect dscp 30 14 packets 30 packets 1
    queue-limit 60 packets
  class Interativa_Q6
    bandwidth percent 29
    bandwidth remaining percent 29
    random-detect dscp-based
    random-detect dscp 18 14 packets 30 packets 1
    random-detect dscp 20 14 packets 30 packets 1
    random-detect dscp 22 14 packets 30 packets 1
    queue-limit 60 packets
  class NetworkControl_Q6
    bandwidth percent 2
    bandwidth remaining percent 2
    queue-limit 18 packets
  class class-default
    bandwidth percent 20
    bandwidth remaining percent 20
    random-detect dscp-based
    random-detect dscp 0 12 packets 20 packets 1
    queue-limit 40 packets
policy-map QPO_A_2048K_13_37_21_0_0_2_26
  class VozVideo_Q6
    priority
   police cir percent 50 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 21
    bandwidth remaining percent 21
    random-detect dscp-based
    random-detect dscp 24 24 packets 40 packets 1
    random-detect dscp 26 24 packets 40 packets 1
    random-detect dscp 28 24 packets 40 packets 1
    random-detect dscp 30 24 packets 40 packets 1
    queue-limit 80 packets
  class NetworkControl_Q6
    bandwidth percent 2
    bandwidth remaining percent 2
    queue-limit 26 packets
  class class-default
    bandwidth percent 26
    bandwidth remaining percent 26
    random-detect dscp-based
    random-detect dscp 0 32 packets 48 packets 1
    queue-limit 96 packets
policy-map QPO_A_4096K_25_20_30_0_0_1_23
  class VozVideo_Q6
    priority
   police cir percent 45 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 30
    bandwidth remaining percent 30
    random-detect dscp-based
    random-detect dscp 24 56 packets 120 packets 1
    random-detect dscp 26 56 packets 120 packets 1
    random-detect dscp 28 56 packets 120 packets 1
    random-detect dscp 30 56 packets 120 packets 1
    queue-limit 240 packets
  class NetworkControl_Q6
    bandwidth percent 1
    bandwidth remaining percent 1
    queue-limit 26 packets
  class class-default
    bandwidth percent 23
    bandwidth remaining percent 23
    random-detect dscp-based
    random-detect dscp 0 32 packets 64 packets 1
    queue-limit 128 packets
policy-map QPO_A_4096K_0_25_25_25_0_1_22
  class Video_Q6
    priority
   police cir percent 25 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 25
    bandwidth remaining percent 25
    random-detect dscp-based
    random-detect dscp 24 56 packets 120 packets 1
    random-detect dscp 26 56 packets 120 packets 1
    random-detect dscp 28 56 packets 120 packets 1
    random-detect dscp 30 56 packets 120 packets 1
    queue-limit 240 packets
  class Interativa_Q6
    bandwidth percent 25
    bandwidth remaining percent 25
    random-detect dscp-based
    random-detect dscp 18 56 packets 120 packets 1
    random-detect dscp 20 56 packets 120 packets 1
    random-detect dscp 22 56 packets 120 packets 1
    queue-limit 240 packets
  class NetworkControl_Q6
    bandwidth percent 1
    bandwidth remaining percent 1
    queue-limit 26 packets
  class class-default
    bandwidth percent 22
    bandwidth remaining percent 22
    random-detect dscp-based
    random-detect dscp 0 32 packets 64 packets 1
    queue-limit 128 packets
policy-map QPO_A_4096K_7_36_25_15_0_2_14
  class VozVideo_Q6
    priority
   police cir percent 43 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 25
    bandwidth remaining percent 25
    random-detect dscp-based
    random-detect dscp 24 56 packets 120 packets 1
    random-detect dscp 26 56 packets 120 packets 1
    random-detect dscp 28 56 packets 120 packets 1
    random-detect dscp 30 56 packets 120 packets 1
    queue-limit 240 packets
  class Interativa_Q6
    bandwidth percent 15
    bandwidth remaining percent 15
    random-detect dscp-based
    random-detect dscp 18 32 packets 48 packets 1
    random-detect dscp 20 32 packets 48 packets 1
    random-detect dscp 22 32 packets 48 packets 1
    queue-limit 96 packets
  class NetworkControl_Q6
    bandwidth percent 2
    bandwidth remaining percent 2
    queue-limit 30 packets
  class class-default
    bandwidth percent 14
    bandwidth remaining percent 14
    random-detect dscp-based
    random-detect dscp 0 32 packets 48 packets 1
    queue-limit 96 packets
policy-map QPO_A_128K_24_20_25_10_10_7_3
  class VozVideo_Q6
    priority
   police cir percent 44 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 25
    bandwidth remaining percent 25
    random-detect dscp-based
    random-detect dscp 24 5 packets 13 packets 1
    random-detect dscp 26 5 packets 13 packets 1
    random-detect dscp 28 5 packets 13 packets 1
    random-detect dscp 30 5 packets 13 packets 1
    queue-limit 26 packets
  class Interativa_Q6
    bandwidth percent 10
    bandwidth remaining percent 10
    random-detect dscp-based
    random-detect dscp 18 6 packets 8 packets 1
    random-detect dscp 20 6 packets 8 packets 1
    random-detect dscp 22 6 packets 8 packets 1
    queue-limit 16 packets
  class Bulk_Q6
    bandwidth percent 10
    bandwidth remaining percent 10
    random-detect dscp-based
    random-detect dscp 8 6 packets 8 packets 1
    random-detect dscp 10 6 packets 8 packets 1
    random-detect dscp 12 6 packets 8 packets 1
    random-detect dscp 14 6 packets 8 packets 1
    random-detect dscp 32 6 packets 8 packets 1
    queue-limit 16 packets
  class NetworkControl_Q6
    bandwidth percent 7
    bandwidth remaining percent 7
    queue-limit 16 packets
  class class-default
    bandwidth percent 3
    bandwidth remaining percent 3
    random-detect dscp-based
    random-detect dscp 0 5 packets 7 packets 1
    queue-limit 14 packets
policy-map QPI_BBONE_N_8192_V1
  class class-default
   police 8192000 256000 256000 conform-action set-mpls-exp-imposition-transmit 0 exceed-action drop 
policy-map QPO_A_1024K_31_0_21_14_30_2_1
  class Voz_Q6
    priority
   police cir percent 31 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 21
    bandwidth remaining percent 21
    random-detect dscp-based
    random-detect dscp 24 12 packets 20 packets 1
    random-detect dscp 26 12 packets 20 packets 1
    random-detect dscp 28 12 packets 20 packets 1
    random-detect dscp 30 12 packets 20 packets 1
    queue-limit 40 packets
  class Interativa_Q6
    bandwidth percent 14
    bandwidth remaining percent 14
    random-detect dscp-based
    random-detect dscp 18 12 packets 20 packets 1
    random-detect dscp 20 12 packets 20 packets 1
    random-detect dscp 22 12 packets 20 packets 1
    queue-limit 40 packets
  class Bulk_Q6
    bandwidth percent 30
    bandwidth remaining percent 30
    random-detect dscp-based
    random-detect dscp 8 14 packets 30 packets 1
    random-detect dscp 10 14 packets 30 packets 1
    random-detect dscp 12 14 packets 30 packets 1
    random-detect dscp 14 14 packets 30 packets 1
    random-detect dscp 32 14 packets 30 packets 1
    queue-limit 60 packets
  class NetworkControl_Q6
    bandwidth percent 2
    bandwidth remaining percent 2
    queue-limit 18 packets
  class class-default
    bandwidth percent 1
    bandwidth remaining percent 1
    random-detect dscp-based
    random-detect dscp 0 6 packets 8 packets 1
    queue-limit 16 packets
policy-map QPO_A_256K_38_0_35_0_0_7_19
  class Voz_Q6
    priority
   police cir percent 38 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 35
    bandwidth remaining percent 35
    random-detect dscp-based
    random-detect dscp 24 7 packets 15 packets 1
    random-detect dscp 26 7 packets 15 packets 1
    random-detect dscp 28 7 packets 15 packets 1
    random-detect dscp 30 7 packets 15 packets 1
    queue-limit 30 packets
  class NetworkControl_Q6
    bandwidth percent 7
    bandwidth remaining percent 7
    queue-limit 18 packets
  class class-default
    bandwidth percent 19
    bandwidth remaining percent 19
    random-detect dscp-based
    random-detect dscp 0 5 packets 13 packets 1
    queue-limit 26 packets
policy-map QPO_A_1024K_7_0_50_0_0_2_40
  class Voz_Q6
    priority
   police cir percent 7 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 50
    bandwidth remaining percent 50
    random-detect dscp-based
    random-detect dscp 24 32 packets 48 packets 1
    random-detect dscp 26 32 packets 48 packets 1
    random-detect dscp 28 32 packets 48 packets 1
    random-detect dscp 30 32 packets 48 packets 1
    queue-limit 96 packets
  class NetworkControl_Q6
    bandwidth percent 2
    bandwidth remaining percent 2
    queue-limit 18 packets
  class class-default
    bandwidth percent 40
    bandwidth remaining percent 40
    random-detect dscp-based
    random-detect dscp 0 24 packets 40 packets 1
    queue-limit 80 packets
policy-map QPO_A_2048K_6_0_49_0_0_1_43
  class Voz_Q6
    priority
   police cir percent 6 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 49
    bandwidth remaining percent 49
    random-detect dscp-based
    random-detect dscp 24 32 packets 64 packets 1
    random-detect dscp 26 32 packets 64 packets 1
    random-detect dscp 28 32 packets 64 packets 1
    random-detect dscp 30 32 packets 64 packets 1
    queue-limit 128 packets
  class NetworkControl_Q6
    bandwidth percent 1
    bandwidth remaining percent 1
    queue-limit 18 packets
  class class-default
    bandwidth percent 43
    bandwidth remaining percent 43
    random-detect dscp-based
    random-detect dscp 0 32 packets 64 packets 1
    queue-limit 128 packets
policy-map QPO_A_2048K_31_19_37_0_0_2_10
  class VozVideo_Q6
    priority
   police cir percent 50 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 37
    bandwidth remaining percent 37
    random-detect dscp-based
    random-detect dscp 24 32 packets 48 packets 1
    random-detect dscp 26 32 packets 48 packets 1
    random-detect dscp 28 32 packets 48 packets 1
    random-detect dscp 30 32 packets 48 packets 1
    queue-limit 96 packets
  class NetworkControl_Q6
    bandwidth percent 2
    bandwidth remaining percent 2
    queue-limit 26 packets
  class class-default
    bandwidth percent 10
    bandwidth remaining percent 10
    random-detect dscp-based
    random-detect dscp 0 12 packets 20 packets 1
    queue-limit 40 packets
policy-map QPO_A_512K_5_0_30_16_4_4_40
  class Voz_Q6
    priority
   police cir percent 5 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 30
    bandwidth remaining percent 30
    random-detect dscp-based
    random-detect dscp 24 12 packets 20 packets 1
    random-detect dscp 26 12 packets 20 packets 1
    random-detect dscp 28 12 packets 20 packets 1
    random-detect dscp 30 12 packets 20 packets 1
    queue-limit 40 packets
  class Interativa_Q6
    bandwidth percent 16
    bandwidth remaining percent 16
    random-detect dscp-based
    random-detect dscp 18 7 packets 15 packets 1
    random-detect dscp 20 7 packets 15 packets 1
    random-detect dscp 22 7 packets 15 packets 1
    queue-limit 30 packets
  class Bulk_Q6
    bandwidth percent 4
    bandwidth remaining percent 4
    random-detect dscp-based
    random-detect dscp 8 5 packets 9 packets 1
    random-detect dscp 10 5 packets 9 packets 1
    random-detect dscp 12 5 packets 9 packets 1
    random-detect dscp 14 5 packets 9 packets 1
    random-detect dscp 32 5 packets 9 packets 1
    queue-limit 18 packets
  class NetworkControl_Q6
    bandwidth percent 4
    bandwidth remaining percent 4
    queue-limit 18 packets
  class class-default
    bandwidth percent 40
    bandwidth remaining percent 40
    random-detect dscp-based
    random-detect dscp 0 12 packets 20 packets 1
    queue-limit 40 packets
policy-map QPO_A_1024K_7_0_0_0_40_2_50
  class Voz_Q6
    priority
   police cir percent 7 conform-action transmit  exceed-action drop 
  class Bulk_Q6
    bandwidth percent 40
    bandwidth remaining percent 40
    random-detect dscp-based
    random-detect dscp 8 24 packets 40 packets 1
    random-detect dscp 10 24 packets 40 packets 1
    random-detect dscp 12 24 packets 40 packets 1
    random-detect dscp 14 24 packets 40 packets 1
    random-detect dscp 32 24 packets 40 packets 1
    queue-limit 80 packets
  class NetworkControl_Q6
    bandwidth percent 2
    bandwidth remaining percent 2
    queue-limit 18 packets
  class class-default
    bandwidth percent 50
    bandwidth remaining percent 50
    random-detect dscp-based
    random-detect dscp 0 32 packets 48 packets 1
    queue-limit 96 packets
policy-map QPI_Correios_256K_PPP_IOS_D_V1
  class REAL_TIME_CORREIOS
   police cir percent 6 conform-action transmit  exceed-action drop 
  class MISSAO_CRITICA_CORREIOS
   police cir percent 40 conform-action transmit  exceed-action set-dscp-transmit af41
  class GERENCIAMENTO_CORREIOS
   police cir percent 9 conform-action transmit  exceed-action set-dscp-transmit af31
  class NETWORK_CONTROL_CORREIOS
   police cir percent 6 conform-action transmit  exceed-action set-dscp-transmit cs6
  class BEST_EFFORT
   police cir percent 38 conform-action transmit  exceed-action set-dscp-transmit default
policy-map QPO_A_1024K_30_20_20_0_0_2_27
  class VozVideo_Q6
    priority
   police cir percent 50 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 20
    bandwidth remaining percent 20
    random-detect dscp-based
    random-detect dscp 24 12 packets 20 packets 1
    random-detect dscp 26 12 packets 20 packets 1
    random-detect dscp 28 12 packets 20 packets 1
    random-detect dscp 30 12 packets 20 packets 1
    queue-limit 40 packets
  class NetworkControl_Q6
    bandwidth percent 2
    bandwidth remaining percent 2
    queue-limit 18 packets
  class class-default
    bandwidth percent 27
    bandwidth remaining percent 27
    random-detect dscp-based
    random-detect dscp 0 14 packets 30 packets 1
    queue-limit 60 packets
policy-map QPO_A_512K_5_0_30_16_0_4_44
  class Voz_Q6
    priority
   police cir percent 5 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 30
    bandwidth remaining percent 30
    random-detect dscp-based
    random-detect dscp 24 12 packets 20 packets 1
    random-detect dscp 26 12 packets 20 packets 1
    random-detect dscp 28 12 packets 20 packets 1
    random-detect dscp 30 12 packets 20 packets 1
    queue-limit 40 packets
  class Interativa_Q6
    bandwidth percent 16
    bandwidth remaining percent 16
    random-detect dscp-based
    random-detect dscp 18 7 packets 15 packets 1
    random-detect dscp 20 7 packets 15 packets 1
    random-detect dscp 22 7 packets 15 packets 1
    queue-limit 30 packets
  class NetworkControl_Q6
    bandwidth percent 4
    bandwidth remaining percent 4
    queue-limit 18 packets
  class class-default
    bandwidth percent 44
    bandwidth remaining percent 44
    random-detect dscp-based
    random-detect dscp 0 12 packets 20 packets 1
    queue-limit 40 packets
policy-map MARCA-VIPLINEIP
  class class-default
   set dscp 46
policy-map QPO_A_256K_19_0_59_0_0_7_11
  class Voz_Q6
    priority
   police cir percent 19 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 59
    bandwidth remaining percent 59
    random-detect dscp-based
    random-detect dscp 18 5 packets 7 packets 1
    random-detect dscp 20 5 packets 7 packets 1
    random-detect dscp 22 5 packets 7 packets 1
    random-detect dscp 24 12 packets 20 packets 1
    random-detect dscp 26 12 packets 20 packets 1
    random-detect dscp 28 12 packets 20 packets 1
    random-detect dscp 30 12 packets 20 packets 1
    queue-limit 14 packets
  class NetworkControl_Q6
    bandwidth percent 7
    bandwidth remaining percent 7
    queue-limit 18 packets
  class class-default
    bandwidth percent 11
    bandwidth remaining percent 11
    random-detect dscp-based
    random-detect dscp 0 5 packets 9 packets 1
    queue-limit 18 packets
policy-map QPO_A_256K_0_0_84_0_0_7_8
  class MissaoCritica_Q6
    bandwidth percent 84
    bandwidth remaining percent 84
    random-detect dscp-based
    random-detect dscp 24 12 packets 20 packets 1
    random-detect dscp 26 12 packets 20 packets 1
    random-detect dscp 28 12 packets 20 packets 1
    random-detect dscp 30 12 packets 20 packets 1
    queue-limit 40 packets
  class NetworkControl_Q6
    bandwidth percent 7
    bandwidth remaining percent 7
    queue-limit 18 packets
  class class-default
    bandwidth percent 8
    bandwidth remaining percent 8
    random-detect dscp-based
    random-detect dscp 0 5 packets 9 packets 1
    queue-limit 18 packets
policy-map QPO_A_2048K_2_0_0_81_0_2_14
  class Voz_Q6
    priority
   police cir percent 2 conform-action transmit  exceed-action drop 
  class Interativa_Q6
    bandwidth percent 81
    bandwidth remaining percent 81
    random-detect dscp-based
    random-detect dscp 18 56 packets 120 packets 1
    random-detect dscp 20 56 packets 120 packets 1
    random-detect dscp 22 56 packets 120 packets 1
    queue-limit 240 packets
  class NetworkControl_Q6
    bandwidth percent 2
    bandwidth remaining percent 2
    queue-limit 26 packets
  class class-default
    bandwidth percent 14
    bandwidth remaining percent 14
    random-detect dscp-based
    random-detect dscp 0 14 packets 30 packets 1
    queue-limit 60 packets
policy-map QPO_A_1024K_5_45_0_0_0_2_47
  class VozVideo_Q6
    priority
   police cir percent 50 conform-action transmit  exceed-action drop 
  class NetworkControl_Q6
    bandwidth percent 2
    bandwidth remaining percent 2
    queue-limit 18 packets
  class class-default
    bandwidth percent 47
    bandwidth remaining percent 47
    random-detect dscp-based
    random-detect dscp 0 24 packets 40 packets 1
    queue-limit 80 packets
policy-map QPO_A_2048K_0_0_20_9_0_6_54
  class MissaoCritica_Q6
    bandwidth percent 20
    bandwidth remaining percent 20
    random-detect dscp-based
    random-detect dscp 24 24 packets 40 packets 1
    random-detect dscp 26 24 packets 40 packets 1
    random-detect dscp 28 24 packets 40 packets 1
    random-detect dscp 30 24 packets 40 packets 1
    queue-limit 80 packets
  class Interativa_Q6
    bandwidth percent 9
    bandwidth remaining percent 9
    random-detect dscp-based
    random-detect dscp 18 12 packets 20 packets 1
    random-detect dscp 20 12 packets 20 packets 1
    random-detect dscp 22 12 packets 20 packets 1
    queue-limit 40 packets
  class NetworkControl_Q6
    bandwidth percent 6
    bandwidth remaining percent 6
    queue-limit 40 packets
  class class-default
    bandwidth percent 54
    bandwidth remaining percent 54
    random-detect dscp-based
    random-detect dscp 0 56 packets 120 packets 1
    queue-limit 240 packets
policy-map QPO_A_256K_38_0_29_0_0_7_25
  class Voz_Q6
    priority
   police cir percent 38 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 29
    bandwidth remaining percent 29
    random-detect dscp-based
    random-detect dscp 24 7 packets 15 packets 1
    random-detect dscp 26 7 packets 15 packets 1
    random-detect dscp 28 7 packets 15 packets 1
    random-detect dscp 30 7 packets 15 packets 1
    queue-limit 30 packets
  class NetworkControl_Q6
    bandwidth percent 7
    bandwidth remaining percent 7
    queue-limit 18 packets
  class class-default
    bandwidth percent 25
    bandwidth remaining percent 25
    random-detect dscp-based
    random-detect dscp 0 7 packets 15 packets 1
    queue-limit 30 packets
policy-map QPO_A_1024K_12_0_50_13_0_2_22
  class Voz_Q6
    priority
   police cir percent 12 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 50
    bandwidth remaining percent 50
    random-detect dscp-based
    random-detect dscp 24 32 packets 48 packets 1
    random-detect dscp 26 32 packets 48 packets 1
    random-detect dscp 28 32 packets 48 packets 1
    random-detect dscp 30 32 packets 48 packets 1
    queue-limit 96 packets
  class Interativa_Q6
    bandwidth percent 13
    bandwidth remaining percent 13
    random-detect dscp-based
    random-detect dscp 18 12 packets 20 packets 1
    random-detect dscp 20 12 packets 20 packets 1
    random-detect dscp 22 12 packets 20 packets 1
    queue-limit 40 packets
  class NetworkControl_Q6
    bandwidth percent 2
    bandwidth remaining percent 2
    queue-limit 18 packets
  class class-default
    bandwidth percent 22
    bandwidth remaining percent 22
    random-detect dscp-based
    random-detect dscp 0 12 packets 20 packets 1
    queue-limit 40 packets
policy-map QPO_A_512K_25_0_50_15_0_4_5
  class Voz_Q6
    priority
   police cir percent 25 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 50
    bandwidth remaining percent 50
    random-detect dscp-based
    random-detect dscp 24 14 packets 30 packets 1
    random-detect dscp 26 14 packets 30 packets 1
    random-detect dscp 28 14 packets 30 packets 1
    random-detect dscp 30 14 packets 30 packets 1
    queue-limit 60 packets
  class Interativa_Q6
    bandwidth percent 15
    bandwidth remaining percent 15
    random-detect dscp-based
    random-detect dscp 18 7 packets 15 packets 1
    random-detect dscp 20 7 packets 15 packets 1
    random-detect dscp 22 7 packets 15 packets 1
    queue-limit 30 packets
  class NetworkControl_Q6
    bandwidth percent 4
    bandwidth remaining percent 4
    queue-limit 18 packets
  class class-default
    bandwidth percent 5
    bandwidth remaining percent 5
    random-detect dscp-based
    random-detect dscp 0 5 packets 9 packets 1
    queue-limit 18 packets
policy-map QPO_A_2048K_11_32_24_29_0_2_1
  class VozVideo_Q6
    priority
   police cir percent 43 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 24
    bandwidth remaining percent 24
    random-detect dscp-based
    random-detect dscp 24 24 packets 40 packets 1
    random-detect dscp 26 24 packets 40 packets 1
    random-detect dscp 28 24 packets 40 packets 1
    random-detect dscp 30 24 packets 40 packets 1
    queue-limit 80 packets
  class Interativa_Q6
    bandwidth percent 29
    bandwidth remaining percent 29
    random-detect dscp-based
    random-detect dscp 18 32 packets 48 packets 1
    random-detect dscp 20 32 packets 48 packets 1
    random-detect dscp 22 32 packets 48 packets 1
    queue-limit 96 packets
  class NetworkControl_Q6
    bandwidth percent 2
    bandwidth remaining percent 2
    queue-limit 26 packets
  class class-default
    bandwidth percent 1
    bandwidth remaining percent 1
    random-detect dscp-based
    random-detect dscp 0 5 packets 9 packets 1
    queue-limit 18 packets
policy-map QOS_POLICY_OUT_A_16P_0P
  class REALTIME
    priority
   police cir percent 16 conform-action transmit  exceed-action drop 
policy-map QPO_A_2048K_0_0_26_31_22_1_19
  class MissaoCritica_Q6
    bandwidth percent 26
    bandwidth remaining percent 26
    random-detect dscp-based
    random-detect dscp 24 32 packets 48 packets 1
    random-detect dscp 26 32 packets 48 packets 1
    random-detect dscp 28 32 packets 48 packets 1
    random-detect dscp 30 32 packets 48 packets 1
    queue-limit 96 packets
  class Interativa_Q6
    bandwidth percent 31
    bandwidth remaining percent 31
    random-detect dscp-based
    random-detect dscp 18 32 packets 48 packets 1
    random-detect dscp 20 32 packets 48 packets 1
    random-detect dscp 22 32 packets 48 packets 1
    queue-limit 96 packets
  class Bulk_Q6
    bandwidth percent 22
    bandwidth remaining percent 22
    random-detect dscp-based
    random-detect dscp 8 24 packets 40 packets 1
    random-detect dscp 10 24 packets 40 packets 1
    random-detect dscp 12 24 packets 40 packets 1
    random-detect dscp 14 24 packets 40 packets 1
    random-detect dscp 32 24 packets 40 packets 1
    queue-limit 80 packets
  class NetworkControl_Q6
    bandwidth percent 1
    bandwidth remaining percent 1
    queue-limit 18 packets
  class class-default
    bandwidth percent 19
    bandwidth remaining percent 19
    random-detect dscp-based
    random-detect dscp 0 24 packets 40 packets 1
    queue-limit 80 packets
policy-map QPO_A_256K_38_0_38_0_0_7_16
  class Voz_Q6
    priority
   police cir percent 38 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 38
    bandwidth remaining percent 38
    random-detect dscp-based
    random-detect dscp 24 7 packets 15 packets 1
    random-detect dscp 26 7 packets 15 packets 1
    random-detect dscp 28 7 packets 15 packets 1
    random-detect dscp 30 7 packets 15 packets 1
    queue-limit 30 packets
  class NetworkControl_Q6
    bandwidth percent 7
    bandwidth remaining percent 7
    queue-limit 18 packets
  class class-default
    bandwidth percent 16
    bandwidth remaining percent 16
    random-detect dscp-based
    random-detect dscp 0 5 packets 13 packets 1
    queue-limit 26 packets
policy-map QPO_A_1024K_0_46_16_11_21_2_3
  class Video_Q6
    priority
   police cir percent 46 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 16
    bandwidth remaining percent 16
    random-detect dscp-based
    random-detect dscp 24 12 packets 20 packets 1
    random-detect dscp 26 12 packets 20 packets 1
    random-detect dscp 28 12 packets 20 packets 1
    random-detect dscp 30 12 packets 20 packets 1
    queue-limit 40 packets
  class Interativa_Q6
    bandwidth percent 11
    bandwidth remaining percent 11
    random-detect dscp-based
    random-detect dscp 18 7 packets 15 packets 1
    random-detect dscp 20 7 packets 15 packets 1
    random-detect dscp 22 7 packets 15 packets 1
    queue-limit 30 packets
  class Bulk_Q6
    bandwidth percent 21
    bandwidth remaining percent 21
    random-detect dscp-based
    random-detect dscp 8 12 packets 20 packets 1
    random-detect dscp 10 12 packets 20 packets 1
    random-detect dscp 12 12 packets 20 packets 1
    random-detect dscp 14 12 packets 20 packets 1
    random-detect dscp 32 12 packets 20 packets 1
    queue-limit 40 packets
  class NetworkControl_Q6
    bandwidth percent 2
    bandwidth remaining percent 2
    queue-limit 18 packets
  class class-default
    bandwidth percent 3
    bandwidth remaining percent 3
    random-detect dscp-based
    random-detect dscp 0 5 packets 13 packets 1
    queue-limit 26 packets
policy-map QPO_A_256K_10_0_63_0_0_7_13
  class Voz_Q6
    priority
   police cir percent 10 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 63
    bandwidth remaining percent 63
    random-detect dscp-based
    random-detect dscp 24 12 packets 20 packets 1
    random-detect dscp 26 12 packets 20 packets 1
    random-detect dscp 28 12 packets 20 packets 1
    random-detect dscp 30 12 packets 20 packets 1
    queue-limit 40 packets
  class NetworkControl_Q6
    bandwidth percent 7
    bandwidth remaining percent 7
    queue-limit 18 packets
  class class-default
    bandwidth percent 13
    bandwidth remaining percent 13
    random-detect dscp-based
    random-detect dscp 0 5 packets 13 packets 1
    queue-limit 26 packets
policy-map QPI_BBONE_N_2048_V1
  class class-default
   police 2048000 64000 64000 conform-action set-mpls-exp-imposition-transmit 0 exceed-action drop 
policy-map QPO_A_512K_50_0_10_0_0_4_35
  class Voz_Q6
    priority
   police cir percent 50 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 10
    bandwidth remaining percent 10
    random-detect dscp-based
    random-detect dscp 24 5 packets 13 packets 1
    random-detect dscp 26 5 packets 13 packets 1
    random-detect dscp 28 5 packets 13 packets 1
    random-detect dscp 30 5 packets 13 packets 1
    queue-limit 26 packets
  class NetworkControl_Q6
    bandwidth percent 4
    bandwidth remaining percent 4
    queue-limit 18 packets
  class class-default
    bandwidth percent 35
    bandwidth remaining percent 35
    random-detect dscp-based
    random-detect dscp 0 12 packets 20 packets 1
    queue-limit 40 packets
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
policy-map QPO_A_1024K_25_0_5_0_0_2_66
  class Voz_Q6
    priority
   police cir percent 25 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 5
    bandwidth remaining percent 5
    random-detect dscp-based
    random-detect dscp 24 5 packets 13 packets 1
    random-detect dscp 26 5 packets 13 packets 1
    random-detect dscp 28 5 packets 13 packets 1
    random-detect dscp 30 5 packets 13 packets 1
    queue-limit 26 packets
  class NetworkControl_Q6
    bandwidth percent 2
    bandwidth remaining percent 2
    queue-limit 18 packets
  class class-default
    bandwidth percent 66
    bandwidth remaining percent 66
    random-detect dscp-based
    random-detect dscp 0 32 packets 48 packets 1
    queue-limit 96 packets
policy-map QPO_A_1024K_10_24_20_40_0_2_3
  class VozVideo_Q6
    priority
   police cir percent 34 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 20
    bandwidth remaining percent 20
    random-detect dscp-based
    random-detect dscp 24 12 packets 20 packets 1
    random-detect dscp 26 12 packets 20 packets 1
    random-detect dscp 28 12 packets 20 packets 1
    random-detect dscp 30 12 packets 20 packets 1
    queue-limit 40 packets
  class Interativa_Q6
    bandwidth percent 40
    bandwidth remaining percent 40
    random-detect dscp-based
    random-detect dscp 18 24 packets 40 packets 1
    random-detect dscp 20 24 packets 40 packets 1
    random-detect dscp 22 24 packets 40 packets 1
    queue-limit 80 packets
  class NetworkControl_Q6
    bandwidth percent 2
    bandwidth remaining percent 2
    queue-limit 18 packets
  class class-default
    bandwidth percent 3
    bandwidth remaining percent 3
    random-detect dscp-based
    random-detect dscp 0 5 packets 13 packets 1
    queue-limit 26 packets
policy-map QPO_A_1024K_10_24_20_0_40_2_3
  class VozVideo_Q6
    priority
   police cir percent 34 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 20
    bandwidth remaining percent 20
    random-detect dscp-based
    random-detect dscp 24 12 packets 20 packets 1
    random-detect dscp 26 12 packets 20 packets 1
    random-detect dscp 28 12 packets 20 packets 1
    random-detect dscp 30 12 packets 20 packets 1
    queue-limit 40 packets
  class Bulk_Q6
    bandwidth percent 40
    bandwidth remaining percent 40
    random-detect dscp-based
    random-detect dscp 8 24 packets 40 packets 1
    random-detect dscp 10 24 packets 40 packets 1
    random-detect dscp 12 24 packets 40 packets 1
    random-detect dscp 14 24 packets 40 packets 1
    random-detect dscp 32 24 packets 40 packets 1
    queue-limit 80 packets
  class NetworkControl_Q6
    bandwidth percent 2
    bandwidth remaining percent 2
    queue-limit 18 packets
  class class-default
    bandwidth percent 3
    bandwidth remaining percent 3
    random-detect dscp-based
    random-detect dscp 0 5 packets 13 packets 1
    queue-limit 26 packets
policy-map QPO_A_1024K_31_0_20_13_32_2_1
  class Voz_Q6
    priority
   police cir percent 31 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 20
    bandwidth remaining percent 20
    random-detect dscp-based
    random-detect dscp 24 12 packets 20 packets 1
    random-detect dscp 26 12 packets 20 packets 1
    random-detect dscp 28 12 packets 20 packets 1
    random-detect dscp 30 12 packets 20 packets 1
    queue-limit 40 packets
  class Interativa_Q6
    bandwidth percent 13
    bandwidth remaining percent 13
    random-detect dscp-based
    random-detect dscp 18 12 packets 20 packets 1
    random-detect dscp 20 12 packets 20 packets 1
    random-detect dscp 22 12 packets 20 packets 1
    queue-limit 40 packets
  class Bulk_Q6
    bandwidth percent 32
    bandwidth remaining percent 32
    random-detect dscp-based
    random-detect dscp 8 14 packets 30 packets 1
    random-detect dscp 10 14 packets 30 packets 1
    random-detect dscp 12 14 packets 30 packets 1
    random-detect dscp 14 14 packets 30 packets 1
    random-detect dscp 32 14 packets 30 packets 1
    queue-limit 60 packets
  class NetworkControl_Q6
    bandwidth percent 2
    bandwidth remaining percent 2
    queue-limit 18 packets
  class class-default
    bandwidth percent 1
    bandwidth remaining percent 1
    random-detect dscp-based
    random-detect dscp 0 6 packets 8 packets 1
    queue-limit 16 packets
policy-map RV_MLPPP_QPO_1024K_5_1_2_70
  class RV_MLPPP_Voz
    priority
   police cir percent 5 conform-action transmit  exceed-action drop 
  class RV_MLPPP_Sinalizacao
    bandwidth percent 1
    random-detect dscp-based
  class RV_MLPPP_NetWorkControl
    bandwidth percent 2
  class RV_MLPPP_BestEffort
    bandwidth percent 70
    random-detect dscp-based
policy-map RV_MLPPP_QDO_1024K_5_1_2_70
  class class-default
    shape average 1024000
   service-policy RV_MLPPP_QPO_1024K_5_1_2_70
policy-map QPO_A_256K_26_0_41_0_0_7_23
  class Voz_Q6
    priority
   police cir percent 26 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 41
    bandwidth remaining percent 41
    random-detect dscp-based
    random-detect dscp 24 7 packets 15 packets 1
    random-detect dscp 26 7 packets 15 packets 1
    random-detect dscp 28 7 packets 15 packets 1
    random-detect dscp 30 7 packets 15 packets 1
    queue-limit 30 packets
  class NetworkControl_Q6
    bandwidth percent 7
    bandwidth remaining percent 7
    queue-limit 18 packets
  class class-default
    bandwidth percent 23
    bandwidth remaining percent 23
    random-detect dscp-based
    random-detect dscp 0 5 packets 13 packets 1
    queue-limit 26 packets
policy-map QPO_A_1024K_30_20_19_0_0_2_28
  class VozVideo_Q6
    priority
   police cir percent 50 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 19
    bandwidth remaining percent 19
    random-detect dscp-based
    random-detect dscp 24 12 packets 20 packets 1
    random-detect dscp 26 12 packets 20 packets 1
    random-detect dscp 28 12 packets 20 packets 1
    random-detect dscp 30 12 packets 20 packets 1
    queue-limit 40 packets
  class NetworkControl_Q6
    bandwidth percent 2
    bandwidth remaining percent 2
    queue-limit 18 packets
  class class-default
    bandwidth percent 28
    bandwidth remaining percent 28
    random-detect dscp-based
    random-detect dscp 0 14 packets 30 packets 1
    queue-limit 60 packets
policy-map QPO_A_1024K_22_0_36_22_0_2_17
  class Voz_Q6
    priority
   police cir percent 22 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 36
    bandwidth remaining percent 36
    random-detect dscp-based
    random-detect dscp 24 14 packets 30 packets 1
    random-detect dscp 26 14 packets 30 packets 1
    random-detect dscp 28 14 packets 30 packets 1
    random-detect dscp 30 14 packets 30 packets 1
    queue-limit 60 packets
  class Interativa_Q6
    bandwidth percent 22
    bandwidth remaining percent 22
    random-detect dscp-based
    random-detect dscp 18 12 packets 20 packets 1
    random-detect dscp 20 12 packets 20 packets 1
    random-detect dscp 22 12 packets 20 packets 1
    queue-limit 40 packets
  class NetworkControl_Q6
    bandwidth percent 2
    bandwidth remaining percent 2
    queue-limit 18 packets
  class class-default
    bandwidth percent 17
    bandwidth remaining percent 17
    random-detect dscp-based
    random-detect dscp 0 12 packets 20 packets 1
    queue-limit 40 packets
policy-map QPO_A_512K_5_0_30_16_0_4_41
  class Voz_Q6
    priority
   police cir percent 5 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 30
    bandwidth remaining percent 30
    random-detect dscp-based
    random-detect dscp 24 12 packets 20 packets 1
    random-detect dscp 26 12 packets 20 packets 1
    random-detect dscp 28 12 packets 20 packets 1
    random-detect dscp 30 12 packets 20 packets 1
    queue-limit 40 packets
  class Interativa_Q6
    bandwidth percent 16
    bandwidth remaining percent 16
    random-detect dscp-based
    random-detect dscp 18 7 packets 15 packets 1
    random-detect dscp 20 7 packets 15 packets 1
    random-detect dscp 22 7 packets 15 packets 1
    queue-limit 30 packets
  class NetworkControl_Q6
    bandwidth percent 4
    bandwidth remaining percent 4
    queue-limit 18 packets
  class class-default
    bandwidth percent 41
    bandwidth remaining percent 41
    random-detect dscp-based
    random-detect dscp 0 12 packets 20 packets 1
    queue-limit 40 packets
policy-map QPO_A_1024K_13_0_25_25_3_2_31
  class Voz_Q6
    priority
   police cir percent 13 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 25
    bandwidth remaining percent 25
    random-detect dscp-based
    random-detect dscp 24 14 packets 30 packets 1
    random-detect dscp 26 14 packets 30 packets 1
    random-detect dscp 28 14 packets 30 packets 1
    random-detect dscp 30 14 packets 30 packets 1
    queue-limit 60 packets
  class Interativa_Q6
    bandwidth percent 25
    bandwidth remaining percent 25
    random-detect dscp-based
    random-detect dscp 18 14 packets 30 packets 1
    random-detect dscp 20 14 packets 30 packets 1
    random-detect dscp 22 14 packets 30 packets 1
    queue-limit 60 packets
  class Bulk_Q6
    bandwidth percent 3
    bandwidth remaining percent 3
    random-detect dscp-based
    random-detect dscp 8 5 packets 13 packets 1
    random-detect dscp 10 5 packets 13 packets 1
    random-detect dscp 12 5 packets 13 packets 1
    random-detect dscp 14 5 packets 13 packets 1
    random-detect dscp 32 5 packets 13 packets 1
    queue-limit 26 packets
  class NetworkControl_Q6
    bandwidth percent 2
    bandwidth remaining percent 2
    queue-limit 18 packets
  class class-default
    bandwidth percent 31
    bandwidth remaining percent 31
    random-detect dscp-based
    random-detect dscp 0 14 packets 30 packets 1
    queue-limit 60 packets
policy-map QPO_A_1024K_30_0_0_0_0_2_66
  class Voz_Q6
    priority
   police cir percent 30 conform-action transmit  exceed-action drop 
  class NetworkControl_Q6
    bandwidth percent 2
    bandwidth remaining percent 2
    queue-limit 18 packets
  class class-default
    bandwidth percent 66
    bandwidth remaining percent 66
    random-detect dscp-based
    random-detect dscp 0 32 packets 48 packets 1
    queue-limit 96 packets
policy-map RV_MLPPP_QPI_1024K_5_N_1_2_70
  class RV_MLPPP_Voz
   police cir 48000 bc 4470 be 4470 conform-action transmit  exceed-action drop 
  class RV_MLPPP_Sinalizacao
   police cir 8000 bc 4470 be 4470 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
policy-map QPO_A_256K_25_0_40_0_0_7_22
  class Voz_Q6
    priority
   police cir percent 25 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 40
    bandwidth remaining percent 40
    random-detect dscp-based
    random-detect dscp 24 7 packets 15 packets 1
    random-detect dscp 26 7 packets 15 packets 1
    random-detect dscp 28 7 packets 15 packets 1
    random-detect dscp 30 7 packets 15 packets 1
    queue-limit 30 packets
  class NetworkControl_Q6
    bandwidth percent 7
    bandwidth remaining percent 7
    queue-limit 18 packets
  class class-default
    bandwidth percent 22
    bandwidth remaining percent 22
    random-detect dscp-based
    random-detect dscp 0 5 packets 13 packets 1
    queue-limit 26 packets
policy-map QPI_BBONE_N_4096_V1
  class class-default
   police 4096000 128000 128000 conform-action set-mpls-exp-imposition-transmit 0 exceed-action drop 
policy-map QPO_Correios_256K_PPP_IOS_D_V1
  class REAL_TIME_CORREIOS
    priority
   police cir percent 6 conform-action transmit  exceed-action drop 
  class MISSAO_CRITICA_CORREIOS
    bandwidth percent 40
    random-detect dscp-based
    random-detect dscp 34 16 packets 32 packets 1
    random-detect dscp 36 16 packets 32 packets 1
    random-detect dscp 38 16 packets 32 packets 1
    queue-limit 64 packets
  class GERENCIAMENTO_CORREIOS
    bandwidth percent 9
    random-detect dscp-based
    random-detect dscp 26 16 packets 32 packets 1
    random-detect dscp 28 16 packets 32 packets 1
    random-detect dscp 30 16 packets 32 packets 1
    queue-limit 64 packets
  class NETWORK_CONTROL_CORREIOS
    bandwidth percent 6
    random-detect dscp-based
    random-detect dscp 16 16 packets 32 packets 1
    random-detect dscp 48 16 packets 32 packets 1
    random-detect dscp 56 16 packets 32 packets 1
  class BEST_EFFORT
    bandwidth percent 38
    random-detect dscp-based
    random-detect dscp 0 16 packets 32 packets 1
    queue-limit 64 packets
policy-map QPO_A_2048K_13_38_23_0_0_2_23
  class VozVideo_Q6
    priority
   police cir percent 51 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 23
    bandwidth remaining percent 23
    random-detect dscp-based
    random-detect dscp 24 24 packets 40 packets 1
    random-detect dscp 26 24 packets 40 packets 1
    random-detect dscp 28 24 packets 40 packets 1
    random-detect dscp 30 24 packets 40 packets 1
    queue-limit 80 packets
  class NetworkControl_Q6
    bandwidth percent 2
    bandwidth remaining percent 2
    queue-limit 26 packets
  class class-default
    bandwidth percent 23
    bandwidth remaining percent 23
    random-detect dscp-based
    random-detect dscp 0 24 packets 40 packets 1
    queue-limit 80 packets
policy-map QPO_A_512K_13_0_50_0_0_4_32
  class Voz_Q6
    priority
   police cir percent 13 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 50
    bandwidth remaining percent 50
    random-detect dscp-based
    random-detect dscp 24 14 packets 30 packets 1
    random-detect dscp 26 14 packets 30 packets 1
    random-detect dscp 28 14 packets 30 packets 1
    random-detect dscp 30 14 packets 30 packets 1
    queue-limit 60 packets
  class NetworkControl_Q6
    bandwidth percent 4
    bandwidth remaining percent 4
    queue-limit 18 packets
  class class-default
    bandwidth percent 32
    bandwidth remaining percent 32
    random-detect dscp-based
    random-detect dscp 0 12 packets 20 packets 1
    queue-limit 40 packets
policy-map QPO_A_1024K_15_0_12_6_30_1_33
  class Voz_Q6
    priority
   police cir percent 15 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 12
    bandwidth remaining percent 12
    random-detect dscp-based
    random-detect dscp 24 7 packets 15 packets 1
    random-detect dscp 26 7 packets 15 packets 1
    random-detect dscp 28 7 packets 15 packets 1
    random-detect dscp 30 7 packets 15 packets 1
    queue-limit 30 packets
  class Interativa_Q6
    bandwidth percent 6
    bandwidth remaining percent 6
    random-detect dscp-based
    random-detect dscp 18 7 packets 15 packets 1
    random-detect dscp 20 7 packets 15 packets 1
    random-detect dscp 22 7 packets 15 packets 1
    queue-limit 30 packets
  class Bulk_Q6
    bandwidth percent 30
    bandwidth remaining percent 30
    random-detect dscp-based
    random-detect dscp 8 14 packets 30 packets 1
    random-detect dscp 10 14 packets 30 packets 1
    random-detect dscp 12 14 packets 30 packets 1
    random-detect dscp 14 14 packets 30 packets 1
    random-detect dscp 32 14 packets 30 packets 1
    queue-limit 60 packets
  class NetworkControl_Q6
    bandwidth percent 1
    bandwidth remaining percent 1
    queue-limit 16 packets
  class class-default
    bandwidth percent 33
    bandwidth remaining percent 33
    random-detect dscp-based
    random-detect dscp 0 14 packets 30 packets 1
    queue-limit 60 packets
policy-map QPO_A_512K_10_0_13_0_0_4_72
  class Voz_Q6
    priority
   police cir percent 10 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 13
    bandwidth remaining percent 13
    random-detect dscp-based
    random-detect dscp 24 7 packets 15 packets 1
    random-detect dscp 26 7 packets 15 packets 1
    random-detect dscp 28 7 packets 15 packets 1
    random-detect dscp 30 7 packets 15 packets 1
    queue-limit 30 packets
  class NetworkControl_Q6
    bandwidth percent 4
    bandwidth remaining percent 4
    queue-limit 18 packets
  class class-default
    bandwidth percent 72
    bandwidth remaining percent 72
    random-detect dscp-based
    random-detect dscp 0 14 packets 30 packets 1
    queue-limit 60 packets
policy-map PM_V10_QPO_BBONE_8192_V1
policy-map QPO_BBONE_8192_V1
  class class-default
    shape average 8192000
   service-policy PM_V10_QPO_BBONE_8192_V1
policy-map QPI_BBONE_DSCP_V1
  class class-default
   set dscp 0
policy-map QDO_64_0_0_40_8_0_0_0B_A_V1
  class class-default
    shape average 64000
   service-policy QPO_64_0_0_40_8_0_0_0B_A_V1
policy-map QDO_512K_BBrasil_NAC_GACC_V1
  class class-default
    shape average 512000
   service-policy QPO_512K_BBrasil_NAC_GACC_V1
policy-map QDO_A_2048K_16_40_6_0_25_2_10
  class class-default
    shape average 2048000
   service-policy QPO_A_2048K_16_40_6_0_25_2_10
policy-map QPI_A_2048K_13_N_37_21_0_0_2_26
  class Voz_Q6
   police cir percent 13 conform-action transmit  exceed-action drop 
  class Video_Q6
   police cir percent 37 conform-action set-mpls-exp-imposition-transmit 5 exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 21 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_A_4096K_25_N_20_30_0_0_1_23
  class Voz_Q6
   police cir percent 25 conform-action transmit  exceed-action drop 
  class Video_Q6
   police cir percent 20 conform-action set-mpls-exp-imposition-transmit 5 exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 30 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_A_4096K_0_N_25_25_25_0_1_22
  class Video_Q6
   police cir percent 25 conform-action set-mpls-exp-imposition-transmit 5 exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 25 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Interativa_Q6
   police cir percent 25 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_A_4096K_7_N_36_25_15_0_2_14
  class Voz_Q6
   police cir percent 7 conform-action transmit  exceed-action drop 
  class Video_Q6
   police cir percent 36 conform-action set-mpls-exp-imposition-transmit 5 exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 25 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Interativa_Q6
   police cir percent 15 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QDO_A_1024K_18_0_29_29_0_2_20
  class class-default
    shape average 1024000
   service-policy QPO_A_1024K_18_0_29_29_0_2_20
policy-map MARCA-VOZ
  class class-default
   set dscp 46
policy-map QPI_A_1024K_31_C_0_21_14_30_2_1
  class Voz_Q6
   police cir percent 62 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 21 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Interativa_Q6
   police cir percent 14 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Bulk_Q6
   police cir percent 30 conform-action set-mpls-exp-imposition-transmit 4 exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_A_2048K_0_N_0_47_20_20_2_10
  class MissaoCritica_Q6
   police cir percent 47 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Interativa_Q6
   police cir percent 20 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Bulk_Q6
   police cir percent 20 conform-action set-mpls-exp-imposition-transmit 4 exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_A_2048K_0_N_23_0_0_0_2_74
  class Video_Q6
   police cir percent 23 conform-action set-mpls-exp-imposition-transmit 5 exceed-action drop 
  class class-default
   set mpls experimental imposition 0
policy-map QPI_A_1024K_18_N_0_29_29_0_2_20
  class Voz_Q6
   police cir percent 18 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 29 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Interativa_Q6
   police cir percent 29 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_BBONE_S_4096_V1
  class class-default
   police 4096000 128000 128000 conform-action set-dscp-transmit default exceed-action drop 
policy-map QPO_BBONE_100000_V1
  class class-default
    shape average 100000000
policy-map QPI_A_256K_19_C_0_59_0_0_7_11
  class Voz_Q6
   police cir percent 19 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 59 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_A_1024K_13_N_0_16_48_16_2_4
  class Voz_Q6
   police cir percent 13 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 16 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Interativa_Q6
   police cir percent 48 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Bulk_Q6
   police cir percent 16 conform-action set-mpls-exp-imposition-transmit 4 exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_A_512K_13_N_0_41_18_13_4_10
  class Voz_Q6
   police cir percent 13 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 41 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Interativa_Q6
   police cir percent 18 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Bulk_Q6
   police cir percent 13 conform-action set-mpls-exp-imposition-transmit 4 exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_A_2048K_16_N_40_6_0_25_2_10
  class Voz_Q6
   police cir percent 16 conform-action transmit  exceed-action drop 
  class Video_Q6
   police cir percent 40 conform-action set-mpls-exp-imposition-transmit 5 exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 6 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Bulk_Q6
   police cir percent 25 conform-action set-mpls-exp-imposition-transmit 4 exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_A_2048K_21_N_0_35_20_0_2_21
  class Voz_Q6
   police cir percent 21 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 35 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Interativa_Q6
   police cir percent 20 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_A_512K_13_N_0_46_24_8_4_4
  class Voz_Q6
   police cir percent 13 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 46 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Interativa_Q6
   police cir percent 24 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Bulk_Q6
   police cir percent 8 conform-action set-mpls-exp-imposition-transmit 4 exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_A_512K_25_N_0_50_0_0_4_19
  class Voz_Q6
   police cir percent 25 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 50 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_A_2048K_30_N_0_20_2_35_2_10
  class Voz_Q6
   police cir percent 30 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 20 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Interativa_Q6
   police cir percent 2 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Bulk_Q6
   police cir percent 35 conform-action set-mpls-exp-imposition-transmit 4 exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map PM_V10_QPO_BBONE_6144_V1
policy-map QPO_BBONE_6144_V1
  class class-default
    shape average 6144000
   service-policy PM_V10_QPO_BBONE_6144_V1
policy-map PM_V10_QPO_BBONE_1024_V1
policy-map QPO_BBONE_1024_V1
  class class-default
    shape average 1024000
   service-policy PM_V10_QPO_BBONE_1024_V1
policy-map QPI_BBONE_S_2048_V1
  class class-default
   police 2048000 64000 64000 conform-action set-dscp-transmit default exceed-action drop 
policy-map QPI_A_256K_19_N_0_25_0_0_7_47
  class Voz_Q6
   police cir percent 19 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 25 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_A_256K_10_N_0_60_13_0_7_9
  class Voz_Q6
   police cir percent 10 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 60 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Interativa_Q6
   police cir percent 13 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_A_2048K_10_N_21_11_20_11_2_24
  class Voz_Q6
   police cir percent 10 conform-action transmit  exceed-action drop 
  class Video_Q6
   police cir percent 21 conform-action set-mpls-exp-imposition-transmit 5 exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 11 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Interativa_Q6
   police cir percent 20 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Bulk_Q6
   police cir percent 11 conform-action set-mpls-exp-imposition-transmit 4 exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map PM_V10_QPO_BBONE_1500_V1
policy-map QPO_BBONE_1500_V1
  class class-default
    shape average 1500000
   service-policy PM_V10_QPO_BBONE_1500_V1
policy-map QDI_512K_BBrasil_NAC_GACC_V1
  class class-default
   police rate 512000 conform-action transmit  exceed-action drop 
   service-policy QPI_512K_BBrasil_NAC_GACC_V1
policy-map QPI_A_2048K_7_N_0_50_0_0_2_40
  class Voz_Q6
   police cir percent 7 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 50 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QDI_A_2048K_16_40_6_0_25_2_10
  class class-default
   police rate 2048000 child-conform-aware conform-action transmit  exceed-action drop 
   service-policy QPI_A_2048K_16_N_40_6_0_25_2_10
policy-map QPO_BBONE_500000_V1
  class class-default
    shape average 500000000
policy-map QPI_A_256K_22_N_0_50_0_0_7_19
  class Voz_Q6
   police cir percent 22 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 50 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_A_2048K_8_N_0_50_0_0_2_39
  class Voz_Q6
   police cir percent 8 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 50 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_A_1024K_10_N_0_2_0_0_4_83
  class Voz_Q6
   police cir percent 10 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 2 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QDI_A_1024K_18_0_29_29_0_2_20
  class class-default
   police rate 1024000 child-conform-aware conform-action transmit  exceed-action drop 
   service-policy QPI_A_1024K_18_N_0_29_29_0_2_20
policy-map QPI_A_512K_13_N_0_50_0_0_4_32
  class Voz_Q6
   police cir percent 13 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 50 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QDO_A_1024K_10_24_20_40_0_2_3
  class class-default
    shape average 1024000
   service-policy QPO_A_1024K_10_24_20_40_0_2_3
policy-map QDO_A_1024K_10_24_20_0_40_2_3
  class class-default
    shape average 1024000
   service-policy QPO_A_1024K_10_24_20_0_40_2_3
policy-map QPI_A_1024K_15_N_0_12_6_30_1_33
  class Voz_Q6
   police cir percent 15 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 12 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Interativa_Q6
   police cir percent 6 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Bulk_Q6
   police cir percent 30 conform-action set-mpls-exp-imposition-transmit 4 exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_A_512K_10_N_0_13_0_0_4_72
  class Voz_Q6
   police cir percent 10 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 13 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map PM_V10_QPO_BBONE_4096_V1
policy-map QPO_BBONE_4096_V1
  class class-default
    shape average 4096000
   service-policy PM_V10_QPO_BBONE_4096_V1
policy-map QPI_A_256K_25_N_0_40_0_0_7_22
  class Voz_Q6
   police cir percent 25 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 40 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_BBONE_S_100000_V1
  class class-default
   police 100000000 3125000 3125000 conform-action set-dscp-transmit default exceed-action drop 
policy-map QDO_A_1024K_22_0_36_22_0_2_17
  class class-default
    shape average 1024000
   service-policy QPO_A_1024K_22_0_36_22_0_2_17
policy-map QDO_A_512K_5_0_30_16_0_4_41
  class class-default
    shape average 512000
   service-policy QPO_A_512K_5_0_30_16_0_4_41
policy-map QDO_A_1024K_13_0_25_25_3_2_31
  class class-default
    shape average 1024000
   service-policy QPO_A_1024K_13_0_25_25_3_2_31
policy-map QDO_A_1024K_30_0_0_0_0_2_66
  class class-default
    shape average 1024000
   service-policy QPO_A_1024K_30_0_0_0_0_2_66
policy-map QPI_A_2048K_13_N_38_23_0_0_2_23
  class Voz_Q6
   police cir percent 13 conform-action transmit  exceed-action drop 
  class Video_Q6
   police cir percent 38 conform-action set-mpls-exp-imposition-transmit 5 exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 23 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_BBONE_S_8192_V1
  class class-default
   police 8192000 256000 256000 conform-action set-dscp-transmit default exceed-action drop 
policy-map QPI_A_256K_26_N_0_41_0_0_7_23
  class Voz_Q6
   police cir percent 26 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 41 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_A_1024K_30_N_20_19_0_0_2_28
  class Voz_Q6
   police cir percent 30 conform-action transmit  exceed-action drop 
  class Video_Q6
   police cir percent 20 conform-action set-mpls-exp-imposition-transmit 5 exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 19 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_A_1024K_22_N_0_36_22_0_2_17
  class Voz_Q6
   police cir percent 22 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 36 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Interativa_Q6
   police cir percent 22 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_A_512K_5_N_0_30_16_4_4_40
  class Voz_Q6
   police cir percent 5 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 30 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Interativa_Q6
   police cir percent 16 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Bulk_Q6
   police cir percent 4 conform-action set-mpls-exp-imposition-transmit 4 exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QDI_A_512K_5_0_30_16_4_4_40
  class class-default
   police rate 512000 child-conform-aware conform-action transmit  exceed-action drop 
   service-policy QPI_A_512K_5_N_0_30_16_4_4_40
policy-map QPI_A_512K_5_N_0_30_16_0_4_41
  class Voz_Q6
   police cir percent 5 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 30 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Interativa_Q6
   police cir percent 16 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_A_1024K_13_N_0_25_25_3_2_31
  class Voz_Q6
   police cir percent 13 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 25 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Interativa_Q6
   police cir percent 25 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Bulk_Q6
   police cir percent 3 conform-action set-mpls-exp-imposition-transmit 4 exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_A_1024K_30_N_0_0_0_0_2_66
  class Voz_Q6
   police cir percent 30 conform-action transmit  exceed-action drop 
  class class-default
   set mpls experimental imposition 0
policy-map QPO_SERPRO_2048K_V1
  class VozVideo_SERPRO
    priority
   police cir percent 40 conform-action transmit  exceed-action drop 
  class MissaoCritica_SERPRO
    bandwidth percent 10
    random-detect dscp-based
    random-detect dscp 10 12 packets 20 packets 1
    random-detect dscp 26 12 packets 20 packets 1
    random-detect dscp 28 12 packets 20 packets 1
    random-detect dscp 30 12 packets 20 packets 1
  class Interativa_SERPRO
    bandwidth percent 30
    random-detect dscp-based
    random-detect dscp 12 32 packets 48 packets 1
    random-detect dscp 18 32 packets 48 packets 1
    random-detect dscp 20 32 packets 48 packets 1
    random-detect dscp 22 32 packets 48 packets 1
  class NetworkControl_SERPRO
    bandwidth percent 1
  class class-default
    bandwidth percent 16
    random-detect dscp-based
    random-detect dscp 0 14 packets 30 packets 1
    random-detect dscp 14 14 packets 30 packets 1
policy-map QDO_A_2048K_13_38_23_0_0_2_23
  class class-default
    shape average 2048000
   service-policy QPO_A_2048K_13_38_23_0_0_2_23
policy-map MARCA-WIMAX
  class class-default
   set dscp 46
policy-map QPI_A_1024K_25_N_0_5_0_0_2_66
  class Voz_Q6
   police cir percent 25 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 5 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_A_1024K_10_N_24_20_40_0_2_3
  class Voz_Q6
   police cir percent 10 conform-action transmit  exceed-action drop 
  class Video_Q6
   police cir percent 24 conform-action set-mpls-exp-imposition-transmit 5 exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 20 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Interativa_Q6
   police cir percent 40 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_A_1024K_10_N_24_20_0_40_2_3
  class Voz_Q6
   police cir percent 10 conform-action transmit  exceed-action drop 
  class Video_Q6
   police cir percent 24 conform-action set-mpls-exp-imposition-transmit 5 exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 20 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Bulk_Q6
   police cir percent 40 conform-action set-mpls-exp-imposition-transmit 4 exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_A_1024K_31_N_0_20_13_32_2_1
  class Voz_Q6
   police cir percent 31 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 20 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Interativa_Q6
   police cir percent 13 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Bulk_Q6
   police cir percent 32 conform-action set-mpls-exp-imposition-transmit 4 exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map PM_V10_QPO_BBONE_2048_V1
policy-map QPO_BBONE_2048_V1
  class class-default
    shape average 2048000
   service-policy PM_V10_QPO_BBONE_2048_V1
policy-map QPI_A_1024K_0_N_46_16_11_21_2_3
  class Video_Q6
   police cir percent 46 conform-action set-mpls-exp-imposition-transmit 5 exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 16 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Interativa_Q6
   police cir percent 11 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Bulk_Q6
   police cir percent 21 conform-action set-mpls-exp-imposition-transmit 4 exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_A_256K_10_N_0_63_0_0_7_13
  class Voz_Q6
   police cir percent 10 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 63 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_A_512K_50_N_0_10_0_0_4_35
  class Voz_Q6
   police cir percent 50 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 10 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QDO_A_512K_5_0_30_16_4_4_40
  class class-default
    shape average 512000
   service-policy QPO_A_512K_5_0_30_16_4_4_40
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
policy-map QDI_A_2048K_13_38_23_0_0_2_23
  class class-default
   police rate 2048000 child-conform-aware conform-action transmit  exceed-action drop 
   service-policy QPI_A_2048K_13_N_38_23_0_0_2_23
policy-map QPI_A_256K_38_N_0_29_0_0_7_25
  class Voz_Q6
   police cir percent 38 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 29 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_A_1024K_12_N_0_50_13_0_2_22
  class Voz_Q6
   police cir percent 12 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 50 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Interativa_Q6
   police cir percent 13 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_BBONE_S_500000_V1
  class class-default
   police 500000000 15625000 15625000 conform-action set-dscp-transmit default exceed-action drop 
policy-map QPI_A_128K_24_C_20_25_10_10_7_3
  class Voz_Q6
   police cir percent 48 conform-action transmit  exceed-action drop 
  class Video_Q6
   police cir percent 20 conform-action set-mpls-exp-imposition-transmit 5 exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 25 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Interativa_Q6
   police cir percent 10 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Bulk_Q6
   police cir percent 10 conform-action set-mpls-exp-imposition-transmit 4 exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_A_512K_25_N_0_50_15_0_4_5
  class Voz_Q6
   police cir percent 25 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 50 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Interativa_Q6
   police cir percent 15 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_A_2048K_11_N_32_24_29_0_2_1
  class Voz_Q6
   police cir percent 11 conform-action transmit  exceed-action drop 
  class Video_Q6
   police cir percent 32 conform-action set-mpls-exp-imposition-transmit 5 exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 24 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Interativa_Q6
   police cir percent 29 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_A_2048K_0_N_0_26_31_22_1_19
  class MissaoCritica_Q6
   police cir percent 26 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Interativa_Q6
   police cir percent 31 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Bulk_Q6
   police cir percent 22 conform-action set-mpls-exp-imposition-transmit 4 exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_A_256K_38_N_0_38_0_0_7_16
  class Voz_Q6
   police cir percent 38 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 38 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_A_256K_19_N_0_59_0_0_7_11
  class Voz_Q6
   police cir percent 19 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 59 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map PM_V10_SHAPE_OUT_960
  class class-default
   police cir 96000 bc 4470 be 4470 conform-action set-dscp-transmit af11 exceed-action set-dscp-transmit default
policy-map SHAPE_OUT_960
  class class-default
    shape average 960000
   service-policy PM_V10_SHAPE_OUT_960
policy-map QPI_A_256K_0_N_0_84_0_0_7_8
  class MissaoCritica_Q6
   police cir percent 84 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_A_2048K_2_N_0_0_81_0_2_14
  class Voz_Q6
   police cir percent 2 conform-action transmit  exceed-action drop 
  class Interativa_Q6
   police cir percent 81 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_A_1024K_13_C_0_16_48_16_2_4
  class Voz_Q6
   police cir percent 13 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 16 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Interativa_Q6
   police cir percent 48 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Bulk_Q6
   police cir percent 16 conform-action set-mpls-exp-imposition-transmit 4 exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_A_1024K_5_N_45_0_0_0_2_47
  class Voz_Q6
   police cir percent 5 conform-action transmit  exceed-action drop 
  class Video_Q6
   police cir percent 45 conform-action set-mpls-exp-imposition-transmit 5 exceed-action drop 
  class class-default
   set mpls experimental imposition 0
policy-map QDI_A_1024K_10_24_20_40_0_2_3
  class class-default
   police rate 1024000 child-conform-aware conform-action transmit  exceed-action drop 
   service-policy QPI_A_1024K_10_N_24_20_40_0_2_3
policy-map QDI_A_1024K_10_24_20_0_40_2_3
  class class-default
   police rate 1024000 child-conform-aware conform-action transmit  exceed-action drop 
   service-policy QPI_A_1024K_10_N_24_20_0_40_2_3
policy-map QPI_A_2048K_0_N_0_20_9_0_6_54
  class MissaoCritica_Q6
   police cir percent 20 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Interativa_Q6
   police cir percent 9 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_A_256K_38_N_0_35_0_0_7_19
  class Voz_Q6
   police cir percent 38 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 35 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_BBONE_S_1024_V1
  class class-default
   police 1024000 32000 32000 conform-action set-dscp-transmit default exceed-action drop 
policy-map QDI_A_1024K_22_0_36_22_0_2_17
  class class-default
   police rate 1024000 child-conform-aware conform-action transmit  exceed-action drop 
   service-policy QPI_A_1024K_22_N_0_36_22_0_2_17
policy-map QPI_A_2048K_6_N_0_49_0_0_1_43
  class Voz_Q6
   police cir percent 6 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 49 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_A_2048K_31_N_19_37_0_0_2_10
  class Voz_Q6
   police cir percent 31 conform-action transmit  exceed-action drop 
  class Video_Q6
   police cir percent 19 conform-action set-mpls-exp-imposition-transmit 5 exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 37 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QDI_A_512K_5_0_30_16_0_4_41
  class class-default
   police rate 512000 child-conform-aware conform-action transmit  exceed-action drop 
   service-policy QPI_A_512K_5_N_0_30_16_0_4_41
policy-map QPI_A_1024K_7_N_0_0_0_40_2_50
  class Voz_Q6
   police cir percent 7 conform-action transmit  exceed-action drop 
  class Bulk_Q6
   police cir percent 40 conform-action set-mpls-exp-imposition-transmit 4 exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QDI_A_1024K_13_0_25_25_3_2_31
  class class-default
   police rate 1024000 child-conform-aware conform-action transmit  exceed-action drop 
   service-policy QPI_A_1024K_13_N_0_25_25_3_2_31
policy-map QDI_A_1024K_30_0_0_0_0_2_66
  class class-default
   police rate 1024000 child-conform-aware conform-action transmit  exceed-action drop 
   service-policy QPI_A_1024K_30_N_0_0_0_0_2_66
policy-map QPI_A_1024K_7_N_0_50_0_0_2_40
  class Voz_Q6
   police cir percent 7 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 50 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_A_1024K_30_N_20_20_0_0_2_27
  class Voz_Q6
   police cir percent 30 conform-action transmit  exceed-action drop 
  class Video_Q6
   police cir percent 20 conform-action set-mpls-exp-imposition-transmit 5 exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 20 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_A_512K_5_N_0_30_16_0_4_44
  class Voz_Q6
   police cir percent 5 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 30 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Interativa_Q6
   police cir percent 16 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPO_SGNET_512_0_256_192_0B_V1
  class BUSINESS
    bandwidth 256
    random-detect dscp-based
  class SUPORTE_AO_NEGOCIO
    bandwidth 192
    random-detect dscp-based
policy-map QPO_VIPSIP_VOZ_800_V1
  class Voz_Q6
    priority
   police rate 736000 conform-action transmit  exceed-action drop 
  class NetworkControl_Q6
    bandwidth 64
    queue-limit 32 packets
policy-map QDO_VIPSIP_VOZ_800_V1
  class class-default
    shape average 800000
   service-policy QPO_VIPSIP_VOZ_800_V1
policy-map QPI_SGNET_512_0_256_192_0B_V1
  class BUSINESS
   police 256000 8000 8000 conform-action transmit  exceed-action set-dscp-transmit default
  class SUPORTE_AO_NEGOCIO
   police 192000 6000 6000 conform-action transmit  exceed-action set-dscp-transmit default
policy-map QOS_DTS_OUT_A_960K_32K_0K
  class class-default
    shape average 960000
   service-policy QOS_POLICY_OUT_A_4P_0P
policy-map QDI_VIPSIP_VOZ_800_V1
  class class-default
   police rate 800000 child-conform-aware conform-action transmit  exceed-action drop 
policy-map QPI_64K_BBrasil_PAE_IOS_V1
  class MISSAO_CRITICA
   police cir 32000 bc 4470 be 4470 conform-action transmit  exceed-action set-dscp-transmit af43
  class GERENCIAMENTO
   police cir 8000 bc 4470 be 4470 conform-action transmit  exceed-action set-dscp-transmit af32
  class NETWORK_CONTROL
   police cir 8000 bc 4470 be 4470 conform-action transmit  exceed-action set-dscp-transmit cs6
  class STANDARD
   police cir 16000 bc 4470 be 4470 conform-action transmit  exceed-action set-dscp-transmit default
policy-map QDI_64K_BBrasil_PAE_IOS_V1
  class class-default
   police rate 64000 conform-action transmit  exceed-action drop 
   service-policy QPI_64K_BBrasil_PAE_IOS_V1
policy-map PM_V10_QPO_BBONE_10000_V1
policy-map WAN_OUT_OMEGA_TER
  class MISSAO_CRITICA
    bandwidth percent 39
  class GERENCIAMENTO
    bandwidth percent 13
policy-map QPO_64K_BBrasil_PAE_IOS_V1
  class MISSAO_CRITICA
    bandwidth percent 50
    random-detect dscp-based
  class GERENCIAMENTO
    bandwidth percent 13
    random-detect dscp-based
  class NETWORK_CONTROL
    bandwidth percent 12
    random-detect dscp-based
  class STANDARD
    bandwidth percent 25
    random-detect dscp-based
policy-map QDO_64K_BBrasil_PAE_IOS_V1
  class class-default
    shape average 64000
   service-policy QPO_64K_BBrasil_PAE_IOS_V1
policy-map QOS_POLICY_IN_A_50P_51P
  class REALTIME
   police cir percent 50 conform-action transmit  exceed-action drop 
  class BUSINESS
   police cir percent 51 conform-action transmit  exceed-action set-dscp-transmit default
  class class-default
   set mpls experimental imposition 0
policy-map QOS_POLICY_IN_A_13P_78P
  class REALTIME
   police cir percent 13 conform-action transmit  exceed-action drop 
  class BUSINESS
   police cir percent 78 conform-action transmit  exceed-action set-dscp-transmit default
  class class-default
   set mpls experimental imposition 0
policy-map QOS_POLICY_IN_A_32P_0P
  class REALTIME
   police cir percent 32 conform-action transmit  exceed-action drop 
  class class-default
   set mpls experimental imposition 0
policy-map QPI_MCI_ETM_512K_64K_448K_GSR32_V1
  class SILVER_AF4x_MCI
   set mpls experimental 5
  class SILVER_AF3x_MCI
   set mpls experimental 1
  class SILVER_AF2x_MCI
   set mpls experimental 1
policy-map QPO_VIPSIP_VOZ_1500_V1
  class Voz_Q6
    priority
   police rate 1432000 conform-action transmit  exceed-action drop 
  class NetworkControl_Q6
    bandwidth 64
    queue-limit 32 packets
policy-map QPO_MCI_ETM_512K_64K_448K_GSR32_V1
  class GOLD_EF_MCI
    priority
   police cir percent 90
  class SILVER_AF4x_MCI
    bandwidth percent 3
    random-detect dscp-based
    random-detect dscp 32 43 packets 129 packets 1
    random-detect dscp 34 43 packets 129 packets 1
    random-detect dscp 36 13 packets 43 packets 1
    random-detect dscp 38 13 packets 43 packets 1
    queue-limit 512 packets
  class SILVER_AF3x_MCI
    bandwidth percent 3
    random-detect dscp-based
    random-detect dscp 24 33 packets 110 packets 1
    random-detect dscp 26 33 packets 110 packets 1
    random-detect dscp 28 10 packets 33 packets 1
    random-detect dscp 30 10 packets 33 packets 1
    random-detect dscp 48 140 packets 150 packets 10
    random-detect dscp 56 140 packets 150 packets 10
    queue-limit 512 packets
  class SILVER_AF2x_MCI
    bandwidth percent 2
    random-detect dscp-based
    random-detect dscp 16 33 packets 110 packets 1
    random-detect dscp 18 33 packets 110 packets 1
    random-detect dscp 20 10 packets 33 packets 1
    random-detect dscp 22 10 packets 33 packets 1
    queue-limit 512 packets
  class SILVER_BEST_EFFORT_MCI
    bandwidth percent 1
    random-detect
    queue-limit 512 packets
policy-map QPI_BBONE_EXP_V1
  class class-default
   set mpls experimental imposition 0
policy-map QDO_MCI_ETM_512K_64K_448K_GSR32_V1
  class class-default
    shape average 512000
   service-policy QPO_MCI_ETM_512K_64K_448K_GSR32_V1
policy-map PM_V10_QPO_BBONE_100000_V1
policy-map QDO_VIPSIP_VOZ_1500_V1
  class class-default
    shape average 1500000
   service-policy QPO_VIPSIP_VOZ_1500_V1
!
frame-relay switching
mpls ldp igp sync holddown 30000
no mpls traffic-eng auto-bw timers frequency 0
file prompt quiet
!
controller SONET 0/1/0
 description Link-DATACOM | 155M | SLSUSDM/SLSUSIT/155M/005 | DMSTM1-SLSUS-DI05-AGGA-1
 ais-shut
 alarm-report all
 framing sdh
 clock source line
 overhead j0 1
 aug mapping au-4
 !
 au-4 1 tug-3 1
  mode c-12
  tug-2 1 e1 1 unframed
  tug-2 1 e1 1 clock source Line
  tug-2 1 e1 2 unframed
  tug-2 1 e1 2 clock source Line
  tug-2 2 e1 1 unframed
  tug-2 2 e1 1 clock source Line
  tug-2 3 e1 3 channel-group 0 timeslots 1-16
  tug-2 3 e1 3 framing no-crc4
  tug-2 3 e1 3 clock source Line
  tug-2 5 e1 1 channel-group 2 timeslots 1-8
  tug-2 5 e1 1 framing no-crc4
  tug-2 5 e1 1 clock source Line
  tug-2 5 e1 2 channel-group 1 timeslots 9-16
  tug-2 5 e1 2 channel-group 2 timeslots 19-26
  tug-2 5 e1 2 channel-group 3 timeslots 1-8
  tug-2 5 e1 2 channel-group 4 timeslots 27-30
  tug-2 5 e1 2 framing no-crc4
  tug-2 5 e1 2 clock source Line
  tug-2 6 e1 1 unframed
  tug-2 6 e1 1 clock source Line
  tug-2 7 e1 3 unframed
  tug-2 7 e1 3 clock source Line
 !
 au-4 1 tug-3 2
  mode c-12
  tug-2 1 e1 2 channel-group 0 timeslots 1-16
  tug-2 1 e1 2 framing no-crc4
  tug-2 1 e1 2 clock source Line
  tug-2 2 e1 3 unframed
  tug-2 2 e1 3 clock source Line
  tug-2 5 e1 3 unframed
  tug-2 5 e1 3 clock source Line
  tug-2 7 e1 2 channel-group 2 timeslots 1-8
  tug-2 7 e1 2 framing no-crc4
  tug-2 7 e1 2 clock source Line
  tug-2 7 e1 3 channel-group 0 timeslots 1-16
  tug-2 7 e1 3 channel-group 1 timeslots 23-30
  tug-2 7 e1 3 channel-group 2 timeslots 17-20
  tug-2 7 e1 3 framing no-crc4
  tug-2 7 e1 3 clock source Line
 !
 au-4 1 tug-3 3
  mode c-12
  tug-2 1 e1 1 channel-group 2 timeslots 21-28
  tug-2 1 e1 1 channel-group 3 timeslots 1-4
  tug-2 1 e1 1 framing no-crc4
  tug-2 1 e1 1 clock source Line
  tug-2 1 e1 3 channel-group 0 timeslots 1-16
  tug-2 1 e1 3 channel-group 4 timeslots 27
  tug-2 1 e1 3 framing no-crc4
  tug-2 1 e1 3 clock source Line
  tug-2 2 e1 1 channel-group 1 timeslots 5-8
  tug-2 2 e1 1 channel-group 2 timeslots 9-10
  tug-2 2 e1 1 channel-group 3 timeslots 11-12
  tug-2 2 e1 1 channel-group 4 timeslots 13-16
  tug-2 2 e1 1 channel-group 5 timeslots 21-28
  tug-2 2 e1 1 framing no-crc4
  tug-2 2 e1 1 clock source Line
  tug-2 2 e1 2 channel-group 0 timeslots 1-8
  tug-2 2 e1 2 channel-group 1 timeslots 9-16
  tug-2 2 e1 2 channel-group 2 timeslots 17-18
  tug-2 2 e1 2 channel-group 3 timeslots 24-31
  tug-2 2 e1 2 framing no-crc4
  tug-2 2 e1 2 clock source Line
  tug-2 2 e1 3 channel-group 3 timeslots 17-24
  tug-2 2 e1 3 framing no-crc4
  tug-2 2 e1 3 clock source Line
  tug-2 3 e1 1 channel-group 2 timeslots 1-8
  tug-2 3 e1 1 framing no-crc4
  tug-2 3 e1 1 clock source Line
  tug-2 3 e1 2 channel-group 1 timeslots 9-12
  tug-2 3 e1 2 channel-group 2 timeslots 1-8
  tug-2 3 e1 2 framing no-crc4
  tug-2 3 e1 2 clock source Line
  tug-2 4 e1 1 unframed
  tug-2 4 e1 1 clock source Line
  tug-2 5 e1 1 unframed
  tug-2 5 e1 1 clock source Line
  tug-2 5 e1 2 unframed
  tug-2 5 e1 2 clock source Line
  tug-2 7 e1 2 channel-group 0 timeslots 1-16
  tug-2 7 e1 2 framing no-crc4
  tug-2 7 e1 2 clock source Line
!
controller SONET 0/2/0
 description Link-DATACOM | 155M | SLSUSDM/SLSUSIT/155M/006 | DMSTM1-SLSUS-DI06-AGGA-1
 ais-shut
 alarm-report all
 framing sdh
 clock source line
 overhead j0 1
 aug mapping au-4
 !
 au-4 1 tug-3 1
  mode c-12
  tug-2 1 e1 3 channel-group 0 timeslots 24-31
  tug-2 1 e1 3 channel-group 1 timeslots 4-7
  tug-2 1 e1 3 channel-group 2 timeslots 8-11
  tug-2 1 e1 3 framing no-crc4
  tug-2 1 e1 3 clock source Line
  tug-2 2 e1 2 unframed
  tug-2 2 e1 2 clock source Line
  tug-2 2 e1 3 unframed
  tug-2 2 e1 3 clock source Line
  tug-2 3 e1 2 channel-group 0 timeslots 1-16
  tug-2 3 e1 2 framing no-crc4
  tug-2 3 e1 2 clock source Line
  tug-2 3 e1 3 unframed
  tug-2 3 e1 3 clock source Line
  tug-2 4 e1 1 unframed
  tug-2 4 e1 1 clock source Line
  tug-2 4 e1 2 unframed
  tug-2 4 e1 2 clock source Line
  tug-2 4 e1 3 unframed
  tug-2 4 e1 3 clock source Line
  tug-2 5 e1 1 unframed
  tug-2 5 e1 1 clock source Line
  tug-2 5 e1 2 unframed
  tug-2 5 e1 2 clock source Line
  tug-2 6 e1 2 channel-group 0 timeslots 1-16
  tug-2 6 e1 2 framing no-crc4
  tug-2 6 e1 2 clock source Line
  tug-2 7 e1 2 unframed
  tug-2 7 e1 2 clock source Line
 !
 au-4 1 tug-3 2
  mode c-12
  tug-2 1 e1 2 unframed
  tug-2 1 e1 2 clock source Line
  tug-2 2 e1 2 channel-group 0 timeslots 1-16
  tug-2 2 e1 2 framing no-crc4
  tug-2 2 e1 2 clock source Line
  tug-2 4 e1 2 unframed
  tug-2 4 e1 2 clock source Line
  tug-2 4 e1 3 unframed
  tug-2 4 e1 3 clock source Line
  tug-2 6 e1 1 channel-group 0 timeslots 1-16
  tug-2 6 e1 1 framing no-crc4
  tug-2 6 e1 1 clock source Line
  tug-2 7 e1 2 unframed
  tug-2 7 e1 2 clock source Line
  tug-2 7 e1 3 unframed
  tug-2 7 e1 3 clock source Line
 !
 au-4 1 tug-3 3
  mode c-12
  tug-2 1 e1 1 unframed
  tug-2 1 e1 1 clock source Line
  tug-2 3 e1 2 unframed
  tug-2 3 e1 2 clock source Line
  tug-2 4 e1 1 unframed
  tug-2 4 e1 1 clock source Line
  tug-2 4 e1 2 channel-group 1 timeslots 17-24
  tug-2 4 e1 2 framing no-crc4
  tug-2 4 e1 2 clock source Line
  tug-2 4 e1 3 unframed
  tug-2 4 e1 3 clock source Line
  tug-2 5 e1 2 unframed
  tug-2 5 e1 2 clock source Line
!
controller SONET 1/1/0
 description Link-DATACOM | 155M | SLSUSDM/SLSUSIT/155M/012 | DMSTM1-SLSUS-DI12-AGGA-1
 ais-shut
 alarm-report all
 framing sdh
 clock source line
 overhead j0 1
 aug mapping au-4
 !
 au-4 1 tug-3 1
  mode c-12
  tug-2 1 e1 1 unframed
  tug-2 1 e1 1 clock source Line
  tug-2 2 e1 1 unframed
  tug-2 2 e1 1 clock source Line
  tug-2 2 e1 3 channel-group 0 timeslots 1-8
  tug-2 2 e1 3 channel-group 1 timeslots 9-16
  tug-2 2 e1 3 channel-group 2 timeslots 17-24
  tug-2 2 e1 3 framing no-crc4
  tug-2 2 e1 3 clock source Line
  tug-2 4 e1 2 channel-group 1 timeslots 9-16
  tug-2 4 e1 2 channel-group 2 timeslots 7-8
  tug-2 4 e1 2 channel-group 3 timeslots 21-28
  tug-2 4 e1 2 channel-group 4 timeslots 1-4
  tug-2 4 e1 2 framing no-crc4
  tug-2 4 e1 2 clock source Line
  tug-2 7 e1 2 unframed
  tug-2 7 e1 2 clock source Line
 !
 au-4 1 tug-3 2
  mode c-12
  tug-2 1 e1 3 channel-group 0 timeslots 1-16
  tug-2 1 e1 3 framing no-crc4
  tug-2 1 e1 3 clock source Line
  tug-2 2 e1 1 channel-group 1 timeslots 1-8
  tug-2 2 e1 1 channel-group 2 timeslots 13
  tug-2 2 e1 1 channel-group 3 timeslots 24-31
  tug-2 2 e1 1 channel-group 4 timeslots 16-23
  tug-2 2 e1 1 channel-group 5 timeslots 9-12
  tug-2 2 e1 1 framing no-crc4
  tug-2 2 e1 1 clock source Line
  tug-2 2 e1 2 channel-group 1 timeslots 1-8
  tug-2 2 e1 2 channel-group 3 timeslots 24-31
  tug-2 2 e1 2 channel-group 4 timeslots 13-20
  tug-2 2 e1 2 framing no-crc4
  tug-2 2 e1 2 clock source Line
  tug-2 2 e1 3 channel-group 1 timeslots 1-16
  tug-2 2 e1 3 channel-group 2 timeslots 17-24
  tug-2 2 e1 3 channel-group 4 timeslots 26
  tug-2 2 e1 3 framing no-crc4
  tug-2 2 e1 3 clock source Line
  tug-2 3 e1 1 channel-group 0 timeslots 21-22
  tug-2 3 e1 1 channel-group 1 timeslots 13-20
  tug-2 3 e1 1 channel-group 2 timeslots 9-12
  tug-2 3 e1 1 channel-group 3 timeslots 1-8
  tug-2 3 e1 1 channel-group 4 timeslots 23-30
  tug-2 3 e1 1 framing no-crc4
  tug-2 3 e1 1 clock source Line
  tug-2 3 e1 2 channel-group 3 timeslots 16-23
  tug-2 3 e1 2 channel-group 5 timeslots 24-31
  tug-2 3 e1 2 framing no-crc4
  tug-2 3 e1 2 clock source Line
 !
 au-4 1 tug-3 3
  mode c-12
  tug-2 4 e1 2 unframed
  tug-2 4 e1 2 clock source Line
  tug-2 6 e1 2 channel-group 0 timeslots 1-16
  tug-2 6 e1 2 framing no-crc4
  tug-2 6 e1 2 clock source Line
  tug-2 7 e1 2 channel-group 1 timeslots 24-27
  tug-2 7 e1 2 channel-group 2 timeslots 9-12
  tug-2 7 e1 2 channel-group 3 timeslots 28-31
  tug-2 7 e1 2 channel-group 5 timeslots 16-23
  tug-2 7 e1 2 framing no-crc4
  tug-2 7 e1 2 clock source Line
!
controller SONET 1/2/0
 description Link Datacom | 155M | SLSUSDM/SLSUSIT/155M/014 | PTA: DMSTM1-SLSUS-DI14 AGGA 1
 ais-shut
 alarm-report all
 framing sdh
 clock source line
 overhead j0 1
 aug mapping au-4
 !
 au-4 1 tug-3 1
  mode c-12
  tug-2 1 e1 3 unframed
  tug-2 1 e1 3 clock source Line
  tug-2 2 e1 2 unframed
  tug-2 2 e1 2 clock source Line
  tug-2 2 e1 3 channel-group 0 timeslots 1-16
  tug-2 2 e1 3 framing no-crc4
  tug-2 2 e1 3 clock source Line
  tug-2 3 e1 1 unframed
  tug-2 3 e1 1 clock source Line
  tug-2 3 e1 3 unframed
  tug-2 3 e1 3 clock source Line
  tug-2 4 e1 2 unframed
  tug-2 4 e1 2 clock source Line
  tug-2 5 e1 3 unframed
  tug-2 5 e1 3 clock source Line
  tug-2 6 e1 1 channel-group 0 timeslots 1-16
  tug-2 6 e1 1 framing no-crc4
  tug-2 6 e1 1 clock source Line
 !
 au-4 1 tug-3 2
  mode c-12
  tug-2 1 e1 3 unframed
  tug-2 1 e1 3 clock source Line
  tug-2 5 e1 1 channel-group 0 timeslots 1-16
  tug-2 5 e1 1 framing no-crc4
  tug-2 5 e1 1 clock source Line
  tug-2 6 e1 1 unframed
  tug-2 6 e1 1 clock source Line
 !
 au-4 1 tug-3 3
  mode c-12
  tug-2 1 e1 2 channel-group 0 timeslots 1-16
  tug-2 1 e1 2 framing no-crc4
  tug-2 1 e1 2 clock source Line
  tug-2 1 e1 3 channel-group 0 timeslots 1-16
  tug-2 1 e1 3 framing no-crc4
  tug-2 1 e1 3 clock source Line
  tug-2 3 e1 1 unframed
  tug-2 3 e1 1 clock source Line
  tug-2 3 e1 3 unframed
  tug-2 3 e1 3 clock source Line
  tug-2 4 e1 3 unframed
  tug-2 4 e1 3 clock source Line
  tug-2 5 e1 2 channel-group 0 timeslots 1-16
  tug-2 5 e1 2 framing no-crc4
  tug-2 5 e1 2 clock source Line
  tug-2 5 e1 3 unframed
  tug-2 5 e1 3 clock source Line
  tug-2 6 e1 2 unframed
  tug-2 6 e1 2 clock source Line
  tug-2 7 e1 3 unframed
  tug-2 7 e1 3 clock source Line
!
controller SONET 1/3/0
 description Link Datacom | 155M | SLSUSDM/SLSUSIT/155M/008 | PTA: DMSTM1-SLSUS-DI08 AGGA 1
 ais-shut
 alarm-report all
 framing sdh
 clock source line
 overhead j0 1
 aug mapping au-4
 !
 au-4 1 tug-3 1
  mode c-12
  tug-2 1 e1 3 channel-group 0 timeslots 1-16
  tug-2 1 e1 3 framing no-crc4
  tug-2 1 e1 3 clock source Line
  tug-2 3 e1 3 unframed
  tug-2 3 e1 3 clock source Line
  tug-2 4 e1 3 unframed
  tug-2 4 e1 3 clock source Line
  tug-2 5 e1 3 unframed
  tug-2 5 e1 3 clock source Line
  tug-2 6 e1 1 channel-group 0 timeslots 1-16
  tug-2 6 e1 1 framing no-crc4
  tug-2 6 e1 1 clock source Line
 !
 au-4 1 tug-3 2
  mode c-12
  tug-2 3 e1 1 channel-group 0 timeslots 1-16
  tug-2 3 e1 1 framing no-crc4
  tug-2 3 e1 1 clock source Line
  tug-2 3 e1 2 unframed
  tug-2 3 e1 2 clock source Line
  tug-2 3 e1 3 unframed
  tug-2 3 e1 3 clock source Line
  tug-2 6 e1 1 unframed
  tug-2 6 e1 1 clock source Line
  tug-2 7 e1 2 channel-group 0 timeslots 1-16
  tug-2 7 e1 2 framing no-crc4
  tug-2 7 e1 2 clock source Line
 !
 au-4 1 tug-3 3
  mode c-12
  tug-2 2 e1 1 unframed
  tug-2 2 e1 1 clock source Line
  tug-2 3 e1 3 channel-group 0 timeslots 1-16
  tug-2 3 e1 3 framing no-crc4
  tug-2 3 e1 3 clock source Line
  tug-2 4 e1 1 unframed
  tug-2 4 e1 1 clock source Line
  tug-2 4 e1 2 unframed
  tug-2 4 e1 2 clock source Line
  tug-2 5 e1 1 unframed
  tug-2 5 e1 1 clock source Line
  tug-2 5 e1 2 unframed
  tug-2 5 e1 2 clock source Line
!
controller E1 8/0
 shutdown
!
controller T1 8/0
 shutdown
!
controller T1 8/1
 shutdown
!
controller E1 8/1
 shutdown
!
controller E1 9/0
 shutdown
!
controller T1 9/0
 shutdown
!
controller T1 9/1
 shutdown
!
controller E1 9/1
 shutdown
!
process-max-time 50
!
interface Loopback0
 description Endereco de Acesso ao Roteador
 ip address 200.244.41.232 255.255.255.255
 no ip redirects
 no ip unreachables
 no ip directed-broadcast
 no ip proxy-arp
 ip pim sparse-mode
 hold-queue 2000 in
!
interface Loopback1
 description Loopback Tunel/Voz
 ip address 10.6.129.33 255.255.255.255
 no ip directed-broadcast
!
interface Loopback2
 description loopback de gerencia
 ip address 10.6.177.33 255.255.255.255
 no ip directed-broadcast
!
interface Loopback1901
 description TST | BGP | 65000
 ip address 172.20.64.2 255.255.255.255
 no ip directed-broadcast
 no clns route-cache
!
interface Loopback1902
 description TST | BGP | 65000
 ip vrf forwarding TRT_NACIONAL:153663
 ip address 172.20.64.2 255.255.255.255
 no ip directed-broadcast
 no clns route-cache
!
interface Loopback20000
 ip vrf forwarding TESTE_TMX:200002
 ip address 192.168.0.1 255.255.255.255
 no ip directed-broadcast
!
interface Multilink8
 dampening 30 50 1100 200
 description TST  | 4096K | SLS/MULTI/06343 | (SLS/MULTI/06343) | BGP_AS65000
 ip vrf forwarding TRT16:3540
 ip address 172.30.16.1 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 load-interval 30
 no peer neighbor-route
 no cdp enable
 ppp multilink
 no ppp multilink fragmentation
 multilink min-links 1 mandatory
 multilink-group 8
 no clns route-cache
 service-policy input QPI_A_4096K_12_N_0_8_8_13_1_57
 service-policy output QPO_A_4096K_12_0_8_8_13_1_57
!
interface Multilink18
 dampening 30 50 1100 200
 description CBE  | 2048K | CDO/MULTI/24214 | (CDO/MULTI/24214) | BGP_AS64962
 bandwidth 2048
 ip vrf forwarding CBE:4734
 ip address 187.28.122.29 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 load-interval 30
 no peer neighbor-route
 no cdp enable
 ppp multilink
 ppp multilink interleave
 multilink min-links 1 mandatory
 multilink-group 18
 no clns route-cache
 service-policy input QPI_A_2048K_11_N_32_24_29_0_2_1
 service-policy output QPO_A_2048K_11_32_24_29_0_2_1
!
interface Multilink30
 dampening 30 50 1100 200
 description SEBRAEMA  | 10240K | SLS/MULTI/26117 | (SLS/MULTI/26117)
 ip address 187.28.122.65 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 load-interval 30
 no peer neighbor-route
 no cdp enable
 ppp multilink
 no ppp multilink fragmentation
 multilink min-links 1 mandatory
 multilink-group 30
 no clns route-cache
 service-policy input QPI_BBONE_DSCP_V1
!
interface Multilink32
 dampening 30 50 1100 200
 description LOJASRIACHUELO  | 1024K | SLS/MULTI/18374 | (SLS/MULTI/18374) | BGP_AS65519
 bandwidth 1024
 ip vrf forwarding LOJASRIACHUELO:4120
 ip address 189.53.246.141 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no peer neighbor-route
 no cdp enable
 ppp multilink
 ppp multilink fragment-delay 10
 ppp multilink interleave
 multilink min-links 1 mandatory
 multilink-group 32
 no clns route-cache
 service-policy input QPI_A_1024K_13_N_0_16_48_16_2_4
 service-policy output QPO_A_1024K_13_0_16_48_16_2_4
!
interface Multilink43
 dampening 30 50 1100 200
 description INFRAERO  | 2048K | SLS/MULTI/25947 | (SLS/MULTI/25947) | BGP_AS65000
 bandwidth 2048
 ip vrf forwarding INFRAERO:4781
 ip address 10.10.34.41 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 load-interval 30
 no peer neighbor-route
 no cdp enable
 ppp multilink
 ppp multilink interleave
 multilink min-links 1 mandatory
 multilink-group 43
 no clns route-cache
 service-policy input QPI_A_2048K_10_N_21_11_20_11_2_24
 service-policy output QPO_A_2048K_10_21_11_20_11_2_24
!
interface Multilink54
 dampening 30 50 1100 200
 description SBF  | 256K | SLS/MULTI/28220 | (SLS/MULTI/28220) | BGP_AS64732
 bandwidth 256
 ip vrf forwarding BYTENNIS:3608
 ip address 187.28.122.221 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no peer neighbor-route
 no cdp enable
 ppp multilink
 ppp multilink fragment-delay 10
 ppp multilink interleave
 no ppp multilink fragmentation
 multilink min-links 1 mandatory
 multilink-group 54
 no clns route-cache
 service-policy input QPI_A_256K_38_N_0_29_0_0_7_25
 service-policy output QPO_A_256K_38_0_29_0_0_7_25
!
interface Multilink55
 dampening 30 50 1100 200
 description LOJASRIACHUELO  | 1024K | SLS/MULTI/27860 | (SLS/MULTI/27860) | BGP_AS65519
 bandwidth 1024
 ip vrf forwarding LOJASRIACHUELO:4120
 ip address 201.73.255.45 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 ip tcp header-compression iphc-format
 ip tcp compression-connections 1
 no peer neighbor-route
 no cdp enable
 ppp multilink
 ppp multilink fragment-delay 10
 ppp multilink interleave
 multilink min-links 1 mandatory
 multilink-group 55
 no clns route-cache
 service-policy input QPI_A_1024K_13_C_0_16_48_16_2_4
 service-policy output QPO_A_1024K_13_0_16_48_16_2_4
 ip rtp header-compression iphc-format
 ip header-compression max-header 40
!
interface Multilink59
 dampening 30 50 1100 200
 description CREDISHOP  | 256K | SIS/MULTI/28891 | (SIS/MULTI/28891) | BGP_AS64518
 bandwidth 256
 ip vrf forwarding CREDISHOP:1661
 ip address 187.28.122.241 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 load-interval 30
 no peer neighbor-route
 no cdp enable
 ppp multilink
 ppp multilink fragment-delay 10
 ppp multilink interleave
 multilink min-links 1 mandatory
 multilink-group 59
 no clns route-cache
 service-policy input QPI_A_256K_26_N_0_41_0_0_7_23
 service-policy output QPO_A_256K_26_0_41_0_0_7_23
!
interface Multilink64
 dampening 30 50 1100 200
 description ABNAMRO  | 512K | SLS/MULTI/03689 | (SLS/MULTI/03689) | BGP_AS65069
 bandwidth 512
 ip vrf forwarding ABNAMRO:2803
 ip address 189.42.84.1 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 ip tcp header-compression iphc-format
 ip tcp compression-connections 1
 no peer neighbor-route
 no cdp enable
 ppp multilink
 ppp multilink fragment-delay 10
 ppp multilink interleave
 multilink min-links 1 mandatory
 multilink-group 64
 no clns route-cache
 service-policy input QPI_A_512K_31_C_0_21_14_28_4_1
 service-policy output QPO_A_512K_31_0_21_14_28_4_1
 ip rtp header-compression iphc-format
 ip rtp compression-connections 20
 ip header-compression max-header 40
!
interface Multilink65
 dampening 30 50 1100 200
 description ABNAMRO  | 512K | SLS/MULTI/05552 | (SLS/MULTI/05552) | BGP_AS65069
 bandwidth 512
 ip vrf forwarding ABNAMRO:2803
 ip address 189.42.84.9 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 ip tcp header-compression iphc-format
 ip tcp compression-connections 1
 no peer neighbor-route
 no cdp enable
 ppp multilink
 ppp multilink fragment-delay 10
 ppp multilink interleave
 multilink min-links 1 mandatory
 multilink-group 65
 no clns route-cache
 service-policy input QPI_A_512K_31_C_0_21_14_28_4_1
 service-policy output QPO_A_512K_31_0_21_14_28_4_1
 ip rtp header-compression iphc-format
 ip rtp compression-connections 20
 ip header-compression max-header 40
!
interface Multilink69
 dampening 30 50 1100 200
 description ABNAMRO  | 2048K | SLS/MULTI/29685 | (SLS/MULTI/29685) | BGP_AS65069
 bandwidth 2048
 ip vrf forwarding ABNAMRO:2803
 ip address 187.28.240.13 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 ip tcp header-compression iphc-format
 ip tcp compression-connections 1
 no peer neighbor-route
 no cdp enable
 ppp multilink
 ppp multilink fragment-delay 10
 no ppp multilink fragmentation
 multilink min-links 1 mandatory
 multilink-group 69
 no clns route-cache
 service-policy input QOS_POLICY_IN_A_32P_0P
 service-policy output QOS_POLICY_OUT_A_16P_0P
 ip rtp header-compression iphc-format
 ip rtp compression-connections 39
 ip header-compression max-header 40
!
interface Multilink71
 dampening 30 50 1100 200
 description ABNAMRO  | 1024K | SLS/MULTI/03831 | (SLS/MULTI/03831) | BGP_AS65069
 bandwidth 1024
 ip vrf forwarding ABNAMRO:2803
 ip address 189.42.91.201 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 ip tcp header-compression iphc-format
 ip tcp compression-connections 1
 no peer neighbor-route
 no cdp enable
 ppp multilink
 ppp multilink fragment-delay 10
 ppp multilink interleave
 multilink min-links 1 mandatory
 multilink-group 71
 no clns route-cache
 service-policy input QPI_A_1024K_31_C_0_21_14_30_2_1
 service-policy output QPO_A_1024K_31_0_21_14_30_2_1
 ip rtp header-compression iphc-format
 ip rtp compression-connections 39
 ip header-compression max-header 40
!
interface Multilink78
 dampening 30 50 1100 200
 description CREDISHOP  | 256K | CDO/MULTI/30455 | (CDO/MULTI/30455) | BGP_AS64518
 bandwidth 256
 ip vrf forwarding CREDISHOP:1661
 ip address 187.28.122.33 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no peer neighbor-route
 no cdp enable
 ppp multilink
 ppp multilink fragment-delay 10
 ppp multilink interleave
 multilink min-links 1 mandatory
 multilink-group 78
 no clns route-cache
 service-policy input QPI_A_256K_25_N_0_40_0_0_7_22
 service-policy output QPO_A_256K_25_0_40_0_0_7_22
!
interface Multilink86
 dampening 30 50 1100 200
 description TAGUATUR  | 4096K | SLS/MULTI/31373 | (SLS/MULTI/31373)
 ip address 200.243.109.85 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 load-interval 30
 no peer neighbor-route
 no cdp enable
 ppp multilink
 no ppp multilink fragmentation
 multilink min-links 1 mandatory
 multilink-group 86
 no clns route-cache
 service-policy input QPI_BBONE_DSCP_V1
!
interface Multilink109
 dampening 30 50 1100 200
 description SUPERMMACIEL  | 512K | SLS/MULTI/34156 | (SLS/MULTI/34156)
 bandwidth 512
 ip vrf forwarding SUPERMMACIEL:3754
 ip address 189.23.73.165 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no peer neighbor-route
 no cdp enable
 ppp multilink
 ppp multilink fragment-delay 10
 ppp multilink interleave
 multilink min-links 1 mandatory
 multilink-group 109
 no clns route-cache
 service-policy input QPI_A_512K_5_N_0_15_0_0_4_75
 service-policy output QPO_A_512K_5_0_15_0_0_4_75
!
interface Multilink114
 dampening 30 50 1100 200
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 shutdown
 no cdp enable
 ppp multilink
 ppp multilink fragment-delay 10
 ppp multilink interleave
 multilink min-links 1 mandatory
 multilink-group 114
 no clns route-cache
 service-policy input QPI_A_512K_31_C_0_21_14_28_4_1
 service-policy output QPO_A_512K_31_0_21_14_28_4_1
 ip header-compression max-header 40
!
interface Multilink115
 dampening 30 50 1100 200
 description ABNAMRO  | 512K | SLS/MULTI/02680 | (SLS/MULTI/02680) | BGP_AS65069
 bandwidth 512
 ip vrf forwarding ABNAMRO:2803
 ip address 189.49.70.5 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 ip tcp header-compression iphc-format
 ip tcp compression-connections 1
 no peer neighbor-route
 no cdp enable
 ppp multilink
 ppp multilink fragment-delay 10
 ppp multilink interleave
 multilink min-links 1 mandatory
 multilink-group 115
 no clns route-cache
 service-policy input QPI_A_512K_31_C_0_21_14_28_4_1
 service-policy output QPO_A_512K_31_0_21_14_28_4_1
 ip rtp header-compression iphc-format
 ip rtp compression-connections 20
 ip header-compression max-header 40
!
interface Multilink1893
 dampening 30 50 1100 200
 description SUPERMMACIEL  | 512k | SLS/MULTI/07768 | (SLS/MULTI/07768)
 bandwidth 512
 ip vrf forwarding SUPERMMACIEL:3754
 ip address 189.52.166.233 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no peer neighbor-route
 no cdp enable
 ppp multilink
 ppp multilink fragment-delay 10
 ppp multilink interleave
 multilink min-links 1 mandatory
 multilink-group 1893
 no clns route-cache
 service-policy input QPI_A_512K_5_N_0_15_0_0_4_75
 service-policy output QPO_A_512K_5_0_15_0_0_4_75
!
interface Multilink1894
 dampening 30 50 1100 200
 description MDIASBRANCO  | 1024K | SLS/MULTI/07596 | (SLS/MULTI/07596)
 bandwidth 1024
 ip vrf forwarding DIASBRANCO:1569
 ip address 200.253.132.193 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no peer neighbor-route
 no cdp enable
 ppp multilink
 ppp multilink interleave
 multilink min-links 1 mandatory
 multilink-group 1894
 no clns route-cache
 service-policy input QPI_A_1024K_15_N_0_12_6_30_1_33
 service-policy output QPO_A_1024K_15_0_12_6_30_1_33
!
interface Multilink1991
 dampening 30 50 1100 200
 description ABNAMRO  | 256K | SLS/MULTI/02681 | (SLS/MULTI/02681) | BGP_AS65069
 bandwidth 256
 ip vrf forwarding ABNAMRO:2803
 ip address 189.42.70.9 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 ip tcp header-compression iphc-format
 ip tcp compression-connections 1
 no peer neighbor-route
 no cdp enable
 ppp multilink
 ppp multilink fragment-delay 10
 ppp multilink interleave
 multilink min-links 1 mandatory
 multilink-group 1991
 no clns route-cache
 service-policy input QPI_A_256K_31_C_0_21_13_26_7_1
 service-policy output QPO_A_256K_31_0_21_13_26_7_1
 ip rtp header-compression iphc-format
 ip header-compression max-header 40
!
interface Multilink2001
 dampening 30 50 1100 200
 description BCOAM  | 512K | CXS/MULTI/24778 | (CXS/MULTI/24778) | BGP_AS65330
 bandwidth 512
 ip vrf forwarding BCOAM:4783
 ip address 189.43.197.253 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 shutdown
 no peer neighbor-route
 no cdp enable
 ppp multilink
 ppp multilink fragment-delay 10
 ppp multilink interleave
 multilink min-links 1 mandatory
 multilink-group 2001
 no clns route-cache
 service-policy input QPI_A_512K_13_N_0_35_25_18_4_4
 service-policy output QPO_A_512K_13_0_35_25_18_4_4
!
interface Multilink2002
 dampening 30 50 1100 200
 description ABNAMRO  | 2048K | SLS/MULTI/29941 | (SLS/MULTI/29941)
 bandwidth 2048
 ip vrf forwarding ABNAMRO:2803
 ip address 189.43.120.201 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 load-interval 30
 no peer neighbor-route
 no cdp enable
 ppp multilink
 ppp multilink fragment-delay 10
 ppp multilink interleave
 no ppp multilink fragmentation
 multilink min-links 1 mandatory
 multilink-group 2002
 no clns route-cache
 service-policy input QPI_A_2048K_30_N_0_20_2_35_2_10
 service-policy output QPO_A_2048K_30_0_20_2_35_2_10
 ip header-compression max-header 40
!
interface Multilink39926
 dampening 30 50 1100 200
 description BCOAM  | 1024K | PHE/MULTI/25621 | (PHE/MULTI/25621) | BGP_AS65330
 bandwidth 1024
 ip vrf forwarding BCOAM:4783
 ip address 200.209.190.109 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 ip tcp header-compression iphc-format
 ip tcp compression-connections 1
 no peer neighbor-route
 no cdp enable
 ppp multilink
 ppp multilink fragment-delay 10
 ppp multilink interleave
 multilink min-links 1 mandatory
 multilink-group 39926
 no clns route-cache
 service-policy input QPI_A_1024K_11_C_0_50_13_13_2_10
 service-policy output QPO_A_1024K_11_0_50_13_13_2_10
 ip rtp header-compression iphc-format
 ip rtp compression-connections 14
 ip header-compression max-header 40
!
interface Multilink39932
 dampening 30 50 1100 200
 description SHVGAS  | 2048K | SLS/MULTI/40789 | (SLS/MULTI/40789)
 bandwidth 2048
 ip vrf forwarding SHV_GAS:152562
 ip address 187.28.240.113 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no peer neighbor-route
 no cdp enable
 ppp multilink
 ppp multilink fragment-delay 10
 no ppp multilink fragmentation
 multilink min-links 1 mandatory
 multilink-group 39932
 no clns route-cache
 service-policy input QPI_A_2048K_0_N_0_26_31_22_1_19
 service-policy output QPO_A_2048K_0_0_26_31_22_1_19
!
interface Multilink39935
 dampening 30 50 1100 200
 description FORTEHOTEIS  | 4096K | SLS/MULTI/41637 | (SLS/MULTI/41637)
 ip address 187.28.122.237 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no peer neighbor-route
 no cdp enable
 ppp multilink
 no ppp multilink fragmentation
 multilink min-links 1 mandatory
 multilink-group 39935
 no clns route-cache
 service-policy input QPI_BBONE_DSCP_V1
!
interface Multilink39955
 dampening 30 50 1100 200
 description OLC_SERVICOS  | 4096K | SLS/MULTI/42572 | (SLS/MULTI/42572)
 ip address 200.172.11.113 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 shutdown
 no peer neighbor-route
 no cdp enable
 ppp multilink
 no ppp multilink fragmentation
 multilink min-links 1 mandatory
 multilink-group 39955
 no clns route-cache
 service-policy input QPI_BBONE_DSCP_V1
!
interface Multilink39960
 dampening 30 50 1100 200
 description IURD  | 512K | PDU/MULTI/42708 | (PDU/MULTI/42708) | BGP_AS64662
 bandwidth 512
 ip vrf forwarding IURD:1265
 ip address 200.172.11.121 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 load-interval 30
 no peer neighbor-route
 no cdp enable
 ppp multilink
 ppp multilink fragment-delay 10
 ppp multilink interleave
 multilink min-links 1 mandatory
 multilink-group 39960
 no clns route-cache
 service-policy input QOS_POLICY_IN_A_13P_78P
 service-policy output QOS_POLICY_OUT_A_13P_78P
!
interface Multilink39967
 dampening 30 50 1100 200
 description SSPF_MA  | 4096K | SLS/MULTI/43424 | (SLS/MULTI/43424)
 ip address 200.172.11.157 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no peer neighbor-route
 no cdp enable
 ppp multilink
 no ppp multilink fragmentation
 multilink min-links 1 mandatory
 multilink-group 39967
 no clns route-cache
 service-policy input QPI_BBONE_DSCP_V1
!
interface Multilink39975
 dampening 30 50 1100 200
 description LOJASRIACHUELO  | 1024K | ITZ/MULTI/44201 | (ITZ/MULTI/44201) | BGP_AS65519
 bandwidth 1024
 ip vrf forwarding LOJASRIACHUELO:4120
 ip address 200.172.11.169 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no peer neighbor-route
 no cdp enable
 ppp multilink
 ppp multilink fragment-delay 10
 ppp multilink interleave
 multilink min-links 1 mandatory
 multilink-group 39975
 no clns route-cache
 service-policy input QPI_A_1024K_13_N_0_16_48_16_2_4
 service-policy output QPO_A_1024K_13_0_16_48_16_2_4
!
interface Multilink39977
 dampening 30 50 1100 200
 description CEFOR SEGURANCA  | 4096K | BBL/MULTI/45011 | (BBL/MULTI/45011)
 ip address 200.172.11.181 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no peer neighbor-route
 no cdp enable
 ppp multilink
 no ppp multilink fragmentation
 multilink min-links 1 mandatory
 multilink-group 39977
 no clns route-cache
 service-policy input QPI_BBONE_DSCP_V1
!
interface Multilink39990
 dampening 30 50 1100 200
 description SUPERMMACIEL  | 512K | PCL/MULTI/33646 | (PCL/MULTI/33646) | BGP_AS65216
 bandwidth 512
 ip vrf forwarding SUPERMMACIEL:3754
 ip address 189.53.11.237 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no peer neighbor-route
 no cdp enable
 ppp multilink
 ppp multilink fragment-delay 10
 ppp multilink interleave
 multilink min-links 1 mandatory
 multilink-group 39990
 no clns route-cache
 service-policy input QPI_A_512K_5_N_0_0_13_0_4_77
 service-policy output QPO_A_512K_5_0_0_13_0_4_77
!
interface Multilink39997
 dampening 30 50 1100 200
 description MONTELLO  | 10240K | SLS/MULTI/46577 | (SLS/MULTI/46577)
 ip address 200.172.12.73 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no peer neighbor-route
 no cdp enable
 ppp multilink
 no ppp multilink fragmentation
 multilink min-links 1 mandatory
 multilink-group 39997
 no clns route-cache
 service-policy input QPI_BBONE_DSCP_V1
!
interface Multilink40002
 dampening 30 50 1100 200
 description EXATAS EMPREENDIMENTOS  | 8192K | CDO/MULTI/47424 | (CDO/MULTI/47424)
 ip address 200.172.11.217 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 load-interval 30
 no peer neighbor-route
 no cdp enable
 ppp multilink
 no ppp multilink fragmentation
 multilink min-links 1 mandatory
 multilink-group 40002
 no clns route-cache
 service-policy input QPI_BBONE_DSCP_V1
!
interface Multilink40033
 dampening 30 50 1100 200
 description MAPA  | 4096K | SLS/MULTI/48831 | (SLS/MULTI/48831) | BGP_AS65000
 ip vrf forwarding MAPA_MPLS:6409
 ip address 200.172.182.105 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 load-interval 30
 no peer neighbor-route
 no cdp enable
 ppp multilink
 no ppp multilink fragmentation
 multilink min-links 1 mandatory
 multilink-group 40033
 no clns route-cache
 service-policy input QPI_A_4096K_25_N_20_30_0_0_1_23
 service-policy output QPO_A_4096K_25_20_30_0_0_1_23
!
interface Multilink399972
 dampening 30 50 1100 200
 description CREFISA  | 512K | SLS/MULTI/50277 | (SLS/MULTI/50277) | BGP_AS65000
 bandwidth 512
 ip vrf forwarding CREFISA:5415
 ip address 200.172.11.193 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no peer neighbor-route
 no cdp enable
 ppp multilink
 ppp multilink fragment-delay 10
 ppp multilink interleave
 multilink min-links 1 mandatory
 multilink-group 399972
 no clns route-cache
 service-policy input QPI_A_512K_50_N_0_10_0_0_4_35
 service-policy output QPO_A_512K_50_0_10_0_0_4_35
!
interface Multilink399977
 dampening 30 50 1100 200
 description BRADEL  | 1024K | SLS/MULTI/52708 | (SLS/MULTI/52708) | BGP_AS65000
 ip vrf forwarding BRADEL:6618
 ip address 201.30.36.37 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no peer neighbor-route
 no cdp enable
 ppp multilink
 ppp multilink fragment-delay 10
 ppp multilink interleave
 multilink min-links 1 mandatory
 multilink-group 399977
 no clns route-cache
 service-policy input QPI_BBONE_EXP_V1
!
interface Multilink399992
 dampening 30 50 1100 200
 description IMIFARMA  | 512K | SLS/MULTI/54984 | (SLS/MULTI/54984) | BGP_AS65000
 bandwidth 512
 ip vrf forwarding IMIFARMA_EXTRANET:155458
 ip address 200.172.11.229 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no peer neighbor-route
 no cdp enable
 ppp multilink
 ppp multilink fragment-delay 10
 ppp multilink interleave
 multilink min-links 1 mandatory
 multilink-group 399992
 no clns route-cache
 service-policy input QPI_A_512K_5_N_0_30_16_4_4_40
 service-policy output QPO_A_512K_5_0_30_16_4_4_40
!
interface Multilink399993
 dampening 30 50 1100 200
 description IMIFARMA  | 512K | SLS/MULTI/54988 | (SLS/MULTI/54988) | BGP_AS65000
 bandwidth 512
 ip vrf forwarding IMIFARMA_EXTRANET:155458
 ip address 201.30.36.57 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no peer neighbor-route
 no cdp enable
 ppp multilink
 ppp multilink fragment-delay 10
 ppp multilink interleave
 multilink min-links 1 mandatory
 multilink-group 399993
 no clns route-cache
 service-policy input QPI_A_512K_5_N_0_30_16_4_4_40
 service-policy output QPO_A_512K_5_0_30_16_4_4_40
!
interface Multilink399995
 dampening 30 50 1100 200
 description IMIFARMA  | 512K | SLS/MULTI/55058 | (SLS/MULTI/55058) | BGP_AS65000
 bandwidth 512
 ip vrf forwarding IMIFARMA_EXTRANET:155458
 ip address 201.30.36.69 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no peer neighbor-route
 no cdp enable
 ppp multilink
 ppp multilink fragment-delay 10
 ppp multilink interleave
 multilink min-links 1 mandatory
 multilink-group 399995
 no clns route-cache
 service-policy input QPI_A_512K_5_N_0_30_16_4_4_40
 service-policy output QPO_A_512K_5_0_30_16_4_4_40
!
interface Multilink399996
 dampening 30 50 1100 200
 description IMIFARMA  | 512K | ITZ/MULTI/55119 | (ITZ/MULTI/55119) | BGP_AS65000
 bandwidth 512
 ip vrf forwarding IMIFARMA_EXTRANET:155458
 ip address 201.30.36.77 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no peer neighbor-route
 no cdp enable
 ppp multilink
 ppp multilink fragment-delay 10
 ppp multilink interleave
 multilink min-links 1 mandatory
 multilink-group 399996
 no clns route-cache
 service-policy input QPI_A_512K_5_N_0_30_16_4_4_40
 service-policy output QPO_A_512K_5_0_30_16_4_4_40
!
interface Multilink399997
 dampening 30 50 1100 200
 description IMIFARMA  | 512K | ITZ/MULTI/55138 | (ITZ/MULTI/55138) | BGP_AS65000
 bandwidth 512
 ip vrf forwarding IMIFARMA_EXTRANET:155458
 ip address 201.30.36.81 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no peer neighbor-route
 no cdp enable
 ppp multilink
 ppp multilink fragment-delay 10
 ppp multilink interleave
 multilink min-links 1 mandatory
 multilink-group 399997
 no clns route-cache
 service-policy input QPI_A_512K_5_N_0_30_16_4_4_40
 service-policy output QPO_A_512K_5_0_30_16_4_4_40
!
interface Multilink399999
 dampening 30 50 1100 200
 description SBF  | 256K | SLS/MULTI/55231 | (SLS/MULTI/55231) | BGP_AS64732
 bandwidth 256
 ip vrf forwarding BYTENNIS:3608
 ip address 187.28.122.105 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no peer neighbor-route
 no cdp enable
 ppp multilink
 ppp multilink fragment-delay 10
 ppp multilink interleave
 multilink min-links 1 mandatory
 multilink-group 399999
 no clns route-cache
 service-policy input QPI_A_256K_38_N_0_29_0_0_7_25
 service-policy output QPO_A_256K_38_0_29_0_0_7_25
!
interface Multilink400000
 dampening 30 50 1100 200
 description RENER  | 512K | SLS/MULTI/55275 | (SLS/MULTI/55275) | BGP_AS65004
 bandwidth 512
 ip vrf forwarding LOJARENNER:1513
 ip address 200.172.11.65 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 shutdown
 no peer neighbor-route
 no cdp enable
 ppp multilink
 ppp multilink fragment-delay 10
 ppp multilink interleave
 multilink min-links 1 mandatory
 multilink-group 400000
 no clns route-cache
 service-policy input QPI_A_512K_13_N_0_46_24_8_4_4
 service-policy output QPO_A_512K_13_0_46_24_8_4_4
!
interface Multilink400001
 dampening 30 50 1100 200
 description HERVAL  | 512K | SLS/MULTI/55763 | (SLS/MULTI/55763) | BGP_AS65000
 bandwidth 512
 ip vrf forwarding HERVAL:4202
 ip address 187.28.240.121 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no peer neighbor-route
 no cdp enable
 ppp multilink
 ppp multilink fragment-delay 10
 ppp multilink interleave
 multilink min-links 1 mandatory
 multilink-group 400001
 no clns route-cache
 service-policy input QPI_A_512K_25_N_0_50_0_0_4_19
 service-policy output QPO_A_512K_25_0_50_0_0_4_19
!
interface Multilink400002
 dampening 30 50 1100 200
 description TOTALDIST  | 4096K | SLS/MULTI/56431 | (SLS/MULTI/56431)
 ip address 189.23.73.25 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no peer neighbor-route
 no cdp enable
 ppp multilink
 no ppp multilink fragmentation
 multilink min-links 1 mandatory
 multilink-group 400002
 no clns route-cache
 service-policy input QPI_BBONE_DSCP_V1
!
interface Multilink400005
 dampening 30 50 1100 200
 description TRANSBRASILIANA  | 512K | SLS/MULTI/56676 | (SLS/MULTI/56676) | BGP_AS65000
 bandwidth 512
 ip vrf forwarding BRASILIANAENC_NOVA:6317
 ip address 189.23.73.189 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no peer neighbor-route
 no cdp enable
 ppp multilink
 ppp multilink fragment-delay 10
 ppp multilink interleave
 multilink min-links 1 mandatory
 multilink-group 400005
 no clns route-cache
 service-policy input QPI_A_512K_13_N_0_50_0_0_4_32
 service-policy output QPO_A_512K_13_0_50_0_0_4_32
!
interface Multilink400006
 dampening 30 50 1100 200
 description INPE  | 4096K | ALN/MULTI/56691 | (ALN/MULTI/56691)
 ip vrf forwarding INPE:5430
 ip address 200.172.182.101 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no peer neighbor-route
 no cdp enable
 ppp multilink
 no ppp multilink fragmentation
 multilink min-links 1 mandatory
 multilink-group 400006
 no clns route-cache
 service-policy input QPI_BBONE_EXP_V1
!
interface Multilink400007
 dampening 30 50 1100 200
 description IMIFARMA  | 512K | SLS/MULTI/56918 | (SLS/MULTI/56918) | BGP_AS65000
 bandwidth 512
 ip vrf forwarding IMIFARMA_EXTRANET:155458
 ip address 187.28.240.145 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no peer neighbor-route
 no cdp enable
 ppp multilink
 ppp multilink fragment-delay 10
 ppp multilink interleave
 multilink min-links 1 mandatory
 multilink-group 400007
 no clns route-cache
 service-policy input QPI_A_512K_5_N_0_30_16_4_4_40
 service-policy output QPO_A_512K_5_0_30_16_4_4_40
!
interface Multilink400008
 dampening 30 50 1100 200
 description CREFISA  | 512K | CXS/MULTI/56926 | (CXS/MULTI/56926) | BGP_AS65001
 ip vrf forwarding CREFISA:5415
 ip address 187.28.122.205 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no peer neighbor-route
 no cdp enable
 ppp multilink
 ppp multilink fragment-delay 10
 ppp multilink interleave
 multilink min-links 1 mandatory
 multilink-group 400008
 no clns route-cache
 service-policy input QPI_BBONE_EXP_V1
!
interface Multilink400010
 dampening 30 50 1100 200
 description CREFISA  | 512K | CDO/MULTI/57097 | (CDO/MULTI/57097) | BGP_AS65000
 bandwidth 512
 ip vrf forwarding CREFISA:5415
 ip address 187.28.240.5 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no peer neighbor-route
 no cdp enable
 ppp multilink
 ppp multilink fragment-delay 10
 ppp multilink interleave
 multilink min-links 1 mandatory
 multilink-group 400010
 no clns route-cache
 service-policy input QPI_A_512K_50_N_0_10_0_0_4_35
 service-policy output QPO_A_512K_50_0_10_0_0_4_35
!
interface Multilink400011
 dampening 30 50 1100 200
 description SERPRO  | 2048K | CXS/MULTI/57122 | (CXS/MULTI/57122)
 bandwidth 2048
 ip vrf forwarding SERPRO_SLS_DNIT_03:5896
 ip address 10.218.15.1 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no peer neighbor-route
 no cdp enable
 ppp multilink
 ppp multilink fragment-delay 10
 no ppp multilink fragmentation
 multilink min-links 1 mandatory
 multilink-group 400011
 no clns route-cache
 service-policy input QPI_SERPRO_2048K_V1
 service-policy output QPO_SERPRO_2048K_V1
!
interface Multilink400012
 dampening 30 50 1100 200
 description ZEDOCA  | 4096K | ZED/MULTI/57142 | (ZED/MULTI/57142)
 ip address 200.172.11.69 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 load-interval 30
 no peer neighbor-route
 no cdp enable
 ppp multilink
 no ppp multilink fragmentation
 multilink min-links 1 mandatory
 multilink-group 400012
 no clns route-cache
 service-policy input QPI_BBONE_DSCP_V1
!
interface Multilink400013
 dampening 30 50 1100 200
 description IMIFARMA  | 512K | SLS/MULTI/57791 | (SLS/MULTI/57791) | BGP_AS65000
 bandwidth 512
 ip vrf forwarding IMIFARMA_EXTRANET:155458
 ip address 187.28.122.189 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no peer neighbor-route
 no cdp enable
 ppp multilink
 ppp multilink fragment-delay 10
 ppp multilink interleave
 multilink min-links 1 mandatory
 multilink-group 400013
 no clns route-cache
 service-policy input QPI_A_512K_5_N_0_30_16_4_4_40
 service-policy output QPO_A_512K_5_0_30_16_4_4_40
!
interface Multilink400014
 dampening 30 50 1100 200
 description IMIFARMA  | 512K | SLS/MULTI/58022 | (SLS/MULTI/58022) | BGP_AS65000
 bandwidth 512
 ip vrf forwarding IMIFARMA_EXTRANET:155458
 ip address 187.28.122.149 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no peer neighbor-route
 no cdp enable
 ppp multilink
 ppp multilink fragment-delay 10
 ppp multilink interleave
 multilink min-links 1 mandatory
 multilink-group 400014
 no clns route-cache
 service-policy input QPI_A_512K_5_N_0_30_16_4_4_40
 service-policy output QPO_A_512K_5_0_30_16_4_4_40
!
interface Multilink400017
 dampening 30 50 1100 200
 description BCOAM  | 512K | VMM/MULTI/25016 | (VMM/MULTI/25016) | BGP_AS65330
 bandwidth 512
 ip vrf forwarding BCOAM:4783
 ip address 189.52.199.161 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no peer neighbor-route
 no cdp enable
 ppp multilink
 ppp multilink fragment-delay 10
 ppp multilink interleave
 multilink min-links 1 mandatory
 multilink-group 400017
 no clns route-cache
 service-policy input QPI_A_512K_11_N_0_33_25_18_4_8
 service-policy output QPO_A_512K_11_0_33_25_18_4_8
!
interface Multilink400018
 dampening 30 50 1100 200
 description BCOAM  | 1024K | ETO/MULTI/24774 | (ETO/MULTI/24774) | BGP_AS65330
 bandwidth 1024
 ip vrf forwarding BCOAM:4783
 ip address 200.249.145.221 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no peer neighbor-route
 no cdp enable
 ppp multilink
 ppp multilink fragment-delay 10
 ppp multilink interleave
 multilink min-links 1 mandatory
 multilink-group 400018
 no clns route-cache
 service-policy input QPI_A_1024K_11_N_0_50_13_13_2_10
 service-policy output QPO_A_1024K_11_0_50_13_13_2_10
!
interface Multilink400021
 dampening 30 50 1100 200
 description SERMA  | 4096K | SLS/MULTI/59457 | (SLS/MULTI/59457) | BGP_AS65188
 ip vrf forwarding TEXACO:4523
 ip address 200.172.11.189 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 load-interval 30
 no peer neighbor-route
 no cdp enable
 ppp multilink
 no ppp multilink fragmentation
 multilink min-links 1 mandatory
 multilink-group 400021
 no clns route-cache
 service-policy input QPI_A_4096K_7_N_36_25_15_0_2_14
 service-policy output QPO_A_4096K_7_36_25_15_0_2_14
!
interface Multilink400022
 dampening 30 50 1100 200
 description SERPRO  | 512K | SLS/MULTI/40138 | (SLS/MULTI/40138) | BGP_AS65037
 bandwidth 512
 ip vrf forwarding SERPRO_SLS_DETRAN_01:5897
 ip address 192.168.1.25 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no peer neighbor-route
 no cdp enable
 ppp multilink
 ppp multilink fragment-delay 10
 ppp multilink interleave
 multilink min-links 1 mandatory
 multilink-group 400022
 no clns route-cache
 service-policy input QPI_SERPRO_512K_V1
 service-policy output QPO_SERPRO_512K_V1
!
interface Multilink400023
 dampening 30 50 1100 200
 description TVMIRANTE  | 4096K | CDO/MULTI/59896 | (CDO/MULTI/59896)
 ip address 187.28.240.57 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no peer neighbor-route
 no cdp enable
 ppp multilink
 no ppp multilink fragmentation
 multilink min-links 1 mandatory
 multilink-group 400023
 no clns route-cache
 service-policy input QPI_BBONE_DSCP_V1
!
interface Multilink400024
 description FCOLIVEIRA  | 4096K | CDO/MULTI/60401 | (CDO/MULTI/60401)
 bandwidth 4096
 ip address 200.253.152.201 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no peer neighbor-route
 no cdp enable
 ppp multilink
 no ppp multilink fragmentation
 multilink min-links 1 mandatory
 multilink-group 400024
 no clns route-cache
 service-policy input QPI_BBONE_DSCP_V1
!
interface Multilink400026
 description ABNAMRO  | 1024K | ITZ/MULTI/40958 | (ITZ/MULTI/40958) | BGP_AS65069
 bandwidth 1024
 ip vrf forwarding ABNAMRO:2803
 ip address 200.172.13.49 255.255.255.252
 no ip directed-broadcast
 no peer neighbor-route
 no cdp enable
 ppp multilink
 ppp multilink fragment-delay 10
 ppp multilink interleave
 multilink-group 400026
 no clns route-cache
 service-policy input QPI_A_1024K_31_N_0_20_13_32_2_1
 service-policy output QPO_A_1024K_31_0_20_13_32_2_1
!
interface Multilink400027
 description SUPERMMACIEL  | 512K | SLS/MULTI/07689 | (SLS/MULTI/07689)
 bandwidth 512
 ip vrf forwarding SUPERMMACIEL:3754
 ip address 189.43.120.189 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no peer neighbor-route
 no cdp enable
 ppp multilink
 ppp multilink fragment-delay 10
 ppp multilink interleave
 multilink min-links 1 mandatory
 multilink-group 400027
 no clns route-cache
 service-policy input QPI_A_512K_10_N_0_13_0_0_4_72
 service-policy output QPO_A_512K_10_0_13_0_0_4_72
!
interface Null0
 no ip unreachables
!
interface Port-channel1
 description Ligacao SW01.SLS | 2000M | SLS/ETHCH/011 | (GigabitEthernet 6/0-6/1 do dist02.sls <--> portas 1/4-1/3 do sw01.sls)
 mtu 9180
 bandwidth 2000000
 ip address 200.244.63.74 255.255.255.224
 no ip redirects
 no ip directed-broadcast
 no ip proxy-arp
 ip pim sparse-mode
 ip ospf cost 10
 ip ospf hello-interval 1
 ip ospf priority 0
 load-interval 30
 mpls label protocol ldp
 tag-switching ip
 channel-group minimum active 1
 no channel-group bandwidth control-propagation
 no clns route-cache
 hold-queue 4000 in
!
interface Port-channel2
 description Ligacao SW02.SLS | 2000M | SLS/ETHCH/012 | (GigabitEthernet 7/0-7/1 do dist02.sls <--> portas 1/4-1/3 do sw02.sls)
 mtu 9180
 bandwidth 2000000
 ip address 200.244.63.106 255.255.255.224
 no ip redirects
 no ip directed-broadcast
 no ip proxy-arp
 ip pim sparse-mode
 ip ospf cost 10
 ip ospf hello-interval 1
 ip ospf priority 0
 load-interval 30
 mpls label protocol ldp
 tag-switching ip
 channel-group minimum active 1
 no channel-group bandwidth control-propagation
 no clns route-cache
 hold-queue 4000 in
!
interface GigabitEthernet0/0/0
 description Link NGN-VipLineIP | SLS US IT SLS US VLI1G 001 | swvli01.sls porta Gi1/45 | OTS 6273/2010
 no ip address
 no ip directed-broadcast
 load-interval 30
 keepalive 1
 no negotiation auto
 no flowcontrol bidirectional
 no cdp enable
 no clns route-cache
!
interface GigabitEthernet0/0/0.2
 description Link NGN | 1000M | VLAN VIPLINEIP-TAG 2
 encapsulation dot1Q 2
 ip vrf forwarding NGN-VIPLINEIP:2628
 ip address 10.254.254.165 255.255.255.252
 no ip redirects
 no ip directed-broadcast
 shutdown
 no cdp enable
 service-policy input MARCA-VIPLINEIP
!
interface GigabitEthernet0/0/0.3
 description Link NGN | 1000M | VLAN GERENCIA-TAG 3
 encapsulation dot1Q 3
 ip vrf forwarding NGN-GER:1416
 ip address 10.253.8.29 255.255.255.252
 no ip redirects
 no ip directed-broadcast
 no cdp enable
 service-policy input MARCA-GER
!
interface GigabitEthernet0/0/0.4
 description Link NGN | 1000M | VLAN VOZ-TAG 4
 encapsulation dot1Q 4
 ip vrf forwarding NGN-VOZ:1417
 ip address 10.255.21.85 255.255.255.252
 no ip redirects
 no ip directed-broadcast
 no cdp enable
 service-policy input MARCA-VOZ
!
interface GigabitEthernet0/0/0.9
 description VIPLINEIP EoMPLS To gacc06.rjo - BRAS01.RJO | 1000M | VLAN 9
 encapsulation dot1Q 9
 no ip directed-broadcast
 xconnect 200.244.41.101 22 encapsulation mpls
!
interface GigabitEthernet0/0/1
 description LIgacao REDBACK SLS | 1G |  SLS US IT SLS US WM 1G 004 | WMRB01.SLS | Porta 4/1 | OTS 22606/2010
 no ip address
 no ip directed-broadcast
 load-interval 30
 no negotiation auto
 no flowcontrol bidirectional
!
interface GigabitEthernet0/0/1.2
 description SUBINTERFACE DE VOIP
 encapsulation dot1Q 2
 ip vrf forwarding WIMAX_EBT:3855
 ip address 172.16.0.85 255.255.255.252
 no ip directed-broadcast
 no cdp enable
 service-policy input MARCA-WIMAX
!
interface GigabitEthernet0/0/1.3
 description SUBINTERFACE DE GERENCIA
 encapsulation dot1Q 3
 ip vrf forwarding NGN-GER:1416
 ip address 10.253.2.181 255.255.255.252
 no ip directed-broadcast
 no cdp enable
 service-policy input MARCA-GER
!
interface GigabitEthernet0/0/1.4
 description SUBINTERFACE DE DADOS
 encapsulation dot1Q 4
 ip address 200.167.148.5 255.255.255.252
 no ip directed-broadcast
 no cdp enable
 service-policy input ZERA-DSCP
!
interface GigabitEthernet0/0/2
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 shutdown
 no negotiation auto
 no flowcontrol bidirectional
 no cdp enable
!
interface GigabitEthernet0/0/3
 description LINK ETH | 1000M | SLSUSDM/SLSUSIT/1G/003 | DM4650-SLSUS-IS02-PLACA GPC PORTA 1
 bandwidth 1000000
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 load-interval 30
 no negotiation auto
 no flowcontrol bidirectional
 no cdp enable
!
interface GigabitEthernet0/0/3.2
 description CIEE  | 2048K | SLS/IP/03700 | (SLS/IP/03700) | BGP_AS65080
 bandwidth 2048
 encapsulation dot1Q 2
 ip vrf forwarding CIEE:3214
 ip address 187.28.122.209 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_A_2048K_3_0_5_3_0_2_86
 service-policy output QDO_A_2048K_3_0_5_3_0_2_86
!
interface GigabitEthernet0/0/3.3
 description LHG_DE_ALBUQUERQUE  | 4096K | PHE/MULTI/59388 | (PHE/MULTI/59388)
 bandwidth 4096
 encapsulation dot1Q 3
 ip address 187.28.122.201 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_4096_V1
 service-policy output QPO_BBONE_4096_V1
!
interface GigabitEthernet0/0/3.5
 description CONSORCIO TEGRAM - ITAQUI  | 4096K | SLS/MULTI/58838 | (SLS/MULTI/58838)
 bandwidth 4096
 encapsulation dot1Q 5
 ip address 187.28.122.9 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_4096_V1
 service-policy output QPO_BBONE_4096_V1
!
interface GigabitEthernet0/0/3.6
 description RIHAPPY  | 1024K | SLS/IP/05198 | (SLS/IP/05198) | BGP_AS65443
 bandwidth 1024
 encapsulation dot1Q 6
 ip vrf forwarding RIHAPPY:4005
 ip address 200.252.158.133 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_A_1024K_13_0_25_25_3_2_31
 service-policy output QDO_A_1024K_13_0_25_25_3_2_31
!
interface GigabitEthernet0/0/3.8
 description OMNILIFE  | 4096K | SLS/MULTI/59039 | (SLS/MULTI/59039)
 bandwidth 4096
 encapsulation dot1Q 8
 ip vrf forwarding OMNILIFE:6246
 ip address 187.28.122.77 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_N_4096_V1
 service-policy output QPO_BBONE_4096_V1
!
interface GigabitEthernet0/0/3.9
 description HSLZ  | 4096K | SLS/PE/005294 | (SLS/PE/005294)
 bandwidth 4096
 encapsulation dot1Q 9
 ip address 200.172.11.225 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_4096_V1
 service-policy output QPO_BBONE_4096_V1
!
interface GigabitEthernet0/0/3.11
 description INFOSUS  | 2048K | ITZ/IP/01213 | (ITZ/IP/01213) | BGP_AS65000
 bandwidth 2048
 encapsulation dot1Q 11
 ip vrf forwarding INFOSUS:4968
 ip address 192.168.105.189 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_A_2048K_13_25_11_0_0_1_1
 service-policy output QDO_A_2048K_13_25_11_0_0_1_1
!
interface GigabitEthernet0/0/3.12
 description UNICRED  | 1024K | SLS/IP/04812 | (SLS/IP/04812)
 bandwidth 1024
 encapsulation dot1Q 12
 ip vrf forwarding UNICRED:1647
 no ip directed-broadcast
 no ip proxy-arp
 shutdown
 no cdp enable
 service-policy input QDI_A_1024K_14_0_6_46_8_2_23
 service-policy output QDO_A_1024K_14_0_6_46_8_2_23
!
interface GigabitEthernet0/0/3.17
 description HSLZ  | 4096K | SJE/PE/000137 | (SJE/PE/000137)
 bandwidth 4096
 encapsulation dot1Q 17
 ip address 200.172.11.233 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_4096_V1
 service-policy output QPO_BBONE_4096_V1
!
interface GigabitEthernet0/0/3.28
 description upgrade para 10mega  GigabitEthernet0/0/3.31
 bandwidth 4096
 encapsulation dot1Q 28
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 shutdown
 no cdp enable
 service-policy input QPI_BBONE_S_4096_V1
 service-policy output QPO_BBONE_4096_V1
!
interface GigabitEthernet0/0/3.29
 description POLYSEL COMERCIO  | 4096K | SLS/PE/005312 | (SLS/PE/005312)
 bandwidth 4096
 encapsulation dot1Q 29
 ip address 189.23.73.45 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_4096_V1
 service-policy output QPO_BBONE_4096_V1
!
interface GigabitEthernet0/0/3.31
 description AURABRASIL  | 4096K | SLS/MULTI/61079 | (SLS/MULTI/61079)
 bandwidth 4096
 encapsulation dot1Q 31
 ip address 200.172.11.249 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_4096_V1
 service-policy output QPO_BBONE_4096_V1
!
interface GigabitEthernet0/0/3.32
 description LANLINK  | 4096K | SLS/MULTI/59157 | (SLS/MULTI/59157)
 bandwidth 4096
 encapsulation dot1Q 32
 ip address 187.28.122.173 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_4096_V1
 service-policy output QPO_BBONE_4096_V1
!
interface GigabitEthernet0/0/3.35
 description SEBRAEMA  | 2048K | PHE/IP/00025 | (PHE/IP/00025) | BGP_AS64617
 bandwidth 2048
 encapsulation dot1Q 35
 ip vrf forwarding SEBRAEMA:4302
 ip address 189.53.246.73 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_A_2048K_6_0_1_0_0_2_90
 service-policy output QDO_A_2048K_6_0_1_0_0_2_90
!
interface GigabitEthernet0/0/3.39
 description B CIRILO ALBINO  | 4096K | PHE/MULTI/60995 | (PHE/MULTI/60995)
 bandwidth 4096
 encapsulation dot1Q 39
 ip address 187.28.122.249 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_4096_V1
 service-policy output QPO_BBONE_4096_V1
!
interface GigabitEthernet0/0/3.40
 description B CIRILO ALBINO  | 4096K | PHE/MULTI/60996 | (PHE/MULTI/60996)
 bandwidth 4096
 encapsulation dot1Q 40
 ip address 189.52.211.105 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_4096_V1
 service-policy output QPO_BBONE_4096_V1
!
interface GigabitEthernet0/0/3.42
 description ALTOMIUDEZAS  | 10240K | ITZ/MULTI/48829 | (ITZ/MULTI/48829)
 bandwidth 10240
 encapsulation dot1Q 42
 ip address 200.172.182.77 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_10240_V1
 service-policy output QPO_BBONE_10240_V1
!
interface GigabitEthernet0/0/3.45
 description UBEE  | 4096K | PCL/PE/000119 | (PCL/PE/000119) | BGP_AS65000
 bandwidth 4096
 encapsulation dot1Q 45
 ip vrf forwarding UBEE:1597
 ip address 200.172.182.1 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_A_4096K_10_40_25_13_0_1_10
 service-policy output QDO_A_4096K_10_40_25_13_0_1_10
!
interface GigabitEthernet0/0/3.50
 description LASA_NOVA  | 2048K | CDO/IP/00150 | (CDO/IP/00150) | BGP_AS65316
 bandwidth 2048
 encapsulation dot1Q 50
 ip vrf forwarding LASA_NOVA:155000
 ip address 200.172.12.1 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_A_2048K_13_38_23_0_0_2_23
 service-policy output QDO_A_2048K_13_38_23_0_0_2_23
!
interface GigabitEthernet0/0/3.51
 description EMPRESA_BRASILEIRA_GESTAO | 4096K | SLS/PE/005371 | (SLS/PE/005371) | BLK-SAIP-APEDIDO/20170621-0908/POR-DENISVM 
 bandwidth 4096
 encapsulation dot1Q 51
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 shutdown
 no cdp enable
 service-policy input QPI_BBONE_S_4096_V1
 service-policy output QPO_BBONE_4096_V1
!
interface GigabitEthernet0/0/3.52
 description PAVEL  | 800K | SLS/VL/9838783200 | (SLS/VL/9838783200)
 bandwidth 800
 encapsulation dot1Q 52
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 187.28.122.5 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy output QDO_VIPSIP_VOZ_800_V1
!
interface GigabitEthernet0/0/3.54
 description BANCO BRADESCO  | 1500K | SLS/VL/9840094730 | (SLS/VL/9840094730)
 bandwidth 1500
 encapsulation dot1Q 54
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 187.28.122.81 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet0/0/3.55
 description BANCO BRADESCO  | 1500K | SLS/VL/9838789450 | (SLS/VL/9838789450)
 bandwidth 1500
 encapsulation dot1Q 55
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 187.28.122.41 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet0/0/3.56
 description ISS MARINE SERVICES  | 2048K | SLS/IP/05392 | (SLS/IP/05392) | BLK-SAIP-APEDIDO/20161222-88/POR-DENISVM
 bandwidth 2048
 encapsulation dot1Q 56
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 shutdown
 no cdp enable
 service-policy input QPI_BBONE_S_2048_V1
 service-policy output QPO_BBONE_2048_V1
!
interface GigabitEthernet0/0/3.57
 description BNB  | 1024K | PHE/IP/00176 | (PHE/IP/00176) | BGP_AS65000
 bandwidth 1024
 encapsulation dot1Q 57
 ip vrf forwarding BNB:5075
 ip address 187.28.240.153 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_A_1024K_18_0_29_29_0_2_20
 service-policy output QDO_A_1024K_18_0_29_29_0_2_20
!
interface GigabitEthernet0/0/3.81
 description TRANSPETRO  | 1500K | SLS/VL/9832173200 | (SLS/VL/9832173200)
 bandwidth 1500
 encapsulation dot1Q 81
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 187.28.122.85 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet0/0/3.85
 description IPRONTO  | 4096K | SLS/PE/005395 | (SLS/PE/005395)
 bandwidth 4096
 encapsulation dot1Q 85
 ip address 200.172.182.225 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 shutdown
 no cdp enable
 service-policy input QPI_BBONE_S_4096_V1
 service-policy output QPO_BBONE_4096_V1
!
interface GigabitEthernet0/0/3.86
 description CEF  | 1500K | SLS/VL/9831335850 | (SLS/VL/9831335850)
 bandwidth 1500
 encapsulation dot1Q 86
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.172.11.161 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet0/0/3.87
 description LOJASRENNER  | 2048K | SLS/IP/04905 | (SLS/IP/04905) | BGP_AS65004
 bandwidth 2048
 encapsulation dot1Q 87
 ip vrf forwarding LOJARENNER:1513
 ip address 200.172.11.77 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_A_2048K_7_0_49_25_10_2_6
 service-policy output QDO_A_2048K_7_0_49_25_10_2_6
!
interface GigabitEthernet0/0/4
 description LINK ETH | 1G | SLS US IT | 1G | 002 | PB:HFC RTDSLSUS02 G3/10
 no ip address
 no ip directed-broadcast
 load-interval 30
 no negotiation auto
 no flowcontrol bidirectional
!
interface GigabitEthernet0/0/4.613
 description IMIFARMA  | 512K | SLS/IP/05690 | (SLS/IP/05690) | BGP_AS65000
 bandwidth 512
 encapsulation dot1Q 613
 ip vrf forwarding IMIFARMA_EXTRANET:155458
 ip address 187.28.240.133 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_N_512_V1
 service-policy output QPO_BBONE_512_V1
!
interface GigabitEthernet0/0/4.614
 description IMIFARMA  | 512K | SLS/IP/05696 | (SLS/IP/05696) | BGP_AS65000
 bandwidth 512
 encapsulation dot1Q 614
 ip vrf forwarding IMIFARMA_EXTRANET:155458
 ip address 200.172.11.37 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_N_512_V1
 service-policy output QPO_BBONE_512_V1
!
interface GigabitEthernet0/0/4.615
 description IMIFARMA  | 512K | SLS/IP/05695 | (SLS/IP/05695) | BGP_AS65000
 bandwidth 512
 encapsulation dot1Q 615
 ip vrf forwarding IMIFARMA_EXTRANET:155458
 ip address 187.28.240.69 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_A_512K_5_0_30_16_0_4_41
 service-policy output QDO_A_512K_5_0_30_16_0_4_41
!
interface GigabitEthernet0/0/4.616
 description IMIFARMA  | 512K | SLS/IP/05681 | (SLS/IP/05681) | BGP_AS65000
 bandwidth 512
 encapsulation dot1Q 616
 ip vrf forwarding IMIFARMA_EXTRANET:155458
 ip address 187.28.122.21 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_A_512K_5_0_30_16_4_4_40
 service-policy output QDO_A_512K_5_0_30_16_4_4_40
!
interface GigabitEthernet0/0/4.617
 description IMIFARMA  | 512K | SLS/IP/05680 | (SLS/IP/05680) | BGP_AS65000
 bandwidth 512
 encapsulation dot1Q 617
 ip vrf forwarding IMIFARMA_EXTRANET:155458
 ip address 187.28.122.137 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_A_512K_5_0_30_16_4_4_40
 service-policy output QDO_A_512K_5_0_30_16_4_4_40
!
interface GigabitEthernet0/0/4.618
 description IMIFARMA  | 512K | SLS/IP/05660 | (SLS/IP/05660) | BGP_AS65000
 bandwidth 512
 encapsulation dot1Q 618
 ip vrf forwarding IMIFARMA_EXTRANET:155458
 ip address 187.28.122.157 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_A_512K_5_0_30_16_4_4_40
 service-policy output QDO_A_512K_5_0_30_16_4_4_40
!
interface GigabitEthernet0/0/4.619
 description IMIFARMA  | 512K | SLS/IP/05685 | (SLS/IP/05685) | BGP_AS65000
 bandwidth 512
 encapsulation dot1Q 619
 ip vrf forwarding IMIFARMA_EXTRANET:155458
 ip address 187.28.122.169 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_A_512K_5_0_30_16_4_4_40
 service-policy output QDO_A_512K_5_0_30_16_4_4_40
!
interface GigabitEthernet0/0/4.621
 description IMIFARMA  | 512K | SLS/IP/05674 | (SLS/IP/05674) | BGP_AS65000
 bandwidth 512
 encapsulation dot1Q 621
 ip vrf forwarding IMIFARMA_EXTRANET:155458
 ip address 187.28.122.49 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_A_512K_5_0_30_16_4_4_40
 service-policy output QDO_A_512K_5_0_30_16_4_4_40
!
interface GigabitEthernet0/0/4.622
 description ITAU  | 1024K | SLS/IP/05822 | (SLS/IP/05822) | BGP_AS65001
 bandwidth 1024
 encapsulation dot1Q 622
 ip vrf forwarding ITAUNIBANCO:6388
 ip address 187.28.122.193 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_A_1024K_10_24_20_40_0_2_3
 service-policy output QDO_A_1024K_10_24_20_40_0_2_3
!
interface GigabitEthernet0/0/4.623
 description BCOVOTOFILIAL  | 2048K | SLS/IP/05807 | (SLS/IP/05807)
 bandwidth 2048
 encapsulation dot1Q 623
 ip vrf forwarding BCOVOTOFILIAL:6826
 ip address 187.28.122.113 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_A_2048K_16_40_6_0_25_2_10
 service-policy output QDO_A_2048K_16_40_6_0_25_2_10
!
interface GigabitEthernet0/0/4.627
 description LASA_NOVA  | 2048K | SLS/IP/05850 | (SLS/IP/05850)
 bandwidth 2048
 encapsulation dot1Q 627
 ip vrf forwarding LASA_NOVA:155000
 ip address 187.28.122.17 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_A_2048K_13_38_23_0_0_2_23
 service-policy output QDO_A_2048K_13_38_23_0_0_2_23
!
interface GigabitEthernet0/0/4.628
 description IMIFARMA  | 512K | SLS/IP/05855 | (SLS/IP/05855) | BGP_AS65000
 bandwidth 512
 encapsulation dot1Q 628
 ip vrf forwarding IMIFARMA_EXTRANET:155458
 ip address 187.28.122.145 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_N_512_V1
 service-policy output QPO_BBONE_512_V1
!
interface GigabitEthernet0/0/4.629
 description IMIFARMA  | 512K | SLS/IP/05859 | (SLS/IP/05859) | BGP_AS65000
 bandwidth 512
 encapsulation dot1Q 629
 ip vrf forwarding IMIFARMA_EXTRANET:155458
 ip address 187.28.240.97 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_A_512K_5_0_30_16_4_4_40
 service-policy output QDO_A_512K_5_0_30_16_4_4_40
!
interface GigabitEthernet0/0/4.630
 description IMIFARMA  | 512K | SLS/IP/05854 | (SLS/IP/05854) | BGP_AS65000
 bandwidth 512
 encapsulation dot1Q 630
 ip vrf forwarding IMIFARMA_EXTRANET:155458
 ip address 187.28.240.81 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_A_512K_5_0_30_16_4_4_40
 service-policy output QDO_A_512K_5_0_30_16_4_4_40
!
interface GigabitEthernet0/0/4.631
 description IMIFARMA  | 512K | SLS/IP/05860 | (SLS/IP/05860) | BGP_AS65000
 bandwidth 512
 encapsulation dot1Q 631
 ip vrf forwarding IMIFARMA_EXTRANET:155458
 ip address 187.28.240.101 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_A_512K_5_0_30_16_4_4_40
 service-policy output QDO_A_512K_5_0_30_16_4_4_40
!
interface GigabitEthernet0/0/4.4000
 description 10.98.1.009/29_BSDO_SLS  | 128K | SLS/PE/98006 | (SLS/PE/98006)
 bandwidth 128
 encapsulation dot1Q 4000
 ip vrf forwarding TESTE_REDE_ACESSO:6672
 ip address 10.98.1.9 255.255.255.248
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_N_128_V1
 service-policy output QPO_BBONE_128_V1
!
interface Serial0/1/0.1/1/1/1:0
 dampening 30 50 1100 200
 description LASA_IBM  | 2048K | ENLACE FR CLIENTE 
 bandwidth 2048
 no ip address
 no ip directed-broadcast
 encapsulation frame-relay IETF
 no ip mroute-cache
 frame-relay lmi-type cisco
!
interface Serial0/1/0.1/1/1/1:0.1 point-to-point
 description LASA_IBM  | 2048K | SLS/IP/00815 | (SLS/IP/00815) | BLK-SAIP-APEDIDO/2017087-1844/POR-ALUISMA
 bandwidth 2048
 no ip directed-broadcast
 no ip proxy-arp
 no ip mroute-cache
 shutdown
 no cdp enable
 frame-relay interface-dlci 100 IETF   
  class QC_AF_2048K_13_N_37_21_0_0_2_26_0B
!
interface Serial0/1/0.1/1/1/2:0
 dampening 30 50 1100 200
 description CIMED  | 2048K | SLS/IP/05221 | (SLS/IP/05221) | BGP_AS65345
 bandwidth 2048
 ip vrf forwarding CIMED:2611
 ip address 187.29.255.201 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 no cdp enable
 service-policy input QPI_A_2048K_0_N_0_50_0_16_2_31
 service-policy output QPO_A_2048K_0_0_50_0_16_2_31
!
interface Serial0/1/0.1/1/2/1:0
 description LASA_NOVA  | 2048K | ENLACE FR CLIENTE 
 bandwidth 2048
 no ip address
 no ip directed-broadcast
 encapsulation frame-relay IETF
 no ip mroute-cache
 frame-relay lmi-type cisco
!
interface Serial0/1/0.1/1/2/1:0.1 point-to-point
 description LASA_NOVA  | 2048K | PHE/IP/00189 | (PHE/IP/00189)
 bandwidth 2048
 ip vrf forwarding LASA_NOVA:155000
 ip address 201.45.221.189 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no ip mroute-cache
 no cdp enable
 frame-relay interface-dlci 100 IETF   
  class QC_AF_2048K_13_N_38_23_0_0_2_23_0B
!
interface Serial0/1/0.1/1/3/3:0
 dampening 30 50 1100 200
 description POLIPECAS  | 1024K | ENLACE FR CLIENTE 
 bandwidth 1024
 no ip address
 no ip directed-broadcast
 encapsulation frame-relay IETF
 no ip mroute-cache
 frame-relay lmi-type cisco
!
interface Serial0/1/0.1/1/3/3:0.1 point-to-point
 description POLIPECAS | 1024K | SLS/IP/03239 | (SLS/IP/03239) 
 bandwidth 1024
 ip vrf forwarding POLIPECAS:3158
 ip address 187.28.122.57 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no ip mroute-cache
 no cdp enable
 frame-relay interface-dlci 100 CISCO   
  class QC_AF_1024K_13_N_0_25_0_0_2_55_0B
!
interface Serial0/1/0.1/1/5/1:2
 dampening 30 50 1100 200
 description IMIFARMA  | 512K | SLS/IP/05887 | (SLS/IP/05887)
 bandwidth 512
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 ppp chap hostname MULTILINK_400014
 ppp multilink
 multilink-group 400014
!
interface Serial0/1/0.1/1/5/2:1
 dampening 30 50 1100 200
 description LOCALIZA  | 512K | ENLACE FR CLIENTE 
 bandwidth 512
 no ip address
 no ip directed-broadcast
 encapsulation frame-relay IETF
 no ip mroute-cache
 load-interval 30
 frame-relay lmi-type cisco
!
interface Serial0/1/0.1/1/5/2:1.1 point-to-point
 description LOCALIZA  | 512K | ITZ/IP/00023 | (ITZ/IP/00023) | BLK-SAIP-APEDIDO/20171128-929/POR-T3VFFTT
 bandwidth 512
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no ip mroute-cache
 shutdown
 no cdp enable
 frame-relay interface-dlci 100 CISCO   
  class QC_AF_512K_13_N_0_41_18_13_4_10_512B
!
interface Serial0/1/0.1/1/5/2:2
 dampening 30 50 1100 200
 description SUPERMMACIEL  | 512K | PCL/IP/00013 | (PCL/IP/00013) | BLK-SAIP-APEDIDO/2018028-1548/POR-RPA01
 bandwidth 512
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 shutdown
 no peer neighbor-route
 ppp chap hostname MULTILINK_39990
 ppp multilink
 multilink-group 39990
!
interface Serial0/1/0.1/1/5/2:3
 description DPF_MPLS  | 512K | ENLACE FR CLIENTE 
 bandwidth 512
 no ip address
 no ip directed-broadcast
 encapsulation frame-relay IETF
 no ip mroute-cache
 frame-relay lmi-type cisco
!
interface Serial0/1/0.1/1/5/2:3.1 point-to-point
 description DPF_MPLS  | 512K | SLS/IP/05502 | (SLS/IP/05502)
 bandwidth 512
 ip vrf forwarding DPF_MPLS:6606
 ip address 189.23.73.173 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no ip mroute-cache
 no cdp enable
 frame-relay interface-dlci 100 CISCO   
  class QC_AF_512K_10_N_30_35_0_0_4_20_512B
!
interface Serial0/1/0.1/1/5/2:4
 description CREDISHOP  | 256K | CDO/IP/00031 | (CDO/IP/00031)
 bandwidth 256
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 ppp chap hostname MULTILINK_78
 ppp multilink
 multilink-group 78
!
interface Serial0/1/0.1/1/6/1:0
 dampening 30 50 1100 200
 description BNB  | 2048K | BBL/IP/00206 | (BBL/IP/00206) | BGP_AS65000
 bandwidth 2048
 ip vrf forwarding BNB:5075
 ip address 189.53.11.229 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 no cdp enable
 service-policy input QPI_A_2048K_21_N_0_35_20_0_2_21
 service-policy output QPO_A_2048K_21_0_35_20_0_2_21
!
interface Serial0/1/0.1/1/7/3:0
 dampening 30 50 1100 200
 description SESC  | 2048K | SLS/IP/05619 | (SLS/IP/05619)
 bandwidth 2048
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 ppp chap hostname MULTILINK_399982
 ppp multilink
!
interface Serial0/1/0.1/2/1/2:0
 dampening 30 50 1100 200
 description BCOAM  | 1024K | ETO/IP/00030 | (ETO/IP/00030)
 bandwidth 1024
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 ppp chap hostname MULTILINK_400018
 ppp multilink
 multilink-group 400018
!
interface Serial0/1/0.1/2/2/3:0
 dampening 30 50 1100 200
 description MARTINS  | 2048K | SLS/IP/04913 | (SLS/IP/04913)
 bandwidth 2048
 ip vrf forwarding MARTINS:1786
 ip address 200.252.158.73 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 no cdp enable
 service-policy input QPI_BBONE_EXP_V1
!
interface Serial0/1/0.1/2/5/3:0
 dampening 30 50 1100 200
 description SEBRAEMA  | 2048K | SLS/IP/05834 | (SLS/IP/05834) | BGP_AS64617
 bandwidth 2048
 ip vrf forwarding SEBRAEMA:4302
 ip address 187.28.122.153 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 no cdp enable
 service-policy input QPI_A_2048K_5_N_0_0_0_0_2_92
 service-policy output QPO_A_2048K_5_0_0_0_0_2_92
!
interface Serial0/1/0.1/2/7/2:2
 dampening 30 50 1100 200
 description IMIFARMA  | 512K | SLS/IP/05630 | (SLS/IP/05630) | BLK-SAIP-APEDIDO/2017105-1443/POR-T3PER
 bandwidth 512
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 shutdown
 no peer neighbor-route
 ppp chap hostname MULTILINK_399995
 ppp multilink
 multilink-group 399995
!
interface Serial0/1/0.1/2/7/3:0
 dampening 30 50 1100 200
 description BRADEL  | 1024K | SLS/IP/05566 | (SLS/IP/05566)
 bandwidth 1024
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 ppp chap hostname MULTILINK_399977
 ppp multilink
 multilink-group 399977
!
interface Serial0/1/0.1/2/7/3:1
 dampening 30 50 1100 200
 description TRANSBRASILIANA  | 512K | SLS/IP/05829 | (SLS/IP/05829)
 bandwidth 512
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 no cdp enable
 ppp chap hostname MULTILINK_400005
 ppp multilink
 multilink-group 400005
!
interface Serial0/1/0.1/2/7/3:2
 dampening 30 50 1100 200
 description REDE_CORREIOS  | 256K | SLS/IP/06037 | (SLS/IP/06037) | BGP_AS65001
 bandwidth 256
 ip vrf forwarding CORREIOS_2016:7440
 ip address 172.18.69.69 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 no cdp enable
 service-policy input QPI_Correios_256K_PPP_IOS_D_V1
 service-policy output QPO_Correios_256K_PPP_IOS_D_V1
!
interface Serial0/1/0.1/3/1/1:2
 dampening 30 50 1100 200
 description ABNAMRO  | 512K | SLS/IP/00599 | (SLS/IP/00599)
 bandwidth 512
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 ppp chap hostname MULTILINK_65
 ppp multilink
 multilink-group 65
!
interface Serial0/1/0.1/3/1/1:3
 description SERVICO_NACIONAL  | 256K | SLS/IP/06241 | (SLS/IP/06241)
 bandwidth 256
 ip vrf forwarding SENAI_NOVA:7712
 ip address 187.28.122.93 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 no cdp enable
 service-policy input QPI_BBONE_EXP_V1
!
interface Serial0/1/0.1/3/1/3:0
 dampening 30 50 1100 200
 description LOJASRIACHUELO  | 1024K | SLS/IP/03742 | (SLS/IP/03742)
 bandwidth 1024
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 ppp chap hostname MULTILINK_55
 ppp multilink
 multilink-group 55
!
interface Serial0/1/0.1/3/1/3:4
 dampening 30 50 1100 200
 description BBRASIL  | 64K | ENLACE FR CLIENTE 
 bandwidth 64
 no ip address
 no ip directed-broadcast
 encapsulation frame-relay IETF
 no ip mroute-cache
 frame-relay lmi-type cisco
!
interface Serial0/1/0.1/3/1/3:4.1 point-to-point
 description BBRASIL  | 64K | SLS/IP/05047 | (SLS/IP/05047) | BGP_AS65521
 bandwidth 64
 ip vrf forwarding BBRASIL:1588
 ip address 10.7.53.157 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 ip pim sparse-mode
 no ip mroute-cache
 no cdp enable
 frame-relay interface-dlci 100 CISCO   
  class QC_64_0_0_40_8_0_0_0B_A_V1
!
interface Serial0/1/0.1/3/2/1:1
 dampening 30 50 1100 200
 description SBF  | 256K | SLS/IP/03755 | (SLS/IP/03755)
 bandwidth 256
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 ppp chap hostname MULTILINK_54
 ppp multilink
 multilink-group 54
!
interface Serial0/1/0.1/3/2/1:2
 dampening 30 50 1100 200
 description SETMA  | 128K | SLS/IP/00816 | (SLS/IP/00816)
 bandwidth 128
 ip vrf forwarding SET_MA:3377
 ip address 189.53.11.41 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 no cdp enable
 service-policy input QPI_BBONE_EXP_V1
!
interface Serial0/1/0.1/3/2/1:3
 dampening 30 50 1100 200
 description REDE_CORREIOS  | 128K | SJE/IP/00172 | (SJE/IP/00172) | BGP_AS65001
 bandwidth 128
 ip vrf forwarding CORREIOS_2016:7440
 ip address 172.18.170.133 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 no cdp enable
 service-policy input QPI_Correios_128K_PPP_IOS_D_V1
 service-policy output QPO_Correios_128K_PPP_IOS_D_V1
!
interface Serial0/1/0.1/3/2/1:4
 description TECBAN  | 256000K | ENLACE FR CLIENTE 
 bandwidth 256000
 no ip address
 no ip directed-broadcast
 encapsulation frame-relay IETF
 no ip mroute-cache
 frame-relay lmi-type cisco
!
interface Serial0/1/0.1/3/2/1:4.1 point-to-point
 description TECBAN  | 256K | SLS/IP/06306 | (SLS/IP/06306)
 bandwidth 256
 ip vrf forwarding TECBAN:1221
 ip address 187.28.122.117 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no ip mroute-cache
 no cdp enable
 frame-relay interface-dlci 100 IETF   
  class QC_BBONE_N_256_V1
!
interface Serial0/1/0.1/3/2/1:5
 dampening 30 50 1100 200
 description ABNAMRO  | 512K | SLS/IP/00492 | (SLS/IP/00492)
 bandwidth 512
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 ppp chap hostname MULTILINK_115
 ppp multilink
 multilink-group 115
!
interface Serial0/1/0.1/3/2/2:0
 dampening 30 50 1100 200
 description ABNAMRO  | 512K | SLS/IP/00550 | (SLS/IP/00550)
 bandwidth 512
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 ppp chap hostname MULTILINK_64
 ppp multilink
 multilink-group 64
!
interface Serial0/1/0.1/3/2/2:1
 dampening 30 50 1100 200
 description IMIFARMA  | 512K | SLS/IP/05857 | (SLS/IP/05857)
 bandwidth 512
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 ppp chap hostname MULTILINK_400013
 ppp multilink
 multilink-group 400013
!
interface Serial0/1/0.1/3/2/2:2
 dampening 30 50 1100 200
 description REDE_CORREIOS  | 128K | SLS/IP/06131 | (SLS/IP/06131) | BGP_AS65001
 bandwidth 128
 ip vrf forwarding CORREIOS_2016:7440
 ip address 172.18.77.85 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 no cdp enable
 service-policy input QPI_Correios_128K_PPP_IOS_D_V1
 service-policy output QPO_Correios_128K_PPP_IOS_D_V1
!
interface Serial0/1/0.1/3/2/2:3
 dampening 30 50 1100 200
 description SUPERMMACIEL  | 512K | SLS/IP/04571 | (SLS/IP/04571) | BLK-SAIP-APEDIDO/2018028-163/POR-RPA01
 bandwidth 512
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 shutdown
 no peer neighbor-route
 ppp chap hostname MULTILINK_109
 ppp multilink
 multilink-group 109
!
interface Serial0/1/0.1/3/2/3:3
 dampening 30 50 1100 200
 description CREFISA  | 512K | SLS/IP/05229 | (SLS/IP/05229)
 bandwidth 512
 ip vrf forwarding CREFISA:5415
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 ppp chap hostname MULTILINK_399972
 ppp multilink
 multilink-group 399972
!
interface Serial0/1/0.1/3/3/1:2
 dampening 30 50 1100 200
 description BBRASIL  | 512K | ENLACE FR CLIENTE 
 bandwidth 512
 no ip address
 no ip directed-broadcast
 encapsulation frame-relay IETF
 no ip mroute-cache
 frame-relay lmi-type cisco
!
interface Serial0/1/0.1/3/3/1:2.1 point-to-point
 description BBRASIL_NAC  | 512K | SLS/IP/04600 | (SLS/IP/04600) | BGP_AS65321
 bandwidth 512
 ip vrf forwarding BBRASIL_NAC:7399
 ip address 10.66.173.189 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no ip mroute-cache
 no cdp enable
 frame-relay interface-dlci 100 IETF   
  class QC_512K_BBrasil_NAC_GACC_V1
!
interface Serial0/1/0.1/3/3/2:1
 dampening 30 50 1100 200
 description REDE_CORREIOS  | 256K | SLS/IP/06043 | (SLS/IP/06043) | BGP_AS65001
 bandwidth 256
 ip vrf forwarding CORREIOS_2016:7440
 ip address 172.18.72.177 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 no cdp enable
 service-policy input QPI_Correios_256K_PPP_IOS_D_V1
 service-policy output QPO_Correios_256K_PPP_IOS_D_V1
!
interface Serial0/1/0.1/3/3/2:2
 dampening 30 50 1100 200
 description IMIFARMA  | 512K | SLS/IP/05686 | (SLS/IP/05686)
 bandwidth 512
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 ppp chap hostname MULTILINK_399993
 ppp multilink
 multilink-group 399993
!
interface Serial0/1/0.1/3/4/1:0
 dampening 30 50 1100 200
 description ZEDOCA  | 2048K | ZED/IP/00134 | (ZED/IP/00134)
 bandwidth 2048
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 ppp chap hostname MULTILINK_400012
 ppp multilink
 multilink-group 400012
!
interface Serial0/1/0.1/3/5/1:0
 dampening 30 50 1100 200
 description UNIPARSP  | 2048K | SLS/IP/01876 | (SLS/IP/01876) | BGP_AS64860
 bandwidth 2048
 ip vrf forwarding PROV_LIST:4379
 ip address 200.172.11.109 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 no cdp enable
 service-policy input QPI_BBONE_EXP_V1
!
interface Serial0/1/0.1/3/5/2:0
 dampening 30 50 1100 200
 description ZEDOCA  | 2048K | ZED/IP/00135 | (ZED/IP/00135)
 bandwidth 2048
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 ppp chap hostname MULTILINK_400012
 ppp multilink
 multilink-group 400012
!
interface Serial0/1/0.1/3/7/2:0
 dampening 30 50 1100 200
 description LOJASRIACHUELO  | 1024K | SLS/IP/05208 | (SLS/IP/05208) | BGP_AS65519
 bandwidth 1024
 ip vrf forwarding LOJASRIACHUELO:4120
 ip address 189.53.246.201 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 no cdp enable
 service-policy input QPI_A_1024K_13_N_0_16_48_16_2_4
 service-policy output QPO_A_1024K_13_0_16_48_16_2_4
!
interface Serial0/2/0.1/1/1/3:0
 dampening 30 50 1100 200
 description HERVAL  | 512K | SLS/IP/05759 | (SLS/IP/05759)
 bandwidth 512
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 ppp chap hostname MULTILINK_400001
 ppp multilink
 multilink-group 400001
!
interface Serial0/2/0.1/1/1/3:1
 description ABNAMRO  | 256K | SLS/IP/00491 | (SLS/IP/00491)
 bandwidth 256
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 ppp chap hostname MULTILINK_1991
 ppp multilink
 multilink-group 1991
!
interface Serial0/2/0.1/1/1/3:2
 description SETMA  | 256K | SLS/IP/00443 | (SLS/IP/00443)
 bandwidth 256
 ip vrf forwarding SET_MA:3377
 ip address 200.249.145.245 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 no cdp enable
 service-policy input QPI_BBONE_EXP_V1
!
interface Serial0/2/0.1/1/2/2:0
 description LASA_NOVA  | 2048K | ENLACE FR CLIENTE 
 bandwidth 2048
 no ip address
 no ip directed-broadcast
 encapsulation frame-relay IETF
 no ip mroute-cache
 frame-relay lmi-type cisco
!
interface Serial0/2/0.1/1/2/2:0.1 point-to-point
 description LASA_NOVA  | 2048K | SLS/IP/05202 | (SLS/IP/05202)
 bandwidth 2048
 ip vrf forwarding LASA_NOVA:155000
 ip address 200.172.11.213 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no ip mroute-cache
 no cdp enable
 frame-relay interface-dlci 100 IETF   
  class QC_AF_2048K_13_N_38_23_0_0_2_23_0B
!
interface Serial0/2/0.1/1/2/3:0
 dampening 30 50 1100 200
 description CEFOR SEGURANCA  | 2048K | BBL/IP/00193 | (BBL/IP/00193)
 bandwidth 2048
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 ppp chap hostname MULTILINK_39977
 ppp multilink
 multilink-group 39977
!
interface Serial0/2/0.1/1/3/2:0
 dampening 30 50 1100 200
 description LASA_NOVA  | 1024K | ENLACE FR CLIENTE 
 bandwidth 1024
 no ip address
 no ip directed-broadcast
 encapsulation frame-relay IETF
 no ip mroute-cache
 load-interval 30
 frame-relay lmi-type cisco
!
interface Serial0/2/0.1/1/3/2:0.1 point-to-point
 description LASA_NOVA  | 1024K | SLS/IP/05474 | (SLS/IP/05474) | BGP_AS65316
 bandwidth 1024
 ip vrf forwarding LASA_NOVA:155000
 ip address 201.30.36.17 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no ip mroute-cache
 no cdp enable
 frame-relay interface-dlci 100 IETF   
  class QC_AF_1024K_25_N_0_40_0_0_2_31_0B
!
interface Serial0/2/0.1/1/3/3:0
 dampening 30 50 1100 200
 description SEBRAEMA  | 2048K | SLS/IP/03350 | (SLS/IP/03350)
 bandwidth 2048
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 ppp chap hostname MULTILINK_30
 ppp multilink
 multilink-group 30
!
interface Serial0/2/0.1/1/4/1:0
 dampening 30 50 1100 200
 description SEBRAEMA  | 2048K | SLS/IP/03351 | (SLS/IP/03351)
 bandwidth 2048
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 ppp chap hostname MULTILINK_30
 ppp multilink
 multilink-group 30
!
interface Serial0/2/0.1/1/4/2:0
 dampening 30 50 1100 200
 description SEBRAEMA  | 2048K | SLS/IP/03352 | (SLS/IP/03352)
 bandwidth 2048
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 ppp chap hostname MULTILINK_30
 ppp multilink
 multilink-group 30
!
interface Serial0/2/0.1/1/4/3:0
 dampening 30 50 1100 200
 description SEBRAEMA  | 2048K | SLS/IP/03353 | (SLS/IP/03353)
 bandwidth 2048
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 ppp chap hostname MULTILINK_30
 ppp multilink
 multilink-group 30
!
interface Serial0/2/0.1/1/5/1:0
 dampening 30 50 1100 200
 description SEBRAEMA  | 2048K | SLS/IP/03354 | (SLS/IP/03354)
 bandwidth 2048
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 ppp chap hostname MULTILINK_30
 ppp multilink
 multilink-group 30
!
interface Serial0/2/0.1/1/5/2:0
 dampening 30 50 1100 200
 description INPE  | 2048K | ALN/IP/00108 | (ALN/IP/00108)
 bandwidth 2048
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 ppp chap hostname MULTILINK_400006
 ppp multilink
 multilink-group 400006
!
interface Serial0/2/0.1/1/6/2:0
 dampening 30 50 1100 200
 description LOJASRIACHUELO  | 1024K | SLS/IP/01328 | (SLS/IP/01328)
 bandwidth 1024
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 ppp chap hostname MULTILINK_32
 ppp multilink
 multilink-group 32
!
interface Serial0/2/0.1/1/7/2:0
 dampening 30 50 1100 200
 description CEFOR SEGURANCA  | 2048K | BBL/IP/00194 | (BBL/IP/00194)
 bandwidth 2048
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 ppp chap hostname MULTILINK_39977
 ppp multilink
 multilink-group 39977
!
interface Serial0/2/0.1/2/1/2:0
 dampening 30 50 1100 200
 description TOTALDIST  | 2048K | SLS/IP/05818 | (SLS/IP/05818)
 bandwidth 2048
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 ppp chap hostname MULTILINK_400002
 ppp multilink
 multilink-group 400002
!
interface Serial0/2/0.1/2/2/2:0
 dampening 30 50 1100 200
 description MDIASBRANCO  | 1024K | SLS/IP/00147 | (SLS/IP/00147)
 bandwidth 1024
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 ppp chap hostname MULTILINK_1894
 ppp multilink
 multilink-group 1894
!
interface Serial0/2/0.1/2/4/2:0
 dampening 30 50 1100 200
 description FUNASA  | 2048K | SLS/IP/05646 | (SLS/IP/05646) | BGP_AS65305
 bandwidth 2048
 ip vrf forwarding FUNASA:3094
 ip address 189.52.211.69 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 ip pim sparse-mode
 encapsulation ppp
 no peer neighbor-route
 no cdp enable
 service-policy input QPI_A_2048K_0_N_0_47_20_20_2_10
 service-policy output QPO_A_2048K_0_0_47_20_20_2_10
!
interface Serial0/2/0.1/2/4/3:0
 dampening 30 50 1100 200
 description TOTALDIST  | 2048K | SLS/IP/05819 | (SLS/IP/05819)
 bandwidth 2048
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 ppp chap hostname MULTILINK_400002
 ppp multilink
 multilink-group 400002
!
interface Serial0/2/0.1/2/6/1:0
 dampening 30 50 1100 200
 description ELEVADORES  | 1024K | SLS/IP/05941 | (SLS/IP/05941) | BGP_AS65000
 bandwidth 1024
 ip vrf forwarding ELEVADORESATLAS:7186
 ip address 187.28.122.37 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 no cdp enable
 service-policy input QPI_A_1024K_0_N_0_40_30_21_2_6
 service-policy output QPO_A_1024K_0_0_40_30_21_2_6
!
interface Serial0/2/0.1/2/7/2:0
 dampening 30 50 1100 200
 description EXATAS EMPREENDIMENTOS  | 2048K | CDO/IP/00152 | (CDO/IP/00152) | BLK-SAIP-APEDIDO/2017026-99/POR-DENISVM
 bandwidth 2048
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 shutdown
 no peer neighbor-route
 ppp chap hostname MULTILINK_40002
 ppp multilink
 multilink-group 40002
!
interface Serial0/2/0.1/2/7/3:0
 dampening 30 50 1100 200
 description EXATAS EMPREENDIMENTOS  | 2048K | CDO/IP/00153 | (CDO/IP/00153) | BLK-SAIP-APEDIDO/2017026-99/POR-DENISVM
 bandwidth 2048
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 shutdown
 no peer neighbor-route
 ppp chap hostname MULTILINK_40002
 ppp multilink
 multilink-group 40002
!
interface Serial0/2/0.1/3/1/1:0
 dampening 30 50 1100 200
 description LEOMADEIRAS  | 2048K | SLS/IP/02062 | (SLS/IP/02062) | BGP_AS64513
 bandwidth 2048
 ip vrf forwarding LEO:1056
 ip address 200.209.190.141 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 no cdp enable
 service-policy input QPI_A_2048K_8_N_0_50_0_0_2_39
 service-policy output QPO_A_2048K_8_0_50_0_0_2_39
!
interface Serial0/2/0.1/3/3/2:0
 dampening 30 50 1100 200
 description EXATAS EMPREENDIMENTOS  | 2048K | CDO/IP/00154 | (CDO/IP/00154) | BLK-SAIP-APEDIDO/2017026-912/POR-DENISVM
 bandwidth 2048
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 shutdown
 no peer neighbor-route
 ppp chap hostname MULTILINK_40002
 ppp multilink
 multilink-group 40002
!
interface Serial0/2/0.1/3/4/1:0
 dampening 30 50 1100 200
 description EXATAS EMPREENDIMENTOS  | 2048K | CDO/IP/00155 | (CDO/IP/00155) | BLK-SAIP-APEDIDO/2017026-912/POR-DENISVM
 bandwidth 2048
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 shutdown
 no peer neighbor-route
 ppp chap hostname MULTILINK_40002
 ppp multilink
 multilink-group 40002
!
interface Serial0/2/0.1/3/4/2:1
 dampening 30 50 1100 200
 description IMIFARMA  | 512K | ITZ/IP/01267 | (ITZ/IP/01267)
 bandwidth 512
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 ppp chap hostname MULTILINK_399997
 ppp multilink
 multilink-group 399997
!
interface Serial0/2/0.1/3/4/3:0
 dampening 30 50 1100 200
 description INPE  | 2048K | ALN/IP/00109 | (ALN/IP/00109)
 bandwidth 2048
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 ppp chap hostname MULTILINK_400006
 ppp multilink
 multilink-group 400006
!
interface Serial0/2/0.1/3/5/2:0
 dampening 30 50 1100 200
 description INFRAERO  | 2048K | SLS/IP/03048 | (SLS/IP/03048)
 bandwidth 2048
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 ppp chap hostname MULTILINK_43
 ppp multilink
 multilink-group 43
!
interface FastEthernet0/3/0
 description RESERVADO PARA ADM100M | ROGERIO | 521-3113 | 29/07/2013
 no ip address
 no ip directed-broadcast
 load-interval 30
 shutdown
 negotiation auto
 service-policy input QPI_BBONE_S_32000_V1
 service-policy output QPO_BBONE_32000_V1
!
interface FastEthernet0/3/1
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 load-interval 30
 shutdown
 negotiation auto
 no cdp enable
!
interface FastEthernet0/3/2
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 load-interval 30
 shutdown
 no negotiation auto
 no flowcontrol bidirectional
 no cdp enable
 service-policy input QPI_BBONE_S_30000_V1
 service-policy output QPO_BBONE_30000_V1
!
interface FastEthernet0/3/3
 no ip address
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 load-interval 30
 shutdown
 negotiation auto
 no cdp enable
!
interface FastEthernet0/3/4
 no ip address
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 load-interval 30
 shutdown
 negotiation auto
 no cdp enable
!
interface FastEthernet0/3/5
 no ip address
 ip verify unicast source reachable-via any allow-self-ping
 no ip redirects
 no ip directed-broadcast
 no ip proxy-arp
 load-interval 30
 shutdown
 no negotiation auto
 no cdp enable
 service-policy input QPI_BBONE_S_100000_V1
 service-policy output QPO_BBONE_100000_V1
!
interface FastEthernet0/3/6
 description LINK ETH | 100M DATACOM | DM300_SW_SLSUS-DV01
 no ip address
 no ip directed-broadcast
 load-interval 30
 no negotiation auto
!
interface FastEthernet0/3/6.1
 description OPENDOOR  | 960K | SLS/IP/06080 | (SLS/IP/06080)
 bandwidth 960
 encapsulation dot1Q 1
 ip address 189.52.166.125 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.2
 description EVIDENCIA M&D  | 960K | SLS/IP/06077 | (SLS/IP/06077)
 bandwidth 960
 encapsulation dot1Q 2
 ip address 189.52.166.129 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.4
 description UROCENTRO LTD  | 960K | SLS/IP/06093 | (SLS/IP/06093)
 bandwidth 960
 encapsulation dot1Q 4
 ip address 189.52.166.141 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.5
 description INAGRO  | 960K | SLS/IP/06075 | (SLS/IP/06075)
 bandwidth 960
 encapsulation dot1Q 5
 ip address 189.52.166.145 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.10
 description COLEGIOEDUCATOR  | 960K | SLS/IP/06072 | (SLS/IP/06072)
 bandwidth 960
 encapsulation dot1Q 10
 ip address 189.52.166.229 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.11
 description DIMENSAOENGE  | 960K | SLS/IP/06069 | (SLS/IP/06069)
 bandwidth 960
 encapsulation dot1Q 11
 ip address 189.52.166.237 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.18
 description SOGASTRO  | 960K | SLS/IP/00691 | (SLS/IP/00691)
 bandwidth 960
 encapsulation dot1Q 18
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.23
 description REY DO VIDRO  | 960K | SLS/IP/06079 | (SLS/IP/06079)
 bandwidth 960
 encapsulation dot1Q 23
 ip address 189.52.199.61 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.33
 description COPIARCENTER | 960K | SLS/IP/05780 | (SLS/IP/05780)
 bandwidth 960
 encapsulation dot1Q 33
 ip address 189.52.199.109 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.34
 description SOCIEDADE FUNERARIA  | 960K | SLS/IP/06084 | (SLS/IP/06084)
 bandwidth 960
 encapsulation dot1Q 34
 ip address 189.52.211.49 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.39
 description GRAFICA STA CLARA | 960K | SLS/IP/06097 | (SLS/IP/06097)
 bandwidth 960
 encapsulation dot1Q 39
 ip address 189.52.199.129 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.42
 description DIST MAXIMUS | 960K | SLS/IP/06199 | (SLS/IP/06199)
 bandwidth 960
 encapsulation dot1Q 42
 ip address 189.52.199.153 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.53
 description CONSELHO REGIONAL  | 960K | SLS/IP/06090 | (SLS/IP/06090)
 bandwidth 960
 encapsulation dot1Q 53
 ip address 189.52.199.201 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.59
 description DVCONSULTORES  | 960K | SLS/IP/03790 | (SLS/IP/03790)
 bandwidth 960
 encapsulation dot1Q 59
 ip address 189.87.249.141 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.61
 description ISEC  | 960K | SLS/IP/05764 | (SLS/IP/05764)
 bandwidth 960
 encapsulation dot1Q 61
 ip address 189.52.199.173 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.69
 description GRAN CAR  | 960K | SLS/IP/00781 | (SLS/IP/00781)
 bandwidth 960
 encapsulation dot1Q 69
 ip address 189.52.212.21 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.71
 description CENTER CLEAN DISTRIBUIDORA  | 960K | SLS/IP/03872 | (SLS/IP/03872)
 bandwidth 960
 encapsulation dot1Q 71
 ip address 189.52.212.53 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.76
 description SP ALIMENTACAO  | 960K | SLS/IP/03811 | (SLS/IP/03811) | BLK-SAIP-APEDIDO/20180118-1718/POR-T3RCI
 bandwidth 960
 encapsulation dot1Q 76
 no ip directed-broadcast
 no ip proxy-arp
 shutdown
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.80
 description SUPERAVIT  | 960K | SLS/IP/00776 | (SLS/IP/00776)
 bandwidth 960
 encapsulation dot1Q 80
 ip address 189.52.212.5 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.85
 description MACIEIRA  | 960K | SLS/IP/00824 | (SLS/IP/00824)
 bandwidth 960
 encapsulation dot1Q 85
 ip address 189.52.212.85 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.87
 description PNEU FORTE COMERCIO  | 960K | SLS/IP/00826 | (SLS/IP/00826) | BLK-SAIP-APEDIDO/20180313-1146/POR-RPA01
 bandwidth 960
 encapsulation dot1Q 87
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 shutdown
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.94
 description SUPORTWARE  | 960K | SLS/IP/00844 | (SLS/IP/00844)
 bandwidth 960
 encapsulation dot1Q 94
 ip address 189.52.212.125 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.97
 description FORT CENTER  | 960K | SLS/IP/00846 | (SLS/IP/00846)
 bandwidth 960
 encapsulation dot1Q 97
 ip address 189.52.212.137 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.107
 description SOCIEDADE MARANHENSE  | 960K | SLS/IP/00888 | (SLS/IP/00888)
 bandwidth 960
 encapsulation dot1Q 107
 ip address 189.52.212.173 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.111
 description ARQUIDIOCESE  | 960K | SLS/IP/00870 | (SLS/IP/00870)
 bandwidth 960
 encapsulation dot1Q 111
 ip address 189.52.212.181 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.116
 description COMPANHIA  | 960K | SLS/IP/00887 | (SLS/IP/00887)
 bandwidth 960
 encapsulation dot1Q 116
 ip address 189.52.212.209 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.131
 description FERRONORTE  | 960K | SLS/IP/00681 | (SLS/IP/00681)
 bandwidth 960
 encapsulation dot1Q 131
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 shutdown
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.134
 description RADIO EDUCADORA DO MARANHAO  | 960K | SLS/IP/00901 | (SLS/IP/00901)
 bandwidth 960
 encapsulation dot1Q 134
 ip address 189.53.103.21 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.137
 description CACP  | 960K | SLS/IP/00914 | (SLS/IP/00914)
 bandwidth 960
 encapsulation dot1Q 137
 ip address 189.53.103.33 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.138
 description CXA ASSIST  | 960K | SLS/IP/00909 | (SLS/IP/00909)
 bandwidth 960
 encapsulation dot1Q 138
 ip address 189.53.103.37 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.141
 description COOP ECONO CRED  | 960K | SLS/IP/04668 | (SLS/IP/04668)
 bandwidth 960
 encapsulation dot1Q 141
 ip address 189.23.73.229 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.142
 description ESCOLA DOM PEDRO II  | 960K | SLS/IP/00943 | (SLS/IP/00943)
 bandwidth 960
 encapsulation dot1Q 142
 ip address 189.53.103.53 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.146
 description MARKA  | 960K | SLS/IP/03597 | (SLS/IP/03597)
 bandwidth 960
 encapsulation dot1Q 146
 ip address 189.52.212.49 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.150
 description E. N. BELLO FARMACIA  | 960K | SLS/IP/04020 | (SLS/IP/04020)
 bandwidth 960
 encapsulation dot1Q 150
 ip address 187.28.240.165 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.153
 description SCHALOM  | 960K | ITZ/IP/00164 | (ITZ/IP/00164)
 bandwidth 960
 encapsulation dot1Q 153
 ip address 189.53.103.101 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.156
 description EVENKEEL  | 960K | SLS/IP/01242 | (SLS/IP/01242)
 bandwidth 960
 encapsulation dot1Q 156
 ip address 189.53.103.113 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.159
 description J LEITE GALVAO  | 960K | SLS/IP/03599 | (SLS/IP/03599)
 bandwidth 960
 encapsulation dot1Q 159
 ip address 189.53.103.49 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.160
 description SANFERNANDO  | 960K | SLS/IP/01327 | (SLS/IP/01327)
 bandwidth 960
 encapsulation dot1Q 160
 ip address 189.53.103.125 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.162
 description TECNOSISTEM  | 960K | SLS/IP/01358 | (SLS/IP/01358) | BLK-SAIP-APEDIDO/20171121-1316/POR-T3DORT
 bandwidth 960
 encapsulation dot1Q 162
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 shutdown
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.164
 description BRSOLUCOES  | 960K | SLS/IP/00910 | (SLS/IP/00910)
 bandwidth 960
 encapsulation dot1Q 164
 ip address 189.52.212.249 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.165
 description CCTO DESATIVADO.
 encapsulation dot1Q 165
 no ip directed-broadcast
 no ip proxy-arp
 shutdown
 no cdp enable
!
interface FastEthernet0/3/6.166
 description ASSIST.ODONTOLO  | 960K | SLS/IP/01369 | (SLS/IP/01369)
 bandwidth 960
 encapsulation dot1Q 166
 ip address 189.53.103.153 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.168
 description SOCIFAR  | 960K | SLS/IP/00940 | (SLS/IP/00940)
 bandwidth 960
 encapsulation dot1Q 168
 ip address 189.53.103.161 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.171
 description FACIALFARMACIA  | 960K | SLS/IP/01390 | (SLS/IP/01390)
 bandwidth 960
 encapsulation dot1Q 171
 ip address 189.53.103.173 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.173
 description E. N. BELLO FARMACIA  | 960K | SLS/IP/04022 | (SLS/IP/04022)
 bandwidth 960
 encapsulation dot1Q 173
 ip address 187.28.240.169 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.174
 description A. I. O  | 960K | SLS/IP/02153 | (SLS/IP/02153)
 bandwidth 960
 encapsulation dot1Q 174
 ip address 189.52.212.9 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.178
 description RESTAURANTE SAO LUIS  | 960K | SLS/IP/01425 | (SLS/IP/01425)
 bandwidth 960
 encapsulation dot1Q 178
 ip address 189.53.103.201 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.180
 description SINDICATO DOS TRABALHADORES  | 960K | SLS/IP/01426 | (SLS/IP/01426)
 bandwidth 960
 encapsulation dot1Q 180
 ip address 189.53.103.205 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.189
 description MONTEIRO COSMETICOS  | 960K | SLS/IP/01880 | (SLS/IP/01880)
 bandwidth 960
 encapsulation dot1Q 189
 ip address 189.87.249.9 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.194
 description ROQUE MACATRAO  | 960K | SLS/IP/04683 | (SLS/IP/04683)
 bandwidth 960
 encapsulation dot1Q 194
 ip address 200.172.182.21 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.196
 description MULTICLINICAS SANTA EDWIGES  | 960K | SLS/IP/01862 | (SLS/IP/01862)
 bandwidth 960
 encapsulation dot1Q 196
 ip address 189.87.249.41 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.198
 description NACIONAL VEICULOS PECAS  | 960K | BBL/IP/00043 | (BBL/IP/00043)
 bandwidth 960
 encapsulation dot1Q 198
 ip address 189.87.249.53 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.204
 description AG 10 PROPAGANDA  | 960K | SLS/IP/03784 | (SLS/IP/03784)
 bandwidth 960
 encapsulation dot1Q 204
 ip address 189.87.249.137 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.207
 description PROJETA CONSULTORIA E SERVICOS  | 960K | SLS/IP/01877 | (SLS/IP/01877)
 bandwidth 960
 encapsulation dot1Q 207
 ip address 189.87.249.13 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.208
 description MARATRON COMERCIAL DE MAQUINAS  | 960K | SLS/IP/02277 | (SLS/IP/02277)
 bandwidth 960
 encapsulation dot1Q 208
 ip address 189.53.103.13 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.209
 description DIAGNOSTICA  | 960K | SLS/IP/05475 | (SLS/IP/05475)
 bandwidth 960
 encapsulation dot1Q 209
 ip address 189.52.199.125 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.210
 description INSTITUTO CULTURAL BR-EUA  | 960K | SLS/IP/03274 | (SLS/IP/03274)
 bandwidth 960
 encapsulation dot1Q 210
 ip address 189.87.249.97 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.213
 description BR EMPREENDIMENTOS  | 960K | SLS/IP/04671 | (SLS/IP/04671)
 bandwidth 960
 encapsulation dot1Q 213
 ip address 200.172.182.13 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.224
 description APC_CONTRPRAGAS  | 960K | SLS/IP/04023 | (SLS/IP/04023)
 bandwidth 960
 encapsulation dot1Q 224
 ip address 187.28.240.137 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.226
 description ROLIMAO  | 960K | SLS/IP/05645 | (SLS/IP/05645)
 bandwidth 960
 encapsulation dot1Q 226
 ip address 189.52.199.69 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.227
 description R R CAR  | 960K | SLS/IP/03803 | (SLS/IP/03803)
 bandwidth 960
 encapsulation dot1Q 227
 ip address 189.52.166.21 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.228
 description SAO LUIS LIVROS  | 960K | SLS/IP/04056 | (SLS/IP/04056)
 bandwidth 960
 encapsulation dot1Q 228
 ip address 187.28.122.121 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.231
 description FACSANTAFE  | 960K | SLS/IP/05492 | (SLS/IP/05492)
 bandwidth 960
 encapsulation dot1Q 231
 ip address 189.52.199.45 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QOS_DTS_IN_A_960K_32K_0K
 service-policy output QOS_DTS_OUT_A_960K_32K_0K
!
interface FastEthernet0/3/6.233
 description ASSCONT COMERCIO  | 960K | SLS/IP/03826 | (SLS/IP/03826)
 bandwidth 960
 encapsulation dot1Q 233
 ip address 189.87.249.189 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.234
 description CSF  | 960K | SLS/IP/03827 | (SLS/IP/03827)
 bandwidth 960
 encapsulation dot1Q 234
 ip address 189.87.249.193 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.240
 description C C B DE CARVALHO  | 960K | SLS/IP/03844 | (SLS/IP/03844)
 bandwidth 960
 encapsulation dot1Q 240
 ip address 189.87.249.217 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.241
 description GHELLER & BRUM  | 960K | SLS/IP/03842 | (SLS/IP/03842)
 bandwidth 960
 encapsulation dot1Q 241
 ip address 189.87.249.213 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.245
 description INTERNACIONAL  | 960K | SLS/IP/03857 | (SLS/IP/03857)
 bandwidth 960
 encapsulation dot1Q 245
 ip address 189.87.249.249 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.246
 description SAGA  | 960K | SLS/IP/03868 | (SLS/IP/03868)
 bandwidth 960
 encapsulation dot1Q 246
 ip address 189.52.212.217 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.251
 description EXATA  | 960K | SLS/IP/00869 | (SLS/IP/00869)
 bandwidth 960
 encapsulation dot1Q 251
 ip address 189.52.212.185 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.254
 description HARMS CIA  | 960K | SLS/IP/03878 | (SLS/IP/03878)
 bandwidth 960
 encapsulation dot1Q 254
 ip address 189.23.68.13 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.255
 description EMMARKA  | 960K | SLS/IP/04021 | (SLS/IP/04021)
 bandwidth 960
 encapsulation dot1Q 255
 ip address 189.23.68.45 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.257
 description ROAMARIA  | 960K | ITZ/IP/00175 | (ITZ/IP/00175)
 bandwidth 960
 encapsulation dot1Q 257
 ip address 189.52.166.41 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.258
 description ESTACIOMAIA  | 960K | ITZ/IP/00189 | (ITZ/IP/00189)
 bandwidth 960
 encapsulation dot1Q 258
 ip address 189.52.166.45 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.260
 description ATACADAO DOS MEDICAMENTOS  | 960K | ITZ/IP/00632 | (ITZ/IP/00632) | BLK-SAIP-APEDIDO/20171117-1534/POR-T3DORT
 bandwidth 960
 encapsulation dot1Q 260
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 shutdown
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.263
 description CONFERMIL  | 960K | ITZ/IP/00458 | (ITZ/IP/00458)
 bandwidth 960
 encapsulation dot1Q 263
 ip address 189.87.249.93 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.269
 description ANGAR  | 960K | ITZ/IP/00619 | (ITZ/IP/00619)
 bandwidth 960
 encapsulation dot1Q 269
 ip address 189.87.249.145 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.271
 description CLINICA IMPERA  | 960K | ITZ/IP/00621 | (ITZ/IP/00621)
 bandwidth 960
 encapsulation dot1Q 271
 ip address 189.87.249.153 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.274
 description NOVOHOTEL ANAPOLIS  | 960K | ITZ/IP/00629 | (ITZ/IP/00629)
 bandwidth 960
 encapsulation dot1Q 274
 ip address 189.87.249.233 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.277
 description FUJI MOTORS  | 960K | ITZ/IP/00626 | (ITZ/IP/00626)
 bandwidth 960
 encapsulation dot1Q 277
 ip address 189.23.68.29 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.279
 description REVESTIRE_PISOS  | 960K | ITZ/IP/00788 | (ITZ/IP/00788)
 bandwidth 960
 encapsulation dot1Q 279
 ip address 187.28.240.241 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.280
 description M GOMES  | 960K | ITZ/IP/00590 | (ITZ/IP/00590)
 bandwidth 960
 encapsulation dot1Q 280
 ip address 189.52.166.37 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output SHAPE_OUT_960
!
interface FastEthernet0/3/6.282
 description IGREJA EVANGELICA ASSEB | 960K | ITZ/IP/01147 | (ITZ/IP/01147)
 bandwidth 960
 encapsulation dot1Q 282
 ip address 189.53.103.181 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.284
 description JEVA  | 960K | ITZ/IP/00871 | (ITZ/IP/00871)
 bandwidth 960
 encapsulation dot1Q 284
 ip address 189.23.73.37 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.285
 no ip directed-broadcast
 no cdp enable
!
interface FastEthernet0/3/6.287
 description ECONOMICA  | 960K | ITZ/IP/01110 | (ITZ/IP/01110)
 bandwidth 960
 encapsulation dot1Q 287
 ip address 189.23.73.201 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.290
 description CONSELHOREGIONAL  | 960K | ITZ/IP/01131 | (ITZ/IP/01131)
 bandwidth 960
 encapsulation dot1Q 290
 ip address 189.23.73.245 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.291
 description B G VIEIRA  | 960K | ITZ/IP/01144 | (ITZ/IP/01144)
 bandwidth 960
 encapsulation dot1Q 291
 ip address 200.172.182.121 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.292
 description J M A SORVETES  | 960K | ITZ/IP/01132 | (ITZ/IP/01132)
 bandwidth 960
 encapsulation dot1Q 292
 ip address 200.172.182.33 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.295
 description BR ELETRON MARANHAO  | 960K | ITZ/IP/01141 | (ITZ/IP/01141)
 bandwidth 960
 encapsulation dot1Q 295
 ip address 187.28.240.141 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.296
 description ARAUTHO DISTRIBUIDOR  | 960K | ITZ/IP/01145 | (ITZ/IP/01145)
 bandwidth 960
 encapsulation dot1Q 296
 ip address 200.172.182.117 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.298
 description UNB  | 960K | ITZ/IP/01139 | (ITZ/IP/01139)
 bandwidth 960
 encapsulation dot1Q 298
 ip address 200.172.182.125 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.299
 description CARTORIO PRIMEIRO  | 960K | ACD/IP/00152 | (ACD/IP/00152)
 bandwidth 960
 encapsulation dot1Q 299
 ip address 200.172.182.137 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.301
 description A C DE MORAES  | 960K | ITZ/IP/00166 | (ITZ/IP/00166)
 bandwidth 960
 encapsulation dot1Q 301
 ip address 189.53.103.149 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.303
 description MAQUISUL  | 960K | ITZ/IP/00083 | (ITZ/IP/00083)
 bandwidth 960
 encapsulation dot1Q 303
 ip address 200.249.169.101 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.304
 description MEGAINFO  | 960K | ITZ/IP/00167 | (ITZ/IP/00167)
 bandwidth 960
 encapsulation dot1Q 304
 ip address 189.53.103.157 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.310
 description FEIRAO DOS MOVEIS  | 960K | ITZ/IP/00135 | (ITZ/IP/00135)
 bandwidth 960
 encapsulation dot1Q 310
 ip address 189.52.212.41 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.321
 description R & J COMUNICACAO  | 960K | SJE/IP/00112 | (SJE/IP/00112)
 bandwidth 960
 encapsulation dot1Q 321
 ip address 187.28.240.177 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.324
 description CASA DO TAPECEIRO  | 960K | SLS/IP/04050 | (SLS/IP/04050)
 bandwidth 960
 encapsulation dot1Q 324
 ip address 187.28.240.189 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.331
 description OTICA MAIA  | 960K | SLS/IP/04170 | (SLS/IP/04170)
 bandwidth 960
 encapsulation dot1Q 331
 ip address 187.28.240.245 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.334
 description PORTALMAIL INFORMATICA | 960K | CXS/IP/00176 | (CXS/IP/00176)
 bandwidth 960
 encapsulation dot1Q 334
 ip address 189.23.73.13 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.340
 description RESTAURANTE SAO LUIS  | 960K | SLS/IP/01425 | (SLS/IP/01425)
 bandwidth 960
 encapsulation dot1Q 340
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 shutdown
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.341
 description J R MOREIRA & CIA  | 960K | CXS/IP/00183 | (CXS/IP/00183)
 bandwidth 960
 encapsulation dot1Q 341
 ip address 189.23.73.49 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.343
 description JOSE MARIA LAGO PEREIRA  | 960K | CXS/IP/00184 | (CXS/IP/00184)
 bandwidth 960
 encapsulation dot1Q 343
 ip address 189.23.73.57 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.346
 description REI  | 960K | SLS/IP/05577 | (SLS/IP/05577)
 bandwidth 960
 encapsulation dot1Q 346
 ip address 189.52.199.65 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.347
 description C M T M_MEDICINA DO TRABALHO  | 960K | SLS/IP/04181 | (SLS/IP/04181)
 bandwidth 960
 encapsulation dot1Q 347
 ip address 189.23.73.77 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.349
 description DIMENSAOENGE  | 960K | SLS/IP/04164 | (SLS/IP/04164)
 bandwidth 960
 encapsulation dot1Q 349
 ip address 189.23.73.85 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.352
 description JEVA  | 960K | SLS/IP/04186 | (SLS/IP/04186)
 bandwidth 960
 encapsulation dot1Q 352
 ip address 189.23.73.97 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.354
 description DPL CONSTRUCOES  | 960K | SLS/IP/04679 | (SLS/IP/04679)
 bandwidth 960
 encapsulation dot1Q 354
 ip address 189.23.73.253 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.357
 description C. J. C. CARNEIRO  | 960K | PCL/IP/00114 | (PCL/IP/00114)
 bandwidth 960
 encapsulation dot1Q 357
 ip address 189.23.73.109 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.360
 description LOKCENTER  | 960K | SLS/IP/04220 | (SLS/IP/04220)
 bandwidth 960
 encapsulation dot1Q 360
 ip address 189.23.73.117 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.363
 description JEVA  | 960K | SLS/IP/04202 | (SLS/IP/04202)
 bandwidth 960
 encapsulation dot1Q 363
 ip address 189.23.73.129 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.364
 description CAXIAS_VEICULOS  | 960K | CXS/IP/00177 | (CXS/IP/00177)
 bandwidth 960
 encapsulation dot1Q 364
 ip address 189.23.73.133 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.375
 description REAL AMBIENTACOES  | 960K | SLS/IP/00799 | (SLS/IP/00799)
 bandwidth 960
 encapsulation dot1Q 375
 ip address 189.52.212.77 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.377
 description A. D. ARAUJO E CIA  | 960K | SLS/IP/04122 | (SLS/IP/04122)
 bandwidth 960
 encapsulation dot1Q 377
 ip address 189.23.73.193 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.379
 description ENGEFLORA_PROJETOS  | 960K | SLS/IP/06177 | (SLS/IP/06177)
 bandwidth 960
 encapsulation dot1Q 379
 ip address 189.52.199.185 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.380
 description CARAVELAS TURISMO LTDA  | 960K | SLS/IP/01102 | (SLS/IP/01102)
 bandwidth 960
 encapsulation dot1Q 380
 ip address 189.52.199.205 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.381
 description L DE SOUZA RODRIGUES  | 960K | SLS/IP/01424 | (SLS/IP/01424)
 bandwidth 960
 encapsulation dot1Q 381
 ip address 189.53.103.189 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.383
 description TECHNOCOPY EQUIPAMENTOS  | 960K | SLS/IP/04661 | (SLS/IP/04661)
 bandwidth 960
 encapsulation dot1Q 383
 ip address 189.23.73.241 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.385
 description NOVALUZ  | 960K | SLS/IP/05344 | (SLS/IP/05344)
 bandwidth 960
 encapsulation dot1Q 385
 ip address 189.52.199.49 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.386
 description PRONTOSERV  | 960K | SLS/IP/05293 | (SLS/IP/05293) | BLK-SAIP-APEDIDO/20180112-1442/POR-T3RCI
 bandwidth 960
 encapsulation dot1Q 386
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 shutdown
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.395
 description SILVEIRA, ATHIAS  | 960K | SLS/IP/00920 | (SLS/IP/00920)
 bandwidth 960
 encapsulation dot1Q 395
 ip address 189.53.103.9 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.398
 description SOLDAX  | 960K | SLS/IP/04878 | (SLS/IP/04878)
 bandwidth 960
 encapsulation dot1Q 398
 ip address 200.172.11.57 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.406
 description MEDEIROS FRIOS  | 960K | BBL/IP/00176 | (BBL/IP/00176)
 bandwidth 960
 encapsulation dot1Q 406
 ip address 200.172.182.81 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.407
 description JOSE NILTON SILVA  | 960K | SLS/IP/04700 | (SLS/IP/04700)
 bandwidth 960
 encapsulation dot1Q 407
 ip address 200.172.182.85 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.408
 description MM COMERCIAL  | 960K | SLS/IP/04696 | (SLS/IP/04696)
 bandwidth 960
 encapsulation dot1Q 408
 ip address 200.172.182.89 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.409
 description CENTURY COMERCIO  | 960K | SLS/IP/04711 | (SLS/IP/04711)
 bandwidth 960
 encapsulation dot1Q 409
 ip address 200.172.182.93 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.410
 description CAPUCHINHAS  | 960K | CDO/IP/00142 | (CDO/IP/00142)
 bandwidth 960
 encapsulation dot1Q 410
 ip address 200.241.80.137 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.412
 description ETICA  | 960K | SLS/IP/04720 | (SLS/IP/04720)
 bandwidth 960
 encapsulation dot1Q 412
 ip address 189.23.73.125 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.423
 description POUSADA  | 960K | SLS/IP/04730 | (SLS/IP/04730)
 bandwidth 960
 encapsulation dot1Q 423
 ip address 200.172.182.149 255.255.255.252
 ip access-group 2301 in
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.424
 description JF LOPES  | 960K | SLS/IP/04752 | (SLS/IP/04752) | BLK-SAIP-APEDIDO/2018037-1649/POR-RPA01
 bandwidth 960
 encapsulation dot1Q 424
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 shutdown
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.430
 description OTICA MAIA  | 960K | SLS/IP/04701 | (SLS/IP/04701)
 bandwidth 960
 encapsulation dot1Q 430
 ip address 200.172.182.169 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.431
 description BARBOSA ENGENHARIA  | 960K | SLS/IP/04802 | (SLS/IP/04802)
 bandwidth 960
 encapsulation dot1Q 431
 ip address 200.172.11.9 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.433
 description RIVANDA BERENICE  | 960K | SLS/IP/04853 | (SLS/IP/04853)
 bandwidth 960
 encapsulation dot1Q 433
 ip address 200.172.11.45 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output SHAPE_OUT_960
!
interface FastEthernet0/3/6.434
 description DIAGNOSTIMAGEM  | 960K | SLS/IP/04772 | (SLS/IP/04772)
 bandwidth 960
 encapsulation dot1Q 434
 ip address 200.172.182.201 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.438
 description GARCIA  | 960K | SLS/IP/05281 | (SLS/IP/05281)
 bandwidth 960
 encapsulation dot1Q 438
 ip address 189.52.199.229 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.443
 description MULTCOLOR  | 960K | SLS/IP/04775 | (SLS/IP/04775)
 bandwidth 960
 encapsulation dot1Q 443
 ip address 200.172.182.237 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.445
 description THL COMERCIO  | 960K | SLS/IP/04780 | (SLS/IP/04780)
 bandwidth 960
 encapsulation dot1Q 445
 ip address 200.172.182.245 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.447
 description CAPUCHINHAS  | 960K | CXS/IP/00188 | (CXS/IP/00188)
 bandwidth 960
 encapsulation dot1Q 447
 ip address 200.172.182.9 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.450
 description TAGUATUR  | 960K | SJE/IP/00124 | (SJE/IP/00124)
 bandwidth 960
 encapsulation dot1Q 450
 ip address 200.172.11.33 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/6.451
 description OTICA BERNARDES  | 960K | SLS/IP/04847 | (SLS/IP/04847)
 bandwidth 960
 encapsulation dot1Q 451
 ip address 200.172.11.41 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_960_V1
 service-policy output QPO_BBONE_960_V1
!
interface FastEthernet0/3/7
 description Link VESPER | 100M | VLAN XRTTBSC2 | SLS US IT SLS US IT 100M 002
 bandwidth 100000
 ip vrf forwarding VESPER-1XRTT:3997
 ip address 10.185.137.99 255.255.255.240
 no ip directed-broadcast
 load-interval 30
 keepalive 1
 no negotiation auto
 no cdp enable
!
interface Serial1/1/0.1/1/1/1:0
 description SUPERGASBRAS  | 2048K | SLS/IP/04921 | (SLS/IP/04921)
 bandwidth 2048
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 ppp chap hostname MULTILINK_39932
 ppp multilink
 multilink-group 39932
!
interface Serial1/1/0.1/1/2/1:0
 dampening 30 50 1100 200
 description SERPRO  | 2048K | SLS/IP/05965 | (SLS/IP/05965) | BGP_AS65013
 bandwidth 2048
 ip vrf forwarding SERPRO_SLS_DNIT_06:5894
 ip address 10.218.15.25 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no cdp enable
 service-policy input QPI_BBONE_EXP_V1
!
interface Serial1/1/0.1/1/2/3:0
 description SETMA  | 512K | SLS/IP/00445 | (SLS/IP/00445)
 bandwidth 512
 ip vrf forwarding SET_MA:3377
 ip address 189.43.120.85 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 encapsulation ppp
 no peer neighbor-route
 no cdp enable
 service-policy input QPI_BBONE_EXP_V1
!
interface Serial1/1/0.1/1/2/3:1
 description SUPERMMACIEL  | 512K | SLS/IP/00660 | (SLS/IP/00660)
 bandwidth 512
 no ip address
 no ip directed-broadcast
 encapsulation ppp
 no peer neighbor-route
 ppp chap hostname MULTILINK_1893
 ppp multilink
 multilink-group 1893
!
interface Serial1/1/0.1/1/2/3:2
 description SUPERMMACIEL  | 512K | SLS/IP/00659 | (SLS/IP/00659) | BLK-SAIP-APEDIDO/2018028-1457/POR-RPA01
 bandwidth 512
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 shutdown
 no peer neighbor-route
 no cdp enable
 ppp chap hostname MULTILINK_400027
 ppp multilink
 multilink-group 400027
!
interface Serial1/1/0.1/1/4/2:1
 description SERPRO  | 512K | SLS/IP/04939 | (SLS/IP/04939)
 bandwidth 512
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 ppp chap hostname MULTILINK_400022
 ppp multilink
 multilink-group 400022
!
interface Serial1/1/0.1/1/4/2:2
 dampening 30 50 1100 200
 description COBRA  | 128K | ENLACE FR CLIENTE 
 bandwidth 128
 no ip address
 no ip directed-broadcast
 encapsulation frame-relay IETF
 no ip mroute-cache
 load-interval 30
 frame-relay lmi-type cisco
!
interface Serial1/1/0.1/1/4/2:2.1 point-to-point
 description COBRA  | 128K | SLS/IP/00169 | (SLS/IP/00169)
 bandwidth 128
 ip vrf forwarding COBRA:1706
 ip address 200.249.174.105 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no ip mroute-cache
 no cdp enable
 frame-relay interface-dlci 100 CISCO   
  class QOS_CLASS_A_F_128K_64K_32K_66K_128B
!
interface Serial1/1/0.1/1/4/2:3
 dampening 30 50 1100 200
 description STEMAC  | 512K | SLS/IP/00486 | (SLS/IP/00486) | BLK-SAIP-APEDIDO/2016038-152/POR-MMMELLO
 bandwidth 512
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 shutdown
 no peer neighbor-route
 no cdp enable
 service-policy input QPI_A_512K_25_N_0_50_15_0_4_5
 service-policy output QPO_A_512K_25_0_50_15_0_4_5
!
interface Serial1/1/0.1/1/4/2:4
 dampening 30 50 1100 200
 description PGJMARANHAO  | 256K | SLS/IP/06032 | (SLS/IP/06032) | BGP_AS65000
 bandwidth 256
 ip vrf forwarding PGJMARANHAO:7435
 ip address 187.28.122.217 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 no cdp enable
 service-policy input QPI_BBONE_EXP_V1
!
interface Serial1/1/0.1/1/7/2:0
 dampening 30 50 1100 200
 description CBE  | 2048K | CDO/IP/00028 | (CDO/IP/00028) | BLK-SAIP-INADIMP/20180227-452/POR-RPA01
 bandwidth 2048
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 shutdown
 no peer neighbor-route
 ppp chap hostname MULTILINK_18
 ppp multilink
 multilink-group 18
!
interface Serial1/1/0.1/2/1/3:0
 dampening 30 50 1100 200
 description ANVISA  | 1024K | SLS/IP/05592 | (SLS/IP/05592) | BGP_AS65001
 bandwidth 1024
 ip vrf forwarding ANVISA:4356
 ip address 187.28.122.101 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 no cdp enable
 service-policy input QPI_A_1024K_7_N_0_0_0_40_2_50
 service-policy output QPO_A_1024K_7_0_0_0_40_2_50
!
interface Serial1/1/0.1/2/2/1:1
 description CREFISA  | 512K | CXS/IP/00251 | (CXS/IP/00251)
 bandwidth 512
 no ip address
 no ip directed-broadcast
 encapsulation ppp
 no peer neighbor-route
 ppp chap hostname MULTILINK_400008
 ppp multilink
 multilink-group 400008
!
interface Serial1/1/0.1/2/2/1:2
 description BBRASIL  | 64K | ENLACE FR CLIENTE 
 bandwidth 64
 no ip address
 no ip directed-broadcast
 encapsulation frame-relay IETF
 no ip mroute-cache
 frame-relay lmi-type cisco
!
interface Serial1/1/0.1/2/2/1:2.1 point-to-point
 description BBRASIL  | 64K | CXS/IP/00243 | (CXS/IP/00243) | BGP_AS65521
 bandwidth 64
 ip vrf forwarding BBRASIL_PAE:7041
 ip address 10.247.77.201 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 ip pim sparse-mode
 no ip mroute-cache
 no cdp enable
 frame-relay interface-dlci 100 CISCO   
  class QC_64K_BBrasil_PAE_IOS_V1
!
interface Serial1/1/0.1/2/2/1:3
 description CREFISA  | 512K | CDO/IP/00167 | (CDO/IP/00167)
 bandwidth 512
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 ppp chap hostname MULTILINK_400010
 ppp multilink
 multilink-group 400010
!
interface Serial1/1/0.1/2/2/1:4
 description IURD  | 512K | PDU/IP/00112 | (PDU/IP/00112)
 bandwidth 512
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 ppp chap hostname MULTILINK_39960
 ppp multilink
 multilink-group 39960
!
interface Serial1/1/0.1/2/2/1:5
 dampening 30 50 1100 200
 description SBF  | 256K | SLS/IP/05009 | (SLS/IP/05009)
 bandwidth 256
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 ppp chap hostname MULTILINK_399999
 ppp multilink
 multilink-group 399999
!
interface Serial1/1/0.1/2/2/2:1
 dampening 30 50 1100 200
 description TECELAGEMAV  | 512K | BBL/IP/00240 | (BBL/IP/00240) | BGP_AS65000
 bandwidth 512
 ip vrf forwarding TECELAGEMAV:2642
 ip address 200.172.11.145 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 no cdp enable
 service-policy input QPI_BBONE_EXP_V1
!
interface Serial1/1/0.1/2/2/2:3
 dampening 30 50 1100 200
 description IURD  | 512K | ENLACE FR CLIENTE
 bandwidth 512
 no ip address
 no ip directed-broadcast
 encapsulation frame-relay IETF
 load-interval 30
 frame-relay lmi-type cisco
!
interface Serial1/1/0.1/2/2/2:3.1 point-to-point
 description IURD  | 512K | BBL/IP/00044 | (BBL/IP/00044) | BGP_AS64662
 bandwidth 512
 ip vrf forwarding IURD:1265
 ip address 201.73.255.9 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no ip mroute-cache
 no cdp enable
 frame-relay interface-dlci 100 CISCO   
  class QOS_CLASS_A_F_512K_64K_64K_400K_512B
!
interface Serial1/1/0.1/2/2/2:4
 description DALCAR  | 512K | BBL/IP/00185 | (BBL/IP/00185)
 bandwidth 512
 ip vrf forwarding DALCAR:5317
 ip address 189.53.246.9 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 no cdp enable
 service-policy input QPI_BBONE_EXP_V1
!
interface Serial1/1/0.1/2/2/3:1
 description ABNAMRO  | 1024K | ITZ/IP/01166 | (ITZ/IP/01166)
 bandwidth 1024
 no ip address
 no ip directed-broadcast
 encapsulation ppp
 no peer neighbor-route
 ppp chap hostname MULTILINK_400026
 ppp multilink
 multilink-group 400026
!
interface Serial1/1/0.1/2/2/3:2
 description IMIFARMA  | 512K | ITZ/IP/01265 | (ITZ/IP/01265)
 bandwidth 512
 no ip address
 no ip directed-broadcast
 encapsulation ppp
 no peer neighbor-route
 ppp chap hostname MULTILINK_399996
 ppp multilink
 multilink-group 399996
!
interface Serial1/1/0.1/2/2/3:4
 description BBRASIL_PAE  | 64K | ENLACE FR CLIENTE 
 bandwidth 64
 no ip address
 no ip directed-broadcast
 encapsulation frame-relay IETF
 no ip mroute-cache
 frame-relay lmi-type cisco
!
interface Serial1/1/0.1/2/2/3:4.1 point-to-point
 description BBRASIL_PAE  | 64K | ITZ/IP/01175 | (ITZ/IP/01175) | BGP_AS65524
 bandwidth 64
 ip vrf forwarding BBRASIL_PAE:7041
 ip address 10.7.82.29 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 ip pim sparse-mode
 no ip mroute-cache
 no cdp enable
 frame-relay interface-dlci 100 CISCO   
  class QC_64K_BBrasil_PAE_IOS_V1
!
interface Serial1/1/0.1/2/3/1:0
 description SETMA  | 128K | SLS/IP/00427 | (SLS/IP/00427)
 bandwidth 128
 ip vrf forwarding SET_MA:3377
 ip address 189.43.120.77 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 encapsulation ppp
 no peer neighbor-route
 no cdp enable
 service-policy input QPI_BBONE_EXP_V1
!
interface Serial1/1/0.1/2/3/1:1
 description JOLIVAN  | 512K | ENLACE FR CLIENTE 
 bandwidth 512
 no ip address
 no ip directed-broadcast
 encapsulation frame-relay IETF
 frame-relay lmi-type cisco
!
interface Serial1/1/0.1/2/3/1:1.1 point-to-point
 description JOLIVAN  | 512K | SLS/IP/03862 | (SLS/IP/03862)
 bandwidth 512
 ip vrf forwarding JOLIVAN:3739
 ip address 189.23.73.89 255.255.255.252
 no ip directed-broadcast
 no ip mroute-cache
 no cdp enable
 frame-relay interface-dlci 100 CISCO   
  class QC_AF_512K_25_N_0_2_0_0_4_68_512B
!
interface Serial1/1/0.1/2/3/1:2
 dampening 30 50 1100 200
 description REDE_CORREIOS  | 256K | SLS/IP/06044 | (SLS/IP/06044) | BGP_AS65001
 bandwidth 256
 ip vrf forwarding CORREIOS_2016:7440
 ip address 172.18.77.33 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 no cdp enable
 service-policy input QPI_Correios_256K_PPP_IOS_D_V1
 service-policy output QPO_Correios_256K_PPP_IOS_D_V1
!
interface Serial1/1/0.1/2/3/1:3
 dampening 30 50 1100 200
 description IMIFARMA  | 512K | SLS/IP/05837 | (SLS/IP/05837)
 bandwidth 512
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 ppp chap hostname MULTILINK_400007
 ppp multilink
 multilink-group 400007
!
interface Serial1/1/0.1/2/3/1:4
 description TPES  | 512K | ENLACE FR CLIENTE 
 bandwidth 512
 no ip address
 no ip directed-broadcast
 encapsulation frame-relay IETF
 no ip mroute-cache
 frame-relay lmi-type ansi
!
interface Serial1/1/0.1/2/3/1:4.1 point-to-point
 description TPES  | 512K | SLS/IP/05629 | (SLS/IP/05629) | BGP_AS65307
 bandwidth 512
 ip vrf forwarding TPES:6701
 ip address 201.30.37.229 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no ip mroute-cache
 no cdp enable
 frame-relay interface-dlci 100 IETF   
  class QC_BBONE_EXP_V1
!
interface Serial1/1/0.1/2/3/2:3
 dampening 30 50 1100 200
 description IMIFARMA  | 512K | SLS/IP/05683 | (SLS/IP/05683)
 bandwidth 512
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 ppp chap hostname MULTILINK_399992
 ppp multilink
 multilink-group 399992
!
interface Serial1/1/0.1/2/3/2:5
 description ABR ROAMING  | 512K | SLS/IP/04574 | (SLS/IP/04574) | BLK-SAIP-APEDIDO/20180312-1650/POR-RPA01
 bandwidth 512
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 shutdown
 no peer neighbor-route
 no cdp enable
 service-policy input QPI_BBONE_EXP_V1
!
interface Serial1/1/0.1/3/4/2:0
 dampening 30 50 1100 200
 description SHERWIN  | 2048K | SLS/IP/05086 | (SLS/IP/05086)
 bandwidth 2048
 ip address 200.172.11.85 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 no cdp enable
 service-policy input QPI_BBONE_DSCP_V1
!
interface Serial1/1/0.1/3/6/2:0
 dampening 30 50 1100 200
 description ANVS  | 1024K | SLS/IP/01796 | (SLS/IP/01796) | BGP_AS65001
 bandwidth 1024
 ip vrf forwarding ANVISA:4356
 ip address 189.53.246.109 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 no cdp enable
 service-policy input QPI_A_1024K_7_N_0_0_0_40_2_50
 service-policy output QPO_A_1024K_7_0_0_0_40_2_50
!
interface Serial1/1/0.1/3/7/2:1
 dampening 30 50 1100 200
 description CETIP  | 256K | ENLACE FR CLIENTE 
 bandwidth 256
 no ip address
 no ip directed-broadcast
 encapsulation frame-relay IETF
 no ip mroute-cache
 load-interval 30
 frame-relay lmi-type cisco
!
interface Serial1/1/0.1/3/7/2:1.1 point-to-point
 description CETIP  | 256K | SLS/IP/05175 | (SLS/IP/05175) | BGP_AS65000
 bandwidth 256
 ip vrf forwarding CETIP:6164
 ip address 200.252.158.225 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no ip mroute-cache
 no cdp enable
 frame-relay interface-dlci 100 IETF   
  class QC_BBONE_EXP_V1
!
interface Serial1/1/0.1/3/7/2:2
 dampening 30 50 1100 200
 description MOURA  | 256K | ENLACE FR CLIENTE
 bandwidth 256
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation frame-relay IETF
 load-interval 30
 frame-relay lmi-type cisco
!
interface Serial1/1/0.1/3/7/2:2.1 point-to-point
 description MOURA  | 256K | SLS/IP/00253 | (SLS/IP/00253)
 bandwidth 256
 ip vrf forwarding MOURA:1648
 ip address 200.253.132.1 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no ip mroute-cache
 no cdp enable
 frame-relay interface-dlci 100 IETF   
  class QC_AF_256K_10_N_0_60_13_0_7_9_256B
!
interface Serial1/1/0.1/3/7/2:3
 description CREDISHOP  | 256K | SIS/IP/00051 | (SIS/IP/00051)
 bandwidth 256
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 ppp chap hostname MULTILINK_59
 ppp multilink
 multilink-group 59
!
interface Serial1/1/0.1/3/7/2:5
 dampening 30 50 1100 200
 description BCOAM  | 512K | VMM/IP/00003 | (VMM/IP/00003)
 bandwidth 512
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 ppp chap hostname MULTILINK_400017
 ppp multilink
 multilink-group 400017
!
interface Serial1/2/0.1/1/1/3:0
 description FCOLIVEIRA  | 2048K | CDO/IP/00010 | (CDO/IP/00010)
 bandwidth 2048
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 ppp chap hostname MULTILINK_400024
 ppp multilink
 multilink-group 400024
!
interface Serial1/2/0.1/1/2/2:0
 description FCOLIVEIRA  | 2048K | CDO/IP/00173 | (CDO/IP/00173)
 bandwidth 2048
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 ppp chap hostname MULTILINK_400024
 ppp multilink
 multilink-group 400024
!
interface Serial1/2/0.1/1/2/3:0
 dampening 30 50 1100 200
 description SETMA  | 1024K | SLS/IP/00425 | (SLS/IP/00425)
 bandwidth 1024
 ip vrf forwarding SET_MA:3377
 ip address 189.43.120.65 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 no cdp enable
 service-policy input QPI_BBONE_EXP_V1
!
interface Serial1/2/0.1/1/3/1:0
 dampening 30 50 1100 200
 description ABNAMRO  | 2048K | SLS/IP/03824 | (SLS/IP/03824)
 bandwidth 2048
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 ppp chap hostname MULTILINK_2002
 ppp multilink
 multilink-group 2002
!
interface Serial1/2/0.1/1/3/3:0
 description TIETEVEL  | 2048K | SLS/IP/01986 | (SLS/IP/01986)
 bandwidth 2048
 ip vrf forwarding DIST_TIETE_FILIAL:5599
 ip address 200.252.158.29 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 no cdp enable
 service-policy input QPI_A_2048K_5_N_0_1_0_0_2_91
 service-policy output QPO_A_2048K_5_0_1_0_0_2_91
!
interface Serial1/2/0.1/1/4/2:0
 dampening 30 50 1100 200
 description SERPRO  | 2048K | CXS/IP/00199 | (CXS/IP/00199)
 bandwidth 2048
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 ppp chap hostname MULTILINK_400011
 ppp multilink
 multilink-group 400011
!
interface Serial1/2/0.1/1/5/3:0
 dampening 30 50 1100 200
 description MAPA  | 2048K | SLS/IP/05373 | (SLS/IP/05373)
 bandwidth 2048
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 ppp chap hostname MULTILINK_40033
 ppp multilink
 multilink-group 40033
!
interface Serial1/2/0.1/1/6/1:0
 dampening 30 50 1100 200
 description LASA_NOVA  | 1024K | ENLACE FR CLIENTE 
 bandwidth 1024
 no ip address
 no ip directed-broadcast
 encapsulation frame-relay IETF
 no ip mroute-cache
 load-interval 30
 frame-relay lmi-type cisco
!
interface Serial1/2/0.1/1/6/1:0.1 point-to-point
 description LASA_NOVA  | 1024K | SLS/IP/00516 | (SLS/IP/00516) | BLK-SAIP-APEDIDO/2017087-1825/POR-ABIMAJB
 bandwidth 1024
 no ip directed-broadcast
 no ip proxy-arp
 no ip mroute-cache
 shutdown
 no cdp enable
 frame-relay interface-dlci 100 IETF   
  class QC_AF_1024K_25_N_0_40_0_0_2_32_0B
!
interface Serial1/2/0.1/2/1/3:0
 dampening 30 50 1100 200
 description SSPF_MA  | 2048K | SLS/IP/05146 | (SLS/IP/05146)
 bandwidth 2048
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 ppp chap hostname MULTILINK_39967
 ppp multilink
 multilink-group 39967
!
interface Serial1/2/0.1/2/5/1:0
 dampening 30 50 1100 200
 description EMBRACON  | 1024K | ENLACE FR CLIENTE 
 bandwidth 1024
 no ip address
 no ip directed-broadcast
 encapsulation frame-relay IETF
 no ip mroute-cache
 load-interval 30
 frame-relay lmi-type ansi
!
interface Serial1/2/0.1/2/5/1:0.1 point-to-point
 description EMBRACON  | 1024K | SLS/IP/01975 | (SLS/IP/01975) | BLK-SAIP-APEDIDO/20180215-2036/POR-T3CILO
 bandwidth 1024
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no ip mroute-cache
 shutdown
 no cdp enable
 frame-relay interface-dlci 100 IETF   
  class QC_AF_1024K_30_N_20_20_0_0_2_27_0B
!
interface Serial1/2/0.1/2/6/1:0
 dampening 30 50 1100 200
 description CASSI  | 2048K | ENLACE FR CLIENTE 
 bandwidth 2048
 no ip address
 no ip directed-broadcast
 encapsulation frame-relay IETF
 no ip mroute-cache
 load-interval 30
 frame-relay lmi-type cisco
!
interface Serial1/2/0.1/2/6/1:0.1 point-to-point
 description CASSI  | 2048K | SLS/IP/02154 | (SLS/IP/02154)
 bandwidth 2048
 ip vrf forwarding CASSI:3904
 ip address 200.252.158.45 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 ip pim sparse-mode
 no ip mroute-cache
 no cdp enable
 frame-relay interface-dlci 100 CISCO   
  class QC_AF_2048K_0_N_0_20_9_0_6_54_0B
!
interface Serial1/2/0.1/3/1/2:0
 dampening 30 50 1100 200
 description NUMBERONE  | 1024K | SLS/IP/00321 | (SLS/IP/00321)
 bandwidth 1024
 no ip address
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 no cdp enable
 service-policy input QPI_BBONE_DSCP_V1
!
interface Serial1/2/0.1/3/1/3:0
 dampening 30 50 1100 200
 description TST  | 1024K | SLS/IP/01368 | (SLS/IP/01368) | BGP_AS65000
 bandwidth 1024
 ip vrf forwarding TRT_NACIONAL:153663
 ip address 172.30.16.117 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 no cdp enable
 service-policy input QPI_A_1024K_0_N_46_16_11_21_2_3
 service-policy output QPO_A_1024K_0_46_16_11_21_2_3
!
interface Serial1/2/0.1/3/3/1:0
 dampening 30 50 1100 200
 description UNIVERSAL  | 2048K | ENLACE FR CLIENTE 
 bandwidth 2048
 no ip address
 no ip directed-broadcast
 encapsulation frame-relay IETF
 no ip mroute-cache
 load-interval 30
 frame-relay lmi-type cisco
!
interface Serial1/2/0.1/3/3/1:0.1 point-to-point
 description UNIVERSAL  | 2048K | SLS/IP/00153 | (SLS/IP/00153) | BGP_AS64662
 bandwidth 2048
 ip vrf forwarding IURD:1265
 ip address 200.253.132.213 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no ip mroute-cache
 no cdp enable
 frame-relay interface-dlci 100 CISCO   
  class QC_AF_2048K_6_N_0_49_0_0_1_43_0B
!
interface Serial1/2/0.1/3/3/3:0
 dampening 30 50 1100 200
 description MAPA  | 2048K | SLS/IP/05374 | (SLS/IP/05374)
 bandwidth 2048
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 ppp chap hostname MULTILINK_40033
 ppp multilink
 multilink-group 40033
!
interface Serial1/2/0.1/3/4/3:0
 description VOLVO  | 2048K | ENLACE FR CLIENTE 
 bandwidth 2048
 no ip address
 no ip directed-broadcast
 encapsulation frame-relay IETF
 no ip mroute-cache
 frame-relay lmi-type cisco
!
interface Serial1/2/0.1/3/4/3:0.1 point-to-point
 description VOLVO  | 2048K | SLS/IP/04188 | (SLS/IP/04188)
 bandwidth 2048
 ip vrf forwarding VOLVO_APAVEL:3193
 ip address 200.172.11.13 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no ip mroute-cache
 no cdp enable
 frame-relay interface-dlci 100 CISCO   
  class QC_AF_2048K_0_N_23_0_0_0_2_74_0B
!
interface Serial1/2/0.1/3/5/2:0
 dampening 30 50 1100 200
 description CREFISA  | 1024K | ITZ/IP/01179 | (ITZ/IP/01179) | BGP_AS65000
 bandwidth 1024
 ip vrf forwarding CREFISA:5415
 ip address 200.172.11.61 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 no cdp enable
 service-policy input QPI_A_1024K_25_N_0_5_0_0_2_66
 service-policy output QPO_A_1024K_25_0_5_0_0_2_66
!
interface Serial1/2/0.1/3/5/3:0
 dampening 30 50 1100 200
 description BANCO IBI  | 2048K | SLS/IP/05104 | (SLS/IP/05104) | BGP_AS64846
 bandwidth 2048
 ip vrf forwarding IBI_LOJAS:4639
 ip address 200.172.11.129 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 no cdp enable
 service-policy input QPI_A_2048K_2_N_0_0_81_0_2_14
 service-policy output QPO_A_2048K_2_0_0_81_0_2_14
!
interface Serial1/2/0.1/3/6/2:0
 dampening 30 50 1100 200
 description ABNOTECNH  | 2048K | ENLACE FR CLIENTE 
 bandwidth 2048
 no ip address
 no ip directed-broadcast
 encapsulation frame-relay IETF
 no ip mroute-cache
 load-interval 30
 frame-relay lmi-type cisco
!
interface Serial1/2/0.1/3/6/2:0.1 point-to-point
 description ABNOTECNH  | 2048K | SLS/IP/03666 | (SLS/IP/03666) | BGP_AS65000
 bandwidth 2048
 ip vrf forwarding ABNOTECNH:4953
 ip address 201.45.138.13 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no ip mroute-cache
 no cdp enable
 frame-relay interface-dlci 100 IETF   
  class QC_BBONE_EXP_V1
!
interface Serial1/2/0.1/3/7/3:0
 dampening 30 50 1100 200
 description SSPF_MA  | 2048K | SLS/IP/05147 | (SLS/IP/05147)
 bandwidth 2048
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 ppp chap hostname MULTILINK_39967
 ppp multilink
 multilink-group 39967
!
interface Serial1/3/0.1/1/1/3:0
 dampening 30 50 1100 200
 description BCOAM  | 1024K | PHE/IP/00036 | (PHE/IP/00036)
 bandwidth 1024
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 ppp chap hostname MULTILINK_39926
 ppp multilink
 multilink-group 39926
!
interface Serial1/3/0.1/1/3/3:0
 description LINX  | 2048K | SLS/IP/06184 | (SLS/IP/06184)
 bandwidth 2048
 ip vrf forwarding TENDTUDO:1965
 ip address 187.28.240.53 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 no cdp enable
 service-policy input QPI_A_2048K_7_N_0_50_0_0_2_40
 service-policy output QPO_A_2048K_7_0_50_0_0_2_40
!
interface Serial1/3/0.1/1/4/3:0
 description ABNAMRO  | 2048K | SLS/IP/03815 | (SLS/IP/03815)
 bandwidth 2048
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 ppp chap hostname MULTILINK_69
 ppp multilink
 multilink-group 69
!
interface Serial1/3/0.1/1/5/3:0
 description LASA_NOVA  | 2048K | ENLACE FR CLIENTE 
 bandwidth 2048
 no ip address
 no ip directed-broadcast
 encapsulation frame-relay IETF
 no ip mroute-cache
 frame-relay lmi-type cisco
!
interface Serial1/3/0.1/1/5/3:0.1 point-to-point
 description LASA_NOVA  | 2048K | SLS/IP/05666 | (SLS/IP/05666)
 bandwidth 2048
 ip vrf forwarding LASA_NOVA:155000
 ip address 187.28.122.233 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no ip mroute-cache
 no cdp enable
 frame-relay interface-dlci 100 CISCO   
  class QC_AF_2048K_13_N_38_23_0_0_2_23_0B
!
interface Serial1/3/0.1/1/6/1:0
 dampening 30 50 1100 200
 description ABNAMRO  | 1024K | SLS/IP/00545 | (SLS/IP/00545)
 bandwidth 1024
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 ppp chap hostname MULTILINK_71
 ppp multilink
 multilink-group 71
!
interface Serial1/3/0.1/2/3/1:0
 dampening 30 50 1100 200
 description LOJASRIACHUELO  | 1024K | ITZ/IP/01183 | (ITZ/IP/01183)
 bandwidth 1024
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 ppp chap hostname MULTILINK_39975
 ppp multilink
 multilink-group 39975
!
interface Serial1/3/0.1/2/3/2:0
 dampening 30 50 1100 200
 description SERMA  | 2048K | SLS/IP/05219 | (SLS/IP/05219)
 bandwidth 2048
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 ppp chap hostname MULTILINK_400021
 ppp multilink
 multilink-group 400021
!
interface Serial1/3/0.1/2/3/3:0
 dampening 30 50 1100 200
 description SERMA  | 2048K | SLS/IP/06023 | (SLS/IP/06023)
 bandwidth 2048
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 ppp chap hostname MULTILINK_400021
 ppp multilink
 multilink-group 400021
!
interface Serial1/3/0.1/2/6/1:0
 dampening 30 50 1100 200
 description FORTEHOTEIS  | 2048K | SLS/IP/03860 | (SLS/IP/03860)
 bandwidth 2048
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 ppp chap hostname MULTILINK_39935
 ppp multilink
 multilink-group 39935
!
interface Serial1/3/0.1/2/7/2:0
 dampening 30 50 1100 200
 description NORSERGEL  | 1024K | ENLACE FR CLIENTE 
 bandwidth 1024
 no ip address
 no ip directed-broadcast
 encapsulation frame-relay IETF
 no ip mroute-cache
 load-interval 30
 frame-relay lmi-type cisco
!
interface Serial1/3/0.1/2/7/2:0.1 point-to-point
 description NORSERGEL  | 1024K | SLS/IP/03542 | (SLS/IP/03542) | BLK-SAIP-APEDIDO/20161215-1231/POR-DENISVM
 bandwidth 1024
 no ip directed-broadcast
 no ip proxy-arp
 no ip mroute-cache
 shutdown
 snmp trap link-status
 no cdp enable
 frame-relay interface-dlci 100 IETF   
  class QC_AF_1024K_12_N_0_50_13_0_2_22_0B
!
interface Serial1/3/0.1/3/2/1:0
 dampening 30 50 1100 200
 description MPF_NOVA  | 2048K | BBL/IP/00195 | (BBL/IP/00195)
 bandwidth 2048
 ip vrf forwarding MPF_NOVA:6114
 ip address 192.168.34.229 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 ip pim sparse-mode
 encapsulation ppp
 no peer neighbor-route
 no cdp enable
 service-policy input QPI_A_2048K_31_N_19_37_0_0_2_10
 service-policy output QPO_A_2048K_31_19_37_0_0_2_10
!
interface Serial1/3/0.1/3/3/3:0
 dampening 30 50 1100 200
 description BBRASIL_NAC  | 1024K | ENLACE FR CLIENTE 
 bandwidth 1024
 no ip address
 no ip directed-broadcast
 encapsulation frame-relay IETF
 no ip mroute-cache
 frame-relay lmi-type cisco
!
interface Serial1/3/0.1/3/3/3:0.1 point-to-point
 description BBRASIL_NAC  | 1024K | ITZ/IP/01207 | (ITZ/IP/01207) | BGP_AS65321
 bandwidth 1024
 ip vrf forwarding BBRASIL_NAC:7399
 ip address 10.66.227.21 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no ip mroute-cache
 no cdp enable
 frame-relay interface-dlci 100 IETF   
  class QC_1024K_BBrasil_NAC_GACC_V1
!
interface Serial1/3/0.1/3/4/1:0
 dampening 30 50 1100 200
 description TVMIRANTE  | 2048K | CDO/IP/00039 | (CDO/IP/00039) | BLK-SAIP-APEDIDO/20170720-1543/POR-DENISVM
 bandwidth 2048
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 shutdown
 no peer neighbor-route
 no cdp enable
 ppp chap hostname MULTILINK_400023
 ppp multilink
 multilink-group 400023
!
interface Serial1/3/0.1/3/4/2:0
 dampening 30 50 1100 200
 description TVMIRANTE  | 2048K | CDO/IP/00172 | (CDO/IP/00172) | BLK-SAIP-APEDIDO/20180313-945/POR-RPA01
 bandwidth 2048
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 shutdown
 no peer neighbor-route
 no cdp enable
 ppp chap hostname MULTILINK_400023
 ppp multilink
 multilink-group 400023
!
interface Serial1/3/0.1/3/5/1:0
 dampening 30 50 1100 200
 description TAGUATUR  | 2048K | SLS/IP/01793 | (SLS/IP/01793)
 bandwidth 2048
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 ppp chap hostname MULTILINK_86
 ppp multilink
 multilink-group 86
!
interface Serial1/3/0.1/3/5/2:0
 dampening 30 50 1100 200
 description TAGUATUR  | 2048K | SLS/IP/03882 | (SLS/IP/03882)
 bandwidth 2048
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 ppp chap hostname MULTILINK_86
 ppp multilink
 multilink-group 86
!
interface GigabitEthernet3/0/0
 no ip address
 no ip directed-broadcast
 shutdown
 negotiation auto
 no cdp enable
!
interface GigabitEthernet3/0/1
 no ip address
 no ip directed-broadcast
 shutdown
 negotiation auto
 no cdp enable
!
interface GigabitEthernet3/0/2
 no ip address
 no ip directed-broadcast
 shutdown
 negotiation auto
 no cdp enable
!
interface GigabitEthernet3/0/3
 no ip address
 no ip directed-broadcast
 shutdown
 negotiation auto
 no cdp enable
!
interface GigabitEthernet3/0/4
 no ip address
 no ip directed-broadcast
 shutdown
 negotiation auto
 no cdp enable
!
interface GigabitEthernet4/0/0
 no ip address
 no ip directed-broadcast
 shutdown
 negotiation auto
 no cdp enable
!
interface GigabitEthernet4/0/1
 no ip address
 no ip directed-broadcast
 shutdown
 negotiation auto
 no cdp enable
!
interface GigabitEthernet4/0/2
 no ip address
 no ip directed-broadcast
 shutdown
 negotiation auto
 no cdp enable
!
interface GigabitEthernet4/0/3
 no ip address
 no ip directed-broadcast
 shutdown
 negotiation auto
 no cdp enable
!
interface GigabitEthernet4/0/4
 no ip address
 no ip directed-broadcast
 shutdown
 negotiation auto
 no cdp enable
!
interface GigabitEthernet6/0
 description Ligacao SW01.SLS | 1000M | SLS/GIGA/005 | (porta 1/4 do sw01.sls) | (PORT-CHANNEL)
 negotiation auto
 channel-group 1
 no cdp enable
!
interface GigabitEthernet6/1
 description Ligacao SW01.SLS | 1000M | SLS/GIGA/025 | (porta 1/3 do sw01.sls) | (PORT-CHANNEL)
 negotiation auto
 channel-group 1
 no cdp enable
!
interface GigabitEthernet6/2
 description RESERVADO PARA BACKBONE IP | ROGERIO GALEAZZI | 521-3113 | 16/01/2009
 no ip address
 no ip directed-broadcast
 shutdown
 negotiation auto
!
interface GigabitEthernet6/3
 description RESERVADO PARA BACKBONE IP | ROGERIO GALEAZZI | 521-3113 | 16/01/2009
 no ip address
 no ip directed-broadcast
 shutdown
 negotiation auto
!
interface GigabitEthernet7/0
 description Ligacao SW02.SLS | 1000M | SLS/GIGA/006 | (porta 1/4 do sw02.sls)
 negotiation auto
 channel-group 2
 no cdp enable
!
interface GigabitEthernet7/1
 description Ligacao SW02.SLS | 1000M | SLS/GIGA/026 | (porta 1/3 do sw02.sls) | (PORT-CHANNEL)
 negotiation auto
 channel-group 2
 no cdp enable
!
interface GigabitEthernet7/2
 description RESERVADO PARA BACKBONE IP | ROGERIO GALEAZZI | 521-3113 | 16/01/2009
 no ip address
 no ip directed-broadcast
 shutdown
 negotiation auto
!
interface GigabitEthernet7/3
 description RESERVADO PARA BACKBONE IP | ROGERIO GALEAZZI | 521-3113 | 16/01/2009
 no ip address
 no ip directed-broadcast
 shutdown
 negotiation auto
!
interface Ethernet0
 description Ligacao OOB | 10M | (Interface para acesso out-of-band aos gigarouters)
 ip address 10.201.98.29 255.255.255.0
 no ip redirects
 no ip unreachables
 no ip directed-broadcast
 no ip proxy-arp
 ip route-cache cef
 no ip mroute-cache
 no cdp enable
!
interface Ethernet1
 no ip address
 no ip directed-broadcast
 no ip route-cache
 no ip mroute-cache
 shutdown
!
interface Ethernet2
 no ip address
 no ip directed-broadcast
 no ip route-cache
 no ip mroute-cache
 shutdown
!
router ospf 11
 router-id 200.244.41.232
 log-adjacency-changes detail
 nsf cisco
 redistribute maximum-prefix 20000 85 warning-only
 network 200.244.41.0 0.0.0.255 area 98
 network 200.244.63.64 0.0.0.31 area 98
 network 200.244.63.96 0.0.0.31 area 98
!
router ospf 21
 log-adjacency-changes
 mpls ldp sync
 timers throttle spf 50 50 2000
 timers throttle lsa all 0 20 2000
 timers lsa arrival 20
 timers pacing flood 25
 timers pacing retransmission 30
!
router rip
 version 2
 !
 address-family ipv4 vrf VOLVO_APAVEL:3193
 version 2
 redistribute bgp 4230 metric transparent
 network 200.172.11.0
 no auto-summary
 exit-address-family
!
router bgp 4230
 bgp router-id 200.244.41.232
 bgp maxas-limit 100
 bgp always-compare-med
 no bgp default ipv4-unicast
 bgp log-neighbor-changes
 bgp graceful-restart restart-time 120
 bgp graceful-restart stalepath-time 360
 bgp graceful-restart
 bgp nexthop route-map NEGA_ROTA_DEFAULT
 bgp nexthop trigger delay 1
 neighbor IBGP_FULL peer-group
 neighbor IBGP_FULL remote-as 4230
 neighbor IBGP_FULL update-source Loopback0
 neighbor PARTIAL-ROUTING peer-group
 neighbor NO-ROUTES_BGP-LIGHT peer-group
 neighbor DEFAULT-ROUTE_BGP-LIGHT peer-group
 neighbor 10.66.227.22 remote-as 65321
 neighbor 10.66.227.22 description ITZ/IP/01207
 neighbor 10.66.227.22 timers 10 30
 neighbor 10.78.44.122 remote-as 26218
 neighbor 10.78.44.122 description SLS/IP/03794
 neighbor 172.20.64.1 remote-as 65000
 neighbor 172.20.64.1 ebgp-multihop 2
 neighbor 172.20.64.1 update-source Loopback1901
 neighbor 172.20.64.1 timers 20 60
 neighbor 187.28.44.178 remote-as 263889
 neighbor 187.28.44.178 peer-group PARTIAL-ROUTING
 neighbor 187.28.44.178 description SLS/IP/05501  | BGP FULL RSERV01.SDR
 neighbor 187.28.44.178 ebgp-multihop 5
 neighbor 187.28.122.186 remote-as 65000
 neighbor 187.28.122.186 peer-group DEFAULT-ROUTE_BGP-LIGHT
 neighbor 187.28.122.186 description SLS/MULTI/27375
 neighbor 189.23.73.182 remote-as 28573
 neighbor 189.23.73.182 shutdown
 neighbor 200.167.148.6 remote-as 65523
 neighbor 200.167.148.6 peer-group DEFAULT-ROUTE_BGP-LIGHT
 neighbor 200.244.28.30 remote-as 4230
 neighbor 200.244.28.30 description VRR01.FLA
 neighbor 200.244.28.30 update-source Loopback0
 neighbor 200.244.28.32 remote-as 4230
 neighbor 200.244.28.32 description VRR01.SDR
 neighbor 200.244.28.32 update-source Loopback0
 neighbor 200.244.41.104 peer-group IBGP_FULL
 neighbor 200.244.41.104 description IBGP_DIST02.SLS
 neighbor 200.244.41.105 peer-group IBGP_FULL
 neighbor 200.244.41.105 description IBGP_DIST03.SLS
 neighbor 200.253.132.82 remote-as 262456
 neighbor 200.253.132.82 peer-group PARTIAL-ROUTING
 neighbor 200.253.132.82 description SLS/IP/00123
 neighbor 200.253.132.82 ebgp-multihop 3
 !
 address-family ipv4
 redistribute connected route-map CONNECTED
 redistribute static route-map STATIC
 neighbor IBGP_FULL activate
 neighbor IBGP_FULL send-community
 neighbor IBGP_FULL next-hop-self
 neighbor IBGP_FULL route-map RR_IPV4_IN in
 neighbor PARTIAL-ROUTING activate
 neighbor PARTIAL-ROUTING remove-private-as
 neighbor PARTIAL-ROUTING distribute-list 1 in
 neighbor PARTIAL-ROUTING route-map PARTIAL-ROUTING_OUT out
 neighbor NO-ROUTES_BGP-LIGHT activate
 neighbor NO-ROUTES_BGP-LIGHT remove-private-as
 neighbor NO-ROUTES_BGP-LIGHT route-map NO-ROUTES_OUT out
 neighbor DEFAULT-ROUTE_BGP-LIGHT activate
 neighbor DEFAULT-ROUTE_BGP-LIGHT default-originate
 neighbor DEFAULT-ROUTE_BGP-LIGHT remove-private-as
 neighbor DEFAULT-ROUTE_BGP-LIGHT route-map NO-ROUTES_OUT out
 neighbor 187.28.44.178 peer-group PARTIAL-ROUTING
 neighbor 187.28.44.178 route-map TJ_MA_IN in
 neighbor 187.28.44.178 maximum-prefix 200 85
 neighbor 187.28.122.186 peer-group DEFAULT-ROUTE_BGP-LIGHT
 neighbor 187.28.122.186 route-map REPUBLICAONLINE_IN in
 neighbor 189.23.73.182 activate
 neighbor 189.23.73.182 default-originate route-map COND_DEFAULT
 neighbor 189.23.73.182 remove-private-as
 neighbor 189.23.73.182 distribute-list 1 in
 neighbor 189.23.73.182 route-map CLIENTES_IPv4_RANGE_PROPRIO_COMMON_POLICY_IN in
 neighbor 189.23.73.182 route-map NO-ROUTES_OUT out
 neighbor 189.23.73.182 maximum-prefix 200 85
 neighbor 189.23.73.182 filter-list 106 in
 neighbor 200.167.148.6 peer-group DEFAULT-ROUTE_BGP-LIGHT
 neighbor 200.167.148.6 route-map SAM_DADOS_IN in
 neighbor 200.244.41.104 peer-group IBGP_FULL
 neighbor 200.244.41.105 peer-group IBGP_FULL
 neighbor 200.253.132.82 peer-group PARTIAL-ROUTING
 neighbor 200.253.132.82 route-map ELO_IN in
 neighbor 200.253.132.82 maximum-prefix 5000 90
 no auto-summary
 no synchronization
 bgp dampening
 bgp nexthop route-map NEGA_ROTA_DEFAULT
 bgp nexthop trigger delay 1
 exit-address-family
 !
 address-family ipv4 mdt
 neighbor 200.244.28.30 activate
 neighbor 200.244.28.30 send-community both
 neighbor 200.244.28.30 next-hop-self
 neighbor 200.244.28.32 activate
 neighbor 200.244.28.32 send-community both
 neighbor 200.244.28.32 next-hop-self
 bgp dampening
 exit-address-family
 !
 address-family vpnv4
 neighbor 200.244.28.30 activate
 neighbor 200.244.28.30 send-community both
 neighbor 200.244.28.30 next-hop-self
 neighbor 200.244.28.32 activate
 neighbor 200.244.28.32 send-community both
 neighbor 200.244.28.32 next-hop-self
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf WIMAX_EBT:3855
 redistribute connected route-map SBC_CLIENTE
 redistribute static
 neighbor 172.16.0.86 remote-as 65523
 neighbor 172.16.0.86 activate
 neighbor 172.16.0.86 send-community both
 neighbor 172.16.0.86 route-map SBC_CLIENTE in
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf VOLVO_APAVEL:3193
 redistribute connected
 redistribute static
 redistribute rip
 maximum-paths eibgp 2
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf VESPER-1XRTT:3997
 redistribute connected
 redistribute static
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf UNICRED:1647
 redistribute connected
 redistribute static
 maximum-paths eibgp 2
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf UBEE:1597
 redistribute connected
 redistribute static
 neighbor 200.172.182.2 remote-as 65000
 neighbor 200.172.182.2 description PCL/PE/000119
 neighbor 200.172.182.2 activate
 neighbor 200.172.182.2 send-community both
 default-information originate
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf TRT_NACIONAL:153663
 redistribute connected route-map BLOCK-OUT-VRF
 redistribute static
 neighbor 172.20.64.1 remote-as 65000
 neighbor 172.20.64.1 ebgp-multihop 2
 neighbor 172.20.64.1 update-source Loopback1902
 neighbor 172.20.64.1 timers 20 60
 neighbor 172.20.64.1 activate
 neighbor 172.20.64.1 send-community both
 neighbor 172.20.64.1 route-map TST_NACIONAL_BGP_MAP_PRI in
 maximum-paths eibgp 2
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf TRT16:3540
 redistribute connected
 redistribute static
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf TPES:6701
 redistribute connected
 redistribute static
 neighbor 201.30.37.230 remote-as 65307
 neighbor 201.30.37.230 description SLS/IP/05629
 neighbor 201.30.37.230 activate
 neighbor 201.30.37.230 send-community both
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf TEXACO:4523
 redistribute connected
 redistribute static
 neighbor 200.172.11.190 remote-as 65188
 neighbor 200.172.11.190 description SLS/MULTI/59457
 neighbor 200.172.11.190 activate
 neighbor 200.172.11.190 send-community both
 neighbor 200.172.11.190 route-map LATAM_TELMEX_285 in
 maximum-paths eibgp 3
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf TESTE_TMX:200002
 redistribute connected
 redistribute static
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf TESTE_REDE_ACESSO:6672
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf TENDTUDO:1965
 redistribute connected
 redistribute static
 neighbor 187.28.240.54 remote-as 65471
 neighbor 187.28.240.54 description SLS/IP/06184
 neighbor 187.28.240.54 activate
 neighbor 187.28.240.54 send-community both
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf TECELAGEMAV:2642
 redistribute connected
 redistribute static
 neighbor 200.172.11.146 remote-as 65000
 neighbor 200.172.11.146 description BBL/IP/00240
 neighbor 200.172.11.146 activate
 neighbor 200.172.11.146 send-community both
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf TECBAN:1221
 redistribute connected
 redistribute static
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf SUPERMMACIEL:3754
 redistribute connected route-map SBC_CLIENTE
 redistribute static
 neighbor 189.23.73.166 remote-as 65216
 neighbor 189.23.73.166 description SLS/MULTI/34156
 neighbor 189.23.73.166 activate
 neighbor 189.23.73.166 send-community both
 neighbor 189.53.11.238 remote-as 65216
 neighbor 189.53.11.238 description PCL/MULTI/33646
 neighbor 189.53.11.238 activate
 neighbor 189.53.11.238 send-community both
 default-information originate
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf SHV_GAS:152562
 redistribute connected
 redistribute static
 neighbor 187.28.240.114 remote-as 65106
 neighbor 187.28.240.114 description SLS/MULTI/40789
 neighbor 187.28.240.114 activate
 neighbor 187.28.240.114 send-community both
 maximum-paths eibgp 3
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf SET_MA:3377
 redistribute connected
 redistribute static
 default-information originate
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf SERPRO_SLS_DNIT_06:5894
 redistribute connected
 redistribute static
 neighbor 10.218.15.26 remote-as 65013
 neighbor 10.218.15.26 description SLS/IP/05965
 neighbor 10.218.15.26 activate
 neighbor 10.218.15.26 send-community both
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf SERPRO_SLS_DNIT_03:5896
 redistribute connected
 redistribute static
 neighbor 10.218.15.2 remote-as 65013
 neighbor 10.218.15.2 description CXS/MULTI/57122
 neighbor 10.218.15.2 activate
 neighbor 10.218.15.2 send-community both
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf SERPRO_SLS_DETRAN_01:5897
 redistribute connected
 redistribute static
 neighbor 192.168.1.26 remote-as 65037
 neighbor 192.168.1.26 description SLS/MULTI/40138
 neighbor 192.168.1.26 activate
 neighbor 192.168.1.26 send-community both
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf SENAI_NOVA:7712
 redistribute connected
 redistribute static
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf SEBRAEMA:4302
 redistribute connected route-map SBC_CLIENTE
 redistribute static
 neighbor 187.28.122.154 remote-as 64617
 neighbor 187.28.122.154 description SLS/IP/05834
 neighbor 187.28.122.154 activate
 neighbor 187.28.122.154 send-community both
 neighbor 189.53.246.74 remote-as 64617
 neighbor 189.53.246.74 description PHE/IP/00025
 neighbor 189.53.246.74 activate
 neighbor 189.53.246.74 send-community both
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf RIHAPPY:4005
 redistribute connected route-map SBC_CLIENTE
 redistribute static
 neighbor 200.252.158.134 remote-as 65443
 neighbor 200.252.158.134 description SLS/IP/05198
 neighbor 200.252.158.134 activate
 neighbor 200.252.158.134 send-community both
 maximum-paths eibgp 2
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf REALIP_CLIENTE:5581
 redistribute connected route-map REALIP_CLIENTE
 redistribute static route-map REALIP_CLIENTE
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf PROV_LIST:4379
 redistribute connected route-map SET_COMMUNITY_GERENCIA_CQMR
 redistribute static
 neighbor 200.172.11.110 remote-as 64860
 neighbor 200.172.11.110 description SLS/IP/01876
 neighbor 200.172.11.110 activate
 neighbor 200.172.11.110 send-community both
 maximum-paths eibgp 2
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf POLIPECAS:3158
 redistribute connected
 redistribute static
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf PGJMARANHAO:7435
 redistribute connected
 redistribute static
 neighbor 187.28.122.218 remote-as 65000
 neighbor 187.28.122.218 description SLS/IP/06032
 neighbor 187.28.122.218 activate
 neighbor 187.28.122.218 send-community both
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf PAULINAS:2475
 redistribute connected route-map SBC_CLIENTE
 redistribute static
 maximum-paths eibgp 2
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf OMNILIFE:6246
 redistribute connected route-map LATAM_TELMEX_286
 redistribute static route-map LATAM_TELMEX_286
 neighbor 187.28.122.78 remote-as 65201
 neighbor 187.28.122.78 description SLS/MULTI/59039
 neighbor 187.28.122.78 activate
 neighbor 187.28.122.78 send-community both
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf NGN-VOZ:1417
 redistribute connected
 redistribute static
 neighbor 10.255.21.86 remote-as 64854
 neighbor 10.255.21.86 description Uplink 4948 - acesso VLI
 neighbor 10.255.21.86 activate
 neighbor 10.255.21.86 route-map NGN-VOZ_1417102552186 out
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf NGN-VIPLINEIP:2628
 redistribute connected
 redistribute static
 neighbor 10.254.254.166 remote-as 64854
 neighbor 10.254.254.166 description Uplink 4948 - acesso VLI
 neighbor 10.254.254.166 activate
 neighbor 10.254.254.166 route-map NGN-VIPLINEIP_262810254254166 out
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf NGN-GER:1416
 redistribute connected
 redistribute static
 neighbor 10.253.2.182 remote-as 65523
 neighbor 10.253.2.182 activate
 neighbor 10.253.2.182 send-community both
 neighbor 10.253.8.30 remote-as 64854
 neighbor 10.253.8.30 description Uplink 4948 - acesso VLI
 neighbor 10.253.8.30 activate
 neighbor 10.253.8.30 route-map NGN-GER_141610253830 out
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf MPF_NOVA:6114
 redistribute connected
 redistribute static
 neighbor 192.168.34.230 remote-as 65001
 neighbor 192.168.34.230 description BBL/IP/00195
 neighbor 192.168.34.230 activate
 neighbor 192.168.34.230 send-community both
 maximum-paths eibgp 3
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf MOURA:1648
 redistribute connected route-map LATAM_TELMEX_285
 redistribute static route-map LATAM_TELMEX_285
 maximum-paths eibgp 2
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf MARTINS:1786
 redistribute connected
 redistribute static
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf MAPA_MPLS:6409
 redistribute connected
 redistribute static
 neighbor 200.172.182.106 remote-as 65000
 neighbor 200.172.182.106 description SLS/MULTI/48831
 neighbor 200.172.182.106 activate
 neighbor 200.172.182.106 send-community both
 maximum-paths eibgp 2
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf LOJASRIACHUELO:4120
 redistribute connected
 redistribute static
 neighbor 189.53.246.142 remote-as 65519
 neighbor 189.53.246.142 description SLS/MULTI/18374
 neighbor 189.53.246.142 activate
 neighbor 189.53.246.142 send-community both
 neighbor 189.53.246.142 route-map LOJASRIACHUELO_412018953246142 out
 neighbor 189.53.246.202 remote-as 65519
 neighbor 189.53.246.202 description SLS/IP/05208
 neighbor 189.53.246.202 activate
 neighbor 189.53.246.202 send-community both
 neighbor 200.172.11.170 remote-as 65519
 neighbor 200.172.11.170 description ITZ/MULTI/44201
 neighbor 200.172.11.170 activate
 neighbor 200.172.11.170 send-community both
 neighbor 201.73.255.46 remote-as 65519
 neighbor 201.73.255.46 description SLS/MULTI/27860
 neighbor 201.73.255.46 activate
 neighbor 201.73.255.46 send-community both
 neighbor 201.73.255.46 route-map LOJASRIACHUELO_41202017325546 out
 maximum-paths eibgp 2
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf LOJARENNER:1513
 redistribute connected route-map SBC_CLIENTE
 redistribute static
 neighbor 187.28.122.82 remote-as 65004
 neighbor 187.28.122.82 description SLS/IP/04905
 neighbor 187.28.122.82 activate
 neighbor 187.28.122.82 send-community both
 neighbor 200.172.11.78 remote-as 65004
 neighbor 200.172.11.78 description SLS/IP/04905
 neighbor 200.172.11.78 activate
 neighbor 200.172.11.78 send-community both
 maximum-paths eibgp 2
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf LEO:1056
 redistribute connected
 redistribute static
 neighbor 200.209.190.142 remote-as 64513
 neighbor 200.209.190.142 description SLS/IP/02062
 neighbor 200.209.190.142 activate
 neighbor 200.209.190.142 send-community both
 maximum-paths eibgp 2
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf LASA_NOVA:155000
 redistribute connected route-map SBC_CLIENTE
 redistribute static
 neighbor 187.28.122.18 remote-as 65316
 neighbor 187.28.122.18 description SLS/IP/05850
 neighbor 187.28.122.18 activate
 neighbor 187.28.122.18 send-community both
 neighbor 187.28.122.234 remote-as 65316
 neighbor 187.28.122.234 description SLS/IP/05666
 neighbor 187.28.122.234 activate
 neighbor 187.28.122.234 send-community both
 neighbor 187.28.122.234 as-override
 neighbor 189.43.120.162 remote-as 65316
 neighbor 189.43.120.162 description SLS/IP/00516
 neighbor 189.43.120.162 activate
 neighbor 189.43.120.162 send-community both
 neighbor 189.43.120.162 as-override
 neighbor 200.172.11.214 remote-as 65316
 neighbor 200.172.11.214 description SLS/IP/05202
 neighbor 200.172.11.214 activate
 neighbor 200.172.11.214 send-community both
 neighbor 200.172.11.214 as-override
 neighbor 200.172.11.214 route-map LASA_NOVA_15500020017211214 out
 neighbor 200.172.12.2 remote-as 65316
 neighbor 200.172.12.2 description CDO/IP/00150
 neighbor 200.172.12.2 activate
 neighbor 200.172.12.2 send-community both
 neighbor 200.172.12.2 as-override
 neighbor 200.209.190.134 remote-as 65316
 neighbor 200.209.190.134 description SLS/IP/00815
 neighbor 200.209.190.134 activate
 neighbor 200.209.190.134 send-community both
 neighbor 200.209.190.134 as-override
 neighbor 201.30.36.18 remote-as 65316
 neighbor 201.30.36.18 description SLS/IP/05474
 neighbor 201.30.36.18 activate
 neighbor 201.30.36.18 send-community both
 neighbor 201.30.36.18 as-override
 neighbor 201.45.221.190 remote-as 65316
 neighbor 201.45.221.190 description PHE/IP/00189
 neighbor 201.45.221.190 activate
 neighbor 201.45.221.190 send-community both
 maximum-paths eibgp 4
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf JOLIVAN:3739
 redistribute connected
 redistribute static
 neighbor 189.23.73.90 remote-as 65223
 neighbor 189.23.73.90 description SLS/IP/03862
 neighbor 189.23.73.90 activate
 neighbor 189.23.73.90 send-community both
 maximum-paths eibgp 2
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf IURD:1265
 redistribute connected
 redistribute static
 neighbor 200.172.11.122 remote-as 64662
 neighbor 200.172.11.122 description PDU/MULTI/42708
 neighbor 200.172.11.122 activate
 neighbor 200.172.11.122 send-community both
 neighbor 200.253.132.214 remote-as 64662
 neighbor 200.253.132.214 description SLS/IP/00153
 neighbor 200.253.132.214 activate
 neighbor 200.253.132.214 send-community both
 neighbor 201.73.255.10 remote-as 64662
 neighbor 201.73.255.10 description BBL/IP/00044
 neighbor 201.73.255.10 activate
 neighbor 201.73.255.10 send-community both
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf ITAUNIBANCO:6388
 redistribute connected route-map SBC_CLIENTE
 redistribute static
 neighbor 187.28.122.194 remote-as 65001
 neighbor 187.28.122.194 description SLS/IP/05822
 neighbor 187.28.122.194 activate
 neighbor 187.28.122.194 send-community both
 maximum-paths eibgp 2
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf INPE:5430
 redistribute connected
 redistribute static
 neighbor 200.172.182.102 remote-as 65000
 neighbor 200.172.182.102 description ALN/MULTI/56691
 neighbor 200.172.182.102 activate
 neighbor 200.172.182.102 send-community both
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf INFRAERO:4781
 redistribute connected
 redistribute static
 neighbor 10.0.242.10 remote-as 65000
 neighbor 10.0.242.10 description SLS/MULTI/25947
 neighbor 10.0.242.10 activate
 neighbor 10.0.242.10 send-community both
 neighbor 10.0.242.10 route-map INFRAERO_478110024210 out
 neighbor 10.10.34.42 remote-as 65000
 neighbor 10.10.34.42 description SLS/MULTI/25947
 neighbor 10.10.34.42 activate
 neighbor 10.10.34.42 send-community both
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf INFOSUS:4968
 redistribute connected
 redistribute static
 neighbor 192.168.105.190 remote-as 65000
 neighbor 192.168.105.190 description ITZ/IP/01213
 neighbor 192.168.105.190 activate
 neighbor 192.168.105.190 send-community both
 maximum-paths eibgp 2
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf IMIFARMA_EXTRANET:155458
 redistribute connected
 redistribute static
 neighbor 187.28.122.22 remote-as 65000
 neighbor 187.28.122.22 description SLS/IP/05681
 neighbor 187.28.122.22 activate
 neighbor 187.28.122.22 send-community both
 neighbor 187.28.122.50 remote-as 65000
 neighbor 187.28.122.50 description SLS/IP/05674
 neighbor 187.28.122.50 activate
 neighbor 187.28.122.50 send-community both
 neighbor 187.28.122.138 remote-as 65000
 neighbor 187.28.122.138 description SLS/IP/05680
 neighbor 187.28.122.138 activate
 neighbor 187.28.122.138 send-community both
 neighbor 187.28.122.146 remote-as 65000
 neighbor 187.28.122.146 description SLS/IP/05855
 neighbor 187.28.122.146 activate
 neighbor 187.28.122.146 send-community both
 neighbor 187.28.122.150 remote-as 65000
 neighbor 187.28.122.150 description SLS/MULTI/58022
 neighbor 187.28.122.150 activate
 neighbor 187.28.122.150 send-community both
 neighbor 187.28.122.158 remote-as 65000
 neighbor 187.28.122.158 description SLS/IP/05660
 neighbor 187.28.122.158 activate
 neighbor 187.28.122.158 send-community both
 neighbor 187.28.122.170 remote-as 65000
 neighbor 187.28.122.170 description SLS/IP/05685
 neighbor 187.28.122.170 activate
 neighbor 187.28.122.170 send-community both
 neighbor 187.28.122.190 remote-as 65000
 neighbor 187.28.122.190 description SLS/MULTI/57791
 neighbor 187.28.122.190 activate
 neighbor 187.28.122.190 send-community both
 neighbor 187.28.240.70 remote-as 65000
 neighbor 187.28.240.70 description SLS/IP/05695
 neighbor 187.28.240.70 activate
 neighbor 187.28.240.70 send-community both
 neighbor 187.28.240.82 remote-as 65000
 neighbor 187.28.240.82 description SLS/IP/05854
 neighbor 187.28.240.82 activate
 neighbor 187.28.240.82 send-community both
 neighbor 187.28.240.98 remote-as 65000
 neighbor 187.28.240.98 description SLS/IP/05859
 neighbor 187.28.240.98 activate
 neighbor 187.28.240.98 send-community both
 neighbor 187.28.240.102 remote-as 65000
 neighbor 187.28.240.102 description SLS/IP/05860
 neighbor 187.28.240.102 activate
 neighbor 187.28.240.102 send-community both
 neighbor 187.28.240.134 remote-as 65000
 neighbor 187.28.240.134 description SLS/IP/05690
 neighbor 187.28.240.134 activate
 neighbor 187.28.240.134 send-community both
 neighbor 187.28.240.146 remote-as 65000
 neighbor 187.28.240.146 description SLS/MULTI/56918
 neighbor 187.28.240.146 activate
 neighbor 187.28.240.146 send-community both
 neighbor 200.172.11.38 remote-as 65000
 neighbor 200.172.11.38 description SLS/IP/05696
 neighbor 200.172.11.38 activate
 neighbor 200.172.11.38 send-community both
 neighbor 200.172.11.230 remote-as 65000
 neighbor 200.172.11.230 description SLS/MULTI/54984
 neighbor 200.172.11.230 activate
 neighbor 200.172.11.230 send-community both
 neighbor 201.30.36.58 remote-as 65000
 neighbor 201.30.36.58 description SLS/MULTI/54988
 neighbor 201.30.36.58 activate
 neighbor 201.30.36.58 send-community both
 neighbor 201.30.36.70 remote-as 65000
 neighbor 201.30.36.70 description SLS/MULTI/55058
 neighbor 201.30.36.70 activate
 neighbor 201.30.36.70 send-community both
 neighbor 201.30.36.78 remote-as 65000
 neighbor 201.30.36.78 description ITZ/MULTI/55119
 neighbor 201.30.36.78 activate
 neighbor 201.30.36.78 send-community both
 neighbor 201.30.36.82 remote-as 65000
 neighbor 201.30.36.82 description ITZ/MULTI/55138
 neighbor 201.30.36.82 activate
 neighbor 201.30.36.82 send-community both
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf IBI_LOJAS:4639
 redistribute connected
 redistribute static
 neighbor 200.172.11.130 remote-as 64846
 neighbor 200.172.11.130 description SLS/IP/05104
 neighbor 200.172.11.130 activate
 neighbor 200.172.11.130 send-community both
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf HERVAL:4202
 redistribute connected route-map SBC_CLIENTE
 redistribute static
 neighbor 187.28.240.122 remote-as 65000
 neighbor 187.28.240.122 description SLS/MULTI/55763
 neighbor 187.28.240.122 activate
 neighbor 187.28.240.122 send-community both
 maximum-paths eibgp 2
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf FUNASA:3094
 redistribute connected
 redistribute static
 neighbor 189.52.211.70 remote-as 65305
 neighbor 189.52.211.70 description SLS/IP/05646
 neighbor 189.52.211.70 activate
 neighbor 189.52.211.70 send-community both
 maximum-paths eibgp 2
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf ELEVADORESATLAS:7186
 redistribute connected
 redistribute static
 neighbor 187.28.122.38 remote-as 65000
 neighbor 187.28.122.38 description SLS/IP/05941
 neighbor 187.28.122.38 activate
 neighbor 187.28.122.38 send-community both
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf DPF_MPLS:6606
 redistribute connected
 redistribute static
 neighbor 189.23.73.174 remote-as 65100
 neighbor 189.23.73.174 description SLS/IP/05502
 neighbor 189.23.73.174 activate
 neighbor 189.23.73.174 send-community both
 maximum-paths eibgp 2
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf DIST_TIETE_FILIAL:5599
 redistribute connected
 redistribute static
 neighbor 200.252.158.30 remote-as 64857
 neighbor 200.252.158.30 description SLS/IP/01986
 neighbor 200.252.158.30 activate
 neighbor 200.252.158.30 send-community both
 maximum-paths eibgp 2
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf DIASBRANCO:1569
 redistribute connected route-map SBC_CLIENTE
 redistribute static
 neighbor 200.253.132.194 remote-as 65169
 neighbor 200.253.132.194 description SLS/MULTI/07596
 neighbor 200.253.132.194 activate
 neighbor 200.253.132.194 send-community both
 maximum-paths eibgp 2
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf DALCAR:5317
 redistribute connected
 redistribute static
 neighbor 189.53.246.10 remote-as 65000
 neighbor 189.53.246.10 description BBL/IP/00185
 neighbor 189.53.246.10 activate
 neighbor 189.53.246.10 send-community both
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf CREFISA:5415
 redistribute connected
 redistribute static
 neighbor 187.28.122.206 remote-as 65001
 neighbor 187.28.122.206 description CXS/MULTI/56926
 neighbor 187.28.122.206 activate
 neighbor 187.28.122.206 send-community both
 neighbor 187.28.240.6 remote-as 65000
 neighbor 187.28.240.6 description CDO/MULTI/57097
 neighbor 187.28.240.6 activate
 neighbor 187.28.240.6 send-community both
 neighbor 200.172.11.62 remote-as 65000
 neighbor 200.172.11.62 description ITZ/IP/01179
 neighbor 200.172.11.62 activate
 neighbor 200.172.11.62 send-community both
 neighbor 200.172.11.194 remote-as 65000
 neighbor 200.172.11.194 description SLS/MULTI/50277
 neighbor 200.172.11.194 activate
 neighbor 200.172.11.194 send-community both
 maximum-paths eibgp 3
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf CREDISHOP:1661
 redistribute connected
 redistribute static
 neighbor 187.28.122.34 remote-as 64518
 neighbor 187.28.122.34 description CDO/MULTI/30455
 neighbor 187.28.122.34 activate
 neighbor 187.28.122.34 send-community both
 neighbor 187.28.122.242 remote-as 64518
 neighbor 187.28.122.242 description SIS/MULTI/28891
 neighbor 187.28.122.242 activate
 neighbor 187.28.122.242 send-community both
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf CORREIOS_2016:7440
 redistribute connected route-map RM_ECT_CONNECTED
 redistribute static
 neighbor 172.18.69.70 remote-as 65001
 neighbor 172.18.69.70 description SLS/IP/06037
 neighbor 172.18.69.70 password 7 096E693926203426
 neighbor 172.18.69.70 activate
 neighbor 172.18.69.70 send-community both
 neighbor 172.18.72.178 remote-as 65001
 neighbor 172.18.72.178 description SLS/IP/06043
 neighbor 172.18.72.178 password 7 132730223429271E
 neighbor 172.18.72.178 activate
 neighbor 172.18.72.178 send-community both
 neighbor 172.18.77.34 remote-as 65001
 neighbor 172.18.77.34 description SLS/IP/06044
 neighbor 172.18.77.34 password 7 123B22272D2E2F30
 neighbor 172.18.77.34 activate
 neighbor 172.18.77.34 send-community both
 neighbor 172.18.77.86 remote-as 65001
 neighbor 172.18.77.86 description SLS/IP/06131
 neighbor 172.18.77.86 password 7 06242811736B2A2D
 neighbor 172.18.77.86 activate
 neighbor 172.18.77.86 send-community both
 neighbor 172.18.170.134 remote-as 65001
 neighbor 172.18.170.134 description SJE/IP/00172
 neighbor 172.18.170.134 password 7 06242811736B2A2D
 neighbor 172.18.170.134 activate
 neighbor 172.18.170.134 send-community both
 maximum-paths eibgp 2
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf COBRA:1706
 redistribute connected route-map SBC_CLIENTE
 redistribute static
 maximum-paths eibgp 2
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf CIMED:2611
 redistribute connected
 redistribute static
 neighbor 187.29.255.202 remote-as 65345
 neighbor 187.29.255.202 description SLS/IP/05221
 neighbor 187.29.255.202 activate
 neighbor 187.29.255.202 send-community both
 maximum-paths eibgp 2
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf CIEE:3214
 redistribute connected
 redistribute static
 neighbor 187.28.122.210 remote-as 65080
 neighbor 187.28.122.210 description SLS/IP/03700
 neighbor 187.28.122.210 activate
 neighbor 187.28.122.210 send-community both
 maximum-paths eibgp 2
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf CETIP:6164
 redistribute connected
 redistribute static
 neighbor 200.252.158.226 remote-as 65000
 neighbor 200.252.158.226 description SLS/IP/05175
 neighbor 200.252.158.226 password 7 15115818553A0B2D792564023057243340637F
 neighbor 200.252.158.226 activate
 neighbor 200.252.158.226 send-community both
 maximum-paths eibgp 2
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf CBE:4734
 redistribute connected
 redistribute static
 neighbor 187.28.122.30 remote-as 64962
 neighbor 187.28.122.30 description CDO/MULTI/24214
 neighbor 187.28.122.30 activate
 neighbor 187.28.122.30 send-community both
 neighbor 187.28.122.30 route-map CBE_47341872812230 out
 maximum-paths eibgp 2
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf CASSI:3904
 redistribute connected
 redistribute static
 neighbor 200.252.158.46 remote-as 65522
 neighbor 200.252.158.46 description SLS/IP/02154
 neighbor 200.252.158.46 activate
 neighbor 200.252.158.46 send-community both
 neighbor 200.252.158.46 as-override
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf BYTENNIS:3608
 redistribute connected route-map SBC_CLIENTE
 redistribute static
 neighbor 187.28.122.106 remote-as 64732
 neighbor 187.28.122.106 description SLS/MULTI/55231
 neighbor 187.28.122.106 activate
 neighbor 187.28.122.106 send-community both
 neighbor 187.28.122.222 remote-as 64732
 neighbor 187.28.122.222 description SLS/MULTI/28220
 neighbor 187.28.122.222 activate
 neighbor 187.28.122.222 send-community both
 maximum-paths eibgp 2
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf BRASILIANAENC_NOVA:6317
 redistribute connected
 redistribute static
 neighbor 189.23.73.190 remote-as 65000
 neighbor 189.23.73.190 description SLS/MULTI/56676
 neighbor 189.23.73.190 activate
 neighbor 189.23.73.190 send-community both
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf BRADEL:6618
 redistribute connected
 redistribute static
 neighbor 201.30.36.38 remote-as 65000
 neighbor 201.30.36.38 description SLS/MULTI/52708
 neighbor 201.30.36.38 activate
 neighbor 201.30.36.38 send-community both
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf BNB:5075
 redistribute connected
 redistribute static
 neighbor 187.28.240.154 remote-as 65000
 neighbor 187.28.240.154 description PHE/IP/00176
 neighbor 187.28.240.154 activate
 neighbor 187.28.240.154 send-community both
 neighbor 189.53.11.230 remote-as 65000
 neighbor 189.53.11.230 description BBL/IP/00206
 neighbor 189.53.11.230 activate
 neighbor 189.53.11.230 send-community both
 maximum-paths eibgp 2
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf BCOVOTOFILIAL:6826
 redistribute connected
 redistribute static
 neighbor 187.28.122.114 remote-as 65160
 neighbor 187.28.122.114 description SLS/IP/05807
 neighbor 187.28.122.114 activate
 neighbor 187.28.122.114 send-community both
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf BCOAM:4783
 redistribute connected
 redistribute static
 neighbor 189.52.199.162 remote-as 65330
 neighbor 189.52.199.162 description VMM/MULTI/25016
 neighbor 189.52.199.162 activate
 neighbor 189.52.199.162 send-community both
 neighbor 200.209.190.110 remote-as 65330
 neighbor 200.209.190.110 description PHE/MULTI/25621
 neighbor 200.209.190.110 activate
 neighbor 200.209.190.110 send-community both
 neighbor 200.249.145.222 remote-as 65330
 neighbor 200.249.145.222 description ETO/MULTI/24774
 neighbor 200.249.145.222 activate
 neighbor 200.249.145.222 send-community both
 maximum-paths eibgp 2
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf BBRASIL_PAE:7041
 redistribute connected
 redistribute static
 neighbor 10.7.82.30 remote-as 65524
 neighbor 10.7.82.30 description ITZ/IP/01175
 neighbor 10.7.82.30 timers 5 15
 neighbor 10.7.82.30 activate
 neighbor 10.7.82.30 send-community both
 neighbor 10.7.82.30 next-hop-self
 neighbor 10.7.82.30 as-override
 neighbor 10.7.82.30 route-map BBRASIL_PAE_CE_OUT out
 neighbor 10.247.77.202 remote-as 65521
 neighbor 10.247.77.202 description CXS/IP/00243
 neighbor 10.247.77.202 shutdown
 neighbor 10.247.77.202 timers 5 15
 neighbor 10.247.77.202 activate
 neighbor 10.247.77.202 send-community both
 neighbor 10.247.77.202 next-hop-self
 neighbor 10.247.77.202 as-override
 neighbor 10.247.77.202 route-map BBRASIL_CE_OUT out
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf BBRASIL_NAC:7399
 redistribute connected
 redistribute static
 neighbor 10.66.162.162 remote-as 65321
 neighbor 10.66.162.162 description SLS/IP/04600
 neighbor 10.66.162.162 timers 10 30
 neighbor 10.66.162.162 activate
 neighbor 10.66.162.162 send-community both
 neighbor 10.66.162.162 route-map BB-LT2-NAC-REMOTOS-IN in
 neighbor 10.66.162.162 route-map BB-LT2-NAC-REMOTOS-OUT out
 neighbor 10.66.173.190 remote-as 65321
 neighbor 10.66.173.190 description SLS/IP/04600
 neighbor 10.66.173.190 timers 10 30
 neighbor 10.66.173.190 activate
 neighbor 10.66.173.190 send-community both
 neighbor 10.66.173.190 route-map BB-LT2-NAC-REMOTOS-IN in
 neighbor 10.66.173.190 route-map BB-LT2-NAC-REMOTOS-OUT out
 neighbor 10.66.227.22 remote-as 65321
 neighbor 10.66.227.22 description ITZ/IP/01207
 neighbor 10.66.227.22 timers 10 30
 neighbor 10.66.227.22 activate
 neighbor 10.66.227.22 send-community both
 neighbor 10.66.227.22 route-map BB-LT2-NAC-REMOTOS-IN in
 neighbor 10.66.227.22 route-map BB-LT2-NAC-REMOTOS-OUT out
 maximum-paths eibgp 2
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf BBRASIL:1588
 redistribute connected
 redistribute static
 neighbor 10.7.53.158 remote-as 65521
 neighbor 10.7.53.158 description SLS/IP/05047
 neighbor 10.7.53.158 activate
 neighbor 10.7.53.158 send-community both
 neighbor 10.7.53.158 next-hop-self
 neighbor 10.7.53.158 as-override
 neighbor 10.7.53.158 route-map BBRASIL_CE_OUT out
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf ANVISA:4356
 redistribute connected
 redistribute static
 neighbor 187.28.122.102 remote-as 65001
 neighbor 187.28.122.102 description SLS/IP/05592
 neighbor 187.28.122.102 activate
 neighbor 187.28.122.102 send-community both
 neighbor 189.53.246.110 remote-as 65001
 neighbor 189.53.246.110 description SLS/IP/01796
 neighbor 189.53.246.110 activate
 neighbor 189.53.246.110 send-community both
 neighbor 189.53.246.110 as-override
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf ABRROAMING:1249
 redistribute connected
 redistribute static
 neighbor 189.53.246.246 remote-as 64639
 neighbor 189.53.246.246 description SLS/IP/04574
 neighbor 189.53.246.246 activate
 neighbor 189.53.246.246 send-community both
 maximum-paths eibgp 2
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf ABNOTECNH:4953
 redistribute connected
 redistribute static
 neighbor 201.45.138.14 remote-as 65000
 neighbor 201.45.138.14 description SLS/IP/03666
 neighbor 201.45.138.14 activate
 neighbor 201.45.138.14 send-community both
 maximum-paths eibgp 2
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf ABNAMRO:2803
 redistribute connected
 redistribute static
 neighbor 187.28.240.14 remote-as 65069
 neighbor 187.28.240.14 description SLS/MULTI/29685
 neighbor 187.28.240.14 timers 20 60
 neighbor 187.28.240.14 activate
 neighbor 187.28.240.14 send-community both
 neighbor 187.28.240.14 default-originate route-map ABNAMRO_DEFAULT
 neighbor 187.28.240.14 advertisement-interval 1
 neighbor 187.28.240.14 route-map NO-ROUTES_OUT out
 neighbor 189.42.70.10 remote-as 65069
 neighbor 189.42.70.10 description SLS/MULTI/02681
 neighbor 189.42.70.10 timers 20 60
 neighbor 189.42.70.10 activate
 neighbor 189.42.70.10 send-community both
 neighbor 189.42.70.10 default-originate route-map ABNAMRO_DEFAULT
 neighbor 189.42.70.10 advertisement-interval 1
 neighbor 189.42.70.10 route-map NO-ROUTES_OUT out
 neighbor 189.42.84.2 remote-as 65069
 neighbor 189.42.84.2 description SLS/MULTI/03689
 neighbor 189.42.84.2 timers 20 60
 neighbor 189.42.84.2 activate
 neighbor 189.42.84.2 send-community both
 neighbor 189.42.84.2 default-originate route-map ABNAMRO_DEFAULT
 neighbor 189.42.84.2 advertisement-interval 1
 neighbor 189.42.84.2 route-map NO-ROUTES_OUT out
 neighbor 189.42.84.10 remote-as 65069
 neighbor 189.42.84.10 description SLS/MULTI/05552
 neighbor 189.42.84.10 timers 20 60
 neighbor 189.42.84.10 activate
 neighbor 189.42.84.10 send-community both
 neighbor 189.42.84.10 default-originate route-map ABNAMRO_DEFAULT
 neighbor 189.42.84.10 advertisement-interval 1
 neighbor 189.42.84.10 route-map NO-ROUTES_OUT out
 neighbor 189.42.91.202 remote-as 65069
 neighbor 189.42.91.202 description SLS/MULTI/03831
 neighbor 189.42.91.202 timers 20 60
 neighbor 189.42.91.202 activate
 neighbor 189.42.91.202 send-community both
 neighbor 189.42.91.202 default-originate route-map ABNAMRO_DEFAULT
 neighbor 189.42.91.202 advertisement-interval 1
 neighbor 189.42.91.202 route-map NO-ROUTES_OUT out
 neighbor 189.43.120.202 remote-as 65069
 neighbor 189.43.120.202 description SLS/MULTI/29941
 neighbor 189.43.120.202 timers 20 60
 neighbor 189.43.120.202 activate
 neighbor 189.43.120.202 send-community both
 neighbor 189.43.120.202 default-originate route-map ABNAMRO_DEFAULT
 neighbor 189.43.120.202 advertisement-interval 1
 neighbor 189.43.120.202 route-map NO-ROUTES_OUT out
 neighbor 189.49.70.6 remote-as 65069
 neighbor 189.49.70.6 description SLS/MULTI/02680
 neighbor 189.49.70.6 timers 20 60
 neighbor 189.49.70.6 activate
 neighbor 189.49.70.6 send-community both
 neighbor 189.49.70.6 default-originate route-map ABNAMRO_DEFAULT
 neighbor 189.49.70.6 advertisement-interval 1
 neighbor 189.49.70.6 route-map NO-ROUTES_OUT out
 neighbor 200.172.13.50 remote-as 65069
 neighbor 200.172.13.50 description ITZ/MULTI/40958
 neighbor 200.172.13.50 timers 20 60
 neighbor 200.172.13.50 activate
 neighbor 200.172.13.50 send-community both
 neighbor 200.172.13.50 default-originate route-map ABNAMRO_DEFAULT
 neighbor 200.172.13.50 advertisement-interval 1
 neighbor 200.172.13.50 route-map NO-ROUTES_OUT out
 maximum-paths eibgp 2
 default-information originate
 no synchronization
 bgp dampening
 exit-address-family
!
ip classless
ip route 10.0.0.0 255.0.0.0 Null0 tag 200
ip route 100.64.0.0 255.192.0.0 Null0 tag 200
ip route 169.254.0.0 255.255.0.0 Null0 tag 200
ip route 172.16.0.0 255.240.0.0 Null0 tag 200
ip route 189.2.0.0 255.255.0.0 Null0 tag 200
ip route 189.3.0.0 255.255.0.0 Null0 tag 200
ip route 189.3.101.0 255.255.255.248 FastEthernet0/3/6.159 189.53.103.50
ip route 189.3.101.64 255.255.255.240 Multilink40002 200.172.11.218
ip route 189.3.101.192 255.255.255.248 FastEthernet0/3/6.412 189.23.73.126
ip route 189.3.221.32 255.255.255.248 FastEthernet0/3/6.107 189.52.212.174
ip route 189.3.221.40 255.255.255.248 FastEthernet0/3/6.210 189.87.249.98
ip route 189.3.221.56 255.255.255.248 FastEthernet0/3/6.111 189.52.212.182
ip route 189.3.222.160 255.255.255.240 GigabitEthernet0/0/3.3 187.28.122.202
ip route 189.16.0.0 255.255.0.0 Null0 tag 200
ip route 189.16.255.48 255.255.255.240 GigabitEthernet0/0/3.29 189.23.73.46
ip route 189.16.255.200 255.255.255.248 FastEthernet0/3/6.227 189.52.166.22
ip route 189.16.255.240 255.255.255.248 FastEthernet0/3/6.233 189.87.249.190
ip route 189.17.0.0 255.255.0.0 Null0 tag 200
ip route 189.17.21.0 255.255.255.248 FastEthernet0/3/6.295 187.28.240.142
ip route 189.17.21.16 255.255.255.248 FastEthernet0/3/6.11 189.52.166.238
ip route 189.17.21.32 255.255.255.240 GigabitEthernet0/0/3.39 187.28.122.250
ip route 189.17.21.64 255.255.255.248 FastEthernet0/3/6.42 189.52.199.154
ip route 189.17.21.120 255.255.255.248 FastEthernet0/3/6.53 189.52.199.202
ip route 189.17.21.152 255.255.255.248 FastEthernet0/3/6.240 189.87.249.218
ip route 189.17.22.160 255.255.255.240 GigabitEthernet0/0/3.32 187.28.122.174
ip route 189.17.65.224 255.255.255.240 GigabitEthernet0/0/3.5 187.28.122.10
ip route 189.17.66.24 255.255.255.248 FastEthernet0/3/6.279 187.28.240.242
ip route 189.17.66.224 255.255.255.248 FastEthernet0/3/6.196 189.87.249.42
ip route 189.17.131.16 255.255.255.248 FastEthernet0/3/6.246 189.52.212.218
ip route 189.17.131.24 255.255.255.248 FastEthernet0/3/6.71 189.52.212.54
ip route 189.17.131.80 255.255.255.240 Multilink400023 187.28.240.58
ip route 189.17.131.96 255.255.255.240 GigabitEthernet0/0/3.17 200.172.11.234
ip route 189.17.173.88 255.255.255.248 FastEthernet0/3/6.277 189.23.68.30
ip route 189.17.174.208 255.255.255.240 GigabitEthernet0/0/3.42 200.172.182.78
ip route 189.17.174.248 255.255.255.248 FastEthernet0/3/6.430 200.172.182.170
ip route 189.17.228.72 255.255.255.248 FastEthernet0/3/6.194 200.172.182.22
ip route 189.17.228.120 255.255.255.248 FastEthernet0/3/6.174 189.52.212.10
ip route 189.22.0.0 255.255.0.0 Null0 tag 200
ip route 189.22.181.176 255.255.255.248 FastEthernet0/3/6.443 200.172.182.238
ip route 189.22.181.184 255.255.255.248 FastEthernet0/3/6.445 200.172.182.246
ip route 189.22.181.224 255.255.255.240 GigabitEthernet0/0/3.85 200.172.182.226
ip route 189.22.226.16 255.255.255.240 Serial1/1/0.1/3/4/2:0
ip route 189.22.226.184 255.255.255.248 FastEthernet0/3/6.224 187.28.240.138
ip route 189.22.226.240 255.255.255.248 FastEthernet0/3/6.245 189.87.249.250
ip route 189.22.226.248 255.255.255.248 FastEthernet0/3/6.433 200.172.11.46
ip route 189.22.228.128 255.255.255.248 FastEthernet0/3/6.304 189.53.103.158
ip route 189.22.228.136 255.255.255.248 FastEthernet0/3/6.166 189.53.103.154
ip route 189.22.228.176 255.255.255.248 FastEthernet0/3/6.301 189.53.103.150
ip route 189.22.228.208 255.255.255.248 FastEthernet0/3/6.85 189.52.212.86
ip route 189.22.238.152 255.255.255.248 FastEthernet0/3/6.228 187.28.122.122
ip route 189.22.238.248 255.255.255.248 FastEthernet0/3/6.150 187.28.240.166
ip route 189.23.0.0 255.255.0.0 Null0 tag 200
ip route 189.23.140.32 255.255.255.248 FastEthernet0/3/6.343 189.23.73.58
ip route 189.23.140.48 255.255.255.248 FastEthernet0/3/6.331 187.28.240.246
ip route 189.23.140.72 255.255.255.248 FastEthernet0/3/6.341 189.23.73.50
ip route 189.23.140.80 255.255.255.248 FastEthernet0/3/6.349 189.23.73.86
ip route 189.23.140.104 255.255.255.248 FastEthernet0/3/6.352 189.23.73.98
ip route 189.23.232.0 255.255.255.248 FastEthernet0/3/6.360 189.23.73.118
ip route 189.23.232.16 255.255.255.248 FastEthernet0/3/6.364 189.23.73.134
ip route 189.23.232.120 255.255.255.248 FastEthernet0/3/6.334 189.23.73.14
ip route 189.23.232.192 255.255.255.248 FastEthernet0/3/6.213 200.172.182.14
ip route 189.23.232.200 255.255.255.248 FastEthernet0/3/6.410 200.241.80.138
ip route 189.42.0.0 255.255.0.0 Null0 tag 200
ip route 189.42.206.72 255.255.255.248 FastEthernet0/3/6.284 189.23.73.38
ip route 189.42.206.88 255.255.255.248 FastEthernet0/3/6.357 189.23.73.110
ip route 189.43.0.0 255.255.0.0 Null0 tag 200
ip route 189.43.17.24 255.255.255.248 FastEthernet0/3/6.406 200.172.182.82
ip route 189.43.17.32 255.255.255.248 FastEthernet0/3/6.409 200.172.182.94
ip route 189.43.17.56 255.255.255.248 FastEthernet0/3/6.450 200.172.11.34
ip route 189.43.17.80 255.255.255.248 FastEthernet0/3/6.423 200.172.182.150
ip route 189.43.17.88 255.255.255.248 FastEthernet0/3/6.424 200.172.182.154
ip route 189.43.17.128 255.255.255.240 FastEthernet0/3/6.282 189.53.103.182
ip route 189.43.17.168 255.255.255.248 FastEthernet0/3/6.381 189.53.103.190
ip route 189.43.17.184 255.255.255.248 FastEthernet0/3/6.451 200.172.11.42
ip route 189.43.143.152 255.255.255.248 FastEthernet0/3/6.198 189.87.249.54
ip route 189.43.143.200 255.255.255.248 FastEthernet0/3/6.263 189.87.249.94
ip route 189.43.143.224 255.255.255.240 Multilink30 187.28.122.66
ip route 189.52.0.0 255.255.0.0 Null0 tag 200
ip route 189.52.165.96 255.255.255.248 FastEthernet0/3/6.189 189.87.249.10
ip route 189.52.170.24 255.255.255.248 FastEthernet0/3/6.296 200.172.182.118
ip route 189.52.171.8 255.255.255.248 FastEthernet0/3/6.164 189.52.212.250
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
ip route 200.166.96.0 255.255.255.128 Multilink86 200.243.109.86
ip route 200.166.99.160 255.255.255.240 GigabitEthernet0/0/3.51 200.172.182.130
ip route 200.166.101.0 255.255.255.128 FastEthernet0/3/6.303 200.249.169.102
ip route 200.167.0.0 255.255.0.0 Null0 tag 200
ip route 200.167.68.136 255.255.255.248 FastEthernet0/3/6.146 189.52.212.50
ip route 200.167.69.128 255.255.255.128 Multilink400024 200.253.152.202
ip route 200.172.0.0 255.255.0.0 Null0 tag 200
ip route 200.174.0.0 255.255.0.0 Null0 tag 200
ip route 200.178.0.0 255.255.0.0 Null0 tag 200
ip route 200.179.0.0 255.255.0.0 Null0 tag 200
ip route 200.182.0.0 255.255.0.0 Null0 tag 200
ip route 200.183.0.0 255.255.0.0 Null0 tag 200
ip route 200.191.0.0 255.255.0.0 Null0 tag 200
ip route 200.200.0.0 255.255.0.0 Null0 tag 200
ip route 200.208.0.0 255.255.0.0 Null0 tag 200
ip route 200.209.0.0 255.255.0.0 Null0 tag 200
ip route 200.209.188.64 255.255.255.240 GigabitEthernet0/0/3.9 200.172.11.226
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
ip route 200.241.82.0 255.255.255.248 FastEthernet0/3/6.178 189.53.103.202
ip route 200.241.86.0 255.255.255.248 FastEthernet0/3/6.59 189.87.249.142
ip route 200.242.0.0 255.255.0.0 Null0 tag 200
ip route 200.243.0.0 255.255.0.0 Null0 tag 200
ip route 200.244.0.0 255.255.0.0 Null0 tag 200
ip route 200.245.0.0 255.255.0.0 Null0 tag 200
ip route 200.246.0.0 255.255.0.0 Null0 tag 200
ip route 200.247.0.0 255.255.0.0 Null0 tag 200
ip route 200.248.0.0 255.255.0.0 Null0 tag 200
ip route 200.249.0.0 255.255.0.0 Null0 tag 200
ip route 200.249.167.128 255.255.255.248 FastEthernet0/3/6.156 189.53.103.114
ip route 200.249.172.32 255.255.255.248 FastEthernet0/3/6.298 200.172.182.126
ip route 200.249.172.40 255.255.255.248 FastEthernet0/3/6.363 189.23.73.130
ip route 200.250.0.0 255.255.0.0 Null0 tag 200
ip route 200.251.0.0 255.255.0.0 Null0 tag 200
ip route 200.252.0.0 255.255.0.0 Null0 tag 200
ip route 200.253.0.0 255.255.0.0 Null0 tag 200
ip route 200.253.153.24 255.255.255.248 FastEthernet0/3/6.271 189.87.249.154
ip route 200.253.153.32 255.255.255.248 FastEthernet0/3/6.346 189.52.199.66
ip route 200.253.153.40 255.255.255.248 FastEthernet0/3/6.226 189.52.199.70
ip route 200.253.153.72 255.255.255.248 FastEthernet0/3/6.438 189.52.199.230
ip route 200.253.154.144 255.255.255.248 FastEthernet0/3/6.23 189.52.199.62
ip route 200.253.154.152 255.255.255.248 FastEthernet0/3/6.386 189.52.199.54
ip route 200.253.154.160 255.255.255.248 FastEthernet0/3/6.385 189.52.199.50
ip route 200.253.154.168 255.255.255.248 FastEthernet0/3/6.231 189.52.199.46
ip route 200.253.157.40 255.255.255.248 FastEthernet0/3/6.375 189.52.212.78
ip route 200.253.159.56 255.255.255.248 FastEthernet0/3/6.69 189.52.212.22
ip route 200.254.0.0 255.255.0.0 Null0 tag 200
ip route 200.255.0.0 255.255.0.0 Null0 tag 200
ip route 201.30.0.0 255.255.0.0 Null0 tag 200
ip route 201.31.0.0 255.255.0.0 Null0 tag 200
ip route 201.38.0.0 255.255.0.0 Null0 tag 200
ip route 201.38.203.144 255.255.255.240 Multilink39967 200.172.11.158
ip route 201.38.203.192 255.255.255.248 FastEthernet0/3/6.254 189.23.68.14
ip route 201.38.204.208 255.255.255.248 FastEthernet0/3/6.447 200.172.182.10
ip route 201.38.233.0 255.255.255.240 GigabitEthernet0/0/3.56 201.30.36.14
ip route 201.38.233.72 255.255.255.248 FastEthernet0/3/6.207 189.87.249.14
ip route 201.39.0.0 255.255.0.0 Null0 tag 200
ip route 201.44.0.0 255.255.0.0 Null0 tag 200
ip route 201.45.0.0 255.255.0.0 Null0 tag 200
ip route 201.45.8.88 255.255.255.248 FastEthernet0/3/6.347 189.23.73.78
ip route 201.45.13.48 255.255.255.248 FastEthernet0/3/6.407 200.172.182.86
ip route 201.45.13.56 255.255.255.248 FastEthernet0/3/6.408 200.172.182.90
ip route 201.45.13.120 255.255.255.248 FastEthernet0/3/6.208 189.53.103.14
ip route 201.45.137.200 255.255.255.248 FastEthernet0/3/6.141 189.23.73.230
ip route 201.45.137.216 255.255.255.248 FastEthernet0/3/6.354 189.23.73.254
ip route 201.45.137.224 255.255.255.248 FastEthernet0/3/6.383 189.23.73.242
ip route 201.45.137.232 255.255.255.248 FastEthernet0/3/6.290 189.23.73.246
ip route 201.56.0.0 255.255.0.0 Null0 tag 200
ip route 201.57.0.0 255.255.0.0 Null0 tag 200
ip route 201.57.40.8 255.255.255.248 FastEthernet0/3/6.260 189.87.249.242
ip route 201.57.40.24 255.255.255.248 FastEthernet0/3/6.274 189.87.249.234
ip route 201.57.40.96 255.255.255.248 FastEthernet0/3/6.299 200.172.182.138
ip route 201.57.40.208 255.255.255.248 FastEthernet0/3/6.180 189.53.103.206
ip route 201.57.40.224 255.255.255.248 FastEthernet0/3/6.178 189.53.103.202
ip route 201.57.40.240 255.255.255.248 FastEthernet0/3/6.171 189.53.103.174
ip route 201.57.98.160 255.255.255.240 FastEthernet0/3/6.168 189.53.103.162
ip route 201.57.98.176 255.255.255.248 FastEthernet0/3/6.162 189.53.103.138
ip route 201.57.98.208 255.255.255.248 FastEthernet0/3/6.160 189.53.103.126
ip route 201.57.170.64 255.255.255.240 Multilink39935 187.28.122.238
ip route 201.57.170.96 255.255.255.248 FastEthernet0/3/6.255 189.23.68.46
ip route 201.57.170.240 255.255.255.240 Multilink400002 189.23.73.26
ip route 201.57.171.56 255.255.255.248 FastEthernet0/3/6.80 189.52.212.6
ip route 201.57.171.112 255.255.255.248 FastEthernet0/3/6.431 200.172.11.10
ip route 201.57.171.160 255.255.255.240 GigabitEthernet0/0/3.40 189.52.211.106
ip route 201.64.0.0 255.255.0.0 Null0 tag 200
ip route 201.65.0.0 255.255.0.0 Null0 tag 200
ip route 201.65.77.8 255.255.255.248 FastEthernet0/3/6.434 200.172.182.202
ip route 201.65.77.80 255.255.255.248 FastEthernet0/3/6.377 189.23.73.194
ip route 201.65.77.104 255.255.255.248 FastEthernet0/3/6.287 189.23.73.202
ip route 201.65.78.136 255.255.255.248 FastEthernet0/3/6.241 189.87.249.214
ip route 201.65.119.0 255.255.255.248 FastEthernet0/3/6.153 189.53.103.102
ip route 201.65.119.96 255.255.255.248 FastEthernet0/3/6.380 189.52.199.206
ip route 201.65.119.136 255.255.255.248 FastEthernet0/3/6.142 189.53.103.54
ip route 201.65.119.184 255.255.255.248 FastEthernet0/3/6.138 189.53.103.38
ip route 201.65.119.216 255.255.255.248 FastEthernet0/3/6.97 189.52.212.138
ip route 201.65.119.248 255.255.255.248 FastEthernet0/3/6.87 189.52.212.94
ip route 201.65.121.144 255.255.255.240 Multilink39977 200.172.11.182
ip route 201.65.221.176 255.255.255.240 FastEthernet0/3/6.280 189.52.166.38
ip route 201.65.222.144 255.255.255.248 FastEthernet0/3/6.324 187.28.240.190
ip route 201.65.222.176 255.255.255.248 FastEthernet0/3/6.173 187.28.240.170
ip route 201.65.222.184 255.255.255.248 FastEthernet0/3/6.321 187.28.240.178
ip route 201.65.223.144 255.255.255.248 FastEthernet0/3/6.137 189.53.103.34
ip route 201.65.223.168 255.255.255.248 FastEthernet0/3/6.134 189.53.103.22
ip route 201.65.223.176 255.255.255.248 FastEthernet0/3/6.395 189.53.103.10
ip route 201.65.223.192 255.255.255.248 FastEthernet0/3/6.398 200.172.11.58
ip route 201.72.0.0 255.255.0.0 Null0 tag 200
ip route 201.73.0.0 255.255.0.0 Null0 tag 200
ip route 201.73.61.24 255.255.255.248 FastEthernet0/3/6.10 189.52.166.230
ip route 201.73.61.64 255.255.255.248 FastEthernet0/3/6.5 189.52.166.146
ip route 201.73.61.72 255.255.255.248 FastEthernet0/3/6.4 189.52.166.142
ip route 201.73.61.80 255.255.255.248 FastEthernet0/3/6.1 189.52.166.126
ip route 201.73.61.88 255.255.255.248 FastEthernet0/3/6.2 189.52.166.130
ip route 201.73.61.128 255.255.255.240 GigabitEthernet0/0/3.31 200.172.11.250
ip route 201.73.61.200 255.255.255.248 FastEthernet0/3/6.291 200.172.182.122
ip route 201.73.61.248 255.255.255.248 FastEthernet0/3/6.310 189.52.212.42
ip route 201.73.62.144 255.255.255.248 FastEthernet0/3/6.292 200.172.182.34
ip route 201.73.62.200 255.255.255.248 FastEthernet0/3/6.379 189.52.199.186
ip route 201.73.62.224 255.255.255.248 FastEthernet0/3/6.61 189.52.199.174
ip route 201.73.194.72 255.255.255.248 FastEthernet0/3/6.116 189.52.212.210
ip route 201.73.194.88 255.255.255.248 FastEthernet0/3/6.258 189.52.166.46
ip route 201.73.194.120 255.255.255.248 FastEthernet0/3/6.251 189.52.212.186
ip route 201.73.194.192 255.255.255.248 FastEthernet0/3/6.269 189.87.249.146
ip route 201.73.194.216 255.255.255.248 FastEthernet0/3/6.204 189.87.249.138
ip route 201.73.204.24 255.255.255.248 FastEthernet0/3/6.234 189.87.249.194
ip route 201.73.204.48 255.255.255.248 FastEthernet0/3/6.76 189.87.249.162
ip route 201.73.204.136 255.255.255.248 FastEthernet0/3/6.39 189.52.199.130
ip route 201.73.204.144 255.255.255.248 FastEthernet0/3/6.209 189.52.199.126
ip route 201.73.204.176 255.255.255.248 FastEthernet0/3/6.34 189.52.211.50
ip route 201.73.204.184 255.255.255.248 FastEthernet0/3/6.33 189.52.199.110
ip route 201.73.205.208 255.255.255.248 FastEthernet0/3/6.257 189.52.166.42
ip route 201.73.205.216 255.255.255.248 FastEthernet0/3/6.94 189.52.212.126
ip route 201.73.254.112 255.255.255.240 Multilink400012 200.172.11.70
ip route 201.73.254.144 255.255.255.240 Multilink39997 200.172.12.74
ip route 201.73.254.240 255.255.255.240 Multilink39955 200.172.11.114
ip route 201.90.0.0 255.255.0.0 Null0 tag 200
ip route 203.0.113.0 255.255.255.0 Null0 tag 200
ip route vrf REALIP_CLIENTE:5581 187.28.122.24 255.255.255.252 GigabitEthernet0/0/3.52 187.28.122.6
ip route vrf REALIP_CLIENTE:5581 187.28.122.88 255.255.255.252 GigabitEthernet0/0/3.55 187.28.122.42
ip route vrf REALIP_CLIENTE:5581 187.28.122.96 255.255.255.252 GigabitEthernet0/0/3.54 187.28.122.82
ip route vrf REALIP_CLIENTE:5581 187.28.240.36 255.255.255.252 GigabitEthernet0/0/3.81 187.28.122.86
ip route vrf BYTENNIS:3608 10.150.138.0 255.255.255.0 Multilink54 187.28.122.222
ip route vrf TECBAN:1221 10.250.109.24 255.255.255.248 Serial0/1/0.1/3/2/1:4.1 187.28.122.118
ip route vrf MARTINS:1786 192.168.141.0 255.255.255.0 Serial0/1/0.1/2/2/3:0 200.252.158.74
ip route vrf MOURA:1648 172.16.102.0 255.255.255.0 Serial1/1/0.1/3/7/2:2.1 200.253.132.2
ip route vrf POLIPECAS:3158 172.16.1.28 255.255.255.252 Serial0/1/0.1/1/3/3:0.1 187.28.122.58
ip route vrf POLIPECAS:3158 192.168.14.0 255.255.255.0 Serial0/1/0.1/1/3/3:0.1 187.28.122.58
ip route vrf SET_MA:3377 0.0.0.0 0.0.0.0 Serial1/2/0.1/1/2/3:0 189.43.120.66
ip route vrf SET_MA:3377 192.168.0.0 255.255.255.0 Serial1/2/0.1/1/2/3:0 189.43.120.66
ip route vrf SET_MA:3377 192.168.20.0 255.255.255.0 Serial1/1/0.1/2/3/1:0 189.43.120.78
ip route vrf SET_MA:3377 192.168.60.0 255.255.255.0 Serial0/2/0.1/1/1/3:2 200.249.145.246
ip route vrf SET_MA:3377 192.168.70.0 255.255.255.0 Serial1/1/0.1/1/2/3:0 189.43.120.86
ip route vrf SET_MA:3377 192.168.140.0 255.255.255.0 Serial0/1/0.1/3/2/1:2 189.53.11.42
ip route vrf SUPERMMACIEL:3754 192.168.2.0 255.255.255.0 Multilink1893 189.52.166.234
ip route vrf SUPERMMACIEL:3754 192.168.4.0 255.255.255.0 Multilink400027 189.43.120.190
ip route vrf TRT_NACIONAL:153663 172.20.64.1 255.255.255.255 Serial1/2/0.1/3/1/3:0 172.30.16.118
ip route vrf VESPER-1XRTT:3997 10.185.255.32 255.255.255.252 FastEthernet0/3/7 10.185.137.100
ip flow-export source Loopback1
ip flow-export version 5
ip tacacs source-interface Loopback0
!
ip extcommunity-list 3 permit rt 4230:1545
ip extcommunity-list 4 permit rt 4230:1622
ip extcommunity-list 54 permit rt 4230:154151
ip extcommunity-list 55 permit rt 4230:4794
ip extcommunity-list 56 permit rt 4230:3564
ip extcommunity-list 57 permit rt 4230:154152
ip extcommunity-list 58 permit rt 28513:50172
ip extcommunity-list 59 permit rt 4230:1337
ip extcommunity-list 61 permit rt 4230:1340
ip extcommunity-list 62 permit rt 4230:1956
ip extcommunity-list 71 permit rt 4230:1904
ip extcommunity-list 72 permit rt 4230:1905
ip extcommunity-list 80 permit rt 4230:1663
ip extcommunity-list 81 permit rt 4230:1912
ip extcommunity-list 82 permit rt 4230:4523
ip extcommunity-list 111 permit RT:4230:2908
ip extcommunity-list 112 permit RT:4230:3449
ip extcommunity-list 113 permit RT:4230:1337
ip extcommunity-list 124 permit rt 4230:5288
ip extcommunity-list 125 permit rt 4230:154517
ip extcommunity-list 144 permit rt 4230:5478   
ip extcommunity-list 153 permit rt 4230:4687
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
ip community-list 402 permit 1100:200
ip community-list 404 permit 1100:300
ip community-list 421 permit 65521:121
ip community-list 421 permit 65521:103
ip community-list 421 permit 65521:105
ip community-list 421 permit 65521:107
ip community-list 421 permit 65531:131
ip community-list 421 permit 65531:103
ip community-list 421 permit 65531:107
ip community-list 421 permit 65521:130
ip community-list 431 permit 65524:301
ip community-list 431 permit 65524:302
ip community-list 431 permit 65524:304
ip community-list 431 permit 65524:305
ip community-list 431 permit 65524:312
ip community-list 431 permit 65524:313
ip community-list 431 permit 65524:314
ip community-list 431 permit 65524:315
ip community-list 431 permit 65524:316
ip community-list 431 permit 65524:317
ip community-list 431 permit 65524:318
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
ip community-list 443 permit 65121:313
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
ip community-list standard TINET-BLACKHOLE permit 3257:2666
ip community-list standard INTELIQUENT-BLACKHOLE permit 3257:2666
ip community-list standard TELIASONERA-BLACKHOLE permit 1299:999
ip community-list standard RGSA permit 4230:103
ip community-list standard ALAGOANA permit 4230:102
ip community-list standard TATA-BLACKHOLE permit 64999:0
ip community-list standard BLACKHOLE-PE-NAC-CLIENTE permit 4230:10008
ip community-list standard BLACKHOLE-PE-NAC-EBT permit 4230:10009
ip community-list standard BLACKHOLE-PE-CLIENTE permit 4230:10006
ip community-list standard BLACKHOLE-PE-EBT permit 4230:10007
ip community-list expanded TST10 permit 1024:23
ip community-list expanded TST11 permit 1024:324
ip community-list expanded TST12 permit 1024:323
ip community-list expanded TST13 permit 1024:200
ip community-list expanded ANVISA-VOIP permit 65001:4356
ip community-list expanded ANVISA-GER permit 65001:4357
ip community-list expanded ANTT-VOIP permit 1124:323
ip community-list expanded TST15 permit 1024:24
ip community-list expanded DPRF-VOIP permit 1024:1323
ip community-list expanded DPRF-GERENCIA permit 1024:1001
ip as-path access-list 1 permit ^$
ip as-path access-list 101 permit ^(53128_)+$
ip as-path access-list 102 permit ^(262456_)+$
ip as-path access-list 103 permit ^(262456_)+$
ip as-path access-list 105 permit ^(263026_)+$
ip as-path access-list 106 permit ^(28573_)+$
ip as-path access-list 107 permit ^(263889_)+$
ip ospf name-lookup
ip pim rp-address 10.6.128.3 override
ip pim ssm range 99
ip pim vrf BBRASIL_NAC:7399 rp-address 10.53.128.254 override
ip pim vrf BBRASIL:1588 rp-address 10.6.128.3 override
ip pim vrf BBRASIL_PAE:7041 rp-address 10.6.128.3 override
ip pim vrf CASSI:3904 rp-address 10.255.252.1 override
ip pim vrf FUNASA:3094 rp-address 10.60.7.30 FUNASA_BRASILIA_1 override
ip pim vrf FUNASA:3094 rp-address 10.60.7.40 FUNASA_BRASILIA_2 override
ip pim vrf FUNASA:3094 rp-address 10.60.7.68 FUNASA_RIOBRANCO override
ip pim vrf FUNASA:3094 rp-address 10.60.7.82 FUNASA_MACEIO override
ip pim vrf FUNASA:3094 rp-address 10.60.7.92 FUNASA_MANAUS override
ip pim vrf FUNASA:3094 rp-address 10.60.7.96 FUNASA_MACAPA override
ip pim vrf FUNASA:3094 rp-address 10.60.7.71 FUNASA_SALVADOR override
ip pim vrf FUNASA:3094 rp-address 10.60.7.85 FUNASA_FORTALEZA override
ip pim vrf FUNASA:3094 rp-address 10.60.7.27 FUNASA_VITORIA override
ip pim vrf FUNASA:3094 rp-address 10.60.7.62 FUNASA_GOIANIA override
ip pim vrf FUNASA:3094 rp-address 10.60.7.98 FUNASA_SAOLUIZ override
ip pim vrf FUNASA:3094 rp-address 10.60.7.31 FUNASA_BELOHORIZONTE override
ip pim vrf FUNASA:3094 rp-address 10.60.7.65 FUNASA_CUIABA override
ip pim vrf FUNASA:3094 rp-address 10.60.7.67 FUNASA_CAMPOGRANDE override
ip pim vrf FUNASA:3094 rp-address 10.60.7.91 FUNASA_BELEM override
ip pim vrf FUNASA:3094 rp-address 10.60.7.83 FUNASA_JOAOPESSOA override
ip pim vrf FUNASA:3094 rp-address 10.60.7.81 FUNASA_RECIFE override
ip pim vrf FUNASA:3094 rp-address 10.60.7.86 FUNASA_TERESINA override
ip pim vrf FUNASA:3094 rp-address 10.60.7.41 FUNASA_CURITIBA override
ip pim vrf FUNASA:3094 rp-address 10.60.7.21 FUNASA_RIODEJANEIRO override
ip pim vrf FUNASA:3094 rp-address 10.60.7.84 FUNASA_NATAL override
ip pim vrf FUNASA:3094 rp-address 10.60.7.69 FUNASA_PORTOVELHO override
ip pim vrf FUNASA:3094 rp-address 10.60.7.95 FUNASA_BOAVISTA override
ip pim vrf FUNASA:3094 rp-address 10.60.7.51 FUNASA_PORTOALEGRE override
ip pim vrf FUNASA:3094 rp-address 10.60.7.48 FUNASA_FLORIANOPOLIS override
ip pim vrf FUNASA:3094 rp-address 10.60.7.79 FUNASA_ARACAJU override
ip pim vrf FUNASA:3094 rp-address 10.60.7.11 FUNASA_SAOPAULO override
ip pim vrf FUNASA:3094 rp-address 10.60.7.63 FUNASA_PALMAS override
ip pim vrf MPF_NOVA:6114 rp-address 192.168.253.1 override
!
!
ip prefix-list ABNAMRO_DEFAULT seq 5 permit 10.0.0.0/8
!
ip prefix-list ANULA_DEFAULT seq 5 permit 0.0.0.0/0 ge 1
!
ip prefix-list COND_LOOP seq 10 permit 200.244.41.1/32
!
ip prefix-list POUPEX-BGP-OSPF seq 5 permit 0.0.0.0/0 ge 32
!
ip prefix-list REDE_IMIFARMA seq 5 permit 0.0.0.0/0 le 32
!
ip prefix-list REDE_SERMA seq 5 permit 0.0.0.0/0
ip prefix-list REDE_SERMA seq 10 permit 172.31.5.250/32
!
ip prefix-list REPUBLICAONLINE seq 5 permit 189.16.241.208/28 le 32
ip prefix-list REPUBLICAONLINE seq 10 deny 0.0.0.0/0 le 32
!
ip prefix-list ROTA_DEFAULT seq 5 permit 0.0.0.0/0
!
ip prefix-list SAM_DADOS seq 5 permit 189.88.240.0/20 le 32
ip prefix-list SAM_DADOS seq 10 deny 0.0.0.0/0 le 32
!
ip access-list standard BLOCK-OUT-VRF
  deny   172.20.0.0 0.0.255.255
  permit any
ip access-list standard FUNASA_ARACAJU
  permit 239.26.0.1
ip access-list standard FUNASA_BELEM
  permit 239.15.0.1
ip access-list standard FUNASA_BELOHORIZONTE
  permit 239.12.0.1
ip access-list standard FUNASA_BOAVISTA
  permit 239.23.0.1
ip access-list standard FUNASA_BRASILIA_1
  permit 239.1.0.1
ip access-list standard FUNASA_BRASILIA_2
  permit 239.2.0.1
ip access-list standard FUNASA_CAMPOGRANDE
  permit 239.14.0.1
ip access-list standard FUNASA_CUIABA
  permit 239.13.0.1
ip access-list standard FUNASA_CURITIBA
  permit 239.19.0.1
ip access-list standard FUNASA_FLORIANOPOLIS
  permit 239.25.0.1
ip access-list standard FUNASA_FORTALEZA
  permit 239.8.0.1
ip access-list standard FUNASA_GOIANIA
  permit 239.10.0.1
ip access-list standard FUNASA_JOAOPESSOA
  permit 239.16.0.1
ip access-list standard FUNASA_MACAPA
  permit 239.6.0.1
ip access-list standard FUNASA_MACEIO
  permit 239.4.0.1
ip access-list standard FUNASA_MANAUS
  permit 239.5.0.1
ip access-list standard FUNASA_NATAL
  permit 239.21.0.1
ip access-list standard FUNASA_PALMAS
  permit 239.28.0.1
ip access-list standard FUNASA_PORTOALEGRE
  permit 239.24.0.1
ip access-list standard FUNASA_PORTOVELHO
  permit 239.22.0.1
ip access-list standard FUNASA_RECIFE
  permit 239.17.0.1
ip access-list standard FUNASA_RIOBRANCO
  permit 239.3.0.1
ip access-list standard FUNASA_RIODEJANEIRO
  permit 239.20.0.1
ip access-list standard FUNASA_SALVADOR
  permit 239.7.0.1
ip access-list standard FUNASA_SAOLUIZ
  permit 239.11.0.1
ip access-list standard FUNASA_SAOPAULO
  permit 239.27.0.1
ip access-list standard FUNASA_TERESINA
  permit 239.18.0.1
ip access-list standard FUNASA_VITORIA
  permit 239.9.0.1
ip access-list standard GROUP-CORREIOS_LOTE1
ip access-list standard GROUP-CORREIOS_LOTE2
  permit 239.0.0.0 0.255.255.255
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
 permit tcp host 200.214.41.124 any range 22 telnet
 permit tcp host 64.104.3.161 any range 22 telnet
 permit tcp host 64.104.196.21 any range 22 telnet
 permit tcp host 173.38.244.216 any range 22 telnet
 permit tcp host 173.38.245.16 any range 22 telnet
 permit tcp host 200.255.220.21 any range 22 telnet
 permit tcp host 200.255.220.22 any range 22 telnet
 permit tcp 200.179.210.0 0.0.0.255 any range 22 telnet
 permit tcp 200.255.125.0 0.0.0.255 any range 22 telnet
 permit tcp 200.255.160.0 0.0.0.255 any range 22 telnet
 permit tcp 200.255.218.192 0.0.0.63 any range 22 telnet
 permit tcp 200.255.253.0 0.0.0.255 any range 22 telnet
 permit tcp 200.255.255.64 0.0.0.63 any range 22 telnet
 permit tcp 200.245.255.0 0.0.0.255 any range 22 telnet
 permit tcp 200.255.122.0 0.0.0.31 any range 22 telnet
 permit tcp 200.230.5.0 0.0.0.255 any range 22 telnet
 permit tcp 200.244.11.0 0.0.0.255 any range 22 telnet
 permit tcp 200.230.5.0 0.0.0.255 range 22 telnet any
 permit tcp 200.244.11.0 0.0.0.255 range 22 telnet any
 permit tcp 200.230.9.0 0.0.0.255 any range 22 telnet
 permit tcp 200.244.9.0 0.0.0.255 any range 22 telnet
 permit tcp 200.244.110.0 0.0.1.255 any range 22 telnet
 permit tcp 200.230.9.0 0.0.0.255 range 22 telnet any
 permit tcp 200.244.9.0 0.0.0.255 range 22 telnet any
 permit tcp 200.244.110.0 0.0.1.255 range 22 telnet any
 permit tcp 200.230.91.0 0.0.0.255 any range 22 telnet
 permit tcp 200.230.92.0 0.0.0.255 any range 22 telnet
 permit tcp 200.230.91.0 0.0.0.255 range 22 telnet any
 permit tcp 200.230.92.0 0.0.0.255 range 22 telnet any
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
 deny   ip any 200.230.5.0 0.0.0.255
 deny   ip any 200.244.11.0 0.0.0.255
 deny   ip 200.230.5.0 0.0.0.255 any
 deny   ip 200.244.11.0 0.0.0.255 any
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
 deny   ip any 200.230.91.0 0.0.0.255
 deny   ip any 200.230.92.0 0.0.0.255
 deny   ip 200.230.91.0 0.0.0.255 any
 deny   ip 200.230.92.0 0.0.0.255 any
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
 deny   ip any 200.230.44.0 0.0.1.255
 deny   ip any 200.230.46.0 0.0.0.255
 deny   ip any 200.244.192.0 0.0.1.255
 deny   ip any 200.244.194.0 0.0.0.255
 deny   ip 200.230.44.0 0.0.1.255 any
 deny   ip 200.230.46.0 0.0.0.255 any
 deny   ip 200.244.192.0 0.0.1.255 any
 deny   ip 200.244.194.0 0.0.0.255 any
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
ip sla responder
!
map-class frame-relay QC_AF_2048K_13_N_37_21_0_0_2_26_0B
 service-policy input QPI_A_2048K_13_N_37_21_0_0_2_26
 service-policy output QPO_A_2048K_13_37_21_0_0_2_26
!
map-class frame-relay QC_MCI_ETM_512K_64K_448K_GSR32_V1
 service-policy input QPI_MCI_ETM_512K_64K_448K_GSR32_V1
 service-policy output QDO_MCI_ETM_512K_64K_448K_GSR32_V1
!
map-class frame-relay QC_AF_1024K_13_N_0_25_0_0_2_55_0B
 service-policy input QPI_A_1024K_13_N_0_25_0_0_2_55
 service-policy output QPO_A_1024K_13_0_25_0_0_2_55
!
map-class frame-relay QC_AF_512K_13_N_0_41_18_13_4_10_512B
 frame-relay fragment 512
 service-policy input QPI_A_512K_13_N_0_41_18_13_4_10
 service-policy output QPO_A_512K_13_0_41_18_13_4_10
!
map-class frame-relay QC_AF_256K_13_N_0_4_0_0_7_75_256B
 frame-relay fragment 256
 service-policy input QPI_A_256K_13_N_0_4_0_0_7_75
 service-policy output QPO_A_256K_13_0_4_0_0_7_75
!
map-class frame-relay QC_AF_1024K_25_N_0_40_0_0_2_31_0B
 service-policy input QPI_A_1024K_25_N_0_40_0_0_2_31
 service-policy output QPO_A_1024K_25_0_40_0_0_2_31
!
map-class frame-relay QC_AF_512K_10_N_30_35_0_0_4_20_512B
 frame-relay fragment 512
 service-policy input QPI_A_512K_10_N_30_35_0_0_4_20
 service-policy output QPO_A_512K_10_30_35_0_0_4_20
!
map-class frame-relay QC_BBONE_EXP_V1
 service-policy input QPI_BBONE_EXP_V1
!
map-class frame-relay QC_AF_256K_19_N_0_59_0_0_7_11_256B
 frame-relay fragment 256
 service-policy input QPI_A_256K_19_N_0_59_0_0_7_11
 service-policy output QPO_A_256K_19_0_59_0_0_7_11
!
map-class frame-relay QC_64_0_0_40_8_0_0_0B_A_V1
 service-policy input QPI_64_0_0_40_8_0_0_0B_A_V1
 service-policy output QDO_64_0_0_40_8_0_0_0B_A_V1
!
map-class frame-relay QC_AF_1024K_25_N_0_40_0_0_2_32_0B
 service-policy input QPI_A_1024K_25_N_0_40_0_0_2_32
 service-policy output QPO_A_1024K_25_0_40_0_0_2_32
!
map-class frame-relay QC_64K_BBrasil_PAE_IOS_V1
 frame-relay fragment 128
 service-policy input QDI_64K_BBrasil_PAE_IOS_V1
 service-policy output QDO_64K_BBrasil_PAE_IOS_V1
!
map-class frame-relay QOS_CLASS_A_F_128K_64K_32K_66K_128B
 frame-relay fragment 128
 service-policy input QOS_POLICY_IN_A_50P_51P
 service-policy output QOS_POLICY_OUT_A_25P_51P
!
map-class frame-relay QOS_CLASS_A_F_512K_64K_64K_400K_512B
 frame-relay fragment 512
 service-policy input QOS_POLICY_IN_A_13P_78P
 service-policy output QOS_POLICY_OUT_A_13P_78P
!
map-class frame-relay QC_AF_512K_25_N_0_2_0_0_4_68_512B
 service-policy input QPI_A_512K_25_N_0_2_0_0_4_68
 service-policy output QPO_A_512K_25_0_2_0_0_4_68
!
map-class frame-relay QC_AF_256K_39_N_0_7_0_0_7_46_256B
 frame-relay fragment 256
 service-policy input QPI_A_256K_39_N_0_7_0_0_7_46
 service-policy output QPO_A_256K_39_0_7_0_0_7_46
!
map-class frame-relay QC_AF_256K_22_N_0_50_0_0_7_19_0B
 service-policy input QPI_A_256K_22_N_0_50_0_0_7_19
 service-policy output QPO_A_256K_22_0_50_0_0_7_19
!
map-class frame-relay QC_AF_256K_10_N_0_60_13_0_7_9_256B
 frame-relay fragment 256
 service-policy input QPI_A_256K_10_N_0_60_13_0_7_9
 service-policy output QPO_A_256K_10_0_60_13_0_7_9
!
map-class frame-relay QC_AF_1024K_30_N_20_19_0_0_2_28_0B
 service-policy input QPI_A_1024K_30_N_20_19_0_0_2_28
 service-policy output QPO_A_1024K_30_20_19_0_0_2_28
!
map-class frame-relay QC_AF_2048K_6_N_0_49_0_0_1_43_0B
 service-policy input QPI_A_2048K_6_N_0_49_0_0_1_43
 service-policy output QPO_A_2048K_6_0_49_0_0_1_43
!
map-class frame-relay QC_AF_1024K_5_N_45_0_0_0_2_47_0B
 service-policy input QPI_A_1024K_5_N_45_0_0_0_2_47
 service-policy output QPO_A_1024K_5_45_0_0_0_2_47
!
map-class frame-relay QC_AF_1024K_12_N_0_50_13_0_2_22_0B
 service-policy input QPI_A_1024K_12_N_0_50_13_0_2_22
 service-policy output QPO_A_1024K_12_0_50_13_0_2_22
!
map-class frame-relay FR-MC-ZERA-EXP-SAIDA
 service-policy input ZERA-EXP-Saida
!
map-class frame-relay QC_BBONE_S_8192_V1
 service-policy input QPI_BBONE_S_8192_V1
 service-policy output QPO_BBONE_8192_V1
!
map-class frame-relay QC_BBONE_S_20000_V1
 service-policy input QPI_BBONE_S_20000_V1
 service-policy output QPO_BBONE_20000_V1
!
map-class frame-relay QC_BBONE_S_2048_V1
 service-policy input QPI_BBONE_S_2048_V1
 service-policy output QPO_BBONE_2048_V1
!
map-class frame-relay QC_BBONE_S_4096_V1
 service-policy input QPI_BBONE_S_4096_V1
 service-policy output QPO_BBONE_4096_V1
!
map-class frame-relay QC_BBONE_N_512_V1
 service-policy input QPI_BBONE_N_512_V1
 service-policy output QPO_BBONE_512_V1
!
map-class frame-relay QC_BBONE_S_68000_V1
 service-policy input QPI_BBONE_S_68000_V1
 service-policy output QPO_BBONE_68000_V1
!
map-class frame-relay OMEGA
 service-policy input WAN_IN_OMEGA_TER
 service-policy output WAN_OUT_OMEGA_TER
!
map-class frame-relay QC_AF_2048K_0_N_0_20_9_0_6_54_0B
 service-policy input QPI_A_2048K_0_N_0_20_9_0_6_54
 service-policy output QPO_A_2048K_0_0_20_9_0_6_54
!
map-class frame-relay QC_1024K_BBrasil_NAC_GACC_V1
 service-policy input QDI_1024K_BBrasil_NAC_GACC_V1
 service-policy output QDO_1024K_BBrasil_NAC_GACC_V1
!
map-class frame-relay QC_512K_BBrasil_NAC_GACC_V1
 service-policy input QDI_512K_BBrasil_NAC_GACC_V1
 service-policy output QDO_512K_BBrasil_NAC_GACC_V1
!
map-class frame-relay QC_AF_2048K_0_N_23_0_0_0_2_74_0B
 service-policy input QPI_A_2048K_0_N_23_0_0_0_2_74
 service-policy output QPO_A_2048K_0_23_0_0_0_2_74
!
map-class frame-relay QC_AF_2048K_13_N_38_23_0_0_2_23_0B
 service-policy input QPI_A_2048K_13_N_38_23_0_0_2_23
 service-policy output QPO_A_2048K_13_38_23_0_0_2_23
!
map-class frame-relay QC_AF_1024K_30_N_20_20_0_0_2_27_0B
 service-policy input QPI_A_1024K_30_N_20_20_0_0_2_27
 service-policy output QPO_A_1024K_30_20_20_0_0_2_27
!
map-class frame-relay QC_BBONE_N_256_V1
 service-policy input QPI_BBONE_N_256_V1
 service-policy output QPO_BBONE_256_V1
logging linecard 16384
logging linecard informational
logging sequence-nums
logging trap debugging
logging source-interface Loopback0
logging 200.255.125.217
logging 200.255.125.218
access-list compiled
access-list 1 deny   0.0.0.0
access-list 1 deny   10.0.0.0 0.255.255.255
access-list 1 deny   172.16.0.0 0.15.255.255
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
access-list 11 permit 200.255.253.250
access-list 11 permit 200.255.125.20
access-list 11 permit 200.255.125.56
access-list 11 permit 200.255.125.60
access-list 11 permit 200.255.125.219
access-list 11 permit 200.255.253.31
access-list 12 permit 200.214.41.124
access-list 12 permit 173.38.245.16
access-list 12 permit 171.68.46.188
access-list 12 permit 64.104.3.161
access-list 12 permit 200.255.255.67
access-list 12 permit 173.38.244.216
access-list 12 permit 173.38.244.214
access-list 12 permit 173.38.244.213
access-list 12 permit 173.38.244.212
access-list 12 permit 173.38.244.211
access-list 12 permit 64.100.32.216
access-list 12 permit 64.104.196.21
access-list 12 permit 200.255.220.22
access-list 12 permit 200.255.220.21
access-list 12 permit 200.255.125.0 0.0.0.255
access-list 12 permit 200.255.253.0 0.0.0.255
access-list 12 permit 200.255.254.0 0.0.0.255
access-list 12 permit 200.255.160.0 0.0.0.255
access-list 12 permit 200.179.210.0 0.0.0.255
access-list 12 permit 200.255.218.192 0.0.0.63
access-list 12 permit 200.245.255.0 0.0.0.255
access-list 12 permit 200.255.122.0 0.0.0.31
access-list 12 permit 200.230.5.0 0.0.0.255
access-list 12 permit 200.244.11.0 0.0.0.255
access-list 12 permit 200.230.9.0 0.0.0.255
access-list 12 permit 200.244.9.0 0.0.0.255
access-list 12 permit 200.244.110.0 0.0.1.255
access-list 12 permit 200.230.91.0 0.0.0.255
access-list 12 permit 200.230.92.0 0.0.0.255
access-list 12 permit 200.230.16.0 0.0.1.255
access-list 12 permit 200.230.224.0 0.0.0.255
access-list 12 permit 200.230.248.0 0.0.1.255
access-list 12 permit 200.244.17.0 0.0.0.255
access-list 12 permit 200.244.27.0 0.0.0.255
access-list 12 permit 200.244.28.0 0.0.1.255
access-list 12 permit 200.244.41.0 0.0.0.255
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
access-list 13 permit 200.214.41.124
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
access-list 13 permit 200.230.5.0 0.0.0.255
access-list 13 permit 200.244.11.0 0.0.0.255
access-list 13 permit 200.230.9.0 0.0.0.255
access-list 13 permit 200.244.9.0 0.0.0.255
access-list 13 permit 200.244.110.0 0.0.1.255
access-list 13 permit 201.65.190.32 0.0.0.31
access-list 14 permit 200.255.125.20
access-list 14 permit 200.255.253.31
access-list 15 permit 0.0.0.0
access-list 51 deny   200.218.65.32 0.0.0.31
access-list 51 deny   200.218.64.160 0.0.0.15
access-list 51 permit any
access-list 99 permit 239.232.0.0 0.0.255.255
access-list 99 permit 239.233.0.0 0.0.255.255
access-list 2300 deny   tcp host 200.150.171.76 host 200.167.67.130
access-list 2300 permit ip any any
access-list 2301 permit tcp host 189.43.17.82 host 200.249.144.71 eq www
access-list 2301 permit ip any any
access-list 2550 deny   ip host 0.0.0.0 host 255.255.255.255
access-list 2550 deny   ip 10.0.0.0 0.255.255.255 any
access-list 2550 deny   ip 172.16.0.0 0.15.255.255 any
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
access-list 2550 deny   ip 201.30.0.0 0.0.255.255 host 255.255.0.0
access-list 2550 deny   ip 201.31.0.0 0.0.255.255 host 255.255.0.0
access-list 2550 deny   ip 201.38.0.0 0.0.255.255 host 255.255.0.0
access-list 2550 deny   ip 201.39.0.0 0.0.255.255 host 255.255.0.0
access-list 2550 deny   ip 201.44.0.0 0.0.255.255 host 255.255.0.0
access-list 2550 deny   ip 201.45.0.0 0.0.255.255 host 255.255.0.0
access-list 2550 deny   ip 201.56.0.0 0.0.255.255 host 255.255.0.0
access-list 2550 deny   ip 201.57.0.0 0.0.255.255 host 255.255.0.0
access-list 2550 deny   ip 201.64.0.0 0.0.255.255 host 255.255.0.0
access-list 2550 deny   ip 201.65.0.0 0.0.255.255 host 255.255.0.0
access-list 2550 deny   ip 201.72.0.0 0.0.255.255 host 255.255.0.0
access-list 2550 deny   ip 201.73.0.0 0.0.255.255 host 255.255.0.0
access-list 2550 deny   ip 201.90.0.0 0.0.255.255 host 255.255.0.0
access-list 2550 permit ip any any
access-list 2598 deny   tcp any any fragments
access-list 2598 deny   udp any any fragments
access-list 2598 permit icmp any any ttl-exceeded
access-list 2598 permit icmp any any traceroute
access-list 2598 permit icmp any any port-unreachable
access-list 2598 permit icmp any any echo-reply
access-list 2598 permit icmp any any echo
access-list 2598 permit icmp any any packet-too-big
access-list 2598 permit gre any any
access-list 2598 permit tcp 200.230.7.0 0.0.0.255 any eq bgp
access-list 2598 permit tcp 200.230.9.0 0.0.0.255 any eq bgp
access-list 2598 permit tcp 200.244.7.0 0.0.0.255 any eq bgp
access-list 2598 permit tcp 200.244.9.0 0.0.0.255 any eq bgp
access-list 2598 permit tcp 200.244.110.0 0.0.1.255 any eq bgp
access-list 2598 permit tcp 200.230.7.0 0.0.0.255 eq bgp any
access-list 2598 permit tcp 200.230.9.0 0.0.0.255 eq bgp any
access-list 2598 permit tcp 200.244.7.0 0.0.0.255 eq bgp any
access-list 2598 permit tcp 200.244.9.0 0.0.0.255 eq bgp any
access-list 2598 permit tcp 200.244.110.0 0.0.1.255 eq bgp any
access-list 2598 permit tcp 200.230.91.0 0.0.0.255 any eq bgp
access-list 2598 permit tcp 200.230.92.0 0.0.0.255 any eq bgp
access-list 2598 permit tcp 200.230.91.0 0.0.0.255 eq bgp any
access-list 2598 permit tcp 200.230.92.0 0.0.0.255 eq bgp any
access-list 2598 permit tcp 200.230.16.0 0.0.1.255 any eq bgp
access-list 2598 permit tcp 200.230.224.0 0.0.0.255 any eq bgp
access-list 2598 permit tcp 200.230.248.0 0.0.1.255 any eq bgp
access-list 2598 permit tcp 200.244.17.0 0.0.0.255 any eq bgp
access-list 2598 permit tcp 200.244.27.0 0.0.0.255 any eq bgp
access-list 2598 permit tcp 200.244.28.0 0.0.1.255 any eq bgp
access-list 2598 permit tcp 200.244.41.0 0.0.0.255 any eq bgp
access-list 2598 permit tcp 200.230.16.0 0.0.1.255 eq bgp any
access-list 2598 permit tcp 200.230.224.0 0.0.0.255 eq bgp any
access-list 2598 permit tcp 200.230.248.0 0.0.1.255 eq bgp any
access-list 2598 permit tcp 200.244.17.0 0.0.0.255 eq bgp any
access-list 2598 permit tcp 200.244.27.0 0.0.0.255 eq bgp any
access-list 2598 permit tcp 200.244.28.0 0.0.1.255 eq bgp any
access-list 2598 permit tcp 200.244.41.0 0.0.0.255 eq bgp any
access-list 2598 permit tcp 200.230.44.0 0.0.1.255 any eq bgp
access-list 2598 permit tcp 200.230.46.0 0.0.0.255 any eq bgp
access-list 2598 permit tcp 200.244.192.0 0.0.1.255 any eq bgp
access-list 2598 permit tcp 200.244.194.0 0.0.0.255 any eq bgp
access-list 2598 permit tcp 200.230.44.0 0.0.1.255 eq bgp any
access-list 2598 permit tcp 200.230.46.0 0.0.0.255 eq bgp any
access-list 2598 permit tcp 200.244.192.0 0.0.1.255 eq bgp any
access-list 2598 permit tcp 200.244.194.0 0.0.0.255 eq bgp any
access-list 2598 permit tcp 200.244.150.0 0.0.0.255 any eq bgp
access-list 2598 permit tcp 200.244.162.0 0.0.0.255 any eq bgp
access-list 2598 permit tcp 200.244.164.0 0.0.1.255 any eq bgp
access-list 2598 permit tcp 200.244.150.0 0.0.0.255 eq bgp any
access-list 2598 permit tcp 200.244.162.0 0.0.0.255 eq bgp any
access-list 2598 permit tcp 200.244.164.0 0.0.1.255 eq bgp any
access-list 2598 permit tcp 201.65.190.32 0.0.0.31 any eq bgp
access-list 2598 permit tcp 201.65.190.32 0.0.0.31 eq bgp any
access-list 2598 permit ospf 200.244.0.0 0.0.255.255 any
access-list 2598 permit ospf 200.230.0.0 0.0.255.255 any
access-list 2598 permit udp 200.244.0.0 0.0.255.255 any eq 646
access-list 2598 permit udp 200.230.0.0 0.0.255.255 any eq 646
access-list 2598 permit tcp 200.230.16.0 0.0.1.255 any eq 646
access-list 2598 permit tcp 200.230.224.0 0.0.0.255 any eq 646
access-list 2598 permit tcp 200.230.248.0 0.0.1.255 any eq 646
access-list 2598 permit tcp 200.230.16.0 0.0.1.255 eq 646 any
access-list 2598 permit tcp 200.230.224.0 0.0.0.255 eq 646 any
access-list 2598 permit tcp 200.230.248.0 0.0.1.255 eq 646 any
access-list 2598 permit tcp 200.244.17.0 0.0.0.255 any eq 646
access-list 2598 permit tcp 200.244.27.0 0.0.0.255 any eq 646
access-list 2598 permit tcp 200.244.28.0 0.0.1.255 any eq 646
access-list 2598 permit tcp 200.244.41.0 0.0.0.255 any eq 646
access-list 2598 permit tcp 200.244.17.0 0.0.0.255 eq 646 any
access-list 2598 permit tcp 200.244.27.0 0.0.0.255 eq 646 any
access-list 2598 permit tcp 200.244.28.0 0.0.1.255 eq 646 any
access-list 2598 permit tcp 200.244.41.0 0.0.0.255 eq 646 any
access-list 2598 permit tcp 200.230.44.0 0.0.1.255 any eq 646
access-list 2598 permit tcp 200.230.46.0 0.0.0.255 any eq 646
access-list 2598 permit tcp 200.244.192.0 0.0.1.255 any eq 646
access-list 2598 permit tcp 200.244.194.0 0.0.0.255 any eq 646
access-list 2598 permit tcp 200.230.44.0 0.0.1.255 eq 646 any
access-list 2598 permit tcp 200.230.46.0 0.0.0.255 eq 646 any
access-list 2598 permit tcp 200.244.192.0 0.0.1.255 eq 646 any
access-list 2598 permit tcp 200.244.194.0 0.0.0.255 eq 646 any
access-list 2598 permit tcp 200.230.92.0 0.0.0.255 any eq 646
access-list 2598 permit tcp 200.230.92.0 0.0.0.255 eq 646 any
access-list 2598 permit udp 201.125.236.32 0.0.0.31 any eq 646
access-list 2598 permit udp 201.125.237.240 0.0.0.3 any eq 646
access-list 2598 permit udp 201.125.236.32 0.0.0.31 eq 646 any
access-list 2598 permit udp 201.125.237.240 0.0.0.3 eq 646 any
access-list 2598 permit tcp host 201.125.195.243 eq 646 any
access-list 2598 permit tcp host 201.125.195.241 eq 646 any
access-list 2598 permit tcp host 201.125.195.243 any eq 646
access-list 2598 permit tcp host 201.125.195.241 any eq 646
access-list 2598 permit 46 200.230.0.0 0.0.255.255 any
access-list 2598 permit 46 200.244.0.0 0.0.255.255 any
access-list 2598 permit udp any any eq 3784
access-list 2598 permit pim 200.244.0.0 0.0.255.255 any
access-list 2598 permit pim 200.230.0.0 0.0.255.255 any
access-list 2598 deny   icmp any any fragments
access-list 2598 deny   ip any any fragments
access-list 2598 permit tcp host 200.214.41.124 any range 22 telnet
access-list 2598 permit tcp host 64.104.3.161 any range 22 telnet
access-list 2598 permit tcp host 64.104.196.21 any range 22 telnet
access-list 2598 permit tcp host 173.38.244.216 any range 22 telnet
access-list 2598 permit tcp host 173.38.245.16 any range 22 telnet
access-list 2598 permit tcp host 200.255.220.22 any range 22 telnet
access-list 2598 permit tcp host 200.255.220.21 any range 22 telnet
access-list 2598 permit tcp 200.255.125.0 0.0.0.255 any range 22 telnet
access-list 2598 permit tcp 200.255.253.0 0.0.0.255 any range 22 telnet
access-list 2598 permit tcp 200.255.254.0 0.0.0.255 any range 22 telnet
access-list 2598 permit tcp 200.255.160.0 0.0.0.255 any range 22 telnet
access-list 2598 permit tcp 200.179.210.0 0.0.0.255 any range 22 telnet
access-list 2598 permit tcp 200.255.218.192 0.0.0.63 any range 22 telnet
access-list 2598 permit tcp 200.245.255.0 0.0.0.255 any range 22 telnet
access-list 2598 permit tcp 200.255.122.0 0.0.0.31 any range 22 telnet
access-list 2598 permit tcp host 200.255.255.67 any range 22 telnet
access-list 2598 permit tcp 200.230.5.0 0.0.0.255 any range 22 telnet
access-list 2598 permit tcp 200.244.11.0 0.0.0.255 any range 22 telnet
access-list 2598 permit tcp 200.230.9.0 0.0.0.255 any range 22 telnet
access-list 2598 permit tcp 200.244.9.0 0.0.0.255 any range 22 telnet
access-list 2598 permit tcp 200.244.110.0 0.0.1.255 any range 22 telnet
access-list 2598 permit tcp 200.230.9.0 0.0.0.255 range 22 telnet any
access-list 2598 permit tcp 200.244.9.0 0.0.0.255 range 22 telnet any
access-list 2598 permit tcp 200.244.110.0 0.0.1.255 range 22 telnet any
access-list 2598 permit tcp 200.230.91.0 0.0.0.255 any range 22 telnet
access-list 2598 permit tcp 200.230.92.0 0.0.0.255 any range 22 telnet
access-list 2598 permit tcp 200.230.91.0 0.0.0.255 range 22 telnet any
access-list 2598 permit tcp 200.230.92.0 0.0.0.255 range 22 telnet any
access-list 2598 permit tcp 200.230.16.0 0.0.1.255 any range 22 telnet
access-list 2598 permit tcp 200.230.224.0 0.0.0.255 any range 22 telnet
access-list 2598 permit tcp 200.230.248.0 0.0.1.255 any range 22 telnet
access-list 2598 permit tcp 200.244.17.0 0.0.0.255 any range 22 telnet
access-list 2598 permit tcp 200.244.27.0 0.0.0.255 any range 22 telnet
access-list 2598 permit tcp 200.244.28.0 0.0.1.255 any range 22 telnet
access-list 2598 permit tcp 200.244.41.0 0.0.0.255 any range 22 telnet
access-list 2598 permit tcp 200.230.16.0 0.0.1.255 range 22 telnet any
access-list 2598 permit tcp 200.230.224.0 0.0.0.255 range 22 telnet any
access-list 2598 permit tcp 200.230.248.0 0.0.1.255 range 22 telnet any
access-list 2598 permit tcp 200.244.17.0 0.0.0.255 range 22 telnet any
access-list 2598 permit tcp 200.244.27.0 0.0.0.255 range 22 telnet any
access-list 2598 permit tcp 200.244.28.0 0.0.1.255 range 22 telnet any
access-list 2598 permit tcp 200.244.41.0 0.0.0.255 range 22 telnet any
access-list 2598 permit tcp 200.230.0.0 0.0.3.255 any range 22 telnet
access-list 2598 permit tcp 200.230.4.0 0.0.0.255 any range 22 telnet
access-list 2598 permit tcp 200.230.21.0 0.0.0.255 any range 22 telnet
access-list 2598 permit tcp 200.230.24.0 0.0.1.255 any range 22 telnet
access-list 2598 permit tcp 200.230.26.0 0.0.0.255 any range 22 telnet
access-list 2598 permit tcp 200.230.28.0 0.0.1.255 any range 22 telnet
access-list 2598 permit tcp 200.230.130.0 0.0.1.255 any range 22 telnet
access-list 2598 permit tcp 200.230.140.0 0.0.1.255 any range 22 telnet
access-list 2598 permit tcp 200.230.151.0 0.0.0.255 any range 22 telnet
access-list 2598 permit tcp 200.230.156.0 0.0.0.255 any range 22 telnet
access-list 2598 permit tcp 200.230.158.0 0.0.1.255 any range 22 telnet
access-list 2598 permit tcp 200.230.162.0 0.0.0.255 any range 22 telnet
access-list 2598 permit tcp 200.230.211.0 0.0.0.255 any range 22 telnet
access-list 2598 permit tcp 200.230.212.0 0.0.3.255 any range 22 telnet
access-list 2598 permit tcp 200.230.216.0 0.0.0.255 any range 22 telnet
access-list 2598 permit tcp 200.230.218.0 0.0.1.255 any range 22 telnet
access-list 2598 permit tcp 200.230.220.0 0.0.1.255 any range 22 telnet
access-list 2598 permit tcp 200.230.228.0 0.0.3.255 any range 22 telnet
access-list 2598 permit tcp 200.230.232.0 0.0.3.255 any range 22 telnet
access-list 2598 permit tcp 200.230.234.0 0.0.1.255 any range 22 telnet
access-list 2598 permit tcp 200.230.241.0 0.0.0.255 any range 22 telnet
access-list 2598 permit tcp 200.230.242.0 0.0.1.255 any range 22 telnet
access-list 2598 permit tcp 200.230.244.0 0.0.3.255 any range 22 telnet
access-list 2598 permit tcp 200.230.251.0 0.0.0.255 any range 22 telnet
access-list 2598 permit tcp 200.230.252.0 0.0.3.255 any range 22 telnet
access-list 2598 permit tcp 200.230.0.0 0.0.3.255 range 22 telnet any
access-list 2598 permit tcp 200.230.4.0 0.0.0.255 range 22 telnet any
access-list 2598 permit tcp 200.230.21.0 0.0.0.255 range 22 telnet any
access-list 2598 permit tcp 200.230.24.0 0.0.1.255 range 22 telnet any
access-list 2598 permit tcp 200.230.26.0 0.0.0.255 range 22 telnet any
access-list 2598 permit tcp 200.230.28.0 0.0.1.255 range 22 telnet any
access-list 2598 permit tcp 200.230.130.0 0.0.1.255 range 22 telnet any
access-list 2598 permit tcp 200.230.140.0 0.0.1.255 range 22 telnet any
access-list 2598 permit tcp 200.230.151.0 0.0.0.255 range 22 telnet any
access-list 2598 permit tcp 200.230.156.0 0.0.0.255 range 22 telnet any
access-list 2598 permit tcp 200.230.158.0 0.0.1.255 range 22 telnet any
access-list 2598 permit tcp 200.230.162.0 0.0.0.255 range 22 telnet any
access-list 2598 permit tcp 200.230.211.0 0.0.0.255 range 22 telnet any
access-list 2598 permit tcp 200.230.212.0 0.0.3.255 range 22 telnet any
access-list 2598 permit tcp 200.230.216.0 0.0.0.255 range 22 telnet any
access-list 2598 permit tcp 200.230.218.0 0.0.1.255 range 22 telnet any
access-list 2598 permit tcp 200.230.220.0 0.0.1.255 range 22 telnet any
access-list 2598 permit tcp 200.230.228.0 0.0.3.255 range 22 telnet any
access-list 2598 permit tcp 200.230.232.0 0.0.3.255 range 22 telnet any
access-list 2598 permit tcp 200.230.234.0 0.0.1.255 range 22 telnet any
access-list 2598 permit tcp 200.230.241.0 0.0.0.255 range 22 telnet any
access-list 2598 permit tcp 200.230.242.0 0.0.1.255 range 22 telnet any
access-list 2598 permit tcp 200.230.244.0 0.0.3.255 range 22 telnet any
access-list 2598 permit tcp 200.230.251.0 0.0.0.255 range 22 telnet any
access-list 2598 permit tcp 200.230.252.0 0.0.3.255 range 22 telnet any
access-list 2598 permit tcp 200.244.1.0 0.0.0.255 any range 22 telnet
access-list 2598 permit tcp 200.244.3.0 0.0.0.255 any range 22 telnet
access-list 2598 permit tcp 200.244.4.0 0.0.0.255 any range 22 telnet
access-list 2598 permit tcp 200.244.18.0 0.0.1.255 any range 22 telnet
access-list 2598 permit tcp 200.244.21.0 0.0.0.255 any range 22 telnet
access-list 2598 permit tcp 200.244.22.0 0.0.1.255 any range 22 telnet
access-list 2598 permit tcp 200.244.24.0 0.0.1.255 any range 22 telnet
access-list 2598 permit tcp 200.244.40.0 0.0.0.255 any range 22 telnet
access-list 2598 permit tcp 200.244.44.0 0.0.0.255 any range 22 telnet
access-list 2598 permit tcp 200.244.49.0 0.0.0.255 any range 22 telnet
access-list 2598 permit tcp 200.244.63.0 0.0.0.255 any range 22 telnet
access-list 2598 permit tcp 200.244.66.0 0.0.1.255 any range 22 telnet
access-list 2598 permit tcp 200.244.68.0 0.0.1.255 any range 22 telnet
access-list 2598 permit tcp 200.244.74.0 0.0.1.255 any range 22 telnet
access-list 2598 permit tcp 200.244.80.0 0.0.1.255 any range 22 telnet
access-list 2598 permit tcp 200.244.90.0 0.0.0.255 any range 22 telnet
access-list 2598 permit tcp 200.244.140.0 0.0.0.255 any range 22 telnet
access-list 2598 permit tcp 200.244.150.0 0.0.0.255 any range 22 telnet
access-list 2598 permit tcp 200.244.160.0 0.0.0.255 any range 22 telnet
access-list 2598 permit tcp 200.244.162.0 0.0.1.255 any range 22 telnet
access-list 2598 permit tcp 200.244.164.0 0.0.3.255 any range 22 telnet
access-list 2598 permit tcp 200.244.168.0 0.0.3.255 any range 22 telnet
access-list 2598 permit tcp 200.244.172.0 0.0.0.255 any range 22 telnet
access-list 2598 permit tcp 200.244.211.0 0.0.0.255 any range 22 telnet
access-list 2598 permit tcp 200.244.212.0 0.0.3.255 any range 22 telnet
access-list 2598 permit tcp 200.244.216.0 0.0.0.255 any range 22 telnet
access-list 2598 permit tcp 200.244.1.0 0.0.0.255 range 22 telnet any
access-list 2598 permit tcp 200.244.3.0 0.0.0.255 range 22 telnet any
access-list 2598 permit tcp 200.244.4.0 0.0.0.255 range 22 telnet any
access-list 2598 permit tcp 200.244.18.0 0.0.1.255 range 22 telnet any
access-list 2598 permit tcp 200.244.21.0 0.0.0.255 range 22 telnet any
access-list 2598 permit tcp 200.244.22.0 0.0.1.255 range 22 telnet any
access-list 2598 permit tcp 200.244.24.0 0.0.1.255 range 22 telnet any
access-list 2598 permit tcp 200.244.40.0 0.0.0.255 range 22 telnet any
access-list 2598 permit tcp 200.244.44.0 0.0.0.255 range 22 telnet any
access-list 2598 permit tcp 200.244.49.0 0.0.0.255 range 22 telnet any
access-list 2598 permit tcp 200.244.63.0 0.0.0.255 range 22 telnet any
access-list 2598 permit tcp 200.244.66.0 0.0.1.255 range 22 telnet any
access-list 2598 permit tcp 200.244.68.0 0.0.1.255 range 22 telnet any
access-list 2598 permit tcp 200.244.74.0 0.0.1.255 range 22 telnet any
access-list 2598 permit tcp 200.244.80.0 0.0.1.255 range 22 telnet any
access-list 2598 permit tcp 200.244.90.0 0.0.0.255 range 22 telnet any
access-list 2598 permit tcp 200.244.140.0 0.0.0.255 range 22 telnet any
access-list 2598 permit tcp 200.244.150.0 0.0.0.255 range 22 telnet any
access-list 2598 permit tcp 200.244.160.0 0.0.0.255 range 22 telnet any
access-list 2598 permit tcp 200.244.162.0 0.0.1.255 range 22 telnet any
access-list 2598 permit tcp 200.244.164.0 0.0.3.255 range 22 telnet any
access-list 2598 permit tcp 200.244.168.0 0.0.3.255 range 22 telnet any
access-list 2598 permit tcp 200.244.172.0 0.0.0.255 range 22 telnet any
access-list 2598 permit tcp 200.244.211.0 0.0.0.255 range 22 telnet any
access-list 2598 permit tcp 200.244.212.0 0.0.3.255 range 22 telnet any
access-list 2598 permit tcp 200.244.216.0 0.0.0.255 range 22 telnet any
access-list 2598 permit udp host 200.214.41.124 any eq snmp
access-list 2598 permit udp host 200.179.55.2 any eq snmp
access-list 2598 permit udp 200.179.210.0 0.0.0.255 any eq snmp
access-list 2598 permit udp host 200.246.244.82 any eq snmp
access-list 2598 permit udp 200.255.125.0 0.0.0.255 any eq snmp
access-list 2598 permit udp 200.255.160.0 0.0.0.255 any eq snmp
access-list 2598 permit udp 200.255.218.192 0.0.0.63 any eq snmp
access-list 2598 permit udp 200.255.253.0 0.0.0.255 any eq snmp
access-list 2598 permit udp 200.255.254.0 0.0.0.255 any eq snmp
access-list 2598 permit udp host 200.255.255.67 any eq snmp
access-list 2598 permit udp 200.230.5.0 0.0.0.255 any eq snmp
access-list 2598 permit udp 200.244.11.0 0.0.0.255 any eq snmp
access-list 2598 permit udp 200.230.9.0 0.0.0.255 any eq snmp
access-list 2598 permit udp 200.244.9.0 0.0.0.255 any eq snmp
access-list 2598 permit udp 200.244.110.0 0.0.1.255 any eq snmp
access-list 2598 permit udp host 200.244.162.246 any eq snmp
access-list 2598 permit udp host 200.244.162.250 any eq snmp
access-list 2598 permit udp host 200.244.162.251 any eq snmp
access-list 2598 permit udp host 200.244.163.246 any eq snmp
access-list 2598 permit udp host 200.244.163.250 any eq snmp
access-list 2598 permit udp host 200.244.163.251 any eq snmp
access-list 2598 permit udp host 200.255.251.214 any eq snmp
access-list 2598 permit udp 201.65.190.32 0.0.0.31 any eq snmp
access-list 2598 permit udp host 200.255.253.242 eq ntp any
access-list 2598 permit udp host 200.245.255.33 eq ntp any
access-list 2598 permit udp host 200.255.255.73 eq domain any
access-list 2598 permit udp host 200.255.255.65 eq domain any
access-list 2598 permit udp host 200.255.255.66 eq domain any
access-list 2598 permit udp host 200.255.255.70 eq domain any
access-list 2598 permit udp host 200.255.125.211 eq domain any
access-list 2598 permit tcp 200.255.125.0 0.0.0.255 range ftp-data ftp any
access-list 2598 permit tcp 200.255.253.0 0.0.0.255 range ftp-data ftp any
access-list 2598 permit tcp 200.255.160.0 0.0.0.255 range ftp-data ftp any
access-list 2598 permit tcp 200.179.210.0 0.0.0.255 range ftp-data ftp any
access-list 2598 permit tcp 200.255.218.192 0.0.0.63 range ftp-data ftp any
access-list 2598 permit udp 200.255.253.0 0.0.0.255 eq tftp any
access-list 2598 permit udp 200.255.125.0 0.0.0.255 eq tftp any
access-list 2598 permit udp 200.255.160.0 0.0.0.255 eq tftp any
access-list 2598 permit udp 200.255.218.192 0.0.0.63 eq tftp any
access-list 2598 permit udp 200.179.210.0 0.0.0.255 eq tftp any
access-list 2598 permit udp 200.255.125.0 0.0.0.255 gt 1024 any
access-list 2598 permit tcp 200.255.125.0 0.0.0.255 gt 1024 any
access-list 2598 permit udp 200.255.253.0 0.0.0.255 gt 1024 any
access-list 2598 permit tcp 200.255.253.0 0.0.0.255 gt 1024 any
access-list 2598 permit udp 200.255.160.0 0.0.0.255 gt 1024 any
access-list 2598 permit tcp 200.255.160.0 0.0.0.255 gt 1024 any
access-list 2598 permit udp 200.179.210.0 0.0.0.255 gt 1024 any
access-list 2598 permit tcp 200.179.210.0 0.0.0.255 gt 1024 any
access-list 2598 permit udp 200.255.218.192 0.0.0.63 gt 1024 any
access-list 2598 permit tcp 200.255.218.192 0.0.0.63 gt 1024 any
access-list 2598 permit udp any any range 33434 33534
access-list 2598 permit tcp host 200.255.125.33 any eq cmd
access-list 2598 permit tcp host 200.255.125.60 any eq cmd
access-list 2598 permit tcp host 200.255.125.219 any eq cmd
access-list 2598 permit tcp host 200.255.125.45 any eq cmd
access-list 2598 permit tcp host 200.255.125.56 any eq cmd
access-list 2598 permit tcp host 200.255.253.249 any eq cmd
access-list 2598 permit tcp host 200.255.253.250 any eq cmd
access-list 2598 permit tcp host 200.255.125.33 lt 1024 any lt 1024
access-list 2598 permit tcp host 200.255.125.60 lt 1024 any lt 1024
access-list 2598 permit tcp host 200.255.125.219 lt 1024 any lt 1024
access-list 2598 permit tcp host 200.255.125.45 lt 1024 any lt 1024
access-list 2598 permit tcp host 200.255.125.56 lt 1024 any lt 1024
access-list 2598 permit tcp host 200.255.253.249 lt 1024 any lt 1024
access-list 2598 permit tcp host 200.255.253.250 lt 1024 any lt 1024
access-list 2598 permit udp host 200.255.125.217 eq syslog any
access-list 2598 permit udp host 200.255.125.218 eq syslog any
access-list 2598 permit tcp host 200.255.125.216 eq tacacs any
access-list 2598 permit tcp host 200.255.125.215 eq tacacs any
access-list 2598 permit tcp any range 22 telnet any gt 1024 established
access-list 2598 deny   ip any 200.230.16.0 0.0.1.255
access-list 2598 deny   ip any 200.230.224.0 0.0.0.255
access-list 2598 deny   ip any 200.230.248.0 0.0.1.255
access-list 2598 deny   ip any 200.244.17.0 0.0.0.255
access-list 2598 deny   ip any 200.244.27.0 0.0.0.255
access-list 2598 deny   ip any 200.244.28.0 0.0.1.255
access-list 2598 deny   ip any 200.244.41.0 0.0.0.255
access-list 2598 deny   ip any 200.230.44.0 0.0.1.255
access-list 2598 deny   ip any 200.230.46.0 0.0.0.255
access-list 2598 deny   ip any 200.244.192.0 0.0.1.255
access-list 2598 deny   ip any 200.244.194.0 0.0.0.255
access-list 2598 deny   ip any 200.230.92.0 0.0.0.255
access-list 2598 permit tcp any any eq bgp
access-list 2598 permit tcp any eq bgp any
access-list 2598 permit udp any any eq rip
access-list 2598 permit udp any eq rip any
access-list 2598 permit pim any any
access-list 2598 permit ospf any any
access-list 2598 permit udp any eq 1985 host 224.0.0.2 eq 1985
access-list 2598 permit 112 any any
access-list 2598 permit igmp any any
access-list 2598 permit eigrp any any
access-list 2598 permit udp any host 224.0.0.13 eq 3232
access-list 2598 deny   tcp any any
access-list 2598 deny   udp any any
access-list 2598 deny   icmp any any
access-list 2598 deny   ip any any
no cdp run
!
route-map REPUBLICAONLINE_IN permit 10
 match ip address prefix-list REPUBLICAONLINE
 set community 4230:4 4230:21 4230:198
!
route-map REALIP_CLIENTE permit 10
 set community 4230:5581
!
route-map IPIRANGA_EXTR_SERMA_TEXACO permit 10
 match community 402
!
route-map IPIRANGA_EXTR_SERMA_TEXACO deny 20
 match extcommunity 80
!
route-map IPIRANGA_EXTR_SERMA_TEXACO permit 30
 match ip address prefix-list ANULA_DEFAULT
 match extcommunity 82
!
route-map IPIRANGA_EXTR_SERMA_TEXACO permit 40
 match extcommunity 81
!
route-map NETSERVICOS_IN permit 10
 match as-path 106
 set community 4230:21 4230:30 4230:198
!
route-map SAM_DADOS_IN permit 10
 match ip address prefix-list SAM_DADOS
 set community 4230:4 4230:21 4230:198
!
route-map RTM_CLIENT_RJO permit 10
 match extcommunity 71
 set local-preference 100
!
route-map RTM_CLIENT_RJO permit 20
 match extcommunity 72
 set local-preference 25
!
route-map RTM_CLIENT_RJO permit 30
!
route-map BBRASIL_PAE_CE_OUT permit 10
 match community 431
!
route-map LATAM_TELMEX permit 10
 set community 28513:1281
!
route-map TRT16_354017230162 permit 10
!
route-map TEXACO_EXTR_SERMA_IPIR permit 10
 match community 402
!
route-map TEXACO_EXTR_SERMA_IPIR permit 15
 match community 404
 set local-preference 75
!
route-map TEXACO_EXTR_SERMA_IPIR deny 20
 match extcommunity 80
!
route-map TEXACO_EXTR_SERMA_IPIR permit 30
 match extcommunity 81
 set local-preference 50
!
route-map TEXACO_EXTR_SERMA_IPIR permit 40
 match extcommunity 82
!
route-map BBRASIL_CE_OUT permit 10
 match community 421 431
!
route-map CEA_4575200252158198 permit 10
!
route-map ALCOA_14961895221146 permit 10
!
route-map COND_DEFAULT permit 10
 match ip address prefix-list COND_LOOP
!
route-map RM_ECT_CONNECTED permit 10
 set community 0:2120
!
route-map GUANABARA_12791892328110 permit 10
!
route-map TJ_MA_IN permit 10
 match as-path 107
 set community 4230:21 4230:30 4230:198
!
route-map AVPROGRESSO_40161872812238 permit 10
!
route-map STATIC deny 5
 match tag 200
!
route-map STATIC permit 10
 match ip address 2550
 set origin igp
 set community 4230:50 4230:198
!
route-map GUANABARA_12791894312046 permit 10
!
route-map TST_NACIONAL_BGP_MAP_PRI permit 5
 description Gerencia
 match community TST10
 set local-preference 200
!
route-map TST_NACIONAL_BGP_MAP_PRI permit 10
 description VoIP
 match community TST12
 set local-preference 200
!
route-map TST_NACIONAL_BGP_MAP_PRI permit 20
 description MCS Primary
 match community TST13
 set local-preference 200
!
route-map TST_NACIONAL_BGP_MAP_PRI permit 40
 description ALL ROUTES
 set local-preference 170
!
route-map CBE_47341872812230 permit 10
!
route-map IMP_RENOSA_EXT deny 10
 match community RGSA
!
route-map IMP_RENOSA_EXT permit 20
!
route-map CEA_45751872812246 permit 10
!
route-map BRASPRESS_47331872812254 permit 10
!
route-map NORSERGEL_PROSEGUR permit 10
 match extcommunity 57
!
route-map NORSERGEL_PROSEGUR permit 20
 match extcommunity 55
!
route-map NORSERGEL_PROSEGUR permit 25
 match extcommunity 56
!
route-map NORSERGEL_PROSEGUR permit 30
 match extcommunity 59
!
route-map ELO_IN permit 10
 match as-path 103
 set community 4230:11 4230:30 4230:198
!
route-map CASSI_390420025215846 permit 10
!
route-map TRT-XX_EXPORT_MAP permit 10
 description MGNT Loopback IP
 match community TST10
 set extcommunity rt  1024:1231323
!
route-map TRT-XX_EXPORT_MAP permit 20
 description VoIP Loopback IP
 match community TST11
 set extcommunity rt  1024:1230323
!
route-map TRT-XX_EXPORT_MAP permit 30
 description VoIP Loopback IP
 match community TST12
 set extcommunity rt  1024:1230323
!
route-map TRT-XX_EXPORT_MAP permit 40
 description Normal BGP prefix
!
route-map LATAM_TELMEX_285_SG permit 10
 set community 28513:285 28513:1281 additive
!
route-map TSE_SPOKE_15423418728122110 permit 10
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
route-map LASA_NOVA_15500020017211214 permit 10
!
route-map LASA_NOVA_15500018943120162 permit 10
!
route-map TRT16_3540172301646 permit 10
!
route-map LASA_SEDE_327718728122226 permit 10
!
route-map BB-LT2-NAC-REMOTOS-IN permit 10
 match community 442
!
route-map BB-LT3-NAC-REMOTOS-IN permit 10
 match community 444
!
route-map IMP_SERMA permit 10
 match ip address prefix-list REDE_SERMA
 match extcommunity 185
!
route-map IMP_SERMA permit 20
 match ip address prefix-list REDE_IMIFARMA
 match extcommunity 186
!
route-map ELO_MA_CPE_IN permit 10
 match as-path 102
 set community 4230:11 4230:30 4230:192
!
route-map PREVIDENCIA_SPOKES_15161510784498 permit 10
!
route-map BLOCK-OUT-VRF permit 100
 match ip address BLOCK-OUT-VRF
!
route-map LOJASRIACHUELO_41202017325546 permit 10
!
route-map PAULINAS_24751872812226 permit 10
!
route-map ABNAMRO_DEFAULT permit 10
 match ip address prefix-list ABNAMRO_DEFAULT
!
route-map CLIENTES_IPv4_RANGE_PROPRIO_COMMON_POLICY_IN permit 5
 continue 10
 set community 4230:21 4230:198
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
route-map BBRASIL_MARCA_SOO permit 10
 set extcommunity soo 65521:1
!
route-map NGN-VOZ_1417102552186 permit 10
!
route-map SERASA_MATIAS permit 10
 match extcommunity 62
 set local-preference 100
!
route-map SERASA_MATIAS permit 20
 match extcommunity 61
 set local-preference 25
!
route-map DEFAULT_ROUTE permit 10
 set community 4230:50
!
route-map NEGA_ROTA_DEFAULT deny 10
 match ip address prefix-list ROTA_DEFAULT
!
route-map NEGA_ROTA_DEFAULT permit 20
!
route-map PREVIDENCIA_SPOKES_15176110784418 permit 10
!
route-map TAGUATINGA_EXT_TAGUATUR permit 10
 match ip address prefix-list ANULA_DEFAULT
 match extcommunity 125
!
route-map TAGUATINGA_EXT_TAGUATUR permit 20
 match extcommunity 124
!
route-map TAGUATINGA_EXT_TAGUATUR permit 30
!
route-map ABRROAMING_12491872812262 permit 10
!
route-map SBC_CLIENTE permit 10
 set community 4230:3108
!
route-map ABIN_1539401872812214 permit 10
!
route-map BIGBEN_27771895219054 permit 10
!
route-map BIGBEN_27771895219938 permit 10
!
route-map BIGBEN_2777200249174222 permit 10
!
route-map NGN-VIPLINEIP_262810254254166 permit 10
!
route-map SET_COMMUNITY_GERENCIA_CQMR permit 10
 set community 4230:5110 additive
!
route-map BIGBEN_27771895219062 permit 10
!
route-map ANTT_EXPORT_MAP permit 20
 description marcacao de extcommunity para as loopbacks 323 aprendidas
 match community ANTT-VOIP
 set extcommunity rt  4230:152753
!
route-map ANTT_EXPORT_MAP permit 40
 description nao altera extcommunity para as demais rotas
!
route-map BIGBEN_27772002491756 permit 10
!
route-map BIGBEN_2777200249171222 permit 10
!
route-map POUPEX_BGP_OSPF deny 10
 match ip address prefix-list POUPEX-BGP-OSPF
!
route-map PITAGORA_UNIC permit 10
 match extcommunity 111
!
route-map PITAGORA_UNIC permit 20
 match ip address prefix-list ANULA_DEFAULT
 match extcommunity 112
!
route-map PITAGORA_UNIC permit 30
 match extcommunity 113
!
route-map ANVISA_EXPORT_MAP permit 20
 match community ANVISA-VOIP
 set extcommunity rt  4230:153817
!
route-map ANVISA_EXPORT_MAP permit 30
 match community ANVISA-GER
 set extcommunity rt  4230:4357
!
route-map ANVISA_EXPORT_MAP permit 40
!
route-map INFRAERO_478110024210 permit 10
!
route-map VIA_EMBRATEL_IN permit 10
 match as-path 101
 set community 4230:21 4230:30 4230:198
!
route-map BIGBEN_27771895219058 permit 10
!
route-map CONNECTED permit 10
 match ip address 2550
 set origin igp
 set community 4230:50 4230:198
!
route-map GERDAU_INT_309610241512 permit 10
!
route-map TAGUATURVEIC_351918953246182 permit 10
!
route-map BELLINATIPEREZ_398518728122190 permit 10
!
route-map LATAM_TELMEX_286 permit 10
 match ip address LATAM_TELMEX
 set community 4230:5110 28513:286 28513:1281 additive
!
route-map LISTEL_2 permit 10
 match extcommunity 4
 set local-preference 100
!
route-map LISTEL_2 permit 20
 match extcommunity 3
 set local-preference 25
!
route-map LISTEL_2 permit 30
 match extcommunity 144
!
route-map LATAM_TELMEX_285 permit 10
 set community 28513:285 28513:1281 additive
!
route-map BOMPRECO_347920145138174 permit 10
!
route-map MARISA_497218728122198 permit 10
!
route-map NGN-GER_141610253830 permit 10
!
route-map IBGP_RR-CLIENT_PARTIAL_OUT permit 10
 match as-path 1
!
route-map IBGP_RR-CLIENT_PARTIAL_OUT permit 20
 match community 2 3 4
!
route-map BIGBEN_277718943120198 permit 10
!
route-map BIGBEN_277718952211150 permit 10
!
route-map LOJASRIACHUELO_412018953246142 permit 10
!
route-map PREVIDENCIA_SPOKES_152588107844122 permit 10
!
route-map DPRF-MAP permit 10
 description Rede VoIP
 match community DPRF-VOIP
 set extcommunity rt  1024:1001323
!
route-map DPRF-MAP permit 20
 description Rede Gerencia
 match community DPRF-GERENCIA
 set extcommunity rt  1024:1001001
!
route-map BB-LT3-NAC-REMOTOS-OUT permit 10
 match community 443
!
route-map BB-LT2-NAC-REMOTOS-OUT permit 10
 match community 441
!
route-map TRT-XX_BGP_MAP permit 5
 description Gerencia
 match community TST10
 set local-preference 200
!
route-map TRT-XX_BGP_MAP permit 10
 description VoIP
 match community TST12
 set local-preference 200
!
route-map TRT-XX_BGP_MAP permit 20
 description MCS Primary
 match community TST13
 set local-preference 200
!
route-map TRT-XX_BGP_MAP permit 40
 description ALL ROUTES
 set local-preference 170
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
snmp-server community fmvs7b1a RO 13
snmp-server community sdklwepo RO 13
snmp-server trap link ietf
snmp-server trap-source Loopback0
snmp-server enable traps snmp authentication linkdown linkup coldstart warmstart
snmp-server enable traps tty
snmp-server enable traps atm subif
snmp-server enable traps config
snmp-server enable traps envmon
snmp-server enable traps syslog
snmp-server enable traps rf
snmp-server enable traps bgp
snmp-server enable traps ospf state-change
snmp-server enable traps mpls ldp
snmp-server host 200.255.125.56 ldsp46!) 
snmp-server host 200.255.125.60 ldsp46!) 
snmp-server host 200.255.253.245 ldsp46!) 
snmp-server host 200.255.253.249 ldsp46!) 
snmp-server host 200.255.253.250 ldsp46!) 
snmp ifmib ifalias long
tacacs-server host 200.255.125.216
tacacs-server key 7 06051A2F45420017020213
!
tag-switching tdp router-id Loopback0 force
control-plane slot 0
 service-policy input CoPP
!
control-plane slot 1
 service-policy input CoPP
!
control-plane slot 6
 service-policy input CoPP
!
control-plane slot 7
 service-policy input CoPP
!
control-plane
 service-policy input CoPP
!
banner motd ^CC
                ============================================================
                =                  INTERNET via Embratel                   =
                ============================================================
                Voce deve possuir autorizacao para acessar este equipamento.
                      Todas as conexoes sao monitoradas e registradas.
                ============================================================
^C
alias exec sr sh ip route
alias exec cr clear ip route
privilege exec level 1 traceroute
privilege exec level 1 ping
privilege exec level 1 enable
privilege exec level 1 disable
privilege exec level 1 show
privilege exec level 15 no
!
line con 0
 exec-timeout 60 0
 login authentication NOC
line aux 0
 session-timeout 60 
 exec-timeout 0 0
 login authentication NOC
line vty 0 4
 session-timeout 20 
 access-class 12 in
 exec-timeout 20 0
 login authentication NOC
 transport input telnet ssh
line vty 5 6
 session-timeout 20 
 access-class 11 in
 exec-timeout 20 0
 password 7 050E0B0D334D5A0C15
 login authentication NOC
 transport input telnet ssh
line vty 7 9
 session-timeout 20 
 access-class 11 in
 exec-timeout 20 0
 login authentication NOC
 transport input telnet ssh
line vty 10 11
 session-timeout 20 
 access-class 14 in
 exec-timeout 20 0
 login authentication NOC
 transport input telnet ssh
!
exception warmstart 60 5 
ntp clock-period 17171394
ntp source Loopback0
ntp update-calendar
ntp server 200.255.253.242
ntp server 200.245.255.33
no cns aaa enable
end

gacc02.sls#
