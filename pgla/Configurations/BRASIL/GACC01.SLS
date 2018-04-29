Building configuration...

Current configuration : 560227 bytes
!
! Last configuration change at 15:37:11 BRA Wed Mar 14 2018
! NVRAM config last updated at 15:38:58 BRA Wed Mar 14 2018 by rglange
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
hostname gacc01.sls
!
boot-start-marker
boot system flash disk0:c12kprp-k4p-mz-eng-sp-120-33S13_Embratel15
boot system flash disk0:c12kprp-k4p-mz.120-33.S8.bin
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
aaa authentication login admin local
aaa authentication login NOC tacacs+ local
aaa authorization exec default tacacs+ local
aaa authorization commands 1 default tacacs+ local
aaa authorization commands 6 default tacacs+ local
aaa authorization commands 15 default tacacs+ local
aaa accounting exec default wait-start tacacs+
aaa accounting commands 1 default wait-start tacacs+
aaa accounting commands 6 default wait-start tacacs+
aaa accounting commands 15 default wait-start tacacs+
enable secret level 6 5 $1$8CVf$zR9Tv40s1/BRi8xsXl0I7/
enable secret 5 $1$EvUq$qJZr2R6GOZKVHVHcg2/ad.
!
username cong privilege 15 secret 5 $1$AfS.$JC367MPgkdsOInKEOgxjL1
spd extended-headroom 1000
monitor event-trace rlc all enable
monitor event-trace mbus slot 23
monitor event-trace mbus slot 24
monitor event-trace mbus slot 25
monitor event-trace mbus slot 26
monitor event-trace mbus slot 27
monitor event-trace mbus slot 28
monitor event-trace mbus slot 29
power-mgr disable
clock timezone BRA -3
clock summer-time BRAVER recurring 3 Sun Oct 0:00 3 Sun Feb 0:00
sensor fanspeed-control off
!
!
hw-module slot 1 np mode feature
hw-module slot 6 np mode feature
hw-module slot 7 np mode feature
hw-module slot 1 qos policing-granularity 8
hw-module slot 6 qos policing-granularity 8
hw-module slot 7 qos policing-granularity 8
hw-module slot 1 process-max-time 50
hw-module slot 4 process-max-time 50
hw-module slot 5 process-max-time 50
hw-module slot 6 process-max-time 50
hw-module slot 7 process-max-time 50
hw-module slot 8 process-max-time 50
hw-module slot 9 process-max-time 50
hw-module slot 1 ip rtp compression-connections 32000
hw-module slot 1 ip tcp compression-connections 500
hw-module slot 6 ip rtp compression-connections 32000
hw-module slot 6 ip tcp compression-connections 500
hw-module slot 7 ip rtp compression-connections 32000
hw-module slot 7 ip tcp compression-connections 500
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
ip rcmd remote-host cricket 200.255.253.248 cricket
ip rcmd remote-host seg 200.255.125.56 seg enable
ip rcmd remote-host root 200.255.253.245 root enable
ip rcmd remote-host root 200.255.253.249 root enable
ip rcmd remote-host seg 200.255.125.33 seg enable
ip rcmd remote-host scrngn 200.255.255.37 scrngn enable
ip rcmd remote-host ativweb 200.255.125.60 ativweb enable
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
ip domain-list .
ip domain-list embratel.net.br.
ip host srv06.embratel.net.br 200.255.125.56
ip host srv29.embratel.net.br 200.255.125.60
ip host wks21.rjo.embratel.net.br 200.255.253.250
ip host supv01 10.201.98.253
ip host wks19.rjo.embratel.net.br 200.255.125.219
ip host wks09.rjo.embratel.net.br 200.255.253.249
ip host srv04.embratel.net.br 200.255.125.45
ip host srv41.embratel.net.br 200.255.125.33
ip domain-name embratel.net.br
ip name-server 200.255.255.73
ip name-server 200.255.255.65
ip vrf ABNAMRO:2803
 rd 4230:2803
 route-target export 4230:2803
 route-target import 4230:2803
!
ip vrf ABRROAMING:1249
 rd 4230:1249
 route-target export 4230:1249
 route-target import 4230:1249
!
ip vrf ACCOR:5074
 rd 4230:5074
 route-target export 4230:5074
 route-target export 28513:50378
 route-target export 4230:5155
 route-target import 4230:5074
 route-target import 28513:50378
 route-target import 4230:1337
!
ip vrf ALECOMBUST:1639
 rd 4230:1639
 route-target export 4230:1639
 route-target export 4230:3108
 route-target import 4230:1639
 route-target import 4230:3107
 route-target import 4230:1337
!
ip vrf ANTAQ:7637
 rd 4230:7637
 route-target export 4230:7637
 route-target import 4230:7637
!
ip vrf ANVISA:4356
 rd 4230:4356
 export map ANVISA_EXPORT_MAP
 route-target export 4230:4356
 route-target import 4230:4356
 route-target import 4230:153817
 route-target import 4230:4357
 route-target import 4230:1337
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
ip vrf BCOBONSUCESSO:2834
 rd 4230:2834
 route-target export 4230:2834
 route-target export 4230:3108
 route-target import 4230:2834
 route-target import 4230:3107
!
ip vrf BCOPANAMERICANO:5041
 rd 4230:5041
 route-target export 4230:5041
 route-target export 4230:5155
 route-target import 4230:5041
 route-target import 4230:1337
!
ip vrf BCP_NO:4026
 rd 4230:4026
 route-target export 4230:4026
 route-target import 4230:4026
!
ip vrf BIGBEN:2777
 rd 4230:2777
 route-target export 4230:2777
 route-target export 4230:5155
 route-target import 4230:2777
 route-target import 4230:1337
!
ip vrf BNB:5075
 rd 4230:5075
 route-target export 4230:5075
 route-target export 4230:5155
 route-target import 4230:5075
 route-target import 4230:1337
!
ip vrf BRASPRESS:4733
 rd 4230:4733
 route-target export 4230:4733
 route-target import 4230:4733
!
ip vrf BRINKS:1177
 rd 4230:1177
 route-target export 4230:1177
 route-target import 4230:1177
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
ip vrf CARGLASS:7528
 rd 4230:7528
 route-target export 4230:7528
 route-target import 4230:7528
!
ip vrf CBE:4734
 rd 4230:4734
 route-target export 4230:4734
 route-target import 4230:4734
!
ip vrf CEMAR:3468
 rd 4230:3468
 route-target export 4230:3468
 route-target import 4230:3468
 route-target import 4230:4000
 route-target import 4230:1337
!
ip vrf CINEMAS:1063
 rd 4230:1063
 route-target export 4230:1063
 route-target import 4230:1063
!
ip vrf CITELUZ:1201
 rd 4230:1201
 route-target export 4230:1201
 route-target import 4230:1201
!
ip vrf CNI:7529
 rd 4230:7529
 route-target export 4230:7529
 route-target import 4230:7529
!
ip vrf COLOMBO:3147
 rd 4230:3147
 route-target export 4230:3147
 route-target export 4230:3108
 route-target import 4230:3147
 route-target import 4230:3107
!
ip vrf COMAER_NEW:5485
 rd 4230:5485
 route-target export 4230:5485
 route-target import 4230:5485
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
ip vrf CORREIOS_LOTE2:3151
 rd 4230:3151
 route-target export 4230:3151
 route-target import 4230:3151
 route-target import 4230:3399
 route-target import 4230:3400
 route-target import 4230:3401
 mdt default 239.232.0.10
 mdt data 239.232.11.0 0.0.0.255 threshold 1
 mdt log-reuse
!
ip vrf COSAN:4132
 rd 4230:4132
 route-target export 4230:4132
 route-target export 4230:3108
 route-target export 4230:5110
 route-target import 4230:4132
 route-target import 4230:3107
 route-target import 4230:5109
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
ip vrf DCTIM:4283
 rd 4230:4283
 route-target export 4230:4283
 route-target import 4230:4283
 route-target import 4230:1337
!
ip vrf DIASBRANCO:151552
 rd 4230:151552
 route-target export 4230:1569
 route-target export 4230:3108
 route-target import 4230:1569
 route-target import 4230:3107
!
ip vrf DIEBOLD_EXTRANET:155476
 rd 4230:155476
 route-target export 4230:7115
 route-target export 4230:4532
 route-target import 4230:7115
 route-target import 4230:4532
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
ip vrf EMSERH:7743
 rd 4230:7743
 route-target export 4230:7743
 route-target import 4230:7743
!
ip vrf FUNASA:3094
 rd 4230:3094
 route-target export 4230:3094
 route-target import 4230:3094
 mdt default 239.232.0.243
 mdt data 239.232.244.0 0.0.0.255 threshold 1
 mdt log-reuse
!
ip vrf GERDAU_INT:151563
 rd 4230:151563
 route-target export 4230:3096
 route-target export 28513:50072
 route-target import 4230:3096
 route-target import 28513:50072
!
ip vrf HERVAL:4202
 rd 4230:4202
 route-target export 4230:4202
 route-target export 4230:3108
 route-target import 4230:4202
 route-target import 4230:3107
!
ip vrf IBAMA:1057
 rd 4230:1057
 route-target export 4230:1057
 route-target import 4230:1057
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
ip vrf INFOVIA_DPU:6092
 rd 4230:6092
 route-target export 4230:6092
 route-target import 4230:6092
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
 route-target import 4230:1265
!
ip vrf JSDISTRIBUIDORA:7167
 rd 4230:7167
 route-target export 4230:7167
 route-target export 4230:5155
 route-target import 4230:7167
 route-target import 4230:1337
!
ip vrf LASA_NOVA:6236
 rd 4230:6236
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
ip vrf LILIANI:3630
 rd 4230:3630
 route-target export 4230:3630
 route-target export 4230:3108
 route-target export 4230:5155
 route-target import 4230:3630
 route-target import 4230:3107
 route-target import 4230:1337
!
ip vrf LOJARENNER:1513
 rd 4230:1513
 route-target export 4230:1513
 route-target export 4230:3108
 route-target export 4230:5155
 route-target import 4230:1513
 route-target import 4230:3107
 route-target import 4230:1337
!
ip vrf LOJASRIACHUELO:4120
 rd 4230:4120
 route-target export 4230:4120
 route-target import 4230:4120
!
ip vrf MARISA:4972
 rd 4230:4972
 route-target export 4230:4972
 route-target export 4230:5110
 route-target import 4230:4972
 route-target import 4230:5109
 route-target import 4230:1337
!
ip vrf MAXPAR:3450
 rd 4230:3450
 route-target export 4230:3450
 route-target export 4230:3108
 route-target import 4230:3450
 route-target import 4230:3107
!
ip vrf MILLS:2550
 rd 4230:2550
 route-target export 4230:2550
 route-target import 4230:2550
!
ip vrf NEGRAO:1481
 rd 4230:1481
 route-target export 4230:1481
 route-target import 4230:1481
!
ip vrf NGN-GER:1416
 rd 4230:1416
 route-target export 4230:1416
 route-target import 4230:1416
 route-target import 4230:900
!
ip vrf NOBLEBRASIL:4314
 rd 4230:4314
 route-target export 4230:4314
 route-target export 4230:5155
 route-target import 4230:4314
 route-target import 4230:1337
!
ip vrf NOVOMUNDO:7156
 rd 4230:7156
 route-target export 4230:7156
 route-target export 4230:5155
 route-target import 4230:7156
 route-target import 4230:1337
!
ip vrf OKIBRASIL:7552
 rd 4230:7552
 route-target export 4230:7552
 route-target import 4230:7552
!
ip vrf PAGUEMENOS:3822
 rd 4230:3822
 route-target export 4230:3822
 route-target export 4230:3108
 route-target import 4230:3822
 route-target import 4230:3107
 route-target import 4230:1337
!
ip vrf PIA:1264
 rd 4230:1264
 route-target export 4230:2475
 route-target export 4230:3108
 route-target export 4230:5155
 route-target import 4230:2475
 route-target import 4230:3107
 route-target import 4230:1337
!
ip vrf POUPEX:1946
 rd 4230:1946
 route-target export 4230:1946
 route-target import 4230:1946
!
ip vrf PREVIDENCIA_SPOKES:152225
 rd 4230:152225
 route-target export 4230:151584
 route-target import 4230:3128
!
ip vrf REALIP_CLIENTE:5581
 rd 4230:5581
 route-target export 4230:5581
 route-target export 4230:5155
 route-target import 4230:5580
 route-target import 4230:1337
!
ip vrf REDEVIP_BLD:152379
 rd 4230:152379
 route-target export 4230:3108
 route-target import 4230:3107
!
ip vrf REDEVIP_BLD_MLPPP:3799
 rd 4230:3799
 route-target export 4230:3108
 route-target import 4230:3107
!
ip vrf RIHAPPY:4005
 rd 4230:4005
 route-target export 4230:4005
 route-target export 4230:5155
 route-target export 4230:3108
 route-target import 4230:4005
 route-target import 4230:1337
 route-target import 4230:3107
!
ip vrf SEBRAEMA:4302
 rd 4230:4302
 route-target export 4230:4302
 route-target export 4230:3108
 route-target export 4230:5155
 route-target import 4230:4302
 route-target import 4230:1337
 route-target import 4230:3107
!
ip vrf SERMA:1663
 rd 4230:1663
 route-target export 4230:1663
 route-target export 28513:50296
 route-target import 4230:1663
 route-target import 28513:50296
!
ip vrf SERPRO_SLS_DETRAN_01:5897
 rd 4230:5897
 route-target export 4230:5897
 route-target import 4230:5897
!
ip vrf SERPRO_SLS_DNIT_01:5893
 rd 4230:5893
 route-target export 4230:5893
 route-target import 4230:5893
!
ip vrf SERPRO_SLS_DNIT_02:5923
 rd 4230:5923
 route-target export 4230:5923
 route-target import 4230:5923
!
ip vrf SERPRO_SLS_DNIT_03:5896
 rd 4230:5896
 route-target export 4230:5896
 route-target import 4230:5896
!
ip vrf SERPRO_SLS_DNIT_04:5949
 rd 4230:5949
 route-target export 4230:5949
 route-target import 4230:5949
 mdt default 239.232.0.142
 mdt data 239.232.143.0 0.0.0.255 threshold 1
 mdt log-reuse
!
ip vrf SERPRO_SLS_DNIT_05:5908
 rd 4230:5908
 route-target export 4230:5908
 route-target import 4230:5908
!
ip vrf SERPRO_SLS_DNIT_06:5894
 rd 4230:5894
 route-target export 4230:5894
 route-target import 4230:5894
!
ip vrf SERPRO_SLS_PGFN_01:5895
 rd 4230:5895
 route-target export 4230:5895
 route-target import 4230:5895
!
ip vrf SERPRO_SLS_RFB_01:5848
 rd 4230:5848
 route-target export 4230:5848
 route-target import 4230:5848
 mdt default 239.232.0.104
 mdt data 239.232.105.0 0.0.0.255 threshold 1
 mdt log-reuse
!
ip vrf SERPRO_SLS_RFB_02:5881
 rd 4230:5881
 route-target export 4230:5881
 route-target import 4230:5881
 mdt default 239.232.0.118
 mdt data 239.232.119.0 0.0.0.255 threshold 1
 mdt log-reuse
!
ip vrf SERPRO_SLS_RFB_03:5904
 rd 4230:5904
 route-target export 4230:5904
 route-target import 4230:5904
 mdt default 239.232.0.126
 mdt data 239.232.127.0 0.0.0.255 threshold 1
 mdt log-reuse
!
ip vrf SERPRO_SLS_RFB_04:5905
 rd 4230:5905
 route-target export 4230:5905
 route-target import 4230:5905
 mdt default 239.232.0.127
 mdt data 239.232.128.0 0.0.0.255 threshold 1
 mdt log-reuse
!
ip vrf SERPRO_SLS_RFB_05:5917
 rd 4230:5917
 route-target export 4230:5917
 route-target import 4230:5917
 mdt default 239.232.0.135
 mdt data 239.232.136.0 0.0.0.255 threshold 1
 mdt log-reuse
!
ip vrf SERPRO_SLS_RFB_06:5918
 rd 4230:5918
 route-target export 4230:5918
 route-target import 4230:5918
 mdt default 239.232.0.136
 mdt data 239.232.137.0 0.0.0.255 threshold 1
 mdt log-reuse
!
ip vrf SERPRO_SLS_RFB_08:5907
 rd 4230:5907
 route-target export 4230:5907
 route-target import 4230:5907
 mdt default 239.232.0.128
 mdt data 239.232.129.0 0.0.0.255 threshold 1
 mdt log-reuse
!
ip vrf SERPRO_SLS_RFB_09:5913
 rd 4230:5913
 route-target export 4230:5913
 route-target import 4230:5913
 mdt default 239.232.0.132
 mdt data 239.232.133.0 0.0.0.255 threshold 1
 mdt log-reuse
!
ip vrf SERPRO_SLS_RFB_10:5909
 rd 4230:5909
 route-target export 4230:5909
 route-target import 4230:5909
 mdt default 239.232.0.129
 mdt data 239.232.130.0 0.0.0.255 threshold 1
 mdt log-reuse
!
ip vrf SERPRO_SLS_RFB_11:5911
 rd 4230:5911
 route-target export 4230:5911
 route-target import 4230:5911
 mdt default 239.232.0.131
 mdt data 239.232.132.0 0.0.0.255 threshold 1
 mdt log-reuse
!
ip vrf SERPRO_SLS_RFB_12:6238
 rd 4230:6238
 route-target export 4230:6238
 route-target import 4230:6238
 mdt default 239.232.0.244
 mdt data 239.232.245.0 0.0.0.255 threshold 1
 mdt log-reuse
!
ip vrf SERPRO_SLS_RIS_01:5892
 rd 4230:5892
 route-target export 4230:5892
 route-target import 4230:5892
!
ip vrf SESC:1916
 rd 4230:1916
 route-target export 4230:1916
 route-target export 4230:5155
 route-target import 4230:1916
 route-target import 4230:1337
 mdt default 239.232.0.3
 mdt data 239.232.4.0 0.0.0.255 threshold 1
 mdt log-reuse
!
ip vrf SESCOP:6219
 rd 4230:6219
 route-target export 4230:6219
 route-target export 4230:5155
 route-target import 4230:6219
 route-target import 4230:1337
!
ip vrf SET_MA:3377
 rd 4230:3377
 route-target export 4230:3377
 route-target import 4230:3377
!
ip vrf SOLARBR:6759
 rd 4230:6759
 route-target export 4230:6759
 route-target import 4230:6759
!
ip vrf SUPERMMACIEL:3754
 rd 4230:3754
 route-target export 4230:3754
 route-target export 4230:3108
 route-target import 4230:3754
 route-target import 4230:3107
!
ip vrf TAGUATURVEIC:3519
 rd 4230:3519
 route-target export 4230:3519
 route-target export 4230:3108
 route-target import 4230:3519
 route-target import 4230:3107
 route-target import 4230:1337
!
ip vrf TECBAN:1221
 rd 4230:1221
 route-target export 4230:1221
 route-target import 4230:1273
!
ip vrf TECBAN_NOVA:3642
 rd 4230:3642
 route-target export 4230:3642
 route-target export 4230:3108
 route-target import 4230:3642
 route-target import 4230:3107
 route-target import 4230:1337
!
ip vrf TECELAGEMAV:2642
 rd 4230:2642
 route-target export 4230:2642
 route-target export 4230:5155
 route-target import 4230:2642
 route-target import 4230:1337
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
ip vrf TESTE_TMX:200001
 rd 4230:200001
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
ip vrf TRT16:3540
 rd 4230:3540
 export map TRT-XX_EXPORT_MAP
 route-target export 4230:3540
 route-target export 1024:1231323
 route-target import 4230:3540
 route-target import 1024:1230323
!
ip vrf VESPER-1XRTT:3997
 rd 4230:3997
 route-target export 4230:3997
 route-target import 4230:3997
!
ip vrf WALMART:3141
 rd 4230:3141
 route-target export 4230:3141
 route-target import 4230:3141
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
ip multicast-routing vrf BBRASIL_PAE:7041 distributed
ip multicast-routing vrf FUNASA:3094 distributed
ip multicast-routing vrf SERPRO_SLS_RFB_01:5848 distributed
ip multicast-routing vrf SERPRO_SLS_RFB_02:5881 distributed
ip multicast-routing vrf SERPRO_SLS_RFB_03:5904 distributed
ip multicast-routing vrf SERPRO_SLS_RFB_04:5905 distributed
ip multicast-routing vrf SERPRO_SLS_RFB_05:5917 distributed
ip multicast-routing vrf SERPRO_SLS_RFB_06:5918 distributed
ip multicast-routing vrf SERPRO_SLS_RFB_08:5907 distributed
ip multicast-routing vrf SERPRO_SLS_RFB_09:5913 distributed
ip multicast-routing vrf SERPRO_SLS_RFB_10:5909 distributed
ip multicast-routing vrf SERPRO_SLS_RFB_11:5911 distributed
ip multicast-routing vrf SERPRO_SLS_RFB_12:6238 distributed
ip multicast-routing vrf SESC:1916 distributed
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
class-map match-all AF32
  match ip dscp 28 
class-map match-all Video_SERPRO
  match ip dscp 34 
class-map match-all Bulk_Q6
  match ip dscp 8  10  12  14  32 
class-map match-any STANDARD_NAC
  match ip dscp 0 
class-map match-all BestEffort
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
class-map match-any STANDARD
  match ip dscp 0 
class-map match-any SILVER_AF4x_MCI
  match ip dscp 32  34  36  38 
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
class-map match-all DADOS_TCU
  match ip dscp 18 
class-map match-all CoPP-Special
  match access-group name CoPP-Special
class-map match-all CoPP-Arp
  match protocol arp
class-map match-all Voz
  match ip dscp 46 
class-map match-all VozVideo_SERPRO
  match ip dscp 34  40  46 
class-map match-any GOLD_EF_MCI
  match ip dscp 40  46 
class-map match-any NETWORK_CONTROL
  match ip dscp 16  48  56 
class-map match-all VIDEOCONF_TCU
  match ip dscp 34 
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
class-map match-all STREAMING
  match ip dscp 26 
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
class-map match-all MissaoCritica
  match ip dscp 24  26 
class-map match-all CoPP-PE-CE-routing
  match access-group name CoPP-PE-CE-routing
class-map match-all Interativa_SERPRO
  match ip dscp 12  18  20  22 
class-map match-all Voz_Q6
  match ip dscp 40  46 
!
!
policy-map QPI_A_512K_11_N_0_34_25_17_4_8
  class Voz_Q6
   police cir percent 11 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 34 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Interativa_Q6
   police cir percent 25 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Bulk_Q6
   police cir percent 17 conform-action set-mpls-exp-imposition-transmit 4 exceed-action set-mpls-exp-imposition-transmit 1
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
policy-map QPI_A_2048K_8_N_0_59_17_0_2_13
  class Voz_Q6
   police cir percent 8 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 59 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Interativa_Q6
   police cir percent 17 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_A_1024K_21_N_0_15_35_8_2_1
  class Voz_Q6
   police cir percent 21 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 15 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Interativa_Q6
   police cir percent 35 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Bulk_Q6
   police cir percent 8 conform-action set-mpls-exp-imposition-transmit 4 exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_A_256K_42_C_0_7_0_0_7_43
  class Voz_Q6
   police cir percent 42 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 7 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_A_2048K_0_N_0_61_14_7_1_16
  class MissaoCritica_Q6
   police cir percent 61 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Interativa_Q6
   police cir percent 14 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Bulk_Q6
   police cir percent 7 conform-action set-mpls-exp-imposition-transmit 4 exceed-action set-mpls-exp-imposition-transmit 1
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
policy-map QPI_A_512K_19_N_0_0_0_2_4_71
  class Voz_Q6
   police cir percent 19 conform-action transmit  exceed-action drop 
  class Bulk_Q6
   police cir percent 2 conform-action set-mpls-exp-imposition-transmit 4 exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPO_A_2048K_0_0_61_14_7_1_16
  class MissaoCritica_Q6
    bandwidth percent 61
    bandwidth remaining percent 61
    random-detect dscp-based
    random-detect dscp 24 56 packets 120 packets 1
    random-detect dscp 26 56 packets 120 packets 1
    random-detect dscp 28 56 packets 120 packets 1
    random-detect dscp 30 56 packets 120 packets 1
    queue-limit 240 packets
  class Interativa_Q6
    bandwidth percent 14
    bandwidth remaining percent 14
    random-detect dscp-based
    random-detect dscp 18 14 packets 30 packets 1
    random-detect dscp 20 14 packets 30 packets 1
    random-detect dscp 22 14 packets 30 packets 1
    queue-limit 60 packets
  class Bulk_Q6
    bandwidth percent 7
    bandwidth remaining percent 7
    random-detect dscp-based
    random-detect dscp 8 12 packets 20 packets 1
    random-detect dscp 10 12 packets 20 packets 1
    random-detect dscp 12 12 packets 20 packets 1
    random-detect dscp 14 12 packets 20 packets 1
    random-detect dscp 32 12 packets 20 packets 1
    queue-limit 40 packets
  class NetworkControl_Q6
    bandwidth percent 1
    bandwidth remaining percent 1
    queue-limit 18 packets
  class class-default
    bandwidth percent 16
    bandwidth remaining percent 16
    random-detect dscp-based
    random-detect dscp 0 14 packets 30 packets 1
    queue-limit 60 packets
policy-map QDO_A_2048K_0_0_61_14_7_1_16
  class class-default
    shape average 2048000
   service-policy QPO_A_2048K_0_0_61_14_7_1_16
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
policy-map QPI_A_2048K_24_N_0_41_0_0_2_32
  class Voz_Q6
   police cir percent 24 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 41 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map PM_V10_QPO_BBONE_256_V1
policy-map QPO_BBONE_256_V1
  class class-default
    shape average 256000
   service-policy PM_V10_QPO_BBONE_256_V1
policy-map QPO_BBONE_32000_V1
  class class-default
    shape average 32000000
policy-map QPO_BBONE_10000_V1
  class class-default
    shape average 10000000
policy-map QPI_A_1024K_21_N_0_11_11_36_2_18
  class Voz_Q6
   police cir percent 21 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 11 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Interativa_Q6
   police cir percent 11 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Bulk_Q6
   police cir percent 36 conform-action set-mpls-exp-imposition-transmit 4 exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QDI_A_1024K_21_0_11_11_36_2_18
  class class-default
   police rate 1024000 child-conform-aware conform-action transmit  exceed-action drop 
   service-policy QPI_A_1024K_21_N_0_11_11_36_2_18
policy-map QPO_A_2048K_8_0_59_17_0_2_13
  class Voz_Q6
    priority
   police cir percent 8 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 59
    bandwidth remaining percent 59
    random-detect dscp-based
    random-detect dscp 24 56 packets 120 packets 1
    random-detect dscp 26 56 packets 120 packets 1
    random-detect dscp 28 56 packets 120 packets 1
    random-detect dscp 30 56 packets 120 packets 1
    queue-limit 240 packets
  class Interativa_Q6
    bandwidth percent 17
    bandwidth remaining percent 17
    random-detect dscp-based
    random-detect dscp 18 14 packets 30 packets 1
    random-detect dscp 20 14 packets 30 packets 1
    random-detect dscp 22 14 packets 30 packets 1
    queue-limit 60 packets
  class NetworkControl_Q6
    bandwidth percent 2
    bandwidth remaining percent 2
    queue-limit 26 packets
  class class-default
    bandwidth percent 13
    bandwidth remaining percent 13
    random-detect dscp-based
    random-detect dscp 0 14 packets 30 packets 1
    queue-limit 60 packets
policy-map QDO_A_2048K_8_0_59_17_0_2_13
  class class-default
    shape average 2048000
   service-policy QPO_A_2048K_8_0_59_17_0_2_13
policy-map PM_V10_QPO_BBONE_512_V1
policy-map QPO_BBONE_512_V1
  class class-default
    shape average 512000
   service-policy PM_V10_QPO_BBONE_512_V1
policy-map QDI_A_2048K_0_0_61_14_7_1_16
  class class-default
   police rate 2048000 child-conform-aware conform-action transmit  exceed-action drop 
   service-policy QPI_A_2048K_0_N_0_61_14_7_1_16
policy-map QPI_SERPRO_512K_V1
  class Voz_SERPRO
   police cir percent 9 conform-action transmit  exceed-action drop 
  class MissaoCritica_SERPRO
   police cir percent 20 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Interativa_SERPRO
   police cir percent 41 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_A_2048K_7_N_13_38_0_0_2_39
  class Voz_Q6
   police cir percent 7 conform-action transmit  exceed-action drop 
  class Video_Q6
   police cir percent 13 conform-action set-mpls-exp-imposition-transmit 5 exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 38 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map PM_V10_QPO_BBONE_34000_V1
policy-map QPO_BBONE_34000_V1
  class class-default
    shape average 34000000
   service-policy PM_V10_QPO_BBONE_34000_V1
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
policy-map QPO_A_1024K_21_0_11_11_36_2_18
  class Voz_Q6
    priority
   police cir percent 21 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 11
    bandwidth remaining percent 11
    random-detect dscp-based
    random-detect dscp 24 7 packets 15 packets 1
    random-detect dscp 26 7 packets 15 packets 1
    random-detect dscp 28 7 packets 15 packets 1
    random-detect dscp 30 7 packets 15 packets 1
    queue-limit 30 packets
  class Interativa_Q6
    bandwidth percent 11
    bandwidth remaining percent 11
    random-detect dscp-based
    random-detect dscp 18 7 packets 15 packets 1
    random-detect dscp 20 7 packets 15 packets 1
    random-detect dscp 22 7 packets 15 packets 1
    queue-limit 30 packets
  class Bulk_Q6
    bandwidth percent 36
    bandwidth remaining percent 36
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
    bandwidth percent 18
    bandwidth remaining percent 18
    random-detect dscp-based
    random-detect dscp 0 12 packets 20 packets 1
    queue-limit 40 packets
policy-map QDO_A_1024K_21_0_11_11_36_2_18
  class class-default
    shape average 1024000
   service-policy QPO_A_1024K_21_0_11_11_36_2_18
policy-map QPI_A_2048K_13_N_13_13_11_0_4_45
  class Voz_Q6
   police cir percent 13 conform-action transmit  exceed-action drop 
  class Video_Q6
   police cir percent 13 conform-action set-mpls-exp-imposition-transmit 5 exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 13 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Interativa_Q6
   police cir percent 11 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QDI_A_2048K_8_0_59_17_0_2_13
  class class-default
   police rate 2048000 child-conform-aware conform-action transmit  exceed-action drop 
   service-policy QPI_A_2048K_8_N_0_59_17_0_2_13
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
policy-map QPI_A_512K_10_N_0_2_0_0_4_83
  class Voz_Q6
   police cir percent 10 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 2 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map PM_V10_QPO_BBONE_50000_V1
policy-map QPO_BBONE_50000_V1
  class class-default
    shape average 50000000
   service-policy PM_V10_QPO_BBONE_50000_V1
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
policy-map QPI_A_1024K_12_N_0_50_0_0_2_34
  class Voz_Q6
   police cir percent 12 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 50 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPO_A_1024K_13_0_63_13_0_2_7
  class Voz_Q6
    priority
   police cir percent 13 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 63
    bandwidth remaining percent 63
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
    bandwidth percent 7
    bandwidth remaining percent 7
    random-detect dscp-based
    random-detect dscp 0 7 packets 15 packets 1
    queue-limit 30 packets
policy-map QDO_A_1024K_13_0_63_13_0_2_7
  class class-default
    shape average 1024000
   service-policy QPO_A_1024K_13_0_63_13_0_2_7
policy-map QPI_A_2048K_30_N_0_49_0_0_2_17
  class Voz_Q6
   police cir percent 30 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 49 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPO_2048K_BBrasil_NAC_GACC_V1
  class TEMPO_REAL_NAC
    priority
   police cir percent 30 conform-action transmit  exceed-action drop 
  class MISSAO_CRITICA_NAC
    bandwidth percent 40
    bandwidth remaining percent 40
    random-detect dscp-based
    random-detect dscp 32 32 packets 64 packets 1
    random-detect dscp 34 32 packets 64 packets 1
    random-detect dscp 38 32 packets 64 packets 1
    queue-limit 128 packets
  class GERENCIAMENTO_NAC
    bandwidth percent 5
    bandwidth remaining percent 5
    random-detect dscp-based
    random-detect dscp 24 7 packets 15 packets 1
    random-detect dscp 26 7 packets 15 packets 1
    random-detect dscp 30 7 packets 15 packets 1
    queue-limit 30 packets
  class NETWORK_CONTROL_NAC
    bandwidth percent 1
    bandwidth remaining percent 1
    random-detect dscp-based
    random-detect dscp 48 5 packets 13 packets 1
    queue-limit 26 packets
  class STANDARD_NAC
    bandwidth percent 20
    bandwidth remaining percent 20
    random-detect dscp-based
    random-detect dscp 0 24 packets 40 packets 1
    queue-limit 80 packets
policy-map QDO_2048K_BBrasil_NAC_GACC_V1
  class class-default
    shape average 2048000
   service-policy QPO_2048K_BBrasil_NAC_GACC_V1
policy-map QPI_A_1024K_20_N_0_25_0_0_2_51
  class Voz_Q6
   police cir percent 20 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 25 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map PM_V10_QPO_BBONE_128_V1
policy-map QPO_BBONE_128_V1
  class class-default
    shape average 128000
   service-policy PM_V10_QPO_BBONE_128_V1
policy-map QPI_BBONE_S_32000_V1
  class class-default
   police 32000000 1000000 1000000 conform-action set-dscp-transmit default exceed-action drop 
policy-map QPI_BBONE_S_10000_V1
  class class-default
   police 10000000 312500 312500 conform-action set-dscp-transmit default exceed-action drop 
policy-map QDI_A_256K_42_0_7_0_0_7_43
  class class-default
   police rate 256000 child-conform-aware conform-action transmit  exceed-action drop 
   service-policy QPI_A_256K_42_C_0_7_0_0_7_43
policy-map QPI_A_512K_7_N_0_0_13_0_4_75
  class Voz_Q6
   police cir percent 7 conform-action transmit  exceed-action drop 
  class Interativa_Q6
   police cir percent 13 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_A_512K_5_N_0_2_13_0_4_75
  class Voz_Q6
   police cir percent 5 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 2 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Interativa_Q6
   police cir percent 13 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_A_512K_5_N_0_0_13_0_4_77
  class Voz_Q6
   police cir percent 5 conform-action transmit  exceed-action drop 
  class Interativa_Q6
   police cir percent 13 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_A_512K_5_N_0_33_0_0_4_57
  class Voz_Q6
   police cir percent 5 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 33 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_A_2048K_8_N_0_50_16_0_2_12
  class Voz_Q6
   police cir percent 8 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 50 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Interativa_Q6
   police cir percent 16 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_A_64K_38_N_0_7_0_0_13_39
  class Voz_Q6
   police cir percent 38 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 7 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPO_A_512K_5_0_33_0_0_4_57
  class Voz_Q6
    priority
   police cir percent 5 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 33
    bandwidth remaining percent 33
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
    bandwidth percent 57
    bandwidth remaining percent 57
    random-detect dscp-based
    random-detect dscp 0 14 packets 30 packets 1
    queue-limit 60 packets
policy-map QDO_A_512K_5_0_33_0_0_4_57
  class class-default
    shape average 512000
   service-policy QPO_A_512K_5_0_33_0_0_4_57
policy-map PM_V10_QPO_BBONE_800_V1
policy-map QPO_BBONE_800_V1
  class class-default
    shape average 800000
   service-policy PM_V10_QPO_BBONE_800_V1
policy-map QPI_A_256K_13_C_0_0_0_0_7_79
  class Voz_Q6
   police cir percent 26 conform-action transmit  exceed-action drop 
  class class-default
   set mpls experimental imposition 0
policy-map QPI_A_1024K_25_N_0_40_0_0_2_32
  class Voz_Q6
   police cir percent 25 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 40 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_A_2048K_5_N_0_0_0_0_2_92
  class Voz_Q6
   police cir percent 5 conform-action transmit  exceed-action drop 
  class class-default
   set mpls experimental imposition 0
policy-map QDI_A_2048K_5_0_0_0_0_2_92
  class class-default
   police rate 2048000 child-conform-aware conform-action transmit  exceed-action drop 
   service-policy QPI_A_2048K_5_N_0_0_0_0_2_92
policy-map QPI_A_1024K_4_N_0_21_32_0_2_40
  class Voz_Q6
   police cir percent 4 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 21 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Interativa_Q6
   police cir percent 32 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_A_2048K_13_N_0_56_0_0_2_28
  class Voz_Q6
   police cir percent 13 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 56 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_A_1024K_13_N_0_63_13_0_2_7
  class Voz_Q6
   police cir percent 13 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 63 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Interativa_Q6
   police cir percent 13 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_A_2048K_13_N_0_3_0_0_1_9
  class Voz_Q6
   police cir percent 13 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 3 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPO_A_1024K_20_0_25_0_0_2_51
  class Voz_Q6
    priority
   police cir percent 20 conform-action transmit  exceed-action drop 
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
    queue-limit 18 packets
  class class-default
    bandwidth percent 51
    bandwidth remaining percent 51
    random-detect dscp-based
    random-detect dscp 0 32 packets 48 packets 1
    queue-limit 96 packets
policy-map QDO_A_1024K_20_0_25_0_0_2_51
  class class-default
    shape average 1024000
   service-policy QPO_A_1024K_20_0_25_0_0_2_51
policy-map QPO_A_2048K_30_0_49_0_0_2_17
  class Voz_Q6
    priority
   police cir percent 30 conform-action transmit  exceed-action drop 
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
    bandwidth percent 2
    bandwidth remaining percent 2
    queue-limit 26 packets
  class class-default
    bandwidth percent 17
    bandwidth remaining percent 17
    random-detect dscp-based
    random-detect dscp 0 14 packets 30 packets 1
    queue-limit 60 packets
policy-map QDO_A_2048K_30_0_49_0_0_2_17
  class class-default
    shape average 2048000
   service-policy QPO_A_2048K_30_0_49_0_0_2_17
policy-map QPI_A_256K_19_N_0_38_22_0_7_13
  class Voz_Q6
   police cir percent 19 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 38 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Interativa_Q6
   police cir percent 22 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
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
policy-map QDI_A_512K_5_0_33_0_0_4_57
  class class-default
   police rate 512000 child-conform-aware conform-action transmit  exceed-action drop 
   service-policy QPI_A_512K_5_N_0_33_0_0_4_57
policy-map QPO_512K_10_0_1_0_0_4_82
  class Voz_Q6
    priority
   police cir percent 10 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 1
    random-detect dscp-based
    random-detect dscp 24 5 packets 7 packets 1
    random-detect dscp 26 5 packets 7 packets 1
    random-detect dscp 28 5 packets 7 packets 1
    random-detect dscp 30 5 packets 7 packets 1
  class NetworkControl_Q6
    bandwidth percent 4
  class BestEffort_Q6
    bandwidth percent 82
    random-detect dscp-based
    random-detect dscp 0 24 packets 40 packets 1
policy-map QPI_BBONE_S_50000_V1
  class class-default
   police 50000000 1562500 1562500 conform-action set-dscp-transmit default exceed-action drop 
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
policy-map QDO_A_2048K_5_0_0_0_0_2_92
  class class-default
    shape average 2048000
   service-policy QPO_A_2048K_5_0_0_0_0_2_92
policy-map QPI_A_512K_25_N_0_32_25_0_4_13
  class Voz_Q6
   police cir percent 25 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 32 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Interativa_Q6
   police cir percent 25 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QDI_A_1024K_20_0_25_0_0_2_51
  class class-default
   police rate 1024000 child-conform-aware conform-action transmit  exceed-action drop 
   service-policy QPI_A_1024K_20_N_0_25_0_0_2_51
policy-map QDI_A_2048K_30_0_49_0_0_2_17
  class class-default
   police rate 2048000 child-conform-aware conform-action transmit  exceed-action drop 
   service-policy QPI_A_2048K_30_N_0_49_0_0_2_17
policy-map QPI_A_256K_26_N_0_4_0_0_7_62
  class Voz_Q6
   police cir percent 26 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 4 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_A_2048K_6_N_0_1_0_0_2_90
  class Voz_Q6
   police cir percent 6 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 1 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QDI_A_1024K_13_0_63_13_0_2_7
  class class-default
   police rate 1024000 child-conform-aware conform-action transmit  exceed-action drop 
   service-policy QPI_A_1024K_13_N_0_63_13_0_2_7
policy-map QPI_2048K_BBrasil_NAC_GACC_V1
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
policy-map QDI_2048K_BBrasil_NAC_GACC_V1
  class class-default
   police rate 2048000 conform-action transmit  exceed-action drop 
   service-policy QPI_2048K_BBrasil_NAC_GACC_V1
policy-map QPI_A_2048K_24_N_0_25_0_0_1_48
  class Voz_Q6
   police cir percent 24 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 25 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPO_384K_13_0_2_0_0_5_77
  class Voz_Q6
    priority
   police cir percent 13 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 2
    random-detect dscp-based
    random-detect dscp 24 5 packets 7 packets 1
    random-detect dscp 26 5 packets 7 packets 1
    random-detect dscp 28 5 packets 7 packets 1
    random-detect dscp 30 5 packets 7 packets 1
  class NetworkControl_Q6
    bandwidth percent 5
  class BestEffort_Q6
    bandwidth percent 77
    random-detect dscp-based
    random-detect dscp 0 12 packets 20 packets 1
policy-map QOS_POLICY_OUT_12P_78P
  class REALTIME
    priority
   police cir percent 12 conform-action transmit  exceed-action drop 
  class BUSINESS
    bandwidth percent 78
    random-detect dscp-based
    random-detect dscp 24 24 packets 40 packets 1
    random-detect dscp 26 24 packets 40 packets 1
    random-detect dscp 28 24 packets 40 packets 1
    random-detect dscp 30 24 packets 40 packets 1
policy-map QPI_BBONE_S_34000_V1
  class class-default
   police 34000000 1062500 1062500 conform-action set-dscp-transmit default exceed-action drop 
policy-map QPO_A_256K_42_0_7_0_0_7_43
  class Voz_Q6
    priority
   police cir percent 42 conform-action transmit  exceed-action drop 
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
    bandwidth percent 43
    bandwidth remaining percent 43
    random-detect dscp-based
    random-detect dscp 0 7 packets 15 packets 1
    queue-limit 30 packets
policy-map QDO_A_256K_42_0_7_0_0_7_43
  class class-default
    shape average 256000
   service-policy QPO_A_256K_42_0_7_0_0_7_43
policy-map QPI_A_4096K_4_N_0_0_0_0_1_94
  class Voz_Q6
   police cir percent 4 conform-action transmit  exceed-action drop 
  class class-default
   set mpls experimental imposition 0
policy-map QDI_SERPRO_512K_V1
  class class-default
   police rate 512000 child-conform-aware conform-action transmit  exceed-action drop 
   service-policy QPI_SERPRO_512K_V1
policy-map QPO_A_256K_13_0_0_0_0_7_79
  class Voz_Q6
    priority
   police cir percent 13 conform-action transmit  exceed-action drop 
  class NetworkControl_Q6
    bandwidth percent 7
    bandwidth remaining percent 7
    queue-limit 18 packets
  class class-default
    bandwidth percent 79
    bandwidth remaining percent 79
    random-detect dscp-based
    random-detect dscp 0 12 packets 20 packets 1
    queue-limit 40 packets
policy-map QPO_A_512K_10_0_2_0_0_4_83
  class Voz_Q6
    priority
   police cir percent 10 conform-action transmit  exceed-action drop 
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
    bandwidth percent 83
    bandwidth remaining percent 83
    random-detect dscp-based
    random-detect dscp 0 24 packets 40 packets 1
    queue-limit 80 packets
policy-map QPO_Correios_2048K_PPP_IOS_D_V1
  class REAL_TIME_CORREIOS
   police cir percent 1 conform-action transmit  exceed-action drop 
  class MISSAO_CRITICA_CORREIOS
    bandwidth percent 40
    random-detect dscp-based
    random-detect dscp 34 32 packets 64 packets 1
    random-detect dscp 36 32 packets 64 packets 1
    random-detect dscp 38 32 packets 64 packets 1
    queue-limit 128 packets
  class GERENCIAMENTO_CORREIOS
    bandwidth percent 9
    random-detect dscp-based
    random-detect dscp 26 32 packets 64 packets 1
    random-detect dscp 28 32 packets 64 packets 1
    random-detect dscp 30 32 packets 64 packets 1
    queue-limit 128 packets
  class NETWORK_CONTROL_CORREIOS
    bandwidth percent 1
    random-detect dscp-based
    random-detect dscp 16 32 packets 64 packets 1
    random-detect dscp 48 32 packets 64 packets 1
    random-detect dscp 56 32 packets 64 packets 1
    queue-limit 64 packets
  class BEST_EFFORT
    bandwidth percent 48
    random-detect dscp-based
    random-detect dscp 0 32 packets 64 packets 1
    queue-limit 180 packets
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
policy-map QPO_A_2048K_13_13_13_11_0_4_45
  class VozVideo_Q6
    priority
   police cir percent 26 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 13
    bandwidth remaining percent 13
    random-detect dscp-based
    random-detect dscp 24 14 packets 30 packets 1
    random-detect dscp 26 14 packets 30 packets 1
    random-detect dscp 28 14 packets 30 packets 1
    random-detect dscp 30 14 packets 30 packets 1
    queue-limit 60 packets
  class Interativa_Q6
    bandwidth percent 11
    bandwidth remaining percent 11
    random-detect dscp-based
    random-detect dscp 18 12 packets 20 packets 1
    random-detect dscp 20 12 packets 20 packets 1
    random-detect dscp 22 12 packets 20 packets 1
    queue-limit 40 packets
  class NetworkControl_Q6
    bandwidth percent 4
    bandwidth remaining percent 4
    queue-limit 30 packets
  class class-default
    bandwidth percent 45
    bandwidth remaining percent 45
    random-detect dscp-based
    random-detect dscp 0 32 packets 64 packets 1
    queue-limit 128 packets
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
policy-map QPI_BBONE_N_512_V1
  class class-default
   police 512000 16000 16000 conform-action set-mpls-exp-imposition-transmit 0 exceed-action drop 
policy-map QPO_A_2048K_7_13_38_0_0_2_39
  class VozVideo_Q6
    priority
   police cir percent 20 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 38
    bandwidth remaining percent 38
    random-detect dscp-based
    random-detect dscp 24 32 packets 64 packets 1
    random-detect dscp 26 32 packets 64 packets 1
    random-detect dscp 28 32 packets 64 packets 1
    random-detect dscp 30 32 packets 64 packets 1
    queue-limit 128 packets
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
policy-map QPI_BBONE_N_256_V1
  class class-default
   police 256000 8000 8000 conform-action set-mpls-exp-imposition-transmit 0 exceed-action drop 
policy-map QPO_A_512K_19_0_0_0_2_4_71
  class Voz_Q6
    priority
   police cir percent 19 conform-action transmit  exceed-action drop 
  class Bulk_Q6
    bandwidth percent 2
    bandwidth remaining percent 2
    random-detect dscp-based
    random-detect dscp 8 6 packets 8 packets 1
    random-detect dscp 10 6 packets 8 packets 1
    random-detect dscp 12 6 packets 8 packets 1
    random-detect dscp 14 6 packets 8 packets 1
    random-detect dscp 32 6 packets 8 packets 1
    queue-limit 16 packets
  class NetworkControl_Q6
    bandwidth percent 4
    bandwidth remaining percent 4
    queue-limit 18 packets
  class class-default
    bandwidth percent 71
    bandwidth remaining percent 71
    random-detect dscp-based
    random-detect dscp 0 14 packets 30 packets 1
    queue-limit 60 packets
policy-map QPO_A_2048K_24_0_41_0_0_2_32
  class Voz_Q6
    priority
   police cir percent 24 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 41
    bandwidth remaining percent 41
    random-detect dscp-based
    random-detect dscp 24 32 packets 64 packets 1
    random-detect dscp 26 32 packets 64 packets 1
    random-detect dscp 28 32 packets 64 packets 1
    random-detect dscp 30 32 packets 64 packets 1
    queue-limit 128 packets
  class NetworkControl_Q6
    bandwidth percent 2
    bandwidth remaining percent 2
    queue-limit 26 packets
  class class-default
    bandwidth percent 32
    bandwidth remaining percent 32
    random-detect dscp-based
    random-detect dscp 0 32 packets 48 packets 1
    queue-limit 96 packets
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
policy-map QPO_A_1024K_21_0_15_35_8_2_1
  class Voz_Q6
    priority
   police cir percent 21 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 15
    bandwidth remaining percent 15
    random-detect dscp-based
    random-detect dscp 24 12 packets 20 packets 1
    random-detect dscp 26 12 packets 20 packets 1
    random-detect dscp 28 12 packets 20 packets 1
    random-detect dscp 30 12 packets 20 packets 1
    queue-limit 40 packets
  class Interativa_Q6
    bandwidth percent 35
    bandwidth remaining percent 35
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
    queue-limit 26 packets
  class class-default
    bandwidth percent 1
    bandwidth remaining percent 1
    random-detect dscp-based
    random-detect dscp 0 5 packets 13 packets 1
    queue-limit 26 packets
policy-map QDO_SERPRO_512K_V1
  class class-default
    shape average 512000
   service-policy QPO_SERPRO_512K_V1
policy-map QPO_A_512K_11_0_34_25_17_4_8
  class Voz_Q6
    priority
   police cir percent 11 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 34
    bandwidth remaining percent 34
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
    bandwidth percent 17
    bandwidth remaining percent 17
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
policy-map QPI_Correios_2048K_PPP_IOS_D_V1
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
policy-map QPI_384K_13_N_0_2_0_0_5_77
  class Voz_Q6
   police cir 48000 bc 4470 be 4470 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir 8000 bc 4470 be 4470 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
policy-map QPO_A_4096K_4_0_0_0_0_1_94
  class Voz_Q6
    priority
   police cir percent 4 conform-action transmit  exceed-action drop 
  class NetworkControl_Q6
    bandwidth percent 1
    bandwidth remaining percent 1
    queue-limit 26 packets
  class class-default
    bandwidth percent 94
    bandwidth remaining percent 94
    random-detect dscp-based
    random-detect dscp 0 112 packets 240 packets 1
    queue-limit 480 packets
policy-map QOS_POLICY_OUT_A_5P_0P
  class REALTIME
    priority
   police cir percent 5 conform-action transmit  exceed-action drop 
policy-map QPO_Correios_1024K_PPP_IOS_D_V1
  class REAL_TIME_CORREIOS
    priority
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
policy-map QPO_A_256K_26_0_4_0_0_7_62
  class Voz_Q6
    priority
   police cir percent 26 conform-action transmit  exceed-action drop 
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
    bandwidth percent 62
    bandwidth remaining percent 62
    random-detect dscp-based
    random-detect dscp 0 12 packets 20 packets 1
    queue-limit 40 packets
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
policy-map QOS_POLICY_OUT_A_13P_60P
  class REALTIME
    priority
   police cir percent 13 conform-action transmit  exceed-action drop 
  class BUSINESS
    bandwidth percent 60
    random-detect dscp-based
    random-detect dscp 24 14 packets 30 packets 1
    random-detect dscp 26 14 packets 30 packets 1
    random-detect dscp 28 14 packets 30 packets 1
    random-detect dscp 30 14 packets 30 packets 1
policy-map QPO_A_2048K_24_0_25_0_0_1_48
  class Voz_Q6
    priority
   police cir percent 24 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 25
    bandwidth remaining percent 25
    random-detect dscp-based
    random-detect dscp 24 32 packets 48 packets 1
    random-detect dscp 26 32 packets 48 packets 1
    random-detect dscp 28 32 packets 48 packets 1
    random-detect dscp 30 32 packets 48 packets 1
    queue-limit 96 packets
  class NetworkControl_Q6
    bandwidth percent 1
    bandwidth remaining percent 1
    queue-limit 18 packets
  class class-default
    bandwidth percent 48
    bandwidth remaining percent 48
    random-detect dscp-based
    random-detect dscp 0 32 packets 64 packets 1
    queue-limit 128 packets
policy-map QPI_512K_10_N_0_1_0_0_4_82
  class Voz_Q6
   police cir 48000 bc 4470 be 4470 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir 8000 bc 4470 be 4470 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
policy-map QPO_A_512K_25_0_32_25_0_4_13
  class Voz_Q6
    priority
   police cir percent 25 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 32
    bandwidth remaining percent 32
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
  class NetworkControl_Q6
    bandwidth percent 4
    bandwidth remaining percent 4
    queue-limit 18 packets
  class class-default
    bandwidth percent 13
    bandwidth remaining percent 13
    random-detect dscp-based
    random-detect dscp 0 7 packets 15 packets 1
    queue-limit 30 packets
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
policy-map QPO_A_1024K_4_0_21_32_0_2_40
  class Voz_Q6
    priority
   police cir percent 4 conform-action transmit  exceed-action drop 
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
    bandwidth percent 32
    bandwidth remaining percent 32
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
    bandwidth percent 40
    bandwidth remaining percent 40
    random-detect dscp-based
    random-detect dscp 0 24 packets 40 packets 1
    queue-limit 80 packets
policy-map QPO_A_2048K_13_0_56_0_0_2_28
  class Voz_Q6
    priority
   police cir percent 13 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 56
    bandwidth remaining percent 56
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
    bandwidth percent 28
    bandwidth remaining percent 28
    random-detect dscp-based
    random-detect dscp 0 32 packets 48 packets 1
    queue-limit 96 packets
policy-map QPO_A_2048K_13_0_3_0_0_1_9
  class Voz_Q6
    priority
   police cir percent 13 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 3
    bandwidth remaining percent 3
    random-detect dscp-based
    random-detect dscp 24 24 packets 40 packets 1
    random-detect dscp 26 24 packets 40 packets 1
    random-detect dscp 28 24 packets 40 packets 1
    random-detect dscp 30 24 packets 40 packets 1
    queue-limit 80 packets
  class NetworkControl_Q6
    bandwidth percent 1
    bandwidth remaining percent 1
    queue-limit 80 packets
  class class-default
    bandwidth percent 9
    bandwidth remaining percent 9
    random-detect dscp-based
    random-detect dscp 0 32 packets 48 packets 1
    queue-limit 96 packets
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
policy-map QPO_A_64K_38_0_7_0_0_13_39
  class Voz_Q6
    priority
   police cir percent 38 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 7
    bandwidth remaining percent 7
    random-detect dscp-based
    random-detect dscp 24 5 packets 7 packets 1
    random-detect dscp 26 5 packets 7 packets 1
    random-detect dscp 28 5 packets 7 packets 1
    random-detect dscp 30 5 packets 7 packets 1
    queue-limit 14 packets
  class NetworkControl_Q6
    bandwidth percent 13
    bandwidth remaining percent 13
    queue-limit 16 packets
  class class-default
    bandwidth percent 39
    bandwidth remaining percent 39
    random-detect dscp-based
    random-detect dscp 0 5 packets 9 packets 1
    queue-limit 18 packets
policy-map QPI_BBONE_N_800_V1
  class class-default
   police 800000 25000 25000 conform-action set-mpls-exp-imposition-transmit 0 exceed-action drop 
policy-map QPI_BBONE_N_128_V1
  class class-default
   police 128000 4470 4470 conform-action set-mpls-exp-imposition-transmit 0 exceed-action drop 
policy-map QPO_A_512K_7_0_0_13_0_4_75
  class Voz_Q6
    priority
   police cir percent 7 conform-action transmit  exceed-action drop 
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
    bandwidth percent 75
    bandwidth remaining percent 75
    random-detect dscp-based
    random-detect dscp 0 24 packets 40 packets 1
    queue-limit 80 packets
policy-map QPO_A_512K_5_0_2_13_0_4_75
  class Voz_Q6
    priority
   police cir percent 5 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 2
    bandwidth remaining percent 2
    random-detect dscp-based
    random-detect dscp 24 6 packets 8 packets 1
    random-detect dscp 26 6 packets 8 packets 1
    random-detect dscp 28 6 packets 8 packets 1
    random-detect dscp 30 6 packets 8 packets 1
    queue-limit 16 packets
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
    bandwidth percent 75
    bandwidth remaining percent 75
    random-detect dscp-based
    random-detect dscp 0 24 packets 40 packets 1
    queue-limit 80 packets
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
policy-map QPI_Correios_1024K_PPP_IOS_D_V1
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
policy-map QPO_A_2048K_8_0_50_16_0_2_12
  class Voz_Q6
    priority
   police cir percent 8 conform-action transmit  exceed-action drop 
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
    bandwidth percent 16
    bandwidth remaining percent 16
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
    bandwidth percent 12
    bandwidth remaining percent 12
    random-detect dscp-based
    random-detect dscp 0 7 packets 15 packets 1
    queue-limit 30 packets
policy-map ZERA-EXP-Saida
  class class-default
   set mpls experimental imposition 0
policy-map QPO_A_1024K_12_0_50_0_0_2_34
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
  class NetworkControl_Q6
    bandwidth percent 2
    bandwidth remaining percent 2
    queue-limit 18 packets
  class class-default
    bandwidth percent 34
    bandwidth remaining percent 34
    random-detect dscp-based
    random-detect dscp 0 14 packets 30 packets 1
    queue-limit 60 packets
policy-map QPO_A_1024K_13_0_80_0_0_2_4
  class Voz_Q6
    priority
   police cir percent 13 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 80
    bandwidth remaining percent 80
    random-detect dscp-based
    random-detect dscp 24 32 packets 64 packets 1
    random-detect dscp 26 32 packets 64 packets 1
    random-detect dscp 28 32 packets 64 packets 1
    random-detect dscp 30 32 packets 64 packets 1
    queue-limit 128 packets
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
policy-map QPO_A_4096K_17_17_36_25_0_1_3
  class VozVideo_Q6
    priority
   police cir percent 34 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 36
    bandwidth remaining percent 36
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
    bandwidth percent 3
    bandwidth remaining percent 3
    random-detect dscp-based
    random-detect dscp 0 12 packets 20 packets 1
    queue-limit 40 packets
policy-map QPI_SERPRO_6000K_V1
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
policy-map QDI_SERPRO_6000K_V1
  class class-default
   police rate 6000000 child-conform-aware conform-action transmit  exceed-action drop 
   service-policy QPI_SERPRO_6000K_V1
policy-map QPO_A_512K_11_0_30_46_0_4_8
  class Voz_Q6
    priority
   police cir percent 11 conform-action transmit  exceed-action drop 
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
    bandwidth percent 46
    bandwidth remaining percent 46
    random-detect dscp-based
    random-detect dscp 18 12 packets 20 packets 1
    random-detect dscp 20 12 packets 20 packets 1
    random-detect dscp 22 12 packets 20 packets 1
    queue-limit 40 packets
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
   police rate 1024000 child-conform-aware conform-action transmit  exceed-action drop 
   service-policy QPI_SERPRO_1024K_V1
policy-map QPO_A_2048K_4_0_50_0_0_2_43
  class Voz_Q6
    priority
   police cir percent 4 conform-action transmit  exceed-action drop 
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
    bandwidth percent 43
    bandwidth remaining percent 43
    random-detect dscp-based
    random-detect dscp 0 32 packets 64 packets 1
    queue-limit 128 packets
policy-map QPO_A_4096K_7_18_13_13_7_2_39
  class VozVideo_Q6
    priority
   police cir percent 25 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 13
    bandwidth remaining percent 13
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
    random-detect dscp 18 32 packets 48 packets 1
    random-detect dscp 20 32 packets 48 packets 1
    random-detect dscp 22 32 packets 48 packets 1
    queue-limit 96 packets
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
    bandwidth percent 39
    bandwidth remaining percent 39
    random-detect dscp-based
    random-detect dscp 0 56 packets 120 packets 1
    queue-limit 240 packets
policy-map QPI_BBONE_N_1500_V1
  class class-default
   police 1504000 47000 47000 conform-action set-mpls-exp-imposition-transmit 0 exceed-action drop 
policy-map QPI_BBONE_N_1024_V1
  class class-default
   police 1024000 32000 32000 conform-action set-mpls-exp-imposition-transmit 0 exceed-action drop 
policy-map QPO_1024_154_256_157_81_67_54_0B_G_V3
  class VozVideo_Q6
    priority
   police cir percent 40 conform-action transmit  exceed-action drop 
  class MISSAO_CRITICA
    bandwidth percent 16
    random-detect dscp-based
    random-detect dscp 32 5 packets 13 packets 1
    random-detect dscp 36 5 packets 13 packets 1
    random-detect dscp 38 5 packets 13 packets 1
  class GERENCIAMENTO
    bandwidth percent 7
    random-detect dscp-based
    random-detect dscp 24 5 packets 9 packets 1
    random-detect dscp 26 5 packets 9 packets 1
    random-detect dscp 28 5 packets 9 packets 1
  class SUPORTE_AO_NEGOCIO
    bandwidth percent 6
    random-detect dscp-based
    random-detect dscp 16 6 packets 8 packets 1
    random-detect dscp 18 6 packets 8 packets 1
    random-detect dscp 22 6 packets 8 packets 1
  class NAO_CRITICO
    bandwidth percent 6
    random-detect dscp-based
    random-detect dscp 8 6 packets 8 packets 1
    random-detect dscp 10 6 packets 8 packets 1
    random-detect dscp 14 6 packets 8 packets 1
policy-map QPO_A_6144K_0_0_87_0_0_1_11
  class MissaoCritica_Q6
    bandwidth percent 87
    bandwidth remaining percent 87
    random-detect dscp-based
    random-detect dscp 24 224 packets 480 packets 1
    random-detect dscp 26 224 packets 480 packets 1
    random-detect dscp 28 224 packets 480 packets 1
    random-detect dscp 30 224 packets 480 packets 1
    queue-limit 960 packets
  class NetworkControl_Q6
    bandwidth percent 1
    bandwidth remaining percent 1
    queue-limit 30 packets
  class class-default
    bandwidth percent 11
    bandwidth remaining percent 11
    random-detect dscp-based
    random-detect dscp 0 32 packets 48 packets 1
    queue-limit 96 packets
policy-map QPO_A_2048K_7_0_50_0_0_1_40
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
    bandwidth percent 1
    bandwidth remaining percent 1
    queue-limit 18 packets
  class class-default
    bandwidth percent 40
    bandwidth remaining percent 40
    random-detect dscp-based
    random-detect dscp 0 32 packets 64 packets 1
    queue-limit 128 packets
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
   police rate 20000000 child-conform-aware conform-action transmit  exceed-action drop 
   service-policy QPI_SERPRO_20M_V1
policy-map QPO_64_0_0_40_8_0_0_0B_GSR_V1
  class MISSAO_CRITICA
    bandwidth percent 63
    random-detect dscp-based
    random-detect dscp 32 100 ms 300 ms
    random-detect dscp 36 100 ms 300 ms
    random-detect dscp 38 100 ms 300 ms
policy-map QPI_128K_25_C_20_25_10_10_7_2
  class Voz_Q6
   police cir percent 50 conform-action transmit  exceed-action drop 
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
policy-map QPO_A_2048K_20_30_33_0_0_2_14
  class VozVideo_Q6
    priority
   police cir percent 50 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 33
    bandwidth remaining percent 33
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
    bandwidth percent 14
    bandwidth remaining percent 14
    random-detect dscp-based
    random-detect dscp 0 14 packets 30 packets 1
    queue-limit 60 packets
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
policy-map QPO_SERPRO_20M_V1
  class VozVideo_SERPRO
    priority
   police cir percent 40 conform-action transmit  exceed-action drop 
  class MissaoCritica_SERPRO
    bandwidth percent 10
    random-detect dscp-based
    random-detect dscp 10 32 packets 64 packets 1
    random-detect dscp 26 32 packets 64 packets 1
    random-detect dscp 28 32 packets 64 packets 1
    random-detect dscp 30 32 packets 64 packets 1
  class Interativa_SERPRO
    bandwidth percent 30
    random-detect dscp-based
    random-detect dscp 12 112 packets 240 packets 1
    random-detect dscp 18 112 packets 240 packets 1
    random-detect dscp 20 112 packets 240 packets 1
    random-detect dscp 22 112 packets 240 packets 1
  class NetworkControl_SERPRO
    bandwidth percent 1
  class class-default
    bandwidth percent 16
    random-detect dscp-based
    random-detect dscp 0 56 packets 120 packets 1
    random-detect dscp 14 56 packets 120 packets 1
policy-map QDO_SERPRO_20M_V1
  class class-default
    shape average 20000000
   service-policy QPO_SERPRO_20M_V1
policy-map ZERA-DSCP
  class class-default
   set dscp 0
policy-map QPI_64_0_0_40_8_0_0_0B_GSR_V1
  class MISSAO_CRITICA
   police cir 40000 bc 4470 be 4470 conform-action transmit  exceed-action set-dscp-transmit af43
  class GERENCIAMENTO
   police cir 8000 bc 4470 be 4470 conform-action transmit  exceed-action set-dscp-transmit af32
policy-map QPO_A_2048K_10_28_0_28_5_3_25
  class VozVideo_Q6
    priority
   police cir percent 38 conform-action transmit  exceed-action drop 
  class Interativa_Q6
    bandwidth percent 28
    bandwidth remaining percent 28
    random-detect dscp-based
    random-detect dscp 18 32 packets 48 packets 1
    random-detect dscp 20 32 packets 48 packets 1
    random-detect dscp 22 32 packets 48 packets 1
    queue-limit 96 packets
  class Bulk_Q6
    bandwidth percent 5
    bandwidth remaining percent 5
    random-detect dscp-based
    random-detect dscp 8 7 packets 15 packets 1
    random-detect dscp 10 7 packets 15 packets 1
    random-detect dscp 12 7 packets 15 packets 1
    random-detect dscp 14 7 packets 15 packets 1
    random-detect dscp 32 7 packets 15 packets 1
    queue-limit 30 packets
  class NetworkControl_Q6
    bandwidth percent 3
    bandwidth remaining percent 3
    queue-limit 30 packets
  class class-default
    bandwidth percent 25
    bandwidth remaining percent 25
    random-detect dscp-based
    random-detect dscp 0 32 packets 48 packets 1
    queue-limit 96 packets
policy-map QPO_A_6144K_4_0_20_39_20_2_14
  class Voz_Q6
    priority
   police cir percent 4 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 20
    bandwidth remaining percent 20
    random-detect dscp-based
    random-detect dscp 24 56 packets 120 packets 1
    random-detect dscp 26 56 packets 120 packets 1
    random-detect dscp 28 56 packets 120 packets 1
    random-detect dscp 30 56 packets 120 packets 1
    queue-limit 240 packets
  class Interativa_Q6
    bandwidth percent 39
    bandwidth remaining percent 39
    random-detect dscp-based
    random-detect dscp 18 112 packets 240 packets 1
    random-detect dscp 20 112 packets 240 packets 1
    random-detect dscp 22 112 packets 240 packets 1
    queue-limit 480 packets
  class Bulk_Q6
    bandwidth percent 20
    bandwidth remaining percent 20
    random-detect dscp-based
    random-detect dscp 8 56 packets 120 packets 1
    random-detect dscp 10 56 packets 120 packets 1
    random-detect dscp 12 56 packets 120 packets 1
    random-detect dscp 14 56 packets 120 packets 1
    random-detect dscp 32 56 packets 120 packets 1
    queue-limit 240 packets
  class NetworkControl_Q6
    bandwidth percent 2
    bandwidth remaining percent 2
    queue-limit 40 packets
  class class-default
    bandwidth percent 14
    bandwidth remaining percent 14
    random-detect dscp-based
    random-detect dscp 0 32 packets 64 packets 1
    queue-limit 128 packets
policy-map QPO_A_512K_7_0_30_16_4_4_38
  class Voz_Q6
    priority
   police cir percent 7 conform-action transmit  exceed-action drop 
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
    bandwidth percent 38
    bandwidth remaining percent 38
    random-detect dscp-based
    random-detect dscp 0 12 packets 20 packets 1
    queue-limit 40 packets
policy-map QPO_SERPRO_6000K_V1
  class VozVideo_SERPRO
    priority
   police cir percent 40 conform-action transmit  exceed-action drop 
  class MissaoCritica_SERPRO
    bandwidth percent 10
    random-detect dscp-based
    random-detect dscp 10 32 packets 48 packets 1
    random-detect dscp 26 32 packets 48 packets 1
    random-detect dscp 28 32 packets 48 packets 1
    random-detect dscp 30 32 packets 48 packets 1
  class Interativa_SERPRO
    bandwidth percent 30
    random-detect dscp-based
    random-detect dscp 12 56 packets 120 packets 1
    random-detect dscp 18 56 packets 120 packets 1
    random-detect dscp 20 56 packets 120 packets 1
    random-detect dscp 22 56 packets 120 packets 1
  class NetworkControl_SERPRO
    bandwidth percent 1
  class class-default
    bandwidth percent 16
    random-detect dscp-based
    random-detect dscp 0 32 packets 48 packets 1
    random-detect dscp 14 32 packets 48 packets 1
policy-map QDO_SERPRO_6000K_V1
  class class-default
    shape average 6000000
   service-policy QPO_SERPRO_6000K_V1
policy-map QPO_A_2048K_4_0_11_25_11_2_46
  class Voz_Q6
    priority
   police cir percent 4 conform-action transmit  exceed-action drop 
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
    bandwidth percent 25
    bandwidth remaining percent 25
    random-detect dscp-based
    random-detect dscp 18 32 packets 48 packets 1
    random-detect dscp 20 32 packets 48 packets 1
    random-detect dscp 22 32 packets 48 packets 1
    queue-limit 96 packets
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
    bandwidth percent 46
    bandwidth remaining percent 46
    random-detect dscp-based
    random-detect dscp 0 32 packets 64 packets 1
    queue-limit 128 packets
policy-map QPO_A_2048K_13_37_24_0_0_2_23
  class VozVideo_Q6
    priority
   police cir percent 50 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 24
    bandwidth remaining percent 24
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
policy-map QPI_2048K_6_N_0_78_0_0_1_12
  class Voz_Q6
   police cir 120000 bc 4470 be 4470 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir 1600000 bc 50000 be 50000 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
policy-map QPO_A_512K_18_0_29_0_0_4_48
  class Voz_Q6
    priority
   police cir percent 18 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 29
    bandwidth remaining percent 29
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
    bandwidth percent 4
    bandwidth remaining percent 4
    queue-limit 18 packets
  class class-default
    bandwidth percent 48
    bandwidth remaining percent 48
    random-detect dscp-based
    random-detect dscp 0 12 packets 20 packets 1
    queue-limit 40 packets
policy-map QPO_SERPRO_1024K_V1
  class VozVideo_SERPRO
    priority
   police cir percent 40 conform-action transmit  exceed-action drop 
  class MissaoCritica_SERPRO
    bandwidth percent 10
    random-detect dscp-based
    random-detect dscp 10 7 packets 15 packets 1
    random-detect dscp 26 7 packets 15 packets 1
    random-detect dscp 28 7 packets 15 packets 1
    random-detect dscp 30 7 packets 15 packets 1
  class Interativa_SERPRO
    bandwidth percent 30
    random-detect dscp-based
    random-detect dscp 12 14 packets 30 packets 1
    random-detect dscp 18 14 packets 30 packets 1
    random-detect dscp 20 14 packets 30 packets 1
    random-detect dscp 22 14 packets 30 packets 1
  class NetworkControl_SERPRO
    bandwidth percent 1
  class class-default
    bandwidth percent 16
    random-detect dscp-based
    random-detect dscp 0 12 packets 20 packets 1
    random-detect dscp 14 12 packets 20 packets 1
policy-map QDO_SERPRO_1024K_V1
  class class-default
    shape average 1024000
   service-policy QPO_SERPRO_1024K_V1
policy-map QPO_A_1024K_0_0_0_83_0_2_13
  class Interativa_Q6
    bandwidth percent 83
    bandwidth remaining percent 83
    random-detect dscp-based
    random-detect dscp 18 32 packets 64 packets 1
    random-detect dscp 20 32 packets 64 packets 1
    random-detect dscp 22 32 packets 64 packets 1
    queue-limit 128 packets
  class NetworkControl_Q6
    bandwidth percent 2
    bandwidth remaining percent 2
    queue-limit 18 packets
  class class-default
    bandwidth percent 13
    bandwidth remaining percent 13
    random-detect dscp-based
    random-detect dscp 0 12 packets 20 packets 1
    queue-limit 40 packets
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
   police rate 2048000 child-conform-aware conform-action transmit  exceed-action drop 
   service-policy QPI_SERPRO_2048K_V1
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
policy-map QPO_A_1024K_7_36_13_13_7_2_21
  class VozVideo_Q6
    priority
   police cir percent 43 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 13
    bandwidth remaining percent 13
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
    bandwidth percent 7
    bandwidth remaining percent 7
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
    bandwidth percent 21
    bandwidth remaining percent 21
    random-detect dscp-based
    random-detect dscp 0 12 packets 20 packets 1
    queue-limit 40 packets
policy-map QPO_A_2048K_4_0_0_0_39_2_54
  class Voz_Q6
    priority
   police cir percent 4 conform-action transmit  exceed-action drop 
  class Bulk_Q6
    bandwidth percent 39
    bandwidth remaining percent 39
    random-detect dscp-based
    random-detect dscp 8 32 packets 64 packets 1
    random-detect dscp 10 32 packets 64 packets 1
    random-detect dscp 12 32 packets 64 packets 1
    random-detect dscp 14 32 packets 64 packets 1
    random-detect dscp 32 32 packets 64 packets 1
    queue-limit 128 packets
  class NetworkControl_Q6
    bandwidth percent 2
    bandwidth remaining percent 2
    queue-limit 26 packets
  class class-default
    bandwidth percent 54
    bandwidth remaining percent 54
    random-detect dscp-based
    random-detect dscp 0 56 packets 120 packets 1
    queue-limit 240 packets
policy-map QPO_A_256K_25_0_41_0_0_7_25
  class Voz_Q6
    priority
   police cir percent 25 conform-action transmit  exceed-action drop 
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
    bandwidth percent 25
    bandwidth remaining percent 25
    random-detect dscp-based
    random-detect dscp 0 7 packets 15 packets 1
    queue-limit 30 packets
policy-map QPO_A_2048K_0_49_0_0_0_1_45
  class Video_Q6
    priority
   police cir percent 49 conform-action transmit  exceed-action drop 
  class NetworkControl_Q6
    bandwidth percent 1
    bandwidth remaining percent 1
    queue-limit 26 packets
  class class-default
    bandwidth percent 45
    bandwidth remaining percent 45
    random-detect dscp-based
    random-detect dscp 0 32 packets 64 packets 1
    queue-limit 128 packets
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
policy-map QOS_POLICY_OUT_A_5P_32P
  class REALTIME
    priority
   police cir percent 5 conform-action transmit  exceed-action drop 
  class BUSINESS
    bandwidth percent 32
    random-detect dscp-based
    random-detect dscp 24 14 packets 30 packets 1
    random-detect dscp 26 14 packets 30 packets 1
    random-detect dscp 28 14 packets 30 packets 1
    random-detect dscp 30 14 packets 30 packets 1
policy-map QPO_A_512K_13_0_40_0_0_4_42
  class Voz_Q6
    priority
   police cir percent 13 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 40
    bandwidth remaining percent 40
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
    bandwidth percent 42
    bandwidth remaining percent 42
    random-detect dscp-based
    random-detect dscp 0 12 packets 20 packets 1
    queue-limit 40 packets
policy-map QPO_A_2048K_18_23_13_0_0_1_43
  class VozVideo_Q6
    priority
   police cir percent 41 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 13
    bandwidth remaining percent 13
    random-detect dscp-based
    random-detect dscp 24 14 packets 30 packets 1
    random-detect dscp 26 14 packets 30 packets 1
    random-detect dscp 28 14 packets 30 packets 1
    random-detect dscp 30 14 packets 30 packets 1
    queue-limit 60 packets
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
policy-map QPO_A_512K_0_0_25_16_25_4_7
  class MissaoCritica_Q6
    bandwidth percent 25
    bandwidth remaining percent 25
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
    bandwidth percent 25
    bandwidth remaining percent 25
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
    queue-limit 26 packets
  class class-default
    bandwidth percent 7
    bandwidth remaining percent 7
    random-detect dscp-based
    random-detect dscp 0 5 packets 13 packets 1
    queue-limit 26 packets
policy-map QPO_A_512K_0_0_40_30_21_4_4
  class MissaoCritica_Q6
    bandwidth percent 40
    bandwidth remaining percent 40
    random-detect dscp-based
    random-detect dscp 24 12 packets 20 packets 1
    random-detect dscp 26 12 packets 20 packets 1
    random-detect dscp 28 12 packets 20 packets 1
    random-detect dscp 30 12 packets 20 packets 1
    queue-limit 40 packets
  class Interativa_Q6
    bandwidth percent 30
    bandwidth remaining percent 30
    random-detect dscp-based
    random-detect dscp 18 12 packets 20 packets 1
    random-detect dscp 20 12 packets 20 packets 1
    random-detect dscp 22 12 packets 20 packets 1
    queue-limit 40 packets
  class Bulk_Q6
    bandwidth percent 21
    bandwidth remaining percent 21
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
policy-map QPO_A_256K_25_0_24_0_0_7_42
  class Voz_Q6
    priority
   police cir percent 25 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 24
    bandwidth remaining percent 24
    random-detect dscp-based
    random-detect dscp 24 5 packets 13 packets 1
    random-detect dscp 26 5 packets 13 packets 1
    random-detect dscp 28 5 packets 13 packets 1
    random-detect dscp 30 5 packets 13 packets 1
    queue-limit 26 packets
  class NetworkControl_Q6
    bandwidth percent 7
    bandwidth remaining percent 7
    queue-limit 18 packets
  class class-default
    bandwidth percent 42
    bandwidth remaining percent 42
    random-detect dscp-based
    random-detect dscp 0 7 packets 15 packets 1
    queue-limit 30 packets
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
policy-map QPO_A_2048K_13_23_38_0_0_1_24
  class VozVideo_Q6
    priority
   police cir percent 36 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 38
    bandwidth remaining percent 38
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
    bandwidth percent 24
    bandwidth remaining percent 24
    random-detect dscp-based
    random-detect dscp 0 24 packets 40 packets 1
    queue-limit 80 packets
policy-map QPO_A_2048K_15_0_0_0_0_1_82
  class Voz_Q6
    priority
   police cir percent 15 conform-action transmit  exceed-action drop 
  class NetworkControl_Q6
    bandwidth percent 1
    bandwidth remaining percent 1
    queue-limit 26 packets
  class class-default
    bandwidth percent 82
    bandwidth remaining percent 82
    random-detect dscp-based
    random-detect dscp 0 56 packets 120 packets 1
    queue-limit 240 packets
policy-map QPI_BBONE_N_2048_V1
  class class-default
   police 2048000 64000 64000 conform-action set-mpls-exp-imposition-transmit 0 exceed-action drop 
policy-map QPO_A_512K_19_0_57_0_0_4_19
  class Voz_Q6
    priority
   police cir percent 19 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 57
    bandwidth remaining percent 57
    random-detect dscp-based
    random-detect dscp 18 5 packets 7 packets 1
    random-detect dscp 20 5 packets 7 packets 1
    random-detect dscp 22 5 packets 7 packets 1
    random-detect dscp 24 14 packets 30 packets 1
    random-detect dscp 26 14 packets 30 packets 1
    random-detect dscp 28 14 packets 30 packets 1
    random-detect dscp 30 14 packets 30 packets 1
    queue-limit 14 packets
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
policy-map QPO_A_1024K_7_0_1_61_27_2_1
  class Voz_Q6
    priority
   police cir percent 7 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 1
    bandwidth remaining percent 1
    random-detect dscp-based
    random-detect dscp 24 6 packets 8 packets 1
    random-detect dscp 26 6 packets 8 packets 1
    random-detect dscp 28 6 packets 8 packets 1
    random-detect dscp 30 6 packets 8 packets 1
    queue-limit 16 packets
  class Interativa_Q6
    bandwidth percent 61
    bandwidth remaining percent 61
    random-detect dscp-based
    random-detect dscp 18 32 packets 48 packets 1
    random-detect dscp 20 32 packets 48 packets 1
    random-detect dscp 22 32 packets 48 packets 1
    queue-limit 96 packets
  class Bulk_Q6
    bandwidth percent 27
    bandwidth remaining percent 27
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
policy-map QPO_SERPRO_4096K_V1
  class VozVideo_SERPRO
    priority
   police cir percent 40 conform-action transmit  exceed-action drop 
  class MissaoCritica_SERPRO
    bandwidth percent 10
    random-detect dscp-based
    random-detect dscp 10 24 packets 40 packets 1
    random-detect dscp 26 24 packets 40 packets 1
    random-detect dscp 28 24 packets 40 packets 1
    random-detect dscp 30 24 packets 40 packets 1
  class Interativa_SERPRO
    bandwidth percent 30
    random-detect dscp-based
    random-detect dscp 12 56 packets 120 packets 1
    random-detect dscp 18 56 packets 120 packets 1
    random-detect dscp 20 56 packets 120 packets 1
    random-detect dscp 22 56 packets 120 packets 1
  class NetworkControl_SERPRO
    bandwidth percent 1
  class class-default
    bandwidth percent 16
    random-detect dscp-based
    random-detect dscp 0 32 packets 48 packets 1
    random-detect dscp 14 32 packets 48 packets 1
policy-map QDO_SERPRO_4096K_V1
  class class-default
    shape average 4096000
   service-policy QPO_SERPRO_4096K_V1
policy-map QPI_2048K_10_N_40_15_30_0_2_2
  class Voz_Q6
   police cir percent 10 conform-action transmit  exceed-action drop 
  class Video_Q6
   police cir percent 40 conform-action set-mpls-exp-imposition-transmit 5 exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 15 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Interativa_Q6
   police cir percent 30 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QDI_2048K_10_40_15_30_0_2_2
  class class-default
   police rate 2048000 conform-action transmit  exceed-action drop 
   service-policy QPI_2048K_10_N_40_15_30_0_2_2
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
policy-map QPO_A_1024K_12_0_34_25_18_2_8
  class Voz_Q6
    priority
   police cir percent 12 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 34
    bandwidth remaining percent 34
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
    bandwidth percent 18
    bandwidth remaining percent 18
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
    bandwidth percent 8
    bandwidth remaining percent 8
    random-detect dscp-based
    random-detect dscp 0 7 packets 15 packets 1
    queue-limit 30 packets
policy-map QPO_A_4096K_25_13_39_20_0_1_1
  class VozVideo_Q6
    priority
   police cir percent 38 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 39
    bandwidth remaining percent 39
    random-detect dscp-based
    random-detect dscp 24 56 packets 120 packets 1
    random-detect dscp 26 56 packets 120 packets 1
    random-detect dscp 28 56 packets 120 packets 1
    random-detect dscp 30 56 packets 120 packets 1
    queue-limit 240 packets
  class Interativa_Q6
    bandwidth percent 20
    bandwidth remaining percent 20
    random-detect dscp-based
    random-detect dscp 18 32 packets 64 packets 1
    random-detect dscp 20 32 packets 64 packets 1
    random-detect dscp 22 32 packets 64 packets 1
    queue-limit 128 packets
  class NetworkControl_Q6
    bandwidth percent 1
    bandwidth remaining percent 1
    queue-limit 26 packets
  class class-default
    bandwidth percent 1
    bandwidth remaining percent 1
    random-detect dscp-based
    random-detect dscp 0 5 packets 13 packets 1
    queue-limit 26 packets
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
policy-map QDI_SERPRO_4096K_V1
  class class-default
   police rate 4096000 child-conform-aware conform-action transmit  exceed-action drop 
   service-policy QPI_SERPRO_4096K_V1
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
policy-map QPO_2048K_10_40_15_30_0_2_2
  class VozVideo_Q6
    priority
   police cir percent 50 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 15
    random-detect dscp-based
    random-detect dscp 24 40 ms 120 ms 1
    random-detect dscp 26 40 ms 120 ms 1
    random-detect dscp 28 40 ms 120 ms 1
    random-detect dscp 30 40 ms 120 ms 1
  class Interativa_Q6
    bandwidth percent 30
    random-detect dscp-based
    random-detect dscp 18 40 ms 120 ms 1
    random-detect dscp 20 40 ms 120 ms 1
    random-detect dscp 22 40 ms 120 ms 1
  class NetworkControl_Q6
    bandwidth percent 2
  class class-default
    bandwidth percent 2
    random-detect dscp-based
    random-detect dscp 0 40 ms 120 ms 1
policy-map QDO_2048K_10_40_15_30_0_2_2
  class class-default
    shape average 2048000
   service-policy QPO_2048K_10_40_15_30_0_2_2
policy-map QPI_BBONE_N_4096_V1
  class class-default
   police 4096000 128000 128000 conform-action set-mpls-exp-imposition-transmit 0 exceed-action drop 
policy-map QPO_A_256K_19_0_29_0_0_7_44
  class Voz_Q6
    priority
   police cir percent 19 conform-action transmit  exceed-action drop 
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
    bandwidth percent 44
    bandwidth remaining percent 44
    random-detect dscp-based
    random-detect dscp 0 7 packets 15 packets 1
    queue-limit 30 packets
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
policy-map QDO_SERPRO_2048K_V1
  class class-default
    shape average 2048000
   service-policy QPO_SERPRO_2048K_V1
policy-map QPO_A_2048K_6_0_59_0_0_1_33
  class Voz_Q6
    priority
   police cir percent 6 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 59
    bandwidth remaining percent 59
    random-detect dscp-based
    random-detect dscp 24 56 packets 120 packets 1
    random-detect dscp 26 56 packets 120 packets 1
    random-detect dscp 28 56 packets 120 packets 1
    random-detect dscp 30 56 packets 120 packets 1
    queue-limit 240 packets
  class NetworkControl_Q6
    bandwidth percent 1
    bandwidth remaining percent 1
    queue-limit 18 packets
  class class-default
    bandwidth percent 33
    bandwidth remaining percent 33
    random-detect dscp-based
    random-detect dscp 0 32 packets 48 packets 1
    queue-limit 96 packets
policy-map QPO_A_4096K_13_0_1_0_0_1_84
  class Voz_Q6
    priority
   police cir percent 13 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 1
    bandwidth remaining percent 1
    random-detect dscp-based
    random-detect dscp 24 5 packets 13 packets 1
    random-detect dscp 26 5 packets 13 packets 1
    random-detect dscp 28 5 packets 13 packets 1
    random-detect dscp 30 5 packets 13 packets 1
    queue-limit 26 packets
  class NetworkControl_Q6
    bandwidth percent 1
    bandwidth remaining percent 1
    queue-limit 26 packets
  class class-default
    bandwidth percent 84
    bandwidth remaining percent 84
    random-detect dscp-based
    random-detect dscp 0 112 packets 240 packets 1
    queue-limit 480 packets
policy-map QPO_A_512K_5_0_2_0_0_4_88
  class Voz_Q6
    priority
   police cir percent 5 conform-action transmit  exceed-action drop 
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
    bandwidth percent 88
    bandwidth remaining percent 88
    random-detect dscp-based
    random-detect dscp 0 24 packets 40 packets 1
    queue-limit 80 packets
policy-map QPO_A_2048K_13_0_39_13_0_1_33
  class Voz_Q6
    priority
   police cir percent 13 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 39
    bandwidth remaining percent 39
    random-detect dscp-based
    random-detect dscp 24 32 packets 64 packets 1
    random-detect dscp 26 32 packets 64 packets 1
    random-detect dscp 28 32 packets 64 packets 1
    random-detect dscp 30 32 packets 64 packets 1
    queue-limit 128 packets
  class Interativa_Q6
    bandwidth percent 13
    bandwidth remaining percent 13
    random-detect dscp-based
    random-detect dscp 18 14 packets 30 packets 1
    random-detect dscp 20 14 packets 30 packets 1
    random-detect dscp 22 14 packets 30 packets 1
    queue-limit 60 packets
  class NetworkControl_Q6
    bandwidth percent 1
    bandwidth remaining percent 1
    queue-limit 18 packets
  class class-default
    bandwidth percent 33
    bandwidth remaining percent 33
    random-detect dscp-based
    random-detect dscp 0 32 packets 48 packets 1
    queue-limit 96 packets
policy-map QPO_A_512K_7_0_11_16_0_4_61
  class Voz_Q6
    priority
   police cir percent 7 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 11
    bandwidth remaining percent 11
    random-detect dscp-based
    random-detect dscp 24 5 packets 13 packets 1
    random-detect dscp 26 5 packets 13 packets 1
    random-detect dscp 28 5 packets 13 packets 1
    random-detect dscp 30 5 packets 13 packets 1
    queue-limit 26 packets
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
    bandwidth percent 61
    bandwidth remaining percent 61
    random-detect dscp-based
    random-detect dscp 0 14 packets 30 packets 1
    queue-limit 60 packets
policy-map QPO_A_1024K_15_0_12_7_30_1_33
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
    bandwidth percent 7
    bandwidth remaining percent 7
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
policy-map QPO_A_4096K_7_18_16_13_0_2_43
  class VozVideo_Q6
    priority
   police cir percent 25 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 16
    bandwidth remaining percent 16
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
    random-detect dscp 18 32 packets 48 packets 1
    random-detect dscp 20 32 packets 48 packets 1
    random-detect dscp 22 32 packets 48 packets 1
    queue-limit 96 packets
  class NetworkControl_Q6
    bandwidth percent 2
    bandwidth remaining percent 2
    queue-limit 30 packets
  class class-default
    bandwidth percent 43
    bandwidth remaining percent 43
    random-detect dscp-based
    random-detect dscp 0 56 packets 120 packets 1
    queue-limit 240 packets
policy-map QPO_A_4096K_13_10_38_4_7_1_26
  class VozVideo_Q6
    priority
   police cir percent 23 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 38
    bandwidth remaining percent 38
    random-detect dscp-based
    random-detect dscp 24 56 packets 120 packets 1
    random-detect dscp 26 56 packets 120 packets 1
    random-detect dscp 28 56 packets 120 packets 1
    random-detect dscp 30 56 packets 120 packets 1
    queue-limit 240 packets
  class Interativa_Q6
    bandwidth percent 4
    bandwidth remaining percent 4
    random-detect dscp-based
    random-detect dscp 18 12 packets 20 packets 1
    random-detect dscp 20 12 packets 20 packets 1
    random-detect dscp 22 12 packets 20 packets 1
    queue-limit 40 packets
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
    bandwidth percent 1
    bandwidth remaining percent 1
    queue-limit 26 packets
  class class-default
    bandwidth percent 26
    bandwidth remaining percent 26
    random-detect dscp-based
    random-detect dscp 0 56 packets 120 packets 1
    queue-limit 240 packets
policy-map QPO_A_2048K_13_0_3_0_0_2_81
  class Voz_Q6
    priority
   police cir percent 13 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 3
    bandwidth remaining percent 3
    random-detect dscp-based
    random-detect dscp 24 7 packets 15 packets 1
    random-detect dscp 26 7 packets 15 packets 1
    random-detect dscp 28 7 packets 15 packets 1
    random-detect dscp 30 7 packets 15 packets 1
    queue-limit 30 packets
  class NetworkControl_Q6
    bandwidth percent 2
    bandwidth remaining percent 2
    queue-limit 26 packets
  class class-default
    bandwidth percent 81
    bandwidth remaining percent 81
    random-detect dscp-based
    random-detect dscp 0 56 packets 120 packets 1
    queue-limit 240 packets
policy-map QPO_A_1024K_21_13_36_21_0_2_6
  class VozVideo_Q6
    priority
   police cir percent 34 conform-action transmit  exceed-action drop 
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
    bandwidth percent 21
    bandwidth remaining percent 21
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
    bandwidth percent 6
    bandwidth remaining percent 6
    random-detect dscp-based
    random-detect dscp 0 5 packets 13 packets 1
    queue-limit 26 packets
policy-map QPO_A_4096K_0_10_0_0_0_1_87
  class Video_Q6
    priority
   police cir percent 10 conform-action transmit  exceed-action drop 
  class NetworkControl_Q6
    bandwidth percent 1
    bandwidth remaining percent 1
    queue-limit 30 packets
  class class-default
    bandwidth percent 87
    bandwidth remaining percent 87
    random-detect dscp-based
    random-detect dscp 0 112 packets 240 packets 1
    queue-limit 480 packets
policy-map QPO_2048K_6_0_78_0_0_1_12
  class Voz_Q6
    priority
   police cir percent 6 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 78
    random-detect dscp-based
    random-detect dscp 24 56 packets 120 packets 1
    random-detect dscp 26 56 packets 120 packets 1
    random-detect dscp 28 56 packets 120 packets 1
    random-detect dscp 30 56 packets 120 packets 1
  class NetworkControl_Q6
    bandwidth percent 1
  class BestEffort_Q6
    bandwidth percent 12
    random-detect dscp-based
    random-detect dscp 0 12 packets 20 packets 1
policy-map QPI_BBONE_DSCP_V1
  class class-default
   set dscp 0
policy-map QPI_A_512K_18_N_0_29_0_0_4_48
  class Voz_Q6
   police cir percent 18 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 29 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QDO_A_1024K_13_0_16_48_16_2_4
  class class-default
    shape average 1024000
   service-policy QPO_A_1024K_13_0_16_48_16_2_4
policy-map QPI_A_1024K_0_N_0_0_83_0_2_13
  class Interativa_Q6
   police cir percent 83 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_A_2048K_7_N_0_50_0_0_1_40
  class Voz_Q6
   police cir percent 7 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 50 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QDI_A_2048K_7_0_50_0_0_1_40
  class class-default
   police rate 2048000 child-conform-aware conform-action transmit  exceed-action drop 
   service-policy QPI_A_2048K_7_N_0_50_0_0_1_40
policy-map QPI_A_2048K_4_N_0_11_25_11_2_46
  class Voz_Q6
   police cir percent 4 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 11 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Interativa_Q6
   police cir percent 25 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Bulk_Q6
   police cir percent 11 conform-action set-mpls-exp-imposition-transmit 4 exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_A_2048K_13_N_37_24_0_0_2_23
  class Voz_Q6
   police cir percent 13 conform-action transmit  exceed-action drop 
  class Video_Q6
   police cir percent 37 conform-action set-mpls-exp-imposition-transmit 5 exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 24 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_A_2048K_20_N_30_33_0_0_2_14
  class Voz_Q6
   police cir percent 20 conform-action transmit  exceed-action drop 
  class Video_Q6
   police cir percent 30 conform-action set-mpls-exp-imposition-transmit 5 exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 33 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QDI_A_2048K_20_30_33_0_0_2_14
  class class-default
   police rate 2048000 child-conform-aware conform-action transmit  exceed-action drop 
   service-policy QPI_A_2048K_20_N_30_33_0_0_2_14
policy-map QDO_A_512K_7_0_30_16_4_4_38
  class class-default
    shape average 512000
   service-policy QPO_A_512K_7_0_30_16_4_4_38
policy-map QPI_A_2048K_10_N_28_0_28_5_3_25
  class Voz_Q6
   police cir percent 10 conform-action transmit  exceed-action drop 
  class Video_Q6
   police cir percent 28 conform-action set-mpls-exp-imposition-transmit 5 exceed-action drop 
  class Interativa_Q6
   police cir percent 28 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Bulk_Q6
   police cir percent 5 conform-action set-mpls-exp-imposition-transmit 4 exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_A_6144K_4_N_0_20_39_20_2_14
  class Voz_Q6
   police cir percent 4 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 20 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Interativa_Q6
   police cir percent 39 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Bulk_Q6
   police cir percent 20 conform-action set-mpls-exp-imposition-transmit 4 exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_A_512K_7_N_0_30_16_4_4_38
  class Voz_Q6
   police cir percent 7 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 30 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Interativa_Q6
   police cir percent 16 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Bulk_Q6
   police cir percent 4 conform-action set-mpls-exp-imposition-transmit 4 exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_BBONE_S_4096_V1
  class class-default
   police 4096000 128000 128000 conform-action set-dscp-transmit default exceed-action drop 
policy-map QPO_BBONE_100000_V1
  class class-default
    shape average 100000000
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
policy-map QDO_A_1024K_0_0_0_83_0_2_13
  class class-default
    shape average 1024000
   service-policy QPO_A_1024K_0_0_0_83_0_2_13
policy-map QPI_A_4096K_7_N_18_13_13_7_2_39
  class Voz_Q6
   police cir percent 7 conform-action transmit  exceed-action drop 
  class Video_Q6
   police cir percent 18 conform-action set-mpls-exp-imposition-transmit 5 exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 13 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Interativa_Q6
   police cir percent 13 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Bulk_Q6
   police cir percent 7 conform-action set-mpls-exp-imposition-transmit 4 exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QDI_A_4096K_7_18_13_13_7_2_39
  class class-default
   police rate 4096000 child-conform-aware conform-action transmit  exceed-action drop 
   service-policy QPI_A_4096K_7_N_18_13_13_7_2_39
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
policy-map QPI_A_2048K_21_N_0_35_20_0_2_21
  class Voz_Q6
   police cir percent 21 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 35 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Interativa_Q6
   police cir percent 20 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map PM_V10_QPO_BBONE_6000_V1
policy-map QPO_BBONE_6000_V1
  class class-default
    shape average 6000000
   service-policy PM_V10_QPO_BBONE_6000_V1
policy-map PM_V10_QPO_BBONE_1024_V1
policy-map QPO_BBONE_1024_V1
  class class-default
    shape average 1024000
   service-policy PM_V10_QPO_BBONE_1024_V1
policy-map QPI_A_6144K_0_N_0_87_0_0_1_11
  class MissaoCritica_Q6
   police cir percent 87 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QDI_A_1024K_0_0_0_83_0_2_13
  class class-default
   police rate 1024000 child-conform-aware conform-action transmit  exceed-action drop 
   service-policy QPI_A_1024K_0_N_0_0_83_0_2_13
policy-map QDO_A_4096K_7_18_13_13_7_2_39
  class class-default
    shape average 4096000
   service-policy QPO_A_4096K_7_18_13_13_7_2_39
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
policy-map PM_V10_QPO_BBONE_400000_V1
policy-map QPO_BBONE_400000_V1
  class class-default
    shape average 400000000
   service-policy PM_V10_QPO_BBONE_400000_V1
policy-map QDI_A_1024K_13_0_16_48_16_2_4
  class class-default
   police rate 1024000 child-conform-aware conform-action transmit  exceed-action drop 
   service-policy QPI_A_1024K_13_N_0_16_48_16_2_4
policy-map QDO_A_2048K_7_0_50_0_0_1_40
  class class-default
    shape average 2048000
   service-policy QPO_A_2048K_7_0_50_0_0_1_40
policy-map QPI_A_2048K_4_N_0_50_0_0_2_43
  class Voz_Q6
   police cir percent 4 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 50 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map PM_V10_QPO_BBONE_1500_V1
policy-map QPO_BBONE_1500_V1
  class class-default
    shape average 1500000
   service-policy PM_V10_QPO_BBONE_1500_V1
policy-map QDO_64_0_0_40_8_0_0_0B_GSR_V1
  class class-default
   service-policy QPO_64_0_0_40_8_0_0_0B_GSR_V1
policy-map QPI_A_1024K_13_N_0_80_0_0_2_4
  class Voz_Q6
   police cir percent 13 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 80 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_A_4096K_17_N_17_36_25_0_1_3
  class Voz_Q6
   police cir percent 17 conform-action transmit  exceed-action drop 
  class Video_Q6
   police cir percent 17 conform-action set-mpls-exp-imposition-transmit 5 exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 36 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Interativa_Q6
   police cir percent 25 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_A_512K_11_N_0_30_46_0_4_8
  class Voz_Q6
   police cir percent 11 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 30 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Interativa_Q6
   police cir percent 46 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QDO_A_2048K_20_30_33_0_0_2_14
  class class-default
    shape average 2048000
   service-policy QPO_A_2048K_20_30_33_0_0_2_14
policy-map QDI_A_512K_7_0_30_16_4_4_38
  class class-default
   police rate 512000 child-conform-aware conform-action transmit  exceed-action drop 
   service-policy QPI_A_512K_7_N_0_30_16_4_4_38
policy-map QPI_A_2048K_13_N_0_3_0_0_2_81
  class Voz_Q6
   police cir percent 13 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 3 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QDO_A_1024K_10_24_20_0_40_2_3
  class class-default
    shape average 1024000
   service-policy QPO_A_1024K_10_24_20_0_40_2_3
policy-map QPI_A_2048K_15_N_0_0_0_0_1_82
  class Voz_Q6
   police cir percent 15 conform-action transmit  exceed-action drop 
  class class-default
   set mpls experimental imposition 0
policy-map QDI_A_2048K_15_0_0_0_0_1_82
  class class-default
   police rate 2048000 child-conform-aware conform-action transmit  exceed-action drop 
   service-policy QPI_A_2048K_15_N_0_0_0_0_1_82
policy-map QPI_A_1024K_21_N_13_36_21_0_2_6
  class Voz_Q6
   police cir percent 21 conform-action transmit  exceed-action drop 
  class Video_Q6
   police cir percent 13 conform-action set-mpls-exp-imposition-transmit 5 exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 36 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Interativa_Q6
   police cir percent 21 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_A_4096K_0_N_10_0_0_0_1_87
  class Video_Q6
   police cir percent 10 conform-action set-mpls-exp-imposition-transmit 5 exceed-action drop 
  class class-default
   set mpls experimental imposition 0
policy-map PM_V10_QPO_BBONE_4096_V1
policy-map QPO_BBONE_4096_V1
  class class-default
    shape average 4000000
   service-policy PM_V10_QPO_BBONE_4096_V1
policy-map QPI_BBONE_S_100000_V1
  class class-default
   police 100000000 3125000 3125000 conform-action set-dscp-transmit default exceed-action drop 
policy-map QPI_A_256K_19_N_0_29_0_0_7_44
  class Voz_Q6
   police cir percent 19 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 29 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPO_128K_25_20_25_10_10_7_2
  class VozVideo_Q6
    priority
   police cir percent 45 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 25
    random-detect dscp-based
    random-detect dscp 24 100 ms 300 ms 1
    random-detect dscp 26 100 ms 300 ms 1
    random-detect dscp 28 100 ms 300 ms 1
    random-detect dscp 30 100 ms 300 ms 1
  class Interativa_Q6
    bandwidth percent 10
    random-detect dscp-based
    random-detect dscp 18 100 ms 300 ms 1
    random-detect dscp 20 100 ms 300 ms 1
    random-detect dscp 22 100 ms 300 ms 1
  class Bulk_Q6
    bandwidth percent 10
    random-detect dscp-based
    random-detect dscp 8 100 ms 300 ms 1
    random-detect dscp 10 100 ms 300 ms 1
    random-detect dscp 12 100 ms 300 ms 1
    random-detect dscp 14 100 ms 300 ms 1
    random-detect dscp 32 100 ms 300 ms 1
  class NetworkControl_Q6
    bandwidth percent 7
  class class-default
    bandwidth percent 2
    random-detect dscp-based
    random-detect dscp 0 100 ms 300 ms 1
policy-map QPI_A_2048K_6_N_0_59_0_0_1_33
  class Voz_Q6
   police cir percent 6 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 59 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_A_4096K_13_N_0_1_0_0_1_84
  class Voz_Q6
   police cir percent 13 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 1 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_A_512K_5_N_0_2_0_0_4_88
  class Voz_Q6
   police cir percent 5 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 2 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_A_2048K_13_N_0_39_13_0_1_33
  class Voz_Q6
   police cir percent 13 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 39 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Interativa_Q6
   police cir percent 13 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_A_512K_7_N_0_11_16_0_4_61
  class Voz_Q6
   police cir percent 7 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 11 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Interativa_Q6
   police cir percent 16 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QDO_A_512K_5_0_30_16_0_4_41
  class class-default
    shape average 512000
   service-policy QPO_A_512K_5_0_30_16_0_4_41
policy-map QPI_A_1024K_15_N_0_12_7_30_1_33
  class Voz_Q6
   police cir percent 15 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 12 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Interativa_Q6
   police cir percent 7 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Bulk_Q6
   police cir percent 30 conform-action set-mpls-exp-imposition-transmit 4 exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_A_2048K_13_N_38_23_0_0_2_23
  class Voz_Q6
   police cir percent 13 conform-action transmit  exceed-action drop 
  class Video_Q6
   police cir percent 38 conform-action set-mpls-exp-imposition-transmit 5 exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 23 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_A_4096K_7_N_18_16_13_0_2_43
  class Voz_Q6
   police cir percent 7 conform-action transmit  exceed-action drop 
  class Video_Q6
   police cir percent 18 conform-action set-mpls-exp-imposition-transmit 5 exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 16 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Interativa_Q6
   police cir percent 13 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_A_4096K_13_N_10_38_4_7_1_26
  class Voz_Q6
   police cir percent 13 conform-action transmit  exceed-action drop 
  class Video_Q6
   police cir percent 10 conform-action set-mpls-exp-imposition-transmit 5 exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 38 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Interativa_Q6
   police cir percent 4 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Bulk_Q6
   police cir percent 7 conform-action set-mpls-exp-imposition-transmit 4 exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_A_4096K_25_N_13_39_20_0_1_1
  class Voz_Q6
   police cir percent 25 conform-action transmit  exceed-action drop 
  class Video_Q6
   police cir percent 13 conform-action set-mpls-exp-imposition-transmit 5 exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 39 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Interativa_Q6
   police cir percent 20 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
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
policy-map QPI_A_512K_5_N_0_30_16_0_4_41
  class Voz_Q6
   police cir percent 5 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 30 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Interativa_Q6
   police cir percent 16 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_A_1024K_7_N_36_13_13_7_2_21
  class Voz_Q6
   police cir percent 7 conform-action transmit  exceed-action drop 
  class Video_Q6
   police cir percent 36 conform-action set-mpls-exp-imposition-transmit 5 exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 13 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Interativa_Q6
   police cir percent 13 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Bulk_Q6
   police cir percent 7 conform-action set-mpls-exp-imposition-transmit 4 exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QDI_A_1024K_7_36_13_13_7_2_21
  class class-default
   police rate 1024000 child-conform-aware conform-action transmit  exceed-action drop 
   service-policy QPI_A_1024K_7_N_36_13_13_7_2_21
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
policy-map QDO_A_2048K_13_38_23_0_0_2_23
  class class-default
    shape average 2048000
   service-policy QPO_A_2048K_13_38_23_0_0_2_23
policy-map QDO_A_4096K_7_18_16_13_0_2_43
  class class-default
    shape average 4096000
   service-policy QPO_A_4096K_7_18_16_13_0_2_43
policy-map QDO_A_4096K_13_10_38_4_7_1_26
  class class-default
    shape average 4096000
   service-policy QPO_A_4096K_13_10_38_4_7_1_26
policy-map QPI_A_512K_5_N_0_30_16_0_4_44
  class Voz_Q6
   police cir percent 5 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 30 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Interativa_Q6
   police cir percent 16 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QDI_A_512K_5_0_30_16_0_4_44
  class class-default
   police rate 512000 child-conform-aware conform-action transmit  exceed-action drop 
   service-policy QPI_A_512K_5_N_0_30_16_0_4_44
policy-map MARCA-WIMAX
  class class-default
   set dscp 46
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
policy-map QPI_A_512K_0_N_0_40_30_21_4_4
  class MissaoCritica_Q6
   police cir percent 40 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Interativa_Q6
   police cir percent 30 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Bulk_Q6
   police cir percent 21 conform-action set-mpls-exp-imposition-transmit 4 exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QDI_A_512K_0_0_40_30_21_4_4
  class class-default
   police rate 512000 child-conform-aware conform-action transmit  exceed-action drop 
   service-policy QPI_A_512K_0_N_0_40_30_21_4_4
policy-map QDO_A_4096K_0_10_0_0_0_1_87
  class class-default
    shape average 4096000
   service-policy QPO_A_4096K_0_10_0_0_0_1_87
policy-map QPI_A_1024K_12_N_0_34_25_18_2_8
  class Voz_Q6
   police cir percent 12 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 34 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Interativa_Q6
   police cir percent 25 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Bulk_Q6
   police cir percent 18 conform-action set-mpls-exp-imposition-transmit 4 exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map PM_V10_QPO_BBONE_2048_V1
policy-map QPO_BBONE_2048_V1
  class class-default
    shape average 2048000
   service-policy PM_V10_QPO_BBONE_2048_V1
policy-map QPI_A_512K_19_N_0_57_0_0_4_19
  class Voz_Q6
   police cir percent 19 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 57 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_BBONE_S_400000_V1
  class class-default
   police 400000000 12500000 12500000 conform-action set-dscp-transmit default exceed-action drop 
policy-map QPI_A_1024K_7_N_0_1_61_27_2_1
  class Voz_Q6
   police cir percent 7 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 1 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Interativa_Q6
   police cir percent 61 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Bulk_Q6
   police cir percent 27 conform-action set-mpls-exp-imposition-transmit 4 exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_A_512K_50_N_0_10_0_0_4_35
  class Voz_Q6
   police cir percent 50 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 10 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QDO_A_1024K_7_36_13_13_7_2_21
  class class-default
    shape average 1024000
   service-policy QPO_A_1024K_7_36_13_13_7_2_21
policy-map QDO_A_512K_5_0_30_16_4_4_40
  class class-default
    shape average 512000
   service-policy QPO_A_512K_5_0_30_16_4_4_40
policy-map QDI_A_2048K_13_38_23_0_0_2_23
  class class-default
   police rate 2048000 child-conform-aware conform-action transmit  exceed-action drop 
   service-policy QPI_A_2048K_13_N_38_23_0_0_2_23
policy-map QDI_A_4096K_7_18_16_13_0_2_43
  class class-default
   police rate 4096000 child-conform-aware conform-action transmit  exceed-action drop 
   service-policy QPI_A_4096K_7_N_18_16_13_0_2_43
policy-map QDI_A_4096K_13_10_38_4_7_1_26
  class class-default
   police rate 4096000 child-conform-aware conform-action transmit  exceed-action drop 
   service-policy QPI_A_4096K_13_N_10_38_4_7_1_26
policy-map QDO_A_512K_5_0_30_16_0_4_44
  class class-default
    shape average 512000
   service-policy QPO_A_512K_5_0_30_16_0_4_44
policy-map QPI_A_256K_25_N_0_24_0_0_7_42
  class Voz_Q6
   police cir percent 25 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 24 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_A_256K_38_N_0_29_0_0_7_25
  class Voz_Q6
   police cir percent 38 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 29 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_A_2048K_13_N_23_38_0_0_1_24
  class Voz_Q6
   police cir percent 13 conform-action transmit  exceed-action drop 
  class Video_Q6
   police cir percent 23 conform-action set-mpls-exp-imposition-transmit 5 exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 38 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QDO_A_512K_0_0_40_30_21_4_4
  class class-default
    shape average 512000
   service-policy QPO_A_512K_0_0_40_30_21_4_4
policy-map QDI_A_4096K_0_10_0_0_0_1_87
  class class-default
   police rate 4096000 child-conform-aware conform-action transmit  exceed-action drop 
   service-policy QPI_A_4096K_0_N_10_0_0_0_1_87
policy-map QPI_A_512K_13_N_0_40_0_0_4_42
  class Voz_Q6
   police cir percent 13 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 40 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_A_2048K_18_N_23_13_0_0_1_43
  class Voz_Q6
   police cir percent 18 conform-action transmit  exceed-action drop 
  class Video_Q6
   police cir percent 23 conform-action set-mpls-exp-imposition-transmit 5 exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 13 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QDI_A_1024K_10_24_20_0_40_2_3
  class class-default
   police rate 1024000 child-conform-aware conform-action transmit  exceed-action drop 
   service-policy QPI_A_1024K_10_N_24_20_0_40_2_3
policy-map QDO_A_2048K_15_0_0_0_0_1_82
  class class-default
    shape average 2048000
   service-policy QPO_A_2048K_15_0_0_0_0_1_82
policy-map QPI_A_512K_0_N_0_25_16_25_4_7
  class MissaoCritica_Q6
   police cir percent 25 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Interativa_Q6
   police cir percent 16 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Bulk_Q6
   police cir percent 25 conform-action set-mpls-exp-imposition-transmit 4 exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_BBONE_S_6000_V1
  class class-default
   police 6000000 187500 187500 conform-action set-dscp-transmit default exceed-action drop 
policy-map QPI_BBONE_S_1024_V1
  class class-default
   police 1024000 32000 32000 conform-action set-dscp-transmit default exceed-action drop 
policy-map QDI_A_512K_5_0_30_16_0_4_41
  class class-default
   police rate 512000 child-conform-aware conform-action transmit  exceed-action drop 
   service-policy QPI_A_512K_5_N_0_30_16_0_4_41
policy-map QPI_A_2048K_4_N_0_0_0_39_2_54
  class Voz_Q6
   police cir percent 4 conform-action transmit  exceed-action drop 
  class Bulk_Q6
   police cir percent 39 conform-action set-mpls-exp-imposition-transmit 4 exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_A_256K_25_N_0_41_0_0_7_25
  class Voz_Q6
   police cir percent 25 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 41 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_A_2048K_0_N_49_0_0_0_1_45
  class Video_Q6
   police cir percent 49 conform-action set-mpls-exp-imposition-transmit 5 exceed-action drop 
  class class-default
   set mpls experimental imposition 0
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
policy-map QPI_VIPSIP_VOZ_800_V1
policy-map QDI_VIPSIP_VOZ_800_V1
  class class-default
   police rate 800000 child-conform-aware conform-action transmit  exceed-action drop 
   service-policy QPI_VIPSIP_VOZ_800_V1
policy-map QPO_MCI_ETM_2048K_128K_1920K_G_V1
  class GOLD_EF_MCI
   police cir percent 90
    priority
  class SILVER_AF4x_MCI
    bandwidth percent 3
    random-detect dscp-based
    random-detect dscp 32 224 packets 480 packets 1
    random-detect dscp 34 224 packets 480 packets 1
    random-detect dscp 36 56 packets 120 packets 1
    random-detect dscp 38 56 packets 120 packets 1
    queue-limit 512 packets
  class SILVER_AF3x_MCI
    bandwidth percent 3
    random-detect dscp-based
    random-detect dscp 24 224 packets 480 packets 1
    random-detect dscp 26 224 packets 480 packets 1
    random-detect dscp 28 56 packets 120 packets 1
    random-detect dscp 30 56 packets 120 packets 1
    random-detect dscp 48 344 packets 600 packets 10
    random-detect dscp 56 344 packets 600 packets 10
    queue-limit 512 packets
  class SILVER_AF2x_MCI
    bandwidth percent 2
    random-detect dscp-based
    random-detect dscp 16 224 packets 480 packets 1
    random-detect dscp 18 224 packets 480 packets 1
    random-detect dscp 20 56 packets 120 packets 1
    random-detect dscp 22 56 packets 120 packets 1
    queue-limit 512 packets
  class SILVER_BEST_EFFORT_MCI
    bandwidth percent 2
    random-detect
    queue-limit 512 packets
policy-map QDO_MCI_ETM_2048K_128K_1920K_G_V1
  class class-default
    shape average 2048000
   service-policy QPO_MCI_ETM_2048K_128K_1920K_G_V1
policy-map QPI_MCI_ETM_2048K_128K_1920K_G_V1
  class GOLD_EF_MCI
   police 128000 24000 48000 conform-action set-mpls-exp-imposition-transmit 5 exceed-action drop 
  class SILVER_AF4x_MCI
   set mpls experimental 5
  class SILVER_AF3x_MCI
   set mpls experimental 1
  class SILVER_AF2x_MCI
   set mpls experimental 1
policy-map QDI_MCI_ETM_2048K_128K_1920K_G_V1
  class class-default
   police rate 2048000 conform-action transmit  exceed-action drop 
   service-policy QPI_MCI_ETM_2048K_128K_1920K_G_V1
policy-map QPO_VIPSIP_VOZ_600_V1
  class Voz_Q6
    priority
   police rate 536000 conform-action transmit  exceed-action drop 
  class NetworkControl_Q6
    bandwidth 64
    queue-limit 32 packets
policy-map QDO_VIPSIP_VOZ_600_V1
  class class-default
    shape average 600000
   service-policy QPO_VIPSIP_VOZ_600_V1
policy-map QPO_VIPSIP_VOZ_400_V1
  class Voz_Q6
    priority
   police rate 336000 conform-action transmit  exceed-action drop 
  class NetworkControl_Q6
    bandwidth 64
    queue-limit 32 packets
policy-map QDO_VIPSIP_VOZ_400_V1
  class class-default
    shape average 400000
   service-policy QPO_VIPSIP_VOZ_400_V1
policy-map QOS_DTS_OUT_512K_60K_400K
  class class-default
    shape average 512000
   service-policy QOS_POLICY_OUT_12P_78P
policy-map QOS_POLICY_IN_A_13P_60P
  class REALTIME
   police cir percent 13 conform-action transmit  exceed-action drop 
  class BUSINESS
   police cir percent 60 conform-action transmit  exceed-action set-dscp-transmit default
  class class-default
   set mpls experimental imposition 0
policy-map QOS_POLICY_IN_A_5P_0P
  class REALTIME
   police cir percent 5 conform-action transmit  exceed-action drop 
  class class-default
   set mpls experimental imposition 0
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
policy-map QPI_64K_BBrasil_PAE_IOS_V1
  class MISSAO_CRITICA
   police cir 32000 bc 4470 be 4470 conform-action transmit  exceed-action set-dscp-transmit af43
  class GERENCIAMENTO
   police cir 8000 bc 4470 be 4470 conform-action transmit  exceed-action set-dscp-transmit af32
  class NETWORK_CONTROL
   police cir 8000 bc 4470 be 4470 conform-action transmit  exceed-action set-dscp-transmit cs6
  class STANDARD
   police cir 16000 bc 4470 be 4470 conform-action transmit  exceed-action set-dscp-transmit default
policy-map QOS_POLICY_IN_A_5P_32P
  class REALTIME
   police cir percent 5 conform-action transmit  exceed-action drop 
  class BUSINESS
   police cir percent 32 conform-action transmit  exceed-action set-dscp-transmit default
  class class-default
   set mpls experimental imposition 0
policy-map QPO_Correios_128K_ARPA_IOS_D_V1
  class REAL_TIME_CORREIOS
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
policy-map QDO_Correios_128K_ARPA_IOS_D_V1
  class class-default
    shape average 128000
   service-policy QPO_Correios_128K_ARPA_IOS_D_V1
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
policy-map QDI_Correios_128K_ARPA_IOS_D_V1
  class class-default
   police rate 128000 conform-action transmit  exceed-action drop 
   service-policy QPI_Correios_128K_ARPA_IOS_D_V1
policy-map QPO_Correios_256K_ARPA_IOS_D_V1
  class REAL_TIME_CORREIOS
   police cir percent 6 conform-action transmit  exceed-action drop 
  class MISSAO_CRITICA_CORREIOS
    bandwidth percent 40
    random-detect dscp-based
  class GERENCIAMENTO_CORREIOS
    bandwidth percent 9
    random-detect dscp-based
  class NETWORK_CONTROL_CORREIOS
    bandwidth percent 4
    random-detect dscp-based
  class BEST_EFFORT
    bandwidth percent 40
    random-detect dscp-based
policy-map QDO_Correios_256K_ARPA_IOS_D_V1
  class class-default
    shape average 256000
   service-policy QPO_Correios_256K_ARPA_IOS_D_V1
policy-map QPI_Correios_512K_ARPA_IOS_D_V1
  class REAL_TIME_CORREIOS
   police cir percent 3 conform-action transmit  exceed-action drop 
  class MISSAO_CRITICA_CORREIOS
   police cir percent 40 conform-action transmit  exceed-action set-dscp-transmit af41
  class GERENCIAMENTO_CORREIOS
   police cir percent 9 conform-action transmit  exceed-action set-dscp-transmit af31
  class NETWORK_CONTROL_CORREIOS
   police cir percent 2 conform-action transmit  exceed-action set-dscp-transmit cs6
  class BEST_EFFORT
   police cir percent 45 conform-action transmit  exceed-action set-dscp-transmit default
policy-map QDI_Correios_512K_ARPA_IOS_D_V1
  class class-default
   police cir 512000 bc 16000 be 16000 conform-action transmit  exceed-action drop 
   service-policy QPI_Correios_512K_ARPA_IOS_D_V1
policy-map QPO_VIPSIP_VOZ_1400_V1
  class Voz_Q6
    priority
   police rate 1336000 conform-action transmit  exceed-action drop 
  class NetworkControl_Q6
    bandwidth 64
    queue-limit 32 packets
policy-map QPO_VIPSIP_VOZ_1500_V1
  class Voz_Q6
    priority
   police rate 1432000 conform-action transmit  exceed-action drop 
  class NetworkControl_Q6
    bandwidth 64
    queue-limit 32 packets
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
   police cir 256000 bc 8000 be 8000 conform-action transmit  exceed-action drop 
   service-policy QPI_Correios_256K_ARPA_IOS_D_V1
policy-map QPO_Correios_512K_ARPA_IOS_D_V1
  class REAL_TIME_CORREIOS
    priority
   police cir percent 3 conform-action transmit  exceed-action drop 
  class MISSAO_CRITICA_CORREIOS
    bandwidth percent 40
    random-detect dscp-based
    random-detect dscp 34 32 packets 64 packets 1
    random-detect dscp 36 32 packets 64 packets 1
    random-detect dscp 38 32 packets 64 packets 1
    queue-limit 80 packets
  class GERENCIAMENTO_CORREIOS
    bandwidth percent 9
    random-detect dscp-based
    random-detect dscp 26 32 packets 64 packets 1
    random-detect dscp 28 32 packets 64 packets 1
    random-detect dscp 30 32 packets 64 packets 1
    queue-limit 80 packets
  class NETWORK_CONTROL_CORREIOS
    bandwidth percent 2
    random-detect dscp-based
    random-detect dscp 16 32 packets 64 packets 1
    random-detect dscp 48 32 packets 64 packets 1
    random-detect dscp 56 32 packets 64 packets 1
    queue-limit 64 packets
  class BEST_EFFORT
    bandwidth percent 45
    random-detect dscp-based
    random-detect dscp 0 32 packets 64 packets 1
    queue-limit 180 packets
policy-map QDO_Correios_512K_ARPA_IOS_D_V1
  class class-default
    shape average 512000
   service-policy QPO_Correios_512K_ARPA_IOS_D_V1
policy-map QOS_POLICY_IN_60K_400K
  class REALTIME
   police 64000 4470 4470 conform-action transmit  exceed-action drop 
  class BUSINESS
   police 400000 12500 12500 conform-action transmit  exceed-action set-dscp-transmit default
policy-map QPI_BBONE_EXP_V1
  class class-default
   set mpls experimental imposition 0
policy-map QDO_VIPSIP_VOZ_1400_V1
  class class-default
    shape average 1400000
   service-policy QPO_VIPSIP_VOZ_1400_V1
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
controller SONET 1/0/0
 description Link DATACOM | 155M | SLSUSDM/SLSUSIT/155M/013 | DMSTM1-SLSUS-DI13-AGGA 1
 ais-shut
 alarm-report all
 framing sdh
 clock source line
 overhead j0 1
 aug mapping au-4
 !
 au-4 1 tug-3 1
  mode c-12
  tug-2 1 e1 1 channel-group 0 timeslots 1-16
  tug-2 1 e1 1 framing no-crc4
  tug-2 1 e1 1 clock source Line
  tug-2 1 e1 2 unframed
  tug-2 1 e1 2 clock source Line
  tug-2 3 e1 2 unframed
  tug-2 3 e1 2 clock source Line
  tug-2 5 e1 1 channel-group 1 timeslots 24-31
  tug-2 5 e1 1 framing no-crc4
  tug-2 5 e1 1 clock source Line
  tug-2 6 e1 1 channel-group 1 timeslots 13-16
  tug-2 6 e1 1 channel-group 2 timeslots 5-12
  tug-2 6 e1 1 framing no-crc4
  tug-2 6 e1 1 clock source Line
  tug-2 6 e1 2 channel-group 1 timeslots 24-31
  tug-2 6 e1 2 channel-group 2 timeslots 1-8
  tug-2 6 e1 2 framing no-crc4
  tug-2 6 e1 2 clock source Line
  tug-2 6 e1 3 channel-group 0 timeslots 1-8
  tug-2 6 e1 3 channel-group 1 timeslots 9-24
  tug-2 6 e1 3 channel-group 3 timeslots 25-26
  tug-2 6 e1 3 framing no-crc4
  tug-2 6 e1 3 clock source Line
  tug-2 7 e1 1 channel-group 4 timeslots 26
  tug-2 7 e1 1 channel-group 5 timeslots 27
  tug-2 7 e1 1 framing no-crc4
  tug-2 7 e1 1 clock source Line
  tug-2 7 e1 2 channel-group 2 timeslots 9-16
  tug-2 7 e1 2 framing no-crc4
  tug-2 7 e1 2 clock source Line
  tug-2 7 e1 3 channel-group 1 timeslots 9-24
  tug-2 7 e1 3 channel-group 4 timeslots 31
  tug-2 7 e1 3 framing no-crc4
  tug-2 7 e1 3 clock source Line
 !
 au-4 1 tug-3 2
  mode c-12
  tug-2 1 e1 2 unframed
  tug-2 1 e1 2 clock source Line
  tug-2 2 e1 2 unframed
  tug-2 2 e1 2 clock source Line
  tug-2 3 e1 2 unframed
  tug-2 3 e1 2 clock source Line
  tug-2 4 e1 2 unframed
  tug-2 4 e1 2 clock source Line
  tug-2 4 e1 3 unframed
  tug-2 4 e1 3 clock source Line
  tug-2 7 e1 3 unframed
  tug-2 7 e1 3 clock source Line
 !
 au-4 1 tug-3 3
  mode c-12
  tug-2 2 e1 1 channel-group 0 timeslots 1-16
  tug-2 2 e1 1 framing no-crc4
  tug-2 2 e1 1 clock source Line
  tug-2 3 e1 1 channel-group 0 timeslots 1-16
  tug-2 3 e1 1 framing no-crc4
  tug-2 3 e1 1 clock source Line
  tug-2 5 e1 2 unframed
  tug-2 5 e1 2 clock source Line
  tug-2 6 e1 2 unframed
  tug-2 6 e1 2 clock source Line
  tug-2 7 e1 3 unframed
  tug-2 7 e1 3 clock source Line
!
controller SONET 1/3/0
 description Link DATACOM | 155M | SLSUSDM/SLSUSIT/155M/007 | DMSTM1-SLSUS-DI07-AGGA 1
 ais-shut
 alarm-report all
 framing sdh
 clock source line
 overhead j0 1
 aug mapping au-4
 !
 au-4 1 tug-3 1
  mode c-12
  tug-2 3 e1 2 unframed
  tug-2 3 e1 2 clock source Line
  tug-2 7 e1 3 unframed
  tug-2 7 e1 3 clock source Line
 !
 au-4 1 tug-3 2
  mode c-12
  tug-2 1 e1 1 channel-group 4 timeslots 17-24
  tug-2 1 e1 1 framing no-crc4
  tug-2 1 e1 1 clock source Line
  tug-2 1 e1 2 channel-group 0 timeslots 1-8
  tug-2 1 e1 2 channel-group 1 timeslots 9-16
  tug-2 1 e1 2 framing no-crc4
  tug-2 1 e1 2 clock source Line
  tug-2 3 e1 3 unframed
  tug-2 3 e1 3 clock source Line
  tug-2 4 e1 2 unframed
  tug-2 4 e1 2 clock source Line
  tug-2 4 e1 3 unframed
  tug-2 4 e1 3 clock source Line
  tug-2 5 e1 1 unframed
  tug-2 5 e1 1 clock source Line
  tug-2 6 e1 2 unframed
  tug-2 6 e1 2 clock source Line
 !
 au-4 1 tug-3 3
  mode c-12
  tug-2 1 e1 1 unframed
  tug-2 1 e1 1 clock source Line
  tug-2 1 e1 2 unframed
  tug-2 1 e1 2 clock source Line
  tug-2 1 e1 3 unframed
  tug-2 1 e1 3 clock source Line
  tug-2 2 e1 1 unframed
  tug-2 2 e1 1 clock source Line
  tug-2 5 e1 2 unframed
  tug-2 5 e1 2 clock source Line
!
controller SONET 6/2/0
 description Link DATACOM | 155M | SLSUSDM/SLSUSIT/155M/001 | DMSTM1-SLSUS-DI01 AGGA 1
 ais-shut
 alarm-report all
 framing sdh
 clock source line
 overhead j0 1
 aug mapping au-4
 !
 au-4 1 tug-3 1
  mode c-12
  tug-2 1 e1 1 channel-group 1 timeslots 1-16
  tug-2 1 e1 1 framing no-crc4
  tug-2 1 e1 1 clock source Line
  tug-2 1 e1 3 channel-group 0 timeslots 1-16
  tug-2 1 e1 3 framing no-crc4
  tug-2 1 e1 3 clock source Line
  tug-2 2 e1 1 unframed
  tug-2 2 e1 1 clock source Line
  tug-2 2 e1 2 unframed
  tug-2 2 e1 2 clock source Line
  tug-2 3 e1 1 unframed
  tug-2 3 e1 1 clock source Line
  tug-2 3 e1 3 unframed
  tug-2 3 e1 3 clock source Line
  tug-2 4 e1 2 unframed
  tug-2 4 e1 2 clock source Line
  tug-2 4 e1 3 channel-group 3 timeslots 17-24
  tug-2 4 e1 3 framing no-crc4
  tug-2 4 e1 3 clock source Line
  tug-2 5 e1 2 channel-group 1 timeslots 9-16
  tug-2 5 e1 2 channel-group 2 timeslots 17-24
  tug-2 5 e1 2 framing no-crc4
  tug-2 5 e1 2 clock source Line
  tug-2 6 e1 1 unframed
  tug-2 6 e1 1 clock source Line
  tug-2 6 e1 2 channel-group 2 timeslots 17-31
  tug-2 6 e1 2 framing no-crc4
  tug-2 6 e1 2 clock source Line
  tug-2 7 e1 3 channel-group 1 timeslots 1-15
  tug-2 7 e1 3 framing no-crc4
  tug-2 7 e1 3 clock source Line
 !
 au-4 1 tug-3 2
  mode c-12
  tug-2 2 e1 1 channel-group 1 timeslots 1-15
  tug-2 2 e1 1 channel-group 2 timeslots 17-31
  tug-2 2 e1 1 framing no-crc4
  tug-2 2 e1 1 clock source Line
  tug-2 2 e1 2 channel-group 1 timeslots 1-15
  tug-2 2 e1 2 framing no-crc4
  tug-2 2 e1 2 clock source Line
  tug-2 3 e1 2 channel-group 0 timeslots 1-16
  tug-2 3 e1 2 framing no-crc4
  tug-2 3 e1 2 clock source Line
  tug-2 4 e1 1 unframed
  tug-2 4 e1 1 clock source Line
  tug-2 6 e1 3 channel-group 1 timeslots 24-31
  tug-2 6 e1 3 channel-group 3 timeslots 9-16
  tug-2 6 e1 3 framing no-crc4
  tug-2 6 e1 3 clock source Line
 !
 au-4 1 tug-3 3
  mode c-12
  tug-2 1 e1 1 unframed
  tug-2 1 e1 1 clock source Line
  tug-2 1 e1 2 unframed
  tug-2 1 e1 2 clock source Line
  tug-2 2 e1 1 unframed
  tug-2 2 e1 1 clock source Line
  tug-2 3 e1 2 unframed
  tug-2 3 e1 2 clock source Line
  tug-2 3 e1 3 channel-group 0 timeslots 1-4
  tug-2 3 e1 3 framing no-crc4
  tug-2 3 e1 3 clock source Line
  tug-2 4 e1 1 unframed
  tug-2 4 e1 1 clock source Line
  tug-2 6 e1 2 channel-group 0 timeslots 1-16
  tug-2 6 e1 2 framing no-crc4
  tug-2 6 e1 2 clock source Line
  tug-2 7 e1 2 unframed
  tug-2 7 e1 2 clock source Line
!
controller SONET 6/3/0
 description Link datacom | 155M | SLSUSDM/SLSUSIT/155M/002 | DMSTM1-SLSUS-DI02-AGG A-1
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
  tug-2 1 e1 3 unframed
  tug-2 1 e1 3 clock source Line
  tug-2 2 e1 3 unframed
  tug-2 2 e1 3 clock source Line
  tug-2 3 e1 1 unframed
  tug-2 3 e1 1 clock source Line
  tug-2 3 e1 2 unframed
  tug-2 3 e1 2 clock source Line
  tug-2 3 e1 3 unframed
  tug-2 3 e1 3 clock source Line
  tug-2 4 e1 2 unframed
  tug-2 4 e1 2 clock source Line
  tug-2 5 e1 3 channel-group 0 timeslots 1-16
  tug-2 5 e1 3 framing no-crc4
  tug-2 5 e1 3 clock source Line
  tug-2 6 e1 1 unframed
  tug-2 6 e1 1 clock source Line
 !
 au-4 1 tug-3 2
  mode c-12
  tug-2 1 e1 3 unframed
  tug-2 1 e1 3 clock source Line
  tug-2 2 e1 2 channel-group 1 timeslots 1-8
  tug-2 2 e1 2 channel-group 2 timeslots 27-30
  tug-2 2 e1 2 channel-group 3 timeslots 9-16
  tug-2 2 e1 2 channel-group 4 timeslots 19-26
  tug-2 2 e1 2 framing no-crc4
  tug-2 2 e1 2 clock source Line
  tug-2 4 e1 2 unframed
  tug-2 4 e1 2 clock source Line
  tug-2 4 e1 3 unframed
  tug-2 4 e1 3 clock source Line
  tug-2 5 e1 1 unframed
  tug-2 5 e1 1 clock source Line
  tug-2 6 e1 3 channel-group 1 timeslots 1-8
  tug-2 6 e1 3 channel-group 2 timeslots 19
  tug-2 6 e1 3 channel-group 3 timeslots 9-16
  tug-2 6 e1 3 framing no-crc4
  tug-2 6 e1 3 clock source Line
  tug-2 7 e1 1 channel-group 1 timeslots 1-8
  tug-2 7 e1 1 channel-group 2 timeslots 9-16
  tug-2 7 e1 1 channel-group 3 timeslots 17-20
  tug-2 7 e1 1 channel-group 7 timeslots 22-29
  tug-2 7 e1 1 framing no-crc4
  tug-2 7 e1 1 clock source Line
 !
 au-4 1 tug-3 3
  mode c-12
  tug-2 5 e1 2 unframed
  tug-2 5 e1 2 clock source Line
  tug-2 6 e1 3 unframed
  tug-2 6 e1 3 clock source Line
  tug-2 7 e1 1 unframed
  tug-2 7 e1 1 clock source Line
  tug-2 7 e1 2 unframed
  tug-2 7 e1 2 clock source Line
!
controller SONET 7/1/0
 description Link-DATACOM | 155M | SLSUSDM/SLSUSIT/155M/004 | DMSTM1-SLSUS-DI04-AGGA-1
 ais-shut
 alarm-report all
 framing sdh
 clock source line
 overhead j0 1
 aug mapping au-4
 !
 au-4 1 tug-3 1
  mode c-12
  tug-2 2 e1 1 channel-group 0 timeslots 5-12
  tug-2 2 e1 1 framing no-crc4
  tug-2 2 e1 1 clock source Line
  tug-2 2 e1 2 unframed
  tug-2 2 e1 2 clock source Line
  tug-2 3 e1 1 unframed
  tug-2 3 e1 1 clock source Line
  tug-2 6 e1 1 unframed
  tug-2 6 e1 1 clock source Line
  tug-2 6 e1 2 unframed
  tug-2 6 e1 2 clock source Line
  tug-2 6 e1 3 unframed
  tug-2 6 e1 3 clock source Line
  tug-2 7 e1 1 unframed
  tug-2 7 e1 1 clock source Line
  tug-2 7 e1 2 unframed
  tug-2 7 e1 2 clock source Line
 !
 au-4 1 tug-3 2
  mode c-12
  tug-2 1 e1 3 unframed
  tug-2 1 e1 3 clock source Line
  tug-2 3 e1 1 channel-group 1 timeslots 17-24
  tug-2 3 e1 1 framing no-crc4
  tug-2 3 e1 1 clock source Line
  tug-2 5 e1 3 channel-group 0 timeslots 1-16
  tug-2 5 e1 3 framing no-crc4
  tug-2 5 e1 3 clock source Line
  tug-2 6 e1 3 channel-group 0 timeslots 17-31
  tug-2 6 e1 3 channel-group 1 timeslots 1-15
  tug-2 6 e1 3 framing no-crc4
  tug-2 6 e1 3 clock source Line
 !
 au-4 1 tug-3 3
  mode c-12
  tug-2 3 e1 1 channel-group 0 timeslots 1-16
  tug-2 3 e1 1 framing no-crc4
  tug-2 3 e1 1 clock source Line
  tug-2 5 e1 1 unframed
  tug-2 5 e1 1 clock source Line
  tug-2 6 e1 2 channel-group 0 timeslots 1-4
  tug-2 6 e1 2 channel-group 1 timeslots 5
  tug-2 6 e1 2 channel-group 2 timeslots 6-13
  tug-2 6 e1 2 channel-group 3 timeslots 14-17
  tug-2 6 e1 2 framing no-crc4
  tug-2 6 e1 2 clock source Line
  tug-2 7 e1 2 unframed
  tug-2 7 e1 2 clock source Line
!
controller SONET 7/2/0
 description Link-DATACOM | 155M | SLSUSDM/SLSUSIT/155M/003 | STM1-SLSUS-DI03-AGGA-1
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
  tug-2 1 e1 3 unframed
  tug-2 1 e1 3 clock source Line
  tug-2 2 e1 1 unframed
  tug-2 2 e1 1 clock source Line
  tug-2 2 e1 3 unframed
  tug-2 2 e1 3 clock source Line
  tug-2 3 e1 1 channel-group 0 timeslots 1-16
  tug-2 3 e1 1 framing no-crc4
  tug-2 3 e1 1 clock source Line
  tug-2 3 e1 2 unframed
  tug-2 3 e1 2 clock source Line
  tug-2 3 e1 3 unframed
  tug-2 3 e1 3 clock source Line
  tug-2 4 e1 1 channel-group 0 timeslots 1-16
  tug-2 4 e1 1 framing no-crc4
  tug-2 4 e1 1 clock source Line
  tug-2 5 e1 2 channel-group 0 timeslots 1-16
  tug-2 5 e1 2 framing no-crc4
  tug-2 5 e1 2 clock source Line
  tug-2 6 e1 1 unframed
  tug-2 6 e1 1 clock source Line
  tug-2 7 e1 2 unframed
  tug-2 7 e1 2 clock source Line
  tug-2 7 e1 3 unframed
  tug-2 7 e1 3 clock source Line
 !
 au-4 1 tug-3 2
  mode c-12
  tug-2 2 e1 2 unframed
  tug-2 2 e1 2 clock source Line
  tug-2 3 e1 1 unframed
  tug-2 3 e1 1 clock source Line
  tug-2 4 e1 1 unframed
  tug-2 4 e1 1 clock source Line
  tug-2 5 e1 3 channel-group 2 timeslots 17-24
  tug-2 5 e1 3 channel-group 3 timeslots 1-8
  tug-2 5 e1 3 framing no-crc4
  tug-2 5 e1 3 clock source Line
  tug-2 7 e1 2 unframed
  tug-2 7 e1 2 clock source Line
  tug-2 7 e1 3 unframed
  tug-2 7 e1 3 clock source Line
 !
 au-4 1 tug-3 3
  mode c-12
  tug-2 1 e1 1 unframed
  tug-2 1 e1 1 clock source Line
  tug-2 1 e1 2 unframed
  tug-2 1 e1 2 clock source Line
  tug-2 1 e1 3 unframed
  tug-2 1 e1 3 clock source Line
  tug-2 2 e1 1 channel-group 1 timeslots 9-14
  tug-2 2 e1 1 channel-group 2 timeslots 1-4
  tug-2 2 e1 1 channel-group 3 timeslots 15-22
  tug-2 2 e1 1 framing no-crc4
  tug-2 2 e1 1 clock source Line
  tug-2 3 e1 1 channel-group 6 timeslots 1-4
  tug-2 3 e1 1 channel-group 7 timeslots 5
  tug-2 3 e1 1 framing no-crc4
  tug-2 3 e1 1 clock source Line
  tug-2 3 e1 2 channel-group 3 timeslots 13-16
  tug-2 3 e1 2 framing no-crc4
  tug-2 3 e1 2 clock source Line
  tug-2 4 e1 1 channel-group 3 timeslots 17-20
  tug-2 4 e1 1 framing no-crc4
  tug-2 4 e1 1 clock source Line
  tug-2 5 e1 2 channel-group 5 timeslots 1-4
  tug-2 5 e1 2 channel-group 6 timeslots 5-12
  tug-2 5 e1 2 channel-group 7 timeslots 13-20
  tug-2 5 e1 2 channel-group 8 timeslots 21-28
  tug-2 5 e1 2 framing no-crc4
  tug-2 5 e1 2 clock source Line
  tug-2 6 e1 1 channel-group 0 timeslots 13-28
  tug-2 6 e1 1 channel-group 1 timeslots 5-12
  tug-2 6 e1 1 framing no-crc4
  tug-2 6 e1 1 clock source Line
  tug-2 6 e1 3 unframed
  tug-2 6 e1 3 clock source Line
  tug-2 7 e1 1 unframed
  tug-2 7 e1 1 clock source Line
  tug-2 7 e1 2 unframed
  tug-2 7 e1 2 clock source Line
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
 ip address 200.244.41.196 255.255.255.255
 no ip redirects
 no ip unreachables
 no ip directed-broadcast
 no ip proxy-arp
 ip pim sparse-mode
 no clns route-cache
 hold-queue 2000 in
!
interface Loopback2018
 description ENDERECO BGP - SIVNET
 ip address 200.253.180.69 255.255.255.255
 no ip directed-broadcast
!
interface Loopback2020
 ip vrf forwarding CITELUZ:1201
 ip address 10.99.1.200 255.255.255.255
 no ip directed-broadcast
!
interface Loopback2023
 description Endereco BGP - JUPITER
 ip address 200.253.180.74 255.255.255.255
 no ip directed-broadcast
!
interface Loopback2037
 description Endereco BGP - TVM
 ip address 200.254.11.22 255.255.255.255
 no ip directed-broadcast
!
interface Loopback20000
 ip vrf forwarding TESTE_TMX:200001
 ip address 192.168.0.1 255.255.255.255
 no ip directed-broadcast
!
interface Multilink73
 description SEBRAEMA  | 384K | BIH/MULTI/18103 | (BIH/MULTI/18103) | BGP_AS64617
 bandwidth 384
 ip vrf forwarding SEBRAEMA:4302
 ip address 189.53.246.93 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 load-interval 30
 no peer neighbor-route
 no cdp enable
 ppp multilink
 ppp multilink fragment-delay 10
 ppp multilink interleave
 multilink min-links 1 mandatory
 multilink-group 73
 no clns route-cache
 service-policy input QPI_384K_13_N_0_2_0_0_5_77
 service-policy output QPO_384K_13_0_2_0_0_5_77
!
interface Multilink94
 dampening 30 50 1100 200
 description SEBRAEMA  | 10240K | SLS/MULTI/19345 | (SLS/MULTI/19345)
 ip address 189.53.246.221 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 load-interval 30
 shutdown
 no peer neighbor-route
 no cdp enable
 ppp multilink
 no ppp multilink fragmentation
 multilink min-links 1 mandatory
 multilink-group 94
 no clns route-cache
 service-policy input ZERA-DSCP
!
interface Multilink120
 dampening 30 50 1100 200
 description ABNAMRO  | 256K | SLS/MULTI/20654 | (SLS/MULTI/20654)
 bandwidth 256
 ip vrf forwarding ABNAMRO:2803
 ip address 189.42.84.5 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no peer neighbor-route
 no cdp enable
 ppp multilink
 ppp multilink fragment-delay 10
 ppp multilink interleave
 multilink min-links 1 mandatory
 multilink-group 120
 no clns route-cache
 service-policy input ZERA-EXP-Saida
!
interface Multilink128
 dampening 30 50 1100 200
 description TIETEVEL  | 512K | SLS/MULTI/21880 | (SLS/MULTI/21880) | BGP_AS64857
 bandwidth 512
 ip vrf forwarding DIST_TIETE_FILIAL:5599
 ip address 200.252.158.29 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no peer neighbor-route
 no cdp enable
 ppp multilink
 ppp multilink fragment-delay 10
 ppp multilink interleave
 multilink min-links 1 mandatory
 multilink-group 128
 no clns route-cache
 service-policy input QPI_512K_10_N_0_1_0_0_4_82
 service-policy output QPO_512K_10_0_1_0_0_4_82
!
interface Multilink135
 dampening 30 50 1100 200
 description TST  | 4096K | SLS/MULTI/06340 | (SLS/MULTI/06340) | BGP_AS65000
 ip vrf forwarding TRT16:3540
 ip address 172.30.16.5 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 load-interval 30
 no peer neighbor-route
 no cdp enable
 ppp multilink
 no ppp multilink fragmentation
 multilink min-links 1 mandatory
 multilink-group 135
 no clns route-cache
 service-policy input QPI_A_4096K_12_N_0_8_8_13_1_57
 service-policy output QPO_A_4096K_12_0_8_8_13_1_57
!
interface Multilink168
 dampening 30 50 1100 200
 description CEMAR  | 256K | SLS/MULTI/25915 | (SLS/MULTI/25915)
 bandwidth 256
 ip vrf forwarding CEMAR:3468
 ip address 200.252.158.145 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no peer neighbor-route
 no cdp enable
 ppp multilink
 ppp multilink fragment-delay 10
 ppp multilink interleave
 multilink min-links 1 mandatory
 multilink-group 168
 no clns route-cache
 service-policy input QPI_BBONE_EXP_V1
!
interface Multilink169
 dampening 30 50 1100 200
 description DCTIM  | 512K | ITZ/MULTI/26102 | (ITZ/MULTI/26102) | BGP_AS64634
 bandwidth 512
 ip vrf forwarding DCTIM:4283
 ip address 200.252.158.153 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 load-interval 30
 no peer neighbor-route
 no cdp enable
 ppp multilink
 ppp multilink fragment-delay 10
 ppp multilink interleave
 multilink min-links 1 mandatory
 multilink-group 169
 no clns route-cache
 service-policy input QPI_A_512K_13_N_0_40_0_0_4_42
 service-policy output QPO_A_512K_13_0_40_0_0_4_42
!
interface Multilink171
 dampening 30 50 1100 200
 description TAGUATUR  | 512K | SLS/MULTI/26385 | (SLS/MULTI/26385) | BGP_AS64653
 bandwidth 512
 ip vrf forwarding TAGUATURVEIC:3519
 ip address 200.252.158.13 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 load-interval 30
 shutdown
 no peer neighbor-route
 no cdp enable
 ppp multilink
 ppp multilink fragment-delay 10
 ppp multilink interleave
 multilink min-links 1 mandatory
 multilink-group 171
 no clns route-cache
 service-policy input QPI_A_512K_19_N_0_0_0_2_4_71
 service-policy output QPO_A_512K_19_0_0_0_2_4_71
!
interface Multilink186
 dampening 30 50 1100 200
 description BCOAM  | 1024K | COR/MULTI/27663 | (COR/MULTI/27663) | BGP_AS65330
 bandwidth 1024
 ip vrf forwarding BCOAM:4783
 ip address 200.242.226.29 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 ip tcp header-compression iphc-format
 ip tcp compression-connections 1
 load-interval 30
 no peer neighbor-route
 no cdp enable
 ppp multilink
 ppp multilink fragment-delay 10
 ppp multilink interleave
 multilink min-links 1 mandatory
 multilink-group 186
 no clns route-cache
 service-policy input QPI_A_1024K_11_C_0_50_13_13_2_10
 service-policy output QPO_A_1024K_11_0_50_13_13_2_10
 ip rtp header-compression iphc-format
 ip rtp compression-connections 14
 ip header-compression max-header 40
!
interface Multilink194
 dampening 30 50 1100 200
 description INTELTEC INFORMATICA  | 4096K | ITI/MULTI/28208 | (ITI/MULTI/28208)
 ip address 201.73.255.101 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 load-interval 30
 shutdown
 no peer neighbor-route
 no cdp enable
 ppp multilink
 no ppp multilink fragmentation
 multilink min-links 1 mandatory
 multilink-group 194
 no clns route-cache
 service-policy input QPI_BBONE_DSCP_V1
!
interface Multilink1999
 dampening 30 50 1100 200
 description SEBRAEMA  | 512K | CHI/MULTI/19112 | (CHI/MULTI/19112) | BGP_AS64617
 bandwidth 512
 ip vrf forwarding SEBRAEMA:4302
 ip address 201.45.138.121 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 load-interval 30
 no peer neighbor-route
 no cdp enable
 ppp multilink
 ppp multilink fragment-delay 10
 ppp multilink interleave
 multilink min-links 1 mandatory
 multilink-group 1999
 no clns route-cache
 service-policy input QPI_A_512K_10_N_0_2_0_0_4_83
 service-policy output QPO_A_512K_10_0_2_0_0_4_83
!
interface Multilink28271
 dampening 30 50 1100 200
 description REFRIMA  | 2048K | SLS/MULTI/28816 | (SLS/MULTI/28816) | BGP_AS65317
 bandwidth 2048
 ip vrf forwarding SOLARBR:6759
 ip address 189.52.211.61 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 load-interval 30
 no peer neighbor-route
 no cdp enable
 ppp multilink
 no ppp multilink fragmentation
 multilink min-links 1 mandatory
 multilink-group 28271
 no clns route-cache
 service-policy input QPI_A_2048K_24_N_0_25_0_0_1_48
 service-policy output QPO_A_2048K_24_0_25_0_0_1_48
!
interface Multilink28272
 dampening 30 50 1100 200
 description CREDISHOP  | 256K | PDZ/MULTI/28860 | (PDZ/MULTI/28860) | BGP_AS64518
 bandwidth 256
 ip vrf forwarding CREDISHOP:1661
 ip address 187.29.255.49 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 load-interval 30
 no peer neighbor-route
 no cdp enable
 ppp multilink
 ppp multilink fragment-delay 10
 ppp multilink interleave
 multilink min-links 1 mandatory
 multilink-group 28272
 no clns route-cache
 service-policy input QPI_A_256K_25_N_0_24_0_0_7_42
 service-policy output QPO_A_256K_25_0_24_0_0_7_42
!
interface Multilink28281
 dampening 30 50 1100 200
 description DIASBRANCO  | 1024K | SLS/MULTI/08073 | (SLS/MULTI/08073)
 bandwidth 1024
 ip vrf forwarding DIASBRANCO:151552
 ip address 200.253.132.197 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 load-interval 30
 no peer neighbor-route
 no cdp enable
 ppp multilink
 ppp multilink fragment-delay 10
 ppp multilink interleave
 multilink min-links 1 mandatory
 multilink-group 28281
 no clns route-cache
 service-policy input QPI_A_1024K_15_N_0_12_7_30_1_33
 service-policy output QPO_A_1024K_15_0_12_7_30_1_33
!
interface Multilink28282
 dampening 30 50 1100 200
 description CREDISHOP  | 256K | PHE/MULTI/29659 | (PHE/MULTI/29659) | BGP_AS64518
 bandwidth 256
 ip vrf forwarding CREDISHOP:1661
 ip address 200.249.169.133 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no peer neighbor-route
 no cdp enable
 ppp multilink
 ppp multilink fragment-delay 10
 ppp multilink interleave
 no ppp multilink fragmentation
 multilink min-links 1 mandatory
 multilink-group 28282
 no clns route-cache
 service-policy input QPI_A_256K_26_N_0_4_0_0_7_62
 service-policy output QPO_A_256K_26_0_4_0_0_7_62
!
interface Multilink28284
 dampening 30 50 1100 200
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 load-interval 30
 shutdown
 no cdp enable
 ppp multilink
 ppp multilink fragment-delay 10
 ppp multilink interleave
 multilink min-links 1 mandatory
 multilink-group 28284
 no clns route-cache
 service-policy input QPI_A_1024K_7_N_0_1_61_27_2_1
 service-policy output QPO_A_1024K_7_0_1_61_27_2_1
!
interface Multilink28893
 dampening 30 50 1100 200
 description PAGUEMENOS  | 256K | SLS/MULTI/32633 | (SLS/MULTI/32633) | BGP_AS65338
 bandwidth 256
 ip vrf forwarding PAGUEMENOS:3822
 ip address 187.29.255.85 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no peer neighbor-route
 no cdp enable
 ppp multilink
 ppp multilink fragment-delay 10
 ppp multilink interleave
 multilink min-links 1 mandatory
 multilink-group 28893
 no clns route-cache
 service-policy input QPI_A_256K_19_N_0_25_0_0_7_47
 service-policy output QPO_A_256K_19_0_25_0_0_7_47
!
interface Multilink28899
 dampening 30 50 1100 200
 description DALCAR  | 512K | SIS/MULTI/33202 | (SIS/MULTI/33202) | BGP_AS65000
 ip vrf forwarding DALCAR:5317
 ip address 187.29.255.109 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 load-interval 30
 no peer neighbor-route
 no cdp enable
 ppp multilink
 ppp multilink fragment-delay 10
 ppp multilink interleave
 multilink min-links 1 mandatory
 multilink-group 28899
 no clns route-cache
 service-policy input QPI_BBONE_EXP_V1
!
interface Multilink28904
 dampening 30 50 1100 200
 description IGREJAUNIVERSAL  | 512K | PHE/MULTI/34324 | (PHE/MULTI/34324) | BGP_AS64662
 bandwidth 512
 ip vrf forwarding IURD:1265
 ip address 200.252.158.169 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no peer neighbor-route
 no cdp enable
 ppp multilink
 ppp multilink fragment-delay 10
 ppp multilink interleave
 multilink min-links 1 mandatory
 multilink-group 28904
 no clns route-cache
 service-policy input QOS_POLICY_IN_A_13P_60P
 service-policy output QOS_POLICY_OUT_A_13P_60P
!
interface Multilink28911
 dampening 30 50 1100 200
 description ABNAMRO  | 512K | SLS/MULTI/34760 | (SLS/MULTI/34760) | BGP_AS65069
 bandwidth 512
 ip vrf forwarding ABNAMRO:2803
 ip address 187.29.255.137 255.255.255.252
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
 multilink-group 28911
 no clns route-cache
 service-policy input QPI_A_512K_31_C_0_21_14_28_4_1
 service-policy output QPO_A_512K_31_0_21_14_28_4_1
 ip rtp header-compression iphc-format
 ip rtp compression-connections 20
 ip header-compression max-header 40
!
interface Multilink28929
 dampening 30 50 1100 200
 description IBAMA  | 4096K | SLS/MULTI/38041 | (SLS/MULTI/38041) | BGP_AS65000
 ip vrf forwarding IBAMA:1057
 ip address 189.52.211.181 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 shutdown
 no peer neighbor-route
 no cdp enable
 ppp multilink
 no ppp multilink fragmentation
 multilink min-links 1 mandatory
 multilink-group 28929
 no clns route-cache
 service-policy input QPI_A_4096K_25_N_13_39_20_0_1_1
 service-policy output QPO_A_4096K_25_13_39_20_0_1_1
!
interface Multilink28935
 dampening 30 50 1100 200
 description MARISALOJAS  | 1024K | ITZ/MULTI/34616 | (ITZ/MULTI/34616) | BGP_AS65000
 bandwidth 1024
 ip vrf forwarding MARISA:4972
 ip address 189.23.73.209 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no peer neighbor-route
 no cdp enable
 ppp multilink
 ppp multilink fragment-delay 10
 ppp multilink interleave
 multilink min-links 1 mandatory
 multilink-group 28935
 no clns route-cache
 service-policy input QPI_A_1024K_21_N_0_11_11_36_2_18
 service-policy output QPO_A_1024K_21_0_11_11_36_2_18
!
interface Multilink28936
 dampening 30 50 1100 200
 description NOBLEBRASIL  | 1024K | SLS/MULTI/38789 | (SLS/MULTI/38789) | BGP_AS64733
 bandwidth 1024
 ip vrf forwarding NOBLEBRASIL:4314
 ip address 189.53.11.145 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no peer neighbor-route
 no cdp enable
 ppp multilink
 ppp multilink fragment-delay 10
 ppp multilink interleave
 multilink min-links 1 mandatory
 multilink-group 28936
 no clns route-cache
 service-policy input QPI_A_1024K_13_N_0_80_0_0_2_4
 service-policy output QPO_A_1024K_13_0_80_0_0_2_4
!
interface Multilink28937
 dampening 30 50 1100 200
 description CREDISHOP  | 4096K | SLS/MULTI/24717 | (SLS/MULTI/24717) | BGP_AS64518
 ip vrf forwarding CREDISHOP:1661
 ip address 201.73.255.249 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 load-interval 30
 no peer neighbor-route
 no cdp enable
 ppp multilink
 no ppp multilink fragmentation
 multilink min-links 1 mandatory
 multilink-group 28937
 no clns route-cache
 service-policy input QPI_A_4096K_13_N_0_1_0_0_1_84
 service-policy output QPO_A_4096K_13_0_1_0_0_1_84
!
interface Multilink28939
 dampening 30 50 1100 200
 description COSAN  | 2048K | SLS/MULTI/39086 | (SLS/MULTI/39086) | BGP_AS65463
 bandwidth 2048
 ip vrf forwarding COSAN:4132
 ip address 200.252.158.53 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no peer neighbor-route
 no cdp enable
 ppp multilink
 ppp multilink fragment-delay 10
 no ppp multilink fragmentation
 multilink min-links 1 mandatory
 multilink-group 28939
 no clns route-cache
 service-policy input QPI_A_2048K_13_N_0_56_0_0_2_28
 service-policy output QPO_A_2048K_13_0_56_0_0_2_28
!
interface Multilink28941
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
 multilink-group 28941
 no clns route-cache
!
interface Multilink28946
 dampening 30 50 1100 200
 description COLOMBO  | 256K | SLS/MULTI/39898 | (SLS/MULTI/39898) | BGP_AS65309
 bandwidth 256
 ip vrf forwarding COLOMBO:3147
 ip address 189.53.246.225 255.255.255.252
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
 multilink-group 28946
 no clns route-cache
 service-policy input QPI_A_256K_13_C_0_0_0_0_7_79
 service-policy output QPO_A_256K_13_0_0_0_0_7_79
 ip rtp header-compression iphc-format
 ip rtp compression-connections 4
 ip header-compression max-header 40
!
interface Multilink28947
 dampening 30 50 1100 200
 description LILIANI  | 512K | SLS/MULTI/39926 | (SLS/MULTI/39926) | BGP_AS64721
 bandwidth 512
 ip vrf forwarding LILIANI:3630
 ip address 187.29.255.1 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no peer neighbor-route
 no cdp enable
 ppp multilink
 ppp multilink fragment-delay 10
 ppp multilink interleave
 multilink min-links 1 mandatory
 multilink-group 28947
 no clns route-cache
 service-policy input QPI_A_512K_19_N_0_57_0_0_4_19
 service-policy output QPO_A_512K_19_0_57_0_0_4_19
!
interface Multilink28949
 dampening 30 50 1100 200
 description SERPRO  | 1024K | BBL/MULTI/40131 | (BBL/MULTI/40131)
 bandwidth 1024
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 shutdown
 no peer neighbor-route
 no cdp enable
 ppp multilink
 ppp multilink fragment-delay 10
 ppp multilink interleave
 multilink min-links 1 mandatory
 multilink-group 28949
 no clns route-cache
 service-policy input QPI_SERPRO_1024K_V1
 service-policy output QPO_SERPRO_1024K_V1
!
interface Multilink28958
 dampening 30 50 1100 200
 description LOJASRENNER  | 512K | SLS/MULTI/39463 | (SLS/MULTI/39463) | BGP_AS65004
 bandwidth 512
 ip vrf forwarding LOJARENNER:1513
 ip address 200.172.11.77 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 shutdown
 no peer neighbor-route
 no cdp enable
 ppp multilink
 ppp multilink fragment-delay 10
 ppp multilink interleave
 multilink min-links 1 mandatory
 multilink-group 28958
 no clns route-cache
 service-policy input QPI_A_512K_13_N_0_46_24_8_4_4
 service-policy output QPO_A_512K_13_0_46_24_8_4_4
!
interface Multilink28963
 dampening 30 50 1100 200
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 shutdown
 no peer neighbor-route
 no cdp enable
 ppp multilink
 ppp multilink fragment-delay 10
 ppp multilink interleave
 multilink min-links 1 mandatory
 multilink-group 28963
 no clns route-cache
 service-policy input QPI_A_512K_11_N_0_34_25_17_4_8
 service-policy output QPO_A_512K_11_0_34_25_17_4_8
!
interface Multilink28968
 dampening 30 50 1100 200
 description ORGAODEGESTAO  | 6144K | SLS/MULTI/41670 | (SLS/MULTI/41670)
 ip address 200.252.158.221 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 load-interval 30
 no peer neighbor-route
 no cdp enable
 ppp multilink
 no ppp multilink fragmentation
 multilink min-links 1 mandatory
 multilink-group 28968
 no clns route-cache
 service-policy input QPI_BBONE_DSCP_V1
!
interface Multilink28970
 dampening 30 50 1100 200
 description BRISAMAR | 2048K | SLS/MULTI/41674 | (SLS/MULTI/41674)
 ip address 200.249.174.129 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 shutdown
 no peer neighbor-route
 no cdp enable
 ppp multilink
 no ppp multilink fragmentation
 multilink min-links 1 mandatory
 multilink-group 28970
 no clns route-cache
 service-policy input QPI_BBONE_DSCP_V1
!
interface Multilink28985
 dampening 30 50 1100 200
 description JEVA  | 4096K | ITZ/MULTI/43384 | (ITZ/MULTI/43384)
 ip address 189.52.211.225 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no peer neighbor-route
 no cdp enable
 ppp multilink
 no ppp multilink fragmentation
 multilink min-links 1 mandatory
 multilink-group 28985
 no clns route-cache
 service-policy input QPI_BBONE_DSCP_V1
!
interface Multilink28990
 dampening 30 50 1100 200
 description MELO FILHO  | 4096K | SLS/MULTI/43509 | (SLS/MULTI/43509)
 ip address 187.29.255.133 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no peer neighbor-route
 no cdp enable
 ppp multilink
 no ppp multilink fragmentation
 multilink min-links 1 mandatory
 multilink-group 28990
 no clns route-cache
 service-policy input QPI_BBONE_DSCP_V1
!
interface Multilink28992
 dampening 30 50 1100 200
 description MARGUSA  | 4096K | BBEI/MULTI/43516 | (BBEI/MULTI/43516)
 ip address 200.249.174.165 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no peer neighbor-route
 no cdp enable
 ppp multilink
 no ppp multilink fragmentation
 multilink min-links 1 mandatory
 multilink-group 28992
 no clns route-cache
 service-policy input QPI_BBONE_DSCP_V1
!
interface Multilink28999
 dampening 30 50 1100 200
 description SANTIAGO ADVOGADOS  | 4096K | SLS/MULTI/43704 | (SLS/MULTI/43704)
 ip address 187.29.255.221 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no peer neighbor-route
 no cdp enable
 ppp multilink
 no ppp multilink fragmentation
 multilink min-links 1 mandatory
 multilink-group 28999
 no clns route-cache
 service-policy input QPI_BBONE_DSCP_V1
!
interface Multilink29008
 dampening 30 50 1100 200
 description SBF  | 256K | ITZ/MULTI/45298 | (ITZ/MULTI/45298) | BGP_AS64732
 bandwidth 256
 ip vrf forwarding BYTENNIS:3608
 ip address 200.252.158.49 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no peer neighbor-route
 no cdp enable
 ppp multilink
 ppp multilink fragment-delay 10
 ppp multilink interleave
 multilink min-links 1 mandatory
 multilink-group 29008
 no clns route-cache
 service-policy input QPI_A_256K_38_N_0_29_0_0_7_25
 service-policy output QPO_A_256K_38_0_29_0_0_7_25
!
interface Multilink29013
 dampening 30 50 1100 200
 description SUPERMMACIEL  | 512K | SLS/MULTI/34176 | (SLS/MULTI/34176) | BGP_AS65216
 bandwidth 512
 ip vrf forwarding SUPERMMACIEL:3754
 ip address 189.23.73.169 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no peer neighbor-route
 no cdp enable
 ppp multilink
 ppp multilink fragment-delay 10
 ppp multilink interleave
 multilink min-links 1 mandatory
 multilink-group 29013
 no clns route-cache
 service-policy input QPI_A_512K_7_N_0_0_13_0_4_75
 service-policy output QPO_A_512K_7_0_0_13_0_4_75
!
interface Multilink29014
 dampening 30 50 1100 200
 description SUPERMMACIEL  | 512K | SLS/MULTI/14901 | (SLS/MULTI/14901)
 bandwidth 512
 ip vrf forwarding SUPERMMACIEL:3754
 ip address 189.43.120.29 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no peer neighbor-route
 no cdp enable
 ppp multilink
 ppp multilink fragment-delay 10
 ppp multilink interleave
 multilink min-links 1 mandatory
 multilink-group 29014
 no clns route-cache
 service-policy input QPI_A_512K_5_N_0_2_13_0_4_75
 service-policy output QPO_A_512K_5_0_2_13_0_4_75
!
interface Multilink29016
 dampening 30 50 1100 200
 description EXPRESSORODOVIARIO  | 4096K | SLS/MULTI/46411 | (SLS/MULTI/46411)
 ip address 189.53.246.197 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no peer neighbor-route
 no cdp enable
 ppp multilink
 no ppp multilink fragmentation
 multilink min-links 1 mandatory
 multilink-group 29016
 no clns route-cache
 service-policy input QPI_BBONE_DSCP_V1
!
interface Multilink29022
 dampening 30 50 1100 200
 description LINUXELL  | 4096K | SLS/MULTI/47255 | (SLS/MULTI/47255)
 ip vrf forwarding REDEVIP_BLD_MLPPP:3799
 ip address 189.52.166.173 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no peer neighbor-route
 no cdp enable
 ppp multilink
 no ppp multilink fragmentation
 multilink min-links 1 mandatory
 multilink-group 29022
 no clns route-cache
 service-policy input QPI_A_4096K_4_N_0_0_0_0_1_94
 service-policy output QPO_A_4096K_4_0_0_0_0_1_94
!
interface Multilink29032
 dampening 30 50 1100 200
 description CBE  | 512K | ITZ/MULTI/24059 | (ITZ/MULTI/24059) | BGP_AS64962
 bandwidth 512
 ip vrf forwarding CBE:4734
 ip address 189.43.197.197 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 load-interval 30
 no peer neighbor-route
 no cdp enable
 ppp multilink
 ppp multilink fragment-delay 10
 ppp multilink interleave
 multilink min-links 1 mandatory
 multilink-group 29032
 no clns route-cache
 service-policy input QPI_A_512K_11_N_0_30_46_0_4_8
 service-policy output QPO_A_512K_11_0_30_46_0_4_8
!
interface Multilink29037
 dampening 30 50 1100 200
 description CONAB  | 512K | SLS/MULTI/19293 | (SLS/MULTI/19293) | BGP_AS65495
 bandwidth 512
 ip vrf forwarding CONAB:4162
 ip address 189.53.246.213 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 shutdown
 no peer neighbor-route
 no cdp enable
 ppp multilink
 ppp multilink fragment-delay 10
 ppp multilink interleave
 multilink min-links 1 mandatory
 multilink-group 29037
 no clns route-cache
 service-policy input QPI_A_512K_0_N_0_25_16_25_4_7
 service-policy output QPO_A_512K_0_0_25_16_25_4_7
!
interface Multilink29039
 dampening 30 50 1100 200
 description BNB  | 4096K | SLS/MULTI/51400 | (SLS/MULTI/51400) | BGP_AS65000
 ip vrf forwarding BNB:5075
 ip address 189.53.11.233 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no peer neighbor-route
 no cdp enable
 ppp multilink
 no ppp multilink fragmentation
 multilink min-links 1 mandatory
 multilink-group 29039
 no clns route-cache
 service-policy input QPI_A_4096K_17_N_17_36_25_0_1_3
 service-policy output QPO_A_4096K_17_17_36_25_0_1_3
!
interface Multilink29041
 dampening 30 50 1100 200
 description RIHAPY  | 1024K | SLS/MULTI/51956 | (SLS/MULTI/51956) | BGP_AS65443
 bandwidth 1024
 ip vrf forwarding RIHAPPY:4005
 ip address 200.252.158.245 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no peer neighbor-route
 no cdp enable
 ppp multilink
 ppp multilink fragment-delay 10
 ppp multilink interleave
 multilink min-links 1 mandatory
 multilink-group 29041
 no clns route-cache
 service-policy input QPI_A_1024K_13_N_0_25_25_3_2_31
 service-policy output QPO_A_1024K_13_0_25_25_3_2_31
!
interface Multilink291016
 dampening 30 50 1100 200
 description BIGBEN  | 512K | SLS/MULTI/09419 | (SLS/MULTI/09419) | BGP_AS65216
 bandwidth 512
 ip vrf forwarding BIGBEN:2777
 ip address 189.43.120.217 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 shutdown
 no peer neighbor-route
 no cdp enable
 ppp multilink
 ppp multilink fragment-delay 10
 ppp multilink interleave
 multilink min-links 1 mandatory
 multilink-group 291016
 no clns route-cache
 service-policy input QPI_A_512K_5_N_0_2_0_0_4_88
 service-policy output QPO_A_512K_5_0_2_0_0_4_88
!
interface Multilink291020
 dampening 30 50 1100 200
 description CREFISA  | 512K | SLS/MULTI/54344 | (SLS/MULTI/54344) | BGP_AS65000
 bandwidth 512
 ip vrf forwarding CREFISA:5415
 ip address 189.52.211.25 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 load-interval 30
 no peer neighbor-route
 no cdp enable
 ppp multilink
 ppp multilink fragment-delay 10
 ppp multilink interleave
 multilink min-links 1 mandatory
 multilink-group 291020
 no clns route-cache
 service-policy input QPI_A_512K_50_N_0_10_0_0_4_35
 service-policy output QPO_A_512K_50_0_10_0_0_4_35
!
interface Multilink291021
 dampening 30 50 1100 200
 description WALMART  | 1024K | SLS/MULTI/54498 | (SLS/MULTI/54498) | BGP_AS65371
 bandwidth 1024
 ip vrf forwarding WALMART:3141
 ip address 189.23.28.137 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no peer neighbor-route
 no cdp enable
 ppp multilink
 ppp multilink fragment-delay 10
 ppp multilink interleave
 multilink min-links 1 mandatory
 multilink-group 291021
 no clns route-cache
 service-policy input QPI_A_1024K_4_N_0_21_32_0_2_40
 service-policy output QPO_A_1024K_4_0_21_32_0_2_40
!
interface Multilink291022
 dampening 30 50 1100 200
 description SERPRO  | 512K | SLS/MULTI/40134 | (SLS/MULTI/40134) | BGP_AS65021
 bandwidth 512
 ip vrf forwarding SERPRO_SLS_RIS_01:5892
 ip address 172.16.223.21 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no peer neighbor-route
 no cdp enable
 ppp multilink
 ppp multilink fragment-delay 10
 ppp multilink interleave
 multilink min-links 1 mandatory
 multilink-group 291022
 no clns route-cache
 service-policy input QPI_SERPRO_512K_V1
 service-policy output QPO_SERPRO_512K_V1
!
interface Multilink291027
 dampening 30 50 1100 200
 description HERVAL  | 512K | SLS/MULTI/54945 | (SLS/MULTI/54945) | BGP_AS65000
 bandwidth 512
 ip vrf forwarding HERVAL:4202
 ip address 189.52.211.5 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no peer neighbor-route
 no cdp enable
 ppp multilink
 ppp multilink fragment-delay 10
 ppp multilink interleave
 multilink min-links 1 mandatory
 multilink-group 291027
 no clns route-cache
 service-policy input QPI_A_512K_25_N_0_32_25_0_4_13
 service-policy output QPO_A_512K_25_0_32_25_0_4_13
!
interface Multilink291030
 dampening 30 50 1100 200
 description IMIFARMA  | 512K | SLS/MULTI/54983 | (SLS/MULTI/54983) | BGP_AS65000
 ip vrf forwarding IMIFARMA_EXTRANET:155458
 ip address 200.179.211.49 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no peer neighbor-route
 no cdp enable
 ppp multilink
 ppp multilink fragment-delay 10
 ppp multilink interleave
 multilink min-links 1 mandatory
 multilink-group 291030
 no clns route-cache
 service-policy input QPI_A_512K_5_N_0_30_16_4_4_40
 service-policy output QPO_A_512K_5_0_30_16_4_4_40
!
interface Multilink291032
 dampening 30 50 1100 200
 description IMIFARMA  | 512K | SLS/MULTI/54987 | (SLS/MULTI/54987) | BGP_AS65000
 bandwidth 512
 ip vrf forwarding IMIFARMA_EXTRANET:155458
 ip address 200.179.211.57 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no peer neighbor-route
 no cdp enable
 ppp multilink
 ppp multilink fragment-delay 10
 ppp multilink interleave
 multilink min-links 1 mandatory
 multilink-group 291032
 no clns route-cache
 service-policy input QPI_A_512K_5_N_0_30_16_4_4_40
 service-policy output QPO_A_512K_5_0_30_16_4_4_40
!
interface Multilink291038
 dampening 30 50 1100 200
 description IMIFARMA  | 512K | SLS/MULTI/55123 | (SLS/MULTI/55123) | BGP_AS65000
 bandwidth 512
 ip vrf forwarding IMIFARMA_EXTRANET:155458
 ip address 200.179.211.89 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no peer neighbor-route
 no cdp enable
 ppp multilink
 ppp multilink fragment-delay 10
 ppp multilink interleave
 multilink min-links 1 mandatory
 multilink-group 291038
 no clns route-cache
 service-policy input QPI_A_512K_5_N_0_30_16_4_4_40
 service-policy output QPO_A_512K_5_0_30_16_4_4_40
!
interface Multilink291040
 dampening 30 50 1100 200
 description CREFISA  | 2048K | SLS/MULTI/55327 | (SLS/MULTI/55327)
 ip vrf forwarding CREFISA:5415
 ip address 200.252.158.5 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 load-interval 30
 no peer neighbor-route
 no cdp enable
 ppp multilink
 ppp multilink fragment-delay 10
 no ppp multilink fragmentation
 multilink min-links 1 mandatory
 multilink-group 291040
 no clns route-cache
 service-policy input QPI_A_2048K_13_N_0_3_0_0_1_9
 service-policy output QPO_A_2048K_13_0_3_0_0_1_9
!
interface Multilink291042
 dampening 30 50 1100 200
 description IMIFARMA  | 512K | SLS/MULTI/55463 | (SLS/MULTI/55463) | BGP_AS65000
 bandwidth 512
 ip vrf forwarding IMIFARMA_EXTRANET:155458
 ip address 189.52.211.129 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no peer neighbor-route
 no cdp enable
 ppp multilink
 ppp multilink fragment-delay 10
 ppp multilink interleave
 multilink min-links 1 mandatory
 multilink-group 291042
 no clns route-cache
 service-policy input QPI_A_512K_5_N_0_30_16_4_4_40
 service-policy output QPO_A_512K_5_0_30_16_4_4_40
!
interface Multilink291044
 dampening 30 50 1100 200
 description IMIFARMA  | 512K | SLS/MULTI/55810 | (SLS/MULTI/55810) | BGP_AS65000
 bandwidth 512
 ip vrf forwarding IMIFARMA_EXTRANET:155458
 ip address 200.252.158.69 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no peer neighbor-route
 no cdp enable
 ppp multilink
 ppp multilink fragment-delay 10
 ppp multilink interleave
 multilink min-links 1 mandatory
 multilink-group 291044
 no clns route-cache
 service-policy input QPI_A_512K_5_N_0_30_16_4_4_40
 service-policy output QPO_A_512K_5_0_30_16_4_4_40
!
interface Multilink291045
 dampening 30 50 1100 200
 description CREFISA  | 512K | SJE/MULTI/55828 | (SJE/MULTI/55828) | BGP_AS65000
 bandwidth 512
 ip vrf forwarding CREFISA:5415
 ip address 200.179.212.33 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no peer neighbor-route
 no cdp enable
 ppp multilink
 ppp multilink fragment-delay 10
 ppp multilink interleave
 multilink min-links 1 mandatory
 multilink-group 291045
 no clns route-cache
 service-policy input QPI_A_512K_50_N_0_10_0_0_4_35
 service-policy output QPO_A_512K_50_0_10_0_0_4_35
!
interface Multilink291048
 dampening 30 50 1100 200
 description SUPERMMACIEL  | 512K | SLS/MULTI/55908 | (SLS/MULTI/55908) | BGP_AS65216
 bandwidth 512
 ip vrf forwarding SUPERMMACIEL:3754
 ip address 189.52.211.237 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no peer neighbor-route
 no cdp enable
 ppp multilink
 ppp multilink fragment-delay 10
 ppp multilink interleave
 multilink min-links 1 mandatory
 multilink-group 291048
 no clns route-cache
 service-policy input QPI_A_512K_5_N_0_0_13_0_4_77
 service-policy output QPO_A_512K_5_0_0_13_0_4_77
!
interface Multilink291051
 dampening 30 50 1100 200
 description ALMEIDA  | 10240K | BBL/MULTI/56385 | (BBL/MULTI/56385)
 ip address 200.179.211.141 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no peer neighbor-route
 no cdp enable
 ppp multilink
 no ppp multilink fragmentation
 multilink min-links 1 mandatory
 multilink-group 291051
 no clns route-cache
 service-policy input QPI_BBONE_DSCP_V1
!
interface Multilink291053
 dampening 30 50 1100 200
 description SERPRO  | 2048K | SLS/MULTI/40307 | (SLS/MULTI/40307) | BGP_AS65013
 bandwidth 2048
 ip vrf forwarding SERPRO_SLS_DNIT_04:5949
 ip address 10.218.15.9 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 ip pim sparse-mode
 no peer neighbor-route
 no cdp enable
 ppp multilink
 ppp multilink fragment-delay 10
 no ppp multilink fragmentation
 multilink min-links 1 mandatory
 multilink-group 291053
 no clns route-cache
 service-policy input QPI_SERPRO_2048K_V1
 service-policy output QPO_SERPRO_2048K_V1
!
interface Multilink291056
 dampening 30 50 1100 200
 description COMAER_NEW  | 6144K | ALN/MULTI/57051 | (ALN/MULTI/57051) | BGP_AS65000
 ip vrf forwarding COMAER_NEW:5485
 ip address 189.52.211.177 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 load-interval 30
 no peer neighbor-route
 no cdp enable
 ppp multilink
 no ppp multilink fragmentation
 multilink min-links 1 mandatory
 multilink-group 291056
 no clns route-cache
 service-policy input QPI_A_6144K_4_N_0_20_39_20_2_14
 service-policy output QPO_A_6144K_4_0_20_39_20_2_14
!
interface Multilink291057
 dampening 30 50 1100 200
 description IMIFARMA  | 512K | SJE/MULTI/58179 | (SJE/MULTI/58179) | BGP_AS65000
 bandwidth 512
 ip vrf forwarding IMIFARMA_EXTRANET:155458
 ip address 189.52.211.37 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no peer neighbor-route
 no cdp enable
 ppp multilink
 ppp multilink fragment-delay 10
 ppp multilink interleave
 multilink min-links 1 mandatory
 multilink-group 291057
 no clns route-cache
 service-policy input QPI_A_512K_5_N_0_30_16_4_4_40
 service-policy output QPO_A_512K_5_0_30_16_4_4_40
!
interface Multilink291060
 dampening 30 50 1100 200
 description BRASPRESS  | 2048K | SLS/MULTI/24755 | (SLS/MULTI/24755) | BGP_AS64981
 ip vrf forwarding BRASPRESS:4733
 ip address 187.28.122.53 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no peer neighbor-route
 no cdp enable
 ppp multilink
 ppp multilink fragment-delay 10
 no ppp multilink fragmentation
 multilink min-links 1 mandatory
 multilink-group 291060
 no clns route-cache
 service-policy input QPI_BBONE_EXP_V1
!
interface Multilink291061
 description SERPRO  | 1024K | CXS/MULTI/40169 | (CXS/MULTI/40169) | BGP_AS65003
 bandwidth 1024
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 shutdown
 no peer neighbor-route
 no cdp enable
 ppp multilink
 ppp multilink interleave
 multilink min-links 1 mandatory
 multilink-group 291061
 no clns route-cache
 service-policy input QPI_SERPRO_1024K_V1
 service-policy output QPO_SERPRO_1024K_V1
!
interface Multilink291062
 dampening 30 50 1100 200
 description TECELAGEMAV  | 512K | ITZ/MULTI/59478 | (ITZ/MULTI/59478) | BGP_AS65000
 ip vrf forwarding TECELAGEMAV:2642
 ip address 200.172.11.17 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no peer neighbor-route
 no cdp enable
 ppp multilink
 ppp multilink fragment-delay 10
 ppp multilink interleave
 multilink min-links 1 mandatory
 multilink-group 291062
 no clns route-cache
 service-policy input QPI_BBONE_EXP_V1
!
interface Multilink291063
 description BONO TRANSPORTES  | 4096K | SJE/MULTI/60397 | (SJE/MULTI/60397)
 ip address 200.179.211.133 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no peer neighbor-route
 no cdp enable
 ppp multilink
 no ppp multilink fragmentation
 multilink min-links 1 mandatory
 multilink-group 291063
 no clns route-cache
 service-policy input QPI_BBONE_DSCP_V1
!
interface Multilink291064
 description IMIFARMA  | 512K | SLS/MULTI/55008 | (SLS/MULTI/55008) | BGP_AS65000
 bandwidth 512
 ip vrf forwarding IMIFARMA_EXTRANET:155458
 ip address 201.30.36.61 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no peer neighbor-route
 no cdp enable
 ppp multilink
 ppp multilink fragment-delay 10
 ppp multilink interleave
 multilink min-links 1 mandatory
 multilink-group 291064
 no clns route-cache
 service-policy input QPI_A_512K_5_N_0_30_16_4_4_40
 service-policy output QPO_A_512K_5_0_30_16_4_4_40
!
interface Multilink291066
 description BCOAM  | 256K | SLS/MULTI/24852 | (SLS/MULTI/24852) | BGP_AS65330
 bandwidth 256
 ip vrf forwarding BCOAM:4783
 ip address 189.43.197.21 255.255.255.252
 no ip directed-broadcast
 no peer neighbor-route
 no cdp enable
 ppp multilink
 ppp multilink fragment-delay 10
 ppp multilink interleave
 multilink-group 291066
 no clns route-cache
 service-policy input QPI_A_256K_22_N_0_29_22_13_7_6
 service-policy output QPO_A_256K_22_0_29_22_13_7_6
!
interface Null0
 no ip unreachables
!
interface Port-channel1
 description Ligacao SW01.SLS | 2000M | SLS/ETHCH/019 | (GigabitEthernet 4/0/0-4/0/1 do gacc01.sls <--> portas 4/3-4/4 do sw01.sls)
 mtu 9180
 bandwidth 2000000
 ip address 200.244.63.73 255.255.255.224
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
 description Ligacao SW02.SLS | 2000M | SLS/ETHCH/020 | (GigabitEthernet 5/0/0-50/1 do gacc01.sls <--> portas 4/3-4/4 do sw02.sls)
 mtu 9180
 bandwidth 2000000
 ip address 200.244.63.105 255.255.255.224
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
interface Serial1/0/0.1/1/1/1:0
 description SERPRO  | 1024K | CXS/IP/00200 | (CXS/IP/00200)
 bandwidth 1024
 ip vrf forwarding SERPRO_SLS_RFB_04:5905
 ip address 10.53.2.141 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 ip pim sparse-mode
 encapsulation ppp
 no peer neighbor-route
 no cdp enable
 service-policy input QPI_SERPRO_1024K_V1
 service-policy output QPO_SERPRO_1024K_V1
!
interface Serial1/0/0.1/1/1/2:0
 dampening 30 50 1100 200
 description TECBAN  | 2048K | SLS/IP/03863 | (SLS/IP/03863) | BGP_AS65132
 bandwidth 2048
 ip vrf forwarding TECBAN_NOVA:3642
 ip address 187.29.255.57 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 no cdp enable
 service-policy input QPI_A_2048K_7_N_13_38_0_0_2_39
 service-policy output QPO_A_2048K_7_13_38_0_0_2_39
!
interface Serial1/0/0.1/1/3/2:0
 dampening 30 50 1100 200
 description CREDISHOP  | 2048K | SLS/IP/00828 | (SLS/IP/00828)
 bandwidth 2048
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 ppp chap hostname MULTILINK_28937
 ppp multilink
 multilink-group 28937
!
interface Serial1/0/0.1/1/5/1:1
 dampening 30 50 1100 200
 description PAGUEMENOS  | 512K | ENLACE FR CLIENTE 
 bandwidth 512
 no ip address
 no ip directed-broadcast
 encapsulation frame-relay IETF
 no ip mroute-cache
 frame-relay lmi-type cisco
!
interface Serial1/0/0.1/1/5/1:1.1 point-to-point
 description PAGUEMENOS  | 512K | SLS/IP/05710 | (SLS/IP/05710) | BGP_AS65338
 bandwidth 512
 ip vrf forwarding PAGUEMENOS:3822
 ip address 187.29.255.237 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no ip mroute-cache
 no cdp enable
 frame-relay interface-dlci 100 IETF   
  class QC_BBONE_EXP_V1
!
interface Serial1/0/0.1/1/6/1:1
 dampening 30 50 1100 200
 description COLOMBO  | 256K | SLS/IP/04998 | (SLS/IP/04998)
 bandwidth 256
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 ppp chap hostname MULTILINK_28946
 ppp multilink
 multilink-group 28946
!
interface Serial1/0/0.1/1/6/1:2
 dampening 30 50 1100 200
 description IMIFARMA  | 512K | SJE/IP/00159 | (SJE/IP/00159)
 bandwidth 512
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 ppp chap hostname MULTILINK_291057
 ppp multilink
 multilink-group 291057
!
interface Serial1/0/0.1/1/6/2:1
 dampening 30 50 1100 200
 description SUPERMMACIEL  | 512K | SLS/IP/04572 | (SLS/IP/04572) | BLK-SAIP-APEDIDO/2018028-1545/POR-RPA01
 bandwidth 512
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 shutdown
 no peer neighbor-route
 ppp chap hostname MULTILINK_29013
 ppp multilink
 multilink-group 29013
!
interface Serial1/0/0.1/1/6/2:2
 dampening 30 50 1100 200
 description IMIFARMA  | 512K | SLS/IP/05673 | (SLS/IP/05673)
 bandwidth 512
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 ppp chap hostname MULTILINK_291030
 ppp multilink
 multilink-group 291030
!
interface Serial1/0/0.1/1/6/3:0
 dampening 30 50 1100 200
 description SUPERMMACIEL  | 512K | SLS/IP/00938 | (SLS/IP/00938) | BLK-SAIP-APEDIDO/2018028-1557/POR-RPA01
 bandwidth 512
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 shutdown
 no peer neighbor-route
 ppp chap hostname MULTILINK_29014
 ppp multilink
 multilink-group 29014
!
interface Serial1/0/0.1/1/6/3:1
 dampening 30 50 1100 200
 description RIHAPPY  | 1024K | SLS/IP/05486 | (SLS/IP/05486)
 bandwidth 1024
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 ppp chap hostname MULTILINK_29041
 ppp multilink
 multilink-group 29041
!
interface Serial1/0/0.1/1/6/3:3
 dampening 30 50 1100 200
 description SETMA  | 128K | SLS/IP/00434 | (SLS/IP/00434)
 bandwidth 128
 ip vrf forwarding SET_MA:3377
 ip address 189.43.120.113 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 no cdp enable
 service-policy input QPI_BBONE_EXP_V1
!
interface Serial1/0/0.1/1/7/1:4
 dampening 30 50 1100 200
 description BBRASIL  | 64K | ENLACE FR CLIENTE 
 bandwidth 64
 no ip address
 no ip directed-broadcast
 encapsulation frame-relay IETF
 no ip mroute-cache
 frame-relay lmi-type cisco
!
interface Serial1/0/0.1/1/7/1:4.1 point-to-point
 description BBRASIL  | 64K | ITZ/IP/01281 | (ITZ/IP/01281) | BGP_AS65521
 bandwidth 64
 ip vrf forwarding BBRASIL_PAE:7041
 ip address 10.247.76.1 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 ip pim sparse-mode
 no ip mroute-cache
 shutdown
 no cdp enable
 frame-relay interface-dlci 100 CISCO   
  class QC_64K_BBrasil_PAE_IOS_V1
!
interface Serial1/0/0.1/1/7/1:5
 dampening 30 50 1100 200
 description BBRASIL  | 64K | ENLACE FR CLIENTE 
 bandwidth 64
 no ip address
 no ip directed-broadcast
 encapsulation frame-relay IETF
 no ip mroute-cache
 frame-relay lmi-type cisco
!
interface Serial1/0/0.1/1/7/1:5.1 point-to-point
 description BBRASIL_PAE  | 64K | ITZ/IP/01284 | (ITZ/IP/01284) | BGP_AS65524
 bandwidth 64
 ip vrf forwarding BBRASIL_PAE:7041
 ip address 10.251.60.157 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no ip mroute-cache
 no cdp enable
 frame-relay interface-dlci 100 CISCO   
  class QC_64K_BBrasil_PAE_IOS_V1
!
interface Serial1/0/0.1/1/7/2:2
 dampening 30 50 1100 200
 description TECELAGEMAV  | 512K | ITZ/IP/01340 | (ITZ/IP/01340)
 bandwidth 512
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 ppp chap hostname MULTILINK_291062
 ppp multilink
 multilink-group 291062
!
interface Serial1/0/0.1/1/7/3:1
 dampening 30 50 1100 200
 description MARISALOJAS  | 1024K | ITZ/IP/01118 | (ITZ/IP/01118)
 bandwidth 1024
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 ppp chap hostname MULTILINK_28935
 ppp multilink
 multilink-group 28935
!
interface Serial1/0/0.1/1/7/3:4
 dampening 30 50 1100 200
 description BBRASIL  | 64K | ENLACE FR CLIENTE 
 bandwidth 64
 no ip address
 no ip directed-broadcast
 encapsulation frame-relay IETF
 no ip mroute-cache
 frame-relay lmi-type cisco
!
interface Serial1/0/0.1/1/7/3:4.1 point-to-point
 description BBRASIL_PAE  | 64K | ITZ/IP/01174 | (ITZ/IP/01174) | BGP_AS65524
 bandwidth 64
 ip vrf forwarding BBRASIL_PAE:7041
 ip address 10.7.115.69 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no ip mroute-cache
 no cdp enable
 frame-relay interface-dlci 100 CISCO   
  class QC_64K_BBrasil_PAE_IOS_V1
!
interface Serial1/0/0.1/2/1/2:0
 dampening 30 50 1100 200
 description ALE  | 2048K | SLS/IP/00696 | (SLS/IP/00696) | BGP_AS65282
 bandwidth 2048
 ip vrf forwarding ALECOMBUST:1639
 ip address 189.23.28.157 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 no cdp enable
 service-policy input QPI_A_2048K_13_N_0_39_13_0_1_33
 service-policy output QPO_A_2048K_13_0_39_13_0_1_33
!
interface Serial1/0/0.1/2/2/2:0
 dampening 30 50 1100 200
 description CREDISHOP  | 2048K | SLS/IP/05458 | (SLS/IP/05458)
 bandwidth 2048
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 ppp chap hostname MULTILINK_28937
 ppp multilink
 multilink-group 28937
!
interface Serial1/0/0.1/2/3/2:0
 dampening 30 50 1100 200
 description WINDOWS  | 2048K | SLS/IP/04803 | (SLS/IP/04803) | BLK-SAIP-APEDIDO/20170815-1043/POR-DENISVM
 bandwidth 2048
 no ip address
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 shutdown
 no peer neighbor-route
 no cdp enable
 service-policy input QPI_BBONE_DSCP_V1
!
interface Serial1/0/0.1/2/4/2:0
 dampening 30 50 1100 200
 description MARGUSA  | 2048K | BBEI/IP/00003 | (BBEI/IP/00003)
 bandwidth 2048
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 ppp chap hostname MULTILINK_28992
 ppp multilink
 multilink-group 28992
!
interface Serial1/0/0.1/2/4/3:0
 dampening 30 50 1100 200
 description VESPER  | 2048K | SLS/IP/00102 | (SLS/IP/00102)
 bandwidth 2048
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 shutdown
 no peer neighbor-route
 no cdp enable
 service-policy input QPI_BBONE_DSCP_V1
!
interface Serial1/0/0.1/2/7/3:0
 dampening 30 50 1100 200
 description MILLS  | 2048K | ENLACE FR CLIENTE 
 bandwidth 2048
 no ip address
 no ip directed-broadcast
 encapsulation frame-relay IETF
 no ip mroute-cache
 load-interval 30
 frame-relay lmi-type cisco
!
interface Serial1/0/0.1/2/7/3:0.1 point-to-point
 description MILLS  | 2048K | SLS/IP/05733 | (SLS/IP/05733) | BGP_AS65462
 bandwidth 2048
 ip vrf forwarding MILLS:2550
 ip address 200.179.211.101 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no ip mroute-cache
 no cdp enable
 frame-relay interface-dlci 100 CISCO   
  class QC_AF_2048K_18_N_23_13_0_0_1_43_0B
!
interface Serial1/0/0.1/3/2/1:0
 dampening 30 50 1100 200
 description SERPRO  | 1024K | BBL/IP/00183 | (BBL/IP/00183)
 bandwidth 1024
 ip vrf forwarding SERPRO_SLS_RFB_02:5881
 ip address 10.53.2.161 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 ip pim sparse-mode
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 service-policy input QPI_SERPRO_1024K_V1
 service-policy output QPO_SERPRO_1024K_V1
!
interface Serial1/0/0.1/3/3/1:0
 dampening 30 50 1100 200
 description LASA_NOVA  | 1024K | ENLACE FR CLIENTE 
 bandwidth 1024
 no ip address
 no ip directed-broadcast
 encapsulation frame-relay IETF
 no ip mroute-cache
 frame-relay lmi-type cisco
!
interface Serial1/0/0.1/3/3/1:0.1 point-to-point
 description LASA_NOVA  | 1024K | SLS/IP/04081 | (SLS/IP/04081) | BLK-SAIP-APEDIDO/2017087-1846/POR-ALUISMA
 bandwidth 1024
 no ip directed-broadcast
 no ip proxy-arp
 no ip mroute-cache
 shutdown
 no cdp enable
 frame-relay interface-dlci 100 IETF   
  class QC_AF_1024K_25_N_0_40_0_0_2_32_0B
!
interface Serial1/0/0.1/3/5/2:0
 dampening 30 50 1100 200
 description MELO FILHO  | 2048K | SLS/IP/05166 | (SLS/IP/05166)
 bandwidth 2048
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 ppp chap hostname MULTILINK_28990
 ppp multilink
 multilink-group 28990
!
interface Serial1/0/0.1/3/6/2:0
 dampening 30 50 1100 200
 description MARGUSA  | 2048K | BBEI/IP/00105 | (BBEI/IP/00105)
 bandwidth 2048
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 ppp chap hostname MULTILINK_28992
 ppp multilink
 multilink-group 28992
!
interface Serial1/0/0.1/3/7/3:0
 dampening 30 50 1100 200
 description MELO FILHO  | 2048K | SLS/IP/05165 | (SLS/IP/05165)
 bandwidth 2048
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 ppp chap hostname MULTILINK_28990
 ppp multilink
 multilink-group 28990
!
interface GigabitEthernet1/1/0
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 load-interval 30
 shutdown
 no negotiation auto
 no flowcontrol bidirectional
 no cdp enable
 service-policy input QPI_BBONE_S_400000_V1
 service-policy output QPO_BBONE_400000_V1
!
interface GigabitEthernet1/1/1
 description LINK ETH | 1000M | SLSUSDM/SLSUSIT/1G/005 | DM4650-SLSUS-IS04 PLACA GPC PORTA 1
 bandwidth 1000000
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 load-interval 30
 no negotiation auto
 no flowcontrol bidirectional
 no cdp enable
!
interface GigabitEthernet1/1/1.6
 description ACO MARANHAO  | 1500K | SLS/VL/9832161400 | (SLS/VL/9832161400)
 bandwidth 1500
 encapsulation dot1Q 6
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 189.53.11.253 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet1/1/1.8
 description SEBRAEMA  | 2048K | SLS/IP/05573 | (SLS/IP/05573) | BGP_AS64617
 bandwidth 2048
 encapsulation dot1Q 8
 ip vrf forwarding SEBRAEMA:4302
 ip address 189.52.211.41 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_A_2048K_5_0_0_0_0_2_92
 service-policy output QDO_A_2048K_5_0_0_0_0_2_92
!
interface GigabitEthernet1/1/1.11
 description EBM  | 4096K | BBL/MULTI/54809 | (BBL/MULTI/54809)
 bandwidth 4096
 encapsulation dot1Q 11
 ip address 187.29.255.249 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_4096_V1
 service-policy output QPO_BBONE_4096_V1
!
interface GigabitEthernet1/1/1.12
 description LOJASRIACHUELO  | 1024K | SLS/IP/05753 | (SLS/IP/05753) | BGP_AS65519
 bandwidth 1024
 encapsulation dot1Q 12
 ip vrf forwarding LOJASRIACHUELO:4120
 ip address 200.179.211.105 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_A_1024K_13_0_16_48_16_2_4
 service-policy output QDO_A_1024K_13_0_16_48_16_2_4
!
interface GigabitEthernet1/1/1.15
 description CEF  | 1500K | SLS/VL/9832280186 | (SLS/VL/9832280186)
 bandwidth 1500
 encapsulation dot1Q 15
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 189.53.246.5 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet1/1/1.17
 description IMIFARMA  | 512K | SLS/IP/05693 | (SLS/IP/05693) | BGP_AS65000
 bandwidth 512
 encapsulation dot1Q 17
 ip vrf forwarding IMIFARMA_EXTRANET:155458
 ip address 200.179.211.137 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_A_512K_5_0_30_16_4_4_40
 service-policy output QDO_A_512K_5_0_30_16_4_4_40
!
interface GigabitEthernet1/1/1.18
 description IMIFARMA  | 512K | SLS/IP/05687 | (SLS/IP/05687) | BLK-SAIP-APEDIDO/20171025-953/POR-T3PER
 bandwidth 512
 encapsulation dot1Q 18
 no ip directed-broadcast
 no ip proxy-arp
 shutdown
 no cdp enable
 service-policy input QPI_BBONE_N_512_V1
 service-policy output QPO_BBONE_512_V1
!
interface GigabitEthernet1/1/1.22
 description CEF  | 1500K | SLS/VL/9832684250 | (SLS/VL/9832684250)
 bandwidth 1500
 encapsulation dot1Q 22
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 189.53.246.153 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet1/1/1.23
 description ACCOR  | 2048K | BBL/IP/00217 | (BBL/IP/00217) | BGP_AS65194
 bandwidth 2048
 encapsulation dot1Q 23
 ip vrf forwarding ACCOR:5074
 ip address 200.179.211.97 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_A_2048K_0_0_61_14_7_1_16
 service-policy output QDO_A_2048K_0_0_61_14_7_1_16
!
interface GigabitEthernet1/1/1.24
 description CEF  | 1500K | SLS/VL/9832483038 | (SLS/VL/9832483038)
 bandwidth 1500
 encapsulation dot1Q 24
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 189.52.211.17 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet1/1/1.27
 description DISME  | 1500K | SLS/VL/9831313400 | (SLS/VL/9831313400)
 bandwidth 1500
 encapsulation dot1Q 27
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 189.52.211.209 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet1/1/1.29
 description CEF  | 1500K | SLS/VL/9832120400 | (SLS/VL/9832120400)
 bandwidth 1500
 encapsulation dot1Q 29
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.252.158.25 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet1/1/1.32
 description CEF  | 1500K | SLS/VL/9831333700 | (SLS/VL/9831333700)
 bandwidth 1500
 encapsulation dot1Q 32
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.179.211.113 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet1/1/1.33
 description SLS/VL/9831940200  | 1500K | SLS/VL/9831940200 | (SLS/VL/9831940200)
 bandwidth 1500
 encapsulation dot1Q 33
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.179.211.121 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet1/1/1.34
 description CEF  | 1500K | SLS/VL/9831333900 | (SLS/VL/9831333900)
 bandwidth 1500
 encapsulation dot1Q 34
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 189.53.11.89 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet1/1/1.35
 description CEF  | 1500K | SLS/VL/9831333000 | (SLS/VL/9831333000)
 bandwidth 1500
 encapsulation dot1Q 35
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.179.211.125 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet1/1/1.37
 description CEF  | 1500K | SLS/VL/9832268545 | (SLS/VL/9832268545)
 bandwidth 1500
 encapsulation dot1Q 37
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 189.52.211.65 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet1/1/1.38
 description CEF  | 1500K | SLS/VL/9831330250 | (SLS/VL/9831330250)
 bandwidth 1500
 encapsulation dot1Q 38
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 189.52.211.77 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet1/1/1.39
 description EMMARKA  | 2048K | SLS/IP/05427 | (SLS/IP/05427)
 bandwidth 2048
 encapsulation dot1Q 39
 ip address 200.252.158.97 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_2048_V1
 service-policy output QPO_BBONE_2048_V1
!
interface GigabitEthernet1/1/1.40
 description IMIFARMA  | 512K | SLS/IP/05814 | (SLS/IP/05814) | BGP_AS65000
 bandwidth 512
 encapsulation dot1Q 40
 ip vrf forwarding IMIFARMA_EXTRANET:155458
 ip address 200.179.211.153 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_A_512K_5_0_30_16_0_4_41
 service-policy output QDO_A_512K_5_0_30_16_0_4_41
!
interface GigabitEthernet1/1/1.41
 description CEF  | 1500K | CDO/VL/9936615400 | (CDO/VL/9936615400)
 bandwidth 1500
 encapsulation dot1Q 41
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.179.211.173 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet1/1/1.42
 description SOL INFOR.  | 2048K | SLS/IP/05800 | (SLS/IP/05800)
 bandwidth 2048
 encapsulation dot1Q 42
 ip address 200.252.158.65 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_2048_V1
 service-policy output QPO_BBONE_2048_V1
!
interface GigabitEthernet1/1/1.52
 description SERMA  | 1024K | SLS/IP/03816 | (SLS/IP/03816) | BGP_AS65188
 bandwidth 1024
 encapsulation dot1Q 52
 ip vrf forwarding SERMA:1663
 ip address 187.28.240.9 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_A_1024K_7_36_13_13_7_2_21
 service-policy output QDO_A_1024K_7_36_13_13_7_2_21
!
interface GigabitEthernet1/1/1.53
 description CREA_MA  | 800K | SLS/VL/9821068300 | (SLS/VL/9821068300)
 bandwidth 800
 encapsulation dot1Q 53
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 189.53.11.157 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_VIPSIP_VOZ_800_V1
 service-policy output QDO_VIPSIP_VOZ_800_V1
!
interface GigabitEthernet1/1/1.55
 description CEF  | 1500K | SLS/VL/9832211096 | (SLS/VL/9832211096)
 bandwidth 1500
 encapsulation dot1Q 55
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.179.211.117 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet1/1/1.58
 description CEF  | 1500K | SLS/VL/9832119100 | (SLS/VL/9832119100)
 bandwidth 1500
 encapsulation dot1Q 58
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.179.211.145 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet1/1/1.63
 description IBI_LOJAS  | 1024K | SLS/IP/02148 | (SLS/IP/02148) | BGP_AS64846
 bandwidth 1024
 encapsulation dot1Q 63
 ip vrf forwarding IBI_LOJAS:4639
 ip address 200.249.145.201 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_A_1024K_0_0_0_83_0_2_13
 service-policy output QDO_A_1024K_0_0_0_83_0_2_13
!
interface GigabitEthernet1/1/1.64
 description BANCO BRADESCO  | 1500K | SLS/VL/9840091480 | (SLS/VL/9840091480)
 bandwidth 1500
 encapsulation dot1Q 64
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 189.52.211.197 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet1/1/1.68
 description CEF  | 1500K | SLS/VL/9832175900 | (SLS/VL/9832175900)
 bandwidth 1500
 encapsulation dot1Q 68
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.179.211.181 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet1/1/1.69
 description ITAUNIBANCO  | 1024K | SIS/IP/00204 | (SIS/IP/00204) | BGP_AS65001
 bandwidth 1024
 encapsulation dot1Q 69
 ip vrf forwarding ITAUNIBANCO:6388
 ip address 200.179.211.189 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_A_1024K_10_24_20_0_40_2_3
 service-policy output QDO_A_1024K_10_24_20_0_40_2_3
!
interface GigabitEthernet1/1/1.71
 description C. J. F. CLARINDO & CIA  | 400K | SLS/VL/9833111440 | (SLS/VL/9833111440)
 bandwidth 400
 encapsulation dot1Q 71
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 189.52.211.113 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy output QDO_VIPSIP_VOZ_400_V1
!
interface GigabitEthernet1/1/1.90
 description MARISA  | 1024K | SLS/IP/05785 | (SLS/IP/05785)
 bandwidth 1024
 encapsulation dot1Q 90
 ip vrf forwarding MARISA:4972
 ip address 189.53.11.37 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_A_1024K_21_0_11_11_36_2_18
 service-policy output QDO_A_1024K_21_0_11_11_36_2_18
!
interface GigabitEthernet1/1/1.91
 description MARISALOJAS  | 1024K | SLS/IP/04654 | (SLS/IP/04654) | BGP_AS65000
 bandwidth 1024
 encapsulation dot1Q 91
 ip vrf forwarding MARISA:4972
 ip address 187.29.255.117 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_A_1024K_21_0_11_11_36_2_18
 service-policy output QDO_A_1024K_21_0_11_11_36_2_18
!
interface GigabitEthernet1/1/1.92
 description MARISALOJAS  | 1024K | SLS/IP/04906 | (SLS/IP/04906) | BGP_AS65000
 bandwidth 1024
 encapsulation dot1Q 92
 ip vrf forwarding MARISA:4972
 ip address 189.53.246.1 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_A_1024K_21_0_11_11_36_2_18
 service-policy output QDO_A_1024K_21_0_11_11_36_2_18
!
interface GigabitEthernet1/1/1.93
 description B CIRILO ALBINO  | 1024K | PHE/IP/00182 | (PHE/IP/00182)
 bandwidth 1024
 encapsulation dot1Q 93
 ip address 189.52.211.105 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 shutdown
 no cdp enable
 service-policy input QPI_BBONE_S_1024_V1
 service-policy output QPO_BBONE_1024_V1
!
interface GigabitEthernet1/1/1.97
 description MARISALOJAS  | 1024K | SLS/IP/03728 | (SLS/IP/03728) | BGP_AS65000
 bandwidth 1024
 encapsulation dot1Q 97
 ip vrf forwarding MARISA:4972
 ip address 187.28.122.197 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_N_1024_V1
 service-policy output QPO_BBONE_1024_V1
!
interface GigabitEthernet1/1/1.100
 description EXPRESSORODOVIARIO  | 800K | SLS/VL/9832454572 | (SLS/VL/9832454572)
 bandwidth 800
 encapsulation dot1Q 100
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 189.53.11.25 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_VIPSIP_VOZ_800_V1
 service-policy output QDO_VIPSIP_VOZ_800_V1
!
interface GigabitEthernet1/1/1.103
 description EBC  | 1500K | SLS/VL/9833343700 | (SLS/VL/9833343700)
 bandwidth 1500
 encapsulation dot1Q 103
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 187.29.255.125 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet1/1/1.290
 description PIA  | 2048K | SLS/IP/05841 | (SLS/IP/05841) | BGP_AS65012
 bandwidth 2048
 encapsulation dot1Q 290
 ip vrf forwarding PIA:1264
 ip address 189.53.246.189 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_N_2048_V1
 service-policy output QPO_BBONE_2048_V1
!
interface GigabitEthernet1/1/1.291
 description CEF  | 1500K | SLS/VL/9832235100 | (SLS/VL/9832235100)
 bandwidth 1500
 encapsulation dot1Q 291
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 189.53.246.125 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet1/1/1.301
 description MATEUS  | 1400K | SLS/VL/9833117200 | (SLS/VL/9833117200)
 bandwidth 1400
 encapsulation dot1Q 301
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.179.211.129 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy output QDO_VIPSIP_VOZ_1400_V1
!
interface GigabitEthernet1/1/2
 no ip address
 no ip directed-broadcast
 shutdown
 negotiation auto
 no cdp enable
!
interface GigabitEthernet1/1/3
 no ip address
 no ip directed-broadcast
 shutdown
 negotiation auto
 no cdp enable
!
interface GigabitEthernet1/1/4
 description LINK ETH | 1G | 001 | PB:HFC RTDSLSUS01 G3/10
 no ip address
 no ip directed-broadcast
 load-interval 30
 no negotiation auto
 no flowcontrol bidirectional
 no cdp enable
!
interface GigabitEthernet1/1/4.3
 description PRONUTRE  | 400K | SLS/VL/9833110780 | (SLS/VL/9833110780)
 bandwidth 400
 encapsulation dot1Q 3
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 189.52.211.201 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy output QDO_VIPSIP_VOZ_400_V1
!
interface GigabitEthernet1/1/4.7
 description JS DISTRIBUIDORA  | 2048K | SLS/IP/05932 | (SLS/IP/05932) | BGP_AS65000
 bandwidth 2048
 encapsulation dot1Q 7
 ip vrf forwarding JSDISTRIBUIDORA:7167
 ip address 200.252.158.57 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_A_2048K_20_30_33_0_0_2_14
 service-policy output QDO_A_2048K_20_30_33_0_0_2_14
!
interface GigabitEthernet1/1/4.9
 description MINISTERIO SAUDE  | 6000K | SLS/IP/06172 | (SLS/IP/06172)
 bandwidth 6000
 encapsulation dot1Q 9
 ip address 187.28.240.1 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_6000_V1
 service-policy output QPO_BBONE_6000_V1
!
interface GigabitEthernet1/1/4.10
 description ELEVADORESATLAS  | 512K | SLS/IP/05942 | (SLS/IP/05942) | BGP_AS65000
 bandwidth 512
 encapsulation dot1Q 10
 ip vrf forwarding ELEVADORESATLAS:7186
 ip address 200.179.211.229 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_A_512K_0_0_40_30_21_4_4
 service-policy output QDO_A_512K_0_0_40_30_21_4_4
!
interface GigabitEthernet1/1/4.12
 description RADIO TAXI CONFIANCA  | 1500K | SLS/VL/9832222222 | (SLS/VL/9832222222)
 bandwidth 1500
 encapsulation dot1Q 12
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 189.52.211.21 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet1/1/4.14
 description WILSON_SONS  | 1500K | SLS/VL/9833134300 | (SLS/VL/9833134300)
 bandwidth 1500
 encapsulation dot1Q 14
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 189.52.211.145 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet1/1/4.15
 description ITAU UNIBANCO  | 1024K | SLS/IP/05957 | (SLS/IP/05957) | BGP_AS65001
 bandwidth 1024
 encapsulation dot1Q 15
 ip vrf forwarding ITAUNIBANCO:6388
 ip address 200.252.158.9 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_A_1024K_10_24_20_0_40_2_3
 service-policy output QDO_A_1024K_10_24_20_0_40_2_3
!
interface GigabitEthernet1/1/4.17
 description OKIBRASIL  | 1024K | SLS/IP/06158 | (SLS/IP/06158) | BGP_AS65000
 bandwidth 1024
 encapsulation dot1Q 17
 ip vrf forwarding OKIBRASIL:7552
 ip address 189.52.211.173 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_A_1024K_20_0_25_0_0_2_51
 service-policy output QDO_A_1024K_20_0_25_0_0_2_51
!
interface GigabitEthernet1/1/4.18
 description RJ_BUGARIM  | 1500K | SLS/VL/9832133200 | (SLS/VL/9832133200)
 bandwidth 1500
 encapsulation dot1Q 18
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 189.53.11.21 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet1/1/4.19
 description TECBAN  | 256K | SLS/IP/06165 | (SLS/IP/06165)
 bandwidth 256
 encapsulation dot1Q 19
 ip vrf forwarding TECBAN:1221
 ip address 189.53.11.249 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_N_256_V1
 service-policy output QPO_BBONE_256_V1
!
interface GigabitEthernet1/1/4.20
 description ALIANCA  | 4096K | SLS/IP/06185 | (SLS/IP/06185)
 bandwidth 4096
 encapsulation dot1Q 20
 ip address 189.52.211.125 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_4096_V1
 service-policy output QPO_BBONE_4096_V1
!
interface GigabitEthernet1/1/4.21
 description ALIANCA  | 400K | SLS/VL/9832479992 | (SLS/VL/9832479992)
 bandwidth 400
 encapsulation dot1Q 21
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 189.52.211.73 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy output QDO_VIPSIP_VOZ_400_V1
!
interface GigabitEthernet1/1/4.22
 description ECO_CLINIC  | 1500K | SLS/VL/9838784700 | (SLS/VL/9838784700)
 bandwidth 1500
 encapsulation dot1Q 22
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 189.52.211.141 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet1/1/4.24
 description CAEMA  | 1500K | SLS/VL/9832471843 | (SLS/VL/9832471843)
 bandwidth 1500
 encapsulation dot1Q 24
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.252.158.41 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet1/1/4.25
 description ELO_CONTACT_CENTER_SERVICOS  | 1500K | SLS/VL/9833116130 | (SLS/VL/9833116130)
 bandwidth 1500
 encapsulation dot1Q 25
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.179.211.69 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet1/1/4.27
 description IMIFARMA  | 512K | SLS/IP/05943 | (SLS/IP/05943) | BGP_AS65000
 bandwidth 512
 encapsulation dot1Q 27
 ip vrf forwarding IMIFARMA_EXTRANET:155458
 ip address 200.252.158.213 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_A_512K_5_0_30_16_4_4_40
 service-policy output QDO_A_512K_5_0_30_16_4_4_40
!
interface GigabitEthernet1/1/4.28
 description ITAU  | 1500K | SLS/VL/9838783800 | (SLS/VL/9838783800)
 bandwidth 1500
 encapsulation dot1Q 28
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 189.53.11.165 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet1/1/4.29
 description ANTAQ  | 4096K | SLS/IP/06209 | (SLS/IP/06209) | BGP_AS65000
 bandwidth 4096
 encapsulation dot1Q 29
 ip vrf forwarding ANTAQ:7637
 ip address 189.52.211.89 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_A_4096K_0_10_0_0_0_1_87
 service-policy output QDO_A_4096K_0_10_0_0_0_1_87
!
interface GigabitEthernet1/1/4.30
 description J.F. EQUIPAMENTOS  | 1500K | SLS/VL/9833118844 | (SLS/VL/9833118844)
 bandwidth 1500
 encapsulation dot1Q 30
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 189.53.11.213 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet1/1/4.32
 description TEXACO  | 4096K | SLS/IP/06215 | (SLS/IP/06215) | BGP_AS65181
 bandwidth 4096
 encapsulation dot1Q 32
 ip vrf forwarding TEXACO:4523
 ip address 189.52.211.13 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_A_4096K_7_18_16_13_0_2_43
 service-policy output QDO_A_4096K_7_18_16_13_0_2_43
!
interface GigabitEthernet1/1/4.33
 description LASA_NOVA  | 2048K | SLS/IP/06232 | (SLS/IP/06232) | BGP_AS65316
 bandwidth 2048
 encapsulation dot1Q 33
 ip vrf forwarding LASA_NOVA:6236
 ip address 200.172.10.185 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_A_2048K_13_38_23_0_0_2_23
 service-policy output QDO_A_2048K_13_38_23_0_0_2_23
!
interface GigabitEthernet1/1/4.34
 description BRAZSHIPPING  | 6000K | SLS/IP/06243 | (SLS/IP/06243)
 bandwidth 6000
 encapsulation dot1Q 34
 ip address 189.53.11.65 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_6000_V1
 service-policy output QPO_BBONE_6000_V1
!
interface GigabitEthernet1/1/4.35
 description BCOPANAMERICANO  | 2048K | SLS/IP/05712 | (SLS/IP/05712)
 bandwidth 2048
 encapsulation dot1Q 35
 ip vrf forwarding BCOPANAMERICANO:5041
 ip address 200.179.211.1 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_A_2048K_30_0_49_0_0_2_17
 service-policy output QDO_A_2048K_30_0_49_0_0_2_17
!
interface GigabitEthernet1/1/4.36
 description BANCO BRADESCO S/A  | 1500K | SLS/VL/9838789050 | (SLS/VL/9838789050)
 bandwidth 1500
 encapsulation dot1Q 36
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 189.53.11.141 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet1/1/4.37
 description SETMA  | 4096K | SLS/IP/06251 | (SLS/IP/06251) | BGP_AS64704
 bandwidth 4096
 encapsulation dot1Q 37
 ip vrf forwarding SET_MA:3377
 ip address 189.52.211.149 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_N_4096_V1
 service-policy output QPO_BBONE_4096_V1
!
interface GigabitEthernet1/1/4.38
 description IMSL  | 1500K | SLS/VL/9833343333 | (SLS/VL/9833343333)
 bandwidth 1500
 encapsulation dot1Q 38
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.252.158.37 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet1/1/4.39
 description DPU  | 4096K | SLS/IP/05045 | (SLS/IP/05045)
 bandwidth 4096
 encapsulation dot1Q 39
 ip vrf forwarding INFOVIA_DPU:6092
 ip address 200.172.13.57 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 shutdown
 no cdp enable
 service-policy input QDI_A_4096K_13_10_38_4_7_1_26
 service-policy output QDO_A_4096K_13_10_38_4_7_1_26
!
interface GigabitEthernet1/1/4.40
 description ITAUNIBANCO  | 1024K | SLS/IP/05947 | (SLS/IP/05947) | BGP_AS65001
 bandwidth 1024
 encapsulation dot1Q 40
 ip vrf forwarding ITAUNIBANCO:6388
 ip address 187.29.255.93 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_A_1024K_10_24_20_0_40_2_3
 service-policy output QDO_A_1024K_10_24_20_0_40_2_3
!
interface GigabitEthernet1/1/4.41
 description IMIFARMA_EXTRANET  | 512K | SLS/IP/06287 | (SLS/IP/06287) | BGP_AS65000
 bandwidth 512
 encapsulation dot1Q 41
 ip vrf forwarding IMIFARMA_EXTRANET:155458
 ip address 200.252.158.125 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_A_512K_5_0_30_16_0_4_44
 service-policy output QDO_A_512K_5_0_30_16_0_4_44
!
interface GigabitEthernet1/1/4.42
 description REDE_CORREIOS  | 512K | SLS/IP/06096 | (SLS/IP/06096)
 bandwidth 512
 encapsulation dot1Q 42
 ip vrf forwarding CORREIOS_2016:155714
 ip address 172.18.75.9 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_Correios_512K_ARPA_IOS_D_V1
 service-policy output QDO_Correios_512K_ARPA_IOS_D_V1
!
interface GigabitEthernet1/1/4.43
 description REDE_CORREIOS  | 256K | SLS/IP/06049 | (SLS/IP/06049)
 bandwidth 256
 encapsulation dot1Q 43
 ip vrf forwarding CORREIOS_2016:155714
 ip address 172.18.72.225 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_Correios_256K_ARPA_IOS_D_V1
 service-policy output QDO_Correios_256K_ARPA_IOS_D_V1
!
interface GigabitEthernet1/1/4.44
 description CLINICA DA FAMILIA  | 1500K | SLS/VL/9830894122 | (SLS/VL/9830894122)
 bandwidth 1500
 encapsulation dot1Q 44
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 189.53.11.125 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet1/1/4.45
 description REDE_CORREIOS  | 256K | SLS/IP/06040 | (SLS/IP/06040) | BGP_AS65001
 bandwidth 256
 encapsulation dot1Q 45
 ip vrf forwarding CORREIOS_2016:155714
 ip address 172.18.87.153 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_Correios_256K_ARPA_IOS_D_V1
 service-policy output QDO_Correios_256K_ARPA_IOS_D_V1
!
interface GigabitEthernet1/1/4.46
 description ILUMINAR  | 800K | SLS/VL/9821090660 | (SLS/VL/9821090660)
 bandwidth 800
 encapsulation dot1Q 46
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 189.52.211.249 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_VIPSIP_VOZ_800_V1
 service-policy output QDO_VIPSIP_VOZ_800_V1
!
interface GigabitEthernet1/1/4.48
 description NOVOMUNDO  | 512K | SLS/IP/05896 | (SLS/IP/05896)
 bandwidth 512
 encapsulation dot1Q 48
 ip vrf forwarding NOVOMUNDO:7156
 ip address 200.179.211.205 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_N_512_V1
 service-policy output QPO_BBONE_512_V1
!
interface GigabitEthernet1/1/4.49
 description SPOKE  | 256K | SLS/IP/06326 | (SLS/IP/06326)
 bandwidth 256
 encapsulation dot1Q 49
 ip vrf forwarding TECBAN:1221
 ip address 189.53.11.149 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 shutdown
 no cdp enable
 service-policy input QPI_BBONE_N_256_V1
 service-policy output QPO_BBONE_256_V1
!
interface GigabitEthernet1/1/4.50
 description DPU  | 1500K | SLS/VL/9831827600 | (SLS/VL/9831827600)
 bandwidth 1500
 encapsulation dot1Q 50
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.252.158.141 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 shutdown
 no cdp enable
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet1/1/4.51
 description BRASPRESS TRANSPORTES  | 4096K | SLS/IP/06310 | (SLS/IP/06310)
 bandwidth 4096
 encapsulation dot1Q 51
 ip address 200.252.158.185 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_4096_V1
 service-policy output QPO_BBONE_4096_V1
!
interface GigabitEthernet1/1/4.52
 description AGIPLAN  | 4096K | SLS/IP/06315 | (SLS/IP/06315)
 bandwidth 4096
 encapsulation dot1Q 52
 ip address 200.252.158.161 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_4096_V1
 service-policy output QPO_BBONE_4096_V1
!
interface GigabitEthernet1/1/4.53
 description ELEVADORESATLAS  | 512K | SLS/IP/05942 | (SLS/IP/05942)
 bandwidth 512
 encapsulation dot1Q 53
 ip vrf forwarding ELEVADORESATLAS:7186
 no ip directed-broadcast
 no ip proxy-arp
 shutdown
 no cdp enable
 service-policy input QDI_A_512K_0_0_40_30_21_4_4
 service-policy output QDO_A_512K_0_0_40_30_21_4_4
!
interface GigabitEthernet1/1/4.63
 description LEOMADEIRAS  | 2048K | SLS/IP/02853 | (SLS/IP/02853) | BGP_AS64513
 bandwidth 2048
 encapsulation dot1Q 63
 ip vrf forwarding LEO:1056
 ip address 200.253.132.125 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_A_2048K_7_0_50_0_0_1_40
 service-policy output QDO_A_2048K_7_0_50_0_0_1_40
!
interface GigabitEthernet1/1/4.72
 description DIEBOLD_EXTRANET  | 2048K | SLS/IP/06054 | (SLS/IP/06054) | BGP_AS65035
 bandwidth 2048
 encapsulation dot1Q 72
 ip vrf forwarding DIEBOLD_EXTRANET:155476
 ip address 189.53.11.177 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_MCI_ETM_2048K_128K_1920K_G_V1
 service-policy output QDO_MCI_ETM_2048K_128K_1920K_G_V1
!
interface GigabitEthernet1/1/4.76
 description AGIPLAN  | 4096K | SLS/IP/06046 | (SLS/IP/06046)
 bandwidth 4096
 encapsulation dot1Q 76
 ip address 189.53.11.117 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_4096_V1
 service-policy output QPO_BBONE_4096_V1
!
interface GigabitEthernet1/1/4.77
 description IMIFARMA  | 512K | SLS/IP/06078 | (SLS/IP/06078) | BGP_AS65000
 bandwidth 512
 encapsulation dot1Q 77
 ip vrf forwarding IMIFARMA_EXTRANET:155458
 ip address 189.52.211.117 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_A_512K_7_0_30_16_4_4_38
 service-policy output QDO_A_512K_7_0_30_16_4_4_38
!
interface GigabitEthernet1/1/4.80
 description MARISA  | 1500K | SLS/VL/9838786950 | (SLS/VL/9838786950)
 bandwidth 1500
 encapsulation dot1Q 80
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 189.53.246.217 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet1/1/4.92
 description BBRASIL_NAC  | 2048K | SLS/IP/06066 | (SLS/IP/06066) | BGP_AS65321
 bandwidth 2048
 encapsulation dot1Q 92
 ip vrf forwarding BBRASIL_NAC:7399
 ip address 10.66.201.53 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 ip pim sparse-mode
 no cdp enable
 service-policy input QDI_2048K_BBrasil_NAC_GACC_V1
 service-policy output QDO_2048K_BBrasil_NAC_GACC_V1
!
interface GigabitEthernet1/1/4.93
 description REDE_CORREIOS  | 128K | SLS/IP/06102 | (SLS/IP/06102) | BGP_AS65001
 bandwidth 128
 encapsulation dot1Q 93
 ip vrf forwarding CORREIOS_2016:155714
 ip address 172.18.67.33 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_Correios_128K_ARPA_IOS_D_V1
 service-policy output QDO_Correios_128K_ARPA_IOS_D_V1
!
interface GigabitEthernet1/1/4.138
 description BRINKS  | 2048K | SLS/IP/06021 | (SLS/IP/06021)
 bandwidth 2048
 encapsulation dot1Q 138
 ip vrf forwarding BRINKS:1177
 ip address 189.52.211.153 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_2048K_10_40_15_30_0_2_2
 service-policy output QDO_2048K_10_40_15_30_0_2_2
!
interface GigabitEthernet1/1/4.404
 description UTE PARNAIBA  | 1500K | SLS/VL/9833133500 | (SLS/VL/9833133500)
 bandwidth 1500
 encapsulation dot1Q 404
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 189.53.11.205 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet1/1/4.502
 description CEF  | 1500K | SLS/VL/9833113180 | (SLS/VL/9833113180)
 bandwidth 1500
 encapsulation dot1Q 502
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.179.211.65 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet1/1/4.508
 description IMIFARMA  | 512K | SLS/IP/05915 | (SLS/IP/05915) | BGP_AS65000
 bandwidth 512
 encapsulation dot1Q 508
 ip vrf forwarding IMIFARMA_EXTRANET:155458
 ip address 200.179.211.221 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_A_512K_5_0_33_0_0_4_57
 service-policy output QDO_A_512K_5_0_33_0_0_4_57
!
interface GigabitEthernet1/1/4.620
 description IMIFARMA  | 512K | SLS/IP/05679 | (SLS/IP/05679) | BGP_AS65000
 bandwidth 512
 encapsulation dot1Q 620
 ip vrf forwarding IMIFARMA_EXTRANET:155458
 ip address 200.179.211.169 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_A_512K_5_0_30_16_4_4_40
 service-policy output QDO_A_512K_5_0_30_16_4_4_40
!
interface GigabitEthernet1/1/4.635
 description MINISTERIO SAUDE  | 2048K | SLS/IP/05272 | (SLS/IP/05272) | BGP_AS65000
 bandwidth 2048
 encapsulation dot1Q 635
 ip vrf forwarding INFOSUS:4968
 ip address 192.168.103.249 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_A_2048K_13_25_11_0_0_2_1
 service-policy output QDO_A_2048K_13_25_11_0_0_2_1
!
interface GigabitEthernet1/1/4.637
 description SESCOP  | 512K | SLS/IP/05869 | (SLS/IP/05869) | BGP_AS65000
 bandwidth 512
 encapsulation dot1Q 637
 ip vrf forwarding SESCOP:6219
 ip address 200.252.158.109 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_N_512_V1
 service-policy output QPO_BBONE_512_V1
!
interface GigabitEthernet1/1/4.638
 description J.FONSECA  | 400K | SLS/VL/9821072050 | (SLS/VL/9821072050)
 bandwidth 400
 encapsulation dot1Q 638
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.179.211.81 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy output QDO_VIPSIP_VOZ_400_V1
!
interface GigabitEthernet1/1/4.640
 description DAYCOVAL  | 600K | SLS/VL/9833139660 | (SLS/VL/9833139660)
 bandwidth 600
 encapsulation dot1Q 640
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 187.29.255.101 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy output QDO_VIPSIP_VOZ_600_V1
!
interface GigabitEthernet1/1/4.4001
 description 10.98.1.001/29_BSDO_SLS  | 128K | SLS/PE/98005 | (SLS/PE/98005)
 bandwidth 128
 encapsulation dot1Q 4001
 ip vrf forwarding TESTE_REDE_ACESSO:6672
 ip address 10.98.1.1 255.255.255.248
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_N_128_V1
 service-policy output QPO_BBONE_128_V1
!
interface Serial1/3/0.1/1/3/2:0
 dampening 30 50 1100 200
 description CREFISA  | 2048K | SLS/IP/05756 | (SLS/IP/05756)
 bandwidth 2048
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 ppp chap hostname MULTILINK_291040
 ppp multilink
 multilink-group 291040
!
interface Serial1/3/0.1/1/7/3:0
 dampening 30 50 1100 200
 description SPDISTRIBUI  | 2048K | SLS/IP/05464 | (SLS/IP/05464)
 bandwidth 2048
 ip address 189.53.11.81 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 no cdp enable
 service-policy input QPI_BBONE_DSCP_V1
!
interface Serial1/3/0.1/2/1/1:4
 dampening 30 50 1100 200
 description ABNAMRO  | 512K | SLS/IP/03832 | (SLS/IP/03832)
 bandwidth 512
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 ppp chap hostname MULTILINK_28911
 ppp multilink
 multilink-group 28911
!
interface Serial1/3/0.1/2/1/2:0
 dampening 30 50 1100 200
 description PREVIDENCIA  | 512K | ENLACE FR CLIENTE 
 bandwidth 512
 no ip address
 no ip directed-broadcast
 encapsulation frame-relay IETF
 no ip mroute-cache
 frame-relay lmi-type cisco
!
interface Serial1/3/0.1/2/1/2:0.1 point-to-point
 description PREVIDENCIA  | 512K | USS/IP/00103 | (USS/IP/00103) | BGP_AS26218
 bandwidth 512
 ip vrf forwarding PREVIDENCIA_SPOKES:152225
 ip address 10.78.44.109 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no ip mroute-cache
 snmp trap link-status
 no cdp enable
 frame-relay interface-dlci 100 IETF   
  class QC_BBONE_EXP_V1
!
interface Serial1/3/0.1/2/1/2:1
 dampening 30 50 1100 200
 description BONSUCESSO  | 512K | ENLACE FR CLIENTE 
 bandwidth 512
 no ip address
 no ip directed-broadcast
 encapsulation frame-relay IETF
 no ip mroute-cache
 load-interval 30
 frame-relay lmi-type cisco
!
interface Serial1/3/0.1/2/1/2:1.1 point-to-point
 description BONSUCESSO  | 512K | SLS/IP/04930 | (SLS/IP/04930)
 bandwidth 512
 ip vrf forwarding BCOBONSUCESSO:2834
 ip address 189.53.246.137 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no ip mroute-cache
 snmp trap link-status
 no cdp enable
 frame-relay interface-dlci 100 CISCO   
  class QC_AF_512K_18_N_0_29_0_0_4_48_0B
!
interface Serial1/3/0.1/2/3/3:0
 dampening 30 50 1100 200
 description SEBRAEMA  | 2048K | BBL/IP/00041 | (BBL/IP/00041) | BGP_AS64617
 bandwidth 2048
 ip vrf forwarding SEBRAEMA:4302
 ip address 189.23.28.141 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 no cdp enable
 service-policy input QPI_A_2048K_6_N_0_1_0_0_2_90
 service-policy output QPO_A_2048K_6_0_1_0_0_2_90
!
interface Serial1/3/0.1/2/4/2:0
 dampening 30 50 1100 200
 description ORGAODEGESTAO  | 2048K | SLS/IP/05051 | (SLS/IP/05051) | BLK-SAIP-APEDIDO/20170920-1521/POR-T3PER
 bandwidth 2048
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 shutdown
 no peer neighbor-route
 no cdp enable
 ppp chap hostname MULTILINK_28968
 ppp multilink
 multilink-group 28968
!
interface Serial1/3/0.1/2/4/3:0
 dampening 30 50 1100 200
 description ORGAODEGESTAO  | 2048K | SLS/IP/05052 | (SLS/IP/05052)
 bandwidth 2048
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 no cdp enable
 ppp chap hostname MULTILINK_28968
 ppp multilink
 multilink-group 28968
!
interface Serial1/3/0.1/2/5/1:0
 dampening 30 50 1100 200
 description ORGAODEGESTAO  | 2048K | SLS/IP/06124 | (SLS/IP/06124) | BLK-SAIP-APEDIDO/20170920-1521/POR-T3PER
 bandwidth 2048
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 shutdown
 no peer neighbor-route
 no cdp enable
 ppp chap hostname MULTILINK_28968
 ppp multilink
 multilink-group 28968
!
interface Serial1/3/0.1/2/6/2:0
 dampening 30 50 1100 200
 description COMAER_NEW  | 2048K | SLS/IP/05485 | (SLS/IP/05485) | BGP_AS65000
 bandwidth 2048
 ip vrf forwarding COMAER_NEW:5485
 ip address 200.172.12.209 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 no cdp enable
 service-policy input QPI_A_2048K_4_N_0_11_25_11_2_46
 service-policy output QPO_A_2048K_4_0_11_25_11_2_46
!
interface Serial1/3/0.1/3/1/1:0
 dampening 30 50 1100 200
 description CREFISA  | 2048K | SLS/IP/04669 | (SLS/IP/04669) | BGP_AS65000
 bandwidth 2048
 ip vrf forwarding CREFISA:5415
 ip address 189.52.211.161 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 no cdp enable
 service-policy input QPI_A_2048K_13_N_0_3_0_0_2_81
 service-policy output QPO_A_2048K_13_0_3_0_0_2_81
!
interface Serial1/3/0.1/3/1/2:0
 dampening 30 50 1100 200
 description COMAER  | 2048K | ALN/IP/00001 | (ALN/IP/00001)
 bandwidth 2048
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no ip mroute-cache
 no peer neighbor-route
 ppp chap hostname MULTILINK_291056
 ppp multilink
 multilink-group 291056
!
interface Serial1/3/0.1/3/1/3:0
 dampening 30 50 1100 200
 description COMAER_NEW  | 2048K | ALN/IP/00110 | (ALN/IP/00110)
 bandwidth 2048
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 ppp chap hostname MULTILINK_291056
 ppp multilink
 multilink-group 291056
!
interface Serial1/3/0.1/3/2/1:0
 dampening 30 50 1100 200
 description COMAER_NEW  | 2048K | ALN/IP/00111 | (ALN/IP/00111)
 bandwidth 2048
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 ppp chap hostname MULTILINK_291056
 ppp multilink
 multilink-group 291056
!
interface Serial1/3/0.1/3/5/2:0
 description LASA_NOVA | 2048K | SLS/IP/03749 | (SLS/IP/03749)
 bandwidth 2048
 no ip address
 no ip directed-broadcast
 encapsulation frame-relay IETF
 no ip mroute-cache
 frame-relay lmi-type cisco
!
interface Serial1/3/0.1/3/5/2:0.1 point-to-point
 description LASA_NOVA  | 2048K | SLS/IP/03749 | (SLS/IP/03749) | BGP_AS65316
 bandwidth 2048
 ip vrf forwarding LASA_NOVA:6236
 ip address 187.28.122.213 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no ip mroute-cache
 no cdp enable
 frame-relay interface-dlci 100 IETF   
  class QC_AF_2048K_13_N_38_23_0_0_2_23_0B
!
interface GigabitEthernet4/0/0
 description Ligacao SW01.SLS | 1000M | SLS/GIGA/013 | (porta 4/3 do sw01.sls)
 negotiation auto
 channel-group 1
 no cdp enable
!
interface GigabitEthernet4/0/1
 description Ligacao SW01.SLS | 1000M | SLS/GIGA/042 | (porta 4/4 do sw01.sls)
 negotiation auto
 channel-group 1
 no cdp enable
!
interface GigabitEthernet4/0/2
 description RESERVADO PARA BACKBONE IP | ROGERIO GALEAZZI | 521-3113 | 08/04/2009
 no ip address
 no ip directed-broadcast
 shutdown
 negotiation auto
 no cdp enable
!
interface GigabitEthernet4/0/3
 description RESERVADO PARA BACKBONE IP | ROGERIO GALEAZZI | 521-3113 | 08/04/2009
 no ip address
 no ip directed-broadcast
 shutdown
 negotiation auto
 no cdp enable
!
interface GigabitEthernet4/0/4
 description RESERVADO PARA BACKBONE IP | ROGERIO GALEAZZI | 521-3113 | 08/04/2009
 no ip address
 no ip directed-broadcast
 shutdown
 negotiation auto
 no cdp enable
!
interface GigabitEthernet5/0/0
 description Ligacao SW02.SLS | 1000M | SLS/GIGA/014 | (porta 4/3 do sw02.sls)
 negotiation auto
 channel-group 2
 no cdp enable
!
interface GigabitEthernet5/0/1
 description Ligacao SW02.SLS | 1000M | SLS/GIGA/043 | (porta 4/4 do sw02.sls)
 negotiation auto
 channel-group 2
 no cdp enable
!
interface GigabitEthernet5/0/2
 description RESERVADO PARA BACKBONE IP | FONTAIN | 2121-7389 | 04/03/2015
 no ip address
 ip access-group iACL in
 ip verify unicast source reachable-via any allow-self-ping
 no ip redirects
 no ip directed-broadcast
 no ip proxy-arp
 shutdown
 negotiation auto
 no cdp enable
!
interface GigabitEthernet5/0/3
 description RESERVADO PARA BACKBONE IP | ROGERIO GALEAZZI | 521-3113 | 08/04/2009
 no ip address
 no ip directed-broadcast
 shutdown
 negotiation auto
 no cdp enable
!
interface GigabitEthernet5/0/4
 description RESERVADO PARA BACKBONE IP | ROGERIO GALEAZZI | 521-3113 | 08/04/2009
 no ip address
 no ip directed-broadcast
 shutdown
 negotiation auto
 no cdp enable
!
interface FastEthernet6/0/0
 no ip address
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 load-interval 30
 shutdown
 no negotiation auto
 no cdp enable
 service-policy input QPI_BBONE_S_32000_V1
 service-policy output QPO_BBONE_32000_V1
!
interface FastEthernet6/0/1
 no ip address
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 load-interval 30
 shutdown
 negotiation auto
 no cdp enable
 service-policy input QPI_BBONE_S_50000_V1
 service-policy output QPO_BBONE_50000_V1
!
interface FastEthernet6/0/2
 description SWBD01.SLS | 100M | SLS/FAST/001
 bandwidth 100000
 ip address 200.249.162.222 255.255.255.224
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no negotiation auto
 no cdp enable
 no clns route-cache
 service-policy input QPI_BBONE_S_100000_V1
 service-policy output QPO_BBONE_100000_V1
!
interface FastEthernet6/0/3
 description RESERVADO PARA ADM100M | ROGERIO | 521-3113 | 26/05/2014
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 load-interval 30
 shutdown
 negotiation auto
 no cdp enable
 service-policy input QPI_BBONE_S_50000_V1
 service-policy output QPO_BBONE_50000_V1
!
interface FastEthernet6/0/4
 description RESERVADO PARA ADM100M | ROGERIO | 521-3113 | 26/05/2014
 no ip address
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 load-interval 30
 shutdown
 negotiation auto
 no cdp enable
 service-policy input QPI_BBONE_S_50000_V1
 service-policy output QPO_BBONE_50000_V1
!
interface FastEthernet6/0/5
 description RESERVADO PARA ADM100M | ROGERIO | 521-3113 | 06/02/2013
 no ip address
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 load-interval 30
 shutdown
 no negotiation auto
 no cdp enable
 service-policy input QPI_BBONE_S_34000_V1
 service-policy output QPO_BBONE_34000_V1
!
interface FastEthernet6/0/6
 no ip address
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 load-interval 30
 shutdown
 negotiation auto
 no cdp enable
!
interface FastEthernet6/0/7
 description SERPRO  | 100M | ENLACE ETH CLIENTE
 bandwidth 100000
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 load-interval 30
 negotiation auto
 no cdp enable
!
interface FastEthernet6/0/7.186
 description SERPRO  | 2048K | SLS/IP/04967 | (SLS/IP/04967) | BGP_AS65023
 bandwidth 2048
 encapsulation dot1Q 186
 ip vrf forwarding SERPRO_SLS_PGFN_01:5895
 ip address 10.192.72.161 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_SERPRO_2048K_V1
 service-policy output QDO_SERPRO_2048K_V1
!
interface FastEthernet6/0/7.359
 description SERPRO  | 20M | SLS/IP/04996 | (SLS/IP/04996)
 bandwidth 20000
 encapsulation dot1Q 359
 ip vrf forwarding SERPRO_SLS_DNIT_01:5893
 ip address 10.192.72.1 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_SERPRO_20M_V1
 service-policy output QDO_SERPRO_20M_V1
!
interface FastEthernet6/0/7.396
 description SERPRO  | 2048K | SLS/IP/04951 | (SLS/IP/04951)
 bandwidth 2048
 encapsulation dot1Q 396
 ip vrf forwarding SERPRO_SLS_DNIT_02:5923
 ip address 10.192.72.17 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_SERPRO_2048K_V1
 service-policy output QDO_SERPRO_2048K_V1
!
interface FastEthernet6/0/7.397
 description SERPRO  | 2048K | SLS/IP/04953 | (SLS/IP/04953)
 bandwidth 2048
 encapsulation dot1Q 397
 ip vrf forwarding SERPRO_SLS_DNIT_03:5896
 ip address 10.192.72.33 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_SERPRO_2048K_V1
 service-policy output QDO_SERPRO_2048K_V1
!
interface FastEthernet6/0/7.398
 description SERPRO  | 2048K | SLS/IP/04955 | (SLS/IP/04955) | BGP_AS65023
 bandwidth 2048
 encapsulation dot1Q 398
 ip vrf forwarding SERPRO_SLS_DNIT_04:5949
 ip address 10.192.72.49 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 ip pim sparse-mode
 no cdp enable
 service-policy input QDI_SERPRO_2048K_V1
 service-policy output QDO_SERPRO_2048K_V1
!
interface FastEthernet6/0/7.399
 description SERPRO  | 2048K | SLS/IP/04957 | (SLS/IP/04957)
 bandwidth 2048
 encapsulation dot1Q 399
 ip vrf forwarding SERPRO_SLS_DNIT_05:5908
 ip address 10.192.72.65 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_N_2048_V1
 service-policy output QPO_BBONE_2048_V1
!
interface FastEthernet6/0/7.400
 description SERPRO  | 2048K | SLS/IP/05963 | (SLS/IP/05963) | BGP_AS65023
 bandwidth 2048
 encapsulation dot1Q 400
 ip vrf forwarding SERPRO_SLS_DNIT_06:5894
 ip address 10.192.72.81 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_SERPRO_2048K_V1
 service-policy output QDO_SERPRO_2048K_V1
!
interface FastEthernet6/0/7.407
 description SERPRO  | 6000K | SLS/IP/04989 | (SLS/IP/04989) | BGP_AS65023
 bandwidth 6000
 encapsulation dot1Q 407
 ip vrf forwarding SERPRO_SLS_RFB_11:5911
 ip address 10.192.73.81 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 ip pim sparse-mode
 no cdp enable
 service-policy input QDI_SERPRO_6000K_V1
 service-policy output QDO_SERPRO_6000K_V1
!
interface FastEthernet6/0/7.432
 description SERPRO  | 4096K | SLS/IP/04969 | (SLS/IP/04969) | BGP_AS65023
 bandwidth 4096
 encapsulation dot1Q 432
 ip vrf forwarding SERPRO_SLS_RFB_01:5848
 ip address 10.192.72.177 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 ip pim sparse-mode
 no cdp enable
 service-policy input QDI_SERPRO_4096K_V1
 service-policy output QDO_SERPRO_4096K_V1
!
interface FastEthernet6/0/7.433
 description SERPRO  | 1024K | SLS/IP/04971 | (SLS/IP/04971)
 bandwidth 1024
 encapsulation dot1Q 433
 ip vrf forwarding SERPRO_SLS_RFB_02:5881
 ip address 10.192.72.193 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 ip pim sparse-mode
 no cdp enable
 service-policy input QDI_SERPRO_1024K_V1
 service-policy output QDO_SERPRO_1024K_V1
!
interface FastEthernet6/0/7.434
 description SERPRO  | 1024K | SLS/IP/04973 | (SLS/IP/04973) | BGP_AS65023
 bandwidth 1024
 encapsulation dot1Q 434
 ip vrf forwarding SERPRO_SLS_RFB_03:5904
 ip address 10.192.72.209 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 ip pim sparse-mode
 no cdp enable
 service-policy input QDI_SERPRO_1024K_V1
 service-policy output QDO_SERPRO_1024K_V1
!
interface FastEthernet6/0/7.435
 description SERPRO  | 1024K | SLS/IP/05140 | (SLS/IP/05140) | BGP_AS65023
 bandwidth 1024
 encapsulation dot1Q 435
 ip vrf forwarding SERPRO_SLS_RFB_12:6238
 ip address 10.192.73.129 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 ip pim sparse-mode
 no cdp enable
 service-policy input QPI_BBONE_N_1024_V1
 service-policy output QPO_BBONE_1024_V1
!
interface FastEthernet6/0/7.436
 description SERPRO  | 1024K | SLS/IP/04975 | (SLS/IP/04975) | BGP_AS65023
 bandwidth 1024
 encapsulation dot1Q 436
 ip vrf forwarding SERPRO_SLS_RFB_04:5905
 ip address 10.192.72.225 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 ip pim sparse-mode
 no cdp enable
 service-policy input QDI_SERPRO_1024K_V1
 service-policy output QDO_SERPRO_1024K_V1
!
interface FastEthernet6/0/7.437
 description SERPRO  | 1024K | SLS/IP/04979 | (SLS/IP/04979) | BGP_AS65023
 bandwidth 1024
 encapsulation dot1Q 437
 ip vrf forwarding SERPRO_SLS_RFB_06:5918
 ip address 10.192.73.1 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 ip pim sparse-mode
 no cdp enable
 service-policy input QDI_SERPRO_1024K_V1
 service-policy output QDO_SERPRO_1024K_V1
!
interface FastEthernet6/0/7.439
 description SERPRO  | 1024K | SLS/IP/04983 | (SLS/IP/04983) | BGP_AS65023
 bandwidth 1024
 encapsulation dot1Q 439
 ip vrf forwarding SERPRO_SLS_RFB_08:5907
 ip address 10.192.73.33 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 ip pim sparse-mode
 no cdp enable
 service-policy input QDI_SERPRO_1024K_V1
 service-policy output QDO_SERPRO_1024K_V1
!
interface FastEthernet6/0/7.440
 description SERPRO  | 1024K | SLS/IP/04985 | (SLS/IP/04985) | BGP_AS65023
 bandwidth 1024
 encapsulation dot1Q 440
 ip vrf forwarding SERPRO_SLS_RFB_09:5913
 ip address 10.192.73.49 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 ip pim sparse-mode
 no cdp enable
 service-policy input QDI_SERPRO_1024K_V1
 service-policy output QDO_SERPRO_1024K_V1
!
interface FastEthernet6/0/7.441
 description SERPRO  | 1024k | SLS/IP/04987 | (SLS/IP/04987) | BGP_AS65023
 bandwidth 1024
 encapsulation dot1Q 441
 ip vrf forwarding SERPRO_SLS_RFB_10:5909
 ip address 10.192.73.65 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 ip pim sparse-mode
 no cdp enable
 service-policy input QDI_SERPRO_1024K_V1
 service-policy output QDO_SERPRO_1024K_V1
!
interface FastEthernet6/0/7.442
 description SERPRO | 1024K | SLS/IP/05137 | (SLS/IP/05137) | BGP_AS65023
 bandwidth 1024
 encapsulation dot1Q 442
 ip vrf forwarding SERPRO_SLS_RFB_05:5917
 ip address 10.192.72.241 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 ip pim sparse-mode
 no cdp enable
 service-policy input QDI_SERPRO_1024K_V1
 service-policy output QDO_SERPRO_1024K_V1
!
interface FastEthernet6/0/7.612
 description SERPRO  | 512K | SLS/IP/04993 | (SLS/IP/04993)
 bandwidth 512
 encapsulation dot1Q 612
 ip vrf forwarding SERPRO_SLS_DETRAN_01:5897
 ip address 10.192.73.113 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_SERPRO_512K_V1
 service-policy output QDO_SERPRO_512K_V1
!
interface FastEthernet6/0/7.913
 description SERPRO  | 512K | SLS/IP/04991 | (SLS/IP/04991) | BGP_AS65023
 bandwidth 512
 encapsulation dot1Q 913
 ip vrf forwarding SERPRO_SLS_RIS_01:5892
 ip address 10.192.73.97 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_SERPRO_512K_V1
 service-policy output QDO_SERPRO_512K_V1
!
interface FastEthernet6/1/0
 no ip address
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 load-interval 30
 shutdown
 negotiation auto
 no cdp enable
 service-policy input QPI_BBONE_S_100000_V1
 service-policy output QPO_BBONE_100000_V1
!
interface FastEthernet6/1/1
 description RESERVADO PARA ADM100M | ROGERIO | 521-3113 | 12/03/2014
 no ip address
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 shutdown
 negotiation auto
 no cdp enable
 service-policy input QPI_BBONE_S_10000_V1
 service-policy output QPO_BBONE_10000_V1
!
interface FastEthernet6/1/2
 description CEMAR  | 10M | SLS/IP/04603 | (SLS/IP/04603)
 bandwidth 10000
 ip address 200.252.158.189 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 load-interval 30
 shutdown
 no negotiation auto
 no flowcontrol bidirectional
 no cdp enable
 service-policy input QPI_BBONE_S_10000_V1
 service-policy output QPO_BBONE_10000_V1
!
interface FastEthernet6/1/3
 no ip address
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 load-interval 30
 shutdown
 negotiation auto
 no cdp enable
 service-policy input QPI_BBONE_S_10000_V1
 service-policy output QPO_BBONE_10000_V1
!
interface FastEthernet6/1/4
 description UTE PARNAIBA  | 50M | SIL/IP/00105 | (SIL/IP/00105)
 bandwidth 50000
 ip address 200.172.11.133 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 load-interval 30
 negotiation auto
 no cdp enable
 service-policy input QPI_BBONE_S_50000_V1
 service-policy output QPO_BBONE_50000_V1
!
interface FastEthernet6/1/5
 description SWWIMAX01.SLS | 100000K | SLSUSIT/SLSUSWM/100M/002 | LIGACAO SWWIMAX01.SLS PORTA FAST0/1(OBS: O PE NAO ESTA LIGADO DIRETO NO WIMAX E SIM NUM SWITCH PARA CASAMENTO DE INTERFACE) - MIGRADO PARA O GACC03.SLS porta Gi0/0/1
 no ip address
 no ip directed-broadcast
 ip route-cache flow input
 ip route-cache flow output
 load-interval 30
 shutdown
 no negotiation auto
!
interface FastEthernet6/1/5.2
 description SUBINTERFACE DE VOIP
 encapsulation dot1Q 2
 ip vrf forwarding WIMAX_EBT:3855
 ip address 172.16.0.81 255.255.255.252
 no ip directed-broadcast
 no cdp enable
 service-policy input MARCA-WIMAX
!
interface FastEthernet6/1/5.3
 description SUBINTERFACE DE GERENCIA
 encapsulation dot1Q 3
 ip vrf forwarding NGN-GER:1416
 ip address 10.253.2.177 255.255.255.252
 no ip directed-broadcast
 no cdp enable
 service-policy input MARCA-GER
!
interface FastEthernet6/1/5.4
 description SUBINTERFACE DE DADOS
 encapsulation dot1Q 4
 ip address 200.167.148.1 255.255.255.252
 no ip directed-broadcast
 no cdp enable
 service-policy input ZERA-DSCP
!
interface FastEthernet6/1/6
 description Link VESPER | 100M | VLAN XRTTBSC2 | SLS US IT SLS US IT 100M 001
 bandwidth 100000
 ip vrf forwarding VESPER-1XRTT:3997
 ip address 10.185.9.99 255.255.255.240
 no ip directed-broadcast
 load-interval 30
 keepalive 1
 no negotiation auto
 no cdp enable
!
interface FastEthernet6/1/7
 description SERPRO  | 100M | ENLACE ETH CLIENTE
 bandwidth 100000
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 load-interval 30
 negotiation auto
 no cdp enable
!
interface FastEthernet6/1/7.359
 description SERPRO  | 20M | SLS/IP/04995 | (SLS/IP/04995)
 bandwidth 20000
 encapsulation dot1Q 359
 ip vrf forwarding SERPRO_SLS_DNIT_01:5893
 ip address 10.192.72.9 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_SERPRO_20M_V1
 service-policy output QDO_SERPRO_20M_V1
!
interface FastEthernet6/1/7.396
 description SERPRO  | 2048K | SLS/IP/04952 | (SLS/IP/04952)
 bandwidth 2048
 encapsulation dot1Q 396
 ip vrf forwarding SERPRO_SLS_DNIT_02:5923
 ip address 10.192.72.25 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_SERPRO_2048K_V1
 service-policy output QDO_SERPRO_2048K_V1
!
interface FastEthernet6/1/7.397
 description SERPRO  | 2048K | SLS/IP/04954 | (SLS/IP/04954)
 bandwidth 2048
 encapsulation dot1Q 397
 ip vrf forwarding SERPRO_SLS_DNIT_03:5896
 ip address 10.192.72.41 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_SERPRO_2048K_V1
 service-policy output QDO_SERPRO_2048K_V1
!
interface FastEthernet6/1/7.398
 description SERPRO  | 2048K | SLS/IP/04956 | (SLS/IP/04956) | BGP_AS65023
 bandwidth 2048
 encapsulation dot1Q 398
 ip vrf forwarding SERPRO_SLS_DNIT_04:5949
 ip address 10.192.72.57 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 ip pim sparse-mode
 no cdp enable
 service-policy input QDI_SERPRO_2048K_V1
 service-policy output QDO_SERPRO_2048K_V1
!
interface FastEthernet6/1/7.399
 description SERPRO  | 2048K | SLS/IP/04958 | (SLS/IP/04958)
 bandwidth 2048
 encapsulation dot1Q 399
 ip vrf forwarding SERPRO_SLS_DNIT_05:5908
 ip address 10.192.72.73 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_SERPRO_2048K_V1
 service-policy output QDO_SERPRO_2048K_V1
!
interface FastEthernet6/1/7.400
 description SERPRO  | 2048K | SLS/IP/05964 | (SLS/IP/05964) | BGP_AS65023
 bandwidth 2048
 encapsulation dot1Q 400
 ip vrf forwarding SERPRO_SLS_DNIT_06:5894
 ip address 10.192.72.89 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_SERPRO_2048K_V1
 service-policy output QDO_SERPRO_2048K_V1
!
interface FastEthernet6/1/7.407
 description SERPRO  | 6000K | SLS/IP/04990 | (SLS/IP/04990) | BGP_AS65023
 bandwidth 6000
 encapsulation dot1Q 407
 ip vrf forwarding SERPRO_SLS_RFB_11:5911
 ip address 10.192.73.89 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 ip pim sparse-mode
 no cdp enable
 service-policy input QDI_SERPRO_6000K_V1
 service-policy output QDO_SERPRO_6000K_V1
!
interface FastEthernet6/1/7.432
 description SERPRO  | 4096K | SLS/IP/04970 | (SLS/IP/04970) | BGP_AS65023
 bandwidth 4096
 encapsulation dot1Q 432
 ip vrf forwarding SERPRO_SLS_RFB_01:5848
 ip address 10.192.72.185 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 ip pim sparse-mode
 no cdp enable
 service-policy input QDI_SERPRO_4096K_V1
 service-policy output QDO_SERPRO_4096K_V1
!
interface FastEthernet6/1/7.433
 description SERPRO  | 1024K | SLS/IP/04972 | (SLS/IP/04972)
 bandwidth 1024
 encapsulation dot1Q 433
 ip vrf forwarding SERPRO_SLS_RFB_02:5881
 ip address 10.192.72.201 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 ip pim sparse-mode
 no cdp enable
 service-policy input QDI_SERPRO_1024K_V1
 service-policy output QDO_SERPRO_1024K_V1
!
interface FastEthernet6/1/7.434
 description SERPRO  | 512K | SLS/IP/04974 | (SLS/IP/04974) | BGP_AS65023
 bandwidth 1024
 encapsulation dot1Q 434
 ip vrf forwarding SERPRO_SLS_RFB_03:5904
 ip address 10.192.72.217 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 ip pim sparse-mode
 no cdp enable
 service-policy input QPI_BBONE_N_512_V1
 service-policy output QPO_BBONE_512_V1
!
interface FastEthernet6/1/7.435
 description SERPRO  | 1024K | SLS/IP/05141 | (SLS/IP/05141) | BGP_AS65023
 bandwidth 1024
 encapsulation dot1Q 435
 ip vrf forwarding SERPRO_SLS_RFB_12:6238
 ip address 10.192.73.137 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 ip pim sparse-mode
 no cdp enable
 service-policy input QPI_BBONE_N_1024_V1
 service-policy output QPO_BBONE_1024_V1
!
interface FastEthernet6/1/7.436
 description SERPRO  | 1024K | SLS/IP/04976 | (SLS/IP/04976) | BGP_AS65023
 bandwidth 1024
 encapsulation dot1Q 436
 ip vrf forwarding SERPRO_SLS_RFB_04:5905
 ip address 10.192.72.233 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 ip pim sparse-mode
 no cdp enable
 service-policy input QDI_SERPRO_1024K_V1
 service-policy output QDO_SERPRO_1024K_V1
!
interface FastEthernet6/1/7.437
 description SERPRO  | 1024K | SLS/IP/04980 | (SLS/IP/04980) | BGP_AS65023
 bandwidth 1024
 encapsulation dot1Q 437
 ip vrf forwarding SERPRO_SLS_RFB_06:5918
 ip address 10.192.73.9 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 ip pim sparse-mode
 no cdp enable
 service-policy input QDI_SERPRO_1024K_V1
 service-policy output QDO_SERPRO_1024K_V1
!
interface FastEthernet6/1/7.439
 description SERPRO  | 1024K | SLS/IP/04984 | (SLS/IP/04984) | BGP_AS65023
 bandwidth 1024
 encapsulation dot1Q 439
 ip vrf forwarding SERPRO_SLS_RFB_08:5907
 ip address 10.192.73.41 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 ip pim sparse-mode
 no cdp enable
 service-policy input QDI_SERPRO_1024K_V1
 service-policy output QDO_SERPRO_1024K_V1
!
interface FastEthernet6/1/7.440
 description SERPRO  | 1024K | SLS/IP/04986 | (SLS/IP/04986) | BGP_AS65023
 bandwidth 1024
 encapsulation dot1Q 440
 ip vrf forwarding SERPRO_SLS_RFB_09:5913
 ip address 10.192.73.57 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 ip pim sparse-mode
 no cdp enable
 service-policy input QDI_SERPRO_1024K_V1
 service-policy output QDO_SERPRO_1024K_V1
!
interface FastEthernet6/1/7.441
 description SERPRO  | 1024k | SLS/IP/04988 | (SLS/IP/04988) | BGP_AS65023
 bandwidth 1024
 encapsulation dot1Q 441
 ip vrf forwarding SERPRO_SLS_RFB_10:5909
 ip address 10.192.73.73 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 ip pim sparse-mode
 no cdp enable
 service-policy input QDI_SERPRO_1024K_V1
 service-policy output QDO_SERPRO_1024K_V1
!
interface FastEthernet6/1/7.442
 description SERPRO | 1024K | SLS/IP/05138 | (SLS/IP/05138) | BGP_AS65023 
 bandwidth 1024
 encapsulation dot1Q 442
 ip vrf forwarding SERPRO_SLS_RFB_05:5917
 ip address 10.192.72.249 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 ip pim sparse-mode
 no cdp enable
 service-policy input QDI_SERPRO_1024K_V1
 service-policy output QDO_SERPRO_1024K_V1
!
interface FastEthernet6/1/7.612
 description SERPRO  | 512K | SLS/IP/04994 | (SLS/IP/04994)
 bandwidth 512
 encapsulation dot1Q 612
 ip vrf forwarding SERPRO_SLS_DETRAN_01:5897
 ip address 10.192.73.121 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_SERPRO_512K_V1
 service-policy output QDO_SERPRO_512K_V1
!
interface FastEthernet6/1/7.913
 description SERPRO  | 512K | SLS/IP/04992 | (SLS/IP/04992) | BGP_AS65023
 bandwidth 512
 encapsulation dot1Q 913
 ip vrf forwarding SERPRO_SLS_RIS_01:5892
 ip address 10.192.73.105 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_SERPRO_512K_V1
 service-policy output QDO_SERPRO_512K_V1
!
interface Serial6/2/0.1/1/1/1:1
 dampening 30 50 1100 200
 description POUPEX  | 1024K | SLS/IP/00341 | (SLS/IP/00341)
 bandwidth 1024
 ip vrf forwarding POUPEX:1946
 ip address 201.73.255.217 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 ip ospf authentication message-digest
 ip ospf message-digest-key 1 md5 7 1427415B1B1172781030
 load-interval 30
 no cdp enable
 service-policy input QPI_A_1024K_21_N_0_15_35_8_2_1
 service-policy output QPO_A_1024K_21_0_15_35_8_2_1
!
interface Serial6/2/0.1/1/1/3:0
 dampening 30 50 1100 200
 description BNB  | 1024K | PDZ/IP/00134 | (PDZ/IP/00134) | BGP_AS65000
 bandwidth 1024
 ip vrf forwarding BNB:5075
 ip address 187.29.255.97 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 no cdp enable
 service-policy input QPI_A_1024K_22_N_0_36_22_0_2_17
 service-policy output QPO_A_1024K_22_0_36_22_0_2_17
!
interface Serial6/2/0.1/1/2/1:0
 dampening 30 50 1100 200
 description MAXPAR  | 2048K | ENLACE FR CLIENTE 
 bandwidth 2048
 no ip address
 no ip directed-broadcast
 encapsulation frame-relay IETF
 no ip mroute-cache
 load-interval 30
 frame-relay lmi-type ansi
!
interface Serial6/2/0.1/1/2/1:0.1 point-to-point
 description MAXPAR  | 2048K | SLS/IP/05343 | (SLS/IP/05343) | BGP_AS64856
 bandwidth 2048
 ip vrf forwarding MAXPAR:3450
 ip address 189.52.211.1 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no ip mroute-cache
 no cdp enable
 frame-relay interface-dlci 100 IETF   
  class QC_AF_2048K_13_N_13_13_11_0_4_45_0B
!
interface Serial6/2/0.1/1/2/2:0
 dampening 30 50 1100 200
 description AUTOVIARIA_MATOS  | 2048K | SLS/IP/05953 | (SLS/IP/05953)
 bandwidth 2048
 ip address 187.29.255.209 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 no cdp enable
 service-policy input QPI_BBONE_DSCP_V1
!
interface Serial6/2/0.1/1/3/1:0
 dampening 30 50 1100 200
 description CNI  | 2048K | SLS/IP/06154 | (SLS/IP/06154) | BGP_AS65000
 bandwidth 2048
 ip vrf forwarding CNI:7529
 ip address 189.52.211.45 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 no cdp enable
 service-policy input QPI_A_2048K_0_N_49_0_0_0_1_45
 service-policy output QPO_A_2048K_0_49_0_0_0_1_45
!
interface Serial6/2/0.1/1/3/3:0
 dampening 30 50 1100 200
 description BANCOTRIANGULO  | 2048K | SLS/IP/06167 | (SLS/IP/06167)
 bandwidth 2048
 ip address 189.52.211.157 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 no cdp enable
 service-policy input QPI_BBONE_DSCP_V1
!
interface Serial6/2/0.1/1/4/2:0
 dampening 30 50 1100 200
 description BRASPRESS  | 2048K | SLS/IP/02957 | (SLS/IP/02957) | BLK-SAIP-APEDIDO/2018037-1622/POR-RPA01
 bandwidth 2048
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 shutdown
 no peer neighbor-route
 no cdp enable
 ppp chap hostname MULTILINK_291060
 ppp multilink
 multilink-group 291060
!
interface Serial6/2/0.1/1/4/3:3
 dampening 30 50 1100 200
 description IMIFARMA  | 512K | SLS/IP/05688 | (SLS/IP/05688)
 bandwidth 512
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 ppp chap hostname MULTILINK_291044
 ppp multilink
 multilink-group 291044
!
interface Serial6/2/0.1/1/5/2:1
 description IMIFARMA  | 512K | SLS/IP/05676 | (SLS/IP/05676)
 bandwidth 512
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 ppp chap hostname MULTILINK_291064
 ppp multilink
 multilink-group 291064
!
interface Serial6/2/0.1/1/5/2:2
 dampening 30 50 1100 200
 description SERPRO  | 512K | SLS/IP/04931 | (SLS/IP/04931)
 bandwidth 512
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 ppp chap hostname MULTILINK_291022
 ppp multilink
 multilink-group 291022
!
interface Serial6/2/0.1/1/6/1:0
 dampening 30 50 1100 200
 description SHERWIN  | 2048K | SLS/IP/00752 | (SLS/IP/00752)
 bandwidth 2048
 ip address 189.53.11.9 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 no cdp enable
 service-policy input QPI_BBONE_DSCP_V1
!
interface Serial6/2/0.1/1/6/2:2
 dampening 30 50 1100 200
 description CEARA DISTRIB  | 960K | ACD/IP/00198 | (ACD/IP/00198)
 bandwidth 960
 ip address 189.52.211.57 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 no cdp enable
 service-policy input ZERA-DSCP
!
interface Serial6/2/0.1/1/7/3:1
 dampening 30 50 1100 200
 description PARENTE  | 960K | SLS/IP/06081 | (SLS/IP/06081)
 bandwidth 960
 ip address 189.52.211.137 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 no cdp enable
 service-policy input QPI_BBONE_DSCP_V1
!
interface Serial6/2/0.1/2/2/1:1
 dampening 30 50 1100 200
 description RIBAMAR  | 960K | ITZ/IP/00141 | (ITZ/IP/00141)
 bandwidth 960
 ip address 189.53.11.61 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 no cdp enable
 service-policy input ZERA-DSCP
!
interface Serial6/2/0.1/2/2/1:2
 dampening 30 50 1100 200
 description LA TOUCHE  | 960K | SLS/IP/03740 | (SLS/IP/03740)
 bandwidth 960
 ip address 200.252.158.253 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 no cdp enable
 service-policy input QPI_BBONE_DSCP_V1
!
interface Serial6/2/0.1/2/2/2:1
 dampening 30 50 1100 200
 description MACIEL  | 960K | SLS/IP/00832 | (SLS/IP/00832)
 bandwidth 960
 ip address 189.53.11.97 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 no cdp enable
 service-policy input ZERA-DSCP
!
interface Serial6/2/0.1/2/3/2:0
 dampening 30 50 1100 200
 description LASA_NOVA  | 1024K | ENLACE FR CLIENTE 
 bandwidth 1024
 no ip address
 no ip directed-broadcast
 encapsulation frame-relay IETF
 no ip mroute-cache
 frame-relay lmi-type cisco
!
interface Serial6/2/0.1/2/3/2:0.1 point-to-point
 description LASA_NOVA  | 1024K | CHI/IP/00126 | (CHI/IP/00126) | BGP_AS65316
 bandwidth 1024
 ip vrf forwarding LASA_NOVA:6236
 ip address 189.52.211.213 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no ip mroute-cache
 no cdp enable
 frame-relay interface-dlci 100 IETF   
  class QC_AF_1024K_25_N_0_40_0_0_2_32_0B
!
interface Serial6/2/0.1/2/4/1:0
 dampening 30 50 1100 200
 description IBAMA  | 2048K | SLS/IP/04825 | (SLS/IP/04825)
 bandwidth 2048
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 shutdown
 no peer neighbor-route
 ppp chap hostname MULTILINK_28929
 ppp multilink
 multilink-group 28929
!
interface Serial6/2/0.1/2/6/3:1
 dampening 30 50 1100 200
 description UCICINEMAS  | 512K | ENLACE FR CLIENTE 
 bandwidth 512
 no ip address
 no ip directed-broadcast
 encapsulation frame-relay IETF
 no ip mroute-cache
 load-interval 30
 frame-relay lmi-type cisco
!
interface Serial6/2/0.1/2/6/3:1.1 point-to-point
 description UCICINEMAS  | 512K | SLS/IP/05280 | (SLS/IP/05280)
 bandwidth 512
 ip vrf forwarding CINEMAS:1063
 ip address 189.53.11.85 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no ip mroute-cache
 no cdp enable
 frame-relay interface-dlci 100 IETF   
  class QC_BBONE_EXP_V1
!
interface Serial6/2/0.1/2/6/3:3
 dampening 30 50 1100 200
 description IMIFARMA | 512K | SLS/IP/05769 | (SLS/IP/05769)
 bandwidth 512
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 ppp chap hostname MULTILINK_291042
 ppp multilink
 multilink-group 291042
!
interface Serial6/2/0.1/3/1/1:0
 dampening 30 50 1100 200
 description TOKIO MARINE  | 2048K | SLS/IP/06143 | (SLS/IP/06143)
 bandwidth 2048
 ip address 189.53.11.121 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 no cdp enable
 service-policy input QPI_BBONE_DSCP_V1
!
interface Serial6/2/0.1/3/1/2:0
 dampening 30 50 1100 200
 description REFRIMA  | 2048K | SLS/IP/02882 | (SLS/IP/02882)
 bandwidth 2048
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 ppp chap hostname MULTILINK_28271
 ppp multilink
 multilink-group 28271
!
interface Serial6/2/0.1/3/2/1:0
 dampening 30 50 1100 200
 description BNB  | 2048K | SLS/IP/05487 | (SLS/IP/05487) | BGP_AS65000
 bandwidth 2048
 ip vrf forwarding BNB:5075
 ip address 189.53.11.161 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 no cdp enable
 service-policy input QPI_A_2048K_21_N_0_35_20_0_2_21
 service-policy output QPO_A_2048K_21_0_35_20_0_2_21
!
interface Serial6/2/0.1/3/3/2:0
 dampening 30 50 1100 200
 description REDE_CORREIOS  | 2048K | SLS/IP/06036 | (SLS/IP/06036) | BGP_AS65001
 bandwidth 2048
 ip vrf forwarding CORREIOS_2016:155714
 ip address 172.18.75.109 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 no cdp enable
 service-policy input QPI_Correios_2048K_PPP_IOS_D_V1
 service-policy output QPO_Correios_2048K_PPP_IOS_D_V1
!
interface Serial6/2/0.1/3/3/3:0
 description PAGUEMENOS  | 256K | SLS/IP/00732 | (SLS/IP/00732)
 bandwidth 256
 no ip address
 no ip directed-broadcast
 encapsulation ppp
 no peer neighbor-route
 no cdp enable
 ppp chap hostname MULTILINK_28893
 ppp multilink
 multilink-group 28893
!
interface Serial6/2/0.1/3/4/1:0
 dampening 30 50 1100 200
 description SERPRO  | 2048K | BJU/IP/00102 | (BJU/IP/00102)
 bandwidth 2048
 ip vrf forwarding SERPRO_SLS_DNIT_02:5923
 ip address 10.218.14.249 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 no cdp enable
 service-policy input QPI_SERPRO_2048K_V1
 service-policy output QPO_SERPRO_2048K_V1
!
interface Serial6/2/0.1/3/6/2:0
 dampening 30 50 1100 200
 description MDIASBRANCO  | 1024K | SLS/IP/00146 | (SLS/IP/00146)
 bandwidth 1024
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 ppp chap hostname MULTILINK_28281
 ppp multilink
 multilink-group 28281
!
interface Serial6/2/0.1/3/7/2:0
 dampening 30 50 1100 200
 description LASA_SEDE  | 2048K | ENLACE FR CLIENTE 
 bandwidth 2048
 no ip address
 no ip directed-broadcast
 encapsulation frame-relay IETF
 no ip mroute-cache
 load-interval 30
 frame-relay lmi-type cisco
!
interface Serial6/2/0.1/3/7/2:0.1 point-to-point
 description LASA_SEDE  | 2048K | SLS/IP/00668 | (SLS/IP/00668) | BGP_AS65316
 bandwidth 2048
 ip vrf forwarding LASA_NOVA:6236
 ip address 200.249.171.93 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no ip mroute-cache
 no cdp enable
 frame-relay interface-dlci 100 IETF   
  class QC_AF_2048K_13_N_23_38_0_0_1_24_0B
!
interface Serial6/3/0.1/1/1/1:0
 dampening 30 50 1100 200
 description SIVNET  | 2048K | SIS/IP/00034 | (SIS/IP/00034)
 bandwidth 2048
 ip address 189.52.211.185 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 shutdown
 no peer neighbor-route
 no cdp enable
 service-policy input ZERA-DSCP
!
interface Serial6/3/0.1/1/1/2:0
 dampening 30 50 1100 200
 description SIVNET  | 2048K | SIS/IP/00035 | (SIS/IP/00035)
 bandwidth 2048
 ip address 189.52.211.189 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 shutdown
 no cdp enable
 service-policy input ZERA-DSCP
!
interface Serial6/3/0.1/1/1/3:0
 dampening 30 50 1100 200
 description SIVNET  | 2048K | SIS/IP/00003 | (SIS/IP/00003)
 bandwidth 2048
 ip address 200.249.174.21 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 shutdown
 no cdp enable
 service-policy input ZERA-DSCP
!
interface Serial6/3/0.1/1/2/3:0
 dampening 30 50 1100 200
 description SIVNET  | 2048K | SIS/IP/00027 | (SIS/IP/00027)
 bandwidth 2048
 ip address 200.253.132.189 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 shutdown
 no cdp enable
 service-policy input ZERA-DSCP
!
interface Serial6/3/0.1/1/3/1:0
 dampening 30 50 1100 200
 description SIVNET  | 2048K | SIS/IP/00018 | (SIS/IP/00018)
 bandwidth 2048
 ip address 201.73.255.105 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 shutdown
 no peer neighbor-route
 no cdp enable
 service-policy input ZERA-DSCP
!
interface Serial6/3/0.1/1/3/2:0
 dampening 30 50 1100 200
 description SEBRAEMA  | 2048K | ACD/IP/00038 | (ACD/IP/00038) | BGP_AS64617
 bandwidth 2048
 ip vrf forwarding SEBRAEMA:4302
 ip address 189.53.246.85 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 no cdp enable
 service-policy input QPI_A_2048K_6_N_0_1_0_0_2_90
 service-policy output QPO_A_2048K_6_0_1_0_0_2_90
!
interface Serial6/3/0.1/1/3/3:0
 dampening 30 50 1100 200
 description EXPRESSORODOVIARIO  | 2048K | SLS/IP/04585 | (SLS/IP/04585)
 bandwidth 2048
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 ppp chap hostname MULTILINK_29016
 ppp multilink
 multilink-group 29016
!
interface Serial6/3/0.1/1/4/2:0
 dampening 30 50 1100 200
 description CARGLASS  | 2048K | SLS/IP/06152 | (SLS/IP/06152) | BGP_AS65000
 bandwidth 2048
 ip vrf forwarding CARGLASS:7528
 ip address 189.53.11.133 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 no cdp enable
 service-policy input QPI_A_2048K_5_N_0_0_0_0_2_92
 service-policy output QPO_A_2048K_5_0_0_0_0_2_92
!
interface Serial6/3/0.1/1/5/3:0
 dampening 30 50 1100 200
 description RI HAPPY  | 1024K | SLS/IP/05709 | (SLS/IP/05709) | BGP_AS65443
 bandwidth 1024
 ip vrf forwarding RIHAPPY:4005
 ip address 200.179.211.85 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 no cdp enable
 service-policy input QPI_A_1024K_13_N_0_25_25_3_2_31
 service-policy output QPO_A_1024K_13_0_25_25_3_2_31
!
interface Serial6/3/0.1/1/6/1:0
 description GERDAU_INT  | 2048K | ITZ/IP/00237 | (ITZ/IP/00237)
 bandwidth 2048
 ip vrf forwarding GERDAU_INT:151563
 ip address 10.242.25.1 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 no cdp enable
 service-policy input QPI_A_2048K_8_N_0_50_16_0_2_12
 service-policy output QPO_A_2048K_8_0_50_16_0_2_12
!
interface Serial6/3/0.1/2/1/3:0
 dampening 30 50 1100 200
 description FUNASA  | 2048K | ENLACE FR CLIENTE 
 bandwidth 2048
 no ip address
 no ip directed-broadcast
 encapsulation frame-relay IETF
 no ip mroute-cache
 frame-relay lmi-type cisco
!
interface Serial6/3/0.1/2/1/3:0.1 point-to-point
 description FUNASA  | 2048K | SLS/IP/05019 | (SLS/IP/05019)
 bandwidth 2048
 ip vrf forwarding FUNASA:3094
 ip address 189.16.250.33 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no ip mroute-cache
 no cdp enable
 frame-relay interface-dlci 100 IETF   
  class QC_BBONE_EXP_V1
!
interface Serial6/3/0.1/2/2/2:1
 description LINX_TELECOMUNICACOES  | 512K | CDO/IP/00171 | (CDO/IP/00171) | BGP_AS65000
 bandwidth 512
 ip vrf forwarding TECELAGEMAV:2642
 ip address 189.53.11.93 255.255.255.252
 no ip directed-broadcast
 encapsulation ppp
 no peer neighbor-route
 no cdp enable
 service-policy input QPI_BBONE_EXP_V1
!
interface Serial6/3/0.1/2/2/2:2
 description CREDISHOP  | 256K | PHE/IP/00046 | (PHE/IP/00046)
 bandwidth 256
 no ip address
 no ip directed-broadcast
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 ppp chap hostname MULTILINK_28282
 ppp multilink
 multilink-group 28282
!
interface Serial6/3/0.1/2/2/2:3
 description DALCAR  | 512K | SIS/IP/00154 | (SIS/IP/00154)
 bandwidth 512
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 ppp chap hostname MULTILINK_28899
 ppp multilink
 multilink-group 28899
!
interface Serial6/3/0.1/2/2/2:4
 dampening 30 50 1100 200
 description SEBRAEMA  | 512K | CHI/IP/00018 | (CHI/IP/00018)
 bandwidth 512
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 ppp chap hostname MULTILINK_1999
 ppp multilink
 multilink-group 1999
!
interface Serial6/3/0.1/2/4/2:0
 description BONO TRANSPORTES  | 2048K | SJE/IP/00175 | (SJE/IP/00175)
 bandwidth 2048
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 ppp chap hostname MULTILINK_291063
 ppp multilink
 multilink-group 291063
!
interface Serial6/3/0.1/2/4/3:0
 description BONO TRANSPORTES  | 2048K | SJE/IP/00148 | (SJE/IP/00148)
 bandwidth 2048
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 ppp chap hostname MULTILINK_291063
 ppp multilink
 multilink-group 291063
!
interface Serial6/3/0.1/2/5/1:0
 description LINX_TELECOMUNICACOES  | 2048K | SLS/IP/06183 | (SLS/IP/06183)
 bandwidth 2048
 ip vrf forwarding TENDTUDO:1965
 ip address 187.29.255.233 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 no cdp enable
 service-policy input QPI_A_2048K_4_N_0_50_0_0_2_43
 service-policy output QPO_A_2048K_4_0_50_0_0_2_43
!
interface Serial6/3/0.1/2/6/3:1
 description IGREJAUNIVERSAL  | 512K | PHE/IP/00156 | (PHE/IP/00156)
 bandwidth 512
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 ppp chap hostname MULTILINK_28904
 ppp multilink
 multilink-group 28904
!
interface Serial6/3/0.1/2/6/3:2
 dampening 30 50 1100 200
 description BBRASIL  | 64K | ENLACE FR CLIENTE 
 bandwidth 64
 no ip address
 no ip directed-broadcast
 encapsulation frame-relay IETF
 no ip mroute-cache
 load-interval 30
 frame-relay lmi-type cisco
!
interface Serial6/3/0.1/2/6/3:2.1 point-to-point
 description BBRASIL_PAE  | 64K | CHI/IP/00123 | (CHI/IP/00123) | BGP_AS65524
 bandwidth 64
 ip vrf forwarding BBRASIL_PAE:7041
 ip address 10.251.49.37 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no ip mroute-cache
 no cdp enable
 frame-relay interface-dlci 100 CISCO   
  class QC_64K_BBrasil_PAE_IOS_V1
!
interface Serial6/3/0.1/2/6/3:3
 description IMIFARMA  | 512K | SLS/IP/05661 | (SLS/IP/05661)
 bandwidth 512
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 ppp chap hostname MULTILINK_291038
 ppp multilink
 multilink-group 291038
!
interface Serial6/3/0.1/2/7/1:1
 description IURD  | 512K | ENLACE FR CLIENTE 
 bandwidth 512
 no ip address
 no ip directed-broadcast
 encapsulation frame-relay IETF
 frame-relay lmi-type cisco
!
interface Serial6/3/0.1/2/7/1:1.1 point-to-point
 description IURD  | 512K | ITZ/IP/00186 | (ITZ/IP/00186) | BGP_AS64662
 bandwidth 512
 ip vrf forwarding IURD:1265
 ip address 189.52.211.193 255.255.255.252
 no ip directed-broadcast
 no ip mroute-cache
 no cdp enable
 frame-relay interface-dlci 100 CISCO   
  class QOS_CLASS_512K_60K_60K_400K_512B
!
interface Serial6/3/0.1/2/7/1:2
 description CBE  | 512K | ITZ/IP/00204 | (ITZ/IP/00204) | BLK-SAIP-INADIMP/20180227-50/POR-RPA01
 bandwidth 512
 no ip address
 no ip directed-broadcast
 encapsulation ppp
 shutdown
 no peer neighbor-route
 no cdp enable
 ppp chap hostname MULTILINK_29032
 ppp multilink
 multilink-group 29032
!
interface Serial6/3/0.1/2/7/1:3
 description SBF  | 256K | ITZ/IP/01191 | (ITZ/IP/01191)
 bandwidth 256
 no ip address
 no ip directed-broadcast
 encapsulation ppp
 no peer neighbor-route
 ppp chap hostname MULTILINK_29008
 ppp multilink
 multilink-group 29008
!
interface Serial6/3/0.1/2/7/1:7
 description SUPERMMACIEL  | 512K | SLS/IP/05798 | (SLS/IP/05798)
 bandwidth 512
 no ip address
 no ip directed-broadcast
 encapsulation ppp
 no peer neighbor-route
 ppp chap hostname MULTILINK_291048
 ppp multilink
 multilink-group 291048
!
interface Serial6/3/0.1/3/5/2:0
 dampening 30 50 1100 200
 description EXPRESSORODOVIARIO  | 2048K | SLS/IP/05261 | (SLS/IP/05261)
 bandwidth 2048
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 ppp chap hostname MULTILINK_29016
 ppp multilink
 multilink-group 29016
!
interface Serial6/3/0.1/3/6/3:0
 dampening 30 50 1100 200
 description NEGRAO  | 2048K | SLS/IP/00827 | (SLS/IP/00827) | BGP_AS65000
 bandwidth 2048
 ip vrf forwarding NEGRAO:1481
 ip address 189.53.11.137 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 no cdp enable
 service-policy input QPI_A_2048K_24_N_0_41_0_0_2_32
 service-policy output QPO_A_2048K_24_0_41_0_0_2_32
!
interface Serial6/3/0.1/3/7/1:0
 dampening 30 50 1100 200
 description DCTIM  | 2048K | SLS/IP/02452 | (SLS/IP/02452) | BGP_AS64634
 bandwidth 2048
 ip vrf forwarding DCTIM:4283
 ip address 200.252.158.33 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 no cdp enable
 service-policy input QPI_A_2048K_6_N_0_59_0_0_1_33
 service-policy output QPO_A_2048K_6_0_59_0_0_1_33
!
interface Serial6/3/0.1/3/7/2:0
 dampening 30 50 1100 200
 description DCTIM  | 2048K | SLS/IP/02453 | (SLS/IP/02453) | BGP_AS64634
 bandwidth 2048
 ip vrf forwarding DCTIM:4283
 ip address 200.252.158.85 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 no cdp enable
 service-policy input QPI_2048K_6_N_0_78_0_0_1_12
 service-policy output QPO_2048K_6_0_78_0_0_1_12
!
interface Serial7/1/0.1/1/2/1:0
 dampening 30 50 1100 200
 description CREFISA  | 512K | ITI/IP/00129 | (ITI/IP/00129) | BGP_AS65000
 bandwidth 512
 ip vrf forwarding CREFISA:5415
 ip address 189.53.11.13 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 no cdp enable
 service-policy input QPI_A_512K_50_N_0_10_0_0_4_35
 service-policy output QPO_A_512K_50_0_10_0_0_4_35
!
interface Serial7/1/0.1/1/2/2:0
 dampening 30 50 1100 200
 description SESC  | 2048K | ITI/IP/00123 | (ITI/IP/00123) | BGP_AS65000
 bandwidth 2048
 ip vrf forwarding SESC:1916
 ip address 187.29.255.157 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 ip pim sparse-mode
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 no cdp enable
 service-policy input QOS_POLICY_IN_A_5P_0P
 service-policy output QOS_POLICY_OUT_A_5P_0P
!
interface Serial7/1/0.1/1/3/1:0
 dampening 30 50 1100 200
 description PROV CREA-MA  | 2048K | SLS/IP/01800 | (SLS/IP/01800)
 bandwidth 2048
 ip address 200.249.175.41 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 load-interval 30
 no cdp enable
 service-policy input ZERA-DSCP
!
interface Serial7/1/0.1/1/6/1:0
 dampening 30 50 1100 200
 description SEBRAEMA  | 2048K | SLS/IP/01837 | (SLS/IP/01837)
 bandwidth 2048
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 no cdp enable
 ppp chap hostname MULTILINK_94
 ppp multilink
 multilink-group 94
!
interface Serial7/1/0.1/1/6/2:0
 dampening 30 50 1100 200
 description SEBRAEMA  | 2048K | SLS/IP/01838 | (SLS/IP/01838)
 bandwidth 2048
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 no cdp enable
 ppp chap hostname MULTILINK_94
 ppp multilink
 multilink-group 94
!
interface Serial7/1/0.1/1/6/3:0
 dampening 30 50 1100 200
 description SEBRAEMA  | 2048K | SLS/IP/01839 | (SLS/IP/01839)
 bandwidth 2048
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 no cdp enable
 ppp chap hostname MULTILINK_94
 ppp multilink
 multilink-group 94
!
interface Serial7/1/0.1/1/7/1:0
 dampening 30 50 1100 200
 description SEBRAEMA  | 2048K | SLS/IP/01840 | (SLS/IP/01840)
 bandwidth 2048
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 no cdp enable
 ppp chap hostname MULTILINK_94
 ppp multilink
 multilink-group 94
!
interface Serial7/1/0.1/1/7/2:0
 dampening 30 50 1100 200
 description SEBRAEMA  | 2048K | SLS/IP/01841 | (SLS/IP/01841)
 bandwidth 2048
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 no cdp enable
 ppp chap hostname MULTILINK_94
 ppp multilink
 multilink-group 94
!
interface Serial7/1/0.1/2/1/3:0
 dampening 30 50 1100 200
 description ANVS  | 2048K | SLS/IP/01795 | (SLS/IP/01795) | BGP_AS65001
 bandwidth 2048
 ip vrf forwarding ANVISA:4356
 ip address 189.53.246.113 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 no cdp enable
 service-policy input QPI_A_2048K_4_N_0_0_0_39_2_54
 service-policy output QPO_A_2048K_4_0_0_0_39_2_54
!
interface Serial7/1/0.1/2/3/1:1
 dampening 30 50 1100 200
 description DCTIM  | 512K | ITZ/IP/00477 | (ITZ/IP/00477)
 bandwidth 512
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 ppp chap hostname MULTILINK_169
 ppp multilink
 multilink-group 169
!
interface Serial7/1/0.1/2/5/3:0
 dampening 30 50 1100 200
 description BOMPRECO  | 1024K | SLS/IP/00527 | (SLS/IP/00527)
 bandwidth 1024
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 ppp chap hostname MULTILINK_291021
 ppp multilink
 multilink-group 291021
!
interface Serial7/1/0.1/2/6/3:0
 dampening 30 50 1100 200
 description BPV PROMOTORA DE VENDAS  | 960K | SLS/IP/01432 | (SLS/IP/01432)
 bandwidth 960
 ip address 189.53.246.133 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 no cdp enable
 service-policy input ZERA-DSCP
!
interface Serial7/1/0.1/2/6/3:1
 dampening 30 50 1100 200
 description RIO ANIL SHOPPING  | 960K | SLS/IP/03766 | (SLS/IP/03766)
 bandwidth 960
 ip address 189.53.246.173 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 no cdp enable
 service-policy input QPI_BBONE_DSCP_V1
!
interface Serial7/1/0.1/3/3/1:0
 dampening 30 50 1100 200
 description BNB  | 1024K | ITI/IP/00125 | (ITI/IP/00125) | BGP_AS65000
 bandwidth 1024
 ip vrf forwarding BNB:5075
 ip address 189.53.11.17 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 no cdp enable
 service-policy input QPI_A_1024K_21_N_13_36_21_0_2_6
 service-policy output QPO_A_1024K_21_13_36_21_0_2_6
!
interface Serial7/1/0.1/3/5/1:0
 dampening 30 50 1100 200
 description SERPRO  | 2048K | SLS/IP/04938 | (SLS/IP/04938)
 bandwidth 2048
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 no cdp enable
 ppp chap hostname MULTILINK_291053
 ppp multilink
 multilink-group 291053
!
interface Serial7/1/0.1/3/6/2:0
 description EMSERH  | 256K | SLS/IP/06264 | (SLS/IP/06264)
 bandwidth 256
 ip vrf forwarding EMSERH:7743
 ip address 200.252.158.17 255.255.255.252
 no ip directed-broadcast
 encapsulation ppp
 no peer neighbor-route
 no cdp enable
 service-policy input QPI_BBONE_EXP_V1
!
interface Serial7/1/0.1/3/6/2:1
 description BBRASIL_PAE  | 64K | ENLACE FR CLIENTE 
 bandwidth 64
 no ip address
 no ip directed-broadcast
 encapsulation frame-relay IETF
 frame-relay lmi-type cisco
!
interface Serial7/1/0.1/3/6/2:1.1 point-to-point
 description BBRASIL_PAE  | 64K | SLS/IP/04731 | (SLS/IP/04731)
 bandwidth 64
 ip vrf forwarding BBRASIL_PAE:7041
 ip address 10.7.142.45 255.255.255.252
 no ip directed-broadcast
 ip pim sparse-mode
 ip mroute-cache
 no cdp enable
 frame-relay interface-dlci 100 CISCO   
  class QC_64K_BBrasil_PAE_IOS_V1
!
interface Serial7/1/0.1/3/6/2:2
 description IMIFARMA  | 512K | SLS/IP/05662 | (SLS/IP/05662)
 bandwidth 512
 no ip address
 no ip directed-broadcast
 encapsulation ppp
 no peer neighbor-route
 ppp chap hostname MULTILINK_291032
 ppp multilink
 multilink-group 291032
!
interface Serial7/1/0.1/3/6/2:3
 description BCOAM  | 256K | SLS/IP/02949 | (SLS/IP/02949)
 bandwidth 256
 no ip address
 no ip directed-broadcast
 encapsulation ppp
 no peer neighbor-route
 no cdp enable
 ppp chap hostname MULTILINK_291066
 ppp multilink
 multilink-group 291066
!
interface Serial7/1/0.1/3/7/2:0
 dampening 30 50 1100 200
 description BCP  | 2048K | SLS/IP/01981 | (SLS/IP/01981)
 bandwidth 2048
 ip vrf forwarding BCP_NO:4026
 ip address 200.252.158.21 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 no cdp enable
 service-policy input ZERA-EXP-Saida
!
interface Serial7/2/0.1/1/1/1:0
 dampening 30 50 1100 200
 description JEVA  | 2048K | ITZ/IP/01180 | (ITZ/IP/01180)
 bandwidth 2048
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 ppp chap hostname MULTILINK_28985
 ppp multilink
 multilink-group 28985
!
interface Serial7/2/0.1/1/1/3:0
 dampening 30 50 1100 200
 description ALMEIDA  | 2048K | BBL/IP/00223 | (BBL/IP/00223)
 bandwidth 2048
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 ppp chap hostname MULTILINK_291051
 ppp multilink
 multilink-group 291051
!
interface Serial7/2/0.1/1/2/1:0
 dampening 30 50 1100 200
 description LINUXELL  | 2048K | SLS/IP/00590 | (SLS/IP/00590) | BLK-SAIP-APEDIDO/20170420-1054/POR-DENISVM
 bandwidth 2048
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 shutdown
 no peer neighbor-route
 ppp chap hostname MULTILINK_29022
 ppp multilink
 multilink-group 29022
!
interface Serial7/2/0.1/1/2/3:0
 dampening 30 50 1100 200
 description ALMEIDA  | 2048K | BBL/IP/00224 | (BBL/IP/00224)
 bandwidth 2048
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 ppp chap hostname MULTILINK_291051
 ppp multilink
 multilink-group 291051
!
interface Serial7/2/0.1/1/3/1:0
 dampening 30 50 1100 200
 description REDE_CORREIOS  | 1024K | SLS/IP/06105 | (SLS/IP/06105)
 bandwidth 1024
 ip vrf forwarding CORREIOS_2016:155714
 ip address 172.18.75.57 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 no cdp enable
 service-policy input QPI_Correios_1024K_PPP_IOS_D_V1
 service-policy output QPO_Correios_1024K_PPP_IOS_D_V1
!
interface Serial7/2/0.1/1/3/2:0
 description MINISTERIO SAUDE  | 2048K | SLS/IP/06207 | (SLS/IP/06207)
 bandwidth 2048
 ip address 187.28.240.233 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 no cdp enable
 service-policy input QPI_BBONE_DSCP_V1
!
interface Serial7/2/0.1/1/3/3:0
 dampening 30 50 1100 200
 description ALMEIDA  | 2048K | BBL/IP/00225 | (BBL/IP/00225)
 bandwidth 2048
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 ppp chap hostname MULTILINK_291051
 ppp multilink
 multilink-group 291051
!
interface Serial7/2/0.1/1/4/1:0
 dampening 30 50 1100 200
 description NOBLEBRASIL  | 1024K | SLS/IP/04898 | (SLS/IP/04898) | BLK-SAIP-APEDIDO/20160920-1511/POR-PRIAPS
 bandwidth 1024
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 shutdown
 no peer neighbor-route
 ppp chap hostname MULTILINK_28936
 ppp multilink
 multilink-group 28936
!
interface Serial7/2/0.1/1/5/2:0
 dampening 30 50 1100 200
 description PONTOCOM | 1024K | SLS/IP/00896 | (SLS/IP/00896)
 bandwidth 1024
 ip address 189.53.11.193 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 no cdp enable
 service-policy input ZERA-DSCP
!
interface Serial7/2/0.1/1/6/1:0
 dampening 30 50 1100 200
 description BASA  | 2048K | SLS/IP/05960 | (SLS/IP/05960)
 bandwidth 2048
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 no cdp enable
 ppp chap hostname MULTILINK_149
 ppp multilink
 service-policy input QPI_BBONE_EXP_V1
!
interface Serial7/2/0.1/1/7/2:0
 dampening 30 50 1100 200
 description COSAN  | 2048K | SLS/IP/04895 | (SLS/IP/04895)
 bandwidth 2048
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 ppp chap hostname MULTILINK_28939
 ppp multilink
 multilink-group 28939
!
interface Serial7/2/0.1/1/7/3:0
 dampening 30 50 1100 200
 description JEVA  | 2048K | ITZ/IP/00832 | (ITZ/IP/00832)
 bandwidth 2048
 no ip address
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 ppp chap hostname MULTILINK_28985
 ppp multilink
 multilink-group 28985
!
interface Serial7/2/0.1/2/2/2:0
 dampening 30 50 1100 200
 description BNB  | 2048K | SLS/IP/05490 | (SLS/IP/05490)
 bandwidth 2048
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 ppp chap hostname MULTILINK_29039
 ppp multilink
 multilink-group 29039
!
interface Serial7/2/0.1/2/3/1:0
 dampening 30 50 1100 200
 description LINUXELL  | 2048K | SLS/IP/05273 | (SLS/IP/05273) | BLK-SAIP-APEDIDO/20170420-1116/POR-DENISVM
 bandwidth 2048
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 shutdown
 no peer neighbor-route
 ppp chap hostname MULTILINK_29022
 ppp multilink
 multilink-group 29022
!
interface Serial7/2/0.1/2/4/1:0
 dampening 30 50 1100 200
 description SEBRAEMA  | 2048K | SLS/IP/05835 | (SLS/IP/05835) | BGP_AS64617
 bandwidth 2048
 ip vrf forwarding SEBRAEMA:4302
 ip address 189.53.246.193 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 no cdp enable
 service-policy input QPI_A_2048K_5_N_0_0_0_0_2_92
 service-policy output QPO_A_2048K_5_0_0_0_0_2_92
!
interface Serial7/2/0.1/2/5/3:2
 dampening 30 50 1100 200
 description IMIFARMA  | 512K | SLS/IP/05888 | (SLS/IP/05888) | BGP_AS65000
 bandwidth 512
 ip vrf forwarding IMIFARMA_EXTRANET:155458
 ip address 189.53.246.177 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 no cdp enable
 service-policy input QPI_A_512K_5_N_0_30_16_4_4_40
 service-policy output QPO_A_512K_5_0_30_16_4_4_40
!
interface Serial7/2/0.1/2/5/3:3
 dampening 30 50 1100 200
 description HERVAL  | 512K | SLS/IP/05727 | (SLS/IP/05727)
 bandwidth 512
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 ppp chap hostname MULTILINK_291027
 ppp multilink
 multilink-group 291027
!
interface Serial7/2/0.1/2/7/2:0
 dampening 30 50 1100 200
 description SANTIAGO ADVOGADOS  | 2048K | SLS/IP/05168 | (SLS/IP/05168)
 bandwidth 2048
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 ppp chap hostname MULTILINK_28999
 ppp multilink
 multilink-group 28999
!
interface Serial7/2/0.1/2/7/3:0
 dampening 30 50 1100 200
 description BNB  | 2048K | SLS/IP/05491 | (SLS/IP/05491)
 bandwidth 2048
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 ppp chap hostname MULTILINK_29039
 ppp multilink
 multilink-group 29039
!
interface Serial7/2/0.1/3/1/1:0
 dampening 30 50 1100 200
 description SANTIAGO ADVOGADOS  | 2048K | SLS/IP/05167 | (SLS/IP/05167)
 bandwidth 2048
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 ppp chap hostname MULTILINK_28999
 ppp multilink
 multilink-group 28999
!
interface Serial7/2/0.1/3/1/2:0
 dampening 30 50 1100 200
 description MINJUSTICA  | 2048K | SLS/IP/05504 | (SLS/IP/05504)
 bandwidth 2048
 ip vrf forwarding DPF_MPLS:6606
 ip address 189.53.11.101 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 shutdown
 no peer neighbor-route
 no cdp enable
 service-policy input QPI_A_2048K_10_N_28_0_28_5_3_25
 service-policy output QPO_A_2048K_10_28_0_28_5_3_25
!
interface Serial7/2/0.1/3/1/3:0
 dampening 30 50 1100 200
 description ALMEIDA  | 2048K | BBL/IP/00226 | (BBL/IP/00226)
 bandwidth 2048
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 ppp chap hostname MULTILINK_291051
 ppp multilink
 multilink-group 291051
!
interface Serial7/2/0.1/3/2/1:1
 description SEBRAEMA  | 384K | BIH/IP/00005 | (BIH/IP/00005)
 bandwidth 384
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 ppp chap hostname MULTILINK_73
 ppp multilink
 multilink-group 73
!
interface Serial7/2/0.1/3/2/1:2
 description TECBAN  | 256K | ENLACE FR CLIENTE 
 bandwidth 256
 no ip address
 no ip directed-broadcast
 encapsulation frame-relay IETF
 no ip mroute-cache
 frame-relay lmi-type cisco
!
interface Serial7/2/0.1/3/2/1:2.1 point-to-point
 description TECBAN  | 256K | SJE/IP/00176 | (SJE/IP/00176)
 bandwidth 256
 ip vrf forwarding TECBAN:1221
 ip address 189.52.211.77 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no ip mroute-cache
 no cdp enable
 frame-relay interface-dlci 100 IETF   
  class QC_BBONE_EXP_V1
!
interface Serial7/2/0.1/3/2/1:3
 dampening 30 50 1100 200
 description SETMA  | 512K | SLS/IP/00437 | (SLS/IP/00437)
 bandwidth 512
 ip vrf forwarding SET_MA:3377
 ip address 189.43.120.69 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 no cdp enable
 service-policy input QPI_BBONE_EXP_V1
!
interface Serial7/2/0.1/3/3/1:6
 dampening 30 50 1100 200
 description CEMAR  | 256K | SLS/IP/03279 | (SLS/IP/03279)
 bandwidth 256
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 ppp chap hostname MULTILINK_168
 ppp multilink
 multilink-group 168
!
interface Serial7/2/0.1/3/3/1:7
 dampening 30 50 1100 200
 description CEMAR  | 64K | ENLACE FR CLIENTE 
 bandwidth 64
 no ip address
 no ip directed-broadcast
 encapsulation frame-relay IETF
 no ip mroute-cache
 load-interval 30
 frame-relay lmi-type cisco
!
interface Serial7/2/0.1/3/3/1:7.1 point-to-point
 description CEMAR  | 64K | SLS/IP/00481 | (SLS/IP/00481)
 bandwidth 64
 ip vrf forwarding CEMAR:3468
 ip address 189.23.28.125 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no ip mroute-cache
 snmp trap link-status
 no cdp enable
 frame-relay interface-dlci 100 IETF   
  class QC_AF_64K_38_N_0_7_0_0_13_39_128B
!
interface Serial7/2/0.1/3/3/2:3
 dampening 30 50 1100 200
 description BCOAM  | 256K | ACD/IP/00045 | (ACD/IP/00045)
 bandwidth 256
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 shutdown
 no peer neighbor-route
 ppp chap hostname MULTILINK_157
 ppp multilink
!
interface Serial7/2/0.1/3/4/1:3
 dampening 30 50 1100 200
 description CREDISHOP  | 256K | PDZ/IP/00014 | (PDZ/IP/00014)
 bandwidth 256
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 ppp chap hostname MULTILINK_28272
 ppp multilink
 multilink-group 28272
!
interface Serial7/2/0.1/3/5/2:5
 dampening 30 50 1100 200
 description SETMA  | 256K | SLS/IP/00446 | (SLS/IP/00446)
 bandwidth 256
 ip vrf forwarding SET_MA:3377
 ip address 189.43.120.97 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 no cdp enable
 service-policy input QPI_BBONE_EXP_V1
!
interface Serial7/2/0.1/3/5/2:6
 description BOMPRECO  | 512K | ENLACE FR CLIENTE 
 bandwidth 512
 no ip address
 no ip directed-broadcast
 encapsulation frame-relay IETF
 frame-relay lmi-type cisco
!
interface Serial7/2/0.1/3/5/2:6.1 point-to-point
 description BOMPRECO  | 512K | SLS/IP/00525 | (SLS/IP/00525)
 bandwidth 512
 ip vrf forwarding WALMART:3141
 ip address 201.45.138.93 255.255.255.252
 no ip directed-broadcast
 no ip mroute-cache
 no cdp enable
 frame-relay interface-dlci 100 IETF   
  class QC_AF_512K_7_N_0_11_16_0_4_61_512B
!
interface Serial7/2/0.1/3/5/2:7
 description CREFISA  | 512K | SJE/IP/00145 | (SJE/IP/00145)
 bandwidth 512
 no ip address
 no ip directed-broadcast
 encapsulation ppp
 no peer neighbor-route
 ppp chap hostname MULTILINK_291045
 ppp multilink
 multilink-group 291045
!
interface Serial7/2/0.1/3/5/2:8
 description CREFISA  | 512K | SLS/IP/05649 | (SLS/IP/05649)
 bandwidth 512
 no ip address
 no ip directed-broadcast
 encapsulation ppp
 no peer neighbor-route
 ppp chap hostname MULTILINK_291020
 ppp multilink
 multilink-group 291020
!
interface Serial7/2/0.1/3/6/1:0
 dampening 30 50 1100 200
 description BCOAM  | 1024K | COR/IP/00003 | (COR/IP/00003)
 bandwidth 1024
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 ppp chap hostname MULTILINK_186
 ppp multilink
 multilink-group 186
!
interface Serial7/2/0.1/3/6/1:1
 dampening 30 50 1100 200
 description ABR ROAMING  | 512K | SLS/IP/03173 | (SLS/IP/03173) | BLK-SAIP-APEDIDO/20180312-1646/POR-RPA01
 bandwidth 512
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 shutdown
 no peer neighbor-route
 no cdp enable
 service-policy input QPI_BBONE_EXP_V1
!
interface Serial7/2/0.1/3/6/3:0
 dampening 30 50 1100 200
 description LASA_NOVA  | 2048K | ENLACE FR CLIENTE 
 bandwidth 2048
 no ip address
 no ip directed-broadcast
 encapsulation frame-relay IETF
 no ip mroute-cache
 load-interval 30
 frame-relay lmi-type cisco
!
interface Serial7/2/0.1/3/6/3:0.1 point-to-point
 description LASA_NOVA  | 2048K | SLS/IP/00830 | (SLS/IP/00830) | BGP_AS65316
 bandwidth 2048
 ip vrf forwarding LASA_NOVA:6236
 ip address 189.53.11.77 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no ip mroute-cache
 no cdp enable
 frame-relay interface-dlci 100 IETF   
  class QC_AF_2048K_13_N_37_24_0_0_2_23_0B
!
interface Serial7/2/0.1/3/7/1:0
 dampening 30 50 1100 200
 description ALMEIDA  | 2048K | BBL/IP/00227 | (BBL/IP/00227)
 bandwidth 2048
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 ppp chap hostname MULTILINK_291051
 ppp multilink
 multilink-group 291051
!
interface Serial7/2/0.1/3/7/2:0
 dampening 30 50 1100 200
 description SEBRAEMA  | 2048K | SLS/IP/01772 | (SLS/IP/01772) | BGP_AS64617
 bandwidth 2048
 ip vrf forwarding SEBRAEMA:4302
 ip address 189.52.211.29 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 no cdp enable
 service-policy input QPI_A_2048K_6_N_0_1_0_0_2_90
 service-policy output QPO_A_2048K_6_0_1_0_0_2_90
!
interface FastEthernet7/3/0
 description RESERVADO PARA ADM100M | ROGERIO | 521-3113 | 04/10/2011
 no ip address
 no ip directed-broadcast
 shutdown
 negotiation auto
 no cdp enable
!
interface FastEthernet7/3/1
 description RESERVADO PARA ADM100M | ROGERIO | 521-3113 | 04/10/2011
 no ip address
 no ip directed-broadcast
 shutdown
 negotiation auto
 no cdp enable
!
interface FastEthernet7/3/2
 description RESERVADO PARA ADM100M | ROGERIO | 521-3113 | 04/10/2011
 no ip address
 no ip directed-broadcast
 shutdown
 negotiation auto
 no cdp enable
!
interface FastEthernet7/3/3
 description RESERVADO PARA ADM100M | ROGERIO | 521-3113 | 04/10/2011
 no ip address
 no ip directed-broadcast
 shutdown
 negotiation auto
 no cdp enable
!
interface FastEthernet7/3/4
 description RESERVADO PARA ADM100M | ROGERIO | 521-3113 | 04/10/2011
 no ip address
 no ip directed-broadcast
 shutdown
 negotiation auto
 no cdp enable
!
interface FastEthernet7/3/5
 description RESERVADO PARA ADM100M | ROGERIO | 521-3113 | 04/10/2011
 no ip address
 no ip directed-broadcast
 shutdown
 negotiation auto
 no cdp enable
!
interface FastEthernet7/3/6
 description RESERVADO PARA ADM100M | ROGERIO | 521-3113 | 04/10/2011
 no ip address
 no ip directed-broadcast
 shutdown
 negotiation auto
 no cdp enable
!
interface FastEthernet7/3/7
 description RESERVADO PARA ADM100M | ROGERIO | 521-3113 | 04/10/2011
 no ip address
 no ip directed-broadcast
 shutdown
 negotiation auto
 no cdp enable
!
interface Ethernet0
 description Ligacao OOB | 10M | (Interface para acesso out-of-band aos gigarouters)
 ip address 10.201.98.28 255.255.255.0
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
 ip address 77.1.104.1 255.255.0.0
 no ip directed-broadcast
 no ip route-cache
 no ip mroute-cache
!
router ospf 1946 vrf POUPEX:1946
 log-adjacency-changes
 redistribute bgp 4230 subnets route-map POUPEX_BGP_OSPF
 network 201.73.255.216 0.0.0.3 area 1
 maximum-paths 6
 default-information originate
!
router ospf 21
 router-id 200.244.41.196
 log-adjacency-changes detail
 mpls ldp sync
 timers throttle spf 50 50 2000
 timers throttle lsa all 0 20 2000
 timers lsa arrival 20
 timers pacing flood 25
 timers pacing retransmission 30
 redistribute maximum-prefix 20000 85 warning-only
 network 200.244.41.0 0.0.0.255 area 98
 network 200.244.63.64 0.0.0.31 area 98
 network 200.244.63.96 0.0.0.31 area 98
 maximum-paths 6
!
router bgp 4230
 bgp router-id 200.244.41.196
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
 neighbor DEFAULT-ROUTE_BGP-LIGHT peer-group
 neighbor FULL-ROUTING peer-group
 neighbor 10.192.73.10 remote-as 65023
 neighbor 10.192.73.10 description SLS/IP/04980
 neighbor 187.28.122.42 remote-as 28246
 neighbor 187.28.122.42 peer-group PARTIAL-ROUTING
 neighbor 187.28.122.42 description BBL/IP/00066 
 neighbor 187.28.122.42 ebgp-multihop 5
 neighbor 189.43.120.42 remote-as 65061
 neighbor 189.43.120.42 description BBL/MULTI/20288
 neighbor 189.43.197.246 remote-as 64707
 neighbor 189.43.197.246 description SLS/MULTI/28194
 neighbor 189.53.246.34 remote-as 64688
 neighbor 189.53.246.34 description SLS/IP/01969
 neighbor 200.167.148.2 remote-as 65523
 neighbor 200.167.148.2 peer-group DEFAULT-ROUTE_BGP-LIGHT
 neighbor 200.209.190.150 remote-as 28191
 neighbor 200.209.190.150 peer-group FULL-ROUTING
 neighbor 200.209.190.150 ebgp-multihop 2
 neighbor 200.209.190.150 update-source Loopback2023
 neighbor 200.244.28.30 remote-as 4230
 neighbor 200.244.28.30 description VRR01.FLA
 neighbor 200.244.28.30 update-source Loopback0
 neighbor 200.244.28.32 remote-as 4230
 neighbor 200.244.28.32 description VRR01.SDR
 neighbor 200.244.28.32 update-source Loopback0
 neighbor 200.244.41.104 peer-group IBGP_FULL
 neighbor 200.244.41.104 description IBGP_DIST02.SLS
 neighbor 200.244.41.105 peer-group IBGP_FULL
 neighbor 200.244.41.105 description IBGP_DIST01.SLS
 neighbor 200.252.158.26 remote-as 262849
 neighbor 200.252.158.26 peer-group PARTIAL-ROUTING
 neighbor 200.252.158.26 description ACOM (SkyBrasil) | SLS/IP/01987 | BGP FULL RSERV01.SDR
 neighbor 200.252.158.26 ebgp-multihop 5
 neighbor 200.252.158.190 remote-as 65123
 neighbor 200.252.158.190 peer-group DEFAULT-ROUTE_BGP-LIGHT
 neighbor 200.252.158.190 description SLS/MULTI/27176
 neighbor 201.76.128.2 remote-as 28652
 neighbor 201.76.128.2 peer-group PARTIAL-ROUTING
 neighbor 201.76.128.2 description SLS/IP/00212
 neighbor 201.76.128.2 ebgp-multihop 255
 neighbor 201.76.128.2 update-source Loopback2037
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
 neighbor DEFAULT-ROUTE_BGP-LIGHT activate
 neighbor DEFAULT-ROUTE_BGP-LIGHT default-originate
 neighbor DEFAULT-ROUTE_BGP-LIGHT remove-private-as
 neighbor DEFAULT-ROUTE_BGP-LIGHT route-map NO-ROUTES_OUT out
 neighbor FULL-ROUTING activate
 neighbor FULL-ROUTING remove-private-as
 neighbor FULL-ROUTING distribute-list 1 in
 neighbor FULL-ROUTING route-map FULL-ROUTING_OUT out
 neighbor 187.28.122.42 peer-group PARTIAL-ROUTING
 neighbor 187.28.122.42 route-map SIVNET_IN in
 neighbor 187.28.122.42 maximum-prefix 5000 90
 neighbor 200.167.148.2 peer-group DEFAULT-ROUTE_BGP-LIGHT
 neighbor 200.167.148.2 route-map SAM_DADOS_IN in
 neighbor 200.209.190.150 peer-group FULL-ROUTING
 neighbor 200.209.190.150 route-map JUPITER_IN in
 neighbor 200.244.41.104 peer-group IBGP_FULL
 neighbor 200.244.41.105 peer-group IBGP_FULL
 neighbor 200.252.158.26 peer-group PARTIAL-ROUTING
 neighbor 200.252.158.26 route-map ACOM_IN in
 neighbor 200.252.158.26 maximum-prefix 200 85
 neighbor 200.252.158.190 peer-group DEFAULT-ROUTE_BGP-LIGHT
 neighbor 200.252.158.190 route-map CEMAR_IN in
 neighbor 201.76.128.2 peer-group PARTIAL-ROUTING
 neighbor 201.76.128.2 route-map TVM_IN in
 neighbor 201.76.128.2 maximum-prefix 5000 90
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
 neighbor 172.16.0.82 remote-as 65523
 neighbor 172.16.0.82 activate
 neighbor 172.16.0.82 send-community both
 neighbor 172.16.0.82 route-map SBC_CLIENTE in
 neighbor 172.16.0.82 route-map WIMAX_EBT_385517216082 out
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf WALMART:3141
 redistribute connected
 redistribute static
 neighbor 189.23.28.138 remote-as 65371
 neighbor 189.23.28.138 description SLS/MULTI/54498
 neighbor 189.23.28.138 activate
 neighbor 189.23.28.138 send-community both
 neighbor 201.45.138.94 remote-as 65371
 neighbor 201.45.138.94 description SLS/IP/00525
 neighbor 201.45.138.94 activate
 neighbor 201.45.138.94 send-community both
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
 address-family ipv4 vrf TRT16:3540
 redistribute connected
 redistribute static
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf TEXACO:4523
 redistribute connected
 redistribute static
 neighbor 189.52.211.14 remote-as 65181
 neighbor 189.52.211.14 description SLS/IP/06215
 neighbor 189.52.211.14 activate
 neighbor 189.52.211.14 send-community both
 maximum-paths eibgp 3
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf TESTE_TMX:200001
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
 neighbor 187.29.255.234 remote-as 64896
 neighbor 187.29.255.234 description SLS/IP/06183
 neighbor 187.29.255.234 activate
 neighbor 187.29.255.234 send-community both
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf TECELAGEMAV:2642
 redistribute connected
 redistribute static
 neighbor 189.53.11.94 remote-as 65000
 neighbor 189.53.11.94 description CDO/IP/00171
 neighbor 189.53.11.94 activate
 neighbor 189.53.11.94 send-community both
 neighbor 200.172.11.18 remote-as 65000
 neighbor 200.172.11.18 description ITZ/MULTI/59478
 neighbor 200.172.11.18 activate
 neighbor 200.172.11.18 send-community both
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf TECBAN_NOVA:3642
 redistribute connected route-map SBC_CLIENTE
 redistribute static
 neighbor 187.29.255.58 remote-as 65132
 neighbor 187.29.255.58 description SLS/IP/03863
 neighbor 187.29.255.58 activate
 neighbor 187.29.255.58 send-community both
 neighbor 187.29.255.58 as-override
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
 address-family ipv4 vrf TAGUATURVEIC:3519
 redistribute connected route-map SBC_CLIENTE
 redistribute static
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf SUPERMMACIEL:3754
 redistribute connected route-map SBC_CLIENTE
 redistribute static
 neighbor 189.23.73.170 remote-as 65216
 neighbor 189.23.73.170 description SLS/MULTI/34176
 neighbor 189.23.73.170 activate
 neighbor 189.23.73.170 send-community both
 neighbor 189.52.211.238 remote-as 65216
 neighbor 189.52.211.238 description SLS/MULTI/55908
 neighbor 189.52.211.238 activate
 neighbor 189.52.211.238 send-community both
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf SOLARBR:6759
 redistribute connected
 redistribute static
 neighbor 189.52.211.62 remote-as 65317
 neighbor 189.52.211.62 description SLS/MULTI/28816
 neighbor 189.52.211.62 activate
 neighbor 189.52.211.62 send-community both
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf SET_MA:3377
 redistribute connected
 redistribute static
 neighbor 189.52.211.150 remote-as 64704
 neighbor 189.52.211.150 description SLS/IP/06251
 neighbor 189.52.211.150 activate
 neighbor 189.52.211.150 send-community both
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf SESCOP:6219
 redistribute connected
 redistribute static
 neighbor 200.252.158.110 remote-as 65000
 neighbor 200.252.158.110 description SLS/IP/05869
 neighbor 200.252.158.110 activate
 neighbor 200.252.158.110 send-community both
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf SESC:1916
 redistribute connected
 redistribute static
 neighbor 187.29.255.158 remote-as 65000
 neighbor 187.29.255.158 description ITI/IP/00123
 neighbor 187.29.255.158 activate
 neighbor 187.29.255.158 send-community both
 maximum-paths eibgp 2
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf SERPRO_SLS_RIS_01:5892
 redistribute connected
 redistribute static
 neighbor 10.192.73.98 remote-as 65023
 neighbor 10.192.73.98 description SLS/IP/04991
 neighbor 10.192.73.98 activate
 neighbor 10.192.73.98 send-community both
 neighbor 10.192.73.106 remote-as 65023
 neighbor 10.192.73.106 description SLS/IP/04992
 neighbor 10.192.73.106 activate
 neighbor 10.192.73.106 send-community both
 neighbor 172.16.223.22 remote-as 65021
 neighbor 172.16.223.22 description SLS/MULTI/40134
 neighbor 172.16.223.22 activate
 neighbor 172.16.223.22 send-community both
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf SERPRO_SLS_RFB_12:6238
 redistribute connected
 redistribute static
 neighbor 10.192.73.130 remote-as 65023
 neighbor 10.192.73.130 description SLS/IP/05140
 neighbor 10.192.73.130 activate
 neighbor 10.192.73.130 send-community both
 neighbor 10.192.73.138 remote-as 65023
 neighbor 10.192.73.138 description SLS/IP/05141
 neighbor 10.192.73.138 activate
 neighbor 10.192.73.138 send-community both
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf SERPRO_SLS_RFB_11:5911
 redistribute connected
 redistribute static
 neighbor 10.192.73.82 remote-as 65023
 neighbor 10.192.73.82 description SLS/IP/04989
 neighbor 10.192.73.82 activate
 neighbor 10.192.73.82 send-community both
 neighbor 10.192.73.90 remote-as 65023
 neighbor 10.192.73.90 description SLS/IP/04990
 neighbor 10.192.73.90 activate
 neighbor 10.192.73.90 send-community both
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf SERPRO_SLS_RFB_10:5909
 redistribute connected
 redistribute static
 neighbor 10.192.73.66 remote-as 65023
 neighbor 10.192.73.66 description SLS/IP/04987
 neighbor 10.192.73.66 activate
 neighbor 10.192.73.66 send-community both
 neighbor 10.192.73.74 remote-as 65023
 neighbor 10.192.73.74 description SLS/IP/04988
 neighbor 10.192.73.74 activate
 neighbor 10.192.73.74 send-community both
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf SERPRO_SLS_RFB_09:5913
 redistribute connected
 redistribute static
 neighbor 10.192.73.50 remote-as 65023
 neighbor 10.192.73.50 description SLS/IP/04985
 neighbor 10.192.73.50 activate
 neighbor 10.192.73.50 send-community both
 neighbor 10.192.73.58 remote-as 65023
 neighbor 10.192.73.58 description SLS/IP/04986
 neighbor 10.192.73.58 activate
 neighbor 10.192.73.58 send-community both
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf SERPRO_SLS_RFB_08:5907
 redistribute connected
 redistribute static
 neighbor 10.192.73.34 remote-as 65023
 neighbor 10.192.73.34 description SLS/IP/04983
 neighbor 10.192.73.34 activate
 neighbor 10.192.73.34 send-community both
 neighbor 10.192.73.42 remote-as 65023
 neighbor 10.192.73.42 description SLS/IP/04984
 neighbor 10.192.73.42 activate
 neighbor 10.192.73.42 send-community both
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf SERPRO_SLS_RFB_06:5918
 redistribute connected
 redistribute static
 neighbor 10.192.73.2 remote-as 65023
 neighbor 10.192.73.2 description SLS/IP/04979
 neighbor 10.192.73.2 activate
 neighbor 10.192.73.2 send-community both
 neighbor 10.192.73.10 remote-as 65023
 neighbor 10.192.73.10 description SLS/IP/04980
 neighbor 10.192.73.10 activate
 neighbor 10.192.73.10 send-community both
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf SERPRO_SLS_RFB_05:5917
 redistribute connected
 redistribute static
 neighbor 10.192.72.242 remote-as 65023
 neighbor 10.192.72.242 description SLS/IP/05137
 neighbor 10.192.72.242 activate
 neighbor 10.192.72.242 send-community both
 neighbor 10.192.72.250 remote-as 65023
 neighbor 10.192.72.250 description SLS/IP/05138
 neighbor 10.192.72.250 activate
 neighbor 10.192.72.250 send-community both
 neighbor 10.192.73.146 remote-as 65023
 neighbor 10.192.73.146 description SLS/IP/05137
 neighbor 10.192.73.146 activate
 neighbor 10.192.73.146 send-community both
 neighbor 10.192.73.154 remote-as 65023
 neighbor 10.192.73.154 description SLS/IP/05138
 neighbor 10.192.73.154 activate
 neighbor 10.192.73.154 send-community both
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf SERPRO_SLS_RFB_04:5905
 redistribute connected
 redistribute static
 neighbor 10.53.2.142 remote-as 65003
 neighbor 10.53.2.142 description CXS/MULTI/40169
 neighbor 10.53.2.142 activate
 neighbor 10.53.2.142 send-community both
 neighbor 10.192.72.226 remote-as 65023
 neighbor 10.192.72.226 description SLS/IP/04975
 neighbor 10.192.72.226 activate
 neighbor 10.192.72.226 send-community both
 neighbor 10.192.72.234 remote-as 65023
 neighbor 10.192.72.234 description SLS/IP/04976
 neighbor 10.192.72.234 activate
 neighbor 10.192.72.234 send-community both
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf SERPRO_SLS_RFB_03:5904
 redistribute connected
 redistribute static
 neighbor 10.192.72.210 remote-as 65023
 neighbor 10.192.72.210 description SLS/IP/04973
 neighbor 10.192.72.210 activate
 neighbor 10.192.72.210 send-community both
 neighbor 10.192.72.218 remote-as 65023
 neighbor 10.192.72.218 description SLS/IP/04974
 neighbor 10.192.72.218 activate
 neighbor 10.192.72.218 send-community both
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf SERPRO_SLS_RFB_02:5881
 redistribute connected
 redistribute static
 neighbor 10.53.2.162 remote-as 65003
 neighbor 10.53.2.162 description BBL/MULTI/40131
 neighbor 10.53.2.162 activate
 neighbor 10.53.2.162 send-community both
 neighbor 10.192.72.194 remote-as 65023
 neighbor 10.192.72.194 description SLS/IP/04971
 neighbor 10.192.72.194 activate
 neighbor 10.192.72.194 send-community both
 neighbor 10.192.72.202 remote-as 65023
 neighbor 10.192.72.202 description SLS/IP/04972
 neighbor 10.192.72.202 activate
 neighbor 10.192.72.202 send-community both
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf SERPRO_SLS_RFB_01:5848
 redistribute connected
 redistribute static
 neighbor 10.192.72.178 remote-as 65023
 neighbor 10.192.72.178 description SLS/IP/04969
 neighbor 10.192.72.178 activate
 neighbor 10.192.72.178 send-community both
 neighbor 10.192.72.186 remote-as 65023
 neighbor 10.192.72.186 description SLS/IP/04970
 neighbor 10.192.72.186 activate
 neighbor 10.192.72.186 send-community both
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf SERPRO_SLS_PGFN_01:5895
 redistribute connected
 redistribute static
 neighbor 10.192.72.162 remote-as 65023
 neighbor 10.192.72.162 description SLS/IP/04967
 neighbor 10.192.72.162 activate
 neighbor 10.192.72.162 send-community both
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf SERPRO_SLS_DNIT_06:5894
 redistribute connected
 redistribute static
 neighbor 10.192.72.82 remote-as 65023
 neighbor 10.192.72.82 description SLS/IP/05963
 neighbor 10.192.72.82 activate
 neighbor 10.192.72.82 send-community both
 neighbor 10.192.72.90 remote-as 65023
 neighbor 10.192.72.90 description SLS/IP/05964
 neighbor 10.192.72.90 activate
 neighbor 10.192.72.90 send-community both
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf SERPRO_SLS_DNIT_05:5908
 redistribute connected
 redistribute static
 neighbor 10.192.72.66 remote-as 65023
 neighbor 10.192.72.66 description SLS/IP/04957
 neighbor 10.192.72.66 activate
 neighbor 10.192.72.66 send-community both
 neighbor 10.192.72.74 remote-as 65023
 neighbor 10.192.72.74 description SLS/IP/04958
 neighbor 10.192.72.74 activate
 neighbor 10.192.72.74 send-community both
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf SERPRO_SLS_DNIT_04:5949
 redistribute connected
 redistribute static
 neighbor 10.192.72.50 remote-as 65023
 neighbor 10.192.72.50 description SLS/IP/04955
 neighbor 10.192.72.50 activate
 neighbor 10.192.72.50 send-community both
 neighbor 10.192.72.58 remote-as 65023
 neighbor 10.192.72.58 description SLS/IP/04956
 neighbor 10.192.72.58 activate
 neighbor 10.192.72.58 send-community both
 neighbor 10.218.15.10 remote-as 65013
 neighbor 10.218.15.10 description SLS/MULTI/40307
 neighbor 10.218.15.10 activate
 neighbor 10.218.15.10 send-community both
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf SERPRO_SLS_DNIT_03:5896
 redistribute connected
 redistribute static
 neighbor 10.192.72.34 remote-as 65023
 neighbor 10.192.72.34 description SLS/IP/04953
 neighbor 10.192.72.34 activate
 neighbor 10.192.72.34 send-community both
 neighbor 10.192.72.42 remote-as 65023
 neighbor 10.192.72.42 description SLS/IP/04954
 neighbor 10.192.72.42 activate
 neighbor 10.192.72.42 send-community both
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf SERPRO_SLS_DNIT_02:5923
 redistribute connected
 redistribute static
 neighbor 10.192.72.18 remote-as 65023
 neighbor 10.192.72.18 description SLS/IP/04951
 neighbor 10.192.72.18 activate
 neighbor 10.192.72.18 send-community both
 neighbor 10.192.72.26 remote-as 65023
 neighbor 10.192.72.26 description SLS/IP/04952
 neighbor 10.192.72.26 activate
 neighbor 10.192.72.26 send-community both
 neighbor 10.218.14.250 remote-as 65013
 neighbor 10.218.14.250 description BJU/IP/00102
 neighbor 10.218.14.250 activate
 neighbor 10.218.14.250 send-community both
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf SERPRO_SLS_DNIT_01:5893
 redistribute connected
 redistribute static
 neighbor 10.192.72.2 remote-as 65023
 neighbor 10.192.72.2 description SLS/IP/04996
 neighbor 10.192.72.2 activate
 neighbor 10.192.72.2 send-community both
 neighbor 10.192.72.10 remote-as 65023
 neighbor 10.192.72.10 description SLS/IP/04995
 neighbor 10.192.72.10 activate
 neighbor 10.192.72.10 send-community both
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf SERPRO_SLS_DETRAN_01:5897
 redistribute connected
 redistribute static
 neighbor 10.192.73.114 remote-as 65023
 neighbor 10.192.73.114 description SLS/IP/04993
 neighbor 10.192.73.114 activate
 neighbor 10.192.73.114 send-community both
 neighbor 10.192.73.122 remote-as 65023
 neighbor 10.192.73.122 description SLS/IP/04994
 neighbor 10.192.73.122 activate
 neighbor 10.192.73.122 send-community both
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf SERMA:1663
 redistribute connected route-map LATAM_TELMEX_285
 redistribute static route-map LATAM_TELMEX_285
 neighbor 187.28.240.10 remote-as 65188
 neighbor 187.28.240.10 description SLS/IP/03816
 neighbor 187.28.240.10 activate
 neighbor 187.28.240.10 send-community both
 maximum-paths eibgp 2
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf SEBRAEMA:4302
 redistribute connected route-map SBC_CLIENTE
 redistribute static
 neighbor 189.23.28.142 remote-as 64617
 neighbor 189.23.28.142 description BBL/IP/00041
 neighbor 189.23.28.142 activate
 neighbor 189.23.28.142 send-community both
 neighbor 189.52.211.30 remote-as 64617
 neighbor 189.52.211.30 description SLS/IP/01772
 neighbor 189.52.211.30 activate
 neighbor 189.52.211.30 send-community both
 neighbor 189.52.211.42 remote-as 64617
 neighbor 189.52.211.42 description SLS/IP/05573
 neighbor 189.52.211.42 activate
 neighbor 189.52.211.42 send-community both
 neighbor 189.53.246.86 remote-as 64617
 neighbor 189.53.246.86 description ACD/IP/00038
 neighbor 189.53.246.86 activate
 neighbor 189.53.246.86 send-community both
 neighbor 189.53.246.86 route-map SEBRAEMA_43021895324686 out
 neighbor 189.53.246.94 remote-as 64617
 neighbor 189.53.246.94 description BIH/MULTI/18103
 neighbor 189.53.246.94 activate
 neighbor 189.53.246.94 send-community both
 neighbor 189.53.246.94 route-map SEBRAEMA_43021895324694 out
 neighbor 189.53.246.194 remote-as 64617
 neighbor 189.53.246.194 description SLS/IP/05835
 neighbor 189.53.246.194 activate
 neighbor 189.53.246.194 send-community both
 neighbor 201.45.138.122 remote-as 64617
 neighbor 201.45.138.122 description CHI/MULTI/19112
 neighbor 201.45.138.122 activate
 neighbor 201.45.138.122 send-community both
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf RIHAPPY:4005
 redistribute connected route-map SBC_CLIENTE
 redistribute static
 neighbor 200.179.211.86 remote-as 65443
 neighbor 200.179.211.86 description SLS/IP/05709
 neighbor 200.179.211.86 activate
 neighbor 200.179.211.86 send-community both
 neighbor 200.252.158.246 remote-as 65443
 neighbor 200.252.158.246 description SLS/MULTI/51956
 neighbor 200.252.158.246 activate
 neighbor 200.252.158.246 send-community both
 maximum-paths eibgp 2
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf REDEVIP_BLD_MLPPP:3799
 redistribute connected route-map SBC_CLIENTE
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf REDEVIP_BLD:152379
 redistribute connected route-map SBC_CLIENTE
 redistribute static
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
 address-family ipv4 vrf PREVIDENCIA_SPOKES:152225
 redistribute connected
 redistribute static
 neighbor 10.78.44.110 remote-as 26218
 neighbor 10.78.44.110 description USS/IP/00103
 neighbor 10.78.44.110 activate
 neighbor 10.78.44.110 send-community both
 maximum-paths eibgp 3
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf POUPEX:1946
 redistribute connected
 redistribute static
 redistribute ospf 1946 vrf POUPEX:1946 match internal external 1 external 2
 maximum-paths eibgp 3
 default-information originate
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf PIA:1264
 redistribute connected route-map SBC_CLIENTE
 redistribute static
 neighbor 189.53.246.190 remote-as 65012
 neighbor 189.53.246.190 description SLS/IP/05841
 neighbor 189.53.246.190 activate
 neighbor 189.53.246.190 send-community both
 maximum-paths eibgp 2
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf PAGUEMENOS:3822
 redistribute connected route-map SBC_CLIENTE
 redistribute static
 neighbor 187.29.255.86 remote-as 65338
 neighbor 187.29.255.86 description SLS/MULTI/32633
 neighbor 187.29.255.86 activate
 neighbor 187.29.255.86 send-community both
 neighbor 187.29.255.86 as-override
 neighbor 187.29.255.238 remote-as 65338
 neighbor 187.29.255.238 description SLS/IP/05710
 neighbor 187.29.255.238 activate
 neighbor 187.29.255.238 send-community both
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf OKIBRASIL:7552
 redistribute connected
 redistribute static
 neighbor 189.52.211.174 remote-as 65000
 neighbor 189.52.211.174 description SLS/IP/06158
 neighbor 189.52.211.174 activate
 neighbor 189.52.211.174 send-community both
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf NOVOMUNDO:7156
 redistribute connected
 redistribute static
 neighbor 200.179.211.206 remote-as 65000
 neighbor 200.179.211.206 description SLS/IP/05896
 neighbor 200.179.211.206 activate
 neighbor 200.179.211.206 send-community both
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf NOBLEBRASIL:4314
 redistribute connected
 redistribute static
 neighbor 189.53.11.146 remote-as 64733
 neighbor 189.53.11.146 description SLS/MULTI/38789
 neighbor 189.53.11.146 activate
 neighbor 189.53.11.146 send-community both
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf NGN-GER:1416
 redistribute connected
 redistribute static
 neighbor 10.253.2.178 remote-as 65523
 neighbor 10.253.2.178 activate
 neighbor 10.253.2.178 send-community both
 neighbor 10.253.2.178 route-map NGN-GER_1416102532178 out
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf NEGRAO:1481
 redistribute connected
 redistribute static
 neighbor 189.53.11.138 remote-as 65000
 neighbor 189.53.11.138 description SLS/IP/00827
 neighbor 189.53.11.138 activate
 neighbor 189.53.11.138 send-community both
 maximum-paths eibgp 2
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf MILLS:2550
 redistribute connected
 redistribute static
 neighbor 200.179.211.102 remote-as 65462
 neighbor 200.179.211.102 description SLS/IP/05733
 neighbor 200.179.211.102 activate
 neighbor 200.179.211.102 send-community both
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf MAXPAR:3450
 redistribute connected route-map SBC_CLIENTE
 redistribute static
 neighbor 189.52.211.2 remote-as 64856
 neighbor 189.52.211.2 description SLS/IP/05343
 neighbor 189.52.211.2 activate
 neighbor 189.52.211.2 send-community both
 maximum-paths eibgp 2
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf MARISA:4972
 redistribute connected route-map SET_COMMUNITY_GERENCIA_CQMR
 redistribute static
 neighbor 187.28.122.198 remote-as 65000
 neighbor 187.28.122.198 description SLS/IP/03728
 neighbor 187.28.122.198 activate
 neighbor 187.28.122.198 send-community both
 neighbor 187.29.255.118 remote-as 65000
 neighbor 187.29.255.118 description SLS/IP/04654
 neighbor 187.29.255.118 activate
 neighbor 187.29.255.118 send-community both
 neighbor 189.23.73.210 remote-as 65000
 neighbor 189.23.73.210 description ITZ/MULTI/34616
 neighbor 189.23.73.210 activate
 neighbor 189.23.73.210 send-community both
 neighbor 189.53.11.38 remote-as 65000
 neighbor 189.53.11.38 description SLS/IP/05785
 neighbor 189.53.11.38 activate
 neighbor 189.53.11.38 send-community both
 neighbor 189.53.246.2 remote-as 65000
 neighbor 189.53.246.2 description SLS/IP/04906
 neighbor 189.53.246.2 activate
 neighbor 189.53.246.2 send-community both
 maximum-paths eibgp 2
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf LOJASRIACHUELO:4120
 redistribute connected
 redistribute static
 neighbor 200.179.211.106 remote-as 65519
 neighbor 200.179.211.106 description SLS/IP/05753
 neighbor 200.179.211.106 activate
 neighbor 200.179.211.106 send-community both
 maximum-paths eibgp 2
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf LOJARENNER:1513
 redistribute connected route-map SBC_CLIENTE
 redistribute static
 maximum-paths eibgp 2
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf LILIANI:3630
 redistribute connected route-map SBC_CLIENTE
 redistribute static
 default-information originate
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf LEO:1056
 redistribute connected
 redistribute static
 neighbor 200.253.132.126 remote-as 64513
 neighbor 200.253.132.126 description SLS/IP/02853
 neighbor 200.253.132.126 activate
 neighbor 200.253.132.126 send-community both
 maximum-paths eibgp 2
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf LASA_NOVA:6236
 redistribute connected route-map SBC_CLIENTE
 redistribute static
 neighbor 187.28.122.214 remote-as 65316
 neighbor 187.28.122.214 description SLS/IP/03749
 neighbor 187.28.122.214 activate
 neighbor 187.28.122.214 send-community both
 neighbor 187.28.122.214 as-override
 neighbor 187.29.255.78 remote-as 65316
 neighbor 187.29.255.78 description SLS/IP/04081
 neighbor 187.29.255.78 activate
 neighbor 187.29.255.78 send-community both
 neighbor 187.29.255.78 as-override
 neighbor 189.52.211.214 remote-as 65316
 neighbor 189.52.211.214 description CHI/IP/00126
 neighbor 189.52.211.214 activate
 neighbor 189.52.211.214 send-community both
 neighbor 189.53.11.78 remote-as 65316
 neighbor 189.53.11.78 description SLS/IP/00830
 neighbor 189.53.11.78 activate
 neighbor 189.53.11.78 send-community both
 neighbor 189.53.11.78 as-override
 neighbor 200.172.10.186 remote-as 65316
 neighbor 200.172.10.186 description SLS/IP/06232
 neighbor 200.172.10.186 activate
 neighbor 200.172.10.186 send-community both
 neighbor 200.172.13.142 remote-as 65316
 neighbor 200.172.13.142 description SLS/IP/00668
 neighbor 200.172.13.142 activate
 neighbor 200.172.13.142 send-community both
 neighbor 200.172.13.142 as-override
 neighbor 200.249.171.94 remote-as 65316
 neighbor 200.249.171.94 description SLS/IP/00668
 neighbor 200.249.171.94 activate
 neighbor 200.249.171.94 send-community both
 neighbor 200.249.171.94 as-override
 maximum-paths eibgp 4
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf JSDISTRIBUIDORA:7167
 redistribute connected
 redistribute static
 neighbor 200.252.158.58 remote-as 65000
 neighbor 200.252.158.58 description SLS/IP/05932
 neighbor 200.252.158.58 activate
 neighbor 200.252.158.58 send-community both
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf IURD:1265
 redistribute connected
 redistribute static
 neighbor 189.52.211.194 remote-as 64662
 neighbor 189.52.211.194 description ITZ/IP/00186
 neighbor 189.52.211.194 activate
 neighbor 189.52.211.194 send-community both
 neighbor 189.52.211.194 route-map IURD_126518952211194 out
 neighbor 200.252.158.170 remote-as 64662
 neighbor 200.252.158.170 description PHE/MULTI/34324
 neighbor 200.252.158.170 activate
 neighbor 200.252.158.170 send-community both
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf ITAUNIBANCO:6388
 redistribute connected
 redistribute static route-map community-itau
 neighbor 187.29.255.94 remote-as 65001
 neighbor 187.29.255.94 description SLS/IP/05947
 neighbor 187.29.255.94 activate
 neighbor 187.29.255.94 send-community both
 neighbor 200.179.211.190 remote-as 65001
 neighbor 200.179.211.190 description SIS/IP/00204
 neighbor 200.179.211.190 activate
 neighbor 200.179.211.190 send-community both
 neighbor 200.252.158.10 remote-as 65001
 neighbor 200.252.158.10 description SLS/IP/05957
 neighbor 200.252.158.10 activate
 neighbor 200.252.158.10 send-community both
 maximum-paths eibgp 2
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf INFOVIA_DPU:6092
 redistribute connected
 redistribute static
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf INFOSUS:4968
 redistribute connected
 redistribute static
 neighbor 192.168.103.250 remote-as 65000
 neighbor 192.168.103.250 description SLS/IP/05272
 neighbor 192.168.103.250 activate
 neighbor 192.168.103.250 send-community both
 maximum-paths eibgp 2
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf IMIFARMA_EXTRANET:155458
 redistribute connected
 redistribute static
 neighbor 189.52.211.38 remote-as 65000
 neighbor 189.52.211.38 description SJE/MULTI/58179
 neighbor 189.52.211.38 activate
 neighbor 189.52.211.38 send-community both
 neighbor 189.52.211.118 remote-as 65000
 neighbor 189.52.211.118 description SLS/IP/06078
 neighbor 189.52.211.118 activate
 neighbor 189.52.211.118 send-community both
 neighbor 189.52.211.130 remote-as 65000
 neighbor 189.52.211.130 description SLS/MULTI/55463
 neighbor 189.52.211.130 activate
 neighbor 189.52.211.130 send-community both
 neighbor 189.53.246.130 remote-as 65000
 neighbor 189.53.246.130 description SLS/IP/05687
 neighbor 189.53.246.130 activate
 neighbor 189.53.246.130 send-community both
 neighbor 189.53.246.178 remote-as 65000
 neighbor 189.53.246.178 description SLS/IP/05888
 neighbor 189.53.246.178 activate
 neighbor 189.53.246.178 send-community both
 neighbor 200.179.211.50 remote-as 65000
 neighbor 200.179.211.50 description SLS/MULTI/54983
 neighbor 200.179.211.50 activate
 neighbor 200.179.211.50 send-community both
 neighbor 200.179.211.58 remote-as 65000
 neighbor 200.179.211.58 description SLS/MULTI/54987
 neighbor 200.179.211.58 activate
 neighbor 200.179.211.58 send-community both
 neighbor 200.179.211.90 remote-as 65000
 neighbor 200.179.211.90 description SLS/MULTI/55123
 neighbor 200.179.211.90 activate
 neighbor 200.179.211.90 send-community both
 neighbor 200.179.211.138 remote-as 65000
 neighbor 200.179.211.138 description SLS/IP/05693
 neighbor 200.179.211.138 activate
 neighbor 200.179.211.138 send-community both
 neighbor 200.179.211.154 remote-as 65000
 neighbor 200.179.211.154 description SLS/IP/05814
 neighbor 200.179.211.154 activate
 neighbor 200.179.211.154 send-community both
 neighbor 200.179.211.170 remote-as 65000
 neighbor 200.179.211.170 description SLS/IP/05679
 neighbor 200.179.211.170 activate
 neighbor 200.179.211.170 send-community both
 neighbor 200.179.211.222 remote-as 65000
 neighbor 200.179.211.222 description SLS/IP/05915
 neighbor 200.179.211.222 activate
 neighbor 200.179.211.222 send-community both
 neighbor 200.252.158.70 remote-as 65000
 neighbor 200.252.158.70 description SLS/MULTI/55810
 neighbor 200.252.158.70 activate
 neighbor 200.252.158.70 send-community both
 neighbor 200.252.158.126 remote-as 65000
 neighbor 200.252.158.126 description SLS/IP/06287
 neighbor 200.252.158.126 activate
 neighbor 200.252.158.126 send-community both
 neighbor 200.252.158.214 remote-as 65000
 neighbor 200.252.158.214 description SLS/IP/05943
 neighbor 200.252.158.214 activate
 neighbor 200.252.158.214 send-community both
 neighbor 201.30.36.62 remote-as 65000
 neighbor 201.30.36.62 description SLS/MULTI/55008
 neighbor 201.30.36.62 activate
 neighbor 201.30.36.62 send-community both
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf IBI_LOJAS:4639
 redistribute connected
 redistribute static
 neighbor 200.249.145.202 remote-as 64846
 neighbor 200.249.145.202 description SLS/IP/02148
 neighbor 200.249.145.202 activate
 neighbor 200.249.145.202 send-community both
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf IBAMA:1057
 redistribute connected
 redistribute static
 neighbor 189.52.211.182 remote-as 65000
 neighbor 189.52.211.182 description SLS/MULTI/38041
 neighbor 189.52.211.182 activate
 neighbor 189.52.211.182 send-community both
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf HERVAL:4202
 redistribute connected route-map SBC_CLIENTE
 redistribute static
 neighbor 189.52.211.6 remote-as 65000
 neighbor 189.52.211.6 description SLS/MULTI/54945
 neighbor 189.52.211.6 activate
 neighbor 189.52.211.6 send-community both
 maximum-paths eibgp 2
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf GERDAU_INT:151563
 redistribute connected route-map LATAM_TELMEX_286
 redistribute static route-map LATAM_TELMEX_286
 neighbor 10.241.51.2 remote-as 65214
 neighbor 10.241.51.2 description SLS/IP/01984
 neighbor 10.241.51.2 activate
 neighbor 10.241.51.2 send-community both
 neighbor 10.241.51.2 route-map LATAM_TELMEX_286 in
 neighbor 10.242.25.2 remote-as 65214
 neighbor 10.242.25.2 description ITZ/IP/00237 
 neighbor 10.242.25.2 activate
 neighbor 10.242.25.2 send-community both
 neighbor 10.242.25.2 route-map LATAM_TELMEX_286 in
 maximum-paths eibgp 2
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf FUNASA:3094
 redistribute connected
 redistribute static
 maximum-paths eibgp 2
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf EMSERH:7743
 redistribute connected
 redistribute static
 neighbor 200.252.158.18 remote-as 65000
 neighbor 200.252.158.18 description SLS/IP/06264
 neighbor 200.252.158.18 activate
 neighbor 200.252.158.18 send-community both
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf ELEVADORESATLAS:7186
 redistribute connected
 redistribute static
 neighbor 200.179.211.230 remote-as 65000
 neighbor 200.179.211.230 description SLS/IP/05942
 neighbor 200.179.211.230 activate
 neighbor 200.179.211.230 send-community both
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf DPF_MPLS:6606
 redistribute connected
 redistribute static
 maximum-paths eibgp 2
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf DIST_TIETE_FILIAL:5599
 redistribute connected
 redistribute static
 maximum-paths eibgp 2
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf DIEBOLD_EXTRANET:155476
 redistribute connected
 redistribute static
 neighbor 189.53.11.178 remote-as 65035
 neighbor 189.53.11.178 description SLS/IP/06054
 neighbor 189.53.11.178 activate
 neighbor 189.53.11.178 send-community both
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf DIASBRANCO:151552
 redistribute connected route-map SBC_CLIENTE
 redistribute static
 neighbor 200.253.132.198 remote-as 65169
 neighbor 200.253.132.198 description SLS/MULTI/08073
 neighbor 200.253.132.198 activate
 neighbor 200.253.132.198 send-community both
 maximum-paths eibgp 2
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf DCTIM:4283
 redistribute connected
 redistribute static
 neighbor 200.252.158.34 remote-as 64634
 neighbor 200.252.158.34 description SLS/IP/02452
 neighbor 200.252.158.34 activate
 neighbor 200.252.158.34 send-community both
 neighbor 200.252.158.34 route-map DCTIM_428320025215834 out
 neighbor 200.252.158.86 remote-as 64634
 neighbor 200.252.158.86 description SLS/IP/02453
 neighbor 200.252.158.86 activate
 neighbor 200.252.158.86 send-community both
 neighbor 200.252.158.86 route-map DCTIM_428320025215886 out
 neighbor 200.252.158.154 remote-as 64634
 neighbor 200.252.158.154 description ITZ/MULTI/26102
 neighbor 200.252.158.154 activate
 neighbor 200.252.158.154 send-community both
 maximum-paths eibgp 2
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf DALCAR:5317
 redistribute connected
 redistribute static
 neighbor 187.29.255.110 remote-as 65000
 neighbor 187.29.255.110 description SIS/MULTI/33202
 neighbor 187.29.255.110 activate
 neighbor 187.29.255.110 send-community both
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf CREFISA:5415
 redistribute connected
 redistribute static
 neighbor 189.52.211.26 remote-as 65000
 neighbor 189.52.211.26 description SLS/MULTI/54344
 neighbor 189.52.211.26 activate
 neighbor 189.52.211.26 send-community both
 neighbor 189.52.211.162 remote-as 65000
 neighbor 189.52.211.162 description SLS/IP/04669
 neighbor 189.52.211.162 activate
 neighbor 189.52.211.162 send-community both
 neighbor 189.53.11.14 remote-as 65000
 neighbor 189.53.11.14 description ITI/IP/00129
 neighbor 189.53.11.14 activate
 neighbor 189.53.11.14 send-community both
 neighbor 200.179.212.34 remote-as 65000
 neighbor 200.179.212.34 description SJE/MULTI/55828
 neighbor 200.179.212.34 activate
 neighbor 200.179.212.34 send-community both
 neighbor 200.252.158.6 remote-as 65000
 neighbor 200.252.158.6 description SLS/MULTI/55327
 neighbor 200.252.158.6 activate
 neighbor 200.252.158.6 send-community both
 maximum-paths eibgp 3
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf CREDISHOP:1661
 redistribute connected
 redistribute static
 neighbor 187.29.255.50 remote-as 64518
 neighbor 187.29.255.50 description PDZ/MULTI/28860
 neighbor 187.29.255.50 activate
 neighbor 187.29.255.50 send-community both
 neighbor 200.249.169.134 remote-as 64518
 neighbor 200.249.169.134 description PHE/MULTI/29659
 neighbor 200.249.169.134 activate
 neighbor 200.249.169.134 send-community both
 neighbor 201.73.255.250 remote-as 64518
 neighbor 201.73.255.250 description SLS/MULTI/24717
 neighbor 201.73.255.250 activate
 neighbor 201.73.255.250 send-community both
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf COSAN:4132
 redistribute connected route-map SBC_CLIENTE
 redistribute static
 neighbor 200.252.158.54 remote-as 65463
 neighbor 200.252.158.54 description SLS/MULTI/39086
 neighbor 200.252.158.54 activate
 neighbor 200.252.158.54 send-community both
 neighbor 200.252.158.54 route-map COSAN_413220025215854 out
 maximum-paths eibgp 2
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf CORREIOS_LOTE2:3151
 redistribute connected
 redistribute static
 maximum-paths eibgp 4
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf CORREIOS_2016:155714
 redistribute connected route-map RM_ECT_CONNECTED
 redistribute static
 neighbor 172.18.67.34 remote-as 65001
 neighbor 172.18.67.34 description SLS/IP/06102
 neighbor 172.18.67.34 password 7 123B22272D2E2F30
 neighbor 172.18.67.34 activate
 neighbor 172.18.67.34 send-community both
 neighbor 172.18.72.226 remote-as 65001
 neighbor 172.18.72.226 description SLS/IP/06049
 neighbor 172.18.72.226 password 7 03267C3B392A0278
 neighbor 172.18.72.226 activate
 neighbor 172.18.72.226 send-community both
 neighbor 172.18.75.10 remote-as 65001
 neighbor 172.18.75.10 description SLS/IP/06096
 neighbor 172.18.75.10 password 7 002634363B7E2832
 neighbor 172.18.75.10 activate
 neighbor 172.18.75.10 send-community both
 neighbor 172.18.75.58 remote-as 65001
 neighbor 172.18.75.58 description SLS/IP/06105
 neighbor 172.18.75.58 password 7 03267C3B392A0278
 neighbor 172.18.75.58 activate
 neighbor 172.18.75.58 send-community both
 neighbor 172.18.75.110 remote-as 65001
 neighbor 172.18.75.110 description SLS/IP/06036
 neighbor 172.18.75.110 password 7 106C2E293A32313F
 neighbor 172.18.75.110 activate
 neighbor 172.18.75.110 send-community both
 neighbor 172.18.87.154 remote-as 65001
 neighbor 172.18.87.154 description SLS/IP/06040
 neighbor 172.18.87.154 password 7 123B22272D2E2F30
 neighbor 172.18.87.154 activate
 neighbor 172.18.87.154 send-community both
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf CONAB:4162
 redistribute connected
 redistribute static
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf COMAER_NEW:5485
 redistribute connected
 redistribute static
 neighbor 189.52.211.178 remote-as 65000
 neighbor 189.52.211.178 description ALN/MULTI/57051
 neighbor 189.52.211.178 activate
 neighbor 189.52.211.178 send-community both
 neighbor 200.172.12.210 remote-as 65000
 neighbor 200.172.12.210 description SLS/IP/05485
 neighbor 200.172.12.210 activate
 neighbor 200.172.12.210 send-community both
 neighbor 200.172.12.210 route-map COMAER_NEW_548520017212210 out
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf COLOMBO:3147
 redistribute connected route-map SBC_CLIENTE
 redistribute static
 neighbor 189.53.246.226 remote-as 65309
 neighbor 189.53.246.226 description SLS/MULTI/39898
 neighbor 189.53.246.226 activate
 neighbor 189.53.246.226 send-community both
 maximum-paths eibgp 2
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf CNI:7529
 redistribute connected
 redistribute static
 neighbor 189.52.211.46 remote-as 65000
 neighbor 189.52.211.46 description SLS/IP/06154
 neighbor 189.52.211.46 activate
 neighbor 189.52.211.46 send-community both
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf CITELUZ:1201
 redistribute connected
 redistribute static
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf CINEMAS:1063
 redistribute connected
 redistribute static
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf CEMAR:3468
 redistribute connected
 redistribute static
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf CBE:4734
 redistribute connected
 redistribute static
 neighbor 189.43.197.198 remote-as 64962
 neighbor 189.43.197.198 description ITZ/MULTI/24059
 neighbor 189.43.197.198 activate
 neighbor 189.43.197.198 send-community both
 maximum-paths eibgp 2
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf CARGLASS:7528
 redistribute connected
 redistribute static
 neighbor 189.53.11.134 remote-as 65000
 neighbor 189.53.11.134 description SLS/IP/06152
 neighbor 189.53.11.134 activate
 neighbor 189.53.11.134 send-community both
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf BYTENNIS:3608
 redistribute connected route-map SBC_CLIENTE
 redistribute static
 neighbor 200.252.158.50 remote-as 64732
 neighbor 200.252.158.50 description ITZ/MULTI/45298
 neighbor 200.252.158.50 activate
 neighbor 200.252.158.50 send-community both
 maximum-paths eibgp 2
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf BRINKS:1177
 redistribute connected
 redistribute static
 neighbor 189.52.211.154 remote-as 65373
 neighbor 189.52.211.154 description SLS/IP/06021
 neighbor 189.52.211.154 activate
 neighbor 189.52.211.154 send-community both
 maximum-paths eibgp 2
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf BRASPRESS:4733
 redistribute connected
 redistribute static
 neighbor 187.28.122.54 remote-as 64981
 neighbor 187.28.122.54 description SLS/MULTI/24755
 neighbor 187.28.122.54 activate
 neighbor 187.28.122.54 send-community both
 maximum-paths eibgp 2
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf BNB:5075
 redistribute connected
 redistribute static
 neighbor 187.29.255.98 remote-as 65000
 neighbor 187.29.255.98 description PDZ/IP/00134
 neighbor 187.29.255.98 activate
 neighbor 187.29.255.98 send-community both
 neighbor 189.53.11.18 remote-as 65000
 neighbor 189.53.11.18 description ITI/IP/00125
 neighbor 189.53.11.18 activate
 neighbor 189.53.11.18 send-community both
 neighbor 189.53.11.162 remote-as 65000
 neighbor 189.53.11.162 description SLS/IP/05487
 neighbor 189.53.11.162 activate
 neighbor 189.53.11.162 send-community both
 neighbor 189.53.11.234 remote-as 65000
 neighbor 189.53.11.234 description SLS/MULTI/51400
 neighbor 189.53.11.234 activate
 neighbor 189.53.11.234 send-community both
 maximum-paths eibgp 2
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf BIGBEN:2777
 redistribute connected
 redistribute static
 maximum-paths eibgp 2
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf BCP_NO:4026
 redistribute connected
 redistribute static
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf BCOPANAMERICANO:5041
 redistribute connected
 redistribute static
 neighbor 200.179.211.2 remote-as 65000
 neighbor 200.179.211.2 description SLS/IP/05712
 neighbor 200.179.211.2 activate
 neighbor 200.179.211.2 send-community both
 maximum-paths eibgp 2
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf BCOBONSUCESSO:2834
 redistribute connected route-map SBC_CLIENTE
 redistribute static
 maximum-paths eibgp 2
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf BCOAM:4783
 redistribute connected
 redistribute static
 neighbor 189.43.197.22 remote-as 65330
 neighbor 189.43.197.22 description SLS/MULTI/24852
 neighbor 189.43.197.22 activate
 neighbor 189.43.197.22 send-community both
 neighbor 200.242.226.30 remote-as 65330
 neighbor 200.242.226.30 description COR/MULTI/27663
 neighbor 200.242.226.30 activate
 neighbor 200.242.226.30 send-community both
 maximum-paths eibgp 2
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf BBRASIL_PAE:7041
 redistribute connected
 redistribute static
 neighbor 10.7.115.70 remote-as 65524
 neighbor 10.7.115.70 description ITZ/IP/01174
 neighbor 10.7.115.70 timers 5 15
 neighbor 10.7.115.70 activate
 neighbor 10.7.115.70 send-community both
 neighbor 10.7.115.70 next-hop-self
 neighbor 10.7.115.70 as-override
 neighbor 10.7.115.70 route-map BBRASIL_PAE_CE_OUT out
 neighbor 10.7.142.46 remote-as 65524
 neighbor 10.7.142.46 description SLS/IP/04731
 neighbor 10.7.142.46 timers 5 15
 neighbor 10.7.142.46 activate
 neighbor 10.7.142.46 send-community both
 neighbor 10.7.142.46 next-hop-self
 neighbor 10.7.142.46 as-override
 neighbor 10.7.142.46 route-map BBRASIL_PAE_CE_OUT out
 neighbor 10.247.76.2 remote-as 65521
 neighbor 10.247.76.2 description ITZ/IP/01281
 neighbor 10.247.76.2 shutdown
 neighbor 10.247.76.2 timers 5 15
 neighbor 10.247.76.2 activate
 neighbor 10.247.76.2 send-community both
 neighbor 10.247.76.2 next-hop-self
 neighbor 10.247.76.2 as-override
 neighbor 10.247.76.2 route-map BBRASIL_CE_OUT out
 neighbor 10.251.49.38 remote-as 65524
 neighbor 10.251.49.38 description CHI/IP/00123
 neighbor 10.251.49.38 timers 5 15
 neighbor 10.251.49.38 activate
 neighbor 10.251.49.38 send-community both
 neighbor 10.251.49.38 next-hop-self
 neighbor 10.251.49.38 as-override
 neighbor 10.251.49.38 route-map BBRASIL_PAE_CE_OUT out
 neighbor 10.251.60.158 remote-as 65524
 neighbor 10.251.60.158 description ITZ/IP/01284
 neighbor 10.251.60.158 timers 5 15
 neighbor 10.251.60.158 activate
 neighbor 10.251.60.158 send-community both
 neighbor 10.251.60.158 next-hop-self
 neighbor 10.251.60.158 as-override
 neighbor 10.251.60.158 route-map BBRASIL_PAE_CE_OUT out
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf BBRASIL_NAC:7399
 redistribute connected
 redistribute static
 neighbor 10.66.201.54 remote-as 65321
 neighbor 10.66.201.54 description SLS/IP/06066
 neighbor 10.66.201.54 timers 10 30
 neighbor 10.66.201.54 activate
 neighbor 10.66.201.54 send-community both
 neighbor 10.66.201.54 route-map BB-LT2-NAC-REMOTOS-IN in
 neighbor 10.66.201.54 route-map BB-LT2-NAC-REMOTOS-OUT out
 maximum-paths eibgp 2
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf ANVISA:4356
 redistribute connected
 redistribute static
 neighbor 189.53.246.114 remote-as 65001
 neighbor 189.53.246.114 description SLS/IP/01795
 neighbor 189.53.246.114 activate
 neighbor 189.53.246.114 send-community both
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf ANTAQ:7637
 redistribute connected
 redistribute static
 neighbor 189.52.211.90 remote-as 65000
 neighbor 189.52.211.90 description SLS/IP/06209
 neighbor 189.52.211.90 activate
 neighbor 189.52.211.90 send-community both
 maximum-paths eibgp 2
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf ALECOMBUST:1639
 redistribute connected route-map SBC_CLIENTE
 redistribute static
 neighbor 189.23.28.158 remote-as 65282
 neighbor 189.23.28.158 description SLS/IP/00696
 neighbor 189.23.28.158 activate
 neighbor 189.23.28.158 send-community both
 neighbor 189.23.28.158 as-override
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf ACCOR:5074
 redistribute connected route-map LATAM_TELMEX_285
 redistribute static route-map LATAM_TELMEX_285
 neighbor 200.179.211.98 remote-as 65194
 neighbor 200.179.211.98 description BBL/IP/00217
 neighbor 200.179.211.98 activate
 neighbor 200.179.211.98 send-community both
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf ABRROAMING:1249
 redistribute connected
 redistribute static
 neighbor 187.28.122.62 remote-as 64619
 neighbor 187.28.122.62 description SLS/IP/03173
 neighbor 187.28.122.62 activate
 neighbor 187.28.122.62 send-community both
 maximum-paths eibgp 2
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf ABNAMRO:2803
 redistribute connected
 redistribute static
 neighbor 187.29.255.138 remote-as 65069
 neighbor 187.29.255.138 description SLS/MULTI/34760
 neighbor 187.29.255.138 timers 20 60
 neighbor 187.29.255.138 activate
 neighbor 187.29.255.138 send-community both
 neighbor 187.29.255.138 default-originate route-map ABNAMRO_DEFAULT
 neighbor 187.29.255.138 advertisement-interval 1
 neighbor 187.29.255.138 route-map NO-ROUTES_OUT out
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
ip route 187.28.0.0 255.255.0.0 Null0 tag 200
ip route 187.28.42.0 255.255.254.0 Multilink94 189.53.246.222
ip route 187.29.0.0 255.255.0.0 Null0 tag 200
ip route 187.30.0.0 255.255.0.0 Null0 tag 200
ip route 189.2.0.0 255.255.0.0 Null0 tag 200
ip route 189.3.0.0 255.255.0.0 Null0 tag 200
ip route 189.3.25.144 255.255.255.240 Multilink28968 200.252.158.222
ip route 189.3.25.224 255.255.255.240 Multilink29022 189.52.166.174
ip route 189.3.26.0 255.255.255.192 FastEthernet6/1/2 200.252.158.190
ip route 189.3.101.144 255.255.255.240 Serial6/2/0.1/3/1/1:0
ip route 189.3.102.96 255.255.255.240 Serial7/2/0.1/1/3/2:0
ip route 189.3.154.0 255.255.255.240 GigabitEthernet1/1/4.76 189.53.11.118
ip route 189.3.154.64 255.255.255.240 Serial6/2/0.1/1/3/3:0
ip route 189.3.154.80 255.255.255.240 FastEthernet6/1/4 200.172.11.134
ip route 189.3.154.192 255.255.255.192 FastEthernet6/1/2 200.252.158.190
ip route 189.3.221.96 255.255.255.248 Serial6/2/0.1/2/2/2:1
ip route 189.16.0.0 255.255.0.0 Null0 tag 200
ip route 189.16.241.224 255.255.255.240 Serial6/2/0.1/2/2/1:2
ip route 189.16.241.240 255.255.255.240 Multilink28990 187.29.255.134
ip route 189.16.248.0 255.255.255.240 FastEthernet6/1/2 200.252.158.190
ip route 189.16.255.128 255.255.255.240 Serial7/1/0.1/2/6/3:1
ip route 189.17.0.0 255.255.0.0 Null0 tag 200
ip route 189.17.22.144 255.255.255.240 GigabitEthernet1/1/4.34 189.53.11.66
ip route 189.17.66.32 255.255.255.240 Multilink28985 189.52.211.226
ip route 189.17.173.208 255.255.255.248 GigabitEthernet1/1/1.39 200.252.158.98
ip route 189.17.228.96 255.255.255.240 Serial6/2/0.1/1/6/1:0
ip route 189.22.0.0 255.255.0.0 Null0 tag 200
ip route 189.23.0.0 255.255.0.0 Null0 tag 200
ip route 189.23.27.16 255.255.255.240 GigabitEthernet1/1/4.20 189.52.211.126
ip route 189.23.232.208 255.255.255.240 GigabitEthernet1/1/4.51 200.252.158.186
ip route 189.42.0.0 255.255.0.0 Null0 tag 200
ip route 189.42.206.0 255.255.255.240 Multilink291063 200.179.211.134
ip route 189.43.0.0 255.255.0.0 Null0 tag 200
ip route 189.43.17.96 255.255.255.240 GigabitEthernet1/1/4.52 200.252.158.162
ip route 189.43.181.0 255.255.255.240 Serial1/0/0.1/2/3/2:0 200.252.158.78
ip route 189.52.0.0 255.255.0.0 Null0 tag 200
ip route 189.52.170.192 255.255.255.240 GigabitEthernet1/1/1.11 187.29.255.250
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
ip route 200.166.99.48 255.255.255.240 Multilink194 201.73.255.102
ip route 200.166.99.80 255.255.255.240 Serial6/2/0.1/1/2/2:0
ip route 200.167.0.0 255.255.0.0 Null0 tag 200
ip route 200.167.66.0 255.255.255.128 FastEthernet6/0/2 200.249.162.194
ip route 200.167.66.128 255.255.255.192 FastEthernet6/0/2 200.249.162.193
ip route 200.172.0.0 255.255.0.0 Null0 tag 200
ip route 200.172.84.0 255.255.255.128 Multilink28970 200.249.174.130
ip route 200.172.203.208 255.255.255.240 GigabitEthernet1/1/1.42 200.252.158.66
ip route 200.174.0.0 255.255.0.0 Null0 tag 200
ip route 200.178.0.0 255.255.0.0 Null0 tag 200
ip route 200.179.0.0 255.255.0.0 Null0 tag 200
ip route 200.182.0.0 255.255.0.0 Null0 tag 200
ip route 200.183.0.0 255.255.0.0 Null0 tag 200
ip route 200.191.0.0 255.255.0.0 Null0 tag 200
ip route 200.200.0.0 255.255.0.0 Null0 tag 200
ip route 200.208.0.0 255.255.0.0 Null0 tag 200
ip route 200.209.0.0 255.255.0.0 Null0 tag 200
ip route 200.209.253.128 255.255.255.224 FastEthernet6/0/2 200.249.162.193
ip route 200.209.253.160 255.255.255.240 FastEthernet6/0/2 200.249.162.194
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
ip route 200.241.83.0 255.255.255.0 FastEthernet6/0/2 200.249.162.193
ip route 200.242.0.0 255.255.0.0 Null0 tag 200
ip route 200.243.0.0 255.255.0.0 Null0 tag 200
ip route 200.244.0.0 255.255.0.0 Null0 tag 200
ip route 200.245.0.0 255.255.0.0 Null0 tag 200
ip route 200.246.0.0 255.255.0.0 Null0 tag 200
ip route 200.247.0.0 255.255.0.0 Null0 tag 200
ip route 200.248.0.0 255.255.0.0 Null0 tag 200
ip route 200.249.0.0 255.255.0.0 Null0 tag 200
ip route 200.249.82.0 255.255.255.0 FastEthernet6/0/2 200.249.162.194
ip route 200.249.83.0 255.255.255.0 FastEthernet6/0/2 200.249.162.194
ip route 200.249.149.0 255.255.255.128 FastEthernet6/0/2 200.249.145.126
ip route 200.249.157.0 255.255.255.0 FastEthernet6/0/2 200.249.162.193
ip route 200.249.162.225 255.255.255.255 FastEthernet6/0/2 200.249.162.193
ip route 200.249.162.226 255.255.255.255 FastEthernet6/0/2 200.249.162.194
ip route 200.249.162.227 255.255.255.255 FastEthernet6/0/2 200.249.162.195
ip route 200.249.173.0 255.255.255.0 FastEthernet6/0/2 200.249.162.195
ip route 200.250.0.0 255.255.0.0 Null0 tag 200
ip route 200.251.0.0 255.255.0.0 Null0 tag 200
ip route 200.252.0.0 255.255.0.0 Null0 tag 200
ip route 200.253.0.0 255.255.0.0 Null0 tag 200
ip route 200.253.157.32 255.255.255.248 Serial6/2/0.1/2/2/1:1
ip route 200.253.159.64 255.255.255.240 Multilink28992 200.249.174.166
ip route 200.254.0.0 255.255.0.0 Null0 tag 200
ip route 200.255.0.0 255.255.0.0 Null0 tag 200
ip route 200.255.142.225 255.255.255.255 FastEthernet6/0/2 200.249.162.193
ip route 200.255.142.226 255.255.255.255 FastEthernet6/0/2 200.249.162.194
ip route 201.30.0.0 255.255.0.0 Null0 tag 200
ip route 201.30.38.0 255.255.255.0 Multilink194 201.73.255.102
ip route 201.30.112.0 255.255.255.128 Serial7/1/0.1/1/3/1:0 200.249.175.42
ip route 201.31.0.0 255.255.0.0 Null0 tag 200
ip route 201.38.0.0 255.255.0.0 Null0 tag 200
ip route 201.38.47.32 255.255.255.240 Serial1/3/0.1/1/7/3:0
ip route 201.38.247.0 255.255.255.0 Multilink94 189.53.246.222
ip route 201.39.0.0 255.255.0.0 Null0 tag 200
ip route 201.39.89.112 255.255.255.240 Multilink28999 187.29.255.222
ip route 201.44.0.0 255.255.0.0 Null0 tag 200
ip route 201.45.0.0 255.255.0.0 Null0 tag 200
ip route 201.56.0.0 255.255.0.0 Null0 tag 200
ip route 201.57.0.0 255.255.0.0 Null0 tag 200
ip route 201.57.171.80 255.255.255.248 Serial6/2/0.1/1/7/3:1
ip route 201.57.171.160 255.255.255.240 GigabitEthernet1/1/1.93 189.52.211.106
ip route 201.64.0.0 255.255.0.0 Null0 tag 200
ip route 201.65.0.0 255.255.0.0 Null0 tag 200
ip route 201.65.77.64 255.255.255.240 Multilink29016 189.53.246.198
ip route 201.65.121.32 255.255.255.240 Serial7/1/0.1/2/6/3:0
ip route 201.65.121.64 255.255.255.240 Multilink291051 200.179.211.142
ip route 201.72.0.0 255.255.0.0 Null0 tag 200
ip route 201.73.0.0 255.255.0.0 Null0 tag 200
ip route 201.73.61.168 255.255.255.248 Serial6/2/0.1/1/6/2:2 189.52.211.58
ip route 201.73.194.16 255.255.255.240 Serial7/2/0.1/1/5/2:0
ip route 201.73.204.0 255.255.255.240 GigabitEthernet1/1/4.9 187.28.240.2
ip route 201.90.0.0 255.255.0.0 Null0 tag 200
ip route 203.0.113.0 255.255.255.0 Null0 tag 200
ip route vrf BCOBONSUCESSO:2834 10.17.75.0 255.255.255.0 Serial1/3/0.1/2/1/2:1.1 189.53.246.138
ip route vrf BCP_NO:4026 10.91.194.0 255.255.255.128 Serial7/1/0.1/3/7/2:0 200.252.158.22
ip route vrf TECBAN:1221 10.250.97.56 255.255.255.248 GigabitEthernet1/1/4.19 189.53.11.250
ip route vrf TECBAN:1221 10.250.99.0 255.255.255.248 Serial7/2/0.1/3/2/1:2.1 189.52.211.78
ip route vrf TECBAN:1221 10.250.112.0 255.255.255.248 GigabitEthernet1/1/4.49 189.53.11.150
ip route vrf CEMAR:3468 172.16.1.0 255.255.255.248 Multilink168 200.252.158.146
ip route vrf CEMAR:3468 172.28.22.0 255.255.255.0 Serial7/2/0.1/3/3/1:7.1 189.23.28.126
ip route vrf CINEMAS:1063 10.8.118.0 255.255.255.0 Serial6/2/0.1/2/6/3:1.1 189.53.11.86
ip route vrf FUNASA:3094 10.98.30.0 255.255.255.192 Serial6/3/0.1/2/1/3:0.1 189.16.250.34
ip route vrf REALIP_CLIENTE:5581 187.29.255.4 255.255.255.252 GigabitEthernet1/1/4.404 189.53.11.206
ip route vrf REALIP_CLIENTE:5581 187.29.255.40 255.255.255.252 GigabitEthernet1/1/1.71 189.52.211.114
ip route vrf REALIP_CLIENTE:5581 187.29.255.60 255.255.255.252 GigabitEthernet1/1/1.100 189.53.11.26
ip route vrf REALIP_CLIENTE:5581 187.29.255.68 255.255.255.252 GigabitEthernet1/1/4.14 189.52.211.146
ip route vrf REALIP_CLIENTE:5581 187.29.255.100 255.255.255.252 GigabitEthernet1/1/4.640 187.29.255.102
ip route vrf REALIP_CLIENTE:5581 187.29.255.172 255.255.255.252 GigabitEthernet1/1/1.6 189.53.11.254
ip route vrf REALIP_CLIENTE:5581 187.29.255.184 255.255.255.252 GigabitEthernet1/1/4.30 189.53.11.214
ip route vrf REALIP_CLIENTE:5581 187.29.255.192 255.255.255.252 GigabitEthernet1/1/1.27 189.52.211.210
ip route vrf REALIP_CLIENTE:5581 187.29.255.204 255.255.255.252 GigabitEthernet1/1/4.80 189.53.246.218
ip route vrf REALIP_CLIENTE:5581 189.52.211.100 255.255.255.252 GigabitEthernet1/1/1.53 189.53.11.158
ip route vrf REALIP_CLIENTE:5581 189.52.211.120 255.255.255.252 GigabitEthernet1/1/4.28 189.53.11.166
ip route vrf REALIP_CLIENTE:5581 189.52.211.132 255.255.255.252 GigabitEthernet1/1/4.36 189.53.11.142
ip route vrf REALIP_CLIENTE:5581 189.52.211.200 255.255.255.252 GigabitEthernet1/1/4.3 189.52.211.202
ip route vrf REALIP_CLIENTE:5581 189.52.211.228 255.255.255.252 GigabitEthernet1/1/4.22 189.52.211.142
ip route vrf REALIP_CLIENTE:5581 189.53.11.0 255.255.255.252 GigabitEthernet1/1/4.21 189.52.211.74
ip route vrf REALIP_CLIENTE:5581 189.53.11.56 255.255.255.252 GigabitEthernet1/1/4.12 189.52.211.22
ip route vrf REALIP_CLIENTE:5581 189.53.11.208 255.255.255.252 GigabitEthernet1/1/4.44 189.53.11.126
ip route vrf REALIP_CLIENTE:5581 200.179.211.4 255.255.255.252 GigabitEthernet1/1/4.502 200.179.211.66
ip route vrf REALIP_CLIENTE:5581 200.179.211.92 255.255.255.252 GigabitEthernet1/1/4.638 200.179.211.82
ip route vrf REALIP_CLIENTE:5581 200.179.211.196 255.255.255.252 GigabitEthernet1/1/1.301 200.179.211.130
ip route vrf REALIP_CLIENTE:5581 200.179.211.232 255.255.255.252 GigabitEthernet1/1/4.25 200.179.211.70
ip route vrf REALIP_CLIENTE:5581 200.252.158.12 255.255.255.252 GigabitEthernet1/1/1.64 189.52.211.198
ip route vrf REALIP_CLIENTE:5581 200.252.158.60 255.255.255.252 GigabitEthernet1/1/4.24 200.252.158.42
ip route vrf REALIP_CLIENTE:5581 200.252.158.92 255.255.255.252 GigabitEthernet1/1/4.38 200.252.158.38
ip route vrf REALIP_CLIENTE:5581 200.252.158.104 255.255.255.252 GigabitEthernet1/1/4.46 189.52.211.250
ip route vrf REALIP_CLIENTE:5581 200.252.158.148 255.255.255.252 GigabitEthernet1/1/4.50 200.252.158.142
ip route vrf REDEVIP_BLD_MLPPP:3799 0.0.0.0 0.0.0.0 200.230.224.25 global
ip route vrf REDEVIP_BLD_MLPPP:3799 0.0.0.0 0.0.0.0 200.230.224.45 global
ip route vrf REDEVIP_BLD_MLPPP:3799 0.0.0.0 0.0.0.0 200.244.41.18 global
ip route vrf REDEVIP_BLD_MLPPP:3799 0.0.0.0 0.0.0.0 200.244.41.23 global
ip route vrf REDEVIP_BLD_MLPPP:3799 189.3.25.224 255.255.255.240 Multilink29022 189.52.166.174
ip route vrf SET_MA:3377 192.168.40.0 255.255.255.0 Serial7/2/0.1/3/2/1:3 189.43.120.70
ip route vrf SET_MA:3377 192.168.90.0 255.255.255.0 Serial7/2/0.1/3/5/2:5 189.43.120.98
ip route vrf SET_MA:3377 192.168.121.0 255.255.255.0 Serial1/0/0.1/1/6/3:3 189.43.120.114
ip route vrf SUPERMMACIEL:3754 192.168.5.0 255.255.255.0 Multilink29014 189.43.120.30
ip route vrf TECELAGEMAV:2642 10.250.93.0 255.255.255.0 Multilink291062 200.172.11.18
ip route vrf VESPER-1XRTT:3997 10.185.254.32 255.255.255.252 FastEthernet6/1/6 10.185.9.100
ip tacacs source-interface Loopback0
!
ip extcommunity-list 1 permit rt 4230:1170
ip extcommunity-list 2 permit rt 4230:1220
ip extcommunity-list 3 permit rt 4230:1545
ip extcommunity-list 4 permit rt 4230:1622
ip extcommunity-list 54 permit rt 4230:154151
ip extcommunity-list 55 permit rt 4230:4794
ip extcommunity-list 56 permit rt 4230:3564
ip extcommunity-list 57 permit rt 4230:154152
ip extcommunity-list 58 permit rt 28513:50172
ip extcommunity-list 59 permit rt 4230:1337
ip extcommunity-list 71 permit rt 4230:1904
ip extcommunity-list 72 permit rt 4230:1905
ip extcommunity-list 77 permit rt 4230:3772
ip extcommunity-list 78 permit rt 4230:3942
ip extcommunity-list 79 permit rt 4230:1337
ip extcommunity-list 80 permit rt 4230:1663
ip extcommunity-list 81 permit rt 4230:1912
ip extcommunity-list 82 permit rt 4230:4523
ip extcommunity-list 89 permit rt 4230:3961
ip extcommunity-list 111 permit RT:4230:2908
ip extcommunity-list 112 permit RT:4230:3449
ip extcommunity-list 113 permit RT:4230:1337
ip extcommunity-list 123 permit rt 4230:3519
ip extcommunity-list 124 permit rt 4230:5288
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
ip community-list 431 permit 65524:301 #VIP1
ip community-list 431 permit 65524:302 #VIP2
ip community-list 431 permit 65524:304 #
ip community-list 431 permit 65524:305 #
ip community-list 431 permit 65524:312 #
ip community-list 431 permit 65524:313 #Fonte Mcast
ip community-list 431 permit 65524:314 #Prefixos recebidos pelo Site Central
ip community-list 431 permit 65524:315 #NTP
ip community-list 431 permit 65524:316 #Loopback Tunnel para DR
ip community-list 431 permit 65524:317 #IP RP
ip community-list 431 permit 65524:318 #
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
ip community-list standard BERTIN_LIS permit 700:700
ip community-list standard FRIBOI_SPO permit 500:500
ip community-list standard TINET-BLACKHOLE permit 3257:2666
ip community-list standard INTELIQUENT-BLACKHOLE permit 3257:2666
ip community-list standard TELIASONERA-BLACKHOLE permit 1299:999
ip community-list standard RGSA permit 4230:103
ip community-list standard ALAGOANA permit 4230:102
ip community-list standard TATA-BLACKHOLE permit 64999:0
ip community-list standard POUPEX permit 4230:10
ip community-list standard POUPEX permit 4230:20
ip community-list standard BLACKHOLE-PE-NAC-CLIENTE permit 4230:10008
ip community-list standard BLACKHOLE-PE-NAC-EBT permit 4230:10009
ip community-list standard BLACKHOLE-PE-CLIENTE permit 4230:10006
ip community-list standard BLACKHOLE-PE-EBT permit 4230:10007
ip community-list expanded JUSTICA-VOIP permit 1224:323
ip community-list expanded ANVISA-VOIP permit 65001:4356
ip community-list expanded ANVISA-GER permit 65001:4357
ip community-list expanded VRF_DNPM_VOIP permit 323:323
ip community-list expanded TST10 permit 1024:23
ip community-list expanded TST11 permit 1024:324
ip community-list expanded TST12 permit 1024:323
ip community-list expanded TST13 permit 1024:200
ip community-list expanded DPRF-VOIP permit 1024:1323
ip community-list expanded DPRF-GERENCIA permit 1024:1001
ip community-list expanded ANTT-VOIP permit 1124:323
ip community-list expanded TST15 permit 1024:24
ip as-path access-list 1 permit ^$
ip as-path access-list 101 permit ^(28652_)+$
ip as-path access-list 102 permit ^(28246_)+$
ip as-path access-list 103 permit ^(28191_)+$
ip as-path access-list 104 permit ^(28246_)+$
ip as-path access-list 105 permit ^(262849_)+$
ip ospf name-lookup
ip pim ssm range 99
ip pim vrf BBRASIL_NAC:7399 rp-address 10.53.128.254 override
ip pim vrf BBRASIL_PAE:7041 rp-address 10.6.128.3 override
ip pim vrf CORREIOS_LOTE2:3151 rp-address 172.18.0.15 GROUP-CORREIOS_LOTE2 override
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
ip pim vrf SERPRO_SLS_RFB_01:5848 rp-address 10.2.29.61 SERPRO_SPO override
ip pim vrf SERPRO_SLS_RFB_01:5848 rp-address 10.2.28.61 SERPRO_CTA override
ip pim vrf SERPRO_SLS_RFB_01:5848 rp-address 10.51.0.254 SERPRO_BSA override
ip pim vrf SERPRO_SLS_RFB_01:5848 rp-address 10.2.41.61 SERPRO_BLM override
ip pim vrf SERPRO_SLS_RFB_01:5848 rp-address 10.2.43.61 SERPRO_FLA override
ip pim vrf SERPRO_SLS_RFB_01:5848 rp-address 10.6.24.225 SERPRO_RCE override
ip pim vrf SERPRO_SLS_RFB_01:5848 rp-address 10.55.0.56 SERPRO_SDR override
ip pim vrf SERPRO_SLS_RFB_01:5848 rp-address 10.2.56.61 SERPRO_BHE override
ip pim vrf SERPRO_SLS_RFB_01:5848 rp-address 10.2.44.61 SERPRO_RJO override
ip pim vrf SERPRO_SLS_RFB_01:5848 rp-address 10.2.27.61 SERPRO_PAE override
ip pim vrf SERPRO_SLS_RFB_02:5881 rp-address 10.2.29.61 SERPRO_SPO override
ip pim vrf SERPRO_SLS_RFB_02:5881 rp-address 10.2.28.61 SERPRO_CTA override
ip pim vrf SERPRO_SLS_RFB_02:5881 rp-address 10.51.0.254 SERPRO_BSA override
ip pim vrf SERPRO_SLS_RFB_02:5881 rp-address 10.2.41.61 SERPRO_BLM override
ip pim vrf SERPRO_SLS_RFB_02:5881 rp-address 10.2.43.61 SERPRO_FLA override
ip pim vrf SERPRO_SLS_RFB_02:5881 rp-address 10.6.24.225 SERPRO_RCE override
ip pim vrf SERPRO_SLS_RFB_02:5881 rp-address 10.55.0.56 SERPRO_SDR override
ip pim vrf SERPRO_SLS_RFB_02:5881 rp-address 10.2.56.61 SERPRO_BHE override
ip pim vrf SERPRO_SLS_RFB_02:5881 rp-address 10.2.44.61 SERPRO_RJO override
ip pim vrf SERPRO_SLS_RFB_02:5881 rp-address 10.2.27.61 SERPRO_PAE override
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
ip pim vrf SERPRO_SLS_RFB_04:5905 rp-address 10.2.29.61 SERPRO_SPO override
ip pim vrf SERPRO_SLS_RFB_04:5905 rp-address 10.2.28.61 SERPRO_CTA override
ip pim vrf SERPRO_SLS_RFB_04:5905 rp-address 10.51.0.254 SERPRO_BSA override
ip pim vrf SERPRO_SLS_RFB_04:5905 rp-address 10.2.41.61 SERPRO_BLM override
ip pim vrf SERPRO_SLS_RFB_04:5905 rp-address 10.2.43.61 SERPRO_FLA override
ip pim vrf SERPRO_SLS_RFB_04:5905 rp-address 10.6.24.225 SERPRO_RCE override
ip pim vrf SERPRO_SLS_RFB_04:5905 rp-address 10.55.0.56 SERPRO_SDR override
ip pim vrf SERPRO_SLS_RFB_04:5905 rp-address 10.2.56.61 SERPRO_BHE override
ip pim vrf SERPRO_SLS_RFB_04:5905 rp-address 10.2.44.61 SERPRO_RJO override
ip pim vrf SERPRO_SLS_RFB_04:5905 rp-address 10.2.27.61 SERPRO_PAE override
ip pim vrf SERPRO_SLS_RFB_05:5917 rp-address 10.2.29.61 SERPRO_SPO override
ip pim vrf SERPRO_SLS_RFB_05:5917 rp-address 10.2.28.61 SERPRO_CTA override
ip pim vrf SERPRO_SLS_RFB_05:5917 rp-address 10.51.0.254 SERPRO_BSA override
ip pim vrf SERPRO_SLS_RFB_05:5917 rp-address 10.2.41.61 SERPRO_BLM override
ip pim vrf SERPRO_SLS_RFB_05:5917 rp-address 10.2.43.61 SERPRO_FLA override
ip pim vrf SERPRO_SLS_RFB_05:5917 rp-address 10.6.24.225 SERPRO_RCE override
ip pim vrf SERPRO_SLS_RFB_05:5917 rp-address 10.55.0.56 SERPRO_SDR override
ip pim vrf SERPRO_SLS_RFB_05:5917 rp-address 10.2.56.61 SERPRO_BHE override
ip pim vrf SERPRO_SLS_RFB_05:5917 rp-address 10.2.44.61 SERPRO_RJO override
ip pim vrf SERPRO_SLS_RFB_05:5917 rp-address 10.2.27.61 SERPRO_PAE override
ip pim vrf SERPRO_SLS_RFB_06:5918 rp-address 10.2.29.61 SERPRO_SPO override
ip pim vrf SERPRO_SLS_RFB_06:5918 rp-address 10.2.28.61 SERPRO_CTA override
ip pim vrf SERPRO_SLS_RFB_06:5918 rp-address 10.51.0.254 SERPRO_BSA override
ip pim vrf SERPRO_SLS_RFB_06:5918 rp-address 10.2.41.61 SERPRO_BLM override
ip pim vrf SERPRO_SLS_RFB_06:5918 rp-address 10.2.43.61 SERPRO_FLA override
ip pim vrf SERPRO_SLS_RFB_06:5918 rp-address 10.6.24.225 SERPRO_RCE override
ip pim vrf SERPRO_SLS_RFB_06:5918 rp-address 10.55.0.56 SERPRO_SDR override
ip pim vrf SERPRO_SLS_RFB_06:5918 rp-address 10.2.56.61 SERPRO_BHE override
ip pim vrf SERPRO_SLS_RFB_06:5918 rp-address 10.2.44.61 SERPRO_RJO override
ip pim vrf SERPRO_SLS_RFB_06:5918 rp-address 10.2.27.61 SERPRO_PAE override
ip pim vrf SERPRO_SLS_RFB_08:5907 rp-address 10.2.29.61 SERPRO_SPO override
ip pim vrf SERPRO_SLS_RFB_08:5907 rp-address 10.2.28.61 SERPRO_CTA override
ip pim vrf SERPRO_SLS_RFB_08:5907 rp-address 10.51.0.254 SERPRO_BSA override
ip pim vrf SERPRO_SLS_RFB_08:5907 rp-address 10.2.41.61 SERPRO_BLM override
ip pim vrf SERPRO_SLS_RFB_08:5907 rp-address 10.2.43.61 SERPRO_FLA override
ip pim vrf SERPRO_SLS_RFB_08:5907 rp-address 10.6.24.225 SERPRO_RCE override
ip pim vrf SERPRO_SLS_RFB_08:5907 rp-address 10.55.0.56 SERPRO_SDR override
ip pim vrf SERPRO_SLS_RFB_08:5907 rp-address 10.2.56.61 SERPRO_BHE override
ip pim vrf SERPRO_SLS_RFB_08:5907 rp-address 10.2.44.61 SERPRO_RJO override
ip pim vrf SERPRO_SLS_RFB_08:5907 rp-address 10.2.27.61 SERPRO_PAE override
ip pim vrf SERPRO_SLS_RFB_09:5913 rp-address 10.2.29.61 SERPRO_SPO override
ip pim vrf SERPRO_SLS_RFB_09:5913 rp-address 10.2.28.61 SERPRO_CTA override
ip pim vrf SERPRO_SLS_RFB_09:5913 rp-address 10.51.0.254 SERPRO_BSA override
ip pim vrf SERPRO_SLS_RFB_09:5913 rp-address 10.2.41.61 SERPRO_BLM override
ip pim vrf SERPRO_SLS_RFB_09:5913 rp-address 10.2.43.61 SERPRO_FLA override
ip pim vrf SERPRO_SLS_RFB_09:5913 rp-address 10.6.24.225 SERPRO_RCE override
ip pim vrf SERPRO_SLS_RFB_09:5913 rp-address 10.55.0.56 SERPRO_SDR override
ip pim vrf SERPRO_SLS_RFB_09:5913 rp-address 10.2.56.61 SERPRO_BHE override
ip pim vrf SERPRO_SLS_RFB_09:5913 rp-address 10.2.44.61 SERPRO_RJO override
ip pim vrf SERPRO_SLS_RFB_09:5913 rp-address 10.2.27.61 SERPRO_PAE override
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
ip pim vrf SERPRO_SLS_RFB_11:5911 rp-address 10.2.29.61 SERPRO_SPO override
ip pim vrf SERPRO_SLS_RFB_11:5911 rp-address 10.2.28.61 SERPRO_CTA override
ip pim vrf SERPRO_SLS_RFB_11:5911 rp-address 10.51.0.254 SERPRO_BSA override
ip pim vrf SERPRO_SLS_RFB_11:5911 rp-address 10.2.41.61 SERPRO_BLM override
ip pim vrf SERPRO_SLS_RFB_11:5911 rp-address 10.2.43.61 SERPRO_FLA override
ip pim vrf SERPRO_SLS_RFB_11:5911 rp-address 10.6.24.225 SERPRO_RCE override
ip pim vrf SERPRO_SLS_RFB_11:5911 rp-address 10.55.0.56 SERPRO_SDR override
ip pim vrf SERPRO_SLS_RFB_11:5911 rp-address 10.2.56.61 SERPRO_BHE override
ip pim vrf SERPRO_SLS_RFB_11:5911 rp-address 10.2.44.61 SERPRO_RJO override
ip pim vrf SERPRO_SLS_RFB_11:5911 rp-address 10.2.27.61 SERPRO_PAE override
ip pim vrf SERPRO_SLS_RFB_12:6238 rp-address 10.2.29.61 SERPRO_SPO override
ip pim vrf SERPRO_SLS_RFB_12:6238 rp-address 10.2.28.61 SERPRO_CTA override
ip pim vrf SERPRO_SLS_RFB_12:6238 rp-address 10.51.0.254 SERPRO_BSA override
ip pim vrf SERPRO_SLS_RFB_12:6238 rp-address 10.2.41.61 SERPRO_BLM override
ip pim vrf SERPRO_SLS_RFB_12:6238 rp-address 10.2.43.61 SERPRO_FLA override
ip pim vrf SERPRO_SLS_RFB_12:6238 rp-address 10.6.24.225 SERPRO_RCE override
ip pim vrf SERPRO_SLS_RFB_12:6238 rp-address 10.55.0.56 SERPRO_SDR override
ip pim vrf SERPRO_SLS_RFB_12:6238 rp-address 10.2.56.61 SERPRO_BHE override
ip pim vrf SERPRO_SLS_RFB_12:6238 rp-address 10.2.44.61 SERPRO_RJO override
ip pim vrf SERPRO_SLS_RFB_12:6238 rp-address 10.2.27.61 SERPRO_PAE override
ip pim vrf SESC:1916 rp-address 10.10.0.1 override
!
!
ip prefix-list ABNAMRO_DEFAULT seq 5 permit 10.0.0.0/8
!
ip prefix-list ANULA_DEFAULT seq 5 permit 0.0.0.0/0 ge 1
!
ip prefix-list CEMAR seq 5 permit 189.16.248.0/28 le 32
ip prefix-list CEMAR seq 10 deny 0.0.0.0/0 le 32
!
ip prefix-list POUPEX-NO-30 seq 5 permit 0.0.0.0/0 ge 30 le 30
!
ip prefix-list REDE_IMIFARMA seq 5 permit 0.0.0.0/0 le 32
!
ip prefix-list REDE_SERMA seq 5 permit 0.0.0.0/0
ip prefix-list REDE_SERMA seq 10 permit 172.31.5.250/32
ip prefix-list REDE_SERMA seq 15 permit 192.168.200.0/24
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
  permit 239.0.0.0 0.255.255.255
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
!
map-class frame-relay QC_AF_512K_7_N_0_11_16_0_4_61_512B
 frame-relay fragment 512
 service-policy input QPI_A_512K_7_N_0_11_16_0_4_61
 service-policy output QPO_A_512K_7_0_11_16_0_4_61
!
map-class frame-relay QC_BBONE_EXP_V1
 service-policy input QPI_BBONE_EXP_V1
!
map-class frame-relay QC_64K_BBrasil_PAE_IOS_V1
 frame-relay fragment 128
 service-policy input QPI_64K_BBrasil_PAE_IOS_V1
 service-policy output QPO_64K_BBrasil_PAE_IOS_V1
!
map-class frame-relay QC_AF_2048K_18_N_23_13_0_0_1_43_0B
 service-policy input QPI_A_2048K_18_N_23_13_0_0_1_43
 service-policy output QPO_A_2048K_18_23_13_0_0_1_43
!
map-class frame-relay QC_AF_1024K_25_N_0_40_0_0_2_32_0B
 service-policy input QPI_A_1024K_25_N_0_40_0_0_2_32
 service-policy output QPO_A_1024K_25_0_40_0_0_2_32
!
map-class frame-relay QC_AF_512K_18_N_0_29_0_0_4_48_0B
 service-policy input QPI_A_512K_18_N_0_29_0_0_4_48
 service-policy output QPO_A_512K_18_0_29_0_0_4_48
!
map-class frame-relay QOS_CLASS_512K_60K_60K_400K_512B
 frame-relay fragment 512
 service-policy input QOS_POLICY_IN_60K_400K
 service-policy output QOS_DTS_OUT_512K_60K_400K
!
map-class frame-relay QC_64_0_0_40_8_0_0_0B_GSR_V1
 service-policy input QPI_64_0_0_40_8_0_0_0B_GSR_V1
 service-policy output QDO_64_0_0_40_8_0_0_0B_GSR_V1
!
map-class frame-relay QOS_CLASS_A_F_512K_24K_24K_168K_512B
 frame-relay fragment 512
 service-policy input QOS_POLICY_IN_A_5P_32P
 service-policy output QOS_POLICY_OUT_A_5P_32P
!
map-class frame-relay QC_AF_2048K_13_N_23_38_0_0_1_24_0B
 service-policy input QPI_A_2048K_13_N_23_38_0_0_1_24
 service-policy output QPO_A_2048K_13_23_38_0_0_1_24
!
map-class frame-relay QC_AS_256K_42_C_0_7_0_0_7_43_0B
 service-policy input QDI_A_256K_42_0_7_0_0_7_43
 service-policy output QDO_A_256K_42_0_7_0_0_7_43
!
map-class frame-relay QC_AF_64K_38_N_0_7_0_0_13_39_128B
 frame-relay fragment 128
 service-policy input QPI_A_64K_38_N_0_7_0_0_13_39
 service-policy output QPO_A_64K_38_0_7_0_0_13_39
!
map-class frame-relay QC_AF_2048K_13_N_37_24_0_0_2_23_0B
 service-policy input QPI_A_2048K_13_N_37_24_0_0_2_23
 service-policy output QPO_A_2048K_13_37_24_0_0_2_23
!
map-class frame-relay QC_AF_2048K_13_N_13_13_11_0_4_45_0B
 service-policy input QPI_A_2048K_13_N_13_13_11_0_4_45
 service-policy output QPO_A_2048K_13_13_13_11_0_4_45
!
map-class frame-relay QC_AF_256K_25_N_0_41_0_0_7_25_320B
 frame-relay fragment 256
 service-policy input QPI_A_256K_25_N_0_41_0_0_7_25
 service-policy output QPO_A_256K_25_0_41_0_0_7_25
!
map-class frame-relay QC_AF_2048K_13_N_38_23_0_0_2_23_0B
 service-policy input QPI_A_2048K_13_N_38_23_0_0_2_23
 service-policy output QPO_A_2048K_13_38_23_0_0_2_23
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
access-list 50 permit 200.255.254.217
access-list 50 permit 200.255.254.218
access-list 50 permit 200.255.125.20
access-list 51 deny   200.218.65.32 0.0.0.31
access-list 51 deny   200.218.64.160 0.0.0.15
access-list 51 permit any
access-list 99 permit 239.232.0.0 0.0.255.255
access-list 99 permit 239.233.0.0 0.0.255.255
access-list 2121 permit udp host 189.2.31.197 eq 5060 any eq 5060
access-list 2121 permit udp any host 189.2.31.197 eq 5060
access-list 2121 permit udp host 201.65.159.69 eq 5060 any eq 5060
access-list 2121 permit udp any host 201.65.159.69 eq 5060
access-list 2121 permit udp host 201.57.200.213 eq 5060 any eq 5060
access-list 2121 permit udp any host 201.57.200.213 eq 5060
access-list 2121 permit udp host 201.31.161.245 eq 5060 any eq 5060
access-list 2121 permit udp any host 201.31.161.245 eq 5060
access-list 2121 permit udp host 200.248.230.197 eq 5060 any eq 5060
access-list 2121 permit udp any host 200.248.230.197 eq 5060
access-list 2121 permit udp host 200.182.77.37 eq 5060 any eq 5060
access-list 2121 permit udp any host 200.182.77.37 eq 5060
access-list 2121 permit udp host 200.248.249.69 eq 5060 any eq 5060
access-list 2121 permit udp any host 200.248.249.69 eq 5060
access-list 2122 permit udp any any eq snmp
access-list 2122 permit udp any any eq snmptrap
access-list 2122 permit tcp any any eq telnet
access-list 2123 permit udp any range 16384 32767 host 189.2.31.197 range 16384 32767
access-list 2123 permit udp host 189.2.31.197 range 16384 32767 any range 16384 32767
access-list 2123 permit udp any range 16384 32767 host 201.65.159.69 range 16384 32767
access-list 2123 permit udp host 201.65.159.69 range 16384 32767 any range 16384 32767
access-list 2123 permit udp any range 16384 32767 host 201.57.200.213 range 16384 32767
access-list 2123 permit udp host 201.57.200.213 range 16384 32767 any range 16384 32767
access-list 2123 permit udp any range 16384 32767 host 201.31.161.245 range 16384 32767
access-list 2123 permit udp host 201.31.161.245 range 16384 32767 any range 16384 32767
access-list 2123 permit udp any range 16384 32767 host 200.248.230.197 range 16384 32767
access-list 2123 permit udp host 200.248.230.197 range 16384 32767 any range 16384 32767
access-list 2123 permit udp any range 16384 32767 host 200.182.77.37 range 16384 32767
access-list 2123 permit udp host 200.182.77.37 range 16384 32767 any range 16384 32767
access-list 2123 permit udp any range 16384 32767 host 200.248.249.69 range 16384 32767
access-list 2123 permit udp host 200.248.249.69 range 16384 32767 any range 16384 32767
access-list 2300 permit tcp host 200.255.125.214 host 201.73.205.181 eq domain
access-list 2300 permit udp host 200.255.125.214 host 201.73.205.181 eq domain
access-list 2300 permit tcp host 200.255.253.241 host 201.73.205.181 eq domain
access-list 2300 permit udp host 200.255.253.241 host 201.73.205.181 eq domain
access-list 2300 permit ip any any
access-list 2301 permit tcp host 201.73.205.181 host 200.255.125.214 eq domain
access-list 2301 permit udp host 201.73.205.181 host 200.255.125.214 eq domain
access-list 2301 permit udp host 201.73.205.181 host 200.255.253.241 eq domain
access-list 2301 permit tcp host 201.73.205.181 host 200.255.253.241 eq domain
access-list 2301 permit ip any any
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
route-map PROCOMP_1032200253152146 permit 10
!
route-map CEMAR_IN permit 10
 match ip address prefix-list CEMAR
 set community 4230:4 4230:21 4230:198
!
route-map REALIP_CLIENTE permit 10
 set community 4230:5581
!
route-map ABNAMRO_280318949702 deny 10
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
route-map ABNAMRO_28031894291202 deny 10
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
route-map ABNAMRO_280318949706 deny 10
!
route-map BBRASIL_PAE_CE_OUT permit 10
 match community 431
!
route-map LATAM_TELMEX permit 10
 set community 28513:1281
!
route-map LIMA_TRANSP_4154200249169158 permit 10
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
route-map JUSTICA_EXPORT_MAP permit 20
 description marcacao de extcommunity para as loopbacks 323 aprendidas
 match community JUSTICA-VOIP
 set extcommunity rt  4230:152749
!
route-map JUSTICA_EXPORT_MAP permit 40
 description nao altera extcommunity para as demais rotas
!
route-map TAGUATUR_TAGUATINGUA permit 10
 match extcommunity 123
!
route-map TAGUATUR_TAGUATINGUA permit 20
 match ip address prefix-list ANULA_DEFAULT
 match extcommunity 124
!
route-map TAGUATUR_TAGUATINGUA permit 30
!
route-map EXATA_LOGISTICA_40791895324618 permit 10
!
route-map BBRASIL_CE_OUT permit 10
 match community 421 431
!
route-map TRT16_354017230166 permit 10
!
route-map JUSTICA_DEPEN_27121895311170 permit 10
!
route-map BBRASIL_PAE_704110247762 permit 10
 match community 421 431
!
route-map DPRF_NAC_REMOTO_42951721710170 permit 10
!
route-map RM_ECT_CONNECTED permit 10
 set community 0:2120
!
route-map BCOAM_4783200252158118 permit 10
!
route-map TVM_IN permit 10
 match as-path 101
 set community 4230:21 4230:30 4230:198 additive
!
route-map STATIC deny 5
 match tag 200
!
route-map STATIC permit 10
 match ip address 2550
 set origin igp
 set community 4230:50 4230:198
!
route-map ALCOA_14961723012966 permit 10
!
route-map FERTIMPORT_2_15397420025215862 permit 10
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
route-map BCOAM_4783200252158142 permit 10
!
route-map IMP_RENOSA_EXT deny 10
 match ip address prefix-list ANULA_DEFAULT
 match community RGSA
!
route-map IMP_RENOSA_EXT permit 20
!
route-map AVPROGRESSO_40161895324650 permit 10
!
route-map BCOAM_4783200252158114 permit 10
!
route-map GUANABARA_12791894312054 permit 10
!
route-map WIMAX_EBT_385517216082 permit 10
!
route-map AVPROGRESSO_40161895311254 permit 10
!
route-map CEMAR_EXT_EQUATORIAL permit 10
 match ip address prefix-list ROTA_DEFAULT
 set extcommunity rt  4230:3468
!
route-map CEMAR_EXT_EQUATORIAL permit 20
!
route-map EQUATORIAL_EXT_CEMAR permit 10
 match ip address prefix-list ROTA_DEFAULT
 set extcommunity rt  4230:6233
!
route-map EQUATORIAL_EXT_CEMAR permit 20
!
route-map JUPITER_IN permit 10
 match as-path 103
 set community 4230:21 4230:30 4230:198
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
route-map DPRF_NAC_REMOTO_42951721710578 permit 10
!
route-map CONAB_41621895324642 permit 10
!
route-map GUANABARA_12791894312050 permit 10
!
route-map AVPROGRESSO_40161895311198 permit 10
!
route-map ALCOA_1534531895311146 permit 10
!
route-map BCOAM_4783200252158122 permit 10
!
route-map TERM_MAR_CONTAINERS_4186189532466 permit 10
!
route-map LOJAS_GABRYELLA_444718953246250 permit 10
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
route-map BCOAM_478320025215890 permit 10
!
route-map CNJ_367518952211174 permit 10
!
route-map CAEMA_346318943197206 permit 10
!
route-map LATAM_TELMEX_285_SG permit 10
 set community 28513:285 28513:1281 additive
!
route-map CAEMA_346318943197210 permit 10
!
route-map CONAB_416218953246214 permit 10
!
route-map CESTE_3774189522116 permit 10
!
route-map DPU_370920025215870 permit 10
!
route-map LASA_SEDE_3277189531178 permit 10
!
route-map DCTIM_428320025215886 permit 10
!
route-map COSAN_413220025215854 permit 10
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
route-map TRT16_3540172301658 permit 10
!
route-map TRT16_3540172301622 permit 10
!
route-map TRT16_3540172301610 permit 10
!
route-map DCTIM_428320025215834 permit 10
!
route-map BB-LT2-NAC-REMOTOS-IN permit 10
 match community 442
!
route-map TRT16_3540172301614 permit 10
!
route-map CEMAR_346818953246234 permit 10
!
route-map DCTIM_428320025215874 permit 10
!
route-map BB-LT3-NAC-REMOTOS-IN permit 10
 match community 444
!
route-map TRT16_3540172301642 permit 10
!
route-map LASA_SEDE_327720024917194 permit 10
!
route-map ABNAMRO_2803189426894 deny 10
!
route-map PREVIDENCIA_SPOKES_15163510784470 permit 10
!
route-map PREVIDENCIA_SPOKES_15268110784438 permit 10
!
route-map ALVO_39461895311114 permit 10
!
route-map PAGUEMENOS_38221895221178 permit 10
!
route-map AGIP_1170200253152162 deny 10
!
route-map IMP_SERMA permit 10
 match ip address prefix-list REDE_SERMA
 match extcommunity 185
!
route-map IMP_SERMA permit 20
 match ip address prefix-list REDE_IMIFARMA
 match extcommunity 186
!
route-map PREVIDENCIA_SPOKES_15221610784414 permit 10
!
route-map ALVO_39461891625042 permit 10
!
route-map BERTIN_ROTA_DEFAULT permit 10
 match community BERTIN_LIS
 set local-preference 200
!
route-map BERTIN_ROTA_DEFAULT permit 20
 match community FRIBOI_SPO
 set local-preference 150
!
route-map BERTIN_ROTA_DEFAULT permit 30
!
route-map BLOCK-OUT-VRF permit 100
 match ip address BLOCK-OUT-VRF
!
route-map ANATEL_44381895324634 permit 10
!
route-map ABNAMRO_DEFAULT permit 10
 match ip address prefix-list ABNAMRO_DEFAULT
!
route-map BBRASIL_MARCA_SOO permit 10
 set extcommunity soo 65521:1
!
route-map UNIEURO_DEFAULT permit 10
 match community 4230:102
 set weight 100
!
route-map UNIEURO_DEFAULT permit 20
 match community 4230:101
 set weight 50
!
route-map UNIEURO_DEFAULT permit 30
!
route-map SIVNET_IN permit 10
 match as-path 104
 set community 4230:21 4230:30 4230:198
!
route-map PAGUEMENOS_38221895221198 permit 10
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
 set extcommunity rt  4230:153482
!
route-map DNPM_EXPORT_MAP permit 40
!
route-map SBC_CLIENTE permit 10
 set community 4230:3108
!
route-map SEBRAEMA_43021895324674 permit 10
!
route-map VOTORANTIM_45611895221198 permit 10
!
route-map IPIRANGA_1502911895311178 permit 10
!
route-map GAROTO_2955200249174118 permit 10
!
route-map SEBRAEMA_43021895324698 permit 10
!
route-map SET_COMMUNITY_GERENCIA_CQMR permit 10
 set community 4230:5110 additive
!
route-map SEBRAEMA_43021895324670 permit 10
!
route-map GERDAU_INT_15156310242512 permit 10
!
route-map TEXACO_45231895311182 permit 10
!
route-map TEXACO_4523200252158134 permit 10
!
route-map ANTT_EXPORT_MAP permit 20
 description marcacao de extcommunity para as loopbacks 323 aprendidas
 match community ANTT-VOIP
 set extcommunity rt  4230:152753
!
route-map ANTT_EXPORT_MAP permit 40
 description nao altera extcommunity para as demais rotas
!
route-map community-itau permit 10
 set community 100:100
!
route-map TIETEVEL_MATRIXDIST permit 10
 match ip address prefix-list ANULA_DEFAULT
 match extcommunity 77
!
route-map TIETEVEL_MATRIXDIST permit 20
 match extcommunity 78
!
route-map TIETEVEL_MATRIXDIST permit 30
 match extcommunity 79
!
route-map TIETEVEL_MATRIXDIST permit 40
 match ip address prefix-list ANULA_DEFAULT
 match extcommunity 89
!
route-map POUPEX_OSPF_BGP deny 10
 match ip address prefix-list POUPEX-NO-30
!
route-map POUPEX_OSPF_BGP permit 20
!
route-map ACOM_IN permit 10
 match as-path 105
 set community 4230:21 4230:30 4230:198
!
route-map POUPEX_BGP_OSPF permit 10
 match community POUPEX
!
route-map UNIC_PITAGORA permit 10
 match extcommunity 112
!
route-map UNIC_PITAGORA permit 20
 match ip address prefix-list ANULA_DEFAULT
 match extcommunity 111
!
route-map UNIC_PITAGORA permit 30
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
route-map SEBRAEMA_43021895324690 permit 10
!
route-map SEBRAEMA_43021895324686 permit 10
!
route-map NGN-GER_1416102532178 permit 10
!
route-map CONNECTED permit 10
 match ip address 2550
 set origin igp
 set community 4230:50 4230:198
!
route-map SEBRAEMA_43021895324694 permit 10
!
route-map BRAZSHIP_39701872812210 permit 10
!
route-map TAGUATURVEIC_351918953246182 permit 10
!
route-map SEBRAEMA_430218953246102 permit 10
!
route-map PELAGIO_OLIVEIRA_459118952211206 permit 10
!
route-map EQUATORIAL_15499818943197246 permit 10
!
route-map SEBRAEMA_430218953246166 permit 10
!
route-map LATAM_TELMEX_286 permit 10
 set community 28513:286 28513:1281 additive
!
route-map LISTEL_1 permit 10
 match extcommunity 3
 set local-preference 100
!
route-map LISTEL_1 permit 20
 match extcommunity 4
 set local-preference 25
!
route-map LISTEL_1 permit 30
 match extcommunity 144
!
route-map NACSAUDE_453020025215882 permit 10
!
route-map LATAM_TELMEX_285 permit 10
 set community 28513:285 28513:1281 additive
!
route-map TAGUATURVEIC_351918953246194 permit 10
!
route-map ABIN_4312189531186 permit 10
!
route-map BIGBEN_277718952211130 permit 10
!
route-map BIGBEN_277718952211102 permit 10
!
route-map IBGP_RR-CLIENT_PARTIAL_OUT permit 10
 match as-path 1
!
route-map IBGP_RR-CLIENT_PARTIAL_OUT permit 20
 match community 2 3 4
!
route-map ANVISA_435618953246114 permit 10
!
route-map BIGBEN_277718952211134 permit 10
!
route-map IURD_126518952211194 permit 10
!
route-map BIGBEN_277718952211150 permit 10
!
route-map ANVISA_435618953246110 permit 10
!
route-map GUANABARAEXP_458820025215838 permit 10
!
route-map NOVA_SOCIC_411718953246170 permit 10
!
route-map LOJASRIACHUELO_412018953246142 permit 10
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
route-map AGIP_1 permit 10
 match extcommunity 1
 set local-preference 100
!
route-map AGIP_1 permit 20
 match extcommunity 2
 set local-preference 25
!
route-map PREVIDENCIA_SPOKES_152588107844122 permit 10
!
route-map BISON_CALCADOS_450720025215854 permit 10
!
route-map CANADAVEIC_462220025215842 permit 10
!
route-map COMAER_NEW_548520017212210 permit 10
!
route-map DNPM_3963189531174 permit 10
!
route-map FULL-ROUTING_OUT deny 10
 match community 50
!
route-map FULL-ROUTING_OUT permit 20
 match community 5
!
route-map FULL-ROUTING_OUT permit 30
 match community 1 2 3
!
route-map PREVIDENCIA_SPOKES_152772107844254 permit 10
!
route-map BB-LT3-NAC-REMOTOS-OUT permit 10
 match community 443
!
route-map JEVA_135120025215878 permit 10
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
route-map PREVIDENCIA_SPOKES_152025107844114 permit 10
!
route-map MOTONE_122318953246178 permit 10
!
route-map HSBCMPLS_3232168412034 permit 10
!
route-map PREVIDENCIA_SPOKES_151658107844126 permit 10
!
route-map PREVIDENCIA_SPOKES_151912107844234 permit 10
!
route-map PREVIDENCIA_SPOKES_152280107844146 permit 10
!
route-map COMAER_NEW_548518952211178 permit 10
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
route-map TIETEVEL_394220025215830 permit 10
!
route-map PREVIDENCIA_SPOKES_1521381078442 permit 10
!
route-map PREVIDENCIA_SPOKES_151624107844118 permit 10
!
route-map PREVIDENCIA_SPOKES_151760107844238 permit 10
!
route-map PREVIDENCIA_SPOKES_152039107844154 permit 10
!
snmp-server engineID local 000000090200001E4921A264
snmp-server group tapGroup v3 auth read tapView write tapView notify tapView access 50
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
tacacs-server key 7 094F5B0710091E1C0C1905
!
tag-switching tdp router-id Loopback0 force
control-plane slot 1
 service-policy input CoPP
!
control-plane slot 4
 service-policy input CoPP
!
control-plane slot 5
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
 login authentication NOC
line vty 0 4
 session-timeout 20 
 access-class 12 in
 exec-timeout 20 0
 login authentication NOC
 transport input telnet ssh
line vty 5 9
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
ntp clock-period 17170917
ntp source Loopback0
ntp update-calendar
ntp server 200.255.253.242
ntp server 200.245.255.33
no cns aaa enable
end

gacc01.sls#
