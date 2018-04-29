Building configuration...

Current configuration : 717092 bytes
!
! Last configuration change at 17:22:14 BRA Wed Mar 14 2018 by jacsonk
! NVRAM config last updated at 15:11:07 BRA Wed Mar 14 2018 by rglange
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
service upgrade fabric-loader
service upgrade mbus-agent-rom
!
hostname gacc03.sls
!
boot-start-marker
boot system flash disk0:c12kprp-k4p-mz-eng-sp-120-33S13_Embratel15
boot system flash disk0:c12kprp-k4p-mz-eng-sp-120-33.S13-debugs-pot-fix.bin
boot system bootflash:c12kprp-boot-mz.120-32.SY9a.bin
boot-end-marker
!
!
redundancy
 mode sso
logging count
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
enable secret level 6 5 $1$Lioj$2EDPFXk0xxZKG7M5qrxqX/
enable secret 5 $1$S.mD$CmpXFf0E/pWnuSPqAI8qR0
!
username cong privilege 15 secret 5 $1$M7DP$jBF4e0IXVzQbwctn8uds8/
spd extended-headroom 1000
monitor event-trace rlc all enable
monitor event-trace mbus slot 23
monitor event-trace mbus slot 24
monitor event-trace mbus slot 25
monitor event-trace mbus slot 26
monitor event-trace mbus slot 27
monitor event-trace mbus slot 28
monitor event-trace mbus slot 29
clock timezone BRA -3
clock summer-time BRAVER recurring 3 Sun Oct 0:00 3 Sun Feb 0:00
sensor fanspeed-control off
!
!
hw-module slot 1 ip multicast hw-accelerate source-table size 512 offset 0
hw-module slot 2 ip multicast hw-accelerate source-table size 512 offset 0
hw-module slot 1 qos interface queues 8
hw-module slot 2 qos interface queues 8
hw-module slot 0 np mode feature
hw-module slot 3 np mode feature
hw-module slot 4 np mode feature
hw-module slot 0 qos policing-granularity 8
hw-module slot 3 qos policing-granularity 8
hw-module slot 4 qos policing-granularity 8
hw-module slot 0 process-max-time 50
hw-module slot 1 process-max-time 50
hw-module slot 2 process-max-time 50
hw-module slot 3 process-max-time 50
hw-module slot 4 process-max-time 50
hw-module slot 6 process-max-time 50
hw-module slot 7 process-max-time 50
hw-module slot 8 process-max-time 50
hw-module slot 9 process-max-time 50
hw-module slot 0 ip rtp compression-connections 32000
hw-module slot 0 ip tcp compression-connections 500
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
ip host wks19.rjo.embratel.net.br 200.255.125.219
ip host wks09.rjo.embratel.net.br 200.255.253.249
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
ip vrf AGU_MPLS:6691
 rd 4230:6691
 route-target export 4230:6691
 route-target export 4230:5155
 route-target import 4230:6691
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
ip vrf ALVO:3946
 rd 4230:3946
 route-target export 4230:3946
 route-target import 4230:3946
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
 route-target export 4230:5155
 route-target import 4230:4783
 route-target import 4230:1337
!
ip vrf BCP_NO:4026
 rd 4230:4026
 route-target export 4230:4026
 route-target import 4230:4026
!
ip vrf BEMOL1:5658
 rd 4230:5658
 route-target export 4230:5658
 route-target import 4230:5658
!
ip vrf BIGBEN:2777
 rd 4230:2777
 route-target export 4230:2777
 route-target export 4230:5155
 route-target import 4230:2777
 route-target import 4230:1337
!
ip vrf BITCARD:6262
 rd 4230:6262
 route-target export 4230:6262
 route-target import 4230:6262
!
ip vrf BNB:5075
 rd 4230:5075
 route-target export 4230:5075
 route-target export 4230:5155
 route-target import 4230:5075
 route-target import 4230:1337
!
ip vrf BRASILIANAENC_NOVA:6317
 rd 4230:6317
 route-target export 4230:6317
 route-target import 4230:6317
!
ip vrf BRASPRESS:4733
 rd 4230:4733
 route-target export 4230:4733
 route-target import 4230:4733
!
ip vrf BRF_BRASIL_FOODS:5177
 rd 4230:5177
 route-target export 4230:5177
 route-target export 4230:1424
 route-target export 28513:50598
 route-target import 4230:5177
 route-target import 4230:1424
 route-target import 28513:50598
!
ip vrf BT_CBB:1851
 rd 4230:1851
 route-target export 4230:1851
 route-target import 4230:1851
!
ip vrf CARREFOUR:155715
 rd 4230:155715
 route-target export 4230:7444
 route-target import 4230:7444
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
!
ip vrf CETIP:6164
 rd 4230:6164
 route-target export 4230:6164
 route-target import 4230:6164
!
ip vrf COBRA:1706
 rd 4230:1706
 route-target export 4230:1706
 route-target export 4230:3108
 route-target import 4230:1706
 route-target import 4230:3107
!
ip vrf CONAB:4162
 rd 4230:4162
 route-target export 4230:4162
 route-target import 4230:4162
!
ip vrf CORREIOS_2016:7440
 rd 4230:7440
 route-target export 4230:7440
 route-target export 4230:1007
 route-target import 4230:7440
!
ip vrf COSAN:4132
 rd 4230:4132
 route-target export 4230:4132
 route-target export 4230:3108
 route-target export 4230:5110
 route-target export 4230:5155
 route-target import 4230:4132
 route-target import 4230:3107
 route-target import 4230:5109
 route-target import 4230:1337
!
ip vrf CPAD:5928
 rd 4230:5928
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
ip vrf DPF_MPLS:6606
 rd 4230:6606
 route-target export 4230:6606
 route-target export 4230:5155
 route-target import 4230:6606
 route-target import 4230:1337
!
ip vrf DPRF_NAC_REMOTO:4295
 rd 4230:4295
 export map DPRF-MAP
 route-target export 4230:4295
 route-target export 1024:1001001
 route-target import 4230:4295
 route-target import 4230:4294
 route-target import 1024:1001323
!
ip vrf EBC_MIDIA:155361
 rd 4230:155361
 route-target export 4230:6915
 route-target import 4230:6915
!
ip vrf EBC_MPLS1:6806
 rd 4230:6806
 route-target export 4230:6806
 route-target import 4230:6806
!
ip vrf FUNASA:3094
 rd 4230:3094
 route-target export 4230:3094
 route-target import 4230:3094
 mdt default 239.232.0.243
 mdt data 239.232.244.0 0.0.0.255 threshold 1
 mdt log-reuse
!
ip vrf GCRGOIANIA:3789
 rd 4230:3789
 route-target export 4230:3789
 route-target import 4230:3789
 route-target import 4230:1337
!
ip vrf GERADORA:5001
 rd 4230:5001
 route-target export 4230:4854
 route-target import 4230:4854
!
ip vrf GERANORTE:4870
 rd 4230:4870
 route-target export 4230:4870
 route-target import 4230:4870
!
ip vrf GERDAU_INT:3096
 rd 4230:3096
 route-target export 4230:3096
 route-target export 28513:50072
 route-target import 4230:3096
 route-target import 28513:50072
!
ip vrf GER_JDSU:6847
 rd 4230:6847
 route-target export 4230:6847
 route-target import 4230:6847
!
ip vrf HONEYWELL_MCI:1937
 rd 4230:1937
 route-target export 4230:1937
 route-target import 4230:1937
!
ip vrf HONEY_INT_0:7013
 rd 4230:7013
 route-target export 4230:7013
 route-target import 4230:7013
 mdt default 239.233.0.34
 mdt data 239.233.35.0 0.0.0.255 threshold 1
 mdt log-reuse
!
ip vrf HSBCMPLS:3232
 rd 4230:3232
 route-target export 4230:3232
 route-target import 4230:3232
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
ip vrf INFRAERO:4781
 rd 4230:4781
 route-target export 4230:4781
 route-target import 4230:4781
!
ip vrf INPE:5430
 rd 4230:5430
 route-target export 4230:5430
 route-target import 4230:5430
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
ip vrf JORGEBATISTA:6562
 rd 4230:6562
 route-target export 4230:6562
 route-target export 4230:5155
 route-target import 4230:6562
 route-target import 4230:1337
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
ip vrf LINX:1114
 rd 4230:1114
 route-target export 4230:1114
 route-target import 4230:1114
!
ip vrf LOJARENNER:1513
 rd 4230:1513
 route-target export 4230:1513
 route-target export 4230:3108
 route-target import 4230:1513
 route-target import 4230:3107
!
ip vrf MARATA:3392
 rd 4230:3392
 route-target export 4230:3392
 route-target export 4230:3108
 route-target import 4230:3392
 route-target import 4230:3107
!
ip vrf MARISA:4972
 rd 4230:4972
 route-target export 4230:4972
 route-target export 4230:5110
 route-target import 4230:4972
 route-target import 4230:5109
!
ip vrf MARITIMO_EBT:7326
 rd 4230:7326
 route-target export 4230:7325
 route-target import 4230:7325
!
ip vrf MAXMIX:6352
 rd 4230:6352
 route-target export 4230:6352
 route-target export 4230:3108
 route-target import 4230:6352
 route-target import 4230:3107
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
ip vrf MPT_NOVA:6115
 rd 4230:6115
 route-target export 4230:6115
 route-target export 4230:6107
 route-target import 4230:6115
 route-target import 4230:6108
 mdt default 239.232.0.235
 mdt data 239.232.236.0 0.0.0.255 threshold 1
 mdt log-reuse
!
ip vrf NACIONALGAS:3635
 rd 4230:3635
 route-target export 4230:3635
 route-target export 4230:5155
 route-target import 4230:3635
 route-target import 4230:1337
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
ip vrf NOVA_SOCIC:4117
 rd 4230:4117
 route-target export 4230:4117
 route-target import 4230:4117
!
ip vrf PAGUEMENOS:3822
 rd 4230:3822
 route-target export 4230:3822
 route-target export 4230:3108
 route-target export 4230:5155
 route-target import 4230:3822
 route-target import 4230:3107
 route-target import 4230:1337
!
ip vrf PREVIDENCIA_SPOKES:152286
 rd 4230:152286
 route-target export 4230:151584
 route-target import 4230:3128
!
ip vrf RCC_AMX_CORP:7361
 rd 4230:7361
 route-target export 4230:7361
 route-target import 4230:7361
!
ip vrf RCC_AMX_CORP_VOZ:7346
 rd 4230:7346
 route-target export 4230:7346
 route-target import 4230:7346
!
ip vrf RCC_CLARO_MPLS1:6254
 rd 4230:6254
 route-target export 4230:6254
 route-target import 4230:6254
!
ip vrf RCC_GST_MPLS1:4457
 rd 4230:4457
 route-target export 4230:4457
 route-target import 4230:4457
 mdt default 239.232.0.28
 mdt data 239.232.29.0 0.0.0.255 threshold 1
 mdt log-reuse
!
ip vrf RCC_PRY_MPLS1:6256
 rd 4230:6256
 route-target export 4230:6256
 route-target import 4230:6256
!
ip vrf RCC_RUN_MPLS1:4455
 rd 4230:4455
 route-target export 4230:4455
 route-target import 4230:4455
 mdt default 239.232.0.21
 mdt data 239.232.22.0 0.0.0.255 threshold 1
 mdt log-reuse
!
ip vrf REALIP_CLIENTE:5581
 rd 4230:5581
 route-target export 4230:5581
 route-target export 4230:5155
 route-target import 4230:5580
 route-target import 4230:1337
!
ip vrf REALIP_SBC:5580
 rd 4230:5580
 import map REALIP_SBC
 route-target export 4230:5580
 route-target import 4230:5580
 route-target import 4230:5581
!
ip vrf REDEPOSDIAL1:7101
 rd 4230:7101
 route-target export 4230:7101
 route-target import 4230:7101
!
ip vrf REDEVIP_BLD_MLPPP:3799
 rd 4230:3799
 route-target export 4230:3108
 route-target import 4230:3107
!
ip vrf RODOBENS:3379
 rd 4230:3379
 route-target export 4230:3379
 route-target import 4230:3379
!
ip vrf SAGA_BRASIL:7340
 rd 4230:7340
 route-target export 4230:7340
 route-target import 4230:7340
!
ip vrf SANTANDER_11:6872
 rd 4230:6872
 route-target export 4230:6872
 route-target import 4230:6872
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
ip vrf SERASA:1956
 rd 4230:1956
 import map SERASA_MATIAS
 route-target export 4230:1956
 route-target import 4230:1956
 route-target import 4230:1340
!
ip vrf SERMA:1663
 rd 4230:1663
 route-target export 4230:1663
 route-target export 28513:50296
 route-target import 4230:1663
 route-target import 28513:50296
!
ip vrf SERPRO_SLS_DNIT_05:5908
 rd 4230:5908
 route-target export 4230:5908
 route-target import 4230:5908
!
ip vrf SERPRO_SLS_RFB_01:5848
 rd 4230:5848
 route-target export 4230:5848
 route-target import 4230:5848
 mdt default 239.232.0.104
 mdt data 239.232.105.0 0.0.0.255 threshold 1
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
ip vrf SET_MA:3377
 rd 4230:3377
 route-target export 4230:3377
 route-target import 4230:3377
!
ip vrf SGNET:1835
 rd 4230:1835
 route-target export 4230:1835
 route-target export 28513:50005
 route-target import 4230:1835
 route-target import 28513:50005
!
ip vrf SHV_GAS:3469
 rd 4230:3469
 route-target export 4230:3469
 route-target import 4230:3469
!
ip vrf SOLARBR:6759
 rd 4230:6759
 route-target export 4230:6759
 route-target import 4230:6759
!
ip vrf SOTREQ:2989
 rd 4230:2989
 route-target export 4230:2989
 route-target import 4230:2989
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
ip vrf TEXACO:4523
 rd 4230:4523
 import map TEXACO_EXTR_SERMA_IPIR
 route-target export 4230:4523
 route-target import 4230:4523
 route-target import 4230:1912
 route-target import 4230:1663
!
ip vrf TRACTEBEL:4977
 rd 4230:4977
 route-target export 4230:4977
 route-target import 4230:4977
!
ip vrf TRANSITA:1295
 rd 4230:1295
 route-target export 4230:1295
 route-target export 4230:5155
 route-target import 4230:1295
 route-target import 4230:1337
!
ip vrf TRF1_FM:3152
 rd 4230:3152
 route-target export 4230:3152
 route-target export 4230:5155
 route-target import 4230:3152
 route-target import 4230:1337
!
ip vrf TVGLOBO_NOVA:2610
 rd 4230:2610
 route-target export 4230:2610
 route-target import 4230:2610
!
ip vrf UNICRED:1647
 rd 4230:1647
 route-target export 4230:1647
 route-target export 4230:5155
 route-target import 4230:1647
 route-target import 4230:1337
!
ip vrf UNIEURO:5509
 rd 4230:5509
 route-target export 4230:5509
 route-target import 4230:5509
!
ip vrf VOLVO_APAVEL:3193
 rd 4230:3193
 route-target export 4230:3193
 route-target import 4230:3193
 route-target import 4230:151524
!
ip vrf VOTORANTIM:4561
 rd 4230:4561
 route-target export 4230:4561
 route-target export 4230:5155
 route-target import 4230:4561
 route-target import 4230:1337
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
ip multicast-routing vrf BBRASIL:1588 distributed
ip multicast-routing vrf BBRASIL_PAE:7041 distributed
ip multicast-routing vrf FUNASA:3094 distributed
ip multicast-routing vrf MPF_NOVA:6114 distributed
ip multicast-routing vrf MPT_NOVA:6115 distributed
ip multicast-routing vrf RCC_GST_MPLS1:4457 distributed
ip multicast-routing vrf RCC_RUN_MPLS1:4455 distributed
ip multicast-routing vrf BBRASIL_NAC:7399 distributed
ip multicast-routing vrf SERPRO_SLS_RFB_01:5848 distributed
ip multicast-routing vrf SERPRO_SLS_RFB_05:5917 distributed
ip multicast-routing vrf SERPRO_SLS_RFB_06:5918 distributed
ip multicast-routing vrf SERPRO_SLS_RFB_08:5907 distributed
ip multicast-routing vrf SERPRO_SLS_RFB_09:5913 distributed
ip multicast-routing vrf SERPRO_SLS_RFB_11:5911 distributed
ip multicast-routing vrf SERPRO_SLS_RFB_12:6238 distributed
ip multicast-routing vrf HONEY_INT_0:7013 distributed
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
class-map match-any rpvm_video_tmx
  match ip dscp 34 
  match ip dscp 36 
  match ip dscp 38 
class-map match-any BestEffort
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
class-map match-any Santander_Multimidia_Q6
  match ip dscp 32  34  40  46 
class-map match-all RV_MLPPP_Sinalizacao
  match access-group 2121
class-map match-any REAL_TIME_CORREIOS
  match ip dscp 32  40  46 
class-map match-any Santander_Ouro_Q6
  match ip dscp 24  26  28  30 
class-map match-all Voz_SERPRO
  match ip dscp 40  46 
class-map match-any TEMPO_REAL_NAC
  match ip dscp 40  46 
class-map match-all RV_MLPPP_Voz
  match access-group 2123
class-map match-all Interativa_Q6
  match ip dscp 18  20  22 
class-map match-any NetworkControl
  match ip dscp 16  48  56 
class-map match-any TEMPO_REAL_VOZ
  match ip dscp 40  46 
class-map match-any SILVER_AF4x_MCI
  match ip dscp 32  34  36  38 
class-map match-any STANDARD
  match ip dscp 0 
class-map match-any rpvm_voz_tmx
  match ip dscp 24 
  match ip dscp 40 
  match ip dscp 46 
class-map match-any SILVER_AF3x_MCI
  match ip dscp 24  26  28  30 
  match ip dscp 48  56 
class-map match-all RealTime_CANINHO
  match mpls experimental  5 
class-map match-any SILVER_AF2x_MCI
  match ip dscp 16  18  20  22 
class-map match-any MarcacaoInterativa
  match access-group name TrafegoInterativo
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
class-map match-any Interativa
  match ip dscp 18 
class-map match-all CoPP-BACKBONE-management
  match access-group name CoPP-BACKBONE-management
class-map match-all CoPP-Normal
  match access-group name CoPP-Normal
class-map match-all BestEffort_Q6
  match ip dscp 0 
class-map match-any Business_CANINHO
  match mpls experimental  1  2  3  4 
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
class-map match-any Voz
  match ip dscp 46 
class-map match-all VozVideo_SERPRO
  match ip dscp 34  40  46 
class-map match-any GOLD_EF_MCI
  match ip dscp 40  46 
class-map match-any NETWORK_CONTROL
  match ip dscp 16  48  56 
class-map match-all VIDEOCONF_TCU
  match ip dscp 34 
class-map match-any rpvm_mngmnt_routing_tmx
  match ip dscp 48 
  match ip dscp 56 
class-map match-any TEMPO_REAL_VC
  match ip dscp 34 
class-map match-any GERENCIAMENTO
  match ip dscp 24  26  28 
class-map match-all NetworkControl_SERPRO
  match ip dscp 16  48  56 
class-map match-any Routing_CANINHO
  match mpls experimental  6  7 
  match ip dscp 48  56 
class-map match-any rpvm_datos_criticos_tmx
  match ip dscp 16 
  match ip dscp 26 
  match ip dscp 28 
  match ip dscp 30 
class-map match-any Video
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
class-map match-any MarcacaoMissaoCritica
  match access-group name TrafegoMissaoCritica
class-map match-all CoPP-BACKBONE-routing
  match access-group name CoPP-BACKBONE-routing
class-map match-any GERENCIAMENTO_NAC
  match ip dscp 24  26  30 
class-map match-all MissaoCritica_ECT
  match ip dscp 26 
class-map match-any MarcacaoVideo
  match access-group name TrafegoVideo
class-map match-any Santander_Prata_Q6
  match ip dscp 8  12 
class-map match-all CoPP-Catch-all-ipv4
  match access-group name CoPP-Catch-all-ipv4
class-map match-all CoPP-SUSPECT-management
  match access-group name CoPP-SUSPECT-management
class-map match-all Video_Q6
  match ip dscp 34 
class-map match-all CoPP-ToS
  match ip precedence 6  7 
class-map match-any Santander_Suporte_Q6
  match ip dscp 16  18  20 
class-map match-all RV_MLPPP_NetWorkControl
  match access-group 2122
class-map match-any MissaoCritica
  match ip dscp 26 
  match ip dscp 34 
class-map match-all CoPP-PE-CE-routing
  match access-group name CoPP-PE-CE-routing
class-map match-any MarcacaoVoz
  match access-group name TrafegoVoz
class-map match-any MarcacaoSinalizacao
  match access-group name TrafegoSinalizacao
class-map match-all Interativa_SERPRO
  match ip dscp 12  18  20  22 
class-map match-all Voz_Q6
  match ip dscp 40  46 
class-map match-any rpvm_business_tmx
  match ip dscp 8 
  match ip dscp 18 
  match ip dscp 20 
  match ip dscp 22 
!
!
policy-map PM_V10_QPO_BBONE_20000_V1
policy-map QPO_BBONE_20000_V1
  class class-default
    shape average 20000000
   service-policy PM_V10_QPO_BBONE_20000_V1
policy-map QPI_A_512K_8_N_0_15_22_35_4_15
  class Voz_Q6
   police cir percent 8 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 15 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Interativa_Q6
   police cir percent 22 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Bulk_Q6
   police cir percent 35 conform-action set-mpls-exp-imposition-transmit 4 exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_A_2048K_7_N_0_50_0_13_2_27
  class Voz_Q6
   police cir percent 7 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 50 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Bulk_Q6
   police cir percent 13 conform-action set-mpls-exp-imposition-transmit 4 exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QDI_A_2048K_7_0_50_0_13_2_27
  class class-default
   police rate 2048000 child-conform-aware conform-action transmit  exceed-action drop 
   service-policy QPI_A_2048K_7_N_0_50_0_13_2_27
policy-map QPI_A_2048K_11_N_0_66_0_15_2_1
  class Voz_Q6
   police cir percent 11 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 66 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Bulk_Q6
   police cir percent 15 conform-action set-mpls-exp-imposition-transmit 4 exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QDI_A_2048K_11_0_66_0_15_2_1
  class class-default
   police rate 2048000 child-conform-aware conform-action transmit  exceed-action drop 
   service-policy QPI_A_2048K_11_N_0_66_0_15_2_1
policy-map QPO_2048K_13_0_56_0_0_1_29
  class Voz_Q6
    priority
   police cir percent 13 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 56
    random-detect dscp-based
    random-detect dscp 24 40 ms 120 ms 1
    random-detect dscp 26 40 ms 120 ms 1
    random-detect dscp 28 40 ms 120 ms 1
    random-detect dscp 30 40 ms 120 ms 1
  class NetworkControl_Q6
    bandwidth percent 1
  class class-default
    bandwidth percent 29
    random-detect dscp-based
    random-detect dscp 0 40 ms 120 ms 1
policy-map QPI_2048K_BBrasil_NAC_IPSAN_GACC_V1
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
policy-map QPI_A_2048K_25_N_0_25_0_0_1_47
  class Voz_Q6
   police cir percent 25 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 25 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
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
policy-map QPI_A_2048K_0_N_0_61_14_7_1_16
  class MissaoCritica_Q6
   police cir percent 61 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Interativa_Q6
   police cir percent 14 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Bulk_Q6
   police cir percent 7 conform-action set-mpls-exp-imposition-transmit 4 exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPO_A_20000K_11_2_0_0_0_2_84
  class VozVideo_Q6
    priority
   police cir percent 13 conform-action transmit  exceed-action drop 
  class NetworkControl_Q6
    bandwidth percent 2
    bandwidth remaining percent 2
    queue-limit 80 packets
  class class-default
    bandwidth percent 84
    bandwidth remaining percent 84
    random-detect dscp-based
    random-detect dscp 0 388 packets 900 packets 1
    queue-limit 1800 packets
policy-map QDO_A_20000K_11_2_0_0_0_2_84
  class class-default
    shape average 20000000
   service-policy QPO_A_20000K_11_2_0_0_0_2_84
policy-map QPI_A_20000K_0_RCC_PRY_MPLS1
  class MissaoCritica_Q6
   police cir percent 20 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Interativa_Q6
   police cir percent 20 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Bulk_Q6
   police cir percent 20 conform-action set-mpls-exp-imposition-transmit 4 exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QDI_A_20000K_RCC_PRY_MPLS1
  class class-default
   police rate 20000000 child-conform-aware conform-action transmit  exceed-action drop 
   service-policy QPI_A_20000K_0_RCC_PRY_MPLS1
policy-map PM_V10_QPO_BBONE_12000_V1
policy-map QPO_BBONE_12000_V1
  class class-default
    shape average 12000000
   service-policy PM_V10_QPO_BBONE_12000_V1
policy-map QPI_A_10000K_3_N_6_8_0_0_1_5
  class Voz_Q6
   police cir percent 3 conform-action transmit  exceed-action drop 
  class Video_Q6
   police cir percent 6 conform-action set-mpls-exp-imposition-transmit 5 exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 8 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QDI_A_10000K_3_6_8_0_0_1_5
  class class-default
   police rate 10000000 child-conform-aware conform-action transmit  exceed-action drop 
   service-policy QPI_A_10000K_3_N_6_8_0_0_1_5
policy-map QPI_A_2048K_13_N_0_20_0_0_1_16
  class Voz_Q6
   police cir percent 13 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 20 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QDI_A_2048K_13_0_20_0_0_1_16
  class class-default
   police rate 2048000 child-conform-aware conform-action transmit  exceed-action drop 
   service-policy QPI_A_2048K_13_N_0_20_0_0_1_16
policy-map QPO_A_100000K_1_0_0_0_0_1_96
  class Voz_Q6
    priority
   police cir percent 1 conform-action transmit  exceed-action drop 
  class NetworkControl_Q6
    bandwidth percent 1
    bandwidth remaining percent 1
    queue-limit 240 packets
  class class-default
    bandwidth percent 96
    bandwidth remaining percent 96
    random-detect dscp-based
    random-detect dscp 0 988 packets 1500 packets 1
    queue-limit 3000 packets
policy-map QDO_A_100000K_1_0_0_0_0_1_96
  class class-default
    shape average 100000000
   service-policy QPO_A_100000K_1_0_0_0_0_1_96
policy-map QPI_A_1024K_19_N_0_7_38_0_2_18
  class Voz_Q6
   police cir percent 19 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 7 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Interativa_Q6
   police cir percent 38 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QDI_A_1024K_19_0_7_38_0_2_18
  class class-default
   police rate 1024000 child-conform-aware conform-action transmit  exceed-action drop 
   service-policy QPI_A_1024K_19_N_0_7_38_0_2_18
policy-map QPO_4096K_6_0_0_0_0_1_91
  class Voz_Q6
    priority
   police cir percent 6 conform-action transmit  exceed-action drop 
  class NetworkControl_Q6
    bandwidth percent 1
  class class-default
    bandwidth percent 91
    random-detect dscp-based
    random-detect dscp 0 40 ms 120 ms 1
policy-map QPI_A_4096K_13_N_37_0_0_0_1_45
  class Voz_Q6
   police cir percent 13 conform-action transmit  exceed-action drop 
  class Video_Q6
   police cir percent 37 conform-action set-mpls-exp-imposition-transmit 5 exceed-action drop 
  class class-default
   set mpls experimental imposition 0
policy-map QPO_A_100000K_4_0_0_0_0_1_93
  class Voz_Q6
    priority
   police cir percent 4 conform-action transmit  exceed-action drop 
  class NetworkControl_Q6
    bandwidth percent 1
    bandwidth remaining percent 1
    queue-limit 240 packets
  class class-default
    bandwidth percent 93
    bandwidth remaining percent 93
    random-detect dscp-based
    random-detect dscp 0 988 packets 1500 packets 1
    queue-limit 3000 packets
policy-map QDO_A_100000K_4_0_0_0_0_1_93
  class class-default
    shape average 100000000
   service-policy QPO_A_100000K_4_0_0_0_0_1_93
policy-map WAN_IN_OMEGA_TER
policy-map QPO_MCI_ETM_1536K_0_1536K_V1
  class SILVER_AF4x_MCI
    bandwidth percent 3
    random-detect dscp-based
    random-detect dscp 32 171 packets 500 packets 1
    random-detect dscp 34 171 packets 500 packets 1
    random-detect dscp 36 52 packets 171 packets 1
    random-detect dscp 38 52 packets 171 packets 1
    queue-limit 512 packets
  class SILVER_AF3x_MCI
    bandwidth percent 3
    random-detect dscp-based
    random-detect dscp 24 171 packets 500 packets 1
    random-detect dscp 26 171 packets 500 packets 1
    random-detect dscp 28 52 packets 171 packets 1
    random-detect dscp 30 52 packets 171 packets 1
    random-detect dscp 48 511 packets 512 packets 10
    random-detect dscp 56 511 packets 512 packets 10
    queue-limit 512 packets
  class SILVER_AF2x_MCI
    bandwidth percent 2
    random-detect dscp-based
    random-detect dscp 16 171 packets 500 packets 1
    random-detect dscp 18 171 packets 500 packets 1
    random-detect dscp 20 52 packets 171 packets 1
    random-detect dscp 22 52 packets 171 packets 1
    queue-limit 512 packets
  class SILVER_BEST_EFFORT_MCI
    bandwidth percent 2
    random-detect
    queue-limit 512 packets
policy-map QPI_A_1024K_32_N_18_0_0_0_2_47
  class Voz_Q6
   police cir percent 32 conform-action transmit  exceed-action drop 
  class Video_Q6
   police cir percent 18 conform-action set-mpls-exp-imposition-transmit 5 exceed-action drop 
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
policy-map QPI_A_20000K_11_N_2_0_0_0_2_84
  class Voz_Q6
   police cir percent 11 conform-action transmit  exceed-action drop 
  class Video_Q6
   police cir percent 2 conform-action set-mpls-exp-imposition-transmit 5 exceed-action drop 
  class class-default
   set mpls experimental imposition 0
policy-map QPI_A_100000K_1_N_0_0_0_0_1_96
  class Voz_Q6
   police cir percent 1 conform-action transmit  exceed-action drop 
  class class-default
   set mpls experimental imposition 0
policy-map QPI_A_16000K_4_N_13_0_0_0_2_80
  class Voz_Q6
   police cir percent 4 conform-action transmit  exceed-action drop 
  class Video_Q6
   police cir percent 13 conform-action set-mpls-exp-imposition-transmit 5 exceed-action drop 
  class class-default
   set mpls experimental imposition 0
policy-map QDI_A_16000K_4_13_0_0_0_2_80
  class class-default
   police rate 16000000 child-conform-aware conform-action transmit  exceed-action drop 
   service-policy QPI_A_16000K_4_N_13_0_0_0_2_80
policy-map QPI_A_100000K_4_N_0_0_0_0_1_93
  class Voz_Q6
   police cir percent 4 conform-action transmit  exceed-action drop 
  class class-default
   set mpls experimental imposition 0
policy-map PM_V10_QPO_BBONE_10000_V1
policy-map QPO_BBONE_10000_V1
  class class-default
    shape average 10000000
   service-policy PM_V10_QPO_BBONE_10000_V1
policy-map PM_V10_QPO_BBONE_256_V1
policy-map QPO_BBONE_256_V1
  class class-default
    shape average 256000
   service-policy PM_V10_QPO_BBONE_256_V1
policy-map PM_V10_QPO_BBONE_12288_V1
policy-map QPO_BBONE_12288_V1
  class class-default
    shape average 12288000
   service-policy PM_V10_QPO_BBONE_12288_V1
policy-map PM_V10_QPO_BBONE_32000_V1
policy-map QPO_BBONE_32000_V1
  class class-default
    shape average 32000000
   service-policy PM_V10_QPO_BBONE_32000_V1
policy-map PM_V10_QPO_BBONE_1000000_V1
policy-map QPO_BBONE_1000000_V1
  class class-default
    shape average 1000000000
   service-policy PM_V10_QPO_BBONE_1000000_V1
policy-map QPI_A_1024K_7_N_0_48_19_12_4_9
  class Voz_Q6
   police cir percent 7 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 48 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Interativa_Q6
   police cir percent 19 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Bulk_Q6
   police cir percent 12 conform-action set-mpls-exp-imposition-transmit 4 exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QDI_A_1024K_7_0_48_19_12_4_9
  class class-default
   police rate 1024000 child-conform-aware conform-action transmit  exceed-action drop 
   service-policy QPI_A_1024K_7_N_0_48_19_12_4_9
policy-map QPI_A_1024K_7_N_0_45_27_0_2_18
  class Voz_Q6
   police cir percent 7 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 45 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Interativa_Q6
   police cir percent 27 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPO_A_2048K_25_0_25_0_0_1_47
  class Voz_Q6
    priority
   police cir percent 25 conform-action transmit  exceed-action drop 
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
    bandwidth percent 47
    bandwidth remaining percent 47
    random-detect dscp-based
    random-detect dscp 0 32 packets 64 packets 1
    queue-limit 128 packets
policy-map QDO_A_2048K_25_0_25_0_0_1_47
  class class-default
    shape average 2048000
   service-policy QPO_A_2048K_25_0_25_0_0_1_47
policy-map QPI_A_8000K_20_N_30_0_0_0_1_46
  class Voz_Q6
   police cir percent 20 conform-action transmit  exceed-action drop 
  class Video_Q6
   police cir percent 30 conform-action set-mpls-exp-imposition-transmit 5 exceed-action drop 
  class class-default
   set mpls experimental imposition 0
policy-map QDI_A_8000K_20_30_0_0_0_1_46
  class class-default
   police rate 8000000 child-conform-aware conform-action transmit  exceed-action drop 
   service-policy QPI_A_8000K_20_N_30_0_0_0_1_46
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
policy-map QPO_BBONE_24000_V1
  class class-default
    shape average 24000000 288000 288000
policy-map QPI_MCI_ETM_1536K_0_1536K_V1
  class SILVER_AF4x_MCI
   set mpls experimental 5
  class SILVER_AF3x_MCI
   set mpls experimental 1
  class SILVER_AF2x_MCI
   set mpls experimental 1
policy-map PM_V10_QPO_BBONE_512_V1
policy-map QPO_BBONE_512_V1
  class class-default
    shape average 512000
   service-policy PM_V10_QPO_BBONE_512_V1
policy-map QPI_A_2048K_13_N_25_11_0_0_2_1
  class Voz_Q6
   police cir percent 13 conform-action transmit  exceed-action drop 
  class Video_Q6
   police cir percent 25 conform-action set-mpls-exp-imposition-transmit 5 exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 11 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QOS_POLICY_IN_A_11P_0P
  class REALTIME
   police cir percent 11 conform-action transmit  exceed-action drop 
  class class-default
   set mpls experimental imposition 0
policy-map QOS_DTS_IN_A_8000K_816K_0K
  class class-default
   police rate 8000000 child-conform-aware conform-action transmit  exceed-action drop 
   service-policy QOS_POLICY_IN_A_11P_0P
policy-map QDI_A_2048K_0_0_61_14_7_1_16
  class class-default
   police rate 2048000 child-conform-aware conform-action transmit  exceed-action drop 
   service-policy QPI_A_2048K_0_N_0_61_14_7_1_16
policy-map QPO_1024K_11_0_50_13_13_2_10
  class Voz_Q6
    priority
   police cir percent 11 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 50
    random-detect dscp-based
    random-detect dscp 24 40 ms 120 ms 1
    random-detect dscp 26 40 ms 120 ms 1
    random-detect dscp 28 40 ms 120 ms 1
    random-detect dscp 30 40 ms 120 ms 1
  class Interativa_Q6
    bandwidth percent 13
    random-detect dscp-based
    random-detect dscp 18 40 ms 120 ms 1
    random-detect dscp 20 40 ms 120 ms 1
    random-detect dscp 22 40 ms 120 ms 1
  class Bulk_Q6
    bandwidth percent 13
    random-detect dscp-based
    random-detect dscp 8 40 ms 120 ms 1
    random-detect dscp 10 40 ms 120 ms 1
    random-detect dscp 12 40 ms 120 ms 1
    random-detect dscp 14 40 ms 120 ms 1
    random-detect dscp 32 40 ms 120 ms 1
  class NetworkControl_Q6
    bandwidth percent 2
  class class-default
    bandwidth percent 10
    random-detect dscp-based
    random-detect dscp 0 40 ms 120 ms 1
policy-map PM_V10_QPO_BBONE_600_V1
policy-map QPO_BBONE_600_V1
  class class-default
    shape average 600000
   service-policy PM_V10_QPO_BBONE_600_V1
policy-map QPO_A_16000K_4_13_0_0_0_2_80
  class VozVideo_Q6
    priority
   police cir percent 17 conform-action transmit  exceed-action drop 
  class NetworkControl_Q6
    bandwidth percent 2
    bandwidth remaining percent 2
    queue-limit 60 packets
  class class-default
    bandwidth percent 80
    bandwidth remaining percent 80
    random-detect dscp-based
    random-detect dscp 0 388 packets 900 packets 1
    queue-limit 1800 packets
policy-map QDO_A_16000K_4_13_0_0_0_2_80
  class class-default
    shape average 16000000
   service-policy QPO_A_16000K_4_13_0_0_0_2_80
policy-map PM_V10_QPO_BBONE_34000_V1
policy-map QPO_BBONE_34000_V1
  class class-default
    shape average 34000000
   service-policy PM_V10_QPO_BBONE_34000_V1
policy-map QPI_A_2048K_7_N_0_63_0_15_2_12
  class Voz_Q6
   police cir percent 7 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 63 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Bulk_Q6
   police cir percent 15 conform-action set-mpls-exp-imposition-transmit 4 exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map PM_V10_QPO_BBONE_10240_V1
policy-map QPO_BBONE_10240_V1
  class class-default
    shape average 10240000
   service-policy PM_V10_QPO_BBONE_10240_V1
policy-map PM_V10_QPO_BBONE_16000_V1
policy-map QPO_BBONE_16000_V1
  class class-default
    shape average 16000000
   service-policy PM_V10_QPO_BBONE_16000_V1
policy-map QPO_A_1024K_7_0_48_19_12_4_9
  class Voz_Q6
    priority
   police cir percent 7 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 48
    bandwidth remaining percent 48
    random-detect dscp-based
    random-detect dscp 24 24 packets 40 packets 1
    random-detect dscp 26 24 packets 40 packets 1
    random-detect dscp 28 24 packets 40 packets 1
    random-detect dscp 30 24 packets 40 packets 1
    queue-limit 80 packets
  class Interativa_Q6
    bandwidth percent 19
    bandwidth remaining percent 19
    random-detect dscp-based
    random-detect dscp 18 12 packets 20 packets 1
    random-detect dscp 20 12 packets 20 packets 1
    random-detect dscp 22 12 packets 20 packets 1
    queue-limit 40 packets
  class Bulk_Q6
    bandwidth percent 12
    bandwidth remaining percent 12
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
    queue-limit 26 packets
  class class-default
    bandwidth percent 9
    bandwidth remaining percent 9
    random-detect dscp-based
    random-detect dscp 0 7 packets 15 packets 1
    queue-limit 30 packets
policy-map QDO_A_1024K_7_0_48_19_12_4_9
  class class-default
    shape average 1024000
   service-policy QPO_A_1024K_7_0_48_19_12_4_9
policy-map QDI_A_2048K_25_0_25_0_0_1_47
  class class-default
   police rate 2048000 child-conform-aware conform-action transmit  exceed-action drop 
   service-policy QPI_A_2048K_25_N_0_25_0_0_1_47
policy-map QPO_A_8000K_20_30_0_0_0_1_46
  class VozVideo_Q6
    priority
   police cir percent 50 conform-action transmit  exceed-action drop 
  class NetworkControl_Q6
    bandwidth percent 1
    bandwidth remaining percent 1
    queue-limit 40 packets
  class class-default
    bandwidth percent 46
    bandwidth remaining percent 46
    random-detect dscp-based
    random-detect dscp 0 112 packets 240 packets 1
    queue-limit 480 packets
policy-map QDO_A_8000K_20_30_0_0_0_1_46
  class class-default
    shape average 8000000
   service-policy QPO_A_8000K_20_30_0_0_0_1_46
policy-map QDI_A_2048K_8_0_59_17_0_2_13
  class class-default
   police rate 2048000 child-conform-aware conform-action transmit  exceed-action drop 
   service-policy QPI_A_2048K_8_N_0_59_17_0_2_13
policy-map SaidaWAN
  class NetworkControl
    bandwidth percent 2
  class BestEffort
    bandwidth percent 29
  class MissaoCritica
    bandwidth percent 40
policy-map PM_V10_QPO_BBONE_40000_V1
policy-map QPO_BBONE_40000_V1
  class class-default
    shape average 40000000
   service-policy PM_V10_QPO_BBONE_40000_V1
policy-map QPO_A_2048K_7_0_50_0_13_2_27
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
  class Bulk_Q6
    bandwidth percent 13
    bandwidth remaining percent 13
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
    bandwidth percent 27
    bandwidth remaining percent 27
    random-detect dscp-based
    random-detect dscp 0 32 packets 48 packets 1
    queue-limit 96 packets
policy-map QDO_A_2048K_7_0_50_0_13_2_27
  class class-default
    shape average 2048000
   service-policy QPO_A_2048K_7_0_50_0_13_2_27
policy-map QPO_A_2048K_11_0_66_0_15_2_1
  class Voz_Q6
    priority
   police cir percent 11 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 66
    bandwidth remaining percent 66
    random-detect dscp-based
    random-detect dscp 24 56 packets 120 packets 1
    random-detect dscp 26 56 packets 120 packets 1
    random-detect dscp 28 56 packets 120 packets 1
    random-detect dscp 30 56 packets 120 packets 1
    queue-limit 240 packets
  class Bulk_Q6
    bandwidth percent 15
    bandwidth remaining percent 15
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
    bandwidth percent 1
    bandwidth remaining percent 1
    random-detect dscp-based
    random-detect dscp 0 5 packets 13 packets 1
    queue-limit 26 packets
policy-map QDO_A_2048K_11_0_66_0_15_2_1
  class class-default
    shape average 2048000
   service-policy QPO_A_2048K_11_0_66_0_15_2_1
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
policy-map PM_V10_QPO_BBONE_400_V1
policy-map QPO_BBONE_400_V1
  class class-default
    shape average 400000
   service-policy PM_V10_QPO_BBONE_400_V1
policy-map QPI_BBONE_S_68000_V1
  class class-default
   police 68000000 2125000 2125000 conform-action set-dscp-transmit default exceed-action drop 
policy-map QPI_A_2048K_20_C_20_28_14_11_2_4
  class Voz_Q6
   police cir percent 20 conform-action transmit  exceed-action drop 
  class Video_Q6
   police cir percent 20 conform-action set-mpls-exp-imposition-transmit 5 exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 28 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Interativa_Q6
   police cir percent 14 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Bulk_Q6
   police cir percent 11 conform-action set-mpls-exp-imposition-transmit 4 exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPO_2048K_BBrasil_NAC_IPSAN_GACC_V1
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
   police cir 2048000 bc 64000 be 64000 conform-action set-dscp-transmit af31 exceed-action set-dscp-transmit af33
  class GERENCIAMENTO_NAC
    bandwidth percent 5
    bandwidth remaining percent 5
    random-detect dscp-based
    random-detect dscp 24 7 packets 15 packets 1
    random-detect dscp 26 7 packets 15 packets 1
    random-detect dscp 30 7 packets 15 packets 1
    queue-limit 30 packets
   police cir 2048000 bc 64000 be 64000 conform-action set-dscp-transmit af11 exceed-action set-dscp-transmit af13
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
   police cir 2048000 bc 64000 be 64000 conform-action set-dscp-transmit af21 exceed-action set-dscp-transmit af23
policy-map QPI_A_4096K_16_N_50_0_0_0_1_31
  class Voz_Q6
   police cir percent 16 conform-action transmit  exceed-action drop 
  class Video_Q6
   police cir percent 50 conform-action set-mpls-exp-imposition-transmit 5 exceed-action drop 
  class class-default
   set mpls experimental imposition 0
policy-map QPI_A_2048K_16_N_15_10_25_0_2_30
  class Voz_Q6
   police cir percent 16 conform-action transmit  exceed-action drop 
  class Video_Q6
   police cir percent 15 conform-action set-mpls-exp-imposition-transmit 5 exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 10 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Interativa_Q6
   police cir percent 25 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_A_512K_10_N_0_7_0_0_4_78
  class Voz_Q6
   police cir percent 10 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 7 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_BBONE_S_960_V1
  class class-default
   police 960000 30000 30000 conform-action set-dscp-transmit default exceed-action drop 
policy-map QPI_A_64K_19_N_0_4_0_0_13_61
  class Voz_Q6
   police cir percent 19 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 4 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_A_2048K_22_N_0_5_47_22_2_1
  class Voz_Q6
   police cir percent 22 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 5 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Interativa_Q6
   police cir percent 47 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Bulk_Q6
   police cir percent 22 conform-action set-mpls-exp-imposition-transmit 4 exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map PM_V10_QPO_BBONE_50000_V1
policy-map QPO_BBONE_50000_V1
  class class-default
    shape average 50000000
   service-policy PM_V10_QPO_BBONE_50000_V1
policy-map PM_V10_QPO_BBONE_14000_V1
policy-map QPO_BBONE_14000_V1
  class class-default
    shape average 14000000
   service-policy PM_V10_QPO_BBONE_14000_V1
policy-map QDI_A_20000K_11_2_0_0_0_2_84
  class class-default
   police rate 20000000 child-conform-aware conform-action transmit  exceed-action drop 
   service-policy QPI_A_20000K_11_N_2_0_0_0_2_84
policy-map QPO_A_20000K_0_RCC_PRY_MPLS1
  class MissaoCritica_Q6
    bandwidth percent 20
    bandwidth remaining percent 20
    random-detect dscp-based
    random-detect dscp 24 388 packets 900 packets 1
    random-detect dscp 26 388 packets 900 packets 1
    random-detect dscp 28 388 packets 900 packets 1
    random-detect dscp 30 388 packets 900 packets 1
    queue-limit 1800 packets
  class Interativa_Q6
    bandwidth percent 20
    bandwidth remaining percent 20
    random-detect dscp-based
    random-detect dscp 18 388 packets 900 packets 1
    random-detect dscp 20 388 packets 900 packets 1
    random-detect dscp 22 388 packets 900 packets 1
    queue-limit 1800 packets
  class Bulk_Q6
    bandwidth percent 20
    bandwidth remaining percent 20
    random-detect dscp-based
    random-detect dscp 8 388 packets 900 packets 1
    random-detect dscp 10 388 packets 900 packets 1
    random-detect dscp 12 388 packets 900 packets 1
    random-detect dscp 14 388 packets 900 packets 1
    random-detect dscp 32 388 packets 900 packets 1
    queue-limit 1800 packets
  class NetworkControl_Q6
    bandwidth percent 1
    bandwidth remaining percent 1
    queue-limit 240 packets
  class class-default
    bandwidth percent 38
    bandwidth remaining percent 38
    random-detect dscp-based
    random-detect dscp 0 988 packets 1500 packets 1
    queue-limit 3000 packets
policy-map QDO_A_20000K_RCC_PRY_MPLS1
  class class-default
    shape average 20000000
   service-policy QPO_A_20000K_0_RCC_PRY_MPLS1
policy-map QPO_A_10000K_3_6_8_0_0_1_5
  class VozVideo_Q6
    priority
   police cir percent 9 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 8
    bandwidth remaining percent 8
    random-detect dscp-based
    random-detect dscp 24 112 packets 240 packets 1
    random-detect dscp 26 112 packets 240 packets 1
    random-detect dscp 28 112 packets 240 packets 1
    random-detect dscp 30 112 packets 240 packets 1
    queue-limit 480 packets
  class NetworkControl_Q6
    bandwidth percent 1
    bandwidth remaining percent 1
    queue-limit 240 packets
  class class-default
    bandwidth percent 5
    bandwidth remaining percent 5
    random-detect dscp-based
    random-detect dscp 0 56 packets 120 packets 1
    queue-limit 240 packets
policy-map QDO_A_10000K_3_6_8_0_0_1_5
  class class-default
    shape average 10000000
   service-policy QPO_A_10000K_3_6_8_0_0_1_5
policy-map QPO_A_2048K_13_0_20_0_0_1_16
  class Voz_Q6
    priority
   police cir percent 13 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 20
    bandwidth remaining percent 20
    random-detect dscp-based
    random-detect dscp 24 32 packets 48 packets 1
    random-detect dscp 26 32 packets 48 packets 1
    random-detect dscp 28 32 packets 48 packets 1
    random-detect dscp 30 32 packets 48 packets 1
    queue-limit 96 packets
  class NetworkControl_Q6
    bandwidth percent 1
    bandwidth remaining percent 1
    queue-limit 60 packets
  class class-default
    bandwidth percent 16
    bandwidth remaining percent 16
    random-detect dscp-based
    random-detect dscp 0 32 packets 48 packets 1
    queue-limit 96 packets
policy-map QDO_A_2048K_13_0_20_0_0_1_16
  class class-default
    shape average 2048000
   service-policy QPO_A_2048K_13_0_20_0_0_1_16
policy-map QDI_A_100000K_1_0_0_0_0_1_96
  class class-default
   police rate 100000000 child-conform-aware conform-action transmit  exceed-action drop 
   service-policy QPI_A_100000K_1_N_0_0_0_0_1_96
policy-map QPO_A_1024K_19_0_7_38_0_2_18
  class Voz_Q6
    priority
   police cir percent 19 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 7
    bandwidth remaining percent 7
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
    queue-limit 26 packets
  class class-default
    bandwidth percent 18
    bandwidth remaining percent 18
    random-detect dscp-based
    random-detect dscp 0 12 packets 20 packets 1
    queue-limit 40 packets
policy-map QDO_A_1024K_19_0_7_38_0_2_18
  class class-default
    shape average 1024000
   service-policy QPO_A_1024K_19_0_7_38_0_2_18
policy-map QDI_A_100000K_4_0_0_0_0_1_93
  class class-default
   police rate 100000000 child-conform-aware conform-action transmit  exceed-action drop 
   service-policy QPI_A_100000K_4_N_0_0_0_0_1_93
policy-map QPI_A_64K_29_C_0_21_11_22_13_1
  class Voz_Q6
   police cir percent 58 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 21 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Interativa_Q6
   police cir percent 11 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Bulk_Q6
   police cir percent 22 conform-action set-mpls-exp-imposition-transmit 4 exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_A_1024K_25_N_0_40_0_0_2_31
  class Voz_Q6
   police cir percent 25 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 40 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPO_A_1024K_10_18_24_10_9_2_26
  class VozVideo_Q6
    priority
   police cir percent 28 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 24
    bandwidth remaining percent 24
    random-detect dscp-based
    random-detect dscp 24 12 packets 20 packets 1
    random-detect dscp 26 12 packets 20 packets 1
    random-detect dscp 28 12 packets 20 packets 1
    random-detect dscp 30 12 packets 20 packets 1
    queue-limit 40 packets
  class Interativa_Q6
    bandwidth percent 10
    bandwidth remaining percent 10
    random-detect dscp-based
    random-detect dscp 18 7 packets 15 packets 1
    random-detect dscp 20 7 packets 15 packets 1
    random-detect dscp 22 7 packets 15 packets 1
    queue-limit 30 packets
  class Bulk_Q6
    bandwidth percent 9
    bandwidth remaining percent 9
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
    bandwidth percent 26
    bandwidth remaining percent 26
    random-detect dscp-based
    random-detect dscp 0 14 packets 30 packets 1
    queue-limit 60 packets
policy-map QDO_A_1024K_10_18_24_10_9_2_26
  class class-default
    shape average 1024000
   service-policy QPO_A_1024K_10_18_24_10_9_2_26
policy-map QPI_A_1024K_25_N_0_6_50_15_2_1
  class Voz_Q6
   police cir percent 25 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 6 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Interativa_Q6
   police cir percent 50 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Bulk_Q6
   police cir percent 15 conform-action set-mpls-exp-imposition-transmit 4 exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_A_2048K_7_N_0_4_0_0_2_86
  class Voz_Q6
   police cir percent 7 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 4 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QDI_A_2048K_7_0_4_0_0_2_86
  class class-default
   police rate 2048000 child-conform-aware conform-action transmit  exceed-action drop 
   service-policy QPI_A_2048K_7_N_0_4_0_0_2_86
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
policy-map QPI_A_1024K_10_N_0_63_13_0_2_7
  class Voz_Q6
   police cir percent 10 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 63 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Interativa_Q6
   police cir percent 13 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPO_A_6000K_4_0_31_16_4_2_42
  class Voz_Q6
    priority
   police cir percent 4 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 31
    bandwidth remaining percent 31
    random-detect dscp-based
    random-detect dscp 24 56 packets 120 packets 1
    random-detect dscp 26 56 packets 120 packets 1
    random-detect dscp 28 56 packets 120 packets 1
    random-detect dscp 30 56 packets 120 packets 1
    queue-limit 240 packets
  class Interativa_Q6
    bandwidth percent 16
    bandwidth remaining percent 16
    random-detect dscp-based
    random-detect dscp 18 32 packets 64 packets 1
    random-detect dscp 20 32 packets 64 packets 1
    random-detect dscp 22 32 packets 64 packets 1
    queue-limit 128 packets
  class Bulk_Q6
    bandwidth percent 4
    bandwidth remaining percent 4
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
    queue-limit 40 packets
  class class-default
    bandwidth percent 42
    bandwidth remaining percent 42
    random-detect dscp-based
    random-detect dscp 0 112 packets 240 packets 1
    queue-limit 480 packets
policy-map QDO_A_6000K_4_0_31_16_4_2_42
  class class-default
    shape average 6000000
   service-policy QPO_A_6000K_4_0_31_16_4_2_42
policy-map QPI_A_512K_13_N_0_47_13_13_4_7
  class Voz_Q6
   police cir percent 13 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 47 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Interativa_Q6
   police cir percent 13 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Bulk_Q6
   police cir percent 13 conform-action set-mpls-exp-imposition-transmit 4 exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_A_512K_30_N_0_21_10_30_4_4
  class Voz_Q6
   police cir percent 30 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 21 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Interativa_Q6
   police cir percent 10 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Bulk_Q6
   police cir percent 30 conform-action set-mpls-exp-imposition-transmit 4 exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_A_2048K_23_N_0_25_0_0_1_49
  class Voz_Q6
   police cir percent 23 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 25 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_A_16000K_0_N_19_0_0_0_1_78
  class Video_Q6
   police cir percent 19 conform-action set-mpls-exp-imposition-transmit 5 exceed-action drop 
  class class-default
   set mpls experimental imposition 0
policy-map QDI_A_16000K_0_19_0_0_0_1_78
  class class-default
   police rate 16000000 child-conform-aware conform-action transmit  exceed-action drop 
   service-policy QPI_A_16000K_0_N_19_0_0_0_1_78
policy-map QPI_A_1024K_47_N_0_15_11_7_2_4
  class Voz_Q6
   police cir percent 47 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 15 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Interativa_Q6
   police cir percent 11 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Bulk_Q6
   police cir percent 7 conform-action set-mpls-exp-imposition-transmit 4 exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QDI_A_1024K_47_0_15_11_7_2_4
  class class-default
   police rate 1024000 child-conform-aware conform-action transmit  exceed-action drop 
   service-policy QPI_A_1024K_47_N_0_15_11_7_2_4
policy-map QPI_BBONE_S_10000_V1
  class class-default
   police 10000000 312500 312500 conform-action set-dscp-transmit default exceed-action drop 
policy-map QPI_BBONE_S_12288_V1
  class class-default
   police 12288000 384000 384000 conform-action set-dscp-transmit default exceed-action drop 
policy-map QPI_BBONE_S_256_V1
  class class-default
   police 256000 8000 8000 conform-action set-dscp-transmit default exceed-action drop 
policy-map QPI_A_512K_5_N_0_0_13_0_4_77
  class Voz_Q6
   police cir percent 5 conform-action transmit  exceed-action drop 
  class Interativa_Q6
   police cir percent 13 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_BBONE_S_32000_V1
  class class-default
   police 32000000 1000000 1000000 conform-action set-dscp-transmit default exceed-action drop 
policy-map QPI_BBONE_S_1000000_V1
  class class-default
   police 1000000000 31250000 31250000 conform-action set-dscp-transmit default exceed-action drop 
policy-map QPO_A_1024K_3_0_30_16_4_2_44
  class Voz_Q6
    priority
   police cir percent 3 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 30
    bandwidth remaining percent 30
    random-detect dscp-based
    random-detect dscp 24 14 packets 30 packets 1
    random-detect dscp 26 14 packets 30 packets 1
    random-detect dscp 28 14 packets 30 packets 1
    random-detect dscp 30 14 packets 30 packets 1
    queue-limit 60 packets
  class Interativa_Q6
    bandwidth percent 16
    bandwidth remaining percent 16
    random-detect dscp-based
    random-detect dscp 18 12 packets 20 packets 1
    random-detect dscp 20 12 packets 20 packets 1
    random-detect dscp 22 12 packets 20 packets 1
    queue-limit 40 packets
  class Bulk_Q6
    bandwidth percent 4
    bandwidth remaining percent 4
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
    bandwidth percent 44
    bandwidth remaining percent 44
    random-detect dscp-based
    random-detect dscp 0 24 packets 40 packets 1
    queue-limit 80 packets
policy-map QDO_A_1024K_3_0_30_16_4_2_44
  class class-default
    shape average 1024000
   service-policy QPO_A_1024K_3_0_30_16_4_2_44
policy-map QPO_A_14000K_0_7_15_15_20_2_40
  class Video_Q6
    priority
   police cir percent 7 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 15
    bandwidth remaining percent 15
    random-detect dscp-based
    random-detect dscp 24 112 packets 240 packets 1
    random-detect dscp 26 112 packets 240 packets 1
    random-detect dscp 28 112 packets 240 packets 1
    random-detect dscp 30 112 packets 240 packets 1
    queue-limit 480 packets
  class Interativa_Q6
    bandwidth percent 15
    bandwidth remaining percent 15
    random-detect dscp-based
    random-detect dscp 18 112 packets 240 packets 1
    random-detect dscp 20 112 packets 240 packets 1
    random-detect dscp 22 112 packets 240 packets 1
    queue-limit 480 packets
  class Bulk_Q6
    bandwidth percent 20
    bandwidth remaining percent 20
    random-detect dscp-based
    random-detect dscp 8 112 packets 240 packets 1
    random-detect dscp 10 112 packets 240 packets 1
    random-detect dscp 12 112 packets 240 packets 1
    random-detect dscp 14 112 packets 240 packets 1
    random-detect dscp 32 112 packets 240 packets 1
    queue-limit 480 packets
  class NetworkControl_Q6
    bandwidth percent 2
    bandwidth remaining percent 2
    queue-limit 60 packets
  class class-default
    bandwidth percent 40
    bandwidth remaining percent 40
    random-detect dscp-based
    random-detect dscp 0 224 packets 480 packets 1
    queue-limit 960 packets
policy-map QDO_A_14000K_0_7_15_15_20_2_40
  class class-default
    shape average 14000000
   service-policy QPO_A_14000K_0_7_15_15_20_2_40
policy-map PM_V10_QPO_BBONE_128_V1
policy-map QPO_BBONE_128_V1
  class class-default
    shape average 128000
   service-policy PM_V10_QPO_BBONE_128_V1
policy-map QPI_A_2048K_0_N_38_23_0_0_2_24
  class Video_Q6
   police cir percent 38 conform-action set-mpls-exp-imposition-transmit 5 exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 23 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QDI_A_2048K_0_38_23_0_0_2_24
  class class-default
   police rate 2048000 child-conform-aware conform-action transmit  exceed-action drop 
   service-policy QPI_A_2048K_0_N_38_23_0_0_2_24
policy-map QPI_A_6000K_5_N_43_35_0_0_2_14
  class Voz_Q6
   police cir percent 5 conform-action transmit  exceed-action drop 
  class Video_Q6
   police cir percent 43 conform-action set-mpls-exp-imposition-transmit 5 exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 35 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
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
policy-map QPO_512K_11_0_34_25_17_4_8
  class Voz_Q6
    priority
   police cir percent 11 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 34
    random-detect dscp-based
    random-detect dscp 24 40 ms 120 ms 1
    random-detect dscp 26 40 ms 120 ms 1
    random-detect dscp 28 40 ms 120 ms 1
    random-detect dscp 30 40 ms 120 ms 1
  class Interativa_Q6
    bandwidth percent 25
    random-detect dscp-based
    random-detect dscp 18 40 ms 120 ms 1
    random-detect dscp 20 40 ms 120 ms 1
    random-detect dscp 22 40 ms 120 ms 1
  class Bulk_Q6
    bandwidth percent 17
    random-detect dscp-based
    random-detect dscp 8 40 ms 120 ms 1
    random-detect dscp 10 40 ms 120 ms 1
    random-detect dscp 12 40 ms 120 ms 1
    random-detect dscp 14 40 ms 120 ms 1
    random-detect dscp 32 40 ms 120 ms 1
  class NetworkControl_Q6
    bandwidth percent 4
  class class-default
    bandwidth percent 8
    random-detect dscp-based
    random-detect dscp 0 40 ms 120 ms 1
policy-map QPO_A_6000K_41_0_36_0_0_2_20
  class Voz_Q6
    priority
   police cir percent 41 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 36
    bandwidth remaining percent 36
    random-detect dscp-based
    random-detect dscp 24 112 packets 240 packets 1
    random-detect dscp 26 112 packets 240 packets 1
    random-detect dscp 28 112 packets 240 packets 1
    random-detect dscp 30 112 packets 240 packets 1
    queue-limit 480 packets
  class NetworkControl_Q6
    bandwidth percent 2
    bandwidth remaining percent 2
    queue-limit 40 packets
  class class-default
    bandwidth percent 20
    bandwidth remaining percent 20
    random-detect dscp-based
    random-detect dscp 0 56 packets 120 packets 1
    queue-limit 240 packets
policy-map QDO_A_6000K_41_0_36_0_0_2_20
  class class-default
    shape average 6000000
   service-policy QPO_A_6000K_41_0_36_0_0_2_20
policy-map QPI_BBONE_S_20000_V1
  class class-default
   police 20000000 625000 625000 conform-action set-dscp-transmit default exceed-action drop 
policy-map PM_V10_QPO_BBONE_800_V1
policy-map QPO_BBONE_800_V1
  class class-default
    shape average 800000
   service-policy PM_V10_QPO_BBONE_800_V1
policy-map QPI_A_1024K_3_N_0_30_16_4_2_44
  class Voz_Q6
   police cir percent 3 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 30 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Interativa_Q6
   police cir percent 16 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Bulk_Q6
   police cir percent 4 conform-action set-mpls-exp-imposition-transmit 4 exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_A_14000K_0_N_7_15_15_20_2_40
  class Video_Q6
   police cir percent 7 conform-action set-mpls-exp-imposition-transmit 5 exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 15 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Interativa_Q6
   police cir percent 15 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Bulk_Q6
   police cir percent 20 conform-action set-mpls-exp-imposition-transmit 4 exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPO_A_6000K_5_43_35_0_0_2_14
  class VozVideo_Q6
    priority
   police cir percent 48 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 35
    bandwidth remaining percent 35
    random-detect dscp-based
    random-detect dscp 24 112 packets 240 packets 1
    random-detect dscp 26 112 packets 240 packets 1
    random-detect dscp 28 112 packets 240 packets 1
    random-detect dscp 30 112 packets 240 packets 1
    queue-limit 480 packets
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
policy-map QDO_A_6000K_5_43_35_0_0_2_14
  class class-default
    shape average 6000000
   service-policy QPO_A_6000K_5_43_35_0_0_2_14
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
policy-map QPI_A_6000K_41_N_0_36_0_0_2_20
  class Voz_Q6
   police cir percent 41 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 36 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_A_1024K_25_N_0_40_0_0_2_32
  class Voz_Q6
   police cir percent 25 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 40 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
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
policy-map QPI_A_1024K_10_N_18_24_10_9_2_26
  class Voz_Q6
   police cir percent 10 conform-action transmit  exceed-action drop 
  class Video_Q6
   police cir percent 18 conform-action set-mpls-exp-imposition-transmit 5 exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 24 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Interativa_Q6
   police cir percent 10 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Bulk_Q6
   police cir percent 9 conform-action set-mpls-exp-imposition-transmit 4 exceed-action set-mpls-exp-imposition-transmit 1
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
policy-map QPI_A_1024K_13_N_0_50_10_10_2_14
  class Voz_Q6
   police cir percent 13 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 50 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Interativa_Q6
   police cir percent 10 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Bulk_Q6
   police cir percent 10 conform-action set-mpls-exp-imposition-transmit 4 exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_A_6000K_4_N_0_31_16_4_2_42
  class Voz_Q6
   police cir percent 4 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 31 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Interativa_Q6
   police cir percent 16 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Bulk_Q6
   police cir percent 4 conform-action set-mpls-exp-imposition-transmit 4 exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map EntradaLanCE
  class MarcacaoVoz
   set dscp 46
  class MarcacaoSinalizacao
   set dscp 24
  class MarcacaoVideo
   set dscp 34
  class MarcacaoMissaoCritica
   set dscp 26
  class class-default
   set dscp 0
policy-map QPI_A_1024K_22_N_0_0_50_0_2_22
  class Voz_Q6
   police cir percent 22 conform-action transmit  exceed-action drop 
  class Interativa_Q6
   police cir percent 50 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_A_512K_13_N_0_25_25_13_4_2
  class Voz_Q6
   police cir percent 13 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 25 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Interativa_Q6
   police cir percent 25 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Bulk_Q6
   police cir percent 13 conform-action set-mpls-exp-imposition-transmit 4 exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_A_512K_24_N_0_16_11_7_4_37
  class Voz_Q6
   police cir percent 24 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 16 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Interativa_Q6
   police cir percent 11 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Bulk_Q6
   police cir percent 7 conform-action set-mpls-exp-imposition-transmit 4 exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map PM_V10_QPO_BBONE_68000_V1
policy-map QPO_BBONE_68000_V1
  class class-default
    shape average 68000000
   service-policy PM_V10_QPO_BBONE_68000_V1
policy-map QDI_A_6000K_5_43_35_0_0_2_14
  class class-default
   police rate 6000000 child-conform-aware conform-action transmit  exceed-action drop 
   service-policy QPI_A_6000K_5_N_43_35_0_0_2_14
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
policy-map QDI_A_1024K_25_0_40_0_0_2_31
  class class-default
   police rate 1024000 child-conform-aware conform-action transmit  exceed-action drop 
   service-policy QPI_A_1024K_25_N_0_40_0_0_2_31
policy-map QPI_A_512K_7_N_0_24_27_5_4_2
  class Voz_Q6
   police cir percent 7 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 24 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Interativa_Q6
   police cir percent 27 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Bulk_Q6
   police cir percent 5 conform-action set-mpls-exp-imposition-transmit 4 exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_BBONE_S_50000_V1
  class class-default
   police 50000000 1562500 1562500 conform-action set-dscp-transmit default exceed-action drop 
policy-map QPI_BBONE_S_14000_V1
  class class-default
   police 14000000 437500 437500 conform-action set-dscp-transmit default exceed-action drop 
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
policy-map QPO_4096K_16_0_1_55_24_1_2
  class Voz_Q6
    priority
   police cir percent 16 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 1
    random-detect dscp-based
    random-detect dscp 24 40 ms 120 ms 1
    random-detect dscp 26 40 ms 120 ms 1
    random-detect dscp 28 40 ms 120 ms 1
    random-detect dscp 30 40 ms 120 ms 1
  class Interativa_Q6
    bandwidth percent 55
    random-detect dscp-based
    random-detect dscp 18 40 ms 120 ms 1
    random-detect dscp 20 40 ms 120 ms 1
    random-detect dscp 22 40 ms 120 ms 1
  class Bulk_Q6
    bandwidth percent 24
    random-detect dscp-based
    random-detect dscp 8 40 ms 120 ms 1
    random-detect dscp 10 40 ms 120 ms 1
    random-detect dscp 12 40 ms 120 ms 1
    random-detect dscp 14 40 ms 120 ms 1
    random-detect dscp 32 40 ms 120 ms 1
  class NetworkControl_Q6
    bandwidth percent 1
  class class-default
    bandwidth percent 2
    random-detect dscp-based
    random-detect dscp 0 40 ms 120 ms 1
policy-map QPI_BBONE_S_24000_V1
  class class-default
   police 24000000 750000 750000 conform-action set-dscp-transmit default exceed-action drop 
policy-map QPI_A_256K_13_N_0_4_0_0_7_75
  class Voz_Q6
   police cir percent 13 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 4 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_BBONE_S_512_V1
  class class-default
   police 512000 16000 16000 conform-action set-dscp-transmit default exceed-action drop 
policy-map QPI_A_2048K_6_N_0_1_0_0_2_90
  class Voz_Q6
   police cir percent 6 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 1 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QDI_A_1024K_10_18_24_10_9_2_26
  class class-default
   police rate 1024000 child-conform-aware conform-action transmit  exceed-action drop 
   service-policy QPI_A_1024K_10_N_18_24_10_9_2_26
policy-map QPO_A_2048K_7_0_4_0_0_2_86
  class Voz_Q6
    priority
   police cir percent 7 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 4
    bandwidth remaining percent 4
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
    bandwidth percent 86
    bandwidth remaining percent 86
    random-detect dscp-based
    random-detect dscp 0 56 packets 120 packets 1
    queue-limit 240 packets
policy-map QDO_A_2048K_7_0_4_0_0_2_86
  class class-default
    shape average 2048000
   service-policy QPO_A_2048K_7_0_4_0_0_2_86
policy-map QDI_A_1024K_13_0_63_13_0_2_7
  class class-default
   police rate 1024000 child-conform-aware conform-action transmit  exceed-action drop 
   service-policy QPI_A_1024K_13_N_0_63_13_0_2_7
policy-map QPI_A_256K_13_N_0_0_4_4_7_71
  class Voz_Q6
   police cir percent 13 conform-action transmit  exceed-action drop 
  class Interativa_Q6
   police cir percent 4 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Bulk_Q6
   police cir percent 4 conform-action set-mpls-exp-imposition-transmit 4 exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QDI_A_6000K_4_0_31_16_4_2_42
  class class-default
   police rate 6000000 child-conform-aware conform-action transmit  exceed-action drop 
   service-policy QPI_A_6000K_4_N_0_31_16_4_2_42
policy-map QPO_A_16000K_0_19_0_0_0_1_78
  class Video_Q6
    priority
   police cir percent 19 conform-action transmit  exceed-action drop 
  class NetworkControl_Q6
    bandwidth percent 1
    bandwidth remaining percent 1
    queue-limit 60 packets
  class class-default
    bandwidth percent 78
    bandwidth remaining percent 78
    random-detect dscp-based
    random-detect dscp 0 388 packets 900 packets 1
    queue-limit 1800 packets
policy-map QDO_A_16000K_0_19_0_0_0_1_78
  class class-default
    shape average 16000000
   service-policy QPO_A_16000K_0_19_0_0_0_1_78
policy-map QPO_A_1024K_47_0_15_11_7_2_4
  class Voz_Q6
    priority
   police cir percent 47 conform-action transmit  exceed-action drop 
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
    bandwidth percent 11
    bandwidth remaining percent 11
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
    queue-limit 26 packets
  class class-default
    bandwidth percent 4
    bandwidth remaining percent 4
    random-detect dscp-based
    random-detect dscp 0 7 packets 15 packets 1
    queue-limit 30 packets
policy-map QDO_A_1024K_47_0_15_11_7_2_4
  class class-default
    shape average 1024000
   service-policy QPO_A_1024K_47_0_15_11_7_2_4
policy-map QPI_BBONE_S_34000_V1
  class class-default
   police 34000000 1062500 1062500 conform-action set-dscp-transmit default exceed-action drop 
policy-map QPI_A_256K_13_N_0_4_0_0_7_74
  class Voz_Q6
   police cir percent 13 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 4 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_BBONE_S_10240_V1
  class class-default
   police 10240000 320000 320000 conform-action set-dscp-transmit default exceed-action drop 
policy-map QPI_A_512K_5_N_0_16_0_0_4_74
  class Voz_Q6
   police cir percent 5 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 16 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_A_2048K_5_N_0_1_7_0_2_84
  class Voz_Q6
   police cir percent 5 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 1 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Interativa_Q6
   police cir percent 7 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_BBONE_S_16000_V1
  class class-default
   police 16000000 500000 500000 conform-action set-dscp-transmit default exceed-action drop 
policy-map QDI_A_1024K_3_0_30_16_4_2_44
  class class-default
   police rate 1024000 child-conform-aware conform-action transmit  exceed-action drop 
   service-policy QPI_A_1024K_3_N_0_30_16_4_2_44
policy-map QPO_4096K_31_0_27_0_0_1_16
  class Voz_Q6
    priority
   police cir percent 31 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 27
    random-detect dscp-based
    random-detect dscp 24 40 ms 120 ms 1
    random-detect dscp 26 40 ms 120 ms 1
    random-detect dscp 28 40 ms 120 ms 1
    random-detect dscp 30 40 ms 120 ms 1
  class NetworkControl_Q6
    bandwidth percent 1
  class class-default
    bandwidth percent 16
    random-detect dscp-based
    random-detect dscp 0 40 ms 120 ms 1
policy-map QDI_A_14000K_0_7_15_15_20_2_40
  class class-default
   police rate 14000000 child-conform-aware conform-action transmit  exceed-action drop 
   service-policy QPI_A_14000K_0_N_7_15_15_20_2_40
policy-map QPO_A_2048K_0_38_23_0_0_2_24
  class Video_Q6
    priority
   police cir percent 38 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 23
    bandwidth remaining percent 23
    random-detect dscp-based
    random-detect dscp 24 32 packets 48 packets 1
    random-detect dscp 26 32 packets 48 packets 1
    random-detect dscp 28 32 packets 48 packets 1
    random-detect dscp 30 32 packets 48 packets 1
    queue-limit 96 packets
  class NetworkControl_Q6
    bandwidth percent 2
    bandwidth remaining percent 2
    queue-limit 30 packets
  class class-default
    bandwidth percent 24
    bandwidth remaining percent 24
    random-detect dscp-based
    random-detect dscp 0 32 packets 48 packets 1
    queue-limit 96 packets
policy-map QDO_A_2048K_0_38_23_0_0_2_24
  class class-default
    shape average 2048000
   service-policy QPO_A_2048K_0_38_23_0_0_2_24
policy-map QDI_A_2048K_7_0_49_25_10_2_6
  class class-default
   police rate 2048000 child-conform-aware conform-action transmit  exceed-action drop 
   service-policy QPI_A_2048K_7_N_0_49_25_10_2_6
policy-map QDI_A_6000K_41_0_36_0_0_2_20
  class class-default
   police rate 6000000 child-conform-aware conform-action transmit  exceed-action drop 
   service-policy QPI_A_6000K_41_N_0_36_0_0_2_20
policy-map QPO_A_512K_10_0_7_0_0_4_78
  class Voz_Q6
    priority
   police cir percent 10 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 7
    bandwidth remaining percent 7
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
    bandwidth percent 78
    bandwidth remaining percent 78
    random-detect dscp-based
    random-detect dscp 0 24 packets 40 packets 1
    queue-limit 80 packets
policy-map QPO_A_64K_19_0_4_0_0_13_61
  class Voz_Q6
    priority
   police cir percent 19 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 4
    bandwidth remaining percent 4
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
    bandwidth percent 61
    bandwidth remaining percent 61
    queue-limit 26 packets
    random-detect dscp-based
    random-detect dscp 0 5 packets 13 packets 1
policy-map QPO_A_2048K_22_0_5_47_22_2_1
  class Voz_Q6
    priority
   police cir percent 22 conform-action transmit  exceed-action drop 
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
    bandwidth percent 47
    bandwidth remaining percent 47
    random-detect dscp-based
    random-detect dscp 18 32 packets 64 packets 1
    random-detect dscp 20 32 packets 64 packets 1
    random-detect dscp 22 32 packets 64 packets 1
    queue-limit 128 packets
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
    bandwidth percent 2
    bandwidth remaining percent 2
    queue-limit 26 packets
  class class-default
    bandwidth percent 1
    bandwidth remaining percent 1
    random-detect dscp-based
    random-detect dscp 0 5 packets 9 packets 1
    queue-limit 18 packets
policy-map QDO_1024K_11_0_50_13_13_2_10
  class class-default
    shape average 1024000
   service-policy QPO_1024K_11_0_50_13_13_2_10
policy-map QPI_BBONE_N_14000_V1
  class class-default
   police 14000000 437500 437500 conform-action set-mpls-exp-imposition-transmit 0 exceed-action drop 
policy-map QPI_BBONE_N_40000_V1
  class class-default
   police 40000000 1250000 1250000 conform-action set-mpls-exp-imposition-transmit 0 exceed-action drop 
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
policy-map QPI_BBONE_N_400_V1
  class class-default
   police 400000 12500 12500 conform-action set-mpls-exp-imposition-transmit 0 exceed-action drop 
policy-map QPO_A_4096K_16_50_0_0_0_1_31
  class VozVideo_Q6
    priority
   police cir percent 66 conform-action transmit  exceed-action drop 
  class NetworkControl_Q6
    bandwidth percent 1
    bandwidth remaining percent 1
    queue-limit 26 packets
  class class-default
    bandwidth percent 31
    bandwidth remaining percent 31
    random-detect dscp-based
    random-detect dscp 0 56 packets 120 packets 1
    queue-limit 240 packets
policy-map QPO_A_2048K_16_15_10_25_0_2_30
  class VozVideo_Q6
    priority
   police cir percent 31 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 10
    bandwidth remaining percent 10
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
  class NetworkControl_Q6
    bandwidth percent 2
    bandwidth remaining percent 2
    queue-limit 26 packets
  class class-default
    bandwidth percent 30
    bandwidth remaining percent 30
    random-detect dscp-based
    random-detect dscp 0 32 packets 48 packets 1
    queue-limit 96 packets
policy-map QPI_64_30_0_25_8_0_0_0B_A_V1
  class TEMPO_REAL_VOZ
   police cir percent 50 conform-action transmit  exceed-action drop 
  class MISSAO_CRITICA
   police cir percent 37 conform-action transmit  exceed-action set-dscp-transmit af43
  class GERENCIAMENTO
   police cir percent 13 conform-action transmit  exceed-action set-dscp-transmit af32
policy-map QPO_A_64K_29_0_21_11_22_13_1
  class Voz_Q6
    priority
   police cir percent 29 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 21
    bandwidth remaining percent 21
    random-detect dscp-based
    random-detect dscp 24 6 packets 8 packets 1
    random-detect dscp 26 6 packets 8 packets 1
    random-detect dscp 28 6 packets 8 packets 1
    random-detect dscp 30 6 packets 8 packets 1
    queue-limit 16 packets
  class Interativa_Q6
    bandwidth percent 11
    bandwidth remaining percent 11
    random-detect dscp-based
    random-detect dscp 18 5 packets 7 packets 1
    random-detect dscp 20 5 packets 7 packets 1
    random-detect dscp 22 5 packets 7 packets 1
    queue-limit 14 packets
  class Bulk_Q6
    bandwidth percent 22
    bandwidth remaining percent 22
    random-detect dscp-based
    random-detect dscp 8 6 packets 8 packets 1
    random-detect dscp 10 6 packets 8 packets 1
    random-detect dscp 12 6 packets 8 packets 1
    random-detect dscp 14 6 packets 8 packets 1
    random-detect dscp 32 6 packets 8 packets 1
    queue-limit 16 packets
  class NetworkControl_Q6
    bandwidth percent 13
    bandwidth remaining percent 13
    queue-limit 16 packets
  class class-default
    bandwidth percent 1
    bandwidth remaining percent 1
    random-detect dscp-based
    random-detect dscp 0 5 packets 7 packets 1
    queue-limit 14 packets
policy-map QPI_BBONE_N_16000_V1
  class class-default
   police 16000000 500000 500000 conform-action set-mpls-exp-imposition-transmit 0 exceed-action drop 
policy-map QPO_A_2048K_7_0_63_0_15_2_12
  class Voz_Q6
    priority
   police cir percent 7 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 63
    bandwidth remaining percent 63
    random-detect dscp-based
    random-detect dscp 24 56 packets 120 packets 1
    random-detect dscp 26 56 packets 120 packets 1
    random-detect dscp 28 56 packets 120 packets 1
    random-detect dscp 30 56 packets 120 packets 1
    queue-limit 240 packets
  class Bulk_Q6
    bandwidth percent 15
    bandwidth remaining percent 15
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
    bandwidth percent 12
    bandwidth remaining percent 12
    random-detect dscp-based
    random-detect dscp 0 12 packets 20 packets 1
    queue-limit 40 packets
policy-map QPI_2048K_13_N_0_56_0_0_1_29
  class Voz_Q6
   police cir percent 13 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 56 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QDI_2048K_13_0_56_0_0_1_29
  class class-default
   police rate 2048000 conform-action transmit  exceed-action drop 
   service-policy QPI_2048K_13_N_0_56_0_0_1_29
policy-map QDO_2048K_BBrasil_NAC_IPSAN_GACC_V1
  class class-default
    shape average 2048000
   service-policy QPO_2048K_BBrasil_NAC_IPSAN_GACC_V1
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
policy-map QPI_BBONE_N_512_V1
  class class-default
   police 512000 16000 16000 conform-action set-mpls-exp-imposition-transmit 0 exceed-action drop 
policy-map QPI_BBONE_N_600_V1
  class class-default
   police 600000 18750 18750 conform-action set-mpls-exp-imposition-transmit 0 exceed-action drop 
policy-map QPI_BBONE_N_24000_V1
  class class-default
   police 24000000 750000 750000 conform-action set-mpls-exp-imposition-transmit 0 exceed-action drop 
policy-map QPI_4096K_6_N_0_0_0_0_1_91
  class Voz_Q6
   police cir percent 6 conform-action transmit  exceed-action drop 
  class class-default
   set mpls experimental imposition 0
policy-map QDI_4096K_6_0_0_0_0_1_91
  class class-default
   police rate 4096000 conform-action transmit  exceed-action drop 
   service-policy QPI_4096K_6_N_0_0_0_0_1_91
policy-map QPI_512K_11_C_0_34_25_17_4_8
  class Voz_Q6
   police cir percent 22 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 34 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Interativa_Q6
   police cir percent 25 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Bulk_Q6
   police cir percent 17 conform-action set-mpls-exp-imposition-transmit 4 exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPO_64_30_0_25_8_0_0_0B_A_V1
  class TEMPO_REAL_VOZ
    priority
   police cir percent 50 conform-action transmit  exceed-action drop 
  class MISSAO_CRITICA
    bandwidth percent 39
    bandwidth remaining percent 39
    random-detect dscp-based
    random-detect dscp 32 5 packets 9 packets 1
    random-detect dscp 36 5 packets 9 packets 1
    random-detect dscp 38 5 packets 9 packets 1
    queue-limit 18 packets
  class GERENCIAMENTO
    bandwidth percent 11
    bandwidth remaining percent 11
    random-detect dscp-based
    random-detect dscp 24 5 packets 7 packets 1
    random-detect dscp 26 5 packets 7 packets 1
    random-detect dscp 28 5 packets 7 packets 1
    queue-limit 14 packets
policy-map QPI_BBONE_N_256_V1
  class class-default
   police 256000 8000 8000 conform-action set-mpls-exp-imposition-transmit 0 exceed-action drop 
policy-map QPI_BBONE_N_10000_V1
  class class-default
   police 10000000 312500 312500 conform-action set-mpls-exp-imposition-transmit 0 exceed-action drop 
policy-map QDO_2048K_13_0_56_0_0_1_29
  class class-default
    shape average 2048000
   service-policy QPO_2048K_13_0_56_0_0_1_29
policy-map QDI_2048K_BBrasil_NAC_IPSAN_GACC_V1
  class class-default
   police rate 2048000 conform-action transmit  exceed-action drop 
   service-policy QPI_2048K_BBrasil_NAC_IPSAN_GACC_V1
policy-map QPO_A_1024K_7_0_45_27_0_2_18
  class Voz_Q6
    priority
   police cir percent 7 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 45
    bandwidth remaining percent 45
    random-detect dscp-based
    random-detect dscp 24 24 packets 40 packets 1
    random-detect dscp 26 24 packets 40 packets 1
    random-detect dscp 28 24 packets 40 packets 1
    random-detect dscp 30 24 packets 40 packets 1
    queue-limit 80 packets
  class Interativa_Q6
    bandwidth percent 27
    bandwidth remaining percent 27
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
    bandwidth percent 18
    bandwidth remaining percent 18
    random-detect dscp-based
    random-detect dscp 0 12 packets 20 packets 1
    queue-limit 40 packets
policy-map QPO_A_1024K_32_18_0_0_0_2_47
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
policy-map QDO_4096K_6_0_0_0_0_1_91
  class class-default
    shape average 4096000
   service-policy QPO_4096K_6_0_0_0_0_1_91
policy-map QDO_MCI_ETM_1536K_0_1536K_V1
  class class-default
   service-policy QPO_MCI_ETM_1536K_0_1536K_V1
policy-map QPI_1024K_11_C_0_50_13_13_2_10
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
policy-map QDI_1024K_11_0_50_13_13_2_10
  class class-default
   police rate 1024000 conform-action transmit  exceed-action drop 
   service-policy QPI_1024K_11_C_0_50_13_13_2_10
policy-map QPI_BBONE_N_12000_V1
  class class-default
   police 12000000 375000 375000 conform-action set-mpls-exp-imposition-transmit 0 exceed-action drop 
policy-map QPO_A_4096K_13_37_0_0_0_1_45
  class VozVideo_Q6
    priority
   police cir percent 50 conform-action transmit  exceed-action drop 
  class NetworkControl_Q6
    bandwidth percent 1
    bandwidth remaining percent 1
    queue-limit 30 packets
  class class-default
    bandwidth percent 45
    bandwidth remaining percent 45
    random-detect dscp-based
    random-detect dscp 0 56 packets 120 packets 1
    queue-limit 240 packets
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
policy-map QPO_A_512K_8_0_15_22_35_4_15
  class Voz_Q6
    priority
   police cir percent 8 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 15
    bandwidth remaining percent 15
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
    random-detect dscp 18 7 packets 15 packets 1
    random-detect dscp 20 7 packets 15 packets 1
    random-detect dscp 22 7 packets 15 packets 1
    queue-limit 30 packets
  class Bulk_Q6
    bandwidth percent 35
    bandwidth remaining percent 35
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
    bandwidth percent 15
    bandwidth remaining percent 15
    random-detect dscp-based
    random-detect dscp 0 7 packets 15 packets 1
    queue-limit 30 packets
policy-map QPI_BBONE_N_20000_V1
  class class-default
   police 20000000 625000 625000 conform-action set-mpls-exp-imposition-transmit 0 exceed-action drop 
policy-map QPO_A_256K_13_0_4_0_0_7_74
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
    bandwidth percent 74
    bandwidth remaining percent 74
    random-detect dscp-based
    random-detect dscp 0 12 packets 20 packets 1
    queue-limit 40 packets
policy-map QPO_A_512K_5_0_16_0_0_4_74
  class Voz_Q6
    priority
   police cir percent 5 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 16
    bandwidth remaining percent 16
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
    bandwidth percent 74
    bandwidth remaining percent 74
    random-detect dscp-based
    random-detect dscp 0 14 packets 30 packets 1
    queue-limit 60 packets
policy-map QPO_A_2048K_5_0_1_7_0_2_84
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
  class Interativa_Q6
    bandwidth percent 7
    bandwidth remaining percent 7
    random-detect dscp-based
    random-detect dscp 18 12 packets 20 packets 1
    random-detect dscp 20 12 packets 20 packets 1
    random-detect dscp 22 12 packets 20 packets 1
    queue-limit 40 packets
  class NetworkControl_Q6
    bandwidth percent 2
    bandwidth remaining percent 2
    queue-limit 26 packets
  class class-default
    bandwidth percent 84
    bandwidth remaining percent 84
    random-detect dscp-based
    random-detect dscp 0 56 packets 120 packets 1
    queue-limit 240 packets
policy-map QPO_A_20000K_0_RCC_CLARO
  class MissaoCritica_Q6
    bandwidth percent 20
    bandwidth remaining percent 20
    random-detect dscp-based
    random-detect dscp 24 388 packets 900 packets 1
    random-detect dscp 26 388 packets 900 packets 1
    random-detect dscp 28 388 packets 900 packets 1
    random-detect dscp 30 388 packets 900 packets 1
    queue-limit 1800 packets
  class Interativa_Q6
    bandwidth percent 20
    bandwidth remaining percent 20
    random-detect dscp-based
    random-detect dscp 18 388 packets 900 packets 1
    random-detect dscp 20 388 packets 900 packets 1
    random-detect dscp 22 388 packets 900 packets 1
    queue-limit 1800 packets
  class Bulk_Q6
    bandwidth percent 20
    bandwidth remaining percent 20
    random-detect dscp-based
    random-detect dscp 8 388 packets 900 packets 1
    random-detect dscp 10 388 packets 900 packets 1
    random-detect dscp 12 388 packets 900 packets 1
    random-detect dscp 14 388 packets 900 packets 1
    random-detect dscp 32 388 packets 900 packets 1
    queue-limit 1800 packets
  class NetworkControl_Q6
    bandwidth percent 1
    bandwidth remaining percent 1
    queue-limit 240 packets
  class class-default
    bandwidth percent 38
    bandwidth remaining percent 38
    random-detect dscp-based
    random-detect dscp 0 988 packets 1500 packets 1
    queue-limit 3000 packets
policy-map QPI_4096K_31_N_0_27_0_0_1_16
  class Voz_Q6
   police cir percent 31 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 27 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
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
policy-map QOS_POLICY_OUT_A_7P_3P
  class REALTIME
    priority
   police cir percent 7 conform-action transmit  exceed-action drop 
  class BUSINESS
    bandwidth percent 3
    random-detect dscp-based
    random-detect dscp 24 12 packets 20 packets 1
    random-detect dscp 26 12 packets 20 packets 1
    random-detect dscp 28 12 packets 20 packets 1
    random-detect dscp 30 12 packets 20 packets 1
policy-map QDO_4096K_16_0_1_55_24_1_2
  class class-default
    shape average 4096000
   service-policy QPO_4096K_16_0_1_55_24_1_2
policy-map QPO_A_512K_7_0_24_27_5_4_2
  class Voz_Q6
    priority
   police cir percent 7 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 24
    bandwidth remaining percent 24
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
    bandwidth percent 5
    bandwidth remaining percent 5
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
    queue-limit 26 packets
  class class-default
    bandwidth percent 2
    bandwidth remaining percent 2
    random-detect dscp-based
    random-detect dscp 0 5 packets 13 packets 1
    queue-limit 26 packets
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
policy-map QOS_POLICY_OUT_A_7P_0P
  class REALTIME
    priority
   police cir percent 7 conform-action transmit  exceed-action drop 
policy-map QPI_4096K_16_N_0_1_55_24_1_2
  class Voz_Q6
   police cir percent 16 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 1 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Interativa_Q6
   police cir percent 55 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Bulk_Q6
   police cir percent 24 conform-action set-mpls-exp-imposition-transmit 4 exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
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
policy-map QPO_A_1024K_22_0_0_50_0_2_22
  class Voz_Q6
    priority
   police cir percent 22 conform-action transmit  exceed-action drop 
  class Interativa_Q6
    bandwidth percent 50
    bandwidth remaining percent 50
    random-detect dscp-based
    random-detect dscp 18 32 packets 48 packets 1
    random-detect dscp 20 32 packets 48 packets 1
    random-detect dscp 22 32 packets 48 packets 1
    queue-limit 96 packets
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
policy-map QPO_A_512K_13_0_25_25_13_4_2
  class Voz_Q6
    priority
   police cir percent 13 conform-action transmit  exceed-action drop 
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
    bandwidth percent 25
    bandwidth remaining percent 25
    random-detect dscp-based
    random-detect dscp 18 12 packets 20 packets 1
    random-detect dscp 20 12 packets 20 packets 1
    random-detect dscp 22 12 packets 20 packets 1
    queue-limit 40 packets
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
    queue-limit 26 packets
  class class-default
    bandwidth percent 2
    bandwidth remaining percent 2
    random-detect dscp-based
    random-detect dscp 0 5 packets 9 packets 1
    queue-limit 18 packets
policy-map QPO_A_512K_24_0_16_11_7_4_37
  class Voz_Q6
    priority
   police cir percent 24 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 16
    bandwidth remaining percent 16
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
    random-detect dscp 18 5 packets 13 packets 1
    random-detect dscp 20 5 packets 13 packets 1
    random-detect dscp 22 5 packets 13 packets 1
    queue-limit 26 packets
  class Bulk_Q6
    bandwidth percent 7
    bandwidth remaining percent 7
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
    bandwidth percent 37
    bandwidth remaining percent 37
    random-detect dscp-based
    random-detect dscp 0 12 packets 20 packets 1
    queue-limit 40 packets
policy-map QOS_POLICY_OUT_A_10P_25P
  class REALTIME
    priority
   police cir percent 10 conform-action transmit  exceed-action drop 
  class BUSINESS
    bandwidth percent 25
    random-detect dscp-based
    random-detect dscp 24 56 packets 120 packets 1
    random-detect dscp 26 56 packets 120 packets 1
    random-detect dscp 28 56 packets 120 packets 1
    random-detect dscp 30 56 packets 120 packets 1
policy-map QDO_4096K_31_0_27_0_0_1_16
  class class-default
    shape average 4096000
   service-policy QPO_4096K_31_0_27_0_0_1_16
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
policy-map QPO_A_1024K_13_0_50_10_10_2_14
  class Voz_Q6
    priority
   police cir percent 13 conform-action transmit  exceed-action drop 
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
    bandwidth percent 10
    bandwidth remaining percent 10
    random-detect dscp-based
    random-detect dscp 18 7 packets 15 packets 1
    random-detect dscp 20 7 packets 15 packets 1
    random-detect dscp 22 7 packets 15 packets 1
    queue-limit 30 packets
  class Bulk_Q6
    bandwidth percent 10
    bandwidth remaining percent 10
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
    bandwidth percent 14
    bandwidth remaining percent 14
    random-detect dscp-based
    random-detect dscp 0 12 packets 20 packets 1
    queue-limit 40 packets
policy-map QPO_A_2048K_20_20_28_14_11_2_4
  class VozVideo_Q6
    priority
   police cir percent 40 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 28
    bandwidth remaining percent 28
    random-detect dscp-based
    random-detect dscp 24 32 packets 48 packets 1
    random-detect dscp 26 32 packets 48 packets 1
    random-detect dscp 28 32 packets 48 packets 1
    random-detect dscp 30 32 packets 48 packets 1
    queue-limit 96 packets
  class Interativa_Q6
    bandwidth percent 14
    bandwidth remaining percent 14
    random-detect dscp-based
    random-detect dscp 18 14 packets 30 packets 1
    random-detect dscp 20 14 packets 30 packets 1
    random-detect dscp 22 14 packets 30 packets 1
    queue-limit 60 packets
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
    bandwidth percent 4
    bandwidth remaining percent 4
    random-detect dscp-based
    random-detect dscp 0 7 packets 15 packets 1
    queue-limit 30 packets
policy-map QPI_BBONE_N_800_V1
  class class-default
   police 800000 25000 25000 conform-action set-mpls-exp-imposition-transmit 0 exceed-action drop 
policy-map QDI_4096K_31_0_27_0_0_1_16
  class class-default
   police rate 4096000 conform-action transmit  exceed-action drop 
   service-policy QPI_4096K_31_N_0_27_0_0_1_16
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
policy-map QPI_A_20000K_0_RCC_CLARO
  class MissaoCritica_Q6
   police cir percent 20 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Interativa_Q6
   police cir percent 20 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Bulk_Q6
   police cir percent 20 conform-action set-mpls-exp-imposition-transmit 4 exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_BBONE_N_128_V1
  class class-default
   police 128000 4470 4470 conform-action set-mpls-exp-imposition-transmit 0 exceed-action drop 
policy-map ZERA-EXP-Saida
  class class-default
   set mpls experimental imposition 0
policy-map QPO_A_1024K_25_0_6_50_15_2_1
  class Voz_Q6
    priority
   police cir percent 25 conform-action transmit  exceed-action drop 
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
    bandwidth percent 50
    bandwidth remaining percent 50
    random-detect dscp-based
    random-detect dscp 18 32 packets 48 packets 1
    random-detect dscp 20 32 packets 48 packets 1
    random-detect dscp 22 32 packets 48 packets 1
    queue-limit 96 packets
  class Bulk_Q6
    bandwidth percent 15
    bandwidth remaining percent 15
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
    bandwidth percent 1
    bandwidth remaining percent 1
    random-detect dscp-based
    random-detect dscp 0 6 packets 8 packets 1
    queue-limit 16 packets
policy-map QPO_A_1024K_10_0_63_13_0_2_7
  class Voz_Q6
    priority
   police cir percent 10 conform-action transmit  exceed-action drop 
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
policy-map QPO_A_512K_13_0_47_13_13_4_7
  class Voz_Q6
    priority
   police cir percent 13 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 47
    bandwidth remaining percent 47
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
    bandwidth percent 7
    bandwidth remaining percent 7
    random-detect dscp-based
    random-detect dscp 0 5 packets 13 packets 1
    queue-limit 26 packets
policy-map QPO_A_512K_30_0_21_10_30_4_4
  class Voz_Q6
    priority
   police cir percent 30 conform-action transmit  exceed-action drop 
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
    bandwidth percent 10
    bandwidth remaining percent 10
    random-detect dscp-based
    random-detect dscp 18 5 packets 13 packets 1
    random-detect dscp 20 5 packets 13 packets 1
    random-detect dscp 22 5 packets 13 packets 1
    queue-limit 26 packets
  class Bulk_Q6
    bandwidth percent 30
    bandwidth remaining percent 30
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
    bandwidth percent 4
    bandwidth remaining percent 4
    random-detect dscp-based
    random-detect dscp 0 5 packets 9 packets 1
    queue-limit 18 packets
policy-map QPO_A_2048K_23_0_25_0_0_1_49
  class Voz_Q6
    priority
   police cir percent 23 conform-action transmit  exceed-action drop 
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
    bandwidth percent 49
    bandwidth remaining percent 49
    random-detect dscp-based
    random-detect dscp 0 32 packets 64 packets 1
    queue-limit 128 packets
policy-map QDI_4096K_16_0_1_55_24_1_2
  class class-default
   police rate 4096000 conform-action transmit  exceed-action drop 
   service-policy QPI_4096K_16_N_0_1_55_24_1_2
policy-map QPO_A_512K_10_0_39_0_0_4_46
  class Voz_Q6
    priority
   police cir percent 10 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 39
    bandwidth remaining percent 39
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
    bandwidth percent 46
    bandwidth remaining percent 46
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
policy-map QPO_A_512K_10_0_54_22_0_4_9
  class Voz_Q6
    priority
   police cir percent 10 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 54
    bandwidth remaining percent 54
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
    random-detect dscp 18 7 packets 15 packets 1
    random-detect dscp 20 7 packets 15 packets 1
    random-detect dscp 22 7 packets 15 packets 1
    queue-limit 30 packets
  class NetworkControl_Q6
    bandwidth percent 4
    bandwidth remaining percent 4
    queue-limit 18 packets
  class class-default
    bandwidth percent 9
    bandwidth remaining percent 9
    random-detect dscp-based
    random-detect dscp 0 5 packets 13 packets 1
    queue-limit 26 packets
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
policy-map QPO_A_10000K_8_16_52_0_0_1_21
  class VozVideo_Q6
    priority
   police cir percent 24 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 52
    bandwidth remaining percent 52
    random-detect dscp-based
    random-detect dscp 24 224 packets 480 packets 1
    random-detect dscp 26 224 packets 480 packets 1
    random-detect dscp 28 224 packets 480 packets 1
    random-detect dscp 30 224 packets 480 packets 1
    queue-limit 960 packets
  class NetworkControl_Q6
    bandwidth percent 1
    bandwidth remaining percent 1
    queue-limit 40 packets
  class class-default
    bandwidth percent 21
    bandwidth remaining percent 21
    random-detect dscp-based
    random-detect dscp 0 112 packets 240 packets 1
    queue-limit 480 packets
policy-map QPO_A_1024K_0_0_47_0_0_2_49
  class MissaoCritica_Q6
    bandwidth percent 47
    bandwidth remaining percent 47
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
    bandwidth percent 49
    bandwidth remaining percent 49
    random-detect dscp-based
    random-detect dscp 0 24 packets 40 packets 1
    queue-limit 80 packets
policy-map QPI_8000K_2_N_5_72_0_0_1_18
  class Voz_Q6
   police cir percent 2 conform-action transmit  exceed-action drop 
  class Video_Q6
   police cir percent 5 conform-action set-mpls-exp-imposition-transmit 5 exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 72 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map MARCA-GER
  class class-default
   set dscp 16
policy-map QPO_A_256K_13_0_60_0_0_7_19
  class Voz_Q6
    priority
   police cir percent 13 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 60
    bandwidth remaining percent 60
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
policy-map QPO_A_256K_10_0_61_13_0_7_8
  class Voz_Q6
    priority
   police cir percent 10 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 61
    bandwidth remaining percent 61
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
    bandwidth percent 8
    bandwidth remaining percent 8
    random-detect dscp-based
    random-detect dscp 0 5 packets 9 packets 1
    queue-limit 18 packets
policy-map QPI_BBONE_N_1500_V1
  class class-default
   police 1504000 47000 47000 conform-action set-mpls-exp-imposition-transmit 0 exceed-action drop 
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
policy-map QPO_A_40000K_6_11_16_16_21_1_28
  class VozVideo_Q6
    priority
   police cir percent 17 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 16
    bandwidth remaining percent 16
    random-detect dscp-based
    random-detect dscp 24 224 packets 480 packets 1
    random-detect dscp 26 224 packets 480 packets 1
    random-detect dscp 28 224 packets 480 packets 1
    random-detect dscp 30 224 packets 480 packets 1
    queue-limit 960 packets
  class Interativa_Q6
    bandwidth percent 16
    bandwidth remaining percent 16
    random-detect dscp-based
    random-detect dscp 18 224 packets 480 packets 1
    random-detect dscp 20 224 packets 480 packets 1
    random-detect dscp 22 224 packets 480 packets 1
    queue-limit 960 packets
  class Bulk_Q6
    bandwidth percent 21
    bandwidth remaining percent 21
    random-detect dscp-based
    random-detect dscp 8 344 packets 600 packets 1
    random-detect dscp 10 344 packets 600 packets 1
    random-detect dscp 12 344 packets 600 packets 1
    random-detect dscp 14 344 packets 600 packets 1
    random-detect dscp 32 344 packets 600 packets 1
    queue-limit 1200 packets
  class NetworkControl_Q6
    bandwidth percent 1
    bandwidth remaining percent 1
    queue-limit 80 packets
  class class-default
    bandwidth percent 28
    bandwidth remaining percent 28
    random-detect dscp-based
    random-detect dscp 0 388 packets 900 packets 1
    queue-limit 1800 packets
policy-map QPO_A_50000K_3_0_0_0_0_1_94
  class Voz_Q6
    priority
   police cir percent 3 conform-action transmit  exceed-action drop 
  class NetworkControl_Q6
    bandwidth percent 1
    bandwidth remaining percent 1
    queue-limit 128 packets
  class class-default
    bandwidth percent 94
    bandwidth remaining percent 94
    random-detect dscp-based
    random-detect dscp 0 988 packets 1500 packets 1
    queue-limit 3000 packets
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
   set mpls experimental imposition 0
policy-map QPO_A_512K_22_20_28_13_11_4_1
  class VozVideo_Q6
    priority
   police cir percent 42 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 28
    bandwidth remaining percent 28
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
    random-detect dscp 18 7 packets 15 packets 1
    random-detect dscp 20 7 packets 15 packets 1
    random-detect dscp 22 7 packets 15 packets 1
    queue-limit 30 packets
  class Bulk_Q6
    bandwidth percent 11
    bandwidth remaining percent 11
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
    bandwidth percent 1
    bandwidth remaining percent 1
    random-detect dscp-based
    random-detect dscp 0 5 packets 7 packets 1
    queue-limit 14 packets
policy-map QPI_BBONE_N_1024_V1
  class class-default
   police 1024000 32000 32000 conform-action set-mpls-exp-imposition-transmit 0 exceed-action drop 
policy-map QPO_A_50000K_3_0_0_0_0_2_94
  class Voz_Q6
    priority
   police cir percent 3 conform-action transmit  exceed-action drop 
  class NetworkControl_Q6
    bandwidth percent 2
    bandwidth remaining percent 2
    queue-limit 240 packets
  class class-default
    bandwidth percent 94
    bandwidth remaining percent 94
    random-detect dscp-based
    random-detect dscp 0 988 packets 1500 packets 1
    queue-limit 3000 packets
policy-map QPO_A_1024K_6_0_48_0_0_2_43
  class Voz_Q6
    priority
   police cir percent 6 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 48
    bandwidth remaining percent 48
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
    bandwidth percent 43
    bandwidth remaining percent 43
    random-detect dscp-based
    random-detect dscp 0 24 packets 40 packets 1
    queue-limit 80 packets
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
policy-map QPI_BBONE_N_6000_V1
  class class-default
   police 6000000 187500 187500 conform-action set-mpls-exp-imposition-transmit 0 exceed-action drop 
policy-map SaidaIntBackbone_100M_E5
  class RealTime_CANINHO
    priority
   police cir percent 80 conform-action transmit  exceed-action drop 
  class Business_CANINHO
    bandwidth remaining percent 25
    random-detect
    random-detect precedence 1 1000 packets 3200 packets 1
    random-detect precedence 2 3200 packets 9500 packets 1
    random-detect precedence 3 3200 packets 9500 packets 1
    random-detect precedence 4 3200 packets 9500 packets 1
  class Routing_CANINHO
    bandwidth remaining percent 50
  class class-default
    bandwidth remaining percent 25
    random-detect
    random-detect precedence 0 2200 packets 6600 packets 1
policy-map CANINHO_IntBackbone_100Mbps_100M_E5
  class class-default
    shape average 100000000
   service-policy SaidaIntBackbone_100M_E5
policy-map QPI_TMX_4096K_PB24_L_A_V1
  class rpvm_voz_tmx
   police cir percent 25 conform-action set-mpls-exp-imposition-transmit 5 exceed-action drop 
  class rpvm_video_tmx
   police cir percent 25 conform-action set-mpls-exp-imposition-transmit 3 exceed-action drop 
  class rpvm_datos_criticos_tmx
   police cir percent 25 conform-action set-mpls-exp-imposition-transmit 3 exceed-action set-mpls-exp-imposition-transmit 1
  class rpvm_business_tmx
   police cir percent 13 conform-action set-mpls-exp-imposition-transmit 2 exceed-action set-mpls-exp-imposition-transmit 1
  class rpvm_mngmnt_routing_tmx
   police cir percent 15 conform-action set-mpls-exp-imposition-transmit 6 exceed-action set-mpls-exp-imposition-transmit 6
  class class-default
   police cir percent 15 conform-action set-mpls-exp-imposition-transmit 0 exceed-action set-mpls-exp-imposition-transmit 0
policy-map QDI_TMX_4096K_PB24_L_A_V1
  class class-default
   police cir 4096000 bc 128000 be 128000
   service-policy QPI_TMX_4096K_PB24_L_A_V1
policy-map QPO_A_2048K_20_30_34_0_0_2_13
  class VozVideo_Q6
    priority
   police cir percent 50 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 34
    bandwidth remaining percent 34
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
    bandwidth percent 13
    bandwidth remaining percent 13
    random-detect dscp-based
    random-detect dscp 0 14 packets 30 packets 1
    queue-limit 60 packets
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
policy-map QPO_10000K_BBrasil_NAC_GACC_V1
  class TEMPO_REAL_NAC
    priority
   police cir percent 32 conform-action transmit  exceed-action drop 
  class MISSAO_CRITICA_NAC
    bandwidth percent 40
    bandwidth remaining percent 40
    random-detect dscp-based
    random-detect dscp 32 112 packets 240 packets 1
    random-detect dscp 34 112 packets 240 packets 1
    random-detect dscp 38 112 packets 240 packets 1
    queue-limit 480 packets
  class GERENCIAMENTO_NAC
    bandwidth percent 3
    bandwidth remaining percent 3
    random-detect dscp-based
    random-detect dscp 24 14 packets 30 packets 1
    random-detect dscp 26 14 packets 30 packets 1
    random-detect dscp 30 14 packets 30 packets 1
    queue-limit 60 packets
  class NETWORK_CONTROL_NAC
    bandwidth percent 1
    bandwidth remaining percent 1
    random-detect dscp-based
    random-detect dscp 48 12 packets 20 packets 1
    queue-limit 40 packets
  class STANDARD_NAC
    bandwidth percent 20
    bandwidth remaining percent 20
    random-detect dscp-based
    random-detect dscp 0 112 packets 240 packets 1
    queue-limit 480 packets
policy-map QPO_256K_BBrasil_NAC_GACC_V1
  class TEMPO_REAL_NAC
    priority
   police cir percent 20 conform-action transmit  exceed-action drop 
  class MISSAO_CRITICA_NAC
    bandwidth percent 40
    bandwidth remaining percent 40
    random-detect dscp-based
    random-detect dscp 32 7 packets 15 packets 1
    random-detect dscp 34 7 packets 15 packets 1
    random-detect dscp 38 7 packets 15 packets 1
    queue-limit 30 packets
  class GERENCIAMENTO_NAC
    bandwidth percent 15
    bandwidth remaining percent 15
    random-detect dscp-based
    random-detect dscp 24 5 packets 13 packets 1
    random-detect dscp 26 5 packets 13 packets 1
    random-detect dscp 30 5 packets 13 packets 1
    queue-limit 26 packets
  class NETWORK_CONTROL_NAC
    bandwidth percent 3
    bandwidth remaining percent 3
    random-detect dscp-based
    random-detect dscp 48 6 packets 8 packets 1
    queue-limit 16 packets
  class STANDARD_NAC
    bandwidth percent 20
    bandwidth remaining percent 20
    random-detect dscp-based
    random-detect dscp 0 5 packets 13 packets 1
    queue-limit 26 packets
policy-map QPO_A_10000K_8_16_52_0_0_2_21
  class VozVideo_Q6
    priority
   police cir percent 24 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 52
    bandwidth remaining percent 52
    random-detect dscp-based
    random-detect dscp 24 224 packets 480 packets 1
    random-detect dscp 26 224 packets 480 packets 1
    random-detect dscp 28 224 packets 480 packets 1
    random-detect dscp 30 224 packets 480 packets 1
    queue-limit 960 packets
  class NetworkControl_Q6
    bandwidth percent 2
    bandwidth remaining percent 2
    queue-limit 40 packets
  class class-default
    bandwidth percent 21
    bandwidth remaining percent 21
    random-detect dscp-based
    random-detect dscp 0 112 packets 240 packets 1
    queue-limit 480 packets
policy-map QPO_8000K_2_5_72_0_0_1_18
  class VozVideo_Q6
    priority
   police cir percent 7 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 72
    random-detect dscp-based
    random-detect dscp 24 40 ms 120 ms 1
    random-detect dscp 26 40 ms 120 ms 1
    random-detect dscp 28 40 ms 120 ms 1
    random-detect dscp 30 40 ms 120 ms 1
  class NetworkControl_Q6
    bandwidth percent 1
  class class-default
    bandwidth percent 18
    random-detect dscp-based
    random-detect dscp 0 40 ms 120 ms 1
policy-map QDO_8000K_2_5_72_0_0_1_18
  class class-default
    shape average 8000000
   service-policy QPO_8000K_2_5_72_0_0_1_18
policy-map QPO_A_2048K_15_25_38_0_0_1_19
  class VozVideo_Q6
    priority
   police cir percent 40 conform-action transmit  exceed-action drop 
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
    bandwidth percent 19
    bandwidth remaining percent 19
    random-detect dscp-based
    random-detect dscp 0 24 packets 40 packets 1
    queue-limit 80 packets
policy-map QPI_BBONE_N_100000_V1
  class class-default
   police 100000000 3125000 3125000 conform-action set-mpls-exp-imposition-transmit 0 exceed-action drop 
policy-map QPO_A_2048K_6_18_3_5_8_1_10
  class VozVideo_Q6
    priority
   police cir percent 24 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 3
    bandwidth remaining percent 3
    random-detect dscp-based
    random-detect dscp 24 12 packets 20 packets 1
    random-detect dscp 26 12 packets 20 packets 1
    random-detect dscp 28 12 packets 20 packets 1
    random-detect dscp 30 12 packets 20 packets 1
    queue-limit 40 packets
  class Interativa_Q6
    bandwidth percent 5
    bandwidth remaining percent 5
    random-detect dscp-based
    random-detect dscp 18 12 packets 20 packets 1
    random-detect dscp 20 12 packets 20 packets 1
    random-detect dscp 22 12 packets 20 packets 1
    queue-limit 40 packets
  class Bulk_Q6
    bandwidth percent 8
    bandwidth remaining percent 8
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
    queue-limit 40 packets
  class class-default
    bandwidth percent 10
    bandwidth remaining percent 10
    random-detect dscp-based
    random-detect dscp 0 14 packets 30 packets 1
    queue-limit 60 packets
policy-map ZERA-DSCP
  class class-default
   set dscp 0
policy-map QPO_A_256K_26_0_38_0_0_7_25
  class Voz_Q6
    priority
   police cir percent 26 conform-action transmit  exceed-action drop 
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
    bandwidth percent 25
    bandwidth remaining percent 25
    random-detect dscp-based
    random-detect dscp 0 7 packets 15 packets 1
    queue-limit 30 packets
policy-map QPO_A_4096K_15_30_30_0_0_1_22
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
    bandwidth percent 22
    bandwidth remaining percent 22
    random-detect dscp-based
    random-detect dscp 0 32 packets 64 packets 1
    queue-limit 128 packets
policy-map QPO_A_2048K_0_25_0_0_0_1_71
  class Video_Q6
    priority
   police cir percent 25 conform-action transmit  exceed-action drop 
  class NetworkControl_Q6
    bandwidth percent 1
    bandwidth remaining percent 1
    queue-limit 26 packets
  class class-default
    bandwidth percent 71
    bandwidth remaining percent 71
    random-detect dscp-based
    random-detect dscp 0 56 packets 120 packets 1
    queue-limit 240 packets
policy-map QPO_A_2048K_9_25_29_14_0_2_20
  class VozVideo_Q6
    priority
   police cir percent 34 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 29
    bandwidth remaining percent 29
    random-detect dscp-based
    random-detect dscp 24 32 packets 48 packets 1
    random-detect dscp 26 32 packets 48 packets 1
    random-detect dscp 28 32 packets 48 packets 1
    random-detect dscp 30 32 packets 48 packets 1
    queue-limit 96 packets
  class Interativa_Q6
    bandwidth percent 14
    bandwidth remaining percent 14
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
    bandwidth percent 20
    bandwidth remaining percent 20
    random-detect dscp-based
    random-detect dscp 0 24 packets 40 packets 1
    queue-limit 80 packets
policy-map QPO_TMX_4096K_PB24_L_A_V1
  class rpvm_voz_tmx
    priority
   police cir percent 25 conform-action transmit  exceed-action drop 
  class rpvm_video_tmx
    bandwidth percent 40
   police cir percent 25 conform-action transmit  exceed-action drop 
  class rpvm_datos_criticos_tmx
    bandwidth percent 22
    bandwidth remaining percent 60
  class rpvm_business_tmx
    bandwidth percent 7
    bandwidth remaining percent 30
  class rpvm_mngmnt_routing_tmx
    bandwidth percent 5
    queue-limit 32 packets
  class class-default
    bandwidth percent 1
    bandwidth remaining percent 10
    queue-limit 32 packets
policy-map QDO_TMX_4096K_PB24_L_A_V1
  class class-default
    shape average 4096000
   service-policy QPO_TMX_4096K_PB24_L_A_V1
policy-map QPI_10000K_BBrasil_NAC_GACC_V1
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
policy-map QPO_A_4096K_10_30_35_0_0_1_22
  class VozVideo_Q6
    priority
   police cir percent 40 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 35
    bandwidth remaining percent 35
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
    bandwidth percent 22
    bandwidth remaining percent 22
    random-detect dscp-based
    random-detect dscp 0 32 packets 64 packets 1
    queue-limit 128 packets
policy-map QPI_256K_BBrasil_NAC_GACC_V1
  class TEMPO_REAL_NAC
   police cir percent 20 conform-action transmit  exceed-action drop 
  class MISSAO_CRITICA_NAC
   police cir percent 40 conform-action transmit  exceed-action set-dscp-transmit af43
  class GERENCIAMENTO_NAC
   police cir percent 15 conform-action transmit  exceed-action set-dscp-transmit af33
  class NETWORK_CONTROL_NAC
   police cir percent 4 conform-action transmit  exceed-action set-dscp-transmit cs6
  class STANDARD_NAC
   police cir percent 19 conform-action transmit  exceed-action set-dscp-transmit default
policy-map QPO_A_2048K_5_0_15_45_15_2_17
  class Voz_Q6
    priority
   police cir percent 5 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 15
    bandwidth remaining percent 15
    random-detect dscp-based
    random-detect dscp 24 14 packets 30 packets 1
    random-detect dscp 26 14 packets 30 packets 1
    random-detect dscp 28 14 packets 30 packets 1
    random-detect dscp 30 14 packets 30 packets 1
    queue-limit 60 packets
  class Interativa_Q6
    bandwidth percent 45
    bandwidth remaining percent 45
    random-detect dscp-based
    random-detect dscp 18 32 packets 64 packets 1
    random-detect dscp 20 32 packets 64 packets 1
    random-detect dscp 22 32 packets 64 packets 1
    queue-limit 128 packets
  class Bulk_Q6
    bandwidth percent 15
    bandwidth remaining percent 15
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
    bandwidth percent 17
    bandwidth remaining percent 17
    random-detect dscp-based
    random-detect dscp 0 14 packets 30 packets 1
    queue-limit 60 packets
policy-map QPO_A_4096K_30_26_26_0_0_1_16
  class VozVideo_Q6
    priority
   police cir percent 56 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 26
    bandwidth remaining percent 26
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
    bandwidth percent 16
    bandwidth remaining percent 16
    random-detect dscp-based
    random-detect dscp 0 32 packets 48 packets 1
    queue-limit 96 packets
policy-map QDI_8000K_2_5_72_0_0_1_18
  class class-default
   police rate 8000000 conform-action transmit  exceed-action drop 
   service-policy QPI_8000K_2_N_5_72_0_0_1_18
policy-map QPO_A_2048K_0_0_70_26_0_1_1
  class MissaoCritica_Q6
    bandwidth percent 70
    bandwidth remaining percent 70
    random-detect dscp-based
    random-detect dscp 24 56 packets 120 packets 1
    random-detect dscp 26 56 packets 120 packets 1
    random-detect dscp 28 56 packets 120 packets 1
    random-detect dscp 30 56 packets 120 packets 1
    queue-limit 240 packets
  class Interativa_Q6
    bandwidth percent 26
    bandwidth remaining percent 26
    random-detect dscp-based
    random-detect dscp 18 32 packets 48 packets 1
    random-detect dscp 20 32 packets 48 packets 1
    random-detect dscp 22 32 packets 48 packets 1
    queue-limit 96 packets
  class NetworkControl_Q6
    bandwidth percent 1
    bandwidth remaining percent 1
    queue-limit 18 packets
  class class-default
    bandwidth percent 1
    bandwidth remaining percent 1
    random-detect dscp-based
    random-detect dscp 0 5 packets 9 packets 1
    queue-limit 18 packets
policy-map QPO_A_1024K_0_0_69_0_15_2_3
  class MissaoCritica_Q6
    bandwidth percent 69
    bandwidth remaining percent 69
    random-detect dscp-based
    random-detect dscp 24 32 packets 48 packets 1
    random-detect dscp 26 32 packets 48 packets 1
    random-detect dscp 28 32 packets 48 packets 1
    random-detect dscp 30 32 packets 48 packets 1
    queue-limit 96 packets
  class Bulk_Q6
    bandwidth percent 15
    bandwidth remaining percent 15
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
    bandwidth percent 3
    bandwidth remaining percent 3
    random-detect dscp-based
    random-detect dscp 0 5 packets 13 packets 1
    queue-limit 26 packets
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
policy-map QPO_A_10000K_2_0_0_0_0_2_95
  class Voz_Q6
    priority
   police cir percent 2 conform-action transmit  exceed-action drop 
  class NetworkControl_Q6
    bandwidth percent 2
    bandwidth remaining percent 2
    queue-limit 40 packets
  class class-default
    bandwidth percent 95
    bandwidth remaining percent 95
    random-detect dscp-based
    random-detect dscp 0 344 packets 600 packets 1
    queue-limit 1200 packets
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
policy-map QPO_A_1024K_13_0_0_0_0_2_83
  class Voz_Q6
    priority
   police cir percent 13 conform-action transmit  exceed-action drop 
  class NetworkControl_Q6
    bandwidth percent 2
    bandwidth remaining percent 2
    queue-limit 18 packets
  class class-default
    bandwidth percent 83
    bandwidth remaining percent 83
    random-detect dscp-based
    random-detect dscp 0 32 packets 64 packets 1
    queue-limit 128 packets
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
policy-map QPI_BBONE_N_64_V1
  class class-default
   police 64000 4470 4470 conform-action set-mpls-exp-imposition-transmit 0 exceed-action drop 
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
policy-map QPO_A_2048K_10_40_15_30_0_2_2
  class VozVideo_Q6
    priority
   police cir percent 50 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 15
    bandwidth remaining percent 15
    random-detect dscp-based
    random-detect dscp 24 14 packets 30 packets 1
    random-detect dscp 26 14 packets 30 packets 1
    random-detect dscp 28 14 packets 30 packets 1
    random-detect dscp 30 14 packets 30 packets 1
    queue-limit 60 packets
  class Interativa_Q6
    bandwidth percent 30
    bandwidth remaining percent 30
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
    bandwidth percent 2
    bandwidth remaining percent 2
    random-detect dscp-based
    random-detect dscp 0 5 packets 13 packets 1
    queue-limit 26 packets
policy-map RV_MLPPP_QPO_2048K_5_1_1_91
  class RV_MLPPP_Voz
    priority
   police cir percent 5 conform-action transmit  exceed-action drop 
  class RV_MLPPP_Sinalizacao
    bandwidth percent 1
    random-detect dscp-based
  class RV_MLPPP_NetWorkControl
    bandwidth percent 1
  class RV_MLPPP_BestEffort
    bandwidth percent 91
    random-detect dscp-based
policy-map RV_MLPPP_QDO_2048K_5_1_1_91
  class class-default
    shape average 2048000
   service-policy RV_MLPPP_QPO_2048K_5_1_1_91
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
policy-map QPO_MB_512_152_128_104_0B_G5_V1
  class CS5
    priority
   police cir percent 30 conform-action transmit  exceed-action drop 
  class CS4
    bandwidth percent 25
    random-detect dscp-based
    random-detect dscp 32 7 packets 15 packets 1
  class CS3
    bandwidth percent 20
    random-detect dscp-based
    random-detect dscp 24 5 packets 13 packets 1
policy-map QPO_A_4096K_14_15_18_10_27_1_14
  class VozVideo_Q6
    priority
   police cir percent 29 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 18
    bandwidth remaining percent 18
    random-detect dscp-based
    random-detect dscp 24 32 packets 48 packets 1
    random-detect dscp 26 32 packets 48 packets 1
    random-detect dscp 28 32 packets 48 packets 1
    random-detect dscp 30 32 packets 48 packets 1
    queue-limit 96 packets
  class Interativa_Q6
    bandwidth percent 10
    bandwidth remaining percent 10
    random-detect dscp-based
    random-detect dscp 18 24 packets 40 packets 1
    random-detect dscp 20 24 packets 40 packets 1
    random-detect dscp 22 24 packets 40 packets 1
    queue-limit 80 packets
  class Bulk_Q6
    bandwidth percent 27
    bandwidth remaining percent 27
    random-detect dscp-based
    random-detect dscp 8 56 packets 120 packets 1
    random-detect dscp 10 56 packets 120 packets 1
    random-detect dscp 12 56 packets 120 packets 1
    random-detect dscp 14 56 packets 120 packets 1
    random-detect dscp 32 56 packets 120 packets 1
    queue-limit 240 packets
  class NetworkControl_Q6
    bandwidth percent 1
    bandwidth remaining percent 1
    queue-limit 26 packets
  class class-default
    bandwidth percent 14
    bandwidth remaining percent 14
    random-detect dscp-based
    random-detect dscp 0 32 packets 48 packets 1
    queue-limit 96 packets
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
policy-map QPO_A_256K_25_0_50_0_0_7_16
  class Voz_Q6
    priority
   police cir percent 25 conform-action transmit  exceed-action drop 
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
    bandwidth percent 16
    bandwidth remaining percent 16
    random-detect dscp-based
    random-detect dscp 0 5 packets 13 packets 1
    queue-limit 26 packets
policy-map QPO_A_6000K_2_7_72_0_0_2_16
  class VozVideo_Q6
    priority
   police cir percent 9 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 72
    bandwidth remaining percent 72
    random-detect dscp-based
    random-detect dscp 24 224 packets 480 packets 1
    random-detect dscp 26 224 packets 480 packets 1
    random-detect dscp 28 224 packets 480 packets 1
    random-detect dscp 30 224 packets 480 packets 1
    queue-limit 960 packets
  class NetworkControl_Q6
    bandwidth percent 2
    bandwidth remaining percent 2
    queue-limit 40 packets
  class class-default
    bandwidth percent 16
    bandwidth remaining percent 16
    random-detect dscp-based
    random-detect dscp 0 32 packets 64 packets 1
    queue-limit 128 packets
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
   set mpls experimental imposition 0
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
policy-map QPO_A_14000K_16_37_14_14_14_2_2
  class VozVideo_Q6
    priority
   police cir percent 53 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 14
    bandwidth remaining percent 14
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
    random-detect dscp 18 56 packets 120 packets 1
    random-detect dscp 20 56 packets 120 packets 1
    random-detect dscp 22 56 packets 120 packets 1
    queue-limit 240 packets
  class Bulk_Q6
    bandwidth percent 14
    bandwidth remaining percent 14
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
    queue-limit 60 packets
  class class-default
    bandwidth percent 2
    bandwidth remaining percent 2
    random-detect dscp-based
    random-detect dscp 0 14 packets 30 packets 1
    queue-limit 60 packets
policy-map QPI_Correios_256K_PPP_IOS_D_V1
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
policy-map QPI_4096K_4_N_0_2_50_0_2_41
  class Voz_Q6
   police cir percent 4 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 2 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Interativa_Q6
   police cir percent 50 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QDI_4096K_4_0_2_50_0_2_41
  class class-default
   police rate 4096000 conform-action transmit  exceed-action drop 
   service-policy QPI_4096K_4_N_0_2_50_0_2_41
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
policy-map QPO_A_512K_21_0_50_0_0_4_24
  class Voz_Q6
    priority
   police cir percent 21 conform-action transmit  exceed-action drop 
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
    bandwidth percent 24
    bandwidth remaining percent 24
    random-detect dscp-based
    random-detect dscp 0 7 packets 15 packets 1
    queue-limit 30 packets
policy-map QPI_2048K_33_N_0_1_0_0_1_63
  class Voz_Q6
   police cir percent 33 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 1 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPO_A_2048K_13_0_0_0_0_2_84
  class Voz_Q6
    priority
   police cir percent 13 conform-action transmit  exceed-action drop 
  class NetworkControl_Q6
    bandwidth percent 2
    bandwidth remaining percent 2
    queue-limit 26 packets
  class class-default
    bandwidth percent 84
    bandwidth remaining percent 84
    random-detect dscp-based
    random-detect dscp 0 56 packets 120 packets 1
    queue-limit 240 packets
policy-map QPO_A_10000K_4_0_8_0_84_2_1
  class Voz_Q6
    priority
   police cir percent 4 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 8
    bandwidth remaining percent 8
    random-detect dscp-based
    random-detect dscp 24 32 packets 64 packets 1
    random-detect dscp 26 32 packets 64 packets 1
    random-detect dscp 28 32 packets 64 packets 1
    random-detect dscp 30 32 packets 64 packets 1
    queue-limit 128 packets
  class Bulk_Q6
    bandwidth percent 84
    bandwidth remaining percent 84
    random-detect dscp-based
    random-detect dscp 8 344 packets 600 packets 1
    random-detect dscp 10 344 packets 600 packets 1
    random-detect dscp 12 344 packets 600 packets 1
    random-detect dscp 14 344 packets 600 packets 1
    random-detect dscp 32 344 packets 600 packets 1
    queue-limit 1200 packets
  class NetworkControl_Q6
    bandwidth percent 2
    bandwidth remaining percent 2
    queue-limit 40 packets
  class class-default
    bandwidth percent 1
    bandwidth remaining percent 1
    random-detect dscp-based
    random-detect dscp 0 7 packets 15 packets 1
    queue-limit 30 packets
policy-map QPO_A_6000K_11_31_36_0_0_1_20
  class VozVideo_Q6
    priority
   police cir percent 42 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 36
    bandwidth remaining percent 36
    random-detect dscp-based
    random-detect dscp 24 112 packets 240 packets 1
    random-detect dscp 26 112 packets 240 packets 1
    random-detect dscp 28 112 packets 240 packets 1
    random-detect dscp 30 112 packets 240 packets 1
    queue-limit 480 packets
  class NetworkControl_Q6
    bandwidth percent 1
    bandwidth remaining percent 1
    queue-limit 30 packets
  class class-default
    bandwidth percent 20
    bandwidth remaining percent 20
    random-detect dscp-based
    random-detect dscp 0 56 packets 120 packets 1
    queue-limit 240 packets
policy-map QPO_A_512K_25_0_60_0_0_4_10
  class Voz_Q6
    priority
   police cir percent 25 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 60
    bandwidth remaining percent 60
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
    bandwidth percent 10
    bandwidth remaining percent 10
    random-detect dscp-based
    random-detect dscp 0 5 packets 13 packets 1
    queue-limit 26 packets
policy-map QPO_A_512K_25_0_10_0_0_4_60
  class Voz_Q6
    priority
   police cir percent 25 conform-action transmit  exceed-action drop 
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
    bandwidth percent 60
    bandwidth remaining percent 60
    random-detect dscp-based
    random-detect dscp 0 14 packets 30 packets 1
    queue-limit 60 packets
policy-map QPO_A_6000K_9_9_54_0_0_2_25
  class VozVideo_Q6
    priority
   police cir percent 18 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 54
    bandwidth remaining percent 54
    random-detect dscp-based
    random-detect dscp 24 112 packets 240 packets 1
    random-detect dscp 26 112 packets 240 packets 1
    random-detect dscp 28 112 packets 240 packets 1
    random-detect dscp 30 112 packets 240 packets 1
    queue-limit 480 packets
  class NetworkControl_Q6
    bandwidth percent 2
    bandwidth remaining percent 2
    queue-limit 40 packets
  class class-default
    bandwidth percent 25
    bandwidth remaining percent 25
    random-detect dscp-based
    random-detect dscp 0 56 packets 120 packets 1
    queue-limit 240 packets
policy-map QPO_A_256K_38_0_36_0_0_7_18
  class Voz_Q6
    priority
   police cir percent 38 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 36
    bandwidth remaining percent 36
    random-detect dscp-based
    random-detect dscp 18 5 packets 7 packets 1
    random-detect dscp 20 5 packets 7 packets 1
    random-detect dscp 22 5 packets 7 packets 1
    random-detect dscp 24 7 packets 15 packets 1
    random-detect dscp 26 7 packets 15 packets 1
    random-detect dscp 28 7 packets 15 packets 1
    random-detect dscp 30 7 packets 15 packets 1
    queue-limit 14 packets
  class NetworkControl_Q6
    bandwidth percent 7
    bandwidth remaining percent 7
    queue-limit 18 packets
  class class-default
    bandwidth percent 18
    bandwidth remaining percent 18
    random-detect dscp-based
    random-detect dscp 0 5 packets 13 packets 1
    queue-limit 26 packets
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
policy-map QPO_2048K_33_0_1_0_0_1_63
  class Voz_Q6
    priority
   police cir percent 33 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 1
    random-detect dscp-based
    random-detect dscp 24 40 ms 120 ms 1
    random-detect dscp 26 40 ms 120 ms 1
    random-detect dscp 28 40 ms 120 ms 1
    random-detect dscp 30 40 ms 120 ms 1
  class NetworkControl_Q6
    bandwidth percent 1
  class class-default
    bandwidth percent 63
    random-detect dscp-based
    random-detect dscp 0 40 ms 120 ms 1
policy-map QDO_2048K_33_0_1_0_0_1_63
  class class-default
    shape average 2048000
   service-policy QPO_2048K_33_0_1_0_0_1_63
policy-map QPO_A_1024K_19_0_38_13_0_2_27
  class Voz_Q6
    priority
   police cir percent 19 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 38
    bandwidth remaining percent 38
    random-detect dscp-based
    random-detect dscp 24 24 packets 40 packets 1
    random-detect dscp 26 24 packets 40 packets 1
    random-detect dscp 28 24 packets 40 packets 1
    random-detect dscp 30 24 packets 40 packets 1
    queue-limit 80 packets
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
    bandwidth percent 27
    bandwidth remaining percent 27
    random-detect dscp-based
    random-detect dscp 0 14 packets 30 packets 1
    queue-limit 60 packets
policy-map RV_MLPPP_QPI_2048K_5_N_1_1_91
  class RV_MLPPP_Voz
   police cir 96000 bc 4470 be 4470 conform-action transmit  exceed-action drop 
  class RV_MLPPP_Sinalizacao
   police cir 8000 bc 4470 be 4470 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
policy-map QPO_A_256K_26_0_52_0_0_7_14
  class Voz_Q6
    priority
   police cir percent 26 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 52
    bandwidth remaining percent 52
    random-detect dscp-based
    random-detect dscp 18 5 packets 7 packets 1
    random-detect dscp 20 5 packets 7 packets 1
    random-detect dscp 22 5 packets 7 packets 1
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
    bandwidth percent 14
    bandwidth remaining percent 14
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
policy-map QPO_4096K_3_0_50_13_13_1_17
  class Voz_Q6
    priority
   police cir percent 3 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 50
    random-detect dscp-based
    random-detect dscp 24 40 ms 120 ms 1
    random-detect dscp 26 40 ms 120 ms 1
    random-detect dscp 28 40 ms 120 ms 1
    random-detect dscp 30 40 ms 120 ms 1
  class Interativa_Q6
    bandwidth percent 13
    random-detect dscp-based
    random-detect dscp 18 40 ms 120 ms 1
    random-detect dscp 20 40 ms 120 ms 1
    random-detect dscp 22 40 ms 120 ms 1
  class Bulk_Q6
    bandwidth percent 13
    random-detect dscp-based
    random-detect dscp 8 40 ms 120 ms 1
    random-detect dscp 10 40 ms 120 ms 1
    random-detect dscp 12 40 ms 120 ms 1
    random-detect dscp 14 40 ms 120 ms 1
    random-detect dscp 32 40 ms 120 ms 1
  class NetworkControl_Q6
    bandwidth percent 1
  class class-default
    bandwidth percent 17
    random-detect dscp-based
    random-detect dscp 0 40 ms 120 ms 1
policy-map QDO_4096K_3_0_50_13_13_1_17
  class class-default
    shape average 4096000
   service-policy QPO_4096K_3_0_50_13_13_1_17
policy-map QPO_A_2048K_7_0_16_29_12_1_34
  class Voz_Q6
    priority
   police cir percent 7 conform-action transmit  exceed-action drop 
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
    bandwidth percent 29
    bandwidth remaining percent 29
    random-detect dscp-based
    random-detect dscp 18 32 packets 48 packets 1
    random-detect dscp 20 32 packets 48 packets 1
    random-detect dscp 22 32 packets 48 packets 1
    queue-limit 96 packets
  class Bulk_Q6
    bandwidth percent 12
    bandwidth remaining percent 12
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
    bandwidth percent 34
    bandwidth remaining percent 34
    random-detect dscp-based
    random-detect dscp 0 32 packets 48 packets 1
    queue-limit 96 packets
policy-map QPO_A_8192K_15_30_30_0_0_1_22
  class VozVideo_Q6
    priority
   police cir percent 45 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 30
    bandwidth remaining percent 30
    random-detect dscp-based
    random-detect dscp 24 112 packets 240 packets 1
    random-detect dscp 26 112 packets 240 packets 1
    random-detect dscp 28 112 packets 240 packets 1
    random-detect dscp 30 112 packets 240 packets 1
    queue-limit 480 packets
  class NetworkControl_Q6
    bandwidth percent 1
    bandwidth remaining percent 1
    queue-limit 30 packets
  class class-default
    bandwidth percent 22
    bandwidth remaining percent 22
    random-detect dscp-based
    random-detect dscp 0 56 packets 120 packets 1
    queue-limit 240 packets
policy-map QPO_A_10000K_7_0_1_0_0_1_89
  class Voz_Q6
    priority
   police cir percent 7 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 1
    bandwidth remaining percent 1
    random-detect dscp-based
    random-detect dscp 24 12 packets 20 packets 1
    random-detect dscp 26 12 packets 20 packets 1
    random-detect dscp 28 12 packets 20 packets 1
    random-detect dscp 30 12 packets 20 packets 1
    queue-limit 40 packets
  class NetworkControl_Q6
    bandwidth percent 1
    bandwidth remaining percent 1
    queue-limit 40 packets
  class class-default
    bandwidth percent 89
    bandwidth remaining percent 89
    random-detect dscp-based
    random-detect dscp 0 344 packets 600 packets 1
    queue-limit 1200 packets
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
policy-map QDI_2048K_33_0_1_0_0_1_63
  class class-default
   police rate 2048000 conform-action transmit  exceed-action drop 
   service-policy QPI_2048K_33_N_0_1_0_0_1_63
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
policy-map QPO_A_16000K_11_34_0_0_0_1_53
  class VozVideo_Q6
    priority
   police cir percent 45 conform-action transmit  exceed-action drop 
  class NetworkControl_Q6
    bandwidth percent 1
    bandwidth remaining percent 1
    queue-limit 40 packets
  class class-default
    bandwidth percent 53
    bandwidth remaining percent 53
    random-detect dscp-based
    random-detect dscp 0 344 packets 600 packets 1
    queue-limit 1200 packets
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
policy-map QPI_256K_39_N_0_4_33_0_7_16
  class Voz_Q6
   police cir percent 39 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 4 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Interativa_Q6
   police cir percent 33 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_BBONE_N_8000_V1
  class class-default
   police 8000000 250000 250000 conform-action set-mpls-exp-imposition-transmit 0 exceed-action drop 
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
policy-map QOS_POLICY_OUT_A_11P_0P
  class REALTIME
    priority
   police cir percent 11 conform-action transmit  exceed-action drop 
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
policy-map QDI_4096K_3_0_50_13_13_1_17
  class class-default
   police rate 4096000 conform-action transmit  exceed-action drop 
   service-policy QPI_4096K_3_N_0_50_13_13_1_17
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
policy-map QPI_MB_512_152_128_104_0B_G5_V1
  class CS5
   police 152000 4750 4750 conform-action transmit  exceed-action drop 
  class CS4
   police 128000 4470 4470 conform-action transmit  exceed-action set-dscp-transmit default
  class CS3
   police 104000 4470 4470 conform-action transmit  exceed-action set-dscp-transmit default
policy-map QPI_BBONE_N_4096_V1
  class class-default
   police 4096000 128000 128000 conform-action set-mpls-exp-imposition-transmit 0 exceed-action drop 
policy-map QPO_A_512K_5_0_2_0_0_4_88
  class Voz_Q6
    priority
   police cir percent 5 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 2
    bandwidth remaining percent 2
    random-detect dscp-based
    random-detect dscp 18 5 packets 7 packets 1
    random-detect dscp 20 5 packets 7 packets 1
    random-detect dscp 22 5 packets 7 packets 1
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
policy-map QPO_A_512K_13_0_25_0_0_4_57
  class Voz_Q6
    priority
   police cir percent 13 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 25
    bandwidth remaining percent 25
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
    bandwidth percent 4
    random-detect dscp-based
    random-detect dscp 16 16 packets 32 packets 1
    random-detect dscp 48 16 packets 32 packets 1
    random-detect dscp 56 16 packets 32 packets 1
  class BEST_EFFORT
    bandwidth percent 40
    random-detect dscp-based
    random-detect dscp 0 16 packets 32 packets 1
    queue-limit 64 packets
policy-map QPO_4096K_4_0_2_50_0_2_41
  class Voz_Q6
    priority
   police cir percent 4 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 2
    random-detect dscp-based
    random-detect dscp 24 40 ms 120 ms 1
    random-detect dscp 26 40 ms 120 ms 1
    random-detect dscp 28 40 ms 120 ms 1
    random-detect dscp 30 40 ms 120 ms 1
  class Interativa_Q6
    bandwidth percent 50
    random-detect dscp-based
    random-detect dscp 18 40 ms 120 ms 1
    random-detect dscp 20 40 ms 120 ms 1
    random-detect dscp 22 40 ms 120 ms 1
  class NetworkControl_Q6
    bandwidth percent 2
  class class-default
    bandwidth percent 41
    random-detect dscp-based
    random-detect dscp 0 40 ms 120 ms 1
policy-map QDO_4096K_4_0_2_50_0_2_41
  class class-default
    shape average 4096000
   service-policy QPO_4096K_4_0_2_50_0_2_41
policy-map QPO_A_6000K_2_7_64_0_0_2_24
  class VozVideo_Q6
    priority
   police cir percent 9 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 64
    bandwidth remaining percent 64
    random-detect dscp-based
    random-detect dscp 24 112 packets 240 packets 1
    random-detect dscp 26 112 packets 240 packets 1
    random-detect dscp 28 112 packets 240 packets 1
    random-detect dscp 30 112 packets 240 packets 1
    queue-limit 480 packets
  class NetworkControl_Q6
    bandwidth percent 2
    bandwidth remaining percent 2
    queue-limit 40 packets
  class class-default
    bandwidth percent 24
    bandwidth remaining percent 24
    random-detect dscp-based
    random-detect dscp 0 56 packets 120 packets 1
    queue-limit 240 packets
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
policy-map QPO_A_2048K_10_25_24_0_0_1_38
  class VozVideo_Q6
    priority
   police cir percent 35 conform-action transmit  exceed-action drop 
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
    bandwidth percent 1
    bandwidth remaining percent 1
    queue-limit 18 packets
  class class-default
    bandwidth percent 38
    bandwidth remaining percent 38
    random-detect dscp-based
    random-detect dscp 0 32 packets 64 packets 1
    queue-limit 128 packets
policy-map QPO_A_1024K_22_22_11_30_6_3_5
  class VozVideo_Q6
    priority
   police cir percent 44 conform-action transmit  exceed-action drop 
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
    bandwidth percent 30
    bandwidth remaining percent 30
    random-detect dscp-based
    random-detect dscp 18 14 packets 30 packets 1
    random-detect dscp 20 14 packets 30 packets 1
    random-detect dscp 22 14 packets 30 packets 1
    queue-limit 60 packets
  class Bulk_Q6
    bandwidth percent 6
    bandwidth remaining percent 6
    random-detect dscp-based
    random-detect dscp 8 5 packets 13 packets 1
    random-detect dscp 10 5 packets 13 packets 1
    random-detect dscp 12 5 packets 13 packets 1
    random-detect dscp 14 5 packets 13 packets 1
    random-detect dscp 32 5 packets 13 packets 1
    queue-limit 26 packets
  class NetworkControl_Q6
    bandwidth percent 3
    bandwidth remaining percent 3
    queue-limit 26 packets
  class class-default
    bandwidth percent 5
    bandwidth remaining percent 5
    random-detect dscp-based
    random-detect dscp 0 5 packets 13 packets 1
    queue-limit 26 packets
policy-map QOS_POLICY_OUT_A_13P_0P
  class REALTIME
    priority
   police cir percent 13 conform-action transmit  exceed-action drop 
policy-map QPO_A_4096K_19_6_25_16_25_1_7
  class VozVideo_Q6
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
    bandwidth percent 16
    bandwidth remaining percent 16
    random-detect dscp-based
    random-detect dscp 18 32 packets 48 packets 1
    random-detect dscp 20 32 packets 48 packets 1
    random-detect dscp 22 32 packets 48 packets 1
    queue-limit 96 packets
  class Bulk_Q6
    bandwidth percent 25
    bandwidth remaining percent 25
    random-detect dscp-based
    random-detect dscp 8 56 packets 120 packets 1
    random-detect dscp 10 56 packets 120 packets 1
    random-detect dscp 12 56 packets 120 packets 1
    random-detect dscp 14 56 packets 120 packets 1
    random-detect dscp 32 56 packets 120 packets 1
    queue-limit 240 packets
  class NetworkControl_Q6
    bandwidth percent 1
    bandwidth remaining percent 1
    queue-limit 26 packets
  class class-default
    bandwidth percent 7
    bandwidth remaining percent 7
    random-detect dscp-based
    random-detect dscp 0 14 packets 30 packets 1
    queue-limit 60 packets
policy-map QPI_BBONE_DSCP_V1
  class class-default
   set dscp 0
policy-map PM_V10_SHAPE_OUT_10000
policy-map SHAPE_OUT_10000
  class class-default
    shape average 10000000
   service-policy PM_V10_SHAPE_OUT_10000
policy-map QPI_A_1024K_13_N_0_0_0_0_2_83
  class Voz_Q6
   police cir percent 13 conform-action transmit  exceed-action drop 
  class class-default
   set mpls experimental imposition 0
policy-map QPI_A_256K_38_C_0_36_0_0_7_18
  class Voz_Q6
   police cir percent 38 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 36 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map PM_V10_QPO_BBONE_8192_V1
policy-map QPO_BBONE_8192_V1
  class class-default
    shape average 8192000
   service-policy PM_V10_QPO_BBONE_8192_V1
policy-map PM_V10_QPO_BBONE_64_V1
policy-map QPO_BBONE_64_V1
  class class-default
    shape average 64000
   service-policy PM_V10_QPO_BBONE_64_V1
policy-map PM_V10_QPO_BBONE_200000_V1
policy-map QPO_BBONE_200000_V1
  class class-default
    shape average 200000000
   service-policy PM_V10_QPO_BBONE_200000_V1
policy-map QPI_A_1024K_0_N_0_0_83_0_2_13
  class Interativa_Q6
   police cir percent 83 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QDO_A_2048K_6_18_3_5_8_1_10
  class class-default
    shape average 2048000
   service-policy QPO_A_2048K_6_18_3_5_8_1_10
policy-map QPI_A_50000K_3_N_0_0_0_0_2_94
  class Voz_Q6
   police cir percent 3 conform-action transmit  exceed-action drop 
  class class-default
   set mpls experimental imposition 0
policy-map QDI_A_50000K_3_0_0_0_0_2_94
  class class-default
   police rate 50000000 child-conform-aware conform-action transmit  exceed-action drop 
   service-policy QPI_A_50000K_3_N_0_0_0_0_2_94
policy-map QPI_A_2048K_10_N_40_15_30_0_2_2
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
policy-map QPI_BBONE_S_8000_V1
  class class-default
   police 8000000 250000 250000 conform-action set-dscp-transmit default exceed-action drop 
policy-map QPI_A_2048K_0_N_0_70_26_0_1_1
  class MissaoCritica_Q6
   police cir percent 70 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Interativa_Q6
   police cir percent 26 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_A_1024K_0_N_0_69_0_15_2_3
  class MissaoCritica_Q6
   police cir percent 69 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Bulk_Q6
   police cir percent 15 conform-action set-mpls-exp-imposition-transmit 4 exceed-action set-mpls-exp-imposition-transmit 1
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
policy-map QDI_A_2048K_21_0_35_20_0_2_21
  class class-default
   police rate 2048000 child-conform-aware conform-action transmit  exceed-action drop 
   service-policy QPI_A_2048K_21_N_0_35_20_0_2_21
policy-map QDO_A_2048K_0_25_0_0_0_1_71
  class class-default
    shape average 2048000
   service-policy QPO_A_2048K_0_25_0_0_0_1_71
policy-map QDO_A_2048K_9_25_29_14_0_2_20
  class class-default
    shape average 2048000
   service-policy QPO_A_2048K_9_25_29_14_0_2_20
policy-map QPI_A_2048K_20_N_30_34_0_0_2_13
  class Voz_Q6
   police cir percent 20 conform-action transmit  exceed-action drop 
  class Video_Q6
   police cir percent 30 conform-action set-mpls-exp-imposition-transmit 5 exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 34 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QDI_A_2048K_20_30_34_0_0_2_13
  class class-default
   police rate 2048000 child-conform-aware conform-action transmit  exceed-action drop 
   service-policy QPI_A_2048K_20_N_30_34_0_0_2_13
policy-map QPI_A_10000K_2_N_0_0_0_0_2_95
  class Voz_Q6
   police cir percent 2 conform-action transmit  exceed-action drop 
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
policy-map QDI_A_2048K_30_0_20_2_35_2_10
  class class-default
   police rate 2048000 child-conform-aware conform-action transmit  exceed-action drop 
   service-policy QPI_A_2048K_30_N_0_20_2_35_2_10
policy-map QDI_10000K_BBrasil_NAC_GACC_V1
  class class-default
   police rate 10000000 conform-action transmit  exceed-action drop 
   service-policy QPI_10000K_BBrasil_NAC_GACC_V1
policy-map QDO_A_4096K_10_30_35_0_0_1_22
  class class-default
    shape average 4096000
   service-policy QPO_A_4096K_10_30_35_0_0_1_22
policy-map QDI_256K_BBrasil_NAC_GACC_V1
  class class-default
   police rate 256000 conform-action transmit  exceed-action drop 
   service-policy QPI_256K_BBrasil_NAC_GACC_V1
policy-map QPI_A_10000K_8_N_16_52_0_0_2_21
  class Voz_Q6
   police cir percent 8 conform-action transmit  exceed-action drop 
  class Video_Q6
   police cir percent 16 conform-action set-mpls-exp-imposition-transmit 5 exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 52 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QDI_A_10000K_8_16_52_0_0_2_21
  class class-default
   police rate 10000000 child-conform-aware conform-action transmit  exceed-action drop 
   service-policy QPI_A_10000K_8_N_16_52_0_0_2_21
policy-map QDO_A_2048K_5_0_15_45_15_2_17
  class class-default
    shape average 2048000
   service-policy QPO_A_2048K_5_0_15_45_15_2_17
policy-map QDO_A_4096K_30_26_26_0_0_1_16
  class class-default
    shape average 4096000
   service-policy QPO_A_4096K_30_26_26_0_0_1_16
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
policy-map QPI_A_256K_26_N_0_38_0_0_7_25
  class Voz_Q6
   police cir percent 26 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 38 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_A_4096K_15_N_30_30_0_0_1_22
  class Voz_Q6
   police cir percent 15 conform-action transmit  exceed-action drop 
  class Video_Q6
   police cir percent 30 conform-action set-mpls-exp-imposition-transmit 5 exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 30 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QDO_A_1024K_0_0_69_0_15_2_3
  class class-default
    shape average 1024000
   service-policy QPO_A_1024K_0_0_69_0_15_2_3
policy-map QPI_A_2048K_0_N_25_0_0_0_1_71
  class Video_Q6
   police cir percent 25 conform-action set-mpls-exp-imposition-transmit 5 exceed-action drop 
  class class-default
   set mpls experimental imposition 0
policy-map QPI_A_2048K_9_N_25_29_14_0_2_20
  class Voz_Q6
   police cir percent 9 conform-action transmit  exceed-action drop 
  class Video_Q6
   police cir percent 25 conform-action set-mpls-exp-imposition-transmit 5 exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 29 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Interativa_Q6
   police cir percent 14 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QDO_A_10000K_2_0_0_0_0_2_95
  class class-default
    shape average 10000000
   service-policy QPO_A_10000K_2_0_0_0_0_2_95
policy-map QPI_A_4096K_10_N_30_35_0_0_1_22
  class Voz_Q6
   police cir percent 10 conform-action transmit  exceed-action drop 
  class Video_Q6
   police cir percent 30 conform-action set-mpls-exp-imposition-transmit 5 exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 35 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_A_10000K_8_N_16_52_0_0_1_21
  class Voz_Q6
   police cir percent 8 conform-action transmit  exceed-action drop 
  class Video_Q6
   police cir percent 16 conform-action set-mpls-exp-imposition-transmit 5 exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 52 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QDI_A_10000K_8_16_52_0_0_1_21
  class class-default
   police rate 10000000 child-conform-aware conform-action transmit  exceed-action drop 
   service-policy QPI_A_10000K_8_N_16_52_0_0_1_21
policy-map QPI_A_2048K_5_N_0_15_45_15_2_17
  class Voz_Q6
   police cir percent 5 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 15 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Interativa_Q6
   police cir percent 45 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Bulk_Q6
   police cir percent 15 conform-action set-mpls-exp-imposition-transmit 4 exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_A_4096K_30_N_26_26_0_0_1_16
  class Voz_Q6
   police cir percent 30 conform-action transmit  exceed-action drop 
  class Video_Q6
   police cir percent 26 conform-action set-mpls-exp-imposition-transmit 5 exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 26 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map PM_V10_QPO_BBONE_100000_V1
policy-map QPO_BBONE_100000_V1
  class class-default
    shape average 100000000
   service-policy PM_V10_QPO_BBONE_100000_V1
policy-map QPI_BBONE_S_4096_V1
  class class-default
   police 4096000 128000 128000 conform-action set-dscp-transmit default exceed-action drop 
policy-map QPI_A_2048K_15_N_25_38_0_0_1_19
  class Voz_Q6
   police cir percent 15 conform-action transmit  exceed-action drop 
  class Video_Q6
   police cir percent 25 conform-action set-mpls-exp-imposition-transmit 5 exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 38 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QDO_A_1024K_0_0_0_83_0_2_13
  class class-default
    shape average 1024000
   service-policy QPO_A_1024K_0_0_0_83_0_2_13
policy-map QPI_A_2048K_6_N_18_3_5_8_1_10
  class Voz_Q6
   police cir percent 6 conform-action transmit  exceed-action drop 
  class Video_Q6
   police cir percent 18 conform-action set-mpls-exp-imposition-transmit 5 exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 3 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Interativa_Q6
   police cir percent 5 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Bulk_Q6
   police cir percent 8 conform-action set-mpls-exp-imposition-transmit 4 exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map PM_V10_QPO_BBONE_155000_V1
policy-map QPO_BBONE_155000_V1
  class class-default
    shape average 155000000
   service-policy PM_V10_QPO_BBONE_155000_V1
policy-map QPI_A_40000K_6_N_11_16_16_21_1_28
  class Voz_Q6
   police cir percent 6 conform-action transmit  exceed-action drop 
  class Video_Q6
   police cir percent 11 conform-action set-mpls-exp-imposition-transmit 5 exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 16 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Interativa_Q6
   police cir percent 16 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Bulk_Q6
   police cir percent 21 conform-action set-mpls-exp-imposition-transmit 4 exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QDI_A_40000K_6_11_16_16_21_1_28
  class class-default
   police rate 40000000 child-conform-aware conform-action transmit  exceed-action drop 
   service-policy QPI_A_40000K_6_N_11_16_16_21_1_28
policy-map QPI_A_50000K_3_N_0_0_0_0_1_94
  class Voz_Q6
   police cir percent 3 conform-action transmit  exceed-action drop 
  class class-default
   set mpls experimental imposition 0
policy-map QDI_A_50000K_3_0_0_0_0_1_94
  class class-default
   police rate 50000000 child-conform-aware conform-action transmit  exceed-action drop 
   service-policy QPI_A_50000K_3_N_0_0_0_0_1_94
policy-map QDO_A_2048K_10_40_15_30_0_2_2
  class class-default
    shape average 2048000
   service-policy QPO_A_2048K_10_40_15_30_0_2_2
policy-map QPI_A_1024K_6_N_0_48_0_0_2_43
  class Voz_Q6
   police cir percent 6 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 48 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QDI_A_1024K_0_0_69_0_15_2_3
  class class-default
   police rate 1024000 child-conform-aware conform-action transmit  exceed-action drop 
   service-policy QPI_A_1024K_0_N_0_69_0_15_2_3
policy-map PM_V10_QPO_BBONE_6000_V1
policy-map QPO_BBONE_6000_V1
  class class-default
    shape average 6000000
   service-policy PM_V10_QPO_BBONE_6000_V1
policy-map QDI_A_10000K_2_0_0_0_0_2_95
  class class-default
   police rate 10000000 child-conform-aware conform-action transmit  exceed-action drop 
   service-policy QPI_A_10000K_2_N_0_0_0_0_2_95
policy-map QDO_A_10000K_8_16_52_0_0_1_21
  class class-default
    shape average 10000000
   service-policy QPO_A_10000K_8_16_52_0_0_1_21
policy-map PM_V10_QPO_BBONE_1024_V1
policy-map QPO_BBONE_1024_V1
  class class-default
    shape average 1024000
   service-policy PM_V10_QPO_BBONE_1024_V1
policy-map PM_V10_QPO_BBONE_6144_V1
policy-map QPO_BBONE_6144_V1
  class class-default
    shape average 6144000
   service-policy PM_V10_QPO_BBONE_6144_V1
policy-map PM_V10_QPO_BBONE_700000_V1
policy-map QPO_BBONE_700000_V1
  class class-default
    shape average 700000000
   service-policy PM_V10_QPO_BBONE_700000_V1
policy-map QDI_A_1024K_0_0_0_83_0_2_13
  class class-default
   police rate 1024000 child-conform-aware conform-action transmit  exceed-action drop 
   service-policy QPI_A_1024K_0_N_0_0_83_0_2_13
policy-map QDO_A_40000K_6_11_16_16_21_1_28
  class class-default
    shape average 40000000
   service-policy QPO_A_40000K_6_11_16_16_21_1_28
policy-map QDO_A_50000K_3_0_0_0_0_1_94
  class class-default
    shape average 50000000
   service-policy QPO_A_50000K_3_0_0_0_0_1_94
policy-map QDI_A_2048K_10_40_15_30_0_2_2
  class class-default
   police rate 2048000 child-conform-aware conform-action transmit  exceed-action drop 
   service-policy QPI_A_2048K_10_N_40_15_30_0_2_2
policy-map QPI_A_256K_13_N_0_60_0_0_7_19
  class Voz_Q6
   police cir percent 13 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 60 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_A_256K_10_N_0_61_13_0_7_8
  class Voz_Q6
   police cir percent 10 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 61 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Interativa_Q6
   police cir percent 13 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_BBONE_S_2048_V1
  class class-default
   police 2048000 64000 64000 conform-action set-dscp-transmit default exceed-action drop 
policy-map PM_V10_QPO_BBONE_1500_V1
policy-map QPO_BBONE_1500_V1
  class class-default
    shape average 1500000
   service-policy PM_V10_QPO_BBONE_1500_V1
policy-map QDI_A_2048K_6_18_3_5_8_1_10
  class class-default
   police rate 2048000 child-conform-aware conform-action transmit  exceed-action drop 
   service-policy QPI_A_2048K_6_N_18_3_5_8_1_10
policy-map QDO_A_50000K_3_0_0_0_0_2_94
  class class-default
    shape average 50000000
   service-policy QPO_A_50000K_3_0_0_0_0_2_94
policy-map QPO_512K_5_0_30_16_4_4_40
  class Voz_Q6
    priority
   police cir percent 5 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 30
    random-detect dscp-based
    random-detect dscp 24 40 ms 120 ms 1
    random-detect dscp 26 40 ms 120 ms 1
    random-detect dscp 28 40 ms 120 ms 1
    random-detect dscp 30 40 ms 120 ms 1
  class Interativa_Q6
    bandwidth percent 16
    random-detect dscp-based
    random-detect dscp 18 40 ms 120 ms 1
    random-detect dscp 20 40 ms 120 ms 1
    random-detect dscp 22 40 ms 120 ms 1
  class Bulk_Q6
    bandwidth percent 4
    random-detect dscp-based
    random-detect dscp 8 40 ms 120 ms 1
    random-detect dscp 10 40 ms 120 ms 1
    random-detect dscp 12 40 ms 120 ms 1
    random-detect dscp 14 40 ms 120 ms 1
    random-detect dscp 32 40 ms 120 ms 1
  class NetworkControl_Q6
    bandwidth percent 4
  class class-default
    bandwidth percent 40
    random-detect dscp-based
    random-detect dscp 0 40 ms 120 ms 1
policy-map QPO_BBONE_500000_V1
  class class-default
    shape average 500000000
policy-map QPI_A_512K_10_N_0_39_0_0_4_46
  class Voz_Q6
   police cir percent 10 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 39 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QDO_A_2048K_21_0_35_20_0_2_21
  class class-default
    shape average 2048000
   service-policy QPO_A_2048K_21_0_35_20_0_2_21
policy-map QDI_A_2048K_0_25_0_0_0_1_71
  class class-default
   police rate 2048000 child-conform-aware conform-action transmit  exceed-action drop 
   service-policy QPI_A_2048K_0_N_25_0_0_0_1_71
policy-map QPI_A_512K_10_N_0_54_22_0_4_9
  class Voz_Q6
   police cir percent 10 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 54 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Interativa_Q6
   police cir percent 22 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
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
policy-map QDI_A_2048K_9_25_29_14_0_2_20
  class class-default
   police rate 2048000 child-conform-aware conform-action transmit  exceed-action drop 
   service-policy QPI_A_2048K_9_N_25_29_14_0_2_20
policy-map QDO_A_2048K_20_30_34_0_0_2_13
  class class-default
    shape average 2048000
   service-policy QPO_A_2048K_20_30_34_0_0_2_13
policy-map QDO_A_2048K_30_0_20_2_35_2_10
  class class-default
    shape average 2048000
   service-policy QPO_A_2048K_30_0_20_2_35_2_10
policy-map QDO_10000K_BBrasil_NAC_GACC_V1
  class class-default
    shape average 10000000
   service-policy QPO_10000K_BBrasil_NAC_GACC_V1
policy-map QDI_A_4096K_10_30_35_0_0_1_22
  class class-default
   police rate 4096000 child-conform-aware conform-action transmit  exceed-action drop 
   service-policy QPI_A_4096K_10_N_30_35_0_0_1_22
policy-map QDO_256K_BBrasil_NAC_GACC_V1
  class class-default
    shape average 256000
   service-policy QPO_256K_BBrasil_NAC_GACC_V1
policy-map QDO_A_10000K_8_16_52_0_0_2_21
  class class-default
    shape average 10000000
   service-policy QPO_A_10000K_8_16_52_0_0_2_21
policy-map QDI_A_2048K_5_0_15_45_15_2_17
  class class-default
   police rate 2048000 child-conform-aware conform-action transmit  exceed-action drop 
   service-policy QPI_A_2048K_5_N_0_15_45_15_2_17
policy-map QPI_A_1024K_0_N_0_47_0_0_2_49
  class MissaoCritica_Q6
   police cir percent 47 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QDI_A_4096K_30_26_26_0_0_1_16
  class class-default
   police rate 4096000 child-conform-aware conform-action transmit  exceed-action drop 
   service-policy QPI_A_4096K_30_N_26_26_0_0_1_16
policy-map QPI_A_512K_22_C_20_28_13_11_4_1
  class Voz_Q6
   police cir percent 44 conform-action transmit  exceed-action drop 
  class Video_Q6
   police cir percent 20 conform-action set-mpls-exp-imposition-transmit 5 exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 28 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Interativa_Q6
   police cir percent 13 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Bulk_Q6
   police cir percent 11 conform-action set-mpls-exp-imposition-transmit 4 exceed-action set-mpls-exp-imposition-transmit 1
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
policy-map QDI_A_2048K_13_23_38_0_0_1_24
  class class-default
   police rate 2048000 child-conform-aware conform-action transmit  exceed-action drop 
   service-policy QPI_A_2048K_13_N_23_38_0_0_1_24
policy-map QPI_A_512K_10_N_0_13_0_0_4_72
  class Voz_Q6
   police cir percent 10 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 13 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QDO_A_10000K_7_0_1_0_0_1_89
  class class-default
    shape average 10000000
   service-policy QPO_A_10000K_7_0_1_0_0_1_89
policy-map QPI_A_2048K_10_N_25_24_0_0_1_38
  class Voz_Q6
   police cir percent 10 conform-action transmit  exceed-action drop 
  class Video_Q6
   police cir percent 25 conform-action set-mpls-exp-imposition-transmit 5 exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 24 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_A_1024K_19_N_0_38_13_0_2_27
  class Voz_Q6
   police cir percent 19 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 38 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Interativa_Q6
   police cir percent 13 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QDI_A_1024K_19_0_38_13_0_2_27
  class class-default
   police rate 1024000 child-conform-aware conform-action transmit  exceed-action drop 
   service-policy QPI_A_1024K_19_N_0_38_13_0_2_27
policy-map QDO_A_1024K_10_24_20_0_40_2_3
  class class-default
    shape average 1024000
   service-policy QPO_A_1024K_10_24_20_0_40_2_3
policy-map QPI_A_1024K_22_N_22_11_30_6_3_5
  class Voz_Q6
   police cir percent 22 conform-action transmit  exceed-action drop 
  class Video_Q6
   police cir percent 22 conform-action set-mpls-exp-imposition-transmit 5 exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 11 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Interativa_Q6
   police cir percent 30 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Bulk_Q6
   police cir percent 6 conform-action set-mpls-exp-imposition-transmit 4 exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_A_4096K_19_N_6_25_16_25_1_7
  class Voz_Q6
   police cir percent 19 conform-action transmit  exceed-action drop 
  class Video_Q6
   police cir percent 6 conform-action set-mpls-exp-imposition-transmit 5 exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 25 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Interativa_Q6
   police cir percent 16 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Bulk_Q6
   police cir percent 25 conform-action set-mpls-exp-imposition-transmit 4 exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QDO_A_16000K_11_34_0_0_0_1_53
  class class-default
    shape average 16000000
   service-policy QPO_A_16000K_11_34_0_0_0_1_53
policy-map QDO_A_1024K_12_0_34_25_18_2_8
  class class-default
    shape average 1024000
   service-policy QPO_A_1024K_12_0_34_25_18_2_8
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
policy-map PM_V10_QPO_BBONE_4096_V1
policy-map QPO_BBONE_4096_V1
  class class-default
    shape average 4096000
   service-policy PM_V10_QPO_BBONE_4096_V1
policy-map QPI_A_512K_5_N_0_2_0_0_4_88
  class Voz_Q6
   police cir percent 5 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 2 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
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
policy-map QPI_A_512K_13_N_0_25_0_0_4_57
  class Voz_Q6
   police cir percent 13 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 25 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QDO_A_1024K_22_0_36_22_0_2_17
  class class-default
    shape average 1024000
   service-policy QPO_A_1024K_22_0_36_22_0_2_17
policy-map QPI_A_512K_7_N_0_11_16_0_4_61
  class Voz_Q6
   police cir percent 7 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 11 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Interativa_Q6
   police cir percent 16 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_BBONE_S_155000_V1
  class class-default
   police 155000000 4843750 4843750 conform-action set-dscp-transmit default exceed-action drop 
policy-map QPI_A_6000K_2_N_7_64_0_0_2_24
  class Voz_Q6
   police cir percent 2 conform-action transmit  exceed-action drop 
  class Video_Q6
   police cir percent 7 conform-action set-mpls-exp-imposition-transmit 5 exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 64 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
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
policy-map QPO_256K_39_0_4_33_0_7_16
  class Voz_Q6
    priority
   police cir percent 39 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
    bandwidth percent 4
    random-detect dscp-based
    random-detect dscp 24 40 ms 120 ms 1
    random-detect dscp 26 40 ms 120 ms 1
    random-detect dscp 28 40 ms 120 ms 1
    random-detect dscp 30 40 ms 120 ms 1
  class Interativa_Q6
    bandwidth percent 33
    random-detect dscp-based
    random-detect dscp 18 40 ms 120 ms 1
    random-detect dscp 20 40 ms 120 ms 1
    random-detect dscp 22 40 ms 120 ms 1
  class NetworkControl_Q6
    bandwidth percent 7
  class class-default
    bandwidth percent 16
    random-detect dscp-based
    random-detect dscp 0 40 ms 120 ms 1
policy-map QPI_BBONE_S_8192_V1
  class class-default
   police 8192000 256000 256000 conform-action set-dscp-transmit default exceed-action drop 
policy-map QPI_BBONE_S_64_V1
  class class-default
   police 64000 4470 4470 conform-action set-dscp-transmit default exceed-action drop 
policy-map PM_V10_QPO_BBONE_8000_V1
policy-map QPO_BBONE_8000_V1
  class class-default
    shape average 8000000
   service-policy PM_V10_QPO_BBONE_8000_V1
policy-map QPI_BBONE_S_200000_V1
  class class-default
   police 200000000 6250000 6250000 conform-action set-dscp-transmit default exceed-action drop 
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
policy-map QPI_A_6000K_2_N_7_72_0_0_2_16
  class Voz_Q6
   police cir percent 2 conform-action transmit  exceed-action drop 
  class Video_Q6
   police cir percent 7 conform-action set-mpls-exp-imposition-transmit 5 exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 72 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QDI_A_6000K_2_7_72_0_0_2_16
  class class-default
   police rate 6000000 child-conform-aware conform-action transmit  exceed-action drop 
   service-policy QPI_A_6000K_2_N_7_72_0_0_2_16
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
policy-map QPI_A_14000K_16_N_37_14_14_14_2_2
  class Voz_Q6
   police cir percent 16 conform-action transmit  exceed-action drop 
  class Video_Q6
   police cir percent 37 conform-action set-mpls-exp-imposition-transmit 5 exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 14 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Interativa_Q6
   police cir percent 14 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Bulk_Q6
   police cir percent 14 conform-action set-mpls-exp-imposition-transmit 4 exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QDI_A_14000K_16_37_14_14_14_2_2
  class class-default
   police rate 14000000 child-conform-aware conform-action transmit  exceed-action drop 
   service-policy QPI_A_14000K_16_N_37_14_14_14_2_2
policy-map QDO_A_6000K_2_7_64_0_0_2_24
  class class-default
    shape average 6000000
   service-policy QPO_A_6000K_2_7_64_0_0_2_24
policy-map QDO_A_2048K_13_38_23_0_0_2_23
  class class-default
    shape average 2048000
   service-policy QPO_A_2048K_13_38_23_0_0_2_23
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
policy-map QPI_A_8192K_15_N_30_30_0_0_1_22
  class Voz_Q6
   police cir percent 15 conform-action transmit  exceed-action drop 
  class Video_Q6
   police cir percent 30 conform-action set-mpls-exp-imposition-transmit 5 exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 30 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_A_10000K_7_N_0_1_0_0_1_89
  class Voz_Q6
   police cir percent 7 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 1 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_A_2048K_13_N_0_0_0_0_2_84
  class Voz_Q6
   police cir percent 13 conform-action transmit  exceed-action drop 
  class class-default
   set mpls experimental imposition 0
policy-map QDI_A_2048K_13_0_0_0_0_2_84
  class class-default
   police rate 2048000 child-conform-aware conform-action transmit  exceed-action drop 
   service-policy QPI_A_2048K_13_N_0_0_0_0_2_84
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
policy-map QPI_A_10000K_4_N_0_8_0_84_2_1
  class Voz_Q6
   police cir percent 4 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 8 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Bulk_Q6
   police cir percent 84 conform-action set-mpls-exp-imposition-transmit 4 exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QDI_A_10000K_4_0_8_0_84_2_1
  class class-default
   police rate 10000000 child-conform-aware conform-action transmit  exceed-action drop 
   service-policy QPI_A_10000K_4_N_0_8_0_84_2_1
policy-map QPI_A_6000K_11_N_31_36_0_0_1_20
  class Voz_Q6
   police cir percent 11 conform-action transmit  exceed-action drop 
  class Video_Q6
   police cir percent 31 conform-action set-mpls-exp-imposition-transmit 5 exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 36 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QDI_A_6000K_11_31_36_0_0_1_20
  class class-default
   police rate 6000000 child-conform-aware conform-action transmit  exceed-action drop 
   service-policy QPI_A_6000K_11_N_31_36_0_0_1_20
policy-map QDO_A_4096K_19_6_25_16_25_1_7
  class class-default
    shape average 4096000
   service-policy QPO_A_4096K_19_6_25_16_25_1_7
policy-map QPI_A_16000K_11_N_34_0_0_0_1_53
  class Voz_Q6
   police cir percent 11 conform-action transmit  exceed-action drop 
  class Video_Q6
   police cir percent 34 conform-action set-mpls-exp-imposition-transmit 5 exceed-action drop 
  class class-default
   set mpls experimental imposition 0
policy-map QPI_A_6000K_9_N_9_54_0_0_2_25
  class Voz_Q6
   police cir percent 9 conform-action transmit  exceed-action drop 
  class Video_Q6
   police cir percent 9 conform-action set-mpls-exp-imposition-transmit 5 exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 54 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QDI_A_6000K_9_9_54_0_0_2_25
  class class-default
   police rate 6000000 child-conform-aware conform-action transmit  exceed-action drop 
   service-policy QPI_A_6000K_9_N_9_54_0_0_2_25
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
policy-map QDO_MB_512_152_128_104_0B_G5_V1
  class class-default
    shape average 512000
   service-policy QPO_MB_512_152_128_104_0B_G5_V1
policy-map QPI_A_256K_26_N_0_52_0_0_7_14
  class Voz_Q6
   police cir percent 26 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 52 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map PM_V10_QPO_BBONE_2048_V1
policy-map QPO_BBONE_2048_V1
  class class-default
    shape average 2048000
   service-policy PM_V10_QPO_BBONE_2048_V1
policy-map QPI_A_512K_50_N_0_10_0_0_4_35
  class Voz_Q6
   police cir percent 50 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 10 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QDO_A_6000K_2_7_72_0_0_2_16
  class class-default
    shape average 6000000
   service-policy QPO_A_6000K_2_7_72_0_0_2_16
policy-map QDO_A_512K_5_0_30_16_4_4_40
  class class-default
    shape average 512000
   service-policy QPO_A_512K_5_0_30_16_4_4_40
policy-map QDO_A_14000K_16_37_14_14_14_2_2
  class class-default
    shape average 14000000
   service-policy QPO_A_14000K_16_37_14_14_14_2_2
policy-map QPI_A_2048K_7_N_0_16_29_12_1_34
  class Voz_Q6
   police cir percent 7 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 16 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Interativa_Q6
   police cir percent 29 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Bulk_Q6
   police cir percent 12 conform-action set-mpls-exp-imposition-transmit 4 exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QDI_A_6000K_2_7_64_0_0_2_24
  class class-default
   police rate 6000000 child-conform-aware conform-action transmit  exceed-action drop 
   service-policy QPI_A_6000K_2_N_7_64_0_0_2_24
policy-map QDI_A_2048K_13_38_23_0_0_2_23
  class class-default
   police rate 2048000 child-conform-aware conform-action transmit  exceed-action drop 
   service-policy QPI_A_2048K_13_N_38_23_0_0_2_23
policy-map QDO_A_512K_5_0_30_16_0_4_44
  class class-default
    shape average 512000
   service-policy QPO_A_512K_5_0_30_16_0_4_44
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
policy-map QDO_A_2048K_13_0_0_0_0_2_84
  class class-default
    shape average 2048000
   service-policy QPO_A_2048K_13_0_0_0_0_2_84
policy-map QDO_A_10000K_4_0_8_0_84_2_1
  class class-default
    shape average 10000000
   service-policy QPO_A_10000K_4_0_8_0_84_2_1
policy-map QDO_A_6000K_11_31_36_0_0_1_20
  class class-default
    shape average 6000000
   service-policy QPO_A_6000K_11_31_36_0_0_1_20
policy-map QDI_A_4096K_19_6_25_16_25_1_7
  class class-default
   police rate 4096000 child-conform-aware conform-action transmit  exceed-action drop 
   service-policy QPI_A_4096K_19_N_6_25_16_25_1_7
policy-map QDO_A_6000K_9_9_54_0_0_2_25
  class class-default
    shape average 6000000
   service-policy QPO_A_6000K_9_9_54_0_0_2_25
policy-map QDO_A_2048K_13_23_38_0_0_1_24
  class class-default
    shape average 2048000
   service-policy QPO_A_2048K_13_23_38_0_0_1_24
policy-map QPI_A_512K_21_N_0_50_0_0_4_24
  class Voz_Q6
   police cir percent 21 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 50 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QDI_A_10000K_7_0_1_0_0_1_89
  class class-default
   police rate 10000000 child-conform-aware conform-action transmit  exceed-action drop 
   service-policy QPI_A_10000K_7_N_0_1_0_0_1_89
policy-map QDO_A_1024K_19_0_38_13_0_2_27
  class class-default
    shape average 1024000
   service-policy QPO_A_1024K_19_0_38_13_0_2_27
policy-map QDI_A_1024K_10_24_20_0_40_2_3
  class class-default
   police rate 1024000 child-conform-aware conform-action transmit  exceed-action drop 
   service-policy QPI_A_1024K_10_N_24_20_0_40_2_3
policy-map QPI_A_512K_25_N_0_60_0_0_4_10
  class Voz_Q6
   police cir percent 25 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 60 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_A_512K_25_N_0_10_0_0_4_60
  class Voz_Q6
   police cir percent 25 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 10 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QDI_A_16000K_11_34_0_0_0_1_53
  class class-default
   police rate 16000000 child-conform-aware conform-action transmit  exceed-action drop 
   service-policy QPI_A_16000K_11_N_34_0_0_0_1_53
policy-map QDI_A_1024K_12_0_34_25_18_2_8
  class class-default
   police rate 1024000 child-conform-aware conform-action transmit  exceed-action drop 
   service-policy QPI_A_1024K_12_N_0_34_25_18_2_8
policy-map QPI_BBONE_S_6000_V1
  class class-default
   police 6000000 187500 187500 conform-action set-dscp-transmit default exceed-action drop 
policy-map QPI_BBONE_S_6144_V1
  class class-default
   police 6144000 192000 192000 conform-action set-dscp-transmit default exceed-action drop 
policy-map QPI_BBONE_S_1024_V1
  class class-default
   police 1024000 32000 32000 conform-action set-dscp-transmit default exceed-action drop 
policy-map QPI_A_4096K_14_N_15_18_10_27_1_14
  class Voz_Q6
   police cir percent 14 conform-action transmit  exceed-action drop 
  class Video_Q6
   police cir percent 15 conform-action set-mpls-exp-imposition-transmit 5 exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 18 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Interativa_Q6
   police cir percent 10 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Bulk_Q6
   police cir percent 27 conform-action set-mpls-exp-imposition-transmit 4 exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QPI_BBONE_S_700000_V1
  class class-default
   police cir 700000000 bc 21875000 be 21875000 conform-action set-dscp-transmit default exceed-action drop 
policy-map QDI_A_1024K_22_0_36_22_0_2_17
  class class-default
   police rate 1024000 child-conform-aware conform-action transmit  exceed-action drop 
   service-policy QPI_A_1024K_22_N_0_36_22_0_2_17
policy-map QPI_A_256K_25_N_0_50_0_0_7_16
  class Voz_Q6
   police cir percent 25 conform-action transmit  exceed-action drop 
  class MissaoCritica_Q6
   police cir percent 50 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
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
policy-map QPI_VIPSIP_VOZ_800_V1
policy-map QDI_VIPSIP_VOZ_800_V1
  class class-default
   police rate 800000 child-conform-aware conform-action transmit  exceed-action drop 
   service-policy QPI_VIPSIP_VOZ_800_V1
policy-map PM_V10_QPO_BBONE_960_V1
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
policy-map QPO_1000M_TESTE_QUALIDADE
policy-map WAN_OUT_OMEGA_TER
  class MISSAO_CRITICA
    bandwidth percent 39
  class GERENCIAMENTO
    bandwidth percent 13
policy-map QPI_1000M_TESTE_QUALIDADE
  class Video_Q6
   set mpls experimental imposition 5
  class Bulk_Q6
   set mpls experimental imposition 4
policy-map QOS_DTS_OUT_A_8000K_816K_0K
  class class-default
    shape average 8000000
   service-policy QOS_POLICY_OUT_A_11P_0P
policy-map QPO_64K_BBrasil_PAE_IOS_V1
  class MISSAO_CRITICA
    bandwidth percent 50
    random-detect dscp-based
  class GERENCIAMENTO
    bandwidth percent 13
    random-detect dscp-based
  class NETWORK_CONTROL
    bandwidth percent 13
    random-detect dscp-based
policy-map QDO_64K_BBrasil_PAE_IOS_V1
  class class-default
    shape average 64000
   service-policy QPO_64K_BBrasil_PAE_IOS_V1
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
policy-map QOS_POLICY_IN_A_7P_3P
  class REALTIME
   police cir percent 7 conform-action transmit  exceed-action drop 
  class BUSINESS
   police cir percent 3 conform-action transmit  exceed-action set-dscp-transmit default
  class class-default
   set mpls experimental imposition 0
policy-map QOS_POLICY_IN_A_10P_25P
  class REALTIME
   police cir percent 10 conform-action transmit  exceed-action drop 
  class BUSINESS
   police cir percent 25 conform-action transmit  exceed-action set-dscp-transmit default
  class class-default
   set mpls experimental imposition 0
policy-map QOS_POLICY_IN_A_7P_0P
  class REALTIME
   police cir percent 7 conform-action transmit  exceed-action drop 
  class class-default
   set mpls experimental imposition 0
policy-map QDO_SGNET_512_0_256_192_0B_V1
  class class-default
   service-policy QPO_SGNET_512_0_256_192_0B_V1
policy-map QDO_1000M_TESTE_QUALIDADE
  class class-default
    shape average 1000000000
   service-policy QPO_1000M_TESTE_QUALIDADE
policy-map QPI_2M_820_0_312_162_134_108_0B_A_V1
  class TEMPO_REAL_VOZ
   police cir percent 41 conform-action transmit  exceed-action drop 
  class MISSAO_CRITICA
   police cir percent 16 conform-action transmit  exceed-action set-dscp-transmit af43
  class GERENCIAMENTO
   police cir percent 8 conform-action transmit  exceed-action set-dscp-transmit af32
  class SUPORTE_AO_NEGOCIO
   police cir percent 7 conform-action transmit  exceed-action set-dscp-transmit af23
  class NAO_CRITICO
   police cir percent 6 conform-action transmit  exceed-action set-dscp-transmit af13
policy-map QDO_A_20000K_RCC_CLARO
  class class-default
    shape average 20000000
   service-policy QPO_A_20000K_0_RCC_CLARO
policy-map QPO_2M_820_0_312_162_134_108_0B_A_V1
  class TEMPO_REAL_VOZ
    priority
   police cir percent 41 conform-action transmit  exceed-action drop 
  class MISSAO_CRITICA
    bandwidth percent 16
    bandwidth remaining percent 16
    random-detect dscp-based
    random-detect dscp 32 14 packets 30 packets 1
    random-detect dscp 36 14 packets 30 packets 1
    random-detect dscp 38 14 packets 30 packets 1
    queue-limit 60 packets
  class GERENCIAMENTO
    bandwidth percent 8
    bandwidth remaining percent 8
    random-detect dscp-based
    random-detect dscp 24 12 packets 20 packets 1
    random-detect dscp 26 12 packets 20 packets 1
    random-detect dscp 28 12 packets 20 packets 1
    queue-limit 40 packets
  class SUPORTE_AO_NEGOCIO
    bandwidth percent 7
    bandwidth remaining percent 7
    random-detect dscp-based
    random-detect dscp 16 12 packets 20 packets 1
    random-detect dscp 18 12 packets 20 packets 1
    random-detect dscp 22 12 packets 20 packets 1
    queue-limit 40 packets
  class NAO_CRITICO
    bandwidth percent 6
    bandwidth remaining percent 6
    random-detect dscp-based
    random-detect dscp 8 7 packets 15 packets 1
    random-detect dscp 10 7 packets 15 packets 1
    random-detect dscp 14 7 packets 15 packets 1
    queue-limit 30 packets
  class class-default
    bandwidth percent 22
    bandwidth remaining percent 22
    random-detect dscp-based
    random-detect dscp 0 24 packets 40 packets 1
    queue-limit 80 packets
policy-map QDI_A_20000K_RCC_CLARO
  class class-default
   police rate 20000000 child-conform-aware conform-action transmit  exceed-action drop 
   service-policy QPI_A_20000K_0_RCC_CLARO
policy-map QOS_POLICY_IN_A_13P_0P
  class REALTIME
   police cir percent 13 conform-action transmit  exceed-action drop 
  class class-default
   set mpls experimental imposition 0
policy-map QPO_1024_SANTANDER_GACC_V1
  class Santander_Multimidia_Q6
    priority
   police cir percent 30 conform-action transmit  exceed-action drop 
  class Santander_Ouro_Q6
    bandwidth percent 20
    random-detect dscp-based
    random-detect dscp 24 12 packets 20 packets 1
    random-detect dscp 26 12 packets 20 packets 1
    random-detect dscp 28 12 packets 20 packets 1
    random-detect dscp 30 12 packets 20 packets 1
    queue-limit 40 packets
  class Santander_Suporte_Q6
    bandwidth percent 2
    random-detect dscp-based
    random-detect dscp 16 5 packets 9 packets 1
    random-detect dscp 18 5 packets 9 packets 1
    random-detect dscp 20 5 packets 9 packets 1
    queue-limit 18 packets
  class Santander_Prata_Q6
    bandwidth percent 35
    random-detect dscp-based
    random-detect dscp 8 14 packets 30 packets 1
    random-detect dscp 12 14 packets 30 packets 1
    queue-limit 60 packets
  class NetworkControl_Q6
    bandwidth percent 3
    queue-limit 18 packets
  class class-default
    bandwidth percent 10
    random-detect dscp-based
    random-detect dscp 0 7 packets 15 packets 1
    queue-limit 30 packets
policy-map QDO_1024_SANTANDER_GACC_V1
  class class-default
    shape average 1024000
   service-policy QPO_1024_SANTANDER_GACC_V1
policy-map QPO_VIPSIP_VOZ_1500_V1
  class Voz_Q6
    priority
   police rate 1432000 conform-action transmit  exceed-action drop 
  class NetworkControl_Q6
    bandwidth 64
    queue-limit 32 packets
policy-map QPI_VIPSIP_VOZ_1500_V1
  class class-default
   police cir percent 100 conform-action transmit  exceed-action drop 
policy-map QPO_MCI_ETM_1536K_64K_1472K_V1
  class GOLD_EF_MCI
    priority
   police cir percent 90
  class SILVER_AF4x_MCI
    bandwidth percent 3
    random-detect dscp-based
    random-detect dscp 32 171 packets 500 packets 1
    random-detect dscp 34 171 packets 500 packets 1
    random-detect dscp 36 52 packets 171 packets 1
    random-detect dscp 38 52 packets 171 packets 1
    queue-limit 512 packets
  class SILVER_AF3x_MCI
    bandwidth percent 3
    random-detect dscp-based
    random-detect dscp 24 171 packets 500 packets 1
    random-detect dscp 26 171 packets 500 packets 1
    random-detect dscp 28 52 packets 171 packets 1
    random-detect dscp 30 52 packets 171 packets 1
    random-detect dscp 48 511 packets 512 packets 1
    random-detect dscp 56 511 packets 512 packets 1
    queue-limit 512 packets
  class SILVER_AF2x_MCI
    bandwidth percent 2
    random-detect dscp-based
    random-detect dscp 16 171 packets 500 packets 1
    random-detect dscp 18 171 packets 500 packets 1
    random-detect dscp 20 52 packets 171 packets 1
    random-detect dscp 22 52 packets 171 packets 1
    queue-limit 512 packets
  class SILVER_BEST_EFFORT_MCI
    bandwidth percent 2
    random-detect
    queue-limit 512 packets
policy-map QDO_MCI_ETM_1536K_64K_1472K_V1
  class class-default
    shape average 1536000
   service-policy QPO_MCI_ETM_1536K_64K_1472K_V1
policy-map QPI_1024_SANTANDER_GACC_V1
  class Santander_Multimidia_Q6
   police cir percent 30 conform-action set-mpls-exp-imposition-transmit 5 exceed-action drop 
  class Santander_Ouro_Q6
   police cir percent 20 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Santander_Suporte_Q6
   police cir percent 2 conform-action transmit  exceed-action set-mpls-exp-imposition-transmit 1
  class Santander_Prata_Q6
   police cir percent 35 conform-action set-mpls-exp-imposition-transmit 4 exceed-action set-mpls-exp-imposition-transmit 1
  class class-default
   set mpls experimental imposition 0
policy-map QDI_1024_SANTANDER_GACC_V1
  class class-default
   police rate 1024000 conform-action transmit  exceed-action drop 
   service-policy QPI_1024_SANTANDER_GACC_V1
policy-map QDO_2M_820_0_312_162_134_108_0B_A_V1
  class class-default
    shape average 2048000
   service-policy QPO_2M_820_0_312_162_134_108_0B_A_V1
policy-map QPI_BBONE_EXP_V1
  class class-default
   set mpls experimental imposition 0
policy-map QDI_VIPSIP_VOZ_1500_V1
  class class-default
   police rate 1504000 child-conform-aware conform-action transmit  exceed-action drop 
   service-policy QPI_VIPSIP_VOZ_1500_V1
policy-map QPI_MCI_ETM_1536K_64K_1472K_V1
  class GOLD_EF_MCI
   police 64000 12000 24000 conform-action transmit  exceed-action drop 
  class SILVER_AF4x_MCI
   set mpls experimental 5
  class SILVER_AF3x_MCI
   set mpls experimental 1
  class SILVER_AF2x_MCI
   set mpls experimental 1
policy-map QDO_VIPSIP_VOZ_1500_V1
  class class-default
    shape average 1500000
   service-policy QPO_VIPSIP_VOZ_1500_V1
!
bfd slow-timers 3000
frame-relay switching
mpls label protocol ldp
mpls ldp igp sync holddown 30000
no mpls traffic-eng auto-bw timers frequency 0
file prompt quiet
!
controller SONET 0/3/0
 description Link Datacom | 155M | SLSUSDM/SLSUSIT/155M/009 | PTA: DMSTM1-SLSUS-DI09 AGGA 1
 ais-shut
 alarm-report all
 framing sdh
 clock source line
 overhead j0 1
 aug mapping au-4
 !
 au-4 1 tug-3 1
  mode c-12
  tug-2 2 e1 1 unframed
  tug-2 2 e1 1 clock source Line
  tug-2 2 e1 2 unframed
  tug-2 2 e1 2 clock source Line
  tug-2 7 e1 3 unframed
  tug-2 7 e1 3 clock source Line
 !
 au-4 1 tug-3 2
  mode c-12
  tug-2 3 e1 1 channel-group 0 timeslots 1-16
  tug-2 3 e1 1 framing no-crc4
  tug-2 3 e1 1 clock source Line
  tug-2 7 e1 2 channel-group 0 timeslots 1-16
  tug-2 7 e1 2 channel-group 1 timeslots 25-28
  tug-2 7 e1 2 channel-group 2 timeslots 17-24
  tug-2 7 e1 2 framing no-crc4
  tug-2 7 e1 2 clock source Line
 !
 au-4 1 tug-3 3
  mode c-12
  tug-2 2 e1 3 unframed
  tug-2 2 e1 3 clock source Line
  tug-2 4 e1 1 unframed
  tug-2 4 e1 1 clock source Line
  tug-2 4 e1 3 unframed
  tug-2 4 e1 3 clock source Line
  tug-2 7 e1 2 channel-group 1 timeslots 24-31
  tug-2 7 e1 2 channel-group 2 timeslots 8-15
  tug-2 7 e1 2 channel-group 3 timeslots 16-23
  tug-2 7 e1 2 channel-group 4 timeslots 4-7
  tug-2 7 e1 2 framing no-crc4
  tug-2 7 e1 2 clock source Line
!
controller SONET 3/0/0
 description Link DATACOM | 155M | SLSUSDM/SLSUSIT/155M/010 | STM1-SLSUS-DI10-AGGA-1
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
  tug-2 2 e1 1 unframed
  tug-2 2 e1 1 clock source Line
  tug-2 2 e1 2 unframed
  tug-2 2 e1 2 clock source Line
  tug-2 2 e1 3 unframed
  tug-2 2 e1 3 clock source Line
  tug-2 4 e1 3 unframed
  tug-2 4 e1 3 clock source Line
  tug-2 5 e1 1 channel-group 1 timeslots 17-24
  tug-2 5 e1 1 channel-group 2 timeslots 31
  tug-2 5 e1 1 framing no-crc4
  tug-2 5 e1 1 clock source Line
  tug-2 6 e1 3 unframed
  tug-2 6 e1 3 clock source Line
  tug-2 7 e1 2 unframed
  tug-2 7 e1 2 clock source Line
 !
 au-4 1 tug-3 2
  mode c-12
  tug-2 2 e1 3 unframed
  tug-2 2 e1 3 clock source Line
  tug-2 3 e1 1 channel-group 0 timeslots 1-16
  tug-2 3 e1 1 framing no-crc4
  tug-2 3 e1 1 clock source Line
  tug-2 4 e1 2 unframed
  tug-2 4 e1 2 clock source Line
  tug-2 5 e1 1 unframed
  tug-2 5 e1 1 clock source Line
  tug-2 5 e1 2 unframed
  tug-2 5 e1 2 clock source Line
  tug-2 5 e1 3 unframed
  tug-2 5 e1 3 clock source Line
 !
 au-4 1 tug-3 3
  mode c-12
  tug-2 1 e1 1 channel-group 0 timeslots 1-16
  tug-2 1 e1 1 framing no-crc4
  tug-2 1 e1 1 clock source Line
  tug-2 2 e1 3 unframed
  tug-2 2 e1 3 clock source Line
  tug-2 3 e1 2 channel-group 1 timeslots 25-28
  tug-2 3 e1 2 channel-group 2 timeslots 9-12
  tug-2 3 e1 2 channel-group 3 timeslots 17-24
  tug-2 3 e1 2 channel-group 4 timeslots 31
  tug-2 3 e1 2 channel-group 5 timeslots 13-16
  tug-2 3 e1 2 channel-group 6 timeslots 1-8
  tug-2 3 e1 2 channel-group 7 timeslots 29-30
  tug-2 3 e1 2 framing no-crc4
  tug-2 3 e1 2 clock source Line
  tug-2 3 e1 3 channel-group 1 timeslots 17-24
  tug-2 3 e1 3 channel-group 2 timeslots 25-28
  tug-2 3 e1 3 channel-group 3 timeslots 1-8
  tug-2 3 e1 3 channel-group 4 timeslots 9-16
  tug-2 3 e1 3 channel-group 5 timeslots 29-30
  tug-2 3 e1 3 framing no-crc4
  tug-2 3 e1 3 clock source Line
  tug-2 4 e1 1 channel-group 1 timeslots 9-12
  tug-2 4 e1 1 channel-group 2 timeslots 13-20
  tug-2 4 e1 1 channel-group 3 timeslots 1-8
  tug-2 4 e1 1 channel-group 4 timeslots 21-28
  tug-2 4 e1 1 framing no-crc4
  tug-2 4 e1 1 clock source Line
  tug-2 4 e1 2 channel-group 2 timeslots 9-12
  tug-2 4 e1 2 channel-group 5 timeslots 19-26
  tug-2 4 e1 2 framing no-crc4
  tug-2 4 e1 2 clock source Line
  tug-2 4 e1 3 channel-group 1 timeslots 24-31
  tug-2 4 e1 3 channel-group 2 timeslots 9-16
  tug-2 4 e1 3 channel-group 3 timeslots 1-8
  tug-2 4 e1 3 framing no-crc4
  tug-2 4 e1 3 clock source Line
  tug-2 7 e1 1 unframed
  tug-2 7 e1 1 clock source Line
!
controller SONET 3/1/0
 description Link DATACOM | 155M | SLSUSDM/SLSUSIT/155M/011 | STM1-SLSUS-DI11-AGGA-1
 ais-shut
 alarm-report all
 framing sdh
 clock source line
 overhead j0 1
 aug mapping au-4
 !
 au-4 1 tug-3 1
  mode c-12
  tug-2 3 e1 3 channel-group 0 timeslots 1-8
  tug-2 3 e1 3 channel-group 3 timeslots 24-31
  tug-2 3 e1 3 framing no-crc4
  tug-2 3 e1 3 clock source Line
  tug-2 5 e1 1 channel-group 0 timeslots 16-23
  tug-2 5 e1 1 channel-group 1 timeslots 24-31
  tug-2 5 e1 1 channel-group 2 timeslots 1-8
  tug-2 5 e1 1 framing no-crc4
  tug-2 5 e1 1 clock source Line
  tug-2 5 e1 2 unframed
  tug-2 5 e1 2 clock source Line
  tug-2 5 e1 3 channel-group 1 timeslots 24-31
  tug-2 5 e1 3 channel-group 2 timeslots 1-16
  tug-2 5 e1 3 framing no-crc4
  tug-2 5 e1 3 clock source Line
 !
 au-4 1 tug-3 2
  mode c-12
  tug-2 1 e1 1 unframed
  tug-2 1 e1 1 clock source Line
  tug-2 1 e1 2 unframed
  tug-2 1 e1 2 clock source Line
  tug-2 2 e1 1 channel-group 0 timeslots 9-24
  tug-2 2 e1 1 framing no-crc4
  tug-2 2 e1 1 clock source Line
  tug-2 2 e1 2 unframed
  tug-2 2 e1 2 clock source Line
  tug-2 5 e1 1 channel-group 0 timeslots 1-16
  tug-2 5 e1 1 framing no-crc4
  tug-2 5 e1 1 clock source Line
  tug-2 5 e1 3 unframed
  tug-2 5 e1 3 clock source Line
  tug-2 6 e1 1 unframed
  tug-2 6 e1 1 clock source Line
 !
 au-4 1 tug-3 3
  mode c-12
  tug-2 1 e1 3 channel-group 0 timeslots 1-4
  tug-2 1 e1 3 channel-group 1 timeslots 5-12
  tug-2 1 e1 3 framing no-crc4
  tug-2 1 e1 3 clock source Line
  tug-2 2 e1 1 channel-group 1 timeslots 17-24
  tug-2 2 e1 1 channel-group 2 timeslots 31
  tug-2 2 e1 1 channel-group 3 timeslots 13-16
  tug-2 2 e1 1 framing no-crc4
  tug-2 2 e1 1 clock source Line
!
controller SONET 3/2/0
 description Link DATACOM | 155M | SLSUSDM/SLSUSIT/155M/015 | STM1-SLSUS-DI15-AGGA-1
 ais-shut
 alarm-report all
 framing sdh
 clock source line
 overhead j0 1
 aug mapping au-4
 !
 au-4 1 tug-3 1
  mode c-12
  tug-2 3 e1 2 channel-group 0 timeslots 1-8
  tug-2 3 e1 2 channel-group 1 timeslots 9-16
  tug-2 3 e1 2 channel-group 2 timeslots 17-24
  tug-2 3 e1 2 channel-group 3 timeslots 25-28
  tug-2 3 e1 2 framing no-crc4
  tug-2 3 e1 2 clock source Line
  tug-2 3 e1 3 channel-group 0 timeslots 1-8
  tug-2 3 e1 3 channel-group 1 timeslots 24-31
  tug-2 3 e1 3 channel-group 2 timeslots 9-16
  tug-2 3 e1 3 channel-group 3 timeslots 17-20
  tug-2 3 e1 3 framing no-crc4
  tug-2 3 e1 3 clock source Line
  tug-2 5 e1 3 unframed
  tug-2 5 e1 3 clock source Line
  tug-2 6 e1 3 unframed
  tug-2 6 e1 3 clock source Line
 !
 au-4 1 tug-3 2
  mode c-12
  tug-2 5 e1 2 channel-group 0 timeslots 1-8
  tug-2 5 e1 2 channel-group 1 timeslots 9-16
  tug-2 5 e1 2 channel-group 3 timeslots 17-24
  tug-2 5 e1 2 framing no-crc4
  tug-2 5 e1 2 clock source Line
  tug-2 7 e1 2 channel-group 0 timeslots 17-24
  tug-2 7 e1 2 framing no-crc4
  tug-2 7 e1 2 clock source Line
  tug-2 7 e1 3 unframed
  tug-2 7 e1 3 clock source Line
 !
 au-4 1 tug-3 3
  mode c-12
  tug-2 1 e1 1 unframed
  tug-2 1 e1 1 clock source Line
  tug-2 1 e1 3 channel-group 0 timeslots 1-8
  tug-2 1 e1 3 channel-group 1 timeslots 24-31
  tug-2 1 e1 3 channel-group 2 timeslots 9-12
  tug-2 1 e1 3 channel-group 3 timeslots 13-20
  tug-2 1 e1 3 channel-group 4 timeslots 21
  tug-2 1 e1 3 framing no-crc4
  tug-2 1 e1 3 clock source Line
  tug-2 6 e1 2 channel-group 0 timeslots 1-16
  tug-2 6 e1 2 framing no-crc4
  tug-2 6 e1 2 clock source Line
  tug-2 6 e1 3 channel-group 0 timeslots 1-24
  tug-2 6 e1 3 framing no-crc4
  tug-2 6 e1 3 clock source Line
  tug-2 7 e1 1 channel-group 1 timeslots 1-8
  tug-2 7 e1 1 channel-group 3 timeslots 11-26
  tug-2 7 e1 1 framing no-crc4
  tug-2 7 e1 1 clock source Line
!
controller SONET 3/3/0
 description Link DATACOM | 155M | SLSUSDM/SLSUSIT/155M/016 | STM1-SLSUS-DI16-AGGA-1
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
  tug-2 1 e1 2 channel-group 2 timeslots 17-31
  tug-2 1 e1 2 framing no-crc4
  tug-2 1 e1 2 clock source Line
  tug-2 2 e1 1 channel-group 1 timeslots 17-31
  tug-2 2 e1 1 framing no-crc4
  tug-2 2 e1 1 clock source Line
  tug-2 2 e1 2 channel-group 2 timeslots 17-31
  tug-2 2 e1 2 framing no-crc4
  tug-2 2 e1 2 clock source Line
  tug-2 4 e1 1 channel-group 1 timeslots 1-15
  tug-2 4 e1 1 framing no-crc4
  tug-2 4 e1 1 clock source Line
  tug-2 5 e1 3 channel-group 2 timeslots 1-15
  tug-2 5 e1 3 framing no-crc4
  tug-2 5 e1 3 clock source Line
  tug-2 6 e1 1 channel-group 1 timeslots 1-15
  tug-2 6 e1 1 framing no-crc4
  tug-2 6 e1 1 clock source Line
  tug-2 6 e1 3 channel-group 2 timeslots 1-15
  tug-2 6 e1 3 framing no-crc4
  tug-2 6 e1 3 clock source Line
 !
 au-4 1 tug-3 2
  mode c-12
  tug-2 1 e1 1 channel-group 2 timeslots 17-31
  tug-2 1 e1 1 framing no-crc4
  tug-2 1 e1 1 clock source Line
  tug-2 2 e1 1 channel-group 0 timeslots 1-16
  tug-2 2 e1 1 framing no-crc4
  tug-2 2 e1 1 clock source Line
  tug-2 2 e1 2 channel-group 1 timeslots 1-15
  tug-2 2 e1 2 channel-group 2 timeslots 17-31
  tug-2 2 e1 2 framing no-crc4
  tug-2 2 e1 2 clock source Line
  tug-2 2 e1 3 channel-group 1 timeslots 1-15
  tug-2 2 e1 3 framing no-crc4
  tug-2 2 e1 3 clock source Line
  tug-2 3 e1 2 channel-group 1 timeslots 1-15
  tug-2 3 e1 2 framing no-crc4
  tug-2 3 e1 2 clock source Line
  tug-2 6 e1 1 unframed
  tug-2 6 e1 1 clock source Line
  tug-2 6 e1 2 unframed
  tug-2 6 e1 2 clock source Line
 !
 au-4 1 tug-3 3
  mode c-12
  tug-2 1 e1 1 channel-group 2 timeslots 9-24
  tug-2 1 e1 1 channel-group 4 timeslots 31
  tug-2 1 e1 1 framing no-crc4
  tug-2 1 e1 1 clock source Line
  tug-2 2 e1 3 channel-group 2 timeslots 24-27
  tug-2 2 e1 3 channel-group 4 timeslots 5-20
  tug-2 2 e1 3 framing no-crc4
  tug-2 2 e1 3 clock source Line
  tug-2 3 e1 1 unframed
  tug-2 3 e1 1 clock source Line
  tug-2 3 e1 2 channel-group 0 timeslots 1-8
  tug-2 3 e1 2 channel-group 1 timeslots 9-24
  tug-2 3 e1 2 framing no-crc4
  tug-2 3 e1 2 clock source Line
  tug-2 3 e1 3 unframed
  tug-2 3 e1 3 clock source Line
  tug-2 4 e1 2 channel-group 1 timeslots 1-8
  tug-2 4 e1 2 channel-group 2 timeslots 9-16
  tug-2 4 e1 2 channel-group 3 timeslots 17-24
  tug-2 4 e1 2 framing no-crc4
  tug-2 4 e1 2 clock source Line
  tug-2 5 e1 3 channel-group 0 timeslots 1-16
  tug-2 5 e1 3 framing no-crc4
  tug-2 5 e1 3 clock source Line
  tug-2 6 e1 1 channel-group 1 timeslots 1-8
  tug-2 6 e1 1 channel-group 2 timeslots 9-12
  tug-2 6 e1 1 channel-group 4 timeslots 15
  tug-2 6 e1 1 framing no-crc4
  tug-2 6 e1 1 clock source Line
  tug-2 7 e1 2 channel-group 0 timeslots 1-16
  tug-2 7 e1 2 channel-group 1 timeslots 17-24
  tug-2 7 e1 2 framing no-crc4
  tug-2 7 e1 2 clock source Line
  tug-2 7 e1 3 unframed
  tug-2 7 e1 3 clock source Line
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
 ip address 200.244.29.65 255.255.255.255
 no ip redirects
 no ip unreachables
 no ip directed-broadcast
 no ip proxy-arp
 ip pim sparse-mode
 no ip route-cache
 no ip mroute-cache
 hold-queue 2000 in
!
interface Loopback99999
 description loopback da 3a VIA NGN - CANAO DE SLS
 ip address 200.230.92.6 255.255.255.255
 no ip directed-broadcast
!
interface Loopback386247
 no ip address
 no ip directed-broadcast
!
interface Loopback27081990
 ip address 177.54.138.10 255.255.255.255
 no ip directed-broadcast
!
interface Multilink4
 dampening 30 50 1100 200
 no ip address
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 load-interval 30
 shutdown
 no cdp enable
 ppp multilink
 ppp multilink fragment-delay 10
 no ppp multilink fragmentation
 multilink min-links 1 mandatory
 multilink-group 4
 no clns route-cache
 service-policy input QPI_BBONE_EXP_V1
!
interface Multilink12
 dampening 30 50 1100 200
 description SUPERMMACIEL  | 2048K | SLS/MULTI/31731 | (SLS/MULTI/31731)
 bandwidth 2048
 ip vrf forwarding SUPERMMACIEL:3754
 ip address 187.28.240.109 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no peer neighbor-route
 no cdp enable
 ppp multilink
 ppp multilink fragment-delay 10
 no ppp multilink fragmentation
 multilink min-links 1 mandatory
 multilink-group 12
 no clns route-cache
 service-policy input QPI_A_2048K_5_N_0_1_7_0_2_84
 service-policy output QPO_A_2048K_5_0_1_7_0_2_84
!
interface Multilink16
 dampening 30 50 1100 200
 description ABNAMRO  | 1024K | SLS/MULTI/34800 | (SLS/MULTI/34800) | BGP_AS65069
 bandwidth 1024
 ip vrf forwarding ABNAMRO:2803
 ip address 200.241.80.117 255.255.255.252
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
 multilink-group 16
 no clns route-cache
 service-policy input QPI_A_1024K_31_C_0_21_14_30_2_1
 service-policy output QPO_A_1024K_31_0_21_14_30_2_1
 ip rtp header-compression iphc-format
 ip rtp compression-connections 39
 ip header-compression max-header 40
!
interface Multilink1989
 dampening 30 50 1100 200
 description ABNAMRO  | 64K | SLS/MULTI/08855 | (SLS/MULTI/08855) | BGP_AS65069
 bandwidth 64
 ip vrf forwarding ABNAMRO:2803
 ip address 189.42.91.209 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 load-interval 30
 no peer neighbor-route
 no cdp enable
 ppp multilink
 ppp multilink fragment-delay 10
 ppp multilink interleave
 multilink min-links 1 mandatory
 multilink-group 1989
 no clns route-cache
 service-policy input QPI_A_64K_29_C_0_21_11_22_13_1
 service-policy output QPO_A_64K_29_0_21_11_22_13_1
!
interface Multilink1990
 dampening 30 50 1100 200
 description BIGBEN  | 64K | ITZ/MULTI/08611 | (ITZ/MULTI/08611) | BGP_AS65216
 bandwidth 64
 ip vrf forwarding BIGBEN:2777
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
 multilink-group 1990
 no clns route-cache
 service-policy input QPI_A_64K_19_N_0_4_0_0_13_61
 service-policy output QPO_A_64K_19_0_4_0_0_13_61
!
interface Multilink1997
 dampening 30 50 1100 200
 no ip address
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 load-interval 30
 shutdown
 no cdp enable
 ppp multilink
 ppp multilink fragment-delay 10
 ppp multilink interleave
 multilink min-links 1 mandatory
 multilink-group 1997
 no clns route-cache
 service-policy input QPI_A_512K_10_N_0_13_0_0_4_72
 service-policy output QPO_A_512K_10_0_13_0_0_4_72
!
interface Multilink35524
 dampening 30 50 1100 200
 description CREDISHOP  | 256K | ACD/MULTI/35863 | (ACD/MULTI/35863) | BGP_AS64518
 bandwidth 256
 ip vrf forwarding CREDISHOP:1661
 ip address 200.241.80.221 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 load-interval 30
 no peer neighbor-route
 no cdp enable
 ppp multilink
 ppp multilink fragment-delay 10
 ppp multilink interleave
 multilink min-links 1 mandatory
 multilink-group 35524
 no clns route-cache
 service-policy input QPI_A_256K_26_N_0_52_0_0_7_14
 service-policy output QPO_A_256K_26_0_52_0_0_7_14
!
interface Multilink5393
 dampening 30 50 1100 200
 no ip address
 no ip directed-broadcast
 shutdown
 no cdp enable
 ppp multilink
 multilink-group 5393
!
interface Multilink35532
 dampening 30 50 1100 200
 description ABNAMRO  | 256K | SLS/MULTI/09052 | (SLS/MULTI/09052) | BGP_AS65069
 bandwidth 256
 ip vrf forwarding ABNAMRO:2803
 ip address 189.42.91.193 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no peer neighbor-route
 no cdp enable
 ppp multilink
 ppp multilink fragment-delay 10
 ppp multilink interleave
 multilink min-links 1 mandatory
 multilink-group 35532
 no clns route-cache
 service-policy input QPI_A_256K_31_C_0_21_13_26_7_1
 service-policy output QPO_A_256K_31_0_21_13_26_7_1
!
interface Multilink35536
 dampening 30 50 1100 200
 description MARATA  | 512K | SLS/MULTI/12667 | (SLS/MULTI/12667) | BGP_AS65366
 bandwidth 512
 ip vrf forwarding MARATA:3392
 ip address 200.249.171.29 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no peer neighbor-route
 no cdp enable
 ppp multilink
 ppp multilink fragment-delay 10
 ppp multilink interleave
 multilink min-links 1 mandatory
 multilink-group 35536
 no clns route-cache
 service-policy input QPI_A_512K_10_N_0_7_0_0_4_78
 service-policy output QPO_A_512K_10_0_7_0_0_4_78
!
interface Multilink35538
 dampening 30 50 1100 200
 description CREDISHOP  | 256K | BBL/MULTI/30454 | (BBL/MULTI/30454) | BGP_AS64518
 bandwidth 256
 ip vrf forwarding CREDISHOP:1661
 ip address 200.249.145.205 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 load-interval 30
 no peer neighbor-route
 no cdp enable
 ppp multilink
 ppp multilink fragment-delay 10
 ppp multilink interleave
 multilink min-links 1 mandatory
 multilink-group 35538
 no clns route-cache
 service-policy input QPI_A_256K_26_N_0_38_0_0_7_25
 service-policy output QPO_A_256K_26_0_38_0_0_7_25
!
interface Multilink35539
 dampening 30 50 1100 200
 description SHVGAS  | 2048K | SLS/MULTI/06434 | (SLS/MULTI/06434) | BGP_AS65106
 bandwidth 2048
 ip vrf forwarding SHV_GAS:3469
 ip address 200.253.132.121 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no peer neighbor-route
 no cdp enable
 ppp multilink
 ppp multilink fragment-delay 10
 ppp multilink interleave
 no ppp multilink fragmentation
 multilink min-links 1 mandatory
 multilink-group 35539
 no clns route-cache
 service-policy input QPI_A_2048K_7_N_0_16_29_12_1_34
 service-policy output QPO_A_2048K_7_0_16_29_12_1_34
!
interface Multilink35544
 dampening 30 50 1100 200
 description SUPERMMACIEL  | 512K | SLS/MULTI/07683 | (SLS/MULTI/07683)
 bandwidth 512
 ip vrf forwarding SUPERMMACIEL:3754
 ip address 189.43.120.185 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no peer neighbor-route
 no cdp enable
 ppp multilink
 ppp multilink fragment-delay 10
 ppp multilink interleave
 multilink min-links 1 mandatory
 multilink-group 35544
 no clns route-cache
 service-policy input QPI_A_512K_5_N_0_16_0_0_4_74
 service-policy output QPO_A_512K_5_0_16_0_0_4_74
!
interface Multilink35546
 dampening 30 50 1100 200
 description HSBCMPLS  | 2048K | SLS/MULTI/03034 | (SLS/MULTI/03034) | BGP_AS65137
 bandwidth 2048
 ip vrf forwarding HSBCMPLS:3232
 ip address 168.41.50.141 255.255.255.252
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
 multilink-group 35546
 no clns route-cache
 service-policy input QPI_A_2048K_20_C_20_28_14_11_2_4
 service-policy output QPO_A_2048K_20_20_28_14_11_2_4
 ip rtp header-compression iphc-format
 ip rtp compression-connections 50
 ip header-compression max-header 40
!
interface Multilink35565
 dampening 30 50 1100 200
 description CBE  | 512K | SLS/MULTI/23978 | (SLS/MULTI/23978) | BGP_AS64962
 bandwidth 512
 ip vrf forwarding CBE:4734
 ip address 201.73.255.49 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 load-interval 30
 no peer neighbor-route
 no cdp enable
 ppp multilink
 ppp multilink fragment-delay 10
 ppp multilink interleave
 multilink min-links 1 mandatory
 multilink-group 35565
 no clns route-cache
 service-policy input QPI_A_512K_11_N_0_30_46_0_4_8
 service-policy output QPO_A_512K_11_0_30_46_0_4_8
!
interface Multilink35566
 dampening 30 50 1100 200
 description HSBCMPLS  | 512K | SLS/MULTI/15402 | (SLS/MULTI/15402) | BGP_AS65137
 bandwidth 512
 ip vrf forwarding HSBCMPLS:3232
 ip address 168.41.20.29 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no peer neighbor-route
 no cdp enable
 ppp multilink
 ppp multilink fragment-delay 10
 ppp multilink interleave
 multilink min-links 1 mandatory
 multilink-group 35566
 no clns route-cache
 service-policy input QPI_A_512K_22_C_20_28_13_11_4_1
 service-policy output QPO_A_512K_22_20_28_13_11_4_1
!
interface Multilink35579
 dampening 30 50 1100 200
 description SERPRO  | 1024K | PHE/MULTI/40171 | (PHE/MULTI/40171) | BGP_AS65003
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
 multilink-group 35579
 no clns route-cache
 service-policy input QPI_SERPRO_1024K_V1
 service-policy output QPO_SERPRO_1024K_V1
!
interface Multilink35581
 dampening 30 50 1100 200
 description ABNAMRO  | 1024K | SLS/MULTI/28977 | (SLS/MULTI/28977)
 bandwidth 1024
 ip vrf forwarding ABNAMRO:2803
 ip address 200.249.145.25 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no peer neighbor-route
 no cdp enable
 ppp multilink
 ppp multilink fragment-delay 10
 ppp multilink interleave
 multilink min-links 1 mandatory
 multilink-group 35581
 no clns route-cache
 service-policy input QPI_1024_SANTANDER_GACC_V1
 service-policy output QPO_1024_SANTANDER_GACC_V1
 ip header-compression max-header 40
!
interface Multilink35586
 dampening 30 50 1100 200
 description CREDISHOP  | 256K | CXS/MULTI/29410 | (CXS/MULTI/29410) | BGP_AS64518
 bandwidth 256
 ip vrf forwarding CREDISHOP:1661
 ip address 200.249.169.89 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 load-interval 30
 no peer neighbor-route
 no cdp enable
 ppp multilink
 ppp multilink fragment-delay 10
 ppp multilink interleave
 multilink min-links 1 mandatory
 multilink-group 35586
 no clns route-cache
 service-policy input QPI_A_256K_26_N_0_52_0_0_7_14
 service-policy output QPO_A_256K_26_0_52_0_0_7_14
!
interface Multilink35590
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
 multilink-group 35590
 no clns route-cache
!
interface Multilink35592
 dampening 30 50 1100 200
 description PAVEL SAO LUIS  | 4096K | SLS/MULTI/40643 | (SLS/MULTI/40643)
 ip address 200.172.13.33 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no peer neighbor-route
 no cdp enable
 ppp multilink
 no ppp multilink fragmentation
 multilink min-links 1 mandatory
 multilink-group 35592
 no clns route-cache
 service-policy input QPI_BBONE_DSCP_V1
!
interface Multilink35598
 dampening 30 50 1100 200
 description DPU  | 4096K | SLS/MULTI/41171 | (SLS/MULTI/41171) | BGP_AS65281
 bandwidth 4096
 ip vrf forwarding INFOVIA_DPU:6092
 ip address 200.172.13.57 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 load-interval 30
 no peer neighbor-route
 no cdp enable
 ppp multilink
 no ppp multilink fragmentation
 multilink min-links 1 mandatory
 multilink-group 35598
 no clns route-cache
 service-policy input QPI_A_4096K_13_N_10_38_4_7_1_26
 service-policy output QPO_A_4096K_13_10_38_4_7_1_26
!
interface Multilink35620
 dampening 30 50 1100 200
 description CREFISA  | 512K | SLS/MULTI/42263 | (SLS/MULTI/42263) | BGP_AS65000
 bandwidth 512
 ip vrf forwarding CREFISA:5415
 ip address 200.172.13.81 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no peer neighbor-route
 no cdp enable
 ppp multilink
 ppp multilink fragment-delay 10
 ppp multilink interleave
 multilink min-links 1 mandatory
 multilink-group 35620
 no clns route-cache
 service-policy input QPI_A_512K_50_N_0_10_0_0_4_35
 service-policy output QPO_A_512K_50_0_10_0_0_4_35
!
interface Multilink35623
 dampening 30 50 1100 200
 description MIN JUSTICA  | 4096K | SLS/MULTI/42329 | (SLS/MULTI/42329) | BGP_AS65000
 ip vrf forwarding DPRF_NAC_REMOTO:4295
 ip address 200.172.13.89 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 shutdown
 no peer neighbor-route
 no cdp enable
 ppp multilink
 no ppp multilink fragmentation
 multilink min-links 1 mandatory
 multilink-group 35623
 no clns route-cache
 service-policy input QPI_A_4096K_14_N_15_18_10_27_1_14
 service-policy output QPO_A_4096K_14_15_18_10_27_1_14
!
interface Multilink35635
 dampening 30 50 1100 200
 description ALVORADA MOTO  | 4096K | PHE/MULTI/42739 | (PHE/MULTI/42739)
 ip address 200.241.80.245 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 load-interval 30
 no peer neighbor-route
 no cdp enable
 ppp multilink
 no ppp multilink fragmentation
 multilink min-links 1 mandatory
 multilink-group 35635
 no clns route-cache
 service-policy input QPI_BBONE_DSCP_V1
!
interface Multilink35645
 dampening 30 50 1100 200
 description INFRAERO  | 1024K | ITZ/MULTI/25346 | (ITZ/MULTI/25346) | BGP_AS65000
 bandwidth 1024
 ip vrf forwarding INFRAERO:4781
 ip address 10.10.34.1 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no peer neighbor-route
 no cdp enable
 ppp multilink
 ppp multilink fragment-delay 10
 ppp multilink interleave
 multilink min-links 1 mandatory
 multilink-group 35645
 no clns route-cache
 service-policy input QPI_A_1024K_22_N_22_11_30_6_3_5
 service-policy output QPO_A_1024K_22_22_11_30_6_3_5
!
interface Multilink35646
 dampening 30 50 1100 200
 description SADIA  | 1024K | SJE/MULTI/44088 | (SJE/MULTI/44088)
 bandwidth 1024
 ip vrf forwarding BRF_BRASIL_FOODS:5177
 ip address 200.172.13.125 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no peer neighbor-route
 no cdp enable
 ppp multilink
 ppp multilink fragment-delay 10
 ppp multilink interleave
 multilink min-links 1 mandatory
 multilink-group 35646
 no clns route-cache
 service-policy input QPI_A_1024K_7_N_0_45_27_0_2_18
 service-policy output QPO_A_1024K_7_0_45_27_0_2_18
!
interface Multilink35705
 dampening 30 50 1100 200
 description SUPERMMACIEL  | 512K | SLS/MULTI/07942 | (SLS/MULTI/07942)
 bandwidth 512
 ip vrf forwarding SUPERMMACIEL:3754
 ip address 189.52.190.37 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no peer neighbor-route
 no cdp enable
 ppp multilink
 ppp multilink fragment-delay 10
 ppp multilink interleave
 multilink min-links 1 mandatory
 multilink-group 35705
 no clns route-cache
 service-policy input QPI_A_512K_10_N_0_39_0_0_4_46
 service-policy output QPO_A_512K_10_0_39_0_0_4_46
!
interface Multilink45324
 dampening 30 50 1100 200
 description MPF  | 4096K | ITZ/MULTI/47396 | (ITZ/MULTI/47396)
 ip vrf forwarding MPT_NOVA:6115
 ip address 192.168.41.205 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 ip pim sparse-mode
 no peer neighbor-route
 no cdp enable
 ppp multilink
 no ppp multilink fragmentation
 multilink min-links 1 mandatory
 multilink-group 45324
 no clns route-cache
 service-policy input QPI_A_4096K_15_N_30_30_0_0_1_22
 service-policy output QPO_A_4096K_15_30_30_0_0_1_22
!
interface Multilink45325
 dampening 30 50 1100 200
 description MPT_NOVA  | 8192K | SLS/MULTI/41775 | (SLS/MULTI/41775) | BGP_AS65002
 ip vrf forwarding MPT_NOVA:6115
 ip address 192.168.41.21 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 ip pim sparse-mode
 load-interval 30
 no peer neighbor-route
 no cdp enable
 ppp multilink
 no ppp multilink fragmentation
 multilink min-links 1 mandatory
 multilink-group 45325
 no clns route-cache
 service-policy input QPI_A_8192K_15_N_30_30_0_0_1_22
 service-policy output QPO_A_8192K_15_30_30_0_0_1_22
!
interface Multilink45332
 dampening 30 50 1100 200
 description BRASPRESS  | 1024K | SLS/MULTI/24755 | (SLS/MULTI/24755)
 ip vrf forwarding BRASPRESS:4733
 ip address 187.28.122.53 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 shutdown
 no peer neighbor-route
 no cdp enable
 ppp multilink
 ppp multilink fragment-delay 10
 ppp multilink interleave
 multilink min-links 1 mandatory
 multilink-group 45332
 no clns route-cache
 service-policy input QPI_BBONE_EXP_V1
!
interface Multilink45336
 dampening 30 50 1100 200
 description SERPRO  | 1024K | PDU/MULTI/40165 | (PDU/MULTI/40165) | BGP_AS65003
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
 multilink-group 45336
 no clns route-cache
 service-policy input QPI_SERPRO_1024K_V1
 service-policy output QPO_SERPRO_1024K_V1
!
interface Multilink45337
 dampening 30 50 1100 200
 description CASASSAMPAIO  | 4096K | CDO/MULTI/49598 | (CDO/MULTI/49598)
 ip address 187.28.240.21 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no peer neighbor-route
 no cdp enable
 ppp multilink
 no ppp multilink fragmentation
 multilink min-links 1 mandatory
 multilink-group 45337
 no clns route-cache
 service-policy input QPI_BBONE_DSCP_V1
!
interface Multilink45357
 dampening 30 50 1100 200
 description DUVEL  | 4096K | BBL/MULTI/51836 | (BBL/MULTI/51836)
 ip address 200.253.132.141 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no peer neighbor-route
 no cdp enable
 ppp multilink
 no ppp multilink fragmentation
 multilink min-links 1 mandatory
 multilink-group 45357
 no clns route-cache
 service-policy input QPI_BBONE_DSCP_V1
!
interface Multilink53471
 dampening 30 50 1100 200
 description IMIFARMA  | 512K | SLS/MULTI/55005 | (SLS/MULTI/55005) | BGP_AS65000
 bandwidth 512
 ip vrf forwarding IMIFARMA_EXTRANET:155458
 ip address 201.30.37.221 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no peer neighbor-route
 no cdp enable
 ppp multilink
 ppp multilink fragment-delay 10
 ppp multilink interleave
 multilink min-links 1 mandatory
 multilink-group 53471
 no clns route-cache
 service-policy input QPI_A_512K_5_N_0_30_16_4_4_40
 service-policy output QPO_A_512K_5_0_30_16_4_4_40
!
interface Multilink53474
 dampening 30 50 1100 200
 description IMIFARMA  | 512K | SLS/MULTI/55121 | (SLS/MULTI/55121) | BGP_AS65000
 bandwidth 512
 ip vrf forwarding IMIFARMA_EXTRANET:155458
 ip address 200.179.212.1 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no peer neighbor-route
 no cdp enable
 ppp multilink
 ppp multilink fragment-delay 10
 ppp multilink interleave
 multilink min-links 1 mandatory
 multilink-group 53474
 no clns route-cache
 service-policy input QPI_A_512K_5_N_0_30_16_0_4_41
 service-policy output QPO_A_512K_5_0_30_16_0_4_41
!
interface Multilink53477
 dampening 30 50 1100 200
 description IMIFARMA  | 512K | SIS/MULTI/55287 | (SIS/MULTI/55287) | BGP_AS65000
 bandwidth 512
 ip vrf forwarding IMIFARMA_EXTRANET:155458
 ip address 200.179.212.9 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no peer neighbor-route
 no cdp enable
 ppp multilink
 ppp multilink fragment-delay 10
 ppp multilink interleave
 multilink min-links 1 mandatory
 multilink-group 53477
 no clns route-cache
 service-policy input QPI_A_512K_5_N_0_30_16_4_4_40
 service-policy output QPO_A_512K_5_0_30_16_4_4_40
!
interface Multilink53925
 dampening 30 50 1100 200
 description CREFISA  | 512K | ACD/MULTI/55772 | (ACD/MULTI/55772) | BGP_AS65000
 bandwidth 512
 ip vrf forwarding CREFISA:5415
 ip address 200.179.212.29 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no peer neighbor-route
 no cdp enable
 ppp multilink
 ppp multilink fragment-delay 10
 ppp multilink interleave
 multilink min-links 1 mandatory
 multilink-group 53925
 no clns route-cache
 service-policy input QPI_A_512K_50_N_0_10_0_0_4_35
 service-policy output QPO_A_512K_50_0_10_0_0_4_35
!
interface Multilink53926
 dampening 30 50 1100 200
 description CREFISA  | 512K | SLS/MULTI/55837 | (SLS/MULTI/55837) | BGP_AS65000
 bandwidth 512
 ip vrf forwarding CREFISA:5415
 ip address 200.179.212.37 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 load-interval 30
 no peer neighbor-route
 no cdp enable
 ppp multilink
 ppp multilink fragment-delay 10
 ppp multilink interleave
 multilink min-links 1 mandatory
 multilink-group 53926
 no clns route-cache
 service-policy input QPI_A_512K_50_N_0_10_0_0_4_35
 service-policy output QPO_A_512K_50_0_10_0_0_4_35
!
interface Multilink53927
 dampening 30 50 1100 200
 description SUPERMMACIEL  | 512K | SLS/MULTI/55910 | (SLS/MULTI/55910) | BGP_AS65216
 bandwidth 512
 ip vrf forwarding SUPERMMACIEL:3754
 ip address 200.172.10.65 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no peer neighbor-route
 no cdp enable
 ppp multilink
 ppp multilink fragment-delay 10
 ppp multilink interleave
 multilink min-links 1 mandatory
 multilink-group 53927
 no clns route-cache
 service-policy input QPI_A_512K_5_N_0_0_13_0_4_77
 service-policy output QPO_A_512K_5_0_0_13_0_4_77
!
interface Multilink53931
 dampening 30 50 1100 200
 description IMIFARMA  | 512K | PHE/MULTI/57732 | (PHE/MULTI/57732)
 bandwidth 512
 ip vrf forwarding IMIFARMA_EXTRANET:155458
 ip address 200.172.12.197 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no peer neighbor-route
 no cdp enable
 ppp multilink
 ppp multilink fragment-delay 10
 ppp multilink interleave
 multilink min-links 1 mandatory
 multilink-group 53931
 no clns route-cache
 service-policy input QPI_A_512K_5_N_0_30_16_4_4_40
 service-policy output QPO_A_512K_5_0_30_16_4_4_40
!
interface Multilink53932
 dampening 30 50 1100 200
 description IMIFARMA  | 512K | CXS/MULTI/57832 | (CXS/MULTI/57832) | BGP_AS65000
 bandwidth 512
 ip vrf forwarding IMIFARMA_EXTRANET:155458
 ip address 200.172.12.101 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no peer neighbor-route
 no cdp enable
 ppp multilink
 ppp multilink fragment-delay 10
 ppp multilink interleave
 multilink min-links 1 mandatory
 multilink-group 53932
 no clns route-cache
 service-policy input QPI_A_512K_5_N_0_30_16_4_4_40
 service-policy output QPO_A_512K_5_0_30_16_4_4_40
!
interface Multilink53933
 dampening 30 50 1100 200
 description IMIFARMA  | 512K | BBL/MULTI/57883 | (BBL/MULTI/57883) | BGP_AS65000
 bandwidth 512
 ip vrf forwarding IMIFARMA_EXTRANET:155458
 ip address 200.241.80.133 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no peer neighbor-route
 no cdp enable
 ppp multilink
 ppp multilink fragment-delay 10
 ppp multilink interleave
 multilink min-links 1 mandatory
 multilink-group 53933
 no clns route-cache
 service-policy input QPI_A_512K_5_N_0_30_16_4_4_40
 service-policy output QPO_A_512K_5_0_30_16_4_4_40
!
interface Multilink53936
 dampening 30 50 1100 200
 description BCOAM  | 1024K | ITZ/MULTI/24906 | (ITZ/MULTI/24906) | BGP_AS65330
 bandwidth 1024
 ip vrf forwarding BCOAM:4783
 ip address 200.252.158.113 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no peer neighbor-route
 no cdp enable
 ppp multilink
 ppp multilink fragment-delay 10
 ppp multilink interleave
 multilink min-links 1 mandatory
 multilink-group 53936
 no clns route-cache
 service-policy input QPI_A_1024K_11_N_0_50_13_13_2_10
 service-policy output QPO_A_1024K_11_0_50_13_13_2_10
!
interface Multilink53937
 dampening 30 50 1100 200
 description IMIFARMA  | 512K | ITZ/MULTI/58644 | (ITZ/MULTI/58644) | BGP_AS65000
 bandwidth 512
 ip vrf forwarding IMIFARMA_EXTRANET:155458
 ip address 200.172.13.89 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no peer neighbor-route
 no cdp enable
 ppp multilink
 ppp multilink fragment-delay 10
 ppp multilink interleave
 multilink min-links 1 mandatory
 multilink-group 53937
 no clns route-cache
 service-policy input QPI_A_512K_5_N_0_30_16_4_4_40
 service-policy output QPO_A_512K_5_0_30_16_4_4_40
!
interface Multilink53941
 dampening 30 50 1100 200
 description IMIFARMA  | 512K | SLS/MULTI/55156 | (SLS/MULTI/55156) | BGP_AS65000
 bandwidth 512
 ip vrf forwarding IMIFARMA_EXTRANET:155458
 ip address 187.28.122.245 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no peer neighbor-route
 no cdp enable
 ppp multilink
 ppp multilink fragment-delay 10
 ppp multilink interleave
 multilink min-links 1 mandatory
 multilink-group 53941
 no clns route-cache
 service-policy input QPI_A_512K_5_N_0_30_16_4_4_40
 service-policy output QPO_A_512K_5_0_30_16_4_4_40
!
interface Multilink53942
 description ALVO  | 1024K | ACD/MULTI/12902 | (ACD/MULTI/12902) | BGP_AS65357
 bandwidth 1024
 ip vrf forwarding ALVO:3946
 ip address 189.53.11.113 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no peer neighbor-route
 no cdp enable
 ppp multilink
 ppp multilink fragment-delay 10
 ppp multilink interleave
 no ppp multilink fragmentation
 multilink min-links 1 mandatory
 multilink-group 53942
 no clns route-cache
 service-policy input QPI_A_1024K_0_N_0_47_0_0_2_49
 service-policy output QPO_A_1024K_0_0_47_0_0_2_49
!
interface Multilink53943
 description BCOAM  | 512K | CRN/MULTI/25168 | (CRN/MULTI/25168)
 bandwidth 512
 ip vrf forwarding BCOAM:4783
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
 multilink-group 53943
 no clns route-cache
 service-policy input QPI_512K_11_C_0_34_25_17_4_8
 service-policy output QPO_512K_11_0_34_25_17_4_8
 ip header-compression max-header 40
!
interface Multilink53944
 description IMIFARMA  | 512K | SLS/MULTI/56505 | (SLS/MULTI/56505) | BGP_AS65000
 bandwidth 512
 ip vrf forwarding IMIFARMA_EXTRANET:155458
 ip address 200.179.211.165 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no peer neighbor-route
 no cdp enable
 ppp multilink
 ppp multilink fragment-delay 10
 ppp multilink interleave
 multilink min-links 1 mandatory
 multilink-group 53944
 no clns route-cache
 service-policy input QPI_A_512K_5_N_0_30_16_4_4_40
 service-policy output QPO_A_512K_5_0_30_16_4_4_40
!
interface Multilink53945
 description PAGUEMENOS  | 256K | SLS/MULTI/32390 | (SLS/MULTI/32390) | BGP_AS65338
 bandwidth 256
 ip vrf forwarding PAGUEMENOS:3822
 ip address 189.43.120.233 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no peer neighbor-route
 no cdp enable
 ppp multilink
 ppp multilink fragment-delay 10
 ppp multilink interleave
 multilink min-links 1 mandatory
 multilink-group 53945
 no clns route-cache
 service-policy input QPI_A_256K_19_N_0_29_0_0_7_44
 service-policy output QPO_A_256K_19_0_29_0_0_7_44
!
interface Multilink53946
 description ABNAMRO  | 512K | SLS/MULTI/02492 | (SLS/MULTI/02492) | BGP_AS65069
 bandwidth 512
 ip vrf forwarding ABNAMRO:2803
 ip address 189.42.63.157 255.255.255.252
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
 multilink-group 53946
 no clns route-cache
 service-policy input QPI_A_512K_31_C_0_21_14_28_4_1
 service-policy output QPO_A_512K_31_0_21_14_28_4_1
 ip rtp header-compression iphc-format
 ip rtp compression-connections 20
 ip header-compression max-header 40
!
interface Multilink53947
 description IMIFARMA  | 512K | SLS/MULTI/55000 | (SLS/MULTI/55000) | BGP_AS65000
 bandwidth 512
 ip vrf forwarding IMIFARMA_EXTRANET:155458
 ip address 200.179.211.61 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no peer neighbor-route
 no cdp enable
 ppp multilink
 ppp multilink fragment-delay 10
 ppp multilink interleave
 multilink min-links 1 mandatory
 multilink-group 53947
 no clns route-cache
 service-policy input QPI_A_512K_5_N_0_30_16_0_4_41
 service-policy output QPO_A_512K_5_0_30_16_0_4_41
!
interface Multilink53948
 description SERMA  | 512K | BBL/MULTI/61360 | (BBL/MULTI/61360) | BGP_AS65188
 ip vrf forwarding IMIFARMA_EXTRANET:155458
 ip address 201.45.220.37 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no peer neighbor-route
 no cdp enable
 ppp multilink
 ppp multilink fragment-delay 10
 ppp multilink interleave
 multilink min-links 1 mandatory
 multilink-group 53948
 no clns route-cache
 service-policy input QPI_512K_5_N_0_30_16_4_4_40
 service-policy output QPO_512K_5_0_30_16_4_4_40
!
interface Null0
 no ip unreachables
!
interface Port-channel1
 description Ligacao SW01.SLS | 2000M | SLS/ETHCH/013 | (GigabitEthernet 6/0/0 , 6/0/1 , 6/0/2 do gacc03.sls <--> portas 1/7,1/8,1/9 do sw01.sls)
 mtu 9180
 bandwidth 3000000
 ip address 200.244.63.79 255.255.255.224
 no ip redirects
 no ip directed-broadcast
 no ip proxy-arp
 ip pim sparse-mode
 ip ospf cost 10
 ip ospf hello-interval 1
 load-interval 30
 mpls label protocol ldp
 tag-switching ip
 channel-group minimum active 1
 no channel-group bandwidth control-propagation
 hold-queue 4000 in
!
interface Port-channel2
 description Ligacao SW02.SLS | 3000M | SLS/ETHCH/014 | (GigabitEthernet 7/0/0,7/0/1,7/0/2 do gacc03.sls <--> portas 1/7,1/8,1/9 do sw02.sls)
 mtu 9180
 bandwidth 3000000
 ip address 200.244.63.111 255.255.255.224
 no ip redirects
 no ip directed-broadcast
 no ip proxy-arp
 ip pim sparse-mode
 ip ospf cost 10
 ip ospf hello-interval 1
 load-interval 30
 mpls label protocol ldp
 tag-switching ip
 channel-group minimum active 1
 no channel-group bandwidth control-propagation
 hold-queue 4000 in
!
interface GigabitEthernet0/0/0
 description Link NGN-VipLineIP | SLS US IT SLS US VLI1G 002 | swvli01.sls porta Gi1/46 | OTS 6273/2010
 bandwidth 1000000
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 load-interval 30
 keepalive 1
 no negotiation auto
 no flowcontrol bidirectional
 no cdp enable
 no clns route-cache
!
interface GigabitEthernet0/0/0.9
 description VIPLINEIP EoMPLS To RJO | 1000M | VLAN 200
 encapsulation dot1Q 9
 no ip directed-broadcast
 shutdown
 xconnect 200.244.41.100 22 encapsulation mpls
!
interface GigabitEthernet0/0/0.12
 description Link | 1000M | VLAN VIPLINEIP 12
 encapsulation dot1Q 12
 ip vrf forwarding NGN-VIPLINEIP:2628
 ip address 10.254.254.169 255.255.255.252
 no ip directed-broadcast
 no cdp enable
 service-policy input MARCA-VIPLINEIP
!
interface GigabitEthernet0/0/0.13
 description Link | 1000M | VLAN GERENCIA-TAG 13
 encapsulation dot1Q 13
 ip vrf forwarding NGN-GER:1416
 ip address 10.253.8.33 255.255.255.252
 no ip directed-broadcast
 no cdp enable
 service-policy input MARCA-GER
!
interface GigabitEthernet0/0/0.14
 description Link | 1000M | VLAN VOZ 14
 encapsulation dot1Q 14
 ip vrf forwarding NGN-VOZ:1417
 ip address 10.255.21.89 255.255.255.252
 no ip directed-broadcast
 no cdp enable
 service-policy input MARCA-VOZ
!
interface GigabitEthernet0/0/0.116
 no ip directed-broadcast
 no cdp enable
!
interface GigabitEthernet0/0/1
 description LIgacao REDBACK SLS | 1G |  SLS US IT SLS US WM 1G 003 | WMRB01.SLS | Porta 3/1 | OTS 22606/2010
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
 ip address 172.16.0.81 255.255.255.252
 no ip directed-broadcast
 no cdp enable
 service-policy input MARCA-WIMAX
!
interface GigabitEthernet0/0/1.3
 description SUBINTERFACE DE GERENCIA
 encapsulation dot1Q 3
 ip vrf forwarding NGN-GER:1416
 ip address 10.253.2.177 255.255.255.252
 no ip directed-broadcast
 no cdp enable
 service-policy input MARCA-GER
!
interface GigabitEthernet0/0/1.4
 description SUBINTERFACE DE DADOS
 encapsulation dot1Q 4
 ip address 200.167.148.1 255.255.255.252
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
 no ip address
 no ip directed-broadcast
 no negotiation auto
 no flowcontrol bidirectional
 no cdp enable
!
interface GigabitEthernet0/0/4
 description LINK ETH | 1000M DATACOM | SLSUSDM/SLSUSIT/1G/001 | DM3000-SLSUS-DI01-PA28 | XEQUE-MATE
 no ip address
 no ip directed-broadcast
 load-interval 30
 no negotiation auto
 no flowcontrol bidirectional
!
interface GigabitEthernet0/0/4.101
 description EBC  | 16000K | SLS/IP/05787 | (SLS/IP/05787)
 bandwidth 16000
 encapsulation dot1Q 101
 ip vrf forwarding EBC_MIDIA:155361
 ip address 200.179.212.105 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_A_16000K_0_19_0_0_0_1_78
 service-policy output QDO_A_16000K_0_19_0_0_0_1_78
!
interface GigabitEthernet0/0/4.103
 description PNEUACO  | 10M | SLS/IP/04798 | (SLS/IP/04798)
 bandwidth 10000
 encapsulation dot1Q 103
 ip address 200.172.10.25 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_10000_V1
 service-policy output QPO_BBONE_10000_V1
!
interface GigabitEthernet0/0/4.105
 description EBC  | 6000K | SLS/IP/05670 | (SLS/IP/05670) | BGP_AS65000
 bandwidth 6000
 encapsulation dot1Q 105
 ip vrf forwarding EBC_MPLS1:6806
 ip address 189.23.73.5 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_N_6000_V1
 service-policy output QPO_BBONE_6000_V1
!
interface GigabitEthernet0/0/4.106
 description EBM  | 10M | BBL/IP/00215 | (BBL/IP/00215)
 bandwidth 10000
 encapsulation dot1Q 106
 ip address 187.29.255.249 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 shutdown
 no cdp enable
 service-policy input QPI_BBONE_S_10000_V1
 service-policy output QPO_BBONE_10000_V1
!
interface GigabitEthernet0/0/4.108
 description GER_JDSU  | 2048K | SLS/IP/05808 | (SLS/IP/05808) | BGP_AS65000
 bandwidth 2048
 encapsulation dot1Q 108
 ip vrf forwarding GER_JDSU:6847
 ip address 187.29.255.13 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_N_2048_V1
 service-policy output QPO_BBONE_2048_V1
!
interface GigabitEthernet0/0/4.110
 description RADIO E TV UNIAO  | 10M | SLS/IP/05449 | (SLS/IP/05449)
 bandwidth 10000
 encapsulation dot1Q 110
 ip address 200.172.12.133 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_10000_V1
 service-policy output QPO_BBONE_10000_V1
!
interface GigabitEthernet0/0/4.111
 description M M MARINHO  | 10M | SLS/IP/04820 | (SLS/IP/04820)
 bandwidth 10000
 encapsulation dot1Q 111
 ip address 200.172.10.69 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_10000_V1
 service-policy output QPO_BBONE_10000_V1
!
interface GigabitEthernet0/0/4.112
 description RADIO RIBAMAR  | 10M | SLS/IP/04851 | (SLS/IP/04851)
 bandwidth 10000
 encapsulation dot1Q 112
 ip address 200.172.10.201 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_10000_V1
 service-policy output QPO_BBONE_10000_V1
!
interface GigabitEthernet0/0/4.113
 description IMIFARMA  | 6000K | SLS/IP/05641 | (SLS/IP/05641) | BGP_AS65000
 bandwidth 6000
 encapsulation dot1Q 113
 ip vrf forwarding IMIFARMA_EXTRANET:155458
 ip address 200.172.10.245 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_A_6000K_4_0_31_16_4_2_42
 service-policy output QDO_A_6000K_4_0_31_16_4_2_42
!
interface GigabitEthernet0/0/4.115
 description INSTITUTO DESEN EDUC MARANHAO  | 10M | SLS/IP/04831 | (SLS/IP/04831) | BLK-SAIP-APEDIDO/2018038-1447/POR-RPA01
 bandwidth 10000
 encapsulation dot1Q 115
 no ip directed-broadcast
 no ip proxy-arp
 shutdown
 no cdp enable
 service-policy input QPI_BBONE_S_10000_V1
 service-policy output QPO_BBONE_10000_V1
!
interface GigabitEthernet0/0/4.117
 description CEUMA  | 20M | SLS/IP/04766 | (SLS/IP/04766) | BGP_AS65010
 bandwidth 20000
 encapsulation dot1Q 117
 ip vrf forwarding UNIEURO:5509
 ip address 187.28.240.253 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_A_20000K_11_2_0_0_0_2_84
 service-policy output QDO_A_20000K_11_2_0_0_0_2_84
!
interface GigabitEthernet0/0/4.118
 description BT_CBB  | 6000K | SLS/IP/06231 | (SLS/IP/06231) | BGP_AS64860
 bandwidth 6000
 encapsulation dot1Q 118
 ip vrf forwarding BT_CBB:1851
 ip address 200.241.80.9 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_A_6000K_5_43_35_0_0_2_14
 service-policy output QDO_A_6000K_5_43_35_0_0_2_14
!
interface GigabitEthernet0/0/4.120
 description CPAD  | 8000K | SLS/IP/05008 | (SLS/IP/05008)
 bandwidth 8000
 encapsulation dot1Q 120
 ip vrf forwarding CPAD:5928
 ip address 200.172.13.17 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_8000K_2_5_72_0_0_1_18
 service-policy output QDO_8000K_2_5_72_0_0_1_18
!
interface GigabitEthernet0/0/4.122
 description SAGA_BRASIL  | 10M | SLS/IP/06007 | (SLS/IP/06007) | BGP_AS65000
 bandwidth 10000
 encapsulation dot1Q 122
 ip vrf forwarding SAGA_BRASIL:7340
 ip address 200.172.13.77 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_N_10000_V1
 service-policy output QPO_BBONE_10000_V1
!
interface GigabitEthernet0/0/4.203
 description CONDBELLAGIO  | 10M | SLS/IP/04879 | (SLS/IP/04879) | BLK-SAIP-APEDIDO/20170321-1640/POR-DENISVM
 bandwidth 10000
 encapsulation dot1Q 203
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 shutdown
 no cdp enable
 service-policy input QPI_BBONE_S_10000_V1
 service-policy output QPO_BBONE_10000_V1
!
interface GigabitEthernet0/0/4.204
 description IURD  | 10M | SLS/IP/04872 | (SLS/IP/04872)
 bandwidth 10000
 encapsulation dot1Q 204
 ip address 200.172.10.165 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_10000_V1
 service-policy output QPO_BBONE_10000_V1
!
interface GigabitEthernet0/0/4.208
 description SAINTLOUIS  | 10M | SLS/IP/04861 | (SLS/IP/04861)
 bandwidth 10000
 encapsulation dot1Q 208
 ip address 201.45.138.73 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_10000_V1
 service-policy output QPO_BBONE_10000_V1
!
interface GigabitEthernet0/0/4.209
 description BRASILTECIDOS  | 10M | SLS/IP/04883 | (SLS/IP/04883)
 bandwidth 10000
 encapsulation dot1Q 209
 ip address 200.253.152.65 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_10000_V1
 service-policy output QPO_BBONE_10000_V1
!
interface GigabitEthernet0/0/4.210
 description NOBLE BRASIL  | 10M | SLS/IP/04846 | (SLS/IP/04846)
 bandwidth 10000
 encapsulation dot1Q 210
 ip address 200.172.10.177 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_10000_V1
 service-policy output QPO_BBONE_10000_V1
!
interface GigabitEthernet0/0/4.214
 description NUMBERONE  | 10M | SLS/IP/04848 | (SLS/IP/04848)
 bandwidth 10000
 encapsulation dot1Q 214
 ip address 201.73.255.153 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_10000_V1
 service-policy output QPO_BBONE_10000_V1
!
interface GigabitEthernet0/0/4.219
 description BRASCOPPER  | 10M | SLS/IP/04862 | (SLS/IP/04862)
 bandwidth 10000
 encapsulation dot1Q 219
 ip address 200.172.10.213 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_10000_V1
 service-policy output QPO_BBONE_10000_V1
!
interface GigabitEthernet0/0/4.223
 description ASSISTHOTEL  | 10M | SLS/IP/04884 | (SLS/IP/04884)
 bandwidth 10000
 encapsulation dot1Q 223
 ip address 189.23.73.145 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_10000_V1
 service-policy output QPO_BBONE_10000_V1
!
interface GigabitEthernet0/0/4.224
 description DPF_MPLS  | 6000K | SLS/IP/05557 | (SLS/IP/05557)
 bandwidth 6000
 encapsulation dot1Q 224
 ip vrf forwarding DPF_MPLS:6606
 ip address 200.172.10.249 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_A_6000K_11_31_36_0_0_1_20
 service-policy output QDO_A_6000K_11_31_36_0_0_1_20
!
interface GigabitEthernet0/0/4.226
 description BAMAQ SA BANDEIRANTES  | 10M | SLS/IP/04854 | (SLS/IP/04854)
 bandwidth 10000
 encapsulation dot1Q 226
 ip address 200.172.10.225 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_10000_V1
 service-policy output QPO_BBONE_10000_V1
!
interface GigabitEthernet0/0/4.303
 description SOLARE ADMINISTRACAO  | 10M | SLS/IP/04885 | (SLS/IP/04885)
 bandwidth 10000
 encapsulation dot1Q 303
 ip address 200.241.80.93 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no cdp enable
 service-policy input QPI_BBONE_S_10000_V1
 service-policy output QPO_BBONE_10000_V1
!
interface GigabitEthernet0/0/4.304
 description AMERICANFLAT  | 10M | SLS/IP/04886 | (SLS/IP/04886)
 bandwidth 10000
 encapsulation dot1Q 304
 ip address 200.241.80.77 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_10000_V1
 service-policy output QPO_BBONE_10000_V1
!
interface GigabitEthernet0/0/4.307
 description FUNDACAO DE APOIO  | 10M | SLS/IP/04834 | (SLS/IP/04834)
 bandwidth 10000
 encapsulation dot1Q 307
 ip address 200.172.10.113 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_10000_V1
 service-policy output QPO_BBONE_10000_V1
!
interface GigabitEthernet0/0/4.311
 description FUNASA  | 8000K | SLS/IP/05018 | (SLS/IP/05018) | BGP_AS65305
 bandwidth 8000
 encapsulation dot1Q 311
 ip vrf forwarding FUNASA:3094
 ip address 200.172.10.9 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 ip pim sparse-mode
 no cdp enable
 service-policy input QPI_BBONE_N_8000_V1
 service-policy output QPO_BBONE_8000_V1
!
interface GigabitEthernet0/0/4.314
 description CVRD  | 10M | SLS/IP/05105 | (SLS/IP/05105)
 bandwidth 10000
 encapsulation dot1Q 314
 ip address 200.172.13.93 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_10000_V1
 service-policy output QPO_BBONE_10000_V1
!
interface GigabitEthernet0/0/4.315
 description SEBRAEMA  | 10M | SLS/IP/01773 | (SLS/IP/01773) | BGP_AS64617
 bandwidth 10000
 encapsulation dot1Q 315
 ip vrf forwarding SEBRAEMA:4302
 ip address 189.53.246.89 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_A_10000K_7_0_1_0_0_1_89
 service-policy output QDO_A_10000K_7_0_1_0_0_1_89
!
interface GigabitEthernet0/0/4.316
 description SERPRO  | 6000K | ITZ/IP/01163 | (ITZ/IP/01163) | BGP_AS65003
 bandwidth 6000
 encapsulation dot1Q 316
 ip vrf forwarding SERPRO_SLS_RFB_11:5911
 ip address 10.53.2.173 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 ip pim sparse-mode
 no cdp enable
 service-policy input QDI_SERPRO_6000K_V1
 service-policy output QDO_SERPRO_6000K_V1
!
interface GigabitEthernet0/0/4.317
 description WINDOWS  | 34000K | SLS/IP/04804 | (SLS/IP/04804)
 bandwidth 34000
 encapsulation dot1Q 317
 ip address 200.252.158.129 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_34000_V1
 service-policy output QPO_BBONE_34000_V1
!
interface GigabitEthernet0/0/4.319
 description SPE SA CAVALCANTE  | 34000K | SLS/IP/04877 | (SLS/IP/04877)
 bandwidth 34000
 encapsulation dot1Q 319
 ip address 189.53.246.157 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_34000_V1
 service-policy output QPO_BBONE_34000_V1
!
interface GigabitEthernet0/0/4.323
 description DUCTOR  | 20M | SLS/IP/03625 | (SLS/IP/03625)
 bandwidth 20000
 encapsulation dot1Q 323
 ip address 200.252.158.181 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_20000_V1
 service-policy output QPO_BBONE_20000_V1
!
interface GigabitEthernet0/0/4.403
 description TVGLOBO  | 10M | SLS/IP/05328 | (SLS/IP/05328)
 bandwidth 10000
 encapsulation dot1Q 403
 ip vrf forwarding TVGLOBO_NOVA:2610
 ip address 200.249.145.1 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_A_10000K_4_0_8_0_84_2_1
 service-policy output QDO_A_10000K_4_0_8_0_84_2_1
!
interface GigabitEthernet0/0/4.405
 description ARMATEUS  | 100M | SLS/IP/00451 | (SLS/IP/00451)
 bandwidth 100000
 encapsulation dot1Q 405
 ip vrf forwarding ARMATEUS:3394
 ip address 189.43.197.9 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_A_100000K_4_0_0_0_0_1_93
 service-policy output QDO_A_100000K_4_0_0_0_0_1_93
!
interface GigabitEthernet0/0/4.406
 description CMM  | 20M | SLS/IP/05450 | (SLS/IP/05450)
 bandwidth 20000
 encapsulation dot1Q 406
 ip address 200.172.12.137 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_20000_V1
 service-policy output QPO_BBONE_20000_V1
!
interface GigabitEthernet0/0/4.407
 description BRMALLS  | 20M | SLS/IP/05448 | (SLS/IP/05448)
 bandwidth 20000
 encapsulation dot1Q 407
 ip address 200.172.12.141 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_20000_V1
 service-policy output QPO_BBONE_20000_V1
!
interface GigabitEthernet0/0/4.408
 description FAMA  | 20M | ITZ/IP/01234 | (ITZ/IP/01234)
 bandwidth 20000
 encapsulation dot1Q 408
 ip address 200.172.12.157 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_20000_V1
 service-policy output QPO_BBONE_20000_V1
!
interface GigabitEthernet0/0/4.411
 description SERPRO  | 4096K | SLS/IP/04932 | (SLS/IP/04932) | BGP_AS65003
 bandwidth 4096
 encapsulation dot1Q 411
 ip vrf forwarding SERPRO_SLS_RFB_01:5848
 ip address 10.53.2.169 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 ip pim sparse-mode
 no cdp enable
 service-policy input QDI_SERPRO_4096K_V1
 service-policy output QDO_SERPRO_4096K_V1
!
interface GigabitEthernet0/0/4.413
 description EME  | 10M | SLS/IP/05079 | (SLS/IP/05079)
 bandwidth 10000
 encapsulation dot1Q 413
 ip address 200.241.80.89 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_10000_V1
 service-policy output QPO_BBONE_10000_V1
!
interface GigabitEthernet0/0/4.421
 description HERINGER  | 10M | ITZ/IP/01262 | (ITZ/IP/01262) |
 bandwidth 10000
 encapsulation dot1Q 421
 ip address 201.30.37.173 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_10000_V1
 service-policy output QPO_BBONE_10000_V1
!
interface FastEthernet0/1/0
 no ip address
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 load-interval 30
 shutdown
 no negotiation auto
 no flowcontrol bidirectional
 no cdp enable
 service-policy input QPI_BBONE_S_100000_V1
 service-policy output QPO_BBONE_100000_V1
!
interface FastEthernet0/1/1
 description RESERVADO PARA ADM100M | ROGERIO | 521-3113 | 12/03/2014
 no ip address
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 shutdown
 negotiation auto
 no cdp enable
!
interface FastEthernet0/1/2
 description RESERVADO PARA ADM100M | ROGERIO | 521-3113 | 12/03/2014
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 shutdown
 negotiation auto
 no cdp enable
!
interface FastEthernet0/1/3
 description RESERVADO PARA ADM100M | ROGERIO | 521-3113 | 18/10/2011
 no ip address
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 shutdown
 negotiation auto
 no cdp enable
!
interface FastEthernet0/1/4
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
interface FastEthernet0/1/5
 description RESERVADO PARA ADM100M | ROGERIO | 521-3113 | 07/11/2011
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 load-interval 30
 shutdown
 negotiation auto
 no cdp enable
!
interface FastEthernet0/1/6
 description RESERVADO PARA ADM100M | ROGERIO | 521-3113 | 14/10/2011
 no ip address
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 load-interval 30
 shutdown
 negotiation auto
 no cdp enable
!
interface FastEthernet0/1/7
 description RESERVADO PARA ADM100M | ROGERIO | 521-3113 | 29/07/2013
 no ip address
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 load-interval 30
 shutdown
 negotiation auto
 no cdp enable
 service-policy input QPI_BBONE_S_34000_V1
 service-policy output QPO_BBONE_34000_V1
!
interface FastEthernet0/2/0
 description RESERVADO PARA ADM100M | ROGERIO | 521-3113 | 16/07/2012
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
interface FastEthernet0/2/1
 description TVMIRANTE  | 50M | SLS/IP/03877 | (SLS/IP/03877)
 bandwidth 50000
 ip address 201.73.255.77 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 load-interval 30
 negotiation auto
 no cdp enable
 service-policy input QPI_BBONE_S_50000_V1
 service-policy output QPO_BBONE_50000_V1
!
interface FastEthernet0/2/2
 no ip address
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 load-interval 30
 shutdown
 no negotiation auto
 no flowcontrol bidirectional
 no cdp enable
!
interface FastEthernet0/2/3
 dampening
 description Link NGN | 100M | <DESIG>/100M/xxx | OTS XXXXX | ( GACC02.FLA - FAST0/2/0) | 3a VIA NGN - CANAO DE SLS
 mtu 1530
 bandwidth 100000
 ip address 200.230.91.6 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 ip mtu 1500
 ip ospf network point-to-point
 ip ospf cost 9999
 load-interval 30
 carrier-delay msec 0
 no negotiation auto
 no flowcontrol bidirectional
 mpls ldp discovery transport-address 200.230.92.6
 mpls label protocol ldp
 tag-switching ip
 no cdp enable
 service-policy output CANINHO_IntBackbone_100Mbps_100M_E5
!
interface FastEthernet0/2/4
 description RCC_MPLS1 | 100M | ENLACE ETH CLIENTE
 bandwidth 100000
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 load-interval 30
 no negotiation auto
 no cdp enable
!
interface FastEthernet0/2/4.991
 description RCC_RUN_MPLS1  | 8000K | SLS/IP/04703 | (SLS/IP/04703) | BGP_AS65508
 bandwidth 8000
 encapsulation dot1Q 991
 ip vrf forwarding RCC_RUN_MPLS1:4455
 ip address 200.241.80.153 255.255.255.252
 no ip directed-broadcast
 no cdp enable
!
interface FastEthernet0/2/4.992
 description RCC_GST_MPLS1  | 2048K | SLS/IP/04704 | (SLS/IP/04704) | BGP_AS65508
 bandwidth 2000
 encapsulation dot1Q 992
 ip vrf forwarding RCC_GST_MPLS1:4457
 ip address 200.241.80.249 255.255.255.252
 no ip directed-broadcast
 no cdp enable
!
interface FastEthernet0/2/4.993
 description RCC_CLARO  | 20M | SLS/IP/XXXXX | (SLS/IP/XXXXX) | BGP_AS65508
 bandwidth 20000
 encapsulation dot1Q 993
 ip vrf forwarding RCC_CLARO_MPLS1:6254
 ip address 10.90.0.137 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_A_20000K_RCC_CLARO
 service-policy output QDO_A_20000K_RCC_CLARO
!
interface FastEthernet0/2/4.994
 description RCC_PRY_MPLS1 | 20M | SLS/IP/XXXX1 | (SLS/IP/XXXX1) | BGP_AS65508
 bandwidth 20000
 encapsulation dot1Q 994
 ip vrf forwarding RCC_PRY_MPLS1:6256
 ip address 10.70.22.77 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_A_20000K_RCC_PRY_MPLS1
 service-policy output QDO_A_20000K_RCC_PRY_MPLS1
!
interface FastEthernet0/2/5
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
interface FastEthernet0/2/6
 no ip address
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
interface FastEthernet0/2/7
 description RESERVADO PARA ADM100M | ROGERIO | 521-3113 | 28/09/2011
 no ip address
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 shutdown
 negotiation auto
 no cdp enable
 service-policy input QPI_BBONE_S_20000_V1
 service-policy output QPO_BBONE_20000_V1
!
interface Serial0/3/0.1/1/2/1:0
 dampening 30 50 1100 200
 description SOLARBR  | 2048K | SLS/IP/05668 | (SLS/IP/05668) | BGP_AS64966
 bandwidth 2048
 ip vrf forwarding SOLARBR:6759
 ip address 200.241.80.237 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 no cdp enable
 service-policy input QPI_A_2048K_23_N_0_25_0_0_1_49
 service-policy output QPO_A_2048K_23_0_25_0_0_1_49
!
interface Serial0/3/0.1/1/2/2:0
 dampening 30 50 1100 200
 description SERASA  | 2048K | ENLACE FR CLIENTE 
 bandwidth 2048
 no ip address
 no ip directed-broadcast
 encapsulation frame-relay IETF
 no ip mroute-cache
 load-interval 30
 frame-relay lmi-type cisco
!
interface Serial0/3/0.1/1/2/2:0.1 point-to-point
 description SERASA  | 2048K | SLS/IP/00186 | (SLS/IP/00186) | BGP_AS65000
 bandwidth 2048
 ip vrf forwarding SERASA:1956
 ip address 200.253.152.49 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no ip mroute-cache
 no cdp enable
 frame-relay interface-dlci 100 CISCO   
  class QOS_CLASS_A_F_2048K_200K_200K_528K_0B
!
interface Serial0/3/0.1/1/7/3:0
 dampening 30 50 1100 200
 description SUPERMMACIEL  | 2048K | SLS/IP/03896 | (SLS/IP/03896)
 bandwidth 2048
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 ppp chap hostname MULTILINK_12
 ppp multilink
 multilink-group 12
!
interface Serial0/3/0.1/2/3/1:0
 dampening 30 50 1100 200
 description CAMPANHA NACIONAL DE ESCOLAS  | 1024K | PDZ/IP/00130 | (PDZ/IP/00130)
 bandwidth 1024
 ip address 200.241.80.21 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 no cdp enable
 service-policy input QPI_BBONE_DSCP_V1
!
interface Serial0/3/0.1/2/7/2:0
 dampening 30 50 1100 200
 description BNB  | 1024K | PCL/IP/00130 | (PCL/IP/00130) | BGP_AS65000
 bandwidth 1024
 ip vrf forwarding BNB:5075
 ip address 201.30.37.237 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 no cdp enable
 service-policy input QPI_A_1024K_22_N_0_36_22_0_2_17
 service-policy output QPO_A_1024K_22_0_36_22_0_2_17
!
interface Serial0/3/0.1/2/7/2:1
 description GERANORTE  | 256K | ENLACE FR CLIENTE 
 bandwidth 256
 no ip address
 no ip directed-broadcast
 encapsulation frame-relay IETF
 no ip mroute-cache
 frame-relay lmi-type cisco
!
interface Serial0/3/0.1/2/7/2:1.1 point-to-point
 description GERANORTE  | 256K | MIR/IP/00004 | (MIR/IP/00004)
 bandwidth 256
 ip vrf forwarding GERANORTE:4870
 ip address 201.73.255.85 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no ip mroute-cache
 no cdp enable
 frame-relay interface-dlci 100 IETF   
  class QC_AF_256K_13_N_0_4_0_0_7_74_256B
!
interface Serial0/3/0.1/2/7/2:2
 description IMIFARMA  | 512K | SLS/IP/05682 | (SLS/IP/05682)
 bandwidth 512
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 ppp chap hostname MULTILINK_53474
 ppp multilink
 multilink-group 53474
!
interface Serial0/3/0.1/3/2/3:0
 dampening 30 50 1100 200
 description CASASSAMPAIO  | 2048K | CDO/IP/00033 | (CDO/IP/00033)
 bandwidth 2048
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 ppp chap hostname MULTILINK_45337
 ppp multilink
 multilink-group 45337
!
interface Serial0/3/0.1/3/4/1:0
 dampening 30 50 1100 200
 description FERTIPAR  | 2048K | SLS/IP/00864 | (SLS/IP/00864)
 bandwidth 2048
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 shutdown
 no peer neighbor-route
 ppp chap hostname MULTILINK_4
 ppp multilink
 multilink-group 4
!
interface Serial0/3/0.1/3/4/3:0
 dampening 30 50 1100 200
 description CASASSAMPAIO  | 2048K | CDO/IP/00162 | (CDO/IP/00162)
 bandwidth 2048
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 ppp chap hostname MULTILINK_45337
 ppp multilink
 multilink-group 45337
!
interface Serial0/3/0.1/3/7/2:1
 description UNICREDJPA  | 512K | ENLACE FR CLIENTE 
 bandwidth 512
 no ip address
 no ip directed-broadcast
 encapsulation frame-relay IETF
 no ip mroute-cache
 frame-relay lmi-type cisco
!
interface Serial0/3/0.1/3/7/2:1.1 point-to-point
 description UNICREDJPA  | 512K | SLS/IP/03734 | (SLS/IP/03734)
 bandwidth 512
 ip vrf forwarding UNICRED:1647
 ip address 200.209.190.113 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no ip mroute-cache
 no cdp enable
 frame-relay interface-dlci 100 IETF   
  class QC_AF_512K_10_N_0_54_22_0_4_9_256B
!
interface Serial0/3/0.1/3/7/2:2
 description IMIFARMA  | 512K | SLS/IP/05642 | (SLS/IP/05642)
 bandwidth 512
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 ppp chap hostname MULTILINK_53944
 ppp multilink
 multilink-group 53944
!
interface Serial0/3/0.1/3/7/2:3
 dampening 30 50 1100 200
 description COBRA  | 512K | ENLACE FR CLIENTE 
 bandwidth 512
 no ip address
 no ip directed-broadcast
 encapsulation frame-relay IETF
 no ip mroute-cache
 frame-relay lmi-type cisco
!
interface Serial0/3/0.1/3/7/2:3.1 point-to-point
 description COBRA  | 512K | SLS/IP/00168 | (SLS/IP/00168) | BGP_AS65191
 bandwidth 512
 ip vrf forwarding COBRA:1706
 ip address 200.249.174.13 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no ip mroute-cache
 no cdp enable
 frame-relay interface-dlci 100 CISCO   
  class QC_AF_512K_13_N_0_25_0_0_4_57_512B
!
interface Serial0/3/0.1/3/7/2:4
 description CETIP  | 256K | ENLACE FR CLIENTE 
 bandwidth 256
 no ip address
 no ip directed-broadcast
 encapsulation frame-relay IETF
 no ip mroute-cache
 frame-relay lmi-type cisco
!
interface Serial0/3/0.1/3/7/2:4.1 point-to-point
 description CETIP  | 256K | SLS/IP/05085 | (SLS/IP/05085) | BGP_AS65000
 bandwidth 256
 ip vrf forwarding CETIP:6164
 ip address 187.29.255.73 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no ip mroute-cache
 no cdp enable
 frame-relay interface-dlci 100 IETF   
  class QC_BBONE_EXP_V1
!
interface GigabitEthernet1/0
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 shutdown
 no negotiation auto
 no cdp enable
!
interface GigabitEthernet1/1
 description Ligacao SW01.SLS | 1000M | SLS/GIGA/027 | (porta 1/2 do sw01.sls)  | (PORT-CHANNEL)
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 shutdown
 negotiation auto
 no cdp enable
!
interface GigabitEthernet1/2
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 load-interval 30
 shutdown
 negotiation auto
 no cdp enable
!
interface GigabitEthernet1/3
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 shutdown
 negotiation auto
 no cdp enable
!
interface GigabitEthernet2/0
 description LINK ETH | 1000M | SLSUSIT/SLSUSQT/1G/001 | DM4001_SLSUS-01 GIG0/5 | CERTIDAO DE NASCIMENTO-QT600 GIG 1
 mtu 1546
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 load-interval 30
 no negotiation auto
 no cdp enable
!
interface GigabitEthernet2/0.100
 description QUALITY_TEST  | 1000M | SLS/PE/98001 | (SLS/PE/98001)
 bandwidth 1000000
 encapsulation dot1Q 100
 ip address 201.57.171.33 255.255.255.248
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_1000000_V1
 service-policy output QPO_BBONE_1000000_V1
!
interface GigabitEthernet2/0.200
 description QUALITY_TEST  | 100M | SLS/PE/98002 | (SLS/PE/98002)
 bandwidth 100000
 encapsulation dot1Q 200
 ip vrf forwarding REALIP_SBC:5580
 ip address 201.57.171.41 255.255.255.248
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input MARCA-VOZ
!
interface GigabitEthernet2/0.300
 description QUALITY_TEST  | 100M | SLS/PE/98003 | (SLS/PE/98003)
 bandwidth 100000
 encapsulation dot1Q 300
 ip vrf forwarding TRF1_FM:3152
 ip address 201.57.171.49 255.255.255.248
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_1000M_TESTE_QUALIDADE
 service-policy output QDO_1000M_TESTE_QUALIDADE
!
interface GigabitEthernet2/0.400
 description QUALITY_TEST  | 100M | SLS/PE/98004 | (SLS/PE/98004)
 bandwidth 100000
 encapsulation dot1Q 400
 ip vrf forwarding BEMOL1:5658
 ip address 200.172.13.121 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
!
interface GigabitEthernet2/1
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 shutdown
 no negotiation auto
 no cdp enable
!
interface GigabitEthernet2/2
 no ip address
 no ip directed-broadcast
 shutdown
 negotiation auto
 no cdp enable
!
interface GigabitEthernet2/3
 no ip address
 no ip directed-broadcast
 shutdown
 negotiation auto
 no cdp enable
!
interface Serial3/0/0.1/1/1/1:0
 dampening 30 50 1100 200
 description ABNAMRO  | 1024K | SLS/IP/04674 | (SLS/IP/04674)
 bandwidth 1024
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 ppp chap hostname MULTILINK_16
 ppp multilink
 multilink-group 16
!
interface Serial3/0/0.1/1/2/1:0
 dampening 30 50 1100 200
 description DPU  | 2048K | SLS/IP/05045 | (SLS/IP/05045)
 bandwidth 2048
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 ppp chap hostname MULTILINK_35598
 ppp multilink
 multilink-group 35598
!
interface Serial3/0/0.1/1/2/2:0
 dampening 30 50 1100 200
 description DPU  | 2048K | SLS/IP/05046 | (SLS/IP/05046)
 bandwidth 2048
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 ppp chap hostname MULTILINK_35598
 ppp multilink
 multilink-group 35598
!
interface Serial3/0/0.1/1/2/3:0
 dampening 30 50 1100 200
 description MPT_NOVA  | 2048K | SLS/IP/05303 | (SLS/IP/05303)
 bandwidth 2048
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 ppp chap hostname MULTILINK_45325
 ppp multilink
 multilink-group 45325
!
interface Serial3/0/0.1/1/4/3:0
 dampening 30 50 1100 200
 description BT_CBB  | 2048K | ENLACE FR CLIENTE 
 bandwidth 2048
 no ip address
 no ip directed-broadcast
 encapsulation frame-relay IETF
 no ip mroute-cache
 load-interval 30
 frame-relay lmi-type cisco
!
interface Serial3/0/0.1/1/4/3:0.1 point-to-point
 description BT_CBB  | 2048K | SLS/IP/00193 | (SLS/IP/00193) | BGP_AS64768
 bandwidth 2048
 ip vrf forwarding BT_CBB:1851
 ip address 200.209.190.89 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no ip mroute-cache
 snmp trap link-status
 no cdp enable
 frame-relay interface-dlci 100 IETF   
  class QC_AF_2048K_7_N_0_63_0_15_2_12_0B
!
interface Serial3/0/0.1/1/5/1:1
 dampening 30 50 1100 200
 description PAGUEMENOS  | 512K | ENLACE FR CLIENTE 
 bandwidth 512
 no ip address
 no ip directed-broadcast
 encapsulation frame-relay IETF
 no ip mroute-cache
 load-interval 30
 frame-relay lmi-type cisco
!
interface Serial3/0/0.1/1/5/1:1.1 point-to-point
 description PAGUEMENOS  | 512K | ITZ/IP/01292 | (ITZ/IP/01292) | BGP_AS65338
 bandwidth 512
 ip vrf forwarding PAGUEMENOS:3822
 ip address 189.52.211.109 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no ip mroute-cache
 no cdp enable
 frame-relay interface-dlci 100 IETF   
  class QC_BBONE_EXP_V1
!
interface Serial3/0/0.1/1/5/1:2
 dampening 30 50 1100 200
 description BBRASIL  | 64K | ENLACE FR CLIENTE 
 bandwidth 64
 no ip address
 no ip directed-broadcast
 encapsulation frame-relay IETF
 no ip mroute-cache
 frame-relay lmi-type cisco
!
interface Serial3/0/0.1/1/5/1:2.1 point-to-point
 description BBRASIL  | 64K | ITZ/IP/01287 | (ITZ/IP/01287) | BGP_AS65521
 bandwidth 64
 ip vrf forwarding BBRASIL_PAE:7041
 ip address 10.247.76.253 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 ip pim sparse-mode
 no ip mroute-cache
 shutdown
 no cdp enable
 frame-relay interface-dlci 100 CISCO   
  class QC_64K_BBrasil_PAE_IOS_V1
!
interface Serial3/0/0.1/1/6/3:0
 dampening 30 50 1100 200
 description MPT_NOVA  | 2048K | SLS/IP/05029 | (SLS/IP/05029)
 bandwidth 2048
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 ppp chap hostname MULTILINK_45325
 ppp multilink
 multilink-group 45325
!
interface Serial3/0/0.1/1/7/2:0
 dampening 30 50 1100 200
 description MIN JUSTICA  | 2048K | SLS/IP/05076 | (SLS/IP/05076)
 bandwidth 2048
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 ppp chap hostname MULTILINK_35623
 ppp multilink
 multilink-group 35623
!
interface Serial3/0/0.1/2/2/3:0
 dampening 30 50 1100 200
 description MPF  | 2048K | ITZ/IP/01169 | (ITZ/IP/01169) | BGP_AS65002
 bandwidth 2048
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 ppp chap hostname MULTILINK_45324
 ppp multilink
 multilink-group 45324
!
interface Serial3/0/0.1/2/3/1:0
 dampening 30 50 1100 200
 description TRANSBRASILIANA  | 1024K | SLS/IP/05264 | (SLS/IP/05264) | BGP_AS65000
 bandwidth 1024
 ip vrf forwarding BRASILIANAENC_NOVA:6317
 ip address 200.172.12.37 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 no cdp enable
 service-policy input QPI_A_1024K_6_N_0_48_0_0_2_43
 service-policy output QPO_A_1024K_6_0_48_0_0_2_43
!
interface Serial3/0/0.1/2/4/2:0
 dampening 30 50 1100 200
 description GERADORA  | 2048K | SLS/IP/03747 | (SLS/IP/03747) | BGP_AS65000
 bandwidth 2048
 ip vrf forwarding GERADORA:5001
 ip address 187.28.240.125 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 no cdp enable
 service-policy input QPI_A_2048K_10_N_25_24_0_0_1_38
 service-policy output QPO_A_2048K_10_25_24_0_0_1_38
!
interface Serial3/0/0.1/2/5/1:0
 dampening 30 50 1100 200
 description MPT_NOVA  | 2048K | ITZ/IP/01212 | (ITZ/IP/01212)
 bandwidth 2048
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 ppp chap hostname MULTILINK_45324
 ppp multilink
 multilink-group 45324
!
interface Serial3/0/0.1/2/5/2:0
 dampening 30 50 1100 200
 description MPT_NOVA  | 2048K | SLS/IP/05302 | (SLS/IP/05302)
 bandwidth 2048
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 ppp chap hostname MULTILINK_45325
 ppp multilink
 multilink-group 45325
!
interface Serial3/0/0.1/2/5/3:0
 dampening 30 50 1100 200
 description MPT_NOVA  | 2048K | SLS/IP/05030 | (SLS/IP/05030)
 bandwidth 2048
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 ppp chap hostname MULTILINK_45325
 ppp multilink
 multilink-group 45325
!
interface Serial3/0/0.1/3/1/1:0
 dampening 30 50 1100 200
 description MARISALOJAS  | 1024K | SLS/IP/04657 | (SLS/IP/04657) | BGP_AS65000
 bandwidth 1024
 ip vrf forwarding MARISA:4972
 ip address 187.29.255.121 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 no cdp enable
 service-policy input QPI_A_1024K_21_N_0_11_11_36_2_18
 service-policy output QPO_A_1024K_21_0_11_11_36_2_18
!
interface Serial3/0/0.1/3/2/3:0
 dampening 30 50 1100 200
 description CREDISHOP  | 2048K | SLS/IP/03859 | (SLS/IP/03859)
 bandwidth 2048
 ip address 201.73.255.233 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 no cdp enable
 service-policy input QPI_BBONE_DSCP_V1
!
interface Serial3/0/0.1/3/3/2:1
 dampening 30 50 1100 200
 description REDE_CORREIOS  | 256K | ZED/IP/00137 | (ZED/IP/00137) | BGP_AS65001
 bandwidth 256
 ip vrf forwarding CORREIOS_2016:7440
 ip address 172.18.72.233 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 no cdp enable
 service-policy input QPI_Correios_256K_PPP_IOS_D_V1
 service-policy output QPO_Correios_256K_PPP_IOS_D_V1
!
interface Serial3/0/0.1/3/3/2:2
 description TRANSITA  | 256K | ENLACE FR CLIENTE 
 bandwidth 256
 no ip address
 no ip directed-broadcast
 encapsulation frame-relay IETF
 load-interval 30
 frame-relay lmi-type cisco
!
interface Serial3/0/0.1/3/3/2:2.1 point-to-point
 description TRANSITA  | 256K | SIS/IP/00199 | (SIS/IP/00199) | BGP_AS64589
 bandwidth 256
 ip vrf forwarding TRANSITA:1295
 ip address 201.30.37.249 255.255.255.252
 no ip directed-broadcast
 no ip mroute-cache
 no cdp enable
 frame-relay interface-dlci 100 CISCO   
  class QC_AF_256K_25_N_0_50_0_0_7_16_256B
!
interface Serial3/0/0.1/3/3/2:3
 dampening 30 50 1100 200
 description ABR ROAMING  | 512K | SLS/IP/04573 | (SLS/IP/04573) | BLK-SAIP-APEDIDO/20180312-174/POR-RPA01
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
interface Serial3/0/0.1/3/3/2:4
 description BBRASIL  | 64K | ENLACE FR CLIENTE 
 bandwidth 64
 no ip address
 no ip directed-broadcast
 encapsulation frame-relay IETF
 no ip mroute-cache
 frame-relay lmi-type cisco
!
interface Serial3/0/0.1/3/3/2:4.1 point-to-point
 description BBRASIL  | 64K | SIS/IP/00203 | (SIS/IP/00203) | BGP_AS65521
 bandwidth 64
 ip vrf forwarding BBRASIL_PAE:7041
 ip address 10.247.75.249 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 ip pim sparse-mode
 no ip mroute-cache
 shutdown
 no cdp enable
 frame-relay interface-dlci 100 CISCO   
  class QC_64K_BBrasil_PAE_IOS_V1
!
interface Serial3/0/0.1/3/3/2:5
 description PAGUEMENOS  | 256K | SLS/IP/00728 | (SLS/IP/00728)
 bandwidth 256
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 no cdp enable
 ppp chap hostname MULTILINK_53945
 ppp multilink
 multilink-group 53945
!
interface Serial3/0/0.1/3/3/2:6
 description IMIFARMA  | 512K | SLS/IP/05689 | (SLS/IP/05689)
 bandwidth 512
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 ppp chap hostname MULTILINK_53941
 ppp multilink
 multilink-group 53941
!
interface Serial3/0/0.1/3/3/2:7
 description SETMA  | 128K | SLS/IP/00431 | (SLS/IP/00431)
 bandwidth 128
 ip vrf forwarding SET_MA:3377
 ip address 189.43.120.105 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 no cdp enable
 service-policy input QPI_BBONE_EXP_V1
!
interface Serial3/0/0.1/3/3/3:1
 dampening 30 50 1100 200
 description UNICRED  | 512K | ENLACE FR CLIENTE 
 bandwidth 512
 no ip address
 no ip directed-broadcast
 encapsulation frame-relay IETF
 no ip mroute-cache
 load-interval 30
 frame-relay lmi-type cisco
!
interface Serial3/0/0.1/3/3/3:1.1 point-to-point
 description UNICRED  | 512K | SLS/IP/03736 | (SLS/IP/03736) | BGP_AS65023
 bandwidth 512
 ip vrf forwarding UNICRED:1647
 ip address 201.39.88.77 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no ip mroute-cache
 no cdp enable
 frame-relay interface-dlci 100 IETF   
  class QC_AF_512K_10_N_0_54_22_0_4_9_0B
!
interface Serial3/0/0.1/3/3/3:2
 dampening 30 50 1100 200
 description CREDISHOP  | 256K | BBL/IP/00064 | (BBL/IP/00064)
 bandwidth 256
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 ppp chap hostname MULTILINK_35538
 ppp multilink
 multilink-group 35538
!
interface Serial3/0/0.1/3/3/3:3
 description SUPERMMACIEL  | 512K | SLS/IP/05797 | (SLS/IP/05797) | BLK-SAIP-APEDIDO/20180220-1915/POR-RPA01
 bandwidth 512
 no ip address
 no ip directed-broadcast
 encapsulation ppp
 shutdown
 no peer neighbor-route
 no cdp enable
 ppp chap hostname MULTILINK_53927
 ppp multilink
 multilink-group 53927
!
interface Serial3/0/0.1/3/3/3:4
 description INPE  | 512K | SLS/IP/04681 | (SLS/IP/04681)
 bandwidth 512
 ip vrf forwarding INPE:5430
 ip address 200.241.80.149 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 no cdp enable
 service-policy input QPI_BBONE_EXP_V1
!
interface Serial3/0/0.1/3/3/3:5
 description SETMA  | 128K | SLS/IP/00444 | (SLS/IP/00444)
 bandwidth 128
 ip vrf forwarding SET_MA:3377
 ip address 189.43.120.57 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 no cdp enable
 service-policy input QPI_BBONE_EXP_V1
!
interface Serial3/0/0.1/3/4/1:1
 dampening 30 50 1100 200
 description SETMA  | 256K | SLS/IP/00449 | (SLS/IP/00449)
 bandwidth 256
 ip vrf forwarding SET_MA:3377
 ip address 200.249.174.229 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 no cdp enable
 service-policy input QPI_BBONE_EXP_V1
!
interface Serial3/0/0.1/3/4/1:2
 description DPF_MPLS  | 512K | ENLACE FR CLIENTE 
 bandwidth 512
 no ip address
 no ip directed-broadcast
 encapsulation frame-relay IETF
 frame-relay lmi-type cisco
!
interface Serial3/0/0.1/3/4/1:2.1 point-to-point
 description DPF_MPLS  | 512K | SLS/IP/05505 | (SLS/IP/05505)
 bandwidth 512
 ip vrf forwarding DPF_MPLS:6606
 ip address 201.30.37.201 255.255.255.252
 no ip directed-broadcast
 no ip mroute-cache
 no cdp enable
 frame-relay interface-dlci 100 CISCO   
  class QC_AF_512K_7_N_0_24_27_5_4_2_512B
!
interface Serial3/0/0.1/3/4/1:3
 description UNICRED  | 512K | ENLACE FR CLIENTE 
 bandwidth 512
 no ip address
 no ip directed-broadcast
 encapsulation frame-relay IETF
 no ip mroute-cache
 frame-relay lmi-type cisco
!
interface Serial3/0/0.1/3/4/1:3.1 point-to-point
 description UNICRED  | 512K | SLS/IP/04812 | (SLS/IP/04812) | BGP_AS65007
 bandwidth 512
 ip vrf forwarding UNICRED:1647
 ip address 200.172.11.21 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no ip mroute-cache
 no cdp enable
 frame-relay interface-dlci 100 IETF   
  class QC_AF_512K_10_N_0_54_22_0_4_9_512B
!
interface Serial3/0/0.1/3/4/1:4
 description CREFISA  | 512K | ENLACE FR CLIENTE 
 bandwidth 512
 no ip address
 no ip directed-broadcast
 encapsulation frame-relay IETF
 no ip mroute-cache
 frame-relay lmi-type cisco
!
interface Serial3/0/0.1/3/4/1:4.1 point-to-point
 description CREFISA  | 512K | PCL/IP/00136 | (PCL/IP/00136) | BGP_AS65000
 bandwidth 512
 ip vrf forwarding CREFISA:5415
 ip address 200.179.212.253 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no ip mroute-cache
 no cdp enable
 frame-relay interface-dlci 100 CISCO   
  class QC_AF_512K_50_N_0_10_0_0_4_35_512B
!
interface Serial3/0/0.1/3/4/2:2
 dampening 30 50 1100 200
 description MOURA  | 256K | ENLACE FR CLIENTE
 bandwidth 256
 no ip address
 no ip directed-broadcast
 encapsulation frame-relay IETF
 no ip mroute-cache
 load-interval 30
 frame-relay lmi-type cisco
!
interface Serial3/0/0.1/3/4/2:2.1 point-to-point
 description MOURA  | 256K | ITZ/IP/00140 | (ITZ/IP/00140)  bandwidth 256
 bandwidth 256
 ip vrf forwarding MOURA:1648
 ip address 200.249.175.97 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no ip mroute-cache
 no cdp enable
 frame-relay interface-dlci 100 IETF   
  class QC_AF_256K_10_N_0_61_13_0_7_8_256B
!
interface Serial3/0/0.1/3/4/2:5
 dampening 30 50 1100 200
 description IMIFARMA  | 512K | SIS/IP/00198 | (SIS/IP/00198)
 bandwidth 512
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 ppp chap hostname MULTILINK_53477
 ppp multilink
 multilink-group 53477
!
interface Serial3/0/0.1/3/4/3:1
 dampening 30 50 1100 200
 description IMIFARMA  | 512K | SLS/IP/05692 | (SLS/IP/05692) | BLK-SAIP-APEDIDO/20180227-1151/POR-RPA01
 bandwidth 512
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 shutdown
 no peer neighbor-route
 ppp chap hostname MULTILINK_53471
 ppp multilink
 multilink-group 53471
!
interface Serial3/0/0.1/3/4/3:2
 dampening 30 50 1100 200
 description IMIFARMA  | 512K | PHE/IP/00186 | (PHE/IP/00186)
 bandwidth 512
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 ppp chap hostname MULTILINK_53931
 ppp multilink
 multilink-group 53931
!
interface Serial3/0/0.1/3/4/3:3
 description MARITIMO_EBT  | 512K | SLS/IP/06309 | (SLS/IP/06309)
 bandwidth 512
 ip vrf forwarding MARITIMO_EBT:7326
 ip address 200.179.212.81 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 shutdown
 no peer neighbor-route
 no cdp enable
 service-policy input QPI_BBONE_EXP_V1
!
interface Serial3/0/0.1/3/7/1:0
 dampening 30 50 1100 200
 description BNB  | 2048K | SLS/IP/05488 | (SLS/IP/05488) | BGP_AS65000
 bandwidth 2048
 ip vrf forwarding BNB:5075
 ip address 200.172.12.233 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 no cdp enable
 service-policy input QPI_A_2048K_21_N_0_35_20_0_2_21
 service-policy output QPO_A_2048K_21_0_35_20_0_2_21
!
interface Serial3/1/0.1/1/3/3:0
 description CREFISA  | 512K | SLS/IP/05783 | (SLS/IP/05783)
 bandwidth 512
 no ip address
 no ip directed-broadcast
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 ppp chap hostname MULTILINK_53926
 ppp multilink
 multilink-group 53926
!
interface Serial3/1/0.1/1/3/3:3
 dampening 30 50 1100 200
 description BOMPRECO  | 512K | ENLACE FR CLIENTE 
 bandwidth 512
 no ip address
 no ip directed-broadcast
 encapsulation frame-relay IETF
 no ip mroute-cache
 frame-relay lmi-type cisco
!
interface Serial3/1/0.1/1/3/3:3.1 point-to-point
 description BOMPRECO  | 512K | SLS/IP/00523 | (SLS/IP/00523) | BGP_AS65371
 bandwidth 512
 ip vrf forwarding WALMART:3141
 ip address 201.45.138.169 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no ip mroute-cache
 no cdp enable
 frame-relay interface-dlci 100 IETF   
  class QC_AF_512K_7_N_0_11_16_0_4_61_512B
!
interface Serial3/1/0.1/1/5/1:0
 dampening 30 50 1100 200
 description LINX  | 512K | ENLACE FR CLIENTE 
 bandwidth 512
 no ip address
 no ip directed-broadcast
 encapsulation frame-relay IETF
 no ip mroute-cache
 frame-relay lmi-type cisco
!
interface Serial3/1/0.1/1/5/1:0.1 point-to-point
 description LINX  | 512K | SLS/IP/04936 | (SLS/IP/04936) | BGP_AS65000
 bandwidth 512
 ip vrf forwarding LINX:1114
 ip address 189.53.246.45 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no ip mroute-cache
 no cdp enable
 frame-relay interface-dlci 100 IETF   
  class QC_BBONE_EXP_V1
!
interface Serial3/1/0.1/1/5/1:1
 dampening 30 50 1100 200
 description BOMPRECO  | 512K | ENLACE FR CLIENTE 
 bandwidth 512
 no ip address
 no ip directed-broadcast
 encapsulation frame-relay
 no ip mroute-cache
 load-interval 30
 frame-relay lmi-type cisco
!
interface Serial3/1/0.1/1/5/1:1.1 point-to-point
 description BOMPRECO  | 512K | SLS/IP/00522 | (SLS/IP/00522) | BGP_AS65371
 bandwidth 512
 ip vrf forwarding WALMART:3141
 ip address 201.45.138.201 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no ip mroute-cache
 no cdp enable
 frame-relay interface-dlci 100 CISCO   
  class QC_AF_512K_7_N_0_11_16_0_4_61_0B
!
interface Serial3/1/0.1/1/5/1:2
 dampening 30 50 1100 200
 description MAXMIX  | 512K | SLS/IP/06055 | (SLS/IP/06055) | BGP_AS65000
 bandwidth 512
 ip vrf forwarding MAXMIX:6352
 ip address 201.30.37.217 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 no cdp enable
 service-policy input QPI_A_512K_25_N_0_60_0_0_4_10
 service-policy output QPO_A_512K_25_0_60_0_0_4_10
!
interface Serial3/1/0.1/1/5/2:0
 dampening 30 50 1100 200
 description SHERWIN  | 2048K | ITZ/IP/01178 | (ITZ/IP/01178) | BLK-SAIP-APEDIDO/20180118-1923/POR-T3RCI
 bandwidth 2048
 no ip address
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 shutdown
 no peer neighbor-route
 no cdp enable
 service-policy input QPI_BBONE_DSCP_V1
!
interface Serial3/1/0.1/1/5/3:1
 dampening 30 50 1100 200
 description ASSBRTELECOM  | 512K | SLS/IP/03771 | (SLS/IP/03771) | BLK-SAIP-APEDIDO/20180312-176/POR-RPA01
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
interface Serial3/1/0.1/1/5/3:2
 dampening 30 50 1100 200
 description LASA_NOVA  | 1024K | ITZ/IP/01186 | (ITZ/IP/01186)
 bandwidth 1024
 no ip address
 no ip directed-broadcast
 encapsulation frame-relay IETF
 no ip mroute-cache
 load-interval 30
 shutdown
 frame-relay lmi-type cisco
!
interface Serial3/1/0.1/2/1/1:0
 dampening 30 50 1100 200
 description ALVORADA MOTO  | 2048K | PHE/IP/00158 | (PHE/IP/00158)
 bandwidth 2048
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 ppp chap hostname MULTILINK_35635
 ppp multilink
 multilink-group 35635
!
interface Serial3/1/0.1/2/1/2:0
 dampening 30 50 1100 200
 description ALVORADA MOTO  | 2048K | PHE/IP/00163 | (PHE/IP/00163)
 bandwidth 2048
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 ppp chap hostname MULTILINK_35635
 ppp multilink
 multilink-group 35635
!
interface Serial3/1/0.1/2/2/1:0
 dampening 30 50 1100 200
 description GERANORTE | 1024K | MIR/IP/00006
 bandwidth 1024
 ip address 200.209.190.177 255.255.255.252
 no ip directed-broadcast
 encapsulation ppp
 no ip mroute-cache
 load-interval 30
 no cdp enable
 service-policy input QPI_BBONE_DSCP_V1
!
interface Serial3/1/0.1/2/2/2:0
 dampening 30 50 1100 200
 description HSBCMPLS  | 2048K | SLS/IP/00472 | (SLS/IP/00472)
 bandwidth 2048
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 ppp chap hostname MULTILINK_35546
 ppp multilink
 multilink-group 35546
!
interface Serial3/1/0.1/2/5/1:0
 dampening 30 50 1100 200
 description SERPRO  | 1024K | PDU/IP/00113 | (PDU/IP/00113)
 bandwidth 1024
 ip vrf forwarding SERPRO_SLS_RFB_09:5913
 ip address 10.53.2.145 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 ip pim sparse-mode
 encapsulation ppp
 load-interval 30
 shutdown
 no peer neighbor-route
 no cdp enable
 service-policy input QPI_SERPRO_1024K_V1
 service-policy output QPO_SERPRO_1024K_V1
!
interface Serial3/1/0.1/2/5/3:0
 dampening 30 50 1100 200
 description CLARO  | 2048K | SLS/IP/05851 | (SLS/IP/05851)
 bandwidth 2048
 ip vrf forwarding BCP_NO:4026
 ip address 200.253.132.73 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 no cdp enable
 service-policy input QPI_BBONE_EXP_V1
!
interface Serial3/1/0.1/2/6/1:0
 dampening 30 50 1100 200
 description SETSL  | 2048K | SLS/IP/00239 | (SLS/IP/00239)
 bandwidth 2048
 no ip address
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 shutdown
 no peer neighbor-route
 no cdp enable
 service-policy input QPI_BBONE_DSCP_V1
!
interface Serial3/1/0.1/3/1/3:0
 dampening 30 50 1100 200
 description CREDISHOP  | 256K | ACD/IP/00154 | (ACD/IP/00154)
 bandwidth 256
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 ppp chap hostname MULTILINK_35524
 ppp multilink
 multilink-group 35524
!
interface Serial3/1/0.1/3/1/3:1
 dampening 30 50 1100 200
 description BOMPRECO  | 512K | ENLACE FR CLIENTE 
 bandwidth 512
 no ip address
 no ip directed-broadcast
 encapsulation frame-relay IETF
 no ip mroute-cache
 load-interval 30
 frame-relay lmi-type cisco
!
interface Serial3/1/0.1/3/1/3:1.1 point-to-point
 description BOMPRECO  | 512K | ITI/IP/00121 | (ITI/IP/00121) | BGP_AS65371
 bandwidth 512
 ip vrf forwarding WALMART:3141
 ip address 201.30.37.137 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no ip mroute-cache
 no cdp enable
 frame-relay interface-dlci 100 IETF   
  class QC_AF_512K_30_N_0_21_10_30_4_4_0B
!
interface Serial3/1/0.1/3/2/1:1
 dampening 30 50 1100 200
 description HSBCMPLS  | 512K | SLS/IP/00402 | (SLS/IP/00402) | BLK-SAIP-APEDIDO/2017047-162/POR-DENISVM
 bandwidth 512
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 shutdown
 no peer neighbor-route
 ppp chap hostname MULTILINK_35566
 ppp multilink
 multilink-group 35566
!
interface Serial3/1/0.1/3/2/1:2
 description ABNAMRO  | 64K | SLS/IP/00549 | (SLS/IP/00549)
 bandwidth 64
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 no cdp enable
 ppp chap hostname MULTILINK_1989
 ppp multilink
 multilink-group 1989
!
interface Serial3/1/0.1/3/2/1:3
 dampening 30 50 1100 200
 description ABNAMRO  | 256K | SLS/IP/00547 | (SLS/IP/00547)
 bandwidth 256
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 ppp chap hostname MULTILINK_35532
 ppp multilink
 multilink-group 35532
!
interface Serial3/2/0.1/1/3/2:0
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
interface Serial3/2/0.1/1/3/2:0.1 point-to-point
 description LOCALIZA  | 512K | SLS/IP/00135 | (SLS/IP/00135) | BLK-SAIP-APEDIDO/2018031-945/POR-RPA01
 bandwidth 512
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no ip mroute-cache
 no cdp enable
 frame-relay interface-dlci 100 CISCO   
  class QC_AF_512K_13_N_0_47_13_13_4_7_640B
!
interface Serial3/2/0.1/1/3/2:1
 description CREFISA  | 512K | SLS/IP/05090 | (SLS/IP/05090)
 bandwidth 512
 no ip address
 no ip directed-broadcast
 encapsulation ppp
 no peer neighbor-route
 ppp chap hostname MULTILINK_35620
 ppp multilink
 multilink-group 35620
!
interface Serial3/2/0.1/1/3/2:2
 description IMIFARMA  | 512K | SLS/IP/05684 | (SLS/IP/05684)
 bandwidth 512
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 ppp chap hostname MULTILINK_53947
 ppp multilink
 multilink-group 53947
!
interface Serial3/2/0.1/1/3/2:3
 description ITAPEMIRIMCORP  | 256K | ENLACE FR CLIENTE 
 bandwidth 256
 no ip address
 no ip directed-broadcast
 encapsulation frame-relay IETF
 no ip mroute-cache
 frame-relay lmi-type cisco
!
interface Serial3/2/0.1/1/3/2:3.1 point-to-point
 description ITAPEMIRIMCORP  | 256K | SLS/IP/00206 | (SLS/IP/00206) | BGP_AS64589
 bandwidth 256
 ip vrf forwarding TRANSITA:1295
 ip address 200.209.190.137 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no ip mroute-cache
 no cdp enable
 frame-relay interface-dlci 100 CISCO   
  class QC_AF_256K_25_N_0_50_0_0_7_16_320B
!
interface Serial3/2/0.1/1/3/3:0
 dampening 30 50 1100 200
 description SUPERMMACIEL  | 512K | SLS/IP/00657 | (SLS/IP/00657) | BLK-SAIP-APEDIDO/2018028-160/POR-RPA01
 bandwidth 512
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 shutdown
 no peer neighbor-route
 ppp chap hostname MULTILINK_35705
 ppp multilink
 multilink-group 35705
!
interface Serial3/2/0.1/1/3/3:1
 dampening 30 50 1100 200
 description SUPERMMACIEL  | 512K | SLS/IP/00658 | (SLS/IP/00658) | BLK-SAIP-APEDIDO/2018028-166/POR-RPA01
 bandwidth 512
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 shutdown
 no peer neighbor-route
 ppp chap hostname MULTILINK_35544
 ppp multilink
 multilink-group 35544
!
interface Serial3/2/0.1/1/3/3:2
 dampening 30 50 1100 200
 description BOMPRECO  | 512K | ENLACE FR CLIENTE 
 bandwidth 512
 no ip address
 no ip directed-broadcast
 encapsulation frame-relay IETF
 no ip mroute-cache
 load-interval 30
 frame-relay lmi-type cisco
!
interface Serial3/2/0.1/1/3/3:2.1 point-to-point
 description BOMPRECO  | 512K | SLS/IP/00529 | (SLS/IP/00529) | BGP_AS65371
 bandwidth 512
 ip vrf forwarding WALMART:3141
 ip address 189.23.28.133 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no ip mroute-cache
 no cdp enable
 frame-relay interface-dlci 100 IETF   
  class QC_AF_512K_7_N_0_11_16_0_4_61_0B
!
interface Serial3/2/0.1/1/3/3:3
 dampening 30 50 1100 200
 description REDE_CORREIOS  | 256K | SLS/IP/06038 | (SLS/IP/06038) | BGP_AS65001
 bandwidth 256
 ip vrf forwarding CORREIOS_2016:7440
 ip address 172.18.69.13 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 no cdp enable
 service-policy input QPI_Correios_256K_PPP_IOS_D_V1
 service-policy output QPO_Correios_256K_PPP_IOS_D_V1
!
interface Serial3/2/0.1/1/5/3:0
 dampening 30 50 1100 200
 description INFOSUS  | 2048K | SLS/IP/04890 | (SLS/IP/04890) | BGP_AS65000
 bandwidth 2048
 ip vrf forwarding INFOSUS:4968
 ip address 192.168.103.33 255.255.255.252
 no ip directed-broadcast
 encapsulation ppp
 load-interval 30
 no cdp enable
 service-policy input QPI_A_2048K_16_N_15_10_25_0_2_30
 service-policy output QPO_A_2048K_16_15_10_25_0_2_30
!
interface Serial3/2/0.1/1/6/3:0
 dampening 30 50 1100 200
 description TPES  | 2048K | SLS/IP/06008 | (SLS/IP/06008)
 bandwidth 2048
 ip address 200.241.80.189 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 no cdp enable
 service-policy input QPI_BBONE_DSCP_V1
!
interface Serial3/2/0.1/2/5/2:0
 dampening 30 50 1100 200
 description TEXACO  | 512K | ENLACE FR CLIENTE 
 bandwidth 512
 no ip address
 no ip directed-broadcast
 encapsulation frame-relay IETF
 no ip mroute-cache
 load-interval 30
 frame-relay lmi-type cisco
!
interface Serial3/2/0.1/2/5/2:0.1 point-to-point
 description TEXACO  | 512K | ACD/IP/00041 | (ACD/IP/00041) | BGP_AS64830
 bandwidth 512
 ip vrf forwarding TEXACO:4523
 ip address 189.53.11.181 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no ip mroute-cache
 no cdp enable
 frame-relay interface-dlci 100 IETF   
  class QC_AF_512K_13_N_0_25_25_13_4_2_512B
!
interface Serial3/2/0.1/2/5/2:1
 description ARMATEUS  | 512K | ENLACE FR CLIENTE 
 bandwidth 512
 no ip address
 no ip directed-broadcast
 encapsulation frame-relay IETF
 load-interval 30
 frame-relay lmi-type ansi
!
interface Serial3/2/0.1/2/5/2:1.1 point-to-point
 description ARMATEUS  | 512K | ACD/IP/00044 | (ACD/IP/00044) | BGP_AS65533
 bandwidth 512
 ip vrf forwarding ARMATEUS:3394
 ip address 189.52.190.89 255.255.255.252
 no ip directed-broadcast
 no ip mroute-cache
 no cdp enable
 frame-relay interface-dlci 100 IETF   
  class QC_AF_512K_5_N_0_2_0_0_4_88_0B
!
interface Serial3/2/0.1/2/5/2:3
 dampening 30 50 1100 200
 description CREFISA  | 512K | ACD/IP/00175 | (ACD/IP/00175)
 bandwidth 512
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 ppp chap hostname MULTILINK_53925
 ppp multilink
 multilink-group 53925
!
interface Serial3/2/0.1/2/7/2:0
 dampening 30 50 1100 200
 description CREFISA  | 512K | ENLACE FR CLIENTE 
 bandwidth 512
 no ip address
 no ip directed-broadcast
 encapsulation frame-relay IETF
 no ip mroute-cache
 frame-relay lmi-type cisco
!
interface Serial3/2/0.1/2/7/2:0.1 point-to-point
 description CREFISA  | 512K | ITZ/IP/01361 | (ITZ/IP/01361) | BGP_AS65000
 bandwidth 512
 ip vrf forwarding CREFISA:5415
 ip address 187.28.122.1 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no ip mroute-cache
 no cdp enable
 frame-relay interface-dlci 100 IETF   
  class QC_AF_512K_25_N_0_10_0_0_4_60_640B
!
interface Serial3/2/0.1/2/7/3:0
 dampening 30 50 1100 200
 description PAVEL SAO LUIS  | 2048K | SLS/IP/05031 | (SLS/IP/05031)
 bandwidth 2048
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 ppp chap hostname MULTILINK_35592
 ppp multilink
 multilink-group 35592
!
interface Serial3/2/0.1/3/1/1:0
 dampening 30 50 1100 200
 description PAVEL SAO LUIS  | 2048K | SLS/IP/05032 | (SLS/IP/05032)
 bandwidth 2048
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 ppp chap hostname MULTILINK_35592
 ppp multilink
 multilink-group 35592
!
interface Serial3/2/0.1/3/1/3:0
 dampening 30 50 1100 200
 description CREFISA  | 512K | ENLACE FR CLIENTE 
 bandwidth 512
 no ip address
 no ip directed-broadcast
 encapsulation frame-relay IETF
 no ip mroute-cache
 load-interval 30
 frame-relay lmi-type cisco
!
interface Serial3/2/0.1/3/1/3:0.1 point-to-point
 description CREFISA  | 512K | BBL/IP/00231 | (BBL/IP/00231) | BGP_AS65000
 bandwidth 512
 ip vrf forwarding CREFISA:5415
 ip address 200.172.12.85 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no ip mroute-cache
 no cdp enable
 frame-relay interface-dlci 100 IETF   
  class QC_AF_512K_50_N_0_10_0_0_4_35_512B
!
interface Serial3/2/0.1/3/1/3:1
 dampening 30 50 1100 200
 description IMIFARMA  | 512K | BBL/IP/00232 | (BBL/IP/00232) | BLK-SAIP-APEDIDO/2018019-2051/POR-T3RCI
 bandwidth 512
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 no cdp enable
 ppp chap hostname MULTILINK_53933
 ppp multilink
 multilink-group 53933
!
interface Serial3/2/0.1/3/1/3:2
 dampening 30 50 1100 200
 description REDE_CORREIOS  | 256K | BBL/IP/00241 | (BBL/IP/00241) | BGP_AS65001
 bandwidth 256
 ip vrf forwarding CORREIOS_2016:7440
 ip address 172.18.65.237 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 no cdp enable
 service-policy input QPI_Correios_256K_PPP_IOS_D_V1
 service-policy output QPO_Correios_256K_PPP_IOS_D_V1
!
interface Serial3/2/0.1/3/1/3:3
 description SERMA  | 512K | BBL/IP/00256 | (BBL/IP/00256)
 bandwidth 512
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 ppp chap hostname MULTILINK_53948
 ppp multilink
 multilink-group 53948
!
interface Serial3/2/0.1/3/1/3:4
 description BBRASIL  | 64K | ENLACE FR CLIENTE 
 bandwidth 64
 no ip address
 no ip directed-broadcast
 encapsulation frame-relay IETF
 no ip mroute-cache
 frame-relay lmi-type cisco
!
interface Serial3/2/0.1/3/1/3:4.1 point-to-point
 description BBRASIL  | 64K | BBL/IP/00221 | (BBL/IP/00221) | BGP_AS65521
 bandwidth 64
 ip vrf forwarding BBRASIL_PAE:7041
 ip address 10.247.78.165 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 ip pim sparse-mode
 no ip mroute-cache
 shutdown
 no cdp enable
 frame-relay interface-dlci 100 CISCO   
  class QC_64K_BBrasil_PAE_IOS_V1
!
interface Serial3/2/0.1/3/6/2:0
 dampening 30 50 1100 200
 description LASA_NOVA | 1024K | ITZ/IP/01254 | (ITZ/IP/01254) REC: 88123/2017
 bandwidth 1024
 no ip address
 no ip directed-broadcast
 encapsulation frame-relay IETF
 no ip mroute-cache
 shutdown
 frame-relay lmi-type cisco
!
interface Serial3/2/0.1/3/6/3:0
 dampening 30 50 1100 200
 description HONEYWELL_MCI  | 1536K | ENLACE FR CLIENTE 
 bandwidth 1536
 no ip address
 no ip directed-broadcast
 encapsulation frame-relay
 no ip mroute-cache
 load-interval 30
 frame-relay lmi-type cisco
 frame-relay intf-type dce
!
interface Serial3/2/0.1/3/6/3:0.1 point-to-point
 description HONEYWELL_MCI  | 1536K | SLS/IP/01979 | (SLS/IP/01979) | BGP_AS65440
 bandwidth 1536
 ip vrf forwarding HONEYWELL_MCI:1937
 ip address 200.253.132.61 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no ip mroute-cache
 no cdp enable
 frame-relay interface-dlci 100 IETF   
  class QC_MCI_ETM_1536K_64K_1472K_V1
!
interface Serial3/2/0.1/3/7/1:1
 dampening 30 50 1100 200
 description IMIFARMA  | 512K | ITZ/IP/01302 | (ITZ/IP/01302)
 bandwidth 512
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 ppp chap hostname MULTILINK_53937
 ppp multilink
 multilink-group 53937
!
interface Serial3/2/0.1/3/7/1:3
 dampening 30 50 1100 200
 description INFRAERO  | 1024K | ITZ/IP/00438 | (ITZ/IP/00438)
 bandwidth 1024
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 ppp chap hostname MULTILINK_35645
 ppp multilink
 multilink-group 35645
!
interface Serial3/3/0.1/1/1/1:0
 description SHVGAS  | 2048K | SLS/IP/00623 | (SLS/IP/00623)
 bandwidth 2048
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 ppp chap hostname MULTILINK_35539
 ppp multilink
 multilink-group 35539
!
interface Serial3/3/0.1/1/1/2:2
 dampening 30 50 1100 200
 description RIOPOTYSAOLUIS  | 960K | SLS/IP/00367 | (SLS/IP/00367)
 bandwidth 960
 ip address 189.23.28.37 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 no cdp enable
 service-policy input ZERA-DSCP
!
interface Serial3/3/0.1/1/2/1:1
 dampening 30 50 1100 200
 description LAVATEC  | 960K | PCL/IP/00003 | (PCL/IP/00003)
 bandwidth 960
 ip address 189.23.28.53 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 no cdp enable
 service-policy input ZERA-DSCP
!
interface Serial3/3/0.1/1/2/2:2
 dampening 30 50 1100 200
 description MPMVIRTUAIS  | 960K | SLS/IP/00343 | (SLS/IP/00343)
 bandwidth 960
 ip address 200.249.145.169 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 no cdp enable
 service-policy input ZERA-DSCP
!
interface Serial3/3/0.1/1/4/1:1
 dampening 30 50 1100 200
 description J.FONSECA  | 960K | SLS/IP/00378 | (SLS/IP/00378)
 bandwidth 960
 ip address 189.23.28.49 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 no cdp enable
 service-policy input ZERA-DSCP
!
interface Serial3/3/0.1/1/5/3:2
 dampening 30 50 1100 200
 description EPENGENHARIACOMER  | 960K | SLS/IP/00373 | (SLS/IP/00373)
 bandwidth 960
 ip address 189.43.120.121 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 no cdp enable
 service-policy input ZERA-DSCP
!
interface Serial3/3/0.1/1/6/1:1
 dampening 30 50 1100 200
 description TAGUATUR  | 960K | SLS/IP/00383 | (SLS/IP/00383)
 bandwidth 960
 ip address 200.249.145.241 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 no cdp enable
 service-policy input ZERA-DSCP
!
interface Serial3/3/0.1/1/6/3:2
 dampening 30 50 1100 200
 description EMEBELLEZE  | 960K | SLS/IP/00414 | (SLS/IP/00414)
 bandwidth 960
 ip address 200.249.145.73 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 no cdp enable
 service-policy input ZERA-DSCP
!
interface Serial3/3/0.1/2/1/1:2
 dampening 30 50 1100 200
 description JDCOMERCIAL  | 960K | SLS/IP/05817 | (SLS/IP/05817)
 bandwidth 960
 ip address 201.45.138.117 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 no cdp enable
 service-policy input ZERA-DSCP
!
interface Serial3/3/0.1/2/2/1:0
 dampening 30 50 1100 200
 description SERPRO  | 1024K | PHE/IP/00160 | (PHE/IP/00160)
 bandwidth 1024
 ip vrf forwarding SERPRO_SLS_RFB_08:5907
 ip address 10.53.2.165 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 ip pim sparse-mode
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 no cdp enable
 service-policy input QPI_SERPRO_1024K_V1
 service-policy output QPO_SERPRO_1024K_V1
!
interface Serial3/3/0.1/2/2/2:1
 dampening 30 50 1100 200
 description METALACO  | 960K | SLS/IP/00557 | (SLS/IP/00557)
 bandwidth 960
 ip address 201.45.138.133 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 no cdp enable
 service-policy input ZERA-DSCP
!
interface Serial3/3/0.1/2/2/2:2
 dampening 30 50 1100 200
 description COM VILA NOVA | 960K | ITZ/IP/01240 | (ITZ/IP/01240)
 bandwidth 960
 ip address 201.45.138.149 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 no cdp enable
 service-policy input ZERA-DSCP
!
interface Serial3/3/0.1/2/2/3:1
 dampening 30 50 1100 200
 description MARVITE | 960K | SLS/IP/05958 | (SLS/IP/05958)
 bandwidth 960
 ip address 201.45.138.197 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 no cdp enable
 service-policy input ZERA-DSCP
!
interface Serial3/3/0.1/2/3/2:1
 dampening 30 50 1100 200
 description EMPRESA SAO BENNEDITO  | 960K | SLS/IP/06071 | (SLS/IP/06071)
 bandwidth 960
 ip address 189.52.190.13 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 no cdp enable
 service-policy input QPI_BBONE_DSCP_V1
!
interface Serial3/3/0.1/2/6/1:0
 dampening 30 50 1100 200
 description DUVEL  | 2048K | BBL/IP/00038 | (BBL/IP/00038)
 bandwidth 2048
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 ppp chap hostname MULTILINK_45357
 ppp multilink
 multilink-group 45357
!
interface Serial3/3/0.1/2/6/2:0
 dampening 30 50 1100 200
 description SEBRAEMA  | 2048K | SIS/IP/00039 | (SIS/IP/00039) | BGP_AS64617
 bandwidth 2048
 ip vrf forwarding SEBRAEMA:4302
 ip address 189.53.246.69 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 no cdp enable
 service-policy input QPI_A_2048K_6_N_0_1_0_0_2_90
 service-policy output QPO_A_2048K_6_0_1_0_0_2_90
!
interface Serial3/3/0.1/3/1/1:2
 dampening 30 50 1100 200
 description BCOAM  | 1024K | ITZ/IP/00310 | (ITZ/IP/00310)
 bandwidth 1024
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 ppp chap hostname MULTILINK_53936
 ppp multilink
 multilink-group 53936
!
interface Serial3/3/0.1/3/1/1:4
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
interface Serial3/3/0.1/3/1/1:4.1 point-to-point
 description BBRASIL  | 64K | ITZ/IP/01171 | (ITZ/IP/01171) | BGP_AS65521
 bandwidth 64
 ip vrf forwarding BBRASIL:1588
 ip address 10.7.156.89 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 ip pim sparse-mode
 no ip mroute-cache
 no cdp enable
 frame-relay interface-dlci 100 CISCO   
  class QC_BBONE_EXP_V1
!
interface Serial3/3/0.1/3/2/3:2
 dampening 30 50 1100 200
 description BBRASIL  | 256K | ENLACE FR CLIENTE 
 bandwidth 256
 no ip address
 no ip directed-broadcast
 encapsulation frame-relay IETF
 no ip mroute-cache
 frame-relay lmi-type cisco
!
interface Serial3/3/0.1/3/2/3:2.1 point-to-point
 description BBRASIL_NAC  | 256K | SLS/IP/05452 | (SLS/IP/05452) | BGP_AS65321
 bandwidth 256
 ip vrf forwarding BBRASIL_NAC:7399
 ip address 10.66.189.137 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no ip mroute-cache
 no cdp enable
 frame-relay interface-dlci 100 IETF   
  class QC_256K_BBrasil_NAC_GACC_V1
!
interface Serial3/3/0.1/3/2/3:4
 description ABNAMRO  | 1024K | SLS/IP/03787 | (SLS/IP/03787)
 bandwidth 1024
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 ppp chap hostname MULTILINK_35581
 ppp multilink
 multilink-group 35581
!
interface Serial3/3/0.1/3/3/1:0
 dampening 30 50 1100 200
 description DUVEL  | 2048K | BBL/IP/00211 | (BBL/IP/00211)
 bandwidth 2048
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 ppp chap hostname MULTILINK_45357
 ppp multilink
 multilink-group 45357
!
interface Serial3/3/0.1/3/3/2:0
 dampening 30 50 1100 200
 description DATAPREV  | 512K | ENLACE FR CLIENTE 
 bandwidth 512
 no ip address
 no ip directed-broadcast
 encapsulation frame-relay IETF
 no ip mroute-cache
 frame-relay lmi-type cisco
!
interface Serial3/3/0.1/3/3/2:0.1 point-to-point
 description DATAPREV  | 512K | ITMH/IP/00120 | (ITMH/IP/00120)
 bandwidth 512
 ip vrf forwarding PREVIDENCIA_SPOKES:152286
 ip address 10.78.44.77 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no ip mroute-cache
 no cdp enable
 frame-relay interface-dlci 100 IETF   
  class QC_MB_512_152_128_104_0B_G5_V1
!
interface Serial3/3/0.1/3/3/2:1
 description ALVO  | 1024K | ACD/IP/00032 | (ACD/IP/00032)
 bandwidth 1024
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 no cdp enable
 ppp chap hostname MULTILINK_53942
 ppp multilink
 multilink-group 53942
!
interface Serial3/3/0.1/3/3/3:0
 dampening 30 50 1100 200
 description SEBRAEMA  | 2048K | ITZ/IP/00171 | (ITZ/IP/00171) | BGP_AS64617
 bandwidth 2048
 ip vrf forwarding SEBRAEMA:4302
 ip address 189.53.246.121 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 no cdp enable
 service-policy input QPI_A_2048K_6_N_0_1_0_0_2_90
 service-policy output QPO_A_2048K_6_0_1_0_0_2_90
!
interface Serial3/3/0.1/3/4/2:1
 dampening 30 50 1100 200
 description CBE  | 512K | SLS/IP/02687 | (SLS/IP/02687) | BLK-SAIP-INADIMP/20180227-60/POR-RPA01
 bandwidth 512
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 shutdown
 no peer neighbor-route
 ppp chap hostname MULTILINK_35565
 ppp multilink
 multilink-group 35565
!
interface Serial3/3/0.1/3/4/2:2
 description ABNAMRO  | 512K | SLS/IP/00459 | (SLS/IP/00459)
 bandwidth 512
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 ppp chap hostname MULTILINK_53946
 ppp multilink
 multilink-group 53946
!
interface Serial3/3/0.1/3/4/2:3
 description SGNET  | 512K | SLS/IP/04902 | (SLS/IP/04902) | BGP_AS65314
 bandwidth 512
 ip vrf forwarding SGNET:1835
 ip address 200.252.158.173 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 no cdp enable
 service-policy input QPI_SGNET_512_0_256_192_0B_V1
 service-policy output QPO_SGNET_512_0_256_192_0B_V1
!
interface Serial3/3/0.1/3/5/3:0
 dampening 30 50 1100 200
 description SADIA  | 1024K | SJE/IP/00134 | (SJE/IP/00134)
 bandwidth 1024
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 no peer neighbor-route
 ppp chap hostname MULTILINK_35646
 ppp multilink
 multilink-group 35646
!
interface Serial3/3/0.1/3/6/1:1
 dampening 30 50 1100 200
 description IMIFARMA  | 512K | CXS/IP/00253 | (CXS/IP/00253)
 bandwidth 512
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 ppp chap hostname MULTILINK_53932
 ppp multilink
 multilink-group 53932
!
interface Serial3/3/0.1/3/6/1:2
 dampening 30 50 1100 200
 description CREDISHOP  | 256K | CXS/IP/00067 | (CXS/IP/00067)
 bandwidth 256
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 ppp chap hostname MULTILINK_35586
 ppp multilink
 multilink-group 35586
!
interface Serial3/3/0.1/3/6/1:4
 dampening 30 50 1100 200
 description BBRASIL  | 64K | ENLACE FR CLIENTE 
 bandwidth 64
 no ip address
 no ip directed-broadcast
 encapsulation frame-relay IETF
 no ip mroute-cache
 frame-relay lmi-type cisco
!
interface Serial3/3/0.1/3/6/1:4.1 point-to-point
 description BBRASIL  | 64K | CXS/IP/00241 | (CXS/IP/00241) | BGP_AS65521
 bandwidth 64
 ip vrf forwarding BBRASIL:1588
 ip address 10.247.78.213 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 ip pim sparse-mode
 no ip mroute-cache
 shutdown
 no cdp enable
 frame-relay interface-dlci 100 IETF   
  class QC_64_30_0_25_8_0_0_0B_A_V1
!
interface Serial3/3/0.1/3/7/2:0
 dampening 30 50 1100 200
 description SERPRO  | 1024K | CHI/IP/00122 | (CHI/IP/00122) | BGP_AS65003
 bandwidth 1024
 ip vrf forwarding SERPRO_SLS_RFB_05:5917
 ip address 10.53.2.213 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 ip pim sparse-mode
 encapsulation ppp
 load-interval 30
 no peer neighbor-route
 no cdp enable
 service-policy input QPI_SERPRO_1024K_V1
 service-policy output QPO_SERPRO_1024K_V1
!
interface Serial3/3/0.1/3/7/2:1
 dampening 30 50 1100 200
 description BITCARD  | 512K | ENLACE FR CLIENTE 
 bandwidth 512
 no ip address
 no ip directed-broadcast
 encapsulation frame-relay IETF
 no ip mroute-cache
 frame-relay lmi-type cisco
!
interface Serial3/3/0.1/3/7/2:1.1 point-to-point
 description BITCARD  | 512K | SLS/IP/05206 | (SLS/IP/05206)
 bandwidth 512
 ip vrf forwarding BITCARD:6262
 ip address 200.252.158.165 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no ip mroute-cache
 no cdp enable
 frame-relay interface-dlci 100 IETF   
  class QC_BBONE_EXP_V1
!
interface Serial3/3/0.1/3/7/3:0
 dampening 30 50 1100 200
 ip vrf forwarding CREFISA:5415
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 shutdown
 no cdp enable
!
interface GigabitEthernet4/0/0
 description LINK ETH | 1000M | SLSUSDM/SLSUSIT/1G/002 | DM4650-SLSUS-IS01-PLACA GPC PORTA 1
 bandwidth 1000000
 no ip address
 no ip directed-broadcast
 no ip proxy-arp
 load-interval 30
 no negotiation auto
 no flowcontrol bidirectional
 no cdp enable
!
interface GigabitEthernet4/0/0.2
 description BCOAM  | 1024K | SLS/IP/06308 | (SLS/IP/06308) | BGP_AS65330
 bandwidth 1024
 encapsulation dot1Q 2
 ip vrf forwarding BCOAM:4783
 ip address 200.241.80.233 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_A_1024K_47_0_15_11_7_2_4
 service-policy output QDO_A_1024K_47_0_15_11_7_2_4
!
interface GigabitEthernet4/0/0.3
 description ACO MARANHAO  | 1500K | SLS/VL/9832692100 | (SLS/VL/9832692100)
 bandwidth 1500
 encapsulation dot1Q 3
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.172.12.169 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_VIPSIP_VOZ_1500_V1
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet4/0/0.4
 description CERVEJARIAPETROPOLIS  | 4096K | SIS/MULTI/58386 | (SIS/MULTI/58386)
 bandwidth 4096
 encapsulation dot1Q 4
 ip address 201.45.220.49 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_4096_V1
 service-policy output QPO_BBONE_4096_V1
!
interface GigabitEthernet4/0/0.5
 description MONACO DIESEL  | 2048K | BBL/IP/00177 | (BBL/IP/00177)
 bandwidth 2048
 encapsulation dot1Q 5
 ip address 200.241.80.129 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_2048_V1
 service-policy output QPO_BBONE_2048_V1
!
interface GigabitEthernet4/0/0.6
 description CEF  | 1500K | SLS/VL/9831333100 | (SLS/VL/9831333100)
 bandwidth 1500
 encapsulation dot1Q 6
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.172.12.193 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet4/0/0.7
 description LASA_NOVA  | 2048K | SLS/IP/03748 | (SLS/IP/03748) | BGP_AS65316
 bandwidth 2048
 encapsulation dot1Q 7
 ip vrf forwarding LASA_NOVA:6236
 ip address 187.28.122.225 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_A_2048K_13_23_38_0_0_1_24
 service-policy output QDO_A_2048K_13_23_38_0_0_1_24
!
interface GigabitEthernet4/0/0.9
 description CEF  | 1500K | BBL/VL/9936276031 | (BBL/VL/9936276031)
 bandwidth 1500
 encapsulation dot1Q 9
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.241.80.109 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet4/0/0.11
 description LINX  | 1024K | SLS/IP/06200 | (SLS/IP/06200)
 bandwidth 1024
 encapsulation dot1Q 11
 ip address 200.172.10.169 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_1024_V1
 service-policy output QPO_BBONE_1024_V1
!
interface GigabitEthernet4/0/0.12
 description CEF  | 1500K | SLS/VL/9832129200 | (SLS/VL/9832129200)
 bandwidth 1500
 encapsulation dot1Q 12
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.241.80.181 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet4/0/0.14
 description RM_SERVICOS  | 4096K | SLS/MULTI/60659 | (SLS/MULTI/60659)
 bandwidth 4096
 encapsulation dot1Q 14
 ip address 200.241.80.113 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_4096_V1
 service-policy output QPO_BBONE_4096_V1
!
interface GigabitEthernet4/0/0.15
 description sls/pe/005180 migrou para gacc01.sls GigabitEthernet1/1/4.79
 no ip directed-broadcast
 no cdp enable
!
interface GigabitEthernet4/0/0.17
 description Bloqueio Comercial a pedido de Juliana Cristina Severino tel 11 21213598 ou 11 21212857 ou 08007012145 ou 08007212109 da Gerencia de Cobranca em 17042014 M C DIAS  | 12288K | ACD/PE/000158 | (ACD/PE/000158)
 bandwidth 12288
 encapsulation dot1Q 17
 ip address 200.172.13.181 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 shutdown
 no cdp enable
 service-policy input QPI_BBONE_S_12288_V1
 service-policy output QPO_BBONE_12288_V1
!
interface GigabitEthernet4/0/0.18
 description SERPRO  | 1024K | CRN/IP/00109 | (CRN/IP/00109) | BGP_AS65003
 bandwidth 1024
 encapsulation dot1Q 18
 ip vrf forwarding SERPRO_SLS_RFB_12:6238
 ip address 10.53.2.177 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 ip pim sparse-mode
 no cdp enable
 service-policy input QPI_BBONE_N_1024_V1
 service-policy output QPO_BBONE_1024_V1
!
interface GigabitEthernet4/0/0.21
 description MARISA  | 1500K | SLS/VL/9833348130 | (SLS/VL/9833348130)
 bandwidth 1500
 encapsulation dot1Q 21
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.172.12.109 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_VIPSIP_VOZ_1500_V1
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet4/0/0.23
 description LHG_DE_ALBUQUERQUE  | 4096K | PHE/MULTI/60931 | (PHE/MULTI/60931)
 bandwidth 4096
 encapsulation dot1Q 23
 ip address 201.45.220.113 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_4096_V1
 service-policy output QPO_BBONE_4096_V1
!
interface GigabitEthernet4/0/0.24
 description FERRONORTE  | 4096K | ITZ/PE/001184 | (ITZ/PE/001184)
 bandwidth 4096
 encapsulation dot1Q 24
 ip address 200.172.13.205 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_4096_V1
 service-policy output QPO_BBONE_4096_V1
!
interface GigabitEthernet4/0/0.26
 description | 1500k | SLS/VL/9838771015 | (SLS/VL/9838771015)
 bandwidth 1500
 encapsulation dot1Q 26
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 201.30.37.89 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_VIPSIP_VOZ_1500_V1
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet4/0/0.27
 description C M T M_MEDICINA DO TRABALHO  | 4096K | SLS/PE/05209 | (SLS/PE/05209)
 bandwidth 4096
 encapsulation dot1Q 27
 ip address 200.172.13.213 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_4096_V1
 service-policy output QPO_BBONE_4096_V1
!
interface GigabitEthernet4/0/0.28
 description LASA_NOVA  | 2048K | BBL/IP/00192 | (BBL/IP/00192)
 bandwidth 2048
 encapsulation dot1Q 28
 ip vrf forwarding LASA_NOVA:6236
 ip address 200.172.13.217 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_A_2048K_13_38_23_0_0_2_23
 service-policy output QDO_A_2048K_13_38_23_0_0_2_23
!
interface GigabitEthernet4/0/0.29
 description SIAH  | 400K | SLS/VL/9832272233 | (SLS/VL/9832272233)
 bandwidth 400
 encapsulation dot1Q 29
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.172.10.105 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy output QDO_VIPSIP_VOZ_400_V1
!
interface GigabitEthernet4/0/0.30
 description VLI  | 1500K | SLS/VL/9832125600 | (SLS/VL/9832125600)
 bandwidth 1500
 encapsulation dot1Q 30
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 201.45.220.45 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_VIPSIP_VOZ_1500_V1
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet4/0/0.31
 description SHERWIN  | 2048K | SLS/IP/05207 | (SLS/IP/05207)
 bandwidth 2048
 encapsulation dot1Q 31
 ip address 200.172.13.225 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_2048_V1
 service-policy output QPO_BBONE_2048_V1
!
interface GigabitEthernet4/0/0.32
 description CIMED  | 1500K | SLS/VL/9840091850 | (SLS/VL/9840091850)
 bandwidth 1500
 encapsulation dot1Q 32
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 201.45.220.81 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_VIPSIP_VOZ_1500_V1
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet4/0/0.35
 description SOCIC  | 1024K | SLS/IP/06211 | (SLS/IP/06211) | BGP_AS65395
 bandwidth 1024
 encapsulation dot1Q 35
 ip vrf forwarding NOVA_SOCIC:4117
 ip address 200.172.12.205 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_A_1024K_19_0_7_38_0_2_18
 service-policy output QDO_A_1024K_19_0_7_38_0_2_18
!
interface GigabitEthernet4/0/0.38
 description CC_GETULIO VARGAS  | 4096K | ITZ/PE/01198 | (ITZ/PE/01198)
 bandwidth 4096
 encapsulation dot1Q 38
 ip address 200.172.13.245 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 shutdown
 no cdp enable
 service-policy input QPI_BBONE_S_4096_V1
 service-policy output QPO_BBONE_4096_V1
!
interface GigabitEthernet4/0/0.41
 description BASA  | 1024K | BBL/IP/00254 | (BBL/IP/00254) | BGP_AS65330
 bandwidth 1024
 encapsulation dot1Q 41
 ip vrf forwarding BCOAM:4783
 ip address 200.252.158.157 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_A_1024K_12_0_34_25_18_2_8
 service-policy output QDO_A_1024K_12_0_34_25_18_2_8
!
interface GigabitEthernet4/0/0.42
 description CEF  | 1500K | SLS/VL/9832693100 | (SLS/VL/9832693100)
 bandwidth 1500
 encapsulation dot1Q 42
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.179.212.141 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet4/0/0.43
 description MEMPS MONTAGEM ELETROMECANICA  | 4096K | SLS/PE/005230 | (SLS/PE/005230)
 bandwidth 4096
 encapsulation dot1Q 43
 ip address 200.172.13.253 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_4096_V1
 service-policy output QPO_BBONE_4096_V1
!
interface GigabitEthernet4/0/0.44
 description IMIFARMA_EXTRANET  | 512K | CHI/IP/00124 | (CHI/IP/00124) | BGP_AS65000
 bandwidth 512
 encapsulation dot1Q 44
 ip vrf forwarding IMIFARMA_EXTRANET:155458
 ip address 200.252.158.101 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_A_512K_5_0_30_16_4_4_40
 service-policy output QDO_A_512K_5_0_30_16_4_4_40
!
interface GigabitEthernet4/0/0.48
 description MARTINS  | 1500K | SLS/VL/9838780200 | (SLS/VL/9838780200)
 bandwidth 1500
 encapsulation dot1Q 48
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.179.212.161 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_VIPSIP_VOZ_1500_V1
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet4/0/0.50
 description GABRYELLA  | 1500K | SLS/VL/9821085900 | (SLS/VL/9821085900)
 bandwidth 1500
 encapsulation dot1Q 50
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.172.10.73 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_VIPSIP_VOZ_1500_V1
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet4/0/0.51
 description TOKIO_MARINE  | 1500K | SLS/VL/9838787700 | (SLS/VL/9838787700)
 bandwidth 1500
 encapsulation dot1Q 51
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.172.13.69 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_VIPSIP_VOZ_1500_V1
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet4/0/0.53
 description C DE A MARTINS  | 4096K | BLA/PE/000237 | (BLA/PE/000237) | BLK-SAIP-INADIMP/20141210-842/POR-COURT
 bandwidth 4096
 encapsulation dot1Q 53
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 shutdown
 no cdp enable
 service-policy input QPI_BBONE_S_4096_V1
 service-policy output QPO_BBONE_4096_V1
!
interface GigabitEthernet4/0/0.56
 description CAXIAS  | 800K | CXS/VL/9930780000 | (CXS/VL/9930780000)
 bandwidth 800
 encapsulation dot1Q 56
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.179.212.121 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_VIPSIP_VOZ_800_V1
 service-policy output QDO_VIPSIP_VOZ_800_V1
!
interface GigabitEthernet4/0/0.58
 description YARA  | 1500K | SLS/VL/9831336600 | (SLS/VL/9831336600)
 bandwidth 1500
 encapsulation dot1Q 58
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.172.13.85 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_VIPSIP_VOZ_1500_V1
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet4/0/0.59
 description UTILDROGAS  | 1500K | SLS/VL/9840093800 | (SLS/VL/9840093800)
 bandwidth 1500
 encapsulation dot1Q 59
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.172.12.149 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet4/0/0.60
 description SETSL  | 8192K | SLS/PE/000239 | (SLS/PE/000239)
 bandwidth 8192
 encapsulation dot1Q 60
 ip address 200.172.12.41 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_8192_V1
 service-policy output QPO_BBONE_8192_V1
!
interface GigabitEthernet4/0/0.62
 description LIMATRANSPORTES  | 4096K | SLS/PE/005257 | (SLS/PE/005257)
 bandwidth 4096
 encapsulation dot1Q 62
 ip address 200.172.12.49 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_4096_V1
 service-policy output QPO_BBONE_4096_V1
!
interface GigabitEthernet4/0/0.64
 description J B COMERCIO EMPREENDIMENTOS  | 1500K | SLS/VL/9821075252 | (SLS/VL/9821075252)
 bandwidth 1500
 encapsulation dot1Q 64
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.172.10.49 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_VIPSIP_VOZ_1500_V1
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet4/0/0.65
 description FNS  | 1500K | SLS/VL/9832143300 | (SLS/VL/9832143300)
 bandwidth 1500
 encapsulation dot1Q 65
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.172.13.229 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_VIPSIP_VOZ_1500_V1
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet4/0/0.69
 description REDEPOSDIAL1  | 2048K | SLS/IP/06117 | (SLS/IP/06117) | BGP_AS65000
 bandwidth 2048
 encapsulation dot1Q 69
 ip vrf forwarding REDEPOSDIAL1:7101
 ip address 200.172.10.29 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_N_2048_V1
 service-policy output QPO_BBONE_2048_V1
!
interface GigabitEthernet4/0/0.71
 description ASSUNCAO E ROCHA  | 4096K | ITZ/PE/001205 | (ITZ/PE/001205)
 bandwidth 4096
 encapsulation dot1Q 71
 ip address 200.172.12.77 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_4096_V1
 service-policy output QPO_BBONE_4096_V1
!
interface GigabitEthernet4/0/0.72
 description QUERCEGEN AGRONEGOCIOS  | 4096K | SLS/PE/004583 | (SLS/PE/004583)
 bandwidth 4096
 encapsulation dot1Q 72
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 shutdown
 no cdp enable
 service-policy input QPI_BBONE_S_4096_V1
 service-policy output QPO_BBONE_4096_V1
!
interface GigabitEthernet4/0/0.73
 description APAE_MA  | 1500K | SLS/VL/9832138000 | (SLS/VL/9832138000)
 bandwidth 1500
 encapsulation dot1Q 73
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.172.10.5 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_VIPSIP_VOZ_1500_V1
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet4/0/0.76
 description RENER  | 2048K | SLS/IP/05718 | (SLS/IP/05718) | BGP_AS65004
 bandwidth 2048
 encapsulation dot1Q 76
 ip vrf forwarding LOJARENNER:1513
 ip address 200.172.11.65 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_A_2048K_7_0_49_25_10_2_6
 service-policy output QDO_A_2048K_7_0_49_25_10_2_6
!
interface GigabitEthernet4/0/0.78
 description LOJASRENNER  | 2048K | SLS/IP/05556 | (SLS/IP/05556) | BGP_AS65004
 bandwidth 2048
 encapsulation dot1Q 78
 ip vrf forwarding LOJARENNER:1513
 ip address 189.23.73.217 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_A_2048K_7_0_49_25_10_2_6
 service-policy output QDO_A_2048K_7_0_49_25_10_2_6
!
interface GigabitEthernet4/0/0.90
 description TECBAN  | 64K | ITZ/IT/00055 | (ITZ/IT/00055)
 bandwidth 64
 encapsulation dot1Q 90
 ip vrf forwarding TECBAN:1221
 ip address 10.245.16.237 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_64_V1
 service-policy output QPO_BBONE_64_V1
!
interface GigabitEthernet4/0/0.92
 description TECBAN  | 64K | PCL/IT/00002 | (PCL/IT/00002)
 bandwidth 64
 encapsulation dot1Q 92
 ip vrf forwarding TECBAN:1221
 ip address 10.245.25.249 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_N_64_V1
 service-policy output QPO_BBONE_64_V1
!
interface GigabitEthernet4/0/0.94
 description TECBAN  | 64K | ITZ/IT/00061 | (ITZ/IT/00061)
 bandwidth 64
 encapsulation dot1Q 94
 ip vrf forwarding TECBAN:1221
 ip address 10.245.26.21 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_64_V1
 service-policy output QPO_BBONE_64_V1
!
interface GigabitEthernet4/0/0.95
 description TEC BANCARIA  | 64K | SLS/IT/00330 | (SLS/IT/00330)
 bandwidth 64
 encapsulation dot1Q 95
 ip vrf forwarding TECBAN:1221
 ip address 10.245.2.237 255.255.255.252
 no ip directed-broadcast
 no cdp enable
 service-policy input QPI_BBONE_S_64_V1
 service-policy output QPO_BBONE_64_V1
!
interface GigabitEthernet4/0/0.96
 description TECBAN  | 64K | SLS/IT/01241 | (SLS/IT/01241)
 bandwidth 64
 encapsulation dot1Q 96
 ip vrf forwarding TECBAN:1221
 ip address 10.245.17.161 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_64_V1
 service-policy output QPO_BBONE_64_V1
!
interface GigabitEthernet4/0/0.99
 description GCR GOIANIA  | 256K | SLS/IT/01240 | (SLS/IT/01240)
 bandwidth 256
 encapsulation dot1Q 99
 ip vrf forwarding GCRGOIANIA:3789
 ip address 200.249.169.77 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_256_V1
 service-policy output QPO_BBONE_256_V1
!
interface GigabitEthernet4/0/0.100
 description IMIFARMA  | 512K | CDO/IP/00174 | (CDO/IP/00174) | BGP_AS65000
 bandwidth 512
 encapsulation dot1Q 100
 ip vrf forwarding IMIFARMA_EXTRANET:155458
 ip address 187.28.122.177 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_A_512K_5_0_30_16_0_4_44
 service-policy output QDO_A_512K_5_0_30_16_0_4_44
!
interface GigabitEthernet4/0/0.106
 description TECBAN  | 64K | SLS/IT/01247 | (SLS/IT/01247)
 bandwidth 64
 encapsulation dot1Q 106
 ip vrf forwarding TECBAN:1221
 ip address 10.245.29.221 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_64_V1
 service-policy output QPO_BBONE_64_V1
!
interface GigabitEthernet4/0/0.115
 description LASA_NOVA  | 1024K | SLS/IP/00534 | (SLS/IP/00534) | BLK-SAIP-APEDIDO/20170912-1554/POR-T3PER
 bandwidth 1024
 encapsulation dot1Q 115
 no ip directed-broadcast
 no ip proxy-arp
 shutdown
 no cdp enable
 service-policy input QDI_A_1024K_25_0_40_0_0_2_31
 service-policy output QDO_A_1024K_25_0_40_0_0_2_31
!
interface GigabitEthernet4/0/0.117
 description PROV ATACADAO  | 256K | ITZ/BF/00008 | (ITZ/BF/00008)
 bandwidth 256
 encapsulation dot1Q 117
 ip address 200.249.169.209 255.255.255.252
 ip verify unicast source reachable-via rx allow-default allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_256_V1
 service-policy output QPO_BBONE_256_V1
!
interface GigabitEthernet4/0/0.118
 description TECBAN  | 64K | SLS/IT/01248 | (SLS/IT/01248)
 bandwidth 64
 encapsulation dot1Q 118
 ip vrf forwarding TECBAN:1221
 ip address 10.245.29.229 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_64_V1
 service-policy output QPO_BBONE_64_V1
!
interface GigabitEthernet4/0/0.119
 description GCR GOIANIA  | 256K | ITZ/IT/00056 | (ITZ/IT/00056)
 bandwidth 256
 encapsulation dot1Q 119
 ip vrf forwarding GCRGOIANIA:3789
 ip address 200.249.169.97 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_256_V1
 service-policy output QPO_BBONE_256_V1
!
interface GigabitEthernet4/0/0.122
 description SERPRO  | 1024K | CDO/IP/00146 | (CDO/IP/00146) | BGP_AS65003
 bandwidth 1024
 encapsulation dot1Q 122
 ip vrf forwarding SERPRO_SLS_RFB_06:5918
 ip address 10.53.2.149 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 ip pim sparse-mode
 no cdp enable
 service-policy input QDI_SERPRO_1024K_V1
 service-policy output QDO_SERPRO_1024K_V1
!
interface GigabitEthernet4/0/0.124
 description CEF  | 1500K | SLS/VL/9832129100 | (SLS/VL/9832129100)
 bandwidth 1500
 encapsulation dot1Q 124
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.179.212.73 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet4/0/0.141
 description BBRASIL  | 64K | ACD/IP/00179 | (ACD/IP/00179) | BGP_AS65521
 bandwidth 64
 encapsulation dot1Q 141
 ip vrf forwarding BBRASIL_PAE:7041
 ip address 10.247.76.233 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 ip pim sparse-mode
 shutdown
 no cdp enable
 service-policy input QDI_64K_BBrasil_PAE_IOS_V1
 service-policy output QDO_64K_BBrasil_PAE_IOS_V1
!
interface GigabitEthernet4/0/0.143
 description FERGUMAR  | 1024K | ACD/IP/00184 | (ACD/IP/00184)
 bandwidth 1024
 encapsulation dot1Q 143
 ip address 201.45.220.61 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_1024_V1
 service-policy output QPO_BBONE_1024_V1
!
interface GigabitEthernet4/0/0.190
 no ip directed-broadcast
 no cdp enable
!
interface GigabitEthernet4/0/0.200
 description COMPANHIA ITAQUI  | 800K | SLS/VL/9821085200 | (SLS/VL/9821085200)
 bandwidth 800
 encapsulation dot1Q 200
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 201.30.37.81 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_VIPSIP_VOZ_800_V1
 service-policy output QDO_VIPSIP_VOZ_800_V1
!
interface GigabitEthernet4/0/0.223
 description MONGERAL  | 1500K | SLS/VL/9833117730 | (SLS/VL/9833117730)
 bandwidth 1500
 encapsulation dot1Q 223
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.172.13.101 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet4/0/0.300
 description GERDAU_INT  | 2048K | SLS/IP/01985 | (SLS/IP/01985)
 bandwidth 2048
 encapsulation dot1Q 300
 ip vrf forwarding GERDAU_INT:3096
 ip address 10.242.51.1 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_A_2048K_8_0_59_17_0_2_13
 service-policy output QDO_A_2048K_8_0_59_17_0_2_13
!
interface GigabitEthernet4/0/0.301
 description CREFISA  | 512K | PHE/IP/00181 | (PHE/IP/00181) | BGP_AS65000
 bandwidth 512
 encapsulation dot1Q 301
 ip vrf forwarding CREFISA:5415
 ip address 200.172.10.121 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_N_512_V1
 service-policy output QPO_BBONE_512_V1
!
interface GigabitEthernet4/0/0.350
 description BCOAM  | 6144K | PHE/MULTI/61328 | (PHE/MULTI/61328)
 bandwidth 6144
 encapsulation dot1Q 350
 ip address 201.30.37.45 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_6144_V1
 service-policy output QPO_BBONE_6144_V1
!
interface GigabitEthernet4/0/1
 description LINK ETH | 1000M | SLSUSDM/SLSUSIT/1G/004 | DM4650-SLSUS-IS03-PLACA GPC PORTA 1  
 no ip address
 no ip directed-broadcast
 load-interval 30
 no negotiation auto
 no flowcontrol bidirectional
 no cdp enable
!
interface GigabitEthernet4/0/1.2
 description CEA  | 4096K | SLS/MULTI/58795 | (SLS/MULTI/58795)
 bandwidth 4096
 encapsulation dot1Q 2
 ip address 200.252.158.217 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_4096_V1
 service-policy output QPO_BBONE_4096_V1
!
interface GigabitEthernet4/0/1.3
 description TIJU FITNESS  | 4096K | SLS/MULTI/60716 | (SLS/MULTI/60716)
 bandwidth 4096
 encapsulation dot1Q 3
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 shutdown
 no cdp enable
 service-policy input QPI_BBONE_S_4096_V1
 service-policy output QPO_BBONE_4096_V1
!
interface GigabitEthernet4/0/1.4
 description TPES  | 1500K | SLS/VL/9838783700 | (SLS/VL/9838783700)
 bandwidth 1500
 encapsulation dot1Q 4
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.172.13.157 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_VIPSIP_VOZ_1500_V1
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet4/0/1.6
 description INAGRO  | 4096K | SLS/MULTI/49951 | (SLS/MULTI/49951)
 bandwidth 4096
 encapsulation dot1Q 6
 ip address 200.172.12.113 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_4096_V1
 service-policy output QPO_BBONE_4096_V1
!
interface GigabitEthernet4/0/1.13
 description FORMULA  | 4096K | SLS/MULTI/60717 | (SLS/MULTI/60717)
 bandwidth 4096
 encapsulation dot1Q 13
 ip address 200.172.10.189 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_4096_V1
 service-policy output QPO_BBONE_4096_V1
!
interface GigabitEthernet4/0/1.16
 description TELMEX_GRP  | 4096K | SLS/MULTI/58874 | (SLS/MULTI/58874) | BGP_AS63517
 bandwidth 4096
 encapsulation dot1Q 16
 ip vrf forwarding HONEY_INT_0:7013
 ip address 187.128.37.253 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 ip pim sparse-mode
 no cdp enable
 service-policy input QDI_TMX_4096K_PB24_L_A_V1
 service-policy output QDO_TMX_4096K_PB24_L_A_V1
!
interface GigabitEthernet4/0/1.26
 description SANTANDER  | 1500K | SLS/VL/9833115950 | (SLS/VL/9833115950)
 bandwidth 1500
 encapsulation dot1Q 26
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 201.30.37.49 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_VIPSIP_VOZ_1500_V1
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet4/0/1.27
 description CEF  | 1500K | CXS/VL/9930783050 | (CXS/VL/9930783050)
 bandwidth 1500
 encapsulation dot1Q 27
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.179.212.221 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_VIPSIP_VOZ_1500_V1
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet4/0/1.29
 description CEF | 1500K | PCL/VL/9832375066 | (PCL/VL/9832375066)
 bandwidth 1500
 encapsulation dot1Q 29
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.172.10.153 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet4/0/1.35
 description L D A COMERCIO  | 4096K | SLS/MULTI/51904 | (SLS/MULTI/51904)
 bandwidth 4096
 encapsulation dot1Q 35
 ip address 200.241.80.205 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_4096_V1
 service-policy output QPO_BBONE_4096_V1
!
interface GigabitEthernet4/0/1.42
 description T. G. V. DINIZ & CIA  | 10240K | PHE/MULTI/53057 | (PHE/MULTI/53057)
 bandwidth 10240
 encapsulation dot1Q 42
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 shutdown
 no cdp enable
 service-policy input QPI_BBONE_S_10240_V1
 service-policy output QPO_BBONE_10240_V1
!
interface GigabitEthernet4/0/1.50
 description CEF  | 1500K | PCL/VL/9832154800 | (PCL/VL/9832154800)
 bandwidth 1500
 encapsulation dot1Q 50
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.179.212.53 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet4/0/1.51
 description CAEMA  | 1500K | SLS/VL/9832323810 | (SLS/VL/9832323810)
 bandwidth 1500
 encapsulation dot1Q 51
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 201.30.37.77 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_VIPSIP_VOZ_1500_V1
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet4/0/1.57
 description DISTR. AUTOMOTORES BACABAL  | 4096K | BBL/MULTI/53075 | (BBL/MULTI/53075)
 bandwidth 4096
 encapsulation dot1Q 57
 ip address 201.30.37.145 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_4096_V1
 service-policy output QPO_BBONE_4096_V1
!
interface GigabitEthernet4/0/1.60
 description BNB  | 2048K | SLS/IP/05513 | (SLS/IP/05513)
 bandwidth 2048
 encapsulation dot1Q 60
 ip vrf forwarding BNB:5075
 ip address 201.30.37.101 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_A_2048K_21_0_35_20_0_2_21
 service-policy output QDO_A_2048K_21_0_35_20_0_2_21
!
interface GigabitEthernet4/0/1.63
 description SOL INFOR.  | 4096K | SLS/MULTI/54040 | (SLS/MULTI/54040)
 bandwidth 4096
 encapsulation dot1Q 63
 ip address 201.30.37.225 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_4096_V1
 service-policy output QPO_BBONE_4096_V1
!
interface GigabitEthernet4/0/1.67
 no ip directed-broadcast
 no cdp enable
!
interface GigabitEthernet4/0/1.71
 description ALE  | 1024K | ACD/IP/00033 | (ACD/IP/00033)
 bandwidth 1024
 encapsulation dot1Q 71
 ip vrf forwarding ALECOMBUST:1639
 ip address 200.249.169.145 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_A_1024K_19_0_38_13_0_2_27
 service-policy output QDO_A_1024K_19_0_38_13_0_2_27
!
interface GigabitEthernet4/0/1.88
 description CBE  | 1500K | SLS/VL/9838782800 | (SLS/VL/9838782800)
 bandwidth 1500
 encapsulation dot1Q 88
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.241.80.185 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_VIPSIP_VOZ_1500_V1
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet4/0/1.92
 description IMIFARMA  | 1024K | SJE/IP/00156 | (SJE/IP/00156) | BGP_AS65000
 bandwidth 1024
 encapsulation dot1Q 92
 ip vrf forwarding IMIFARMA_EXTRANET:155458
 ip address 201.45.220.29 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_A_1024K_3_0_30_16_4_2_44
 service-policy output QDO_A_1024K_3_0_30_16_4_2_44
!
interface GigabitEthernet4/0/1.97
 description BNB  | 1024K | CDO/IP/00163 | (CDO/IP/00163) | BGP_AS65000
 bandwidth 1024
 encapsulation dot1Q 97
 ip vrf forwarding BNB:5075
 ip address 201.30.37.69 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_A_1024K_22_0_36_22_0_2_17
 service-policy output QDO_A_1024K_22_0_36_22_0_2_17
!
interface GigabitEthernet4/0/1.105
 description SIAH  | 4096K | SLS/MULTI/53727 | (SLS/MULTI/53727)
 bandwidth 4096
 encapsulation dot1Q 105
 ip address 201.30.37.193 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_4096_V1
 service-policy output QPO_BBONE_4096_V1
!
interface GigabitEthernet4/0/1.106
 description CEA  | 2048K | SLS/IP/05535 | (SLS/IP/05535)
 bandwidth 2048
 encapsulation dot1Q 106
 ip address 201.30.37.209 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_2048_V1
 service-policy output QPO_BBONE_2048_V1
!
interface GigabitEthernet4/0/1.107
 description UCI  | 2048K | SLS/IP/05623 | (SLS/IP/05623)
 bandwidth 2048
 encapsulation dot1Q 107
 ip address 200.172.12.237 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_2048_V1
 service-policy output QPO_BBONE_2048_V1
!
interface GigabitEthernet4/0/1.111
 description TOCANTINS  | 1024K | SLS/IP/05849 | (SLS/IP/05849)
 bandwidth 1024
 encapsulation dot1Q 111
 ip address 200.172.13.237 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 shutdown
 no cdp enable
 service-policy input QPI_BBONE_S_1024_V1
 service-policy output QPO_BBONE_1024_V1
!
interface GigabitEthernet4/0/1.300
 description LIMATRANSPORTES  | 400K | SLS/VL/9832413734 | (SLS/VL/9832413734)
 bandwidth 400
 encapsulation dot1Q 300
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.241.80.169 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy output QDO_VIPSIP_VOZ_400_V1
!
interface GigabitEthernet4/0/1.305
 description CEF  | 1500K | SLS/VL/9833134550 | (SLS/VL/9833134550)
 bandwidth 1500
 encapsulation dot1Q 305
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.179.212.237 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_VIPSIP_VOZ_1500_V1
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet4/0/1.306
 description ITAU  | 1500K | SLS/VL/9833118750 | (SLS/VL/9833118750)
 bandwidth 1500
 encapsulation dot1Q 306
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.179.212.205 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_VIPSIP_VOZ_1500_V1
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet4/0/2
 no ip address
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 load-interval 30
 shutdown
 negotiation auto
 no cdp enable
 service-policy input QPI_BBONE_S_155000_V1
 service-policy output QPO_BBONE_155000_V1
!
interface GigabitEthernet4/0/3
 description LINK ETH | 450M | ITZ RC DM SLS US IT 450M 001 | DM4650-ITZRC-IS01 GPC 1
 bandwidth 450000
 no ip address
 no ip directed-broadcast
 load-interval 30
 no negotiation auto
 no flowcontrol bidirectional
 no cdp enable
!
interface GigabitEthernet4/0/3.2
 description MARIANO E CARNEIRO  | 4096K | ACD/MULTI/49495 | (ACD/MULTI/49495)
 bandwidth 4096
 encapsulation dot1Q 2
 ip address 200.172.10.137 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_4096_V1
 service-policy output QPO_BBONE_4096_V1
!
interface GigabitEthernet4/0/3.3
 description REFRIMA  | 2048K | ITZ/IP/00636 | (ITZ/IP/00636) | BGP_AS65317
 bandwidth 2048
 encapsulation dot1Q 3
 ip vrf forwarding SOLARBR:6759
 ip address 187.28.240.89 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_A_2048K_25_0_25_0_0_1_47
 service-policy output QDO_A_2048K_25_0_25_0_0_1_47
!
interface GigabitEthernet4/0/3.4
 description COMPANHIA ENERGETICA ESTREITO  | 10M | ETO/IP/00254 | (ETO/IP/00254)
 bandwidth 10000
 encapsulation dot1Q 4
 ip address 200.172.12.249 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_10000_V1
 service-policy output QPO_BBONE_10000_V1
!
interface GigabitEthernet4/0/3.5
 description IRACEMA  | 4096K | ITZ/MULTI/50450 | (ITZ/MULTI/50450)
 bandwidth 4096
 encapsulation dot1Q 5
 ip address 200.172.12.181 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_4096_V1
 service-policy output QPO_BBONE_4096_V1
!
interface GigabitEthernet4/0/3.7
 description ITAUNIBANCO  | 1024K | ITZ/IP/01317 | (ITZ/IP/01317) | BGP_AS65001
 bandwidth 1024
 encapsulation dot1Q 7
 ip vrf forwarding ITAUNIBANCO:6388
 ip address 201.30.37.41 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_A_1024K_10_24_20_0_40_2_3
 service-policy output QDO_A_1024K_10_24_20_0_40_2_3
!
interface GigabitEthernet4/0/3.8
 description HERBINORTE  | 4096K | ITZ/MULTI/52107 | (ITZ/MULTI/52107)
 bandwidth 4096
 encapsulation dot1Q 8
 ip address 201.30.37.33 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_4096_V1
 service-policy output QPO_BBONE_4096_V1
!
interface GigabitEthernet4/0/3.9
 description PROV TOCANTINSCUR  | 2048K | ITZ/MULTI/28639 | (ITZ/MULTI/28639)
 bandwidth 2048
 encapsulation dot1Q 9
 ip vrf forwarding REDEVIP_BLD_MLPPP:3799
 ip address 200.253.152.185 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no cdp enable
 service-policy input QDI_2048K_33_0_1_0_0_1_63
 service-policy output QDO_2048K_33_0_1_0_0_1_63
!
interface GigabitEthernet4/0/3.10
 description MOTOCA  | 4096K | ACD/MULTI/51290 | (ACD/MULTI/51290)
 bandwidth 4096
 encapsulation dot1Q 10
 ip address 200.172.10.53 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_4096_V1
 service-policy output QPO_BBONE_4096_V1
!
interface GigabitEthernet4/0/3.11
 description CARREFOUR  | 1024K | ITZ/IP/01347 | (ITZ/IP/01347) | BGP_AS65000
 bandwidth 1024
 encapsulation dot1Q 11
 ip vrf forwarding CARREFOUR:155715
 ip address 201.30.37.149 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_N_1024_V1
 service-policy output QPO_BBONE_1024_V1
!
interface GigabitEthernet4/0/3.12
 description VITRAL TEMPERA IND. E COM.  | 2048K | ACD/IP/00180 | (ACD/IP/00180) | BLK-SAIP-APEDIDO/20170713-1343/POR-DENISVM
 bandwidth 2048
 encapsulation dot1Q 12
 no ip directed-broadcast
 no ip proxy-arp
 shutdown
 no cdp enable
 service-policy input QPI_BBONE_S_2048_V1
 service-policy output QPO_BBONE_2048_V1
!
interface GigabitEthernet4/0/3.13
 description BNB  | 1024K | ACD/IP/00168 | (ACD/IP/00168) | BGP_AS65000
 bandwidth 1024
 encapsulation dot1Q 13
 ip vrf forwarding BNB:5075
 ip address 200.172.12.221 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_A_1024K_22_0_36_22_0_2_17
 service-policy output QDO_A_1024K_22_0_36_22_0_2_17
!
interface GigabitEthernet4/0/3.14
 description BNB  | 2048K | ITZ/IP/01237 | (ITZ/IP/01237) | BGP_AS65000
 bandwidth 2048
 encapsulation dot1Q 14
 ip vrf forwarding BNB:5075
 ip address 200.172.12.225 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_A_2048K_21_0_35_20_0_2_21
 service-policy output QDO_A_2048K_21_0_35_20_0_2_21
!
interface GigabitEthernet4/0/3.15
 description UNIHOSP  | 20M | ITZ/IP/01379 | (ITZ/IP/01379)
 bandwidth 20000
 encapsulation dot1Q 15
 ip address 189.52.211.33 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_20000_V1
 service-policy output QPO_BBONE_20000_V1
!
interface GigabitEthernet4/0/3.18
 description RODOBENS  | 4096K | ITZ/MULTI/14734 | (ITZ/MULTI/14734) | BGP_AS65072
 bandwidth 4096
 encapsulation dot1Q 18
 ip vrf forwarding RODOBENS:3379
 ip address 189.52.211.85 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_4096K_16_0_1_55_24_1_2
 service-policy output QDO_4096K_16_0_1_55_24_1_2
!
interface GigabitEthernet4/0/3.19
 description UMUARAMA VEICULOS  | 800K | ITZ/VL/9921018900 | (ITZ/VL/9921018900)
 bandwidth 800
 encapsulation dot1Q 19
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 201.45.220.13 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_VIPSIP_VOZ_800_V1
 service-policy output QDO_VIPSIP_VOZ_800_V1
!
interface GigabitEthernet4/0/3.20
 description ITZ/IP/00057  | 800K | ITZ/VL/9921010900 | (ITZ/VL/9921010900)
 bandwidth 800
 encapsulation dot1Q 20
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 201.45.220.65 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_VIPSIP_VOZ_800_V1
 service-policy output QDO_VIPSIP_VOZ_800_V1
!
interface GigabitEthernet4/0/3.21
 description JUPITER  | 1500K | ITZ/VL/9935293131 | (ITZ/VL/9935293131)
 bandwidth 1500
 encapsulation dot1Q 21
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 201.30.37.165 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet4/0/3.22
 description MOTOCAMOTORES  | 2048K | ITMH/IP/00018 | (ITMH/IP/00018) | BLK-SAIP-APEDIDO/2017109-201/POR-T3PER
 bandwidth 2048
 encapsulation dot1Q 22
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 shutdown
 no cdp enable
 service-policy input QPI_BBONE_S_2048_V1
 service-policy output QPO_BBONE_2048_V1
!
interface GigabitEthernet4/0/3.23
 description NACIONAL NOVA MARABA  | 4096K | ITZ/MULTI/59242 | (ITZ/MULTI/59242)
 bandwidth 4096
 encapsulation dot1Q 23
 ip address 200.172.12.9 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_4096_V1
 service-policy output QPO_BBONE_4096_V1
!
interface GigabitEthernet4/0/3.24
 description UNIMED IMPERATRIZ  | 800K | ITZ/VL/9921018700 | (ITZ/VL/9921018700)
 bandwidth 800
 encapsulation dot1Q 24
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.172.13.45 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_VIPSIP_VOZ_800_V1
 service-policy output QDO_VIPSIP_VOZ_800_V1
!
interface GigabitEthernet4/0/3.25
 description MOTOCAMOTORES  | 4096K | PFN/MULTI/59921 | (PFN/MULTI/59921)
 bandwidth 4096
 encapsulation dot1Q 25
 ip address 200.249.175.181 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_4096_V1
 service-policy output QPO_BBONE_4096_V1
!
interface GigabitEthernet4/0/3.26
 description LOCALIZA  | 4096K | ITZ/MULTI/60796 | (ITZ/MULTI/60796)
 bandwidth 4096
 encapsulation dot1Q 26
 ip address 200.241.80.33 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_4096_V1
 service-policy output QPO_BBONE_4096_V1
!
interface GigabitEthernet4/0/3.27
 description BCOAM  | 1024K | ACD/MULTI/24917 | (ACD/MULTI/24917)
 bandwidth 1024
 encapsulation dot1Q 27
 ip vrf forwarding BCOAM:4783
 ip address 200.252.158.121 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_1024K_11_0_50_13_13_2_10
 service-policy output QDO_1024K_11_0_50_13_13_2_10
!
interface GigabitEthernet4/0/3.28
 description ALPHA_COMERCIO  | 4096K | ITZ/IP/01344 | (ITZ/IP/01344)
 bandwidth 4096
 encapsulation dot1Q 28
 ip address 200.172.10.125 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_4096_V1
 service-policy output QPO_BBONE_4096_V1
!
interface GigabitEthernet4/0/3.29
 description CEF  | 1500K | ACD/VL/9933110370 | (ACD/VL/9933110370)
 bandwidth 1500
 encapsulation dot1Q 29
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 201.30.37.233 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_VIPSIP_VOZ_1500_V1
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet4/0/3.30
 description ITAUNIBANCO  | 1024K | ACD/IP/00185 | (ACD/IP/00185) | BGP_AS65001
 bandwidth 1024
 encapsulation dot1Q 30
 ip vrf forwarding ITAUNIBANCO:6388
 ip address 200.241.80.177 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_A_1024K_10_24_20_0_40_2_3
 service-policy output QDO_A_1024K_10_24_20_0_40_2_3
!
interface GigabitEthernet4/0/3.31
 description JORGE BATISTA  | 1024K | ITZ/IP/01248 | (ITZ/IP/01248) | BGP_AS65000
 bandwidth 1024
 encapsulation dot1Q 31
 ip vrf forwarding JORGEBATISTA:6562
 ip address 201.30.37.13 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_N_1024_V1
 service-policy output QPO_BBONE_1024_V1
!
interface GigabitEthernet4/0/3.32
 description UMUARAMA  | 800K | ITZ/VL/9933211100 | (ITZ/VL/9933211100)
 bandwidth 800
 encapsulation dot1Q 32
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 201.45.220.21 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_VIPSIP_VOZ_800_V1
 service-policy output QDO_VIPSIP_VOZ_800_V1
!
interface GigabitEthernet4/0/3.33
 description PROSEGUR_NOVA  | 2048K | ITZ/IP/01326 | (ITZ/IP/01326)
 bandwidth 2048
 encapsulation dot1Q 33
 ip address 200.172.10.149 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_2048_V1
 service-policy output QPO_BBONE_2048_V1
!
interface GigabitEthernet4/0/3.34
 description HERBINORTE  | 4096K | ITZ/IP/01358 | (ITZ/IP/01358)
 bandwidth 4096
 encapsulation dot1Q 34
 ip address 200.172.13.165 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_4096_V1
 service-policy output QPO_BBONE_4096_V1
!
interface GigabitEthernet4/0/3.35
 description BNB  | 1024K | PFN/IP/00111 | (PFN/IP/00111) | BGP_AS65000
 bandwidth 1024
 encapsulation dot1Q 35
 ip vrf forwarding BNB:5075
 ip address 201.30.37.57 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_A_1024K_22_0_36_22_0_2_17
 service-policy output QDO_A_1024K_22_0_36_22_0_2_17
!
interface GigabitEthernet4/0/3.37
 description BRADESCO  | 1500K | ITZ/VL/9933211770 | (ITZ/VL/9933211770)
 bandwidth 1500
 encapsulation dot1Q 37
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.172.12.13 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_VIPSIP_VOZ_1500_V1
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet4/0/3.38
 description BRASILTECIDOS  | 4096K | ITZ/MULTI/54039 | (ITZ/MULTI/54039)
 bandwidth 4096
 encapsulation dot1Q 38
 ip address 200.241.80.1 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_4096_V1
 service-policy output QPO_BBONE_4096_V1
!
interface GigabitEthernet4/0/3.39
 description JUPITER  | 1500K | ACD/VL/9933110000 | (ACD/VL/9933110000)
 bandwidth 1500
 encapsulation dot1Q 39
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.172.12.117 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_VIPSIP_VOZ_1500_V1
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet4/0/3.40
 description LOCALIZA  | 1024K | ITZ/IP/00035 | (ITZ/IP/00035) | BLK-SAIP-APEDIDO/20171128-949/POR-T3RCI
 bandwidth 1024
 encapsulation dot1Q 40
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 shutdown
 no cdp enable
 service-policy input QDI_A_1024K_7_0_48_19_12_4_9
 service-policy output QDO_A_1024K_7_0_48_19_12_4_9
!
interface GigabitEthernet4/0/3.42
 description BANCO_CSFSA  | 2048K | ITZ/IP/01376 | (ITZ/IP/01376) | BGP_AS65000
 bandwidth 2048
 encapsulation dot1Q 42
 ip vrf forwarding BANCO_CSFSA:7512
 ip address 200.172.13.249 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 bfd interval 150 min_rx 150 multiplier 3
 service-policy input QDI_A_2048K_5_0_15_45_15_2_17
 service-policy output QDO_A_2048K_5_0_15_45_15_2_17
!
interface GigabitEthernet4/0/3.43
 description GERDAU  | 1500K | ITZ/VL/9935249100 | (ITZ/VL/9935249100)
 bandwidth 1500
 encapsulation dot1Q 43
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.172.10.205 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_VIPSIP_VOZ_1500_V1
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet4/0/3.44
 description VOTORANTIM  | 1500K | ITZ/VL/9935828880 | (ITZ/VL/9935828880)
 bandwidth 1500
 encapsulation dot1Q 44
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 201.30.37.189 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_VIPSIP_VOZ_1500_V1
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet4/0/3.45
 description BRADESCO  | 1500K | ITZ/VL/9933212550 | (ITZ/VL/9933212550)
 bandwidth 1500
 encapsulation dot1Q 45
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.172.12.45 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_VIPSIP_VOZ_1500_V1
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet4/0/3.46
 description MOTAESILVA  | 4096K | ITZ/MULTI/59460 | (ITZ/MULTI/59460)
 bandwidth 4096
 encapsulation dot1Q 46
 ip address 189.23.68.17 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_4096_V1
 service-policy output QPO_BBONE_4096_V1
!
interface GigabitEthernet4/0/3.47
 description CEF  | 1500K | ITZ/VL/9935238020 | (ITZ/VL/9935238020)
 bandwidth 1500
 encapsulation dot1Q 47
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 201.30.37.113 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_VIPSIP_VOZ_1500_V1
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet4/0/3.48
 description MOTAESILVA  | 1500K | ITZ/VL/9932218450 | (ITZ/VL/9932218450)
 bandwidth 1500
 encapsulation dot1Q 48
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 201.30.37.9 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_VIPSIP_VOZ_1500_V1
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet4/0/3.49
 description INVICTA  | 1500K | ITZ/VL/9921018300 | (ITZ/VL/9921018300)
 bandwidth 1500
 encapsulation dot1Q 49
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.172.13.105 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_VIPSIP_VOZ_1500_V1
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet4/0/3.50
 description CEMAR  | 1024K | ITMH/IP/00138 | (ITMH/IP/00138)
 bandwidth 1024
 encapsulation dot1Q 50
 ip address 200.172.10.157 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_1024_V1
 service-policy output QPO_BBONE_1024_V1
!
interface GigabitEthernet4/0/3.51
 description PANTERA_MAQUINAS_LTDA  | 4096K | ITZ/MULTI/58799 | (ITZ/MULTI/58799)
 bandwidth 4096
 encapsulation dot1Q 51
 ip address 200.179.212.217 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_4096_V1
 service-policy output QPO_BBONE_4096_V1
!
interface GigabitEthernet4/0/3.53
 description VOTORANTIM  | 2048K | ITZ/IP/01264 | (ITZ/IP/01264) | BGP_AS64854
 bandwidth 2048
 encapsulation dot1Q 53
 ip vrf forwarding VOTORANTIM:4561
 ip address 200.241.80.165 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_A_2048K_9_25_29_14_0_2_20
 service-policy output QDO_A_2048K_9_25_29_14_0_2_20
!
interface GigabitEthernet4/0/3.54
 description PORTAL_MEDICA  | 400K | ITZ/VL/9921015777 | (ITZ/VL/9921015777)
 bandwidth 400
 encapsulation dot1Q 54
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.172.10.145 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy output QDO_VIPSIP_VOZ_400_V1
!
interface GigabitEthernet4/0/3.55
 description FERROVIA NORTE SUL S A  | 1500K | ITZ/VL/9935292600 | (ITZ/VL/9935292600)
 bandwidth 1500
 encapsulation dot1Q 55
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.241.80.85 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_VIPSIP_VOZ_1500_V1
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet4/0/3.56
 description DMARI_TRANSPORTES  | 4096K | ITZ/IP/01341 | (ITZ/IP/01341)
 bandwidth 4096
 encapsulation dot1Q 56
 ip address 200.172.10.21 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_4096_V1
 service-policy output QPO_BBONE_4096_V1
!
interface GigabitEthernet4/0/3.57
 description DMARI_TRANSPORTES  | 400K | ITZ/VL/9935251367 | (ITZ/VL/9935251367)
 bandwidth 400
 encapsulation dot1Q 57
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.172.10.61 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy output QDO_VIPSIP_VOZ_400_V1
!
interface GigabitEthernet4/0/3.58
 description ALPHA_COMERCIO  | 400K | ITZ/VL/9921015750 | (ITZ/VL/9921015750)
 bandwidth 400
 encapsulation dot1Q 58
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 201.45.220.5 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy output QDO_VIPSIP_VOZ_400_V1
!
interface GigabitEthernet4/0/3.59
 description CREDISHOP  | 2048K | ITZ/IP/00142 | (ITZ/IP/00142) | BGP_AS64518
 bandwidth 2048
 encapsulation dot1Q 59
 ip vrf forwarding CREDISHOP:1661
 ip address 189.53.11.69 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_A_2048K_7_0_4_0_0_2_86
 service-policy output QDO_A_2048K_7_0_4_0_0_2_86
!
interface GigabitEthernet4/0/3.60
 description FACCHINI  | 4096K | ITZ/MULTI/59617 | (ITZ/MULTI/59617)
 bandwidth 4096
 encapsulation dot1Q 60
 ip address 201.45.220.77 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_4096_V1
 service-policy output QPO_BBONE_4096_V1
!
interface GigabitEthernet4/0/3.61
 description CEF  | 1500K | ITZ/VL/9935296550 | (ITZ/VL/9935296550)
 bandwidth 1500
 encapsulation dot1Q 61
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.241.80.253 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet4/0/3.62
 description CEA  | 4096K | ITZ/MULTI/59434 | (ITZ/MULTI/59434)
 bandwidth 4096
 encapsulation dot1Q 62
 ip address 200.172.12.129 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_4096_V1
 service-policy output QPO_BBONE_4096_V1
!
interface GigabitEthernet4/0/3.63
 description CAEMA  | 1500K | ITZ/VL/9935297000 | (ITZ/VL/9935297000)
 bandwidth 1500
 encapsulation dot1Q 63
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.172.10.181 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_VIPSIP_VOZ_1500_V1
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet4/0/3.64
 description NADIAPAR | 4096K | ITZ/MULTI/55469 | (ITZ/MULTI/55469) | BLK-SAIP-APEDIDO/20170619-1410/POR-DENISVM 
 bandwidth 4096
 encapsulation dot1Q 64
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 shutdown
 no cdp enable
 service-policy input QPI_BBONE_S_4096_V1
 service-policy output QPO_BBONE_4096_V1
!
interface GigabitEthernet4/0/3.65
 description LASA_NOVA  | 2048K | ITZ/IP/01254 | (ITZ/IP/01254) | BGP_AS65316
 bandwidth 2048
 encapsulation dot1Q 65
 ip vrf forwarding LASA_NOVA:6236
 ip address 201.30.37.97 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_A_2048K_13_0_20_0_0_1_16
 service-policy output QDO_A_2048K_13_0_20_0_0_1_16
!
interface GigabitEthernet4/0/3.66
 description HERBINORTE  | 400K | ITZ/VL/9921015760 | (ITZ/VL/9921015760)
 bandwidth 400
 encapsulation dot1Q 66
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.241.80.121 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy output QDO_VIPSIP_VOZ_400_V1
!
interface GigabitEthernet4/0/3.67
 description RD_XAVIER  | 800K | ITZ/VL/9932218931 | (ITZ/VL/9932218931)
 bandwidth 800
 encapsulation dot1Q 67
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.172.12.93 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_VIPSIP_VOZ_800_V1
 service-policy output QDO_VIPSIP_VOZ_800_V1
!
interface GigabitEthernet4/0/3.68
 description UNISUMA  | 800K | ITZ/VL/9921010202 | (ITZ/VL/9921010202)
 bandwidth 800
 encapsulation dot1Q 68
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 201.30.37.133 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_VIPSIP_VOZ_800_V1
 service-policy output QDO_VIPSIP_VOZ_800_V1
!
interface GigabitEthernet4/0/3.69
 description VOLVO_APAVEL  | 2048K | ITZ/IP/00052 | (ITZ/IP/00052)
 bandwidth 2048
 encapsulation dot1Q 69
 ip vrf forwarding VOLVO_APAVEL:3193
 ip address 200.209.190.145 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_N_2048_V1
 service-policy output QPO_BBONE_2048_V1
!
interface GigabitEthernet4/0/3.70
 description BRADESCO  | 1500K | ITZ/VL/9921012381 | (ITZ/VL/9921012381)
 bandwidth 1500
 encapsulation dot1Q 70
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 201.30.37.125 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_VIPSIP_VOZ_1500_V1
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet4/0/3.71
 description ALPHA  | 1500K | ITZ/VL/9935299400 | (ITZ/VL/9935299400)
 bandwidth 1500
 encapsulation dot1Q 71
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 201.30.37.61 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_VIPSIP_VOZ_1500_V1
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet4/0/3.72
 description AUTOGIRO  | 1500K | ITZ/VL/9935241736 | (ITZ/VL/9935241736)
 bandwidth 1500
 encapsulation dot1Q 72
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 201.30.37.105 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_VIPSIP_VOZ_1500_V1
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet4/0/3.73
 description LASA_NOVA  | 2048K | ITZ/IP/01186 | (ITZ/IP/01186) | BGP_AS65316
 bandwidth 2048
 encapsulation dot1Q 73
 ip vrf forwarding LASA_NOVA:6236
 ip address 189.52.211.205 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_A_2048K_13_38_23_0_0_2_23
 service-policy output QDO_A_2048K_13_38_23_0_0_2_23
!
interface GigabitEthernet4/0/3.74
 description BRADESCO  | 1500K | ITZ/VL/9921012382 | (ITZ/VL/9921012382)
 bandwidth 1500
 encapsulation dot1Q 74
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.241.80.25 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_VIPSIP_VOZ_1500_V1
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet4/0/3.75
 description BRADESCO  | 1500K | ACD/VL/9933110031 | (ACD/VL/9933110031)
 bandwidth 1500
 encapsulation dot1Q 75
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.172.12.229 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_VIPSIP_VOZ_1500_V1
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet4/0/3.76
 description ACCOR  | 2048K | ITZ/IP/01274 | (ITZ/IP/01274) | BGP_AS65194
 bandwidth 2048
 encapsulation dot1Q 76
 ip vrf forwarding ACCOR:5074
 ip address 201.30.37.245 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_A_2048K_0_0_61_14_7_1_16
 service-policy output QDO_A_2048K_0_0_61_14_7_1_16
!
interface GigabitEthernet4/0/3.78
 description EBD  | 2048K | ITZ/IP/01276 | (ITZ/IP/01276)
 bandwidth 2048
 encapsulation dot1Q 78
 ip address 200.172.12.5 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_2048_V1
 service-policy output QPO_BBONE_2048_V1
!
interface GigabitEthernet4/0/3.79
 description CONFERMIL  | 800K | ITZ/VL/9935232306 | (ITZ/VL/9935232306)
 bandwidth 800
 encapsulation dot1Q 79
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.172.10.17 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_VIPSIP_VOZ_800_V1
 service-policy output QDO_VIPSIP_VOZ_800_V1
!
interface GigabitEthernet4/0/3.82
 description PLUGNORTE  | 1500K | ITZ/VL/9935259327 | (ITZ/VL/9935259327)
 bandwidth 1500
 encapsulation dot1Q 82
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.179.212.89 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_VIPSIP_VOZ_1500_V1
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet4/0/3.83
 description CERVEJARIA_PETROPOLIS  | 1500K | ITZ/VL/9921019191 | (ITZ/VL/9921019191)
 bandwidth 1500
 encapsulation dot1Q 83
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.172.13.29 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_VIPSIP_VOZ_1500_V1
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet4/0/3.84
 description UNIHOSP  | 1500K | ITZ/VL/9921017000 | (ITZ/VL/9921017000)
 bandwidth 1500
 encapsulation dot1Q 84
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 201.45.220.97 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_VIPSIP_VOZ_1500_V1
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet4/0/3.85
 description DVM  | 400K | ITZ/VL/9935828335 | (ITZ/VL/9935828335)
 bandwidth 400
 encapsulation dot1Q 85
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.172.13.209 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy output QDO_VIPSIP_VOZ_400_V1
!
interface GigabitEthernet4/0/3.86
 description AGU_MPLS  | 8000K | ITZ/IP/01258 | (ITZ/IP/01258) | BGP_AS65669
 bandwidth 8000
 encapsulation dot1Q 86
 ip vrf forwarding AGU_MPLS:6691
 ip address 200.172.10.233 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_A_8000K_20_30_0_0_0_1_46
 service-policy output QDO_A_8000K_20_30_0_0_0_1_46
!
interface GigabitEthernet4/0/3.87
 description MARIANO E CARNEIRO  | 800K | ITZ/VL/9921010400 | (ITZ/VL/9921010400)
 bandwidth 800
 encapsulation dot1Q 87
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.172.12.61 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_VIPSIP_VOZ_800_V1
 service-policy output QDO_VIPSIP_VOZ_800_V1
!
interface GigabitEthernet4/0/3.88
 description LOCALIZA  | 4096K | ITZ/MULTI/60834 | (ITZ/MULTI/60834)
 bandwidth 4096
 encapsulation dot1Q 88
 ip address 201.30.37.65 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_4096_V1
 service-policy output QPO_BBONE_4096_V1
!
interface GigabitEthernet4/0/3.90
 description N B R | 4096K | ITZ/MULTI/56817 | (ITZ/MULTI/56817) | BLK-SAIP-APEDIDO/20180109-1741/POR-T3DORT
 bandwidth 4096
 encapsulation dot1Q 90
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 shutdown
 no cdp enable
 service-policy input QPI_BBONE_S_4096_V1
 service-policy output QPO_BBONE_4096_V1
!
interface GigabitEthernet4/0/3.91
 description LOCALIA  | 1500K | ITZ/VL/9932218200 | (ITZ/VL/9932218200)
 bandwidth 1500
 encapsulation dot1Q 91
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 201.45.220.105 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_VIPSIP_VOZ_1500_V1
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet4/0/3.93
 description ARMATEUS  | 4096K | ETO/MULTI/61011 | (ETO/MULTI/61011) | BGP_AS65533
 bandwidth 4096
 encapsulation dot1Q 93
 ip vrf forwarding ARMATEUS:3394
 ip address 200.172.10.37 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_4096K_6_0_0_0_0_1_91
 service-policy output QDO_4096K_6_0_0_0_0_1_91
!
interface GigabitEthernet4/0/3.94
 description A C VERA FILHO  | 1500K | ITZ/VL/9930758536 | (ITZ/VL/9930758536)
 bandwidth 1500
 encapsulation dot1Q 94
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.172.12.165 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_VIPSIP_VOZ_1500_V1
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet4/0/3.95
 description BRASPRESS  | 2048K | ITZ/IP/00628 | (ITZ/IP/00628) | BGP_AS64981
 bandwidth 2048
 encapsulation dot1Q 95
 ip vrf forwarding BRASPRESS:4733
 ip address 187.29.255.29 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_N_2048_V1
 service-policy output QPO_BBONE_2048_V1
!
interface GigabitEthernet4/0/3.96
 description UNIMED IMPERATRIZ  | 10M | ITZ/IP/00589 | (ITZ/IP/00589)
 bandwidth 10000
 encapsulation dot1Q 96
 ip address 200.252.158.177 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_10000_V1
 service-policy output QPO_BBONE_10000_V1
!
interface GigabitEthernet4/0/3.101
 description MILENIUM_VEICULOS  | 10M | ITZ/IP/01323 | (ITZ/IP/01323)
 bandwidth 10000
 encapsulation dot1Q 101
 ip address 200.172.12.189 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_10000_V1
 service-policy output QPO_BBONE_10000_V1
!
interface GigabitEthernet4/0/3.102
 description CESTE  | 10M | ETO/IP/05571 | (ETO/IP/05571)
 bandwidth 10000
 encapsulation dot1Q 102
 ip address 200.167.41.117 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_10000_V1
 service-policy output QPO_BBONE_10000_V1
!
interface GigabitEthernet4/0/3.103
 description BBRASIL  | 16000K | ITZ/IP/01377 | (ITZ/IP/01377)
 bandwidth 16000
 encapsulation dot1Q 103
 ip address 200.172.12.245 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_16000_V1
 service-policy output QPO_BBONE_16000_V1
!
interface GigabitEthernet4/0/3.105
 description NACIONAL NOVA MARABA  | 1500K | ITZ/VL/9935292200 | (ITZ/VL/9935292200)
 bandwidth 1500
 encapsulation dot1Q 105
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.172.13.241 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_VIPSIP_VOZ_1500_V1
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet4/0/3.106
 description UNISUMA  | 20M | ITZ/IP/01339 | (ITZ/IP/01339)
 bandwidth 20000
 encapsulation dot1Q 106
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 shutdown
 no cdp enable
 service-policy input QPI_BBONE_S_20000_V1
 service-policy output QPO_BBONE_20000_V1
!
interface GigabitEthernet4/0/3.107
 description CRUZ E OLIVI  | 34000K | ITZ/IP/01277 | (ITZ/IP/01277)
 bandwidth 34000
 encapsulation dot1Q 107
 ip address 200.179.212.17 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_34000_V1
 service-policy output QPO_BBONE_34000_V1
!
interface GigabitEthernet4/0/3.108
 description CEFOR SEGURANCA  | 14000K | ITZ/IP/01195 | (ITZ/IP/01195)
 bandwidth 14000
 encapsulation dot1Q 108
 ip address 189.53.11.217 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_14000_V1
 service-policy output QPO_BBONE_14000_V1
!
interface GigabitEthernet4/0/3.110
 description FAMA  | 20M | ITZ/IP/01327 | (ITZ/IP/01327)
 bandwidth 20000
 encapsulation dot1Q 110
 ip address 200.172.10.97 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_20000_V1
 service-policy output QPO_BBONE_20000_V1
!
interface GigabitEthernet4/0/3.113
 description MOTOCA MOTORES  | 20M | ITZ/IP/01214 | (ITZ/IP/01214)
 bandwidth 20000
 encapsulation dot1Q 113
 ip address 200.249.175.245 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_20000_V1
 service-policy output QPO_BBONE_20000_V1
!
interface GigabitEthernet4/0/3.114
 description DPF_MPLS  | 4096K | ITZ/IP/01251 | (ITZ/IP/01251)
 bandwidth 4096
 encapsulation dot1Q 114
 ip vrf forwarding DPF_MPLS:6606
 ip address 201.30.37.197 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_A_4096K_10_30_35_0_0_1_22
 service-policy output QDO_A_4096K_10_30_35_0_0_1_22
!
interface GigabitEthernet4/0/3.116
 description ALPHA  | 10M | ITZ/IP/01369 | (ITZ/IP/01369)
 bandwidth 10000
 encapsulation dot1Q 116
 ip address 201.30.37.37 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_10000_V1
 service-policy output QPO_BBONE_10000_V1
!
interface GigabitEthernet4/0/3.118
 description BONASA  | 34000K | AGNP/IP/00103 | (AGNP/IP/00103)
 bandwidth 34000
 encapsulation dot1Q 118
 ip address 200.172.12.121 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_34000_V1
 service-policy output QPO_BBONE_34000_V1
!
interface GigabitEthernet4/0/3.119
 description MARIANO E CARNEIRO  | 10M | ITZ/IP/01291 | (ITZ/IP/01291)
 bandwidth 10000
 encapsulation dot1Q 119
 ip address 200.179.212.117 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_10000_V1
 service-policy output QPO_BBONE_10000_V1
!
interface GigabitEthernet4/0/3.121
 description CERVEJARIAPETROPOLIS  | 8000K | ITZ/IP/01306 | (ITZ/IP/01306)
 bandwidth 8000
 encapsulation dot1Q 121
 ip address 200.172.10.237 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_8000_V1
 service-policy output QPO_BBONE_8000_V1
!
interface GigabitEthernet4/0/3.122
 description NACIONAL NOVA MARABA  | 2048K | ITZ/IP/01305 | (ITZ/IP/01305)
 bandwidth 2048
 encapsulation dot1Q 122
 ip address 201.30.37.153 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_2048_V1
 service-policy output QPO_BBONE_2048_V1
!
interface GigabitEthernet4/0/3.125
 description MARIANO E CARNEIRO  | 1500K | ACD/VL/9935381066 | (ACD/VL/9935381066)
 bandwidth 1500
 encapsulation dot1Q 125
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.172.10.41 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_VIPSIP_VOZ_1500_V1
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet4/0/3.128
 description NACIONALGAS  | 2048K | ITZ/IP/00102 | (ITZ/IP/00102)
 bandwidth 2048
 encapsulation dot1Q 128
 ip vrf forwarding NACIONALGAS:3635
 ip address 201.45.138.229 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_A_2048K_7_0_50_0_13_2_27
 service-policy output QDO_A_2048K_7_0_50_0_13_2_27
!
interface GigabitEthernet4/0/3.129
 description SERPRO  | 2048K | ITZ/IP/01162 | (ITZ/IP/01162)
 bandwidth 2048
 encapsulation dot1Q 129
 ip vrf forwarding SERPRO_SLS_DNIT_05:5908
 ip address 10.218.15.17 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_SERPRO_2048K_V1
 service-policy output QDO_SERPRO_2048K_V1
!
interface GigabitEthernet4/0/3.133
 description NACIONALGAS  | 2048K | GVEL/IP/00002 | (GVEL/IP/00002) | BGP_AS65131
 bandwidth 2048
 encapsulation dot1Q 133
 ip vrf forwarding NACIONALGAS:3635
 ip address 200.253.152.1 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_A_2048K_7_0_50_0_13_2_27
 service-policy output QDO_A_2048K_7_0_50_0_13_2_27
!
interface GigabitEthernet4/0/3.141
 description AMBEV  | 2048K | ITZ/IP/01289 | (ITZ/IP/01289) | BGP_AS64636
 bandwidth 2048
 encapsulation dot1Q 141
 ip vrf forwarding BT_CBB:1851
 ip address 200.172.13.149 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_A_2048K_11_0_66_0_15_2_1
 service-policy output QDO_A_2048K_11_0_66_0_15_2_1
!
interface GigabitEthernet4/0/3.143
 description TRF1  | 6000K | ITZ/MULTI/57090 | (ITZ/MULTI/57090)
 bandwidth 6000
 encapsulation dot1Q 143
 ip vrf forwarding TRF1_FM:3152
 ip address 200.253.152.149 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_N_6000_V1
 service-policy output QPO_BBONE_6000_V1
!
interface GigabitEthernet4/0/3.144
 description MOTOCA MOTORES  | 4096K | ITMH/MULTI/60870 | (ITMH/MULTI/60870)
 bandwidth 4096
 encapsulation dot1Q 144
 ip address 201.30.37.93 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_4096_V1
 service-policy output QPO_BBONE_4096_V1
!
interface GigabitEthernet4/0/3.145
 description SOTREQ  | 2048K | ITZ/IP/00612 | (ITZ/IP/00612)
 bandwidth 2048
 encapsulation dot1Q 145
 ip vrf forwarding SOTREQ:2989
 ip address 200.253.132.49 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_A_2048K_6_18_3_5_8_1_10
 service-policy output QDO_A_2048K_6_18_3_5_8_1_10
!
interface GigabitEthernet4/0/3.146
 description ABNAMRO  | 2048K | ITZ/IP/01329 | (ITZ/IP/01329) | BGP_AS65069
 bandwidth 2048
 encapsulation dot1Q 146
 ip vrf forwarding SANTANDER_11:6872
 ip address 200.172.12.33 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_A_2048K_30_0_20_2_35_2_10
 service-policy output QDO_A_2048K_30_0_20_2_35_2_10
!
interface GigabitEthernet4/0/3.147
 description COSAN  | 2048K | ACD/MULTI/39211 | (ACD/MULTI/39211)
 bandwidth 2048
 encapsulation dot1Q 147
 ip vrf forwarding COSAN:4132
 ip address 200.249.169.37 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_2048K_13_0_56_0_0_1_29
 service-policy output QDO_2048K_13_0_56_0_0_1_29
!
interface GigabitEthernet4/0/3.148
 description LOCALIA  | 10M | ITZ/IP/01380 | (ITZ/IP/01380)
 bandwidth 10000
 encapsulation dot1Q 148
 ip address 200.172.10.117 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_10000_V1
 service-policy output QPO_BBONE_10000_V1
!
interface GigabitEthernet4/0/3.155
 description FAMA  | 1500K | ITZ/VL/9933212300 | (ITZ/VL/9933212300)
 bandwidth 1500
 encapsulation dot1Q 155
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.241.80.125 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_VIPSIP_VOZ_1500_V1
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet4/0/3.165
 description ECODRIVE  | 800K | ITZ/VL/9935253194 | (ITZ/VL/9935253194)
 bandwidth 800
 encapsulation dot1Q 165
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.172.12.69 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_VIPSIP_VOZ_800_V1
 service-policy output QDO_VIPSIP_VOZ_800_V1
!
interface GigabitEthernet4/0/3.166
 description BBRASIL_NAC  | 2048K | ITZ/IP/01208 | (ITZ/IP/01208) | BGP_AS65321
 bandwidth 2048
 encapsulation dot1Q 166
 ip vrf forwarding BBRASIL_NAC:7399
 ip address 10.66.206.97 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_2048K_BBrasil_NAC_IPSAN_GACC_V1
 service-policy output QDO_2048K_BBrasil_NAC_IPSAN_GACC_V1
!
interface GigabitEthernet4/0/3.167
 description J.S. DISTRIBUIDORA DE PECAS  | 2048K | ITZ/IP/01310 | (ITZ/IP/01310) | BGP_AS65000
 bandwidth 2048
 encapsulation dot1Q 167
 ip vrf forwarding JSDISTRIBUIDORA:7167
 ip address 200.172.12.177 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_A_2048K_20_30_34_0_0_2_13
 service-policy output QDO_A_2048K_20_30_34_0_0_2_13
!
interface GigabitEthernet4/0/3.201
 description CONAB  | 4096K | ITZ/IP/01314 | (ITZ/IP/01314) | BGP_AS65495
 bandwidth 4096
 encapsulation dot1Q 201
 ip vrf forwarding CONAB:4162
 ip address 200.172.10.33 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_A_4096K_19_6_25_16_25_1_7
 service-policy output QDO_A_4096K_19_6_25_16_25_1_7
!
interface GigabitEthernet4/0/3.210
 description CREDISHOP  | 4096K | ITZ/IP/01296 | (ITZ/IP/01296)
 bandwidth 4096
 encapsulation dot1Q 210
 ip address 200.172.13.1 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_4096_V1
 service-policy output QPO_BBONE_4096_V1
!
interface GigabitEthernet4/0/3.213
 description PORTAL_DA_AMAZONIA  | 10M | ITZ/IP/01363 | (ITZ/IP/01363)
 bandwidth 10000
 encapsulation dot1Q 213
 ip address 200.172.10.101 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_10000_V1
 service-policy output QPO_BBONE_10000_V1
!
interface GigabitEthernet4/0/3.216
 description PLUGNORTE  | 4096K | ITZ/IP/01368 | (ITZ/IP/01368)
 bandwidth 4096
 encapsulation dot1Q 216
 ip address 200.172.13.233 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_4096_V1
 service-policy output QPO_BBONE_4096_V1
!
interface GigabitEthernet4/0/3.217
 description AUTOGIRO  | 4096K | ITZ/IP/01365 | (ITZ/IP/01365)
 bandwidth 4096
 encapsulation dot1Q 217
 ip address 200.241.80.17 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_4096_V1
 service-policy output QPO_BBONE_4096_V1
!
interface GigabitEthernet4/0/3.219
 description MPU  | 6000K | ITZ/IP/01172 | (ITZ/IP/01172)
 bandwidth 6000
 encapsulation dot1Q 219
 ip vrf forwarding MPF_NOVA:6114
 ip address 192.168.34.41 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 ip pim sparse-mode
 no cdp enable
 service-policy input QDI_A_6000K_41_0_36_0_0_2_20
 service-policy output QDO_A_6000K_41_0_36_0_0_2_20
!
interface GigabitEthernet4/0/3.220
 description IBI_LOJAS  | 1024K | ITZ/IP/00192 | (ITZ/IP/00192) | BLK-SAIP-APEDIDO/20170331-1536/POR-ESIMMEL
 bandwidth 1024
 encapsulation dot1Q 220
 no ip directed-broadcast
 no ip proxy-arp
 shutdown
 no cdp enable
 service-policy input QDI_A_1024K_0_0_0_83_0_2_13
 service-policy output QDO_A_1024K_0_0_0_83_0_2_13
!
interface GigabitEthernet4/0/3.221
 description UMUARAMA VEICULOS  | 10M | ITZ/IP/01307 | (ITZ/IP/01307)
 bandwidth 10000
 encapsulation dot1Q 221
 ip address 201.45.220.1 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_10000_V1
 service-policy output QPO_BBONE_10000_V1
!
interface GigabitEthernet4/0/3.222
 description MAQUISUL  | 10M | ITZ/IP/01242 | (ITZ/IP/01242)
 bandwidth 10000
 encapsulation dot1Q 222
 ip address 200.241.80.193 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_10000_V1
 service-policy output QPO_BBONE_10000_V1
!
interface GigabitEthernet4/0/3.223
 description UMUARAMA MOTORS  | 10M | ITZ/IP/01316 | (ITZ/IP/01316)
 bandwidth 10000
 encapsulation dot1Q 223
 ip address 200.172.12.57 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_10000_V1
 service-policy output QPO_BBONE_10000_V1
!
interface GigabitEthernet4/0/3.224
 description BANCO_DO_BRASIL_SA  | 16000K | ITZ/IP/01370 | (ITZ/IP/01370)
 bandwidth 16000
 encapsulation dot1Q 224
 ip address 201.30.37.21 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_16000_V1
 service-policy output QPO_BBONE_16000_V1
!
interface GigabitEthernet4/0/3.226
 description MSMA  | 10M | ITZ/IP/00036 | (ITZ/IP/00036)
 bandwidth 10000
 encapsulation dot1Q 226
 ip address 200.172.11.73 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_10000_V1
 service-policy output QPO_BBONE_10000_V1
!
interface GigabitEthernet4/0/3.227
 description LINX TELECOMUNICACOES  | 6000K | ITZ/IP/01392 | (ITZ/IP/01392)
 bandwidth 6000
 encapsulation dot1Q 227
 ip address 201.45.220.117 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 shutdown
 no cdp enable
 service-policy input QPI_BBONE_S_6000_V1
 service-policy output QPO_BBONE_6000_V1
!
interface GigabitEthernet4/0/3.300
 description CEF  | 1500K | ITZ/VL/9932217415 | (ITZ/VL/9932217415)
 bandwidth 1500
 encapsulation dot1Q 300
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.172.10.161 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_VIPSIP_VOZ_1500_V1
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet4/0/3.301
 description NACIONAL NOVA MARABA  | 1500K | ITZ/VL/9921018555 | (ITZ/VL/9921018555)
 bandwidth 1500
 encapsulation dot1Q 301
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 200.179.212.245 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 shutdown
 no cdp enable
 service-policy input QDI_VIPSIP_VOZ_1500_V1
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet4/0/3.302
 description MAQUISUL  | 1500K | ITZ/VL/9921013555 | (ITZ/VL/9921013555)
 bandwidth 1500
 encapsulation dot1Q 302
 ip vrf forwarding REALIP_CLIENTE:5581
 ip address 201.45.220.53 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_VIPSIP_VOZ_1500_V1
 service-policy output QDO_VIPSIP_VOZ_1500_V1
!
interface GigabitEthernet4/0/3.310
 description ENTREPOSTO COMERCIAL  | 10M | ITZ/IP/01351 | (ITZ/IP/01351)
 bandwidth 10000
 encapsulation dot1Q 310
 ip address 200.172.13.113 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_10000_V1
 service-policy output QPO_BBONE_10000_V1
!
interface GigabitEthernet4/0/3.311
 description DVM  | 4096K | ITZ/IP/01354 | (ITZ/IP/01354)
 bandwidth 4096
 encapsulation dot1Q 311
 ip address 200.172.13.193 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_4096_V1
 service-policy output QPO_BBONE_4096_V1
!
interface GigabitEthernet4/0/3.315
 description CEMAR  | 100M | ITZ/IP/01119 | (ITZ/IP/01119) | BGP_AS64707
 bandwidth 100000
 encapsulation dot1Q 315
 ip vrf forwarding CEMAR:3468
 ip address 200.241.80.97 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_A_100000K_1_0_0_0_0_1_96
 service-policy output QDO_A_100000K_1_0_0_0_0_1_96
!
interface GigabitEthernet4/0/3.350
 description BCOAM  | 1024K | ITZ/IP/01388 | (ITZ/IP/01388)
 bandwidth 1024
 encapsulation dot1Q 350
 ip vrf forwarding BCOAM:4783
 ip address 201.45.220.121 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 shutdown
 no cdp enable
 service-policy input QDI_A_1024K_12_0_34_25_18_2_8
 service-policy output QDO_A_1024K_12_0_34_25_18_2_8
!
interface GigabitEthernet4/0/3.369
 description GERDAU_INT  | 2048K | ITZ/IP/00236 | (ITZ/IP/00236)
 bandwidth 2048
 encapsulation dot1Q 369
 ip vrf forwarding GERDAU_INT:3096
 ip address 10.241.25.1 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_A_2048K_8_0_59_17_0_2_13
 service-policy output QDO_A_2048K_8_0_59_17_0_2_13
!
interface GigabitEthernet4/0/3.906
 description RCC_CLARO_MPLS1  | 14000K | ITZ/IP/01330 | (ITZ/IP/01330) | BGP_AS65508
 bandwidth 14000
 encapsulation dot1Q 906
 ip vrf forwarding RCC_CLARO_MPLS1:6254
 ip address 189.53.246.161 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_A_14000K_0_7_15_15_20_2_40
 service-policy output QDO_A_14000K_0_7_15_15_20_2_40
!
interface GigabitEthernet4/0/3.907
 description TRACTEBELENERGIA  | 10M | ETO/IP/00241 | (ETO/IP/00241) | BGP_AS65000
 bandwidth 10000
 encapsulation dot1Q 907
 ip vrf forwarding TRACTEBEL:4977
 ip address 187.29.255.105 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_A_10000K_8_16_52_0_0_2_21
 service-policy output QDO_A_10000K_8_16_52_0_0_2_21
!
interface GigabitEthernet4/0/3.908
 description RCC_PRY_MPLS1  | 14000K | ITZ/IP/01334 | (ITZ/IP/01334) | BGP_AS65508
 bandwidth 14000
 encapsulation dot1Q 908
 ip vrf forwarding RCC_PRY_MPLS1:6256
 ip address 189.53.246.253 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_A_14000K_0_7_15_15_20_2_40
 service-policy output QDO_A_14000K_0_7_15_15_20_2_40
!
interface GigabitEthernet4/0/3.910
 description RCC_AMX_CORP_VOZ  | 12000K | ITZ/IP/01333 | (ITZ/IP/01333) | BGP_AS65508
 bandwidth 12000
 encapsulation dot1Q 910
 ip vrf forwarding RCC_AMX_CORP_VOZ:7346
 ip address 189.53.11.221 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_N_12000_V1
 service-policy output QPO_BBONE_12000_V1
!
interface GigabitEthernet4/0/3.911
 description RCC_AMX_CORP  | 40M | ITZ/IP/01331 | (ITZ/IP/01331) | BGP_AS65508
 bandwidth 40000
 encapsulation dot1Q 911
 ip vrf forwarding RCC_AMX_CORP:7361
 ip address 189.53.11.29 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QDI_A_40000K_6_11_16_16_21_1_28
 service-policy output QDO_A_40000K_6_11_16_16_21_1_28
!
interface GigabitEthernet4/0/3.912
 description CONFERMIL  | 4096K | ITZ/IP/01355 | (ITZ/IP/01355)
 bandwidth 4096
 encapsulation dot1Q 912
 ip address 200.172.13.133 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no cdp enable
 service-policy input QPI_BBONE_S_4096_V1
 service-policy output QPO_BBONE_4096_V1
!
interface GigabitEthernet4/0/3.991
 description RCC_RUN_MPLS1  | 14000K | ITZ/IP/01332 | (ITZ/IP/01332) | BGP_AS65508
 bandwidth 14000
 encapsulation dot1Q 991
 ip vrf forwarding RCC_RUN_MPLS1:4455
 ip address 200.252.158.117 255.255.255.252
 no ip directed-broadcast
 no ip proxy-arp
 ip pim sparse-mode
 no cdp enable
 service-policy input QDI_A_14000K_16_37_14_14_14_2_2
 service-policy output QDO_A_14000K_16_37_14_14_14_2_2
!
interface GigabitEthernet4/0/4
 description ARMAZEMMATEUS  | 200M | SLS/IP/05567 | (SLS/IP/05567)
 bandwidth 200000
 ip address 201.30.37.117 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 no negotiation auto
 no cdp enable
 service-policy input QPI_BBONE_S_200000_V1
 service-policy output QPO_BBONE_200000_V1
!
interface FastEthernet4/1/0
 description RESERVADO PARA ADM100M | ROGERIO | 521-3113 | 27/06/2012
 no ip address
 no ip directed-broadcast
 shutdown
 negotiation auto
 no cdp enable
!
interface FastEthernet4/1/1
 description RESERVADO PARA ADM100M | ROGERIO | 521-3113 | 27/06/2012
 no ip address
 no ip directed-broadcast
 shutdown
 negotiation auto
 no cdp enable
!
interface FastEthernet4/1/2
 description RESERVADO PARA ADM100M | ROGERIO | 521-3113 | 27/06/2012
 no ip address
 no ip directed-broadcast
 shutdown
 negotiation auto
 no cdp enable
!
interface FastEthernet4/1/3
 description RESERVADO PARA ADM100M | ROGERIO | 521-3113 | 27/06/2012
 no ip address
 no ip directed-broadcast
 shutdown
 negotiation auto
 no cdp enable
!
interface FastEthernet4/1/4
 description RESERVADO PARA ADM100M | ROGERIO | 521-3113 | 27/06/2012
 no ip address
 no ip directed-broadcast
 shutdown
 negotiation auto
 no cdp enable
!
interface FastEthernet4/1/5
 description RESERVADO PARA ADM100M | ROGERIO | 521-3113 | 27/06/2012
 no ip address
 no ip directed-broadcast
 shutdown
 negotiation auto
 no cdp enable
!
interface FastEthernet4/1/6
 no ip address
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 shutdown
 negotiation auto
 no cdp enable
 service-policy input QPI_BBONE_S_50000_V1
 service-policy output QPO_BBONE_50000_V1
!
interface FastEthernet4/1/7
 description APAE_MA  | 34000K | SLS/IP/05034 | (SLS/IP/05034)
 bandwidth 34000
 ip address 200.249.175.173 255.255.255.252
 ip verify unicast source reachable-via any allow-self-ping
 no ip directed-broadcast
 no ip proxy-arp
 load-interval 30
 no negotiation auto
 no cdp enable
 service-policy input QPI_BBONE_S_34000_V1
 service-policy output QPO_BBONE_34000_V1
!
interface GigabitEthernet6/0/0
 description Ligacao SW01.SLS | 1000M | SLS/GIGA/015 | (porta 1/7 do sw01.sls)  | (PORT-CHANNEL)
 negotiation auto
 channel-group 1
!
interface GigabitEthernet6/0/1
 description Ligacao SW01.SLS | 1000M | SLS/GIGA/017 | (porta 1/8 do sw01.sls) | (PORT-CHANNEL)
 negotiation auto
 channel-group 1
!
interface GigabitEthernet6/0/2
 description Ligacao SW01.SLS | 1000M | SLSUSIT/SLSUSIT/1G/013 | (porta 1/9 do sw01.sls)  | (PORT-CHANNEL)
 negotiation auto
 channel-group 1
!
interface GigabitEthernet6/0/3
 description RESERVADO PARA BACKBONE IP | ROGERIO GALEAZZI | 521-3113 | 18/02/2010
 no ip address
 no ip directed-broadcast
 shutdown
 negotiation auto
!
interface GigabitEthernet6/0/4
 description RESERVADO PARA BACKBONE IP | ROGERIO GALEAZZI | 521-3113 | 18/02/2010
 no ip address
 no ip directed-broadcast
 shutdown
 negotiation auto
!
interface GigabitEthernet7/0/0
 description Ligacao SW02.SLS | 1000M | SLS/GIGA/016 | (porta 1/7 do sw02.sls)  | (PORT-CHANNEL)
 negotiation auto
 channel-group 2
 no cdp enable
!
interface GigabitEthernet7/0/1
 description Ligacao SW02.SLS | 1000M | SLS/GIGA/028 | (porta 1/8 do sw02.sls)  | (PORT-CHANNEL)
 negotiation auto
 channel-group 2
 no cdp enable
!
interface GigabitEthernet7/0/2
 description Ligacao SW02.SLS | 1000M | SLSUSIT/SLSUSIT/1G/014 | (porta 1/9 do sw02.sls)  | (PORT-CHANNEL)
 negotiation auto
 channel-group 2
 no cdp enable
!
interface GigabitEthernet7/0/3
 description RESERVADO PARA BACKBONE IP | ROGERIO GALEAZZI | 521-3113 | 18/02/2010
 no ip address
 no ip directed-broadcast
 shutdown
 negotiation auto
!
interface GigabitEthernet7/0/4
 description RESERVADO PARA BACKBONE IP | ROGERIO GALEAZZI | 521-3113 | 18/02/2010
 no ip address
 no ip directed-broadcast
 shutdown
 negotiation auto
!
interface Ethernet0
 description Ligacao OOB | 10M | (Interface para acesso out-of-band aos gigarouters)
 ip address 10.201.98.30 255.255.255.0
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
!
interface Ethernet2
 no ip address
 no ip directed-broadcast
 no ip route-cache
 no ip mroute-cache
 shutdown
!
router ospf 21
 router-id 200.244.29.65
 log-adjacency-changes detail
 limit retransmissions non-dc disable
 nsf cisco
 mpls ldp sync
 timers throttle spf 50 50 2000
 timers throttle lsa all 0 20 2000
 timers lsa arrival 20
 timers pacing flood 25
 timers pacing retransmission 30
 redistribute maximum-prefix 20000 85 warning-only
 redistribute ospf 999 subnets route-map FROM_OS_999_TO_OS_BB
 network 200.244.29.0 0.0.0.255 area 98
 network 200.244.63.64 0.0.0.31 area 98
 network 200.244.63.96 0.0.0.31 area 98
 maximum-paths 8
!
router ospf 999
 router-id 200.230.92.6
 log-adjacency-changes
 mpls ldp sync
 mpls ldp autoconfig
 timers throttle spf 50 50 2000
 timers lsa arrival 20
 timers pacing flood 25
 timers pacing retransmission 30
 redistribute ospf 21 metric 999 subnets tag 9999 match internal route-map NGN_ONLY
 network 200.230.91.6 0.0.0.0 area 999
 network 200.230.92.6 0.0.0.0 area 999
 distance 111
!
router rip
 version 2
 !
 address-family ipv4 vrf VOLVO_APAVEL:3193
 version 2
 redistribute bgp 4230 metric transparent
 network 200.209.190.0
 no auto-summary
 exit-address-family
!
router bgp 4230
 bgp router-id 200.244.29.65
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
 neighbor DEFAULT-ROUTE_BGP-LIGHT peer-group
 neighbor PARTIAL-ROUTING peer-group
 neighbor 172.18.40.2 remote-as 65507
 neighbor 177.91.52.1 remote-as 263430
 neighbor 177.91.52.1 description SLS/IP/05108
 neighbor 177.91.52.1 ebgp-multihop 5
 neighbor 189.53.11.82 remote-as 53212
 neighbor 189.53.11.82 peer-group PARTIAL-ROUTING
 neighbor 189.53.11.82 description ITZ/IP/01142
 neighbor 189.53.11.246 remote-as 65348
 neighbor 189.53.11.246 description BLA/MULTI/57212
 neighbor 200.167.148.2 remote-as 65523
 neighbor 200.167.148.2 peer-group DEFAULT-ROUTE_BGP-LIGHT
 neighbor 200.172.10.2 remote-as 266161
 neighbor 200.172.10.2 peer-group PARTIAL-ROUTING
 neighbor 200.172.10.2 description SLS/IP/04771 | BGP FULL RSERV01.BHE
 neighbor 200.172.10.2 ebgp-multihop 5
 neighbor 200.172.11.126 remote-as 264262
 neighbor 200.172.11.126 peer-group PARTIAL-ROUTING
 neighbor 200.172.11.126 description ITMH/IP/00124 | BGP FULL RSERV01.SPO
 neighbor 200.172.11.126 shutdown
 neighbor 200.172.11.126 ebgp-multihop 5
 neighbor 200.241.80.86 remote-as 28573
 neighbor 200.241.80.86 shutdown
 neighbor 200.244.28.30 remote-as 4230
 neighbor 200.244.28.30 description VRR01.FLA
 neighbor 200.244.28.30 update-source Loopback0
 neighbor 200.244.28.32 remote-as 4230
 neighbor 200.244.28.32 description VRR01.SDR
 neighbor 200.244.28.32 update-source Loopback0
 neighbor 200.244.41.104 peer-group IBGP_FULL
 neighbor 200.244.41.105 peer-group IBGP_FULL
 neighbor 201.30.37.62 remote-as 28573
 neighbor 201.30.37.62 shutdown
 neighbor 201.30.37.138 remote-as 65371
 neighbor 201.30.37.138 description ITI/IP/00121
 !
 address-family ipv4
 redistribute connected route-map CONNECTED
 redistribute static route-map STATIC
 neighbor IBGP_FULL activate
 neighbor IBGP_FULL send-community
 neighbor IBGP_FULL next-hop-self
 neighbor IBGP_FULL route-map RR_IPV4_IN in
 neighbor DEFAULT-ROUTE_BGP-LIGHT activate
 neighbor DEFAULT-ROUTE_BGP-LIGHT default-originate
 neighbor DEFAULT-ROUTE_BGP-LIGHT remove-private-as
 neighbor DEFAULT-ROUTE_BGP-LIGHT route-map NO-ROUTES_OUT out
 neighbor PARTIAL-ROUTING activate
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
 neighbor 189.53.11.82 peer-group PARTIAL-ROUTING
 neighbor 189.53.11.82 route-map ZUNET_IN in
 neighbor 189.53.11.82 maximum-prefix 5000 90
 neighbor 200.167.148.2 peer-group DEFAULT-ROUTE_BGP-LIGHT
 neighbor 200.167.148.2 route-map SAM_DADOS_IN in
 neighbor 200.172.10.2 peer-group PARTIAL-ROUTING
 neighbor 200.172.10.2 route-map CEUMA_IN in
 neighbor 200.172.10.2 maximum-prefix 200 85
 neighbor 200.172.11.126 peer-group PARTIAL-ROUTING
 neighbor 200.172.11.126 route-map MC_QUARESMA_IN in
 neighbor 200.172.11.126 maximum-prefix 200 85
 neighbor 200.241.80.86 activate
 neighbor 200.241.80.86 default-originate route-map COND_DEFAULT
 neighbor 200.241.80.86 remove-private-as
 neighbor 200.241.80.86 distribute-list 1 in
 neighbor 200.241.80.86 route-map CLIENTES_IPv4_RANGE_PROPRIO_COMMON_POLICY_IN in
 neighbor 200.241.80.86 route-map NO-ROUTES_OUT out
 neighbor 200.241.80.86 maximum-prefix 200 85
 neighbor 200.241.80.86 filter-list 106 in
 neighbor 200.244.41.104 peer-group IBGP_FULL
 neighbor 200.244.41.105 peer-group IBGP_FULL
 neighbor 201.30.37.62 activate
 neighbor 201.30.37.62 default-originate route-map COND_DEFAULT
 neighbor 201.30.37.62 remove-private-as
 neighbor 201.30.37.62 distribute-list 1 in
 neighbor 201.30.37.62 route-map CLIENTES_IPv4_RANGE_PROPRIO_COMMON_POLICY_IN in
 neighbor 201.30.37.62 route-map NO-ROUTES_OUT out
 neighbor 201.30.37.62 maximum-prefix 200 85
 neighbor 201.30.37.62 filter-list 106 in
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
 neighbor 189.23.28.134 remote-as 65371
 neighbor 189.23.28.134 description SLS/IP/00529
 neighbor 189.23.28.134 activate
 neighbor 189.23.28.134 send-community both
 neighbor 201.30.37.138 remote-as 65371
 neighbor 201.30.37.138 description ITI/IP/00121
 neighbor 201.30.37.138 activate
 neighbor 201.30.37.138 send-community both
 neighbor 201.45.138.170 remote-as 65371
 neighbor 201.45.138.170 description SLS/IP/00523
 neighbor 201.45.138.170 activate
 neighbor 201.45.138.170 send-community both
 neighbor 201.45.138.202 remote-as 65371
 neighbor 201.45.138.202 description SLS/IP/00522
 neighbor 201.45.138.202 activate
 neighbor 201.45.138.202 send-community both
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf VOTORANTIM:4561
 redistribute connected
 redistribute static
 neighbor 200.241.80.166 remote-as 64854
 neighbor 200.241.80.166 description ITZ/IP/01264
 neighbor 200.241.80.166 activate
 neighbor 200.241.80.166 send-community both
 maximum-paths eibgp 2
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
 address-family ipv4 vrf UNIEURO:5509
 redistribute connected
 redistribute static
 neighbor 187.28.240.254 remote-as 65010
 neighbor 187.28.240.254 description SLS/IP/04766
 neighbor 187.28.240.254 activate
 neighbor 187.28.240.254 send-community both
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf UNICRED:1647
 redistribute connected
 redistribute static
 neighbor 200.172.11.22 remote-as 65007
 neighbor 200.172.11.22 description SLS/IP/04812
 neighbor 200.172.11.22 activate
 neighbor 200.172.11.22 send-community both
 neighbor 200.209.190.114 remote-as 65007
 neighbor 200.209.190.114 description SLS/IP/03734
 neighbor 200.209.190.114 activate
 neighbor 200.209.190.114 send-community both
 neighbor 201.39.88.78 remote-as 65023
 neighbor 201.39.88.78 description SLS/IP/03736
 neighbor 201.39.88.78 activate
 neighbor 201.39.88.78 send-community both
 maximum-paths eibgp 2
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf TVGLOBO_NOVA:2610
 redistribute connected
 redistribute static
 maximum-paths eibgp 2
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf TRF1_FM:3152
 redistribute connected
 redistribute static
 neighbor 189.53.11.246 remote-as 65348
 neighbor 189.53.11.246 activate
 neighbor 189.53.11.246 send-community both
 neighbor 200.253.152.150 remote-as 65348
 neighbor 200.253.152.150 description ITZ/MULTI/57090
 neighbor 200.253.152.150 activate
 neighbor 200.253.152.150 send-community both
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf TRANSITA:1295
 redistribute connected
 redistribute static
 neighbor 200.209.190.138 remote-as 64589
 neighbor 200.209.190.138 description SLS/IP/00206
 neighbor 200.209.190.138 activate
 neighbor 200.209.190.138 send-community both
 neighbor 201.30.37.250 remote-as 64589
 neighbor 201.30.37.250 description SIS/IP/00199
 neighbor 201.30.37.250 activate
 neighbor 201.30.37.250 send-community both
 maximum-paths eibgp 2
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf TRACTEBEL:4977
 redistribute connected
 redistribute static
 neighbor 187.29.255.106 remote-as 65000
 neighbor 187.29.255.106 description ETO/IP/00241
 neighbor 187.29.255.106 activate
 neighbor 187.29.255.106 send-community both
 maximum-paths eibgp 2
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf TEXACO:4523
 redistribute connected
 redistribute static
 neighbor 189.53.11.182 remote-as 64830
 neighbor 189.53.11.182 description ACD/IP/00041
 neighbor 189.53.11.182 activate
 neighbor 189.53.11.182 send-community both
 maximum-paths eibgp 3
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
 neighbor 187.28.240.110 remote-as 65216
 neighbor 187.28.240.110 description SLS/MULTI/31731
 neighbor 187.28.240.110 activate
 neighbor 187.28.240.110 send-community both
 neighbor 200.172.10.66 remote-as 65216
 neighbor 200.172.10.66 description SLS/MULTI/55910
 neighbor 200.172.10.66 activate
 neighbor 200.172.10.66 send-community both
 default-information originate
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf SOTREQ:2989
 redistribute connected
 redistribute static
 neighbor 200.253.132.50 remote-as 64565
 neighbor 200.253.132.50 description ITZ/IP/00612
 neighbor 200.253.132.50 activate
 neighbor 200.253.132.50 send-community both
 maximum-paths eibgp 2
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf SOLARBR:6759
 redistribute connected
 redistribute static
 neighbor 187.28.240.90 remote-as 65317
 neighbor 187.28.240.90 description ITZ/IP/00636
 neighbor 187.28.240.90 activate
 neighbor 187.28.240.90 send-community both
 neighbor 200.241.80.238 remote-as 64966
 neighbor 200.241.80.238 description SLS/IP/05668
 neighbor 200.241.80.238 activate
 neighbor 200.241.80.238 send-community both
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf SHV_GAS:3469
 redistribute connected
 redistribute static
 neighbor 200.253.132.122 remote-as 65106
 neighbor 200.253.132.122 description SLS/MULTI/06434
 neighbor 200.253.132.122 activate
 neighbor 200.253.132.122 send-community both
 maximum-paths eibgp 3
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf SGNET:1835
 redistribute connected route-map LATAM_TELMEX_285_SG
 redistribute static route-map LATAM_TELMEX_285_SG
 neighbor 200.252.158.174 remote-as 65314
 neighbor 200.252.158.174 description SLS/IP/04902
 neighbor 200.252.158.174 activate
 neighbor 200.252.158.174 send-community both
 neighbor 200.252.158.174 route-map LATAM_TELMEX_285_SG in
 maximum-paths eibgp 2
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf SET_MA:3377
 redistribute connected
 redistribute static
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf SERPRO_SLS_RFB_12:6238
 redistribute connected
 redistribute static
 neighbor 10.53.2.178 remote-as 65003
 neighbor 10.53.2.178 description CRN/IP/00109
 neighbor 10.53.2.178 activate
 neighbor 10.53.2.178 send-community both
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf SERPRO_SLS_RFB_11:5911
 redistribute connected
 redistribute static
 neighbor 10.53.2.174 remote-as 65003
 neighbor 10.53.2.174 description ITZ/IP/01163
 neighbor 10.53.2.174 activate
 neighbor 10.53.2.174 send-community both
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf SERPRO_SLS_RFB_09:5913
 redistribute connected
 redistribute static
 neighbor 10.53.2.146 remote-as 65003
 neighbor 10.53.2.146 description PDU/IP/00113
 neighbor 10.53.2.146 activate
 neighbor 10.53.2.146 send-community both
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf SERPRO_SLS_RFB_08:5907
 redistribute connected
 redistribute static
 neighbor 10.53.2.166 remote-as 65003
 neighbor 10.53.2.166 description PHE/MULTI/40171
 neighbor 10.53.2.166 activate
 neighbor 10.53.2.166 send-community both
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf SERPRO_SLS_RFB_06:5918
 redistribute connected
 redistribute static
 neighbor 10.53.2.150 remote-as 65003
 neighbor 10.53.2.150 description CDO/IP/00146
 neighbor 10.53.2.150 activate
 neighbor 10.53.2.150 send-community both
 neighbor 200.172.10.238 remote-as 65003
 neighbor 200.172.10.238 description CDO/IP/00146
 neighbor 200.172.10.238 activate
 neighbor 200.172.10.238 send-community both
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf SERPRO_SLS_RFB_05:5917
 redistribute connected
 redistribute static
 neighbor 10.53.2.214 remote-as 65003
 neighbor 10.53.2.214 description CHI/IP/00122
 neighbor 10.53.2.214 activate
 neighbor 10.53.2.214 send-community both
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf SERPRO_SLS_RFB_01:5848
 redistribute connected
 redistribute static
 neighbor 10.53.2.170 remote-as 65003
 neighbor 10.53.2.170 description SLS/IP/04932
 neighbor 10.53.2.170 activate
 neighbor 10.53.2.170 send-community both
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf SERPRO_SLS_DNIT_05:5908
 redistribute connected
 redistribute static
 neighbor 10.218.15.18 remote-as 65013
 neighbor 10.218.15.18 description ITZ/IP/01162
 neighbor 10.218.15.18 activate
 neighbor 10.218.15.18 send-community both
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf SERMA:1663
 redistribute connected route-map LATAM_TELMEX_285
 redistribute static route-map LATAM_TELMEX_285
 maximum-paths eibgp 2
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf SERASA:1956
 redistribute connected
 redistribute static
 neighbor 200.253.152.50 remote-as 65000
 neighbor 200.253.152.50 description SLS/IP/00186
 neighbor 200.253.152.50 activate
 neighbor 200.253.152.50 send-community both
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf SEBRAEMA:4302
 redistribute connected route-map SBC_CLIENTE
 redistribute static
 neighbor 189.53.246.70 remote-as 64617
 neighbor 189.53.246.70 description SIS/IP/00039
 neighbor 189.53.246.70 activate
 neighbor 189.53.246.70 send-community both
 neighbor 189.53.246.90 remote-as 64617
 neighbor 189.53.246.90 description SLS/IP/01773
 neighbor 189.53.246.90 activate
 neighbor 189.53.246.90 send-community both
 neighbor 189.53.246.122 remote-as 64617
 neighbor 189.53.246.122 description ITZ/IP/00171
 neighbor 189.53.246.122 activate
 neighbor 189.53.246.122 send-community both
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf SANTANDER_11:6872
 redistribute connected
 redistribute static
 neighbor 200.172.12.34 remote-as 65069
 neighbor 200.172.12.34 description ITZ/IP/01329
 neighbor 200.172.12.34 activate
 neighbor 200.172.12.34 send-community both
 neighbor 200.172.12.34 default-originate
 neighbor 200.172.12.34 route-map NO-ROUTES_OUT out
 maximum-paths eibgp 2
 default-information originate
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf SAGA_BRASIL:7340
 redistribute connected
 redistribute static
 neighbor 200.172.13.78 remote-as 65000
 neighbor 200.172.13.78 description SLS/IP/06007
 neighbor 200.172.13.78 activate
 neighbor 200.172.13.78 send-community both
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf RODOBENS:3379
 redistribute connected
 redistribute static
 neighbor 189.52.211.86 remote-as 65072
 neighbor 189.52.211.86 description ITZ/MULTI/14734
 neighbor 189.52.211.86 activate
 neighbor 189.52.211.86 send-community both
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
 address-family ipv4 vrf REDEPOSDIAL1:7101
 redistribute connected
 redistribute static
 neighbor 200.172.10.30 remote-as 65000
 neighbor 200.172.10.30 description SLS/IP/06117
 neighbor 200.172.10.30 activate
 neighbor 200.172.10.30 send-community both
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf REALIP_SBC:5580
 redistribute connected
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
 address-family ipv4 vrf RCC_RUN_MPLS1:4455
 redistribute connected
 redistribute static
 neighbor 200.241.80.154 remote-as 65508
 neighbor 200.241.80.154 description SLS/IP/04703
 neighbor 200.241.80.154 activate
 neighbor 200.241.80.154 send-community both
 neighbor 200.252.158.118 remote-as 65508
 neighbor 200.252.158.118 description ITZ/IP/01332
 neighbor 200.252.158.118 activate
 neighbor 200.252.158.118 send-community both
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf RCC_PRY_MPLS1:6256
 redistribute connected
 redistribute static
 neighbor 10.70.22.78 remote-as 65508
 neighbor 10.70.22.78 description SLS/IP/XXXX1
 neighbor 10.70.22.78 activate
 neighbor 10.70.22.78 send-community both
 neighbor 189.53.246.254 remote-as 65508
 neighbor 189.53.246.254 description ITZ/IP/01334
 neighbor 189.53.246.254 activate
 neighbor 189.53.246.254 send-community both
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf RCC_GST_MPLS1:4457
 redistribute connected
 redistribute static
 neighbor 200.241.80.250 remote-as 65508
 neighbor 200.241.80.250 description SLS/IP/04704
 neighbor 200.241.80.250 activate
 neighbor 200.241.80.250 send-community both
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf RCC_CLARO_MPLS1:6254
 redistribute connected
 redistribute static
 neighbor 10.90.0.138 remote-as 65508
 neighbor 10.90.0.138 description SLS/IP/XXXXX REDE CLARO
 neighbor 10.90.0.138 activate
 neighbor 10.90.0.138 send-community both
 neighbor 189.53.246.162 remote-as 65508
 neighbor 189.53.246.162 description ITZ/IP/01330
 neighbor 189.53.246.162 activate
 neighbor 189.53.246.162 send-community both
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf RCC_AMX_CORP_VOZ:7346
 redistribute connected
 redistribute static
 neighbor 189.53.11.222 remote-as 65508
 neighbor 189.53.11.222 description ITZ/IP/01333
 neighbor 189.53.11.222 activate
 neighbor 189.53.11.222 send-community both
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf RCC_AMX_CORP:7361
 redistribute connected
 redistribute static
 neighbor 189.53.11.30 remote-as 65508
 neighbor 189.53.11.30 description ITZ/IP/01331
 neighbor 189.53.11.30 activate
 neighbor 189.53.11.30 send-community both
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf PREVIDENCIA_SPOKES:152286
 redistribute connected
 redistribute static
 neighbor 10.78.44.78 remote-as 26218
 neighbor 10.78.44.78 description ITMH/IP/00120
 neighbor 10.78.44.78 activate
 neighbor 10.78.44.78 send-community both
 maximum-paths eibgp 3
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf PAGUEMENOS:3822
 redistribute connected route-map SBC_CLIENTE
 redistribute static
 neighbor 189.43.120.234 remote-as 65338
 neighbor 189.43.120.234 description SLS/MULTI/32390
 neighbor 189.43.120.234 activate
 neighbor 189.43.120.234 send-community both
 neighbor 189.52.211.110 remote-as 65338
 neighbor 189.52.211.110 description ITZ/IP/01292
 neighbor 189.52.211.110 activate
 neighbor 189.52.211.110 send-community both
 maximum-paths eibgp 2
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf NOVA_SOCIC:4117
 redistribute connected
 redistribute static
 neighbor 200.172.12.206 remote-as 65395
 neighbor 200.172.12.206 description SLS/IP/06211
 neighbor 200.172.12.206 activate
 neighbor 200.172.12.206 send-community both
 maximum-paths eibgp 2
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf NGN-VOZ:1417
 redistribute connected metric 200
 redistribute static metric 200
 neighbor 10.255.21.90 remote-as 64854
 neighbor 10.255.21.90 description Uplink 4948 - acesso VLI
 neighbor 10.255.21.90 activate
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf NGN-VIPLINEIP:2628
 redistribute connected metric 200
 redistribute static metric 200
 neighbor 10.254.254.170 remote-as 64854
 neighbor 10.254.254.170 description Uplink 4948 - acesso VLI
 neighbor 10.254.254.170 activate
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
 neighbor 10.253.8.34 remote-as 64854
 neighbor 10.253.8.34 description Uplink 4948 - acesso VLI
 neighbor 10.253.8.34 activate
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf NACIONALGAS:3635
 redistribute connected
 redistribute static
 neighbor 200.253.152.2 remote-as 65131
 neighbor 200.253.152.2 description GVEL/IP/00002
 neighbor 200.253.152.2 activate
 neighbor 200.253.152.2 send-community both
 neighbor 201.45.138.230 remote-as 65131
 neighbor 201.45.138.230 description ITZ/IP/00102
 neighbor 201.45.138.230 activate
 neighbor 201.45.138.230 send-community both
 maximum-paths eibgp 2
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf MPT_NOVA:6115
 redistribute connected
 redistribute static
 neighbor 192.168.41.22 remote-as 65002
 neighbor 192.168.41.22 description SLS/MULTI/41775
 neighbor 192.168.41.22 activate
 neighbor 192.168.41.22 send-community both
 neighbor 192.168.41.206 remote-as 65002
 neighbor 192.168.41.206 description ITZ/MULTI/47396
 neighbor 192.168.41.206 activate
 neighbor 192.168.41.206 send-community both
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf MPF_NOVA:6114
 redistribute connected
 redistribute static
 neighbor 192.168.34.42 remote-as 65001
 neighbor 192.168.34.42 description ITZ/IP/01172
 neighbor 192.168.34.42 activate
 neighbor 192.168.34.42 send-community both
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
 address-family ipv4 vrf MAXMIX:6352
 redistribute connected route-map SBC_CLIENTE
 redistribute static
 neighbor 201.30.37.218 remote-as 65000
 neighbor 201.30.37.218 description SLS/IP/06055
 neighbor 201.30.37.218 activate
 neighbor 201.30.37.218 send-community both
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf MARITIMO_EBT:7326
 redistribute connected
 redistribute static
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf MARISA:4972
 redistribute connected route-map SET_COMMUNITY_GERENCIA_CQMR
 redistribute static
 neighbor 187.29.255.122 remote-as 65000
 neighbor 187.29.255.122 description SLS/IP/04657
 neighbor 187.29.255.122 activate
 neighbor 187.29.255.122 send-community both
 maximum-paths eibgp 2
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf MARATA:3392
 redistribute connected route-map SBC_CLIENTE
 redistribute static
 maximum-paths eibgp 2
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf LOJARENNER:1513
 redistribute connected route-map SBC_CLIENTE
 redistribute static
 neighbor 189.23.73.218 remote-as 65004
 neighbor 189.23.73.218 description SLS/IP/05556
 neighbor 189.23.73.218 activate
 neighbor 189.23.73.218 send-community both
 neighbor 200.172.11.66 remote-as 65004
 neighbor 200.172.11.66 description SLS/IP/05718
 neighbor 200.172.11.66 activate
 neighbor 200.172.11.66 send-community both
 maximum-paths eibgp 2
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf LINX:1114
 redistribute connected
 redistribute static
 neighbor 189.53.246.46 remote-as 65000
 neighbor 189.53.246.46 description SLS/IP/04936
 neighbor 189.53.246.46 activate
 neighbor 189.53.246.46 send-community both
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf LASA_NOVA:6236
 redistribute connected route-map SBC_CLIENTE
 redistribute static
 neighbor 187.28.122.226 remote-as 65316
 neighbor 187.28.122.226 description SLS/IP/03748
 neighbor 187.28.122.226 activate
 neighbor 187.28.122.226 send-community both
 neighbor 187.28.122.226 as-override
 neighbor 189.43.197.242 remote-as 65316
 neighbor 189.43.197.242 description SLS/IP/00534
 neighbor 189.43.197.242 activate
 neighbor 189.43.197.242 send-community both
 neighbor 189.43.197.242 as-override
 neighbor 189.52.211.206 remote-as 65316
 neighbor 189.52.211.206 description ITZ/IP/01186
 neighbor 189.52.211.206 activate
 neighbor 189.52.211.206 send-community both
 neighbor 189.52.211.206 as-override
 neighbor 200.172.13.218 remote-as 65316
 neighbor 200.172.13.218 description BBL/IP/00192
 neighbor 200.172.13.218 activate
 neighbor 200.172.13.218 send-community both
 neighbor 200.172.13.218 as-override
 neighbor 201.30.37.98 remote-as 65316
 neighbor 201.30.37.98 description ITZ/IP/01254
 neighbor 201.30.37.98 activate
 neighbor 201.30.37.98 send-community both
 neighbor 201.30.37.98 as-override
 maximum-paths eibgp 4
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf JSDISTRIBUIDORA:7167
 redistribute connected
 redistribute static
 neighbor 200.172.12.178 remote-as 65000
 neighbor 200.172.12.178 description ITZ/IP/01310
 neighbor 200.172.12.178 activate
 neighbor 200.172.12.178 send-community both
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf JORGEBATISTA:6562
 redistribute connected
 redistribute static
 neighbor 201.30.37.14 remote-as 65000
 neighbor 201.30.37.14 description ITZ/IP/01248
 neighbor 201.30.37.14 activate
 neighbor 201.30.37.14 send-community both
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf ITAUNIBANCO:6388
 redistribute connected
 redistribute static
 neighbor 200.241.80.178 remote-as 65001
 neighbor 200.241.80.178 description ACD/IP/00185
 neighbor 200.241.80.178 activate
 neighbor 200.241.80.178 send-community both
 neighbor 201.30.37.42 remote-as 65001
 neighbor 201.30.37.42 description ITZ/IP/01317
 neighbor 201.30.37.42 activate
 neighbor 201.30.37.42 send-community both
 maximum-paths eibgp 2
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf INPE:5430
 redistribute connected
 redistribute static
 neighbor 200.241.80.150 remote-as 65000
 neighbor 200.241.80.150 description SLS/IP/04681
 neighbor 200.241.80.150 activate
 neighbor 200.241.80.150 send-community both
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf INFRAERO:4781
 redistribute connected
 redistribute static
 neighbor 10.0.242.66 remote-as 65000
 neighbor 10.0.242.66 description ITZ/MULTI/25346
 neighbor 10.0.242.66 activate
 neighbor 10.0.242.66 send-community both
 neighbor 10.10.34.2 remote-as 65000
 neighbor 10.10.34.2 description ITZ/MULTI/25346
 neighbor 10.10.34.2 activate
 neighbor 10.10.34.2 send-community both
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf INFOVIA_DPU:6092
 redistribute connected
 redistribute static
 neighbor 200.172.13.58 remote-as 65281
 neighbor 200.172.13.58 description SLS/MULTI/41171
 neighbor 200.172.13.58 activate
 neighbor 200.172.13.58 send-community both
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf INFOSUS:4968
 redistribute connected
 redistribute static
 neighbor 192.168.103.34 remote-as 65000
 neighbor 192.168.103.34 description SLS/IP/04890
 neighbor 192.168.103.34 activate
 neighbor 192.168.103.34 send-community both
 maximum-paths eibgp 2
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf IMIFARMA_EXTRANET:155458
 redistribute connected
 redistribute static
 neighbor 187.28.122.178 remote-as 65000
 neighbor 187.28.122.178 description CDO/IP/00174
 neighbor 187.28.122.178 activate
 neighbor 187.28.122.178 send-community both
 neighbor 187.28.122.246 remote-as 65000
 neighbor 187.28.122.246 description SLS/MULTI/55156
 neighbor 187.28.122.246 activate
 neighbor 187.28.122.246 send-community both
 neighbor 200.172.10.246 remote-as 65000
 neighbor 200.172.10.246 description SLS/IP/05641
 neighbor 200.172.10.246 activate
 neighbor 200.172.10.246 send-community both
 neighbor 200.172.12.102 remote-as 65000
 neighbor 200.172.12.102 description CXS/MULTI/57832
 neighbor 200.172.12.102 activate
 neighbor 200.172.12.102 send-community both
 neighbor 200.172.12.198 remote-as 65000
 neighbor 200.172.12.198 description PHE/MULTI/57732
 neighbor 200.172.12.198 activate
 neighbor 200.172.12.198 send-community both
 neighbor 200.172.13.90 remote-as 65000
 neighbor 200.172.13.90 description ITZ/MULTI/58644
 neighbor 200.172.13.90 activate
 neighbor 200.172.13.90 send-community both
 neighbor 200.179.211.54 remote-as 65000
 neighbor 200.179.211.54 description SLS/MULTI/54985
 neighbor 200.179.211.54 activate
 neighbor 200.179.211.54 send-community both
 neighbor 200.179.211.62 remote-as 65000
 neighbor 200.179.211.62 description SLS/MULTI/55000
 neighbor 200.179.211.62 activate
 neighbor 200.179.211.62 send-community both
 neighbor 200.179.211.166 remote-as 65000
 neighbor 200.179.211.166 description SLS/MULTI/56505
 neighbor 200.179.211.166 activate
 neighbor 200.179.211.166 send-community both
 neighbor 200.179.212.2 remote-as 65000
 neighbor 200.179.212.2 description SLS/MULTI/55121
 neighbor 200.179.212.2 activate
 neighbor 200.179.212.2 send-community both
 neighbor 200.179.212.10 remote-as 65000
 neighbor 200.179.212.10 description SIS/MULTI/55287
 neighbor 200.179.212.10 activate
 neighbor 200.179.212.10 send-community both
 neighbor 200.241.80.134 remote-as 65000
 neighbor 200.241.80.134 description BBL/MULTI/57883
 neighbor 200.241.80.134 activate
 neighbor 200.241.80.134 send-community both
 neighbor 200.252.158.102 remote-as 65000
 neighbor 200.252.158.102 description CHI/IP/00124
 neighbor 200.252.158.102 activate
 neighbor 200.252.158.102 send-community both
 neighbor 201.30.37.222 remote-as 65000
 neighbor 201.30.37.222 description SLS/MULTI/55005
 neighbor 201.30.37.222 activate
 neighbor 201.30.37.222 send-community both
 neighbor 201.45.220.30 remote-as 65000
 neighbor 201.45.220.30 description SJE/IP/00156
 neighbor 201.45.220.30 activate
 neighbor 201.45.220.30 send-community both
 neighbor 201.45.220.38 remote-as 65188
 neighbor 201.45.220.38 description BBL/MULTI/61360
 neighbor 201.45.220.38 activate
 neighbor 201.45.220.38 send-community both
 neighbor 201.45.220.38 route-map LATAM_TELMEX_285 in
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf HSBCMPLS:3232
 redistribute connected
 redistribute static
 neighbor 168.41.20.30 remote-as 65137
 neighbor 168.41.20.30 description SLS/MULTI/15402
 neighbor 168.41.20.30 password 7 03217629342E1569624A34353B21
 neighbor 168.41.20.30 activate
 neighbor 168.41.20.30 send-community both
 neighbor 168.41.20.38 remote-as 65137
 neighbor 168.41.20.38 description SLS/MULTI/05445
 neighbor 168.41.20.38 password 7 0969632B2B242337274F291A0717
 neighbor 168.41.20.38 activate
 neighbor 168.41.20.38 send-community both
 neighbor 168.41.50.142 remote-as 65137
 neighbor 168.41.50.142 description SLS/MULTI/03034
 neighbor 168.41.50.142 password 7 112C342725333F29286906140400
 neighbor 168.41.50.142 activate
 neighbor 168.41.50.142 send-community both
 maximum-paths eibgp 2
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf HONEY_INT_0:7013
 redistribute connected route-map LATAM_TELMEX_285
 redistribute static route-map LATAM_TELMEX_285
 neighbor 187.128.37.254 remote-as 63517
 neighbor 187.128.37.254 description SLS/MULTI/58874
 neighbor 187.128.37.254 activate
 neighbor 187.128.37.254 send-community both
 maximum-paths eibgp 2
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf HONEYWELL_MCI:1937
 redistribute connected
 redistribute static
 neighbor 200.253.132.62 remote-as 65440
 neighbor 200.253.132.62 description SLS/IP/01979
 neighbor 200.253.132.62 activate
 neighbor 200.253.132.62 send-community both
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf GER_JDSU:6847
 redistribute connected
 redistribute static
 neighbor 187.29.255.14 remote-as 65000
 neighbor 187.29.255.14 description SLS/IP/05808
 neighbor 187.29.255.14 activate
 neighbor 187.29.255.14 send-community both
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf GERDAU_INT:3096
 redistribute connected route-map LATAM_TELMEX_286
 redistribute static route-map LATAM_TELMEX_286
 neighbor 10.241.25.2 remote-as 65214
 neighbor 10.241.25.2 description ITZ/IP/00236
 neighbor 10.241.25.2 activate
 neighbor 10.241.25.2 send-community both
 neighbor 10.241.25.2 route-map LATAM_TELMEX_286 in
 neighbor 10.242.51.2 remote-as 65214
 neighbor 10.242.51.2 description SLS/IP/01985
 neighbor 10.242.51.2 activate
 neighbor 10.242.51.2 send-community both
 neighbor 10.242.51.2 route-map LATAM_TELMEX_286 in
 neighbor 200.179.212.26 remote-as 65214
 neighbor 200.179.212.26 description SLS/IP/01985
 neighbor 200.179.212.26 activate
 neighbor 200.179.212.26 send-community both
 maximum-paths eibgp 2
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf GERANORTE:4870
 redistribute connected
 redistribute static
 neighbor 201.73.255.86 remote-as 64997
 neighbor 201.73.255.86 description MIR/IP/00004
 neighbor 201.73.255.86 activate
 neighbor 201.73.255.86 send-community both
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf GERADORA:5001
 redistribute connected
 redistribute static
 neighbor 187.28.240.126 remote-as 65000
 neighbor 187.28.240.126 description SLS/IP/03747
 neighbor 187.28.240.126 activate
 neighbor 187.28.240.126 send-community both
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf GCRGOIANIA:3789
 redistribute connected
 redistribute static
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf FUNASA:3094
 redistribute connected
 redistribute static
 neighbor 200.172.10.10 remote-as 65305
 neighbor 200.172.10.10 description SLS/IP/05018
 neighbor 200.172.10.10 activate
 neighbor 200.172.10.10 send-community both
 maximum-paths eibgp 2
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf EBC_MPLS1:6806
 redistribute connected
 redistribute static
 neighbor 189.23.73.6 remote-as 65000
 neighbor 189.23.73.6 description SLS/IP/05670
 neighbor 189.23.73.6 activate
 neighbor 189.23.73.6 send-community both
 maximum-paths eibgp 2
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf EBC_MIDIA:155361
 redistribute connected
 redistribute static
 neighbor 200.179.212.106 remote-as 65000
 neighbor 200.179.212.106 description SLS/IP/05787
 neighbor 200.179.212.106 activate
 neighbor 200.179.212.106 send-community both
 maximum-paths eibgp 2
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf DPRF_NAC_REMOTO:4295
 redistribute connected
 redistribute static
 neighbor 200.172.13.90 remote-as 65000
 neighbor 200.172.13.90 description SLS/MULTI/42329
 neighbor 200.172.13.90 activate
 neighbor 200.172.13.90 send-community both
 neighbor 200.172.13.90 as-override
 neighbor 200.172.13.90 soft-reconfiguration inbound
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf DPF_MPLS:6606
 redistribute connected
 redistribute static
 neighbor 200.172.10.250 remote-as 65100
 neighbor 200.172.10.250 description SLS/IP/05557
 neighbor 200.172.10.250 activate
 neighbor 200.172.10.250 send-community both
 neighbor 201.30.37.198 remote-as 65100
 neighbor 201.30.37.198 description ITZ/IP/01251
 neighbor 201.30.37.198 activate
 neighbor 201.30.37.198 send-community both
 neighbor 201.30.37.202 remote-as 65100
 neighbor 201.30.37.202 description SLS/IP/05505
 neighbor 201.30.37.202 activate
 neighbor 201.30.37.202 send-community both
 maximum-paths eibgp 2
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf CREFISA:5415
 redistribute connected
 redistribute static
 neighbor 187.28.122.2 remote-as 65000
 neighbor 187.28.122.2 description ITZ/IP/01361
 neighbor 187.28.122.2 activate
 neighbor 187.28.122.2 send-community both
 neighbor 200.172.10.122 remote-as 65000
 neighbor 200.172.10.122 description PHE/IP/00181
 neighbor 200.172.10.122 activate
 neighbor 200.172.10.122 send-community both
 neighbor 200.172.12.86 remote-as 65000
 neighbor 200.172.12.86 description BBL/IP/00231
 neighbor 200.172.12.86 activate
 neighbor 200.172.12.86 send-community both
 neighbor 200.172.12.174 remote-as 65000
 neighbor 200.172.12.174 description SIS/IP/00213
 neighbor 200.172.12.174 activate
 neighbor 200.172.12.174 send-community both
 neighbor 200.172.12.218 remote-as 65000
 neighbor 200.172.12.218 description BLA/IP/00300
 neighbor 200.172.12.218 activate
 neighbor 200.172.12.218 send-community both
 neighbor 200.172.13.82 remote-as 65000
 neighbor 200.172.13.82 description SLS/MULTI/42263
 neighbor 200.172.13.82 activate
 neighbor 200.172.13.82 send-community both
 neighbor 200.179.212.30 remote-as 65000
 neighbor 200.179.212.30 description ACD/MULTI/55772
 neighbor 200.179.212.30 activate
 neighbor 200.179.212.30 send-community both
 neighbor 200.179.212.38 remote-as 65000
 neighbor 200.179.212.38 description SLS/MULTI/55837
 neighbor 200.179.212.38 activate
 neighbor 200.179.212.38 send-community both
 neighbor 200.179.212.254 remote-as 65000
 neighbor 200.179.212.254 description PCL/IP/00136
 neighbor 200.179.212.254 activate
 neighbor 200.179.212.254 send-community both
 maximum-paths eibgp 3
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf CREDISHOP:1661
 redistribute connected
 redistribute static
 neighbor 189.53.11.70 remote-as 64518
 neighbor 189.53.11.70 description ITZ/IP/00142
 neighbor 189.53.11.70 activate
 neighbor 189.53.11.70 send-community both
 neighbor 200.241.80.222 remote-as 64518
 neighbor 200.241.80.222 description ACD/MULTI/35863
 neighbor 200.241.80.222 activate
 neighbor 200.241.80.222 send-community both
 neighbor 200.249.145.206 remote-as 64518
 neighbor 200.249.145.206 description BBL/MULTI/30454
 neighbor 200.249.145.206 activate
 neighbor 200.249.145.206 send-community both
 neighbor 200.249.169.90 remote-as 64518
 neighbor 200.249.169.90 description CXS/MULTI/29410
 neighbor 200.249.169.90 activate
 neighbor 200.249.169.90 send-community both
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf CPAD:5928
 redistribute connected
 redistribute static
 neighbor 200.172.13.18 remote-as 65372
 neighbor 200.172.13.18 description SLS/IP/05008
 neighbor 200.172.13.18 activate
 neighbor 200.172.13.18 send-community both
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf COSAN:4132
 redistribute connected route-map SBC_CLIENTE
 redistribute static
 neighbor 200.249.169.38 remote-as 65463
 neighbor 200.249.169.38 description ACD/MULTI/39211
 neighbor 200.249.169.38 activate
 neighbor 200.249.169.38 send-community both
 maximum-paths eibgp 2
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf CORREIOS_2016:7440
 redistribute connected route-map RM_ECT_CONNECTED
 redistribute static
 neighbor 172.18.65.238 remote-as 65001
 neighbor 172.18.65.238 description BBL/IP/00241
 neighbor 172.18.65.238 password 7 0224236B34232C15
 neighbor 172.18.65.238 activate
 neighbor 172.18.65.238 send-community both
 neighbor 172.18.69.14 remote-as 65001
 neighbor 172.18.69.14 description SLS/IP/06038
 neighbor 172.18.69.14 password 7 15302C3C3B0F0810
 neighbor 172.18.69.14 activate
 neighbor 172.18.69.14 send-community both
 neighbor 172.18.72.234 remote-as 65001
 neighbor 172.18.72.234 description ZED/IP/00137
 neighbor 172.18.72.234 password 7 123B22272D2E2F30
 neighbor 172.18.72.234 activate
 neighbor 172.18.72.234 send-community both
 maximum-paths eibgp 2
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf CONAB:4162
 redistribute connected
 redistribute static
 neighbor 200.172.10.34 remote-as 65495
 neighbor 200.172.10.34 description ITZ/IP/01314
 neighbor 200.172.10.34 activate
 neighbor 200.172.10.34 send-community both
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf COBRA:1706
 redistribute connected route-map SBC_CLIENTE
 redistribute static
 neighbor 200.249.174.14 remote-as 65191
 neighbor 200.249.174.14 description SLS/IP/00168
 neighbor 200.249.174.14 activate
 neighbor 200.249.174.14 send-community both
 maximum-paths eibgp 2
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf CETIP:6164
 redistribute connected
 redistribute static
 neighbor 187.29.255.74 remote-as 65000
 neighbor 187.29.255.74 description SLS/IP/05085
 neighbor 187.29.255.74 password 7 0205574F5A162F281D5858392647203B4D310C
 neighbor 187.29.255.74 activate
 neighbor 187.29.255.74 send-community both
 maximum-paths eibgp 2
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf CEMAR:3468
 redistribute connected
 redistribute static
 neighbor 200.241.80.98 remote-as 64707
 neighbor 200.241.80.98 description ITZ/IP/01119
 neighbor 200.241.80.98 activate
 neighbor 200.241.80.98 send-community both
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf CBE:4734
 redistribute connected
 redistribute static
 neighbor 201.73.255.50 remote-as 64962
 neighbor 201.73.255.50 description SLS/MULTI/23978
 neighbor 201.73.255.50 activate
 neighbor 201.73.255.50 send-community both
 maximum-paths eibgp 2
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf CARREFOUR:155715
 redistribute connected
 redistribute static
 neighbor 201.30.37.150 remote-as 65000
 neighbor 201.30.37.150 description ITZ/IP/01347
 neighbor 201.30.37.150 activate
 neighbor 201.30.37.150 send-community both
 maximum-paths eibgp 2
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf BT_CBB:1851
 redistribute connected
 redistribute static
 neighbor 200.172.13.150 remote-as 64636
 neighbor 200.172.13.150 description ITZ/IP/01289
 neighbor 200.172.13.150 activate
 neighbor 200.172.13.150 send-community both
 neighbor 200.209.190.90 remote-as 64768
 neighbor 200.209.190.90 description SLS/IP/00193
 neighbor 200.209.190.90 activate
 neighbor 200.209.190.90 send-community both
 neighbor 200.241.80.10 remote-as 64860
 neighbor 200.241.80.10 description SLS/IP/06231
 neighbor 200.241.80.10 activate
 neighbor 200.241.80.10 send-community both
 maximum-paths eibgp 2
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf BRF_BRASIL_FOODS:5177
 redistribute connected route-map LATAM_TELMEX_286
 redistribute static route-map LATAM_TELMEX_286
 neighbor 200.172.13.126 remote-as 65100
 neighbor 200.172.13.126 description SJE/MULTI/44088
 neighbor 200.172.13.126 activate
 neighbor 200.172.13.126 send-community both
 maximum-paths eibgp 2
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf BRASPRESS:4733
 redistribute connected
 redistribute static
 neighbor 187.29.255.30 remote-as 64981
 neighbor 187.29.255.30 description ITZ/IP/00628
 neighbor 187.29.255.30 activate
 neighbor 187.29.255.30 send-community both
 maximum-paths eibgp 2
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf BRASILIANAENC_NOVA:6317
 redistribute connected
 redistribute static
 neighbor 200.172.12.38 remote-as 65000
 neighbor 200.172.12.38 description SLS/IP/05264
 neighbor 200.172.12.38 activate
 neighbor 200.172.12.38 send-community both
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf BNB:5075
 redistribute connected
 redistribute static
 neighbor 200.172.12.222 remote-as 65000
 neighbor 200.172.12.222 description ACD/IP/00168
 neighbor 200.172.12.222 activate
 neighbor 200.172.12.222 send-community both
 neighbor 200.172.12.226 remote-as 65000
 neighbor 200.172.12.226 description ITZ/IP/01237
 neighbor 200.172.12.226 activate
 neighbor 200.172.12.226 send-community both
 neighbor 200.172.12.234 remote-as 65000
 neighbor 200.172.12.234 description SLS/IP/05488
 neighbor 200.172.12.234 activate
 neighbor 200.172.12.234 send-community both
 neighbor 201.30.37.58 remote-as 65000
 neighbor 201.30.37.58 description PFN/IP/00111
 neighbor 201.30.37.58 activate
 neighbor 201.30.37.58 send-community both
 neighbor 201.30.37.70 remote-as 65000
 neighbor 201.30.37.70 description CDO/IP/00163
 neighbor 201.30.37.70 activate
 neighbor 201.30.37.70 send-community both
 neighbor 201.30.37.102 remote-as 65000
 neighbor 201.30.37.102 description SLS/IP/05513
 neighbor 201.30.37.102 activate
 neighbor 201.30.37.102 send-community both
 neighbor 201.30.37.238 remote-as 65000
 neighbor 201.30.37.238 description PCL/IP/00130
 neighbor 201.30.37.238 activate
 neighbor 201.30.37.238 send-community both
 maximum-paths eibgp 2
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf BITCARD:6262
 redistribute connected
 redistribute static
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
 address-family ipv4 vrf BEMOL1:5658
 redistribute connected
 redistribute static
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
 address-family ipv4 vrf BCOAM:4783
 redistribute connected
 redistribute static
 neighbor 200.241.80.234 remote-as 65330
 neighbor 200.241.80.234 description SLS/IP/06308
 neighbor 200.241.80.234 activate
 neighbor 200.241.80.234 send-community both
 neighbor 200.252.158.114 remote-as 65330
 neighbor 200.252.158.114 description ITZ/MULTI/24906
 neighbor 200.252.158.114 activate
 neighbor 200.252.158.114 send-community both
 neighbor 200.252.158.122 remote-as 65330
 neighbor 200.252.158.122 description ACD/MULTI/24917
 neighbor 200.252.158.122 activate
 neighbor 200.252.158.122 send-community both
 neighbor 200.252.158.158 remote-as 65330
 neighbor 200.252.158.158 description BBL/IP/00254
 neighbor 200.252.158.158 activate
 neighbor 200.252.158.158 send-community both
 maximum-paths eibgp 2
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf BBRASIL_PAE:7041
 redistribute connected
 redistribute static
 neighbor 10.247.75.250 remote-as 65521
 neighbor 10.247.75.250 description SIS/IP/00203
 neighbor 10.247.75.250 shutdown
 neighbor 10.247.75.250 timers 5 15
 neighbor 10.247.75.250 activate
 neighbor 10.247.75.250 send-community both
 neighbor 10.247.75.250 next-hop-self
 neighbor 10.247.75.250 as-override
 neighbor 10.247.75.250 route-map BBRASIL_CE_OUT out
 neighbor 10.247.76.234 remote-as 65521
 neighbor 10.247.76.234 description ACD/IP/00179
 neighbor 10.247.76.234 shutdown
 neighbor 10.247.76.234 activate
 neighbor 10.247.76.234 send-community both
 neighbor 10.247.76.234 next-hop-self
 neighbor 10.247.76.234 as-override
 neighbor 10.247.76.234 route-map BBRASIL_CE_OUT out
 neighbor 10.247.76.254 remote-as 65521
 neighbor 10.247.76.254 description ITZ/IP/01287
 neighbor 10.247.76.254 shutdown
 neighbor 10.247.76.254 timers 5 15
 neighbor 10.247.76.254 activate
 neighbor 10.247.76.254 send-community both
 neighbor 10.247.76.254 next-hop-self
 neighbor 10.247.76.254 as-override
 neighbor 10.247.76.254 route-map BBRASIL_CE_OUT out
 neighbor 10.247.78.166 remote-as 65521
 neighbor 10.247.78.166 description BBL/IP/00221
 neighbor 10.247.78.166 shutdown
 neighbor 10.247.78.166 activate
 neighbor 10.247.78.166 send-community both
 neighbor 10.247.78.166 next-hop-self
 neighbor 10.247.78.166 as-override
 neighbor 10.247.78.166 route-map BBRASIL_CE_OUT out
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf BBRASIL_NAC:7399
 redistribute connected
 redistribute static
 neighbor 10.66.189.138 remote-as 65321
 neighbor 10.66.189.138 description SLS/IP/05452
 neighbor 10.66.189.138 timers 10 30
 neighbor 10.66.189.138 activate
 neighbor 10.66.189.138 send-community both
 neighbor 10.66.189.138 route-map BB-LT2-NAC-REMOTOS-IN in
 neighbor 10.66.189.138 route-map BB-LT2-NAC-REMOTOS-OUT out
 neighbor 10.66.206.98 remote-as 65321
 neighbor 10.66.206.98 description ITZ/IP/01208
 neighbor 10.66.206.98 timers 10 30
 neighbor 10.66.206.98 activate
 neighbor 10.66.206.98 send-community both
 neighbor 10.66.206.98 route-map BB-LT2-NAC-REMOTOS-IN in
 neighbor 10.66.206.98 route-map BB-LT2-NAC-REMOTOS-OUT out
 maximum-paths eibgp 2
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf BBRASIL:1588
 redistribute connected
 redistribute static
 neighbor 10.7.156.90 remote-as 65521
 neighbor 10.7.156.90 description ITZ/IP/01171
 neighbor 10.7.156.90 activate
 neighbor 10.7.156.90 send-community both
 neighbor 10.7.156.90 next-hop-self
 neighbor 10.7.156.90 as-override
 neighbor 10.7.156.90 route-map BBRASIL_CE_OUT out
 neighbor 10.247.78.214 remote-as 65521
 neighbor 10.247.78.214 description CXS/IP/00241
 neighbor 10.247.78.214 shutdown
 neighbor 10.247.78.214 timers 5 15
 neighbor 10.247.78.214 activate
 neighbor 10.247.78.214 send-community both
 neighbor 10.247.78.214 next-hop-self
 neighbor 10.247.78.214 as-override
 neighbor 10.247.78.214 route-map BBRASIL_CE_OUT out
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf BANCO_CSFSA:7512
 redistribute connected
 redistribute static
 neighbor 200.172.13.250 remote-as 65000
 neighbor 200.172.13.250 description ITZ/IP/01376
 neighbor 200.172.13.250 fall-over bfd
 neighbor 200.172.13.250 activate
 neighbor 200.172.13.250 send-community both
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf ARMATEUS:3394
 redistribute connected route-map SBC_CLIENTE
 redistribute static
 neighbor 189.43.197.10 remote-as 65533
 neighbor 189.43.197.10 description SLS/IP/00451
 neighbor 189.43.197.10 activate
 neighbor 189.43.197.10 send-community both
 neighbor 189.52.190.90 remote-as 65533
 neighbor 189.52.190.90 description ACD/IP/00044
 neighbor 189.52.190.90 activate
 neighbor 189.52.190.90 send-community both
 neighbor 200.172.10.38 remote-as 65533
 neighbor 200.172.10.38 description ETO/MULTI/61011
 neighbor 200.172.10.38 activate
 neighbor 200.172.10.38 send-community both
 default-information originate
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf ALVO:3946
 redistribute connected
 redistribute static
 neighbor 189.53.11.114 remote-as 65357
 neighbor 189.53.11.114 description ACD/MULTI/12902
 neighbor 189.53.11.114 activate
 neighbor 189.53.11.114 send-community both
 neighbor 189.53.11.114 route-map ALVO_39461895311114 out
 maximum-paths eibgp 2
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf ALECOMBUST:1639
 redistribute connected route-map SBC_CLIENTE
 redistribute static
 neighbor 200.249.169.146 remote-as 65282
 neighbor 200.249.169.146 description ACD/IP/00033
 neighbor 200.249.169.146 activate
 neighbor 200.249.169.146 send-community both
 maximum-paths eibgp 2
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf AGU_MPLS:6691
 redistribute connected
 redistribute static
 neighbor 200.172.10.234 remote-as 65669
 neighbor 200.172.10.234 description ITZ/IP/01258
 neighbor 200.172.10.234 activate
 neighbor 200.172.10.234 send-community both
 maximum-paths eibgp 3
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf ACCOR:5074
 redistribute connected route-map LATAM_TELMEX_285
 redistribute static route-map LATAM_TELMEX_285
 neighbor 201.30.37.246 remote-as 65194
 neighbor 201.30.37.246 description ITZ/IP/01274
 neighbor 201.30.37.246 activate
 neighbor 201.30.37.246 send-community both
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf ABRROAMING:1249
 redistribute connected
 redistribute static
 neighbor 187.28.240.18 remote-as 64619
 neighbor 187.28.240.18 description SLS/IP/03771
 neighbor 187.28.240.18 activate
 neighbor 187.28.240.18 send-community both
 neighbor 200.241.80.210 remote-as 64639
 neighbor 200.241.80.210 description SLS/IP/04573
 neighbor 200.241.80.210 activate
 neighbor 200.241.80.210 send-community both
 maximum-paths eibgp 2
 no synchronization
 bgp dampening
 exit-address-family
 !
 address-family ipv4 vrf ABNAMRO:2803
 redistribute connected
 redistribute static
 neighbor 189.42.63.158 remote-as 65069
 neighbor 189.42.63.158 description SLS/MULTI/02492
 neighbor 189.42.63.158 timers 20 60
 neighbor 189.42.63.158 activate
 neighbor 189.42.63.158 send-community both
 neighbor 189.42.63.158 default-originate route-map ABNAMRO_DEFAULT
 neighbor 189.42.63.158 advertisement-interval 1
 neighbor 189.42.63.158 route-map NO-ROUTES_OUT out
 neighbor 189.42.91.194 remote-as 65069
 neighbor 189.42.91.194 description SLS/MULTI/09052
 neighbor 189.42.91.194 timers 20 60
 neighbor 189.42.91.194 activate
 neighbor 189.42.91.194 send-community both
 neighbor 189.42.91.194 default-originate route-map ABNAMRO_DEFAULT
 neighbor 189.42.91.194 advertisement-interval 1
 neighbor 189.42.91.194 route-map NO-ROUTES_OUT out
 neighbor 189.42.91.210 remote-as 65067
 neighbor 189.42.91.210 description SLS/MULTI/08855
 neighbor 189.42.91.210 timers 20 60
 neighbor 189.42.91.210 activate
 neighbor 189.42.91.210 send-community both
 neighbor 189.42.91.210 default-originate route-map ABNAMRO_DEFAULT
 neighbor 189.42.91.210 route-map NO-ROUTES_OUT out
 neighbor 200.241.80.118 remote-as 65069
 neighbor 200.241.80.118 description SLS/MULTI/34800
 neighbor 200.241.80.118 timers 20 60
 neighbor 200.241.80.118 activate
 neighbor 200.241.80.118 send-community both
 neighbor 200.241.80.118 default-originate route-map ABNAMRO_DEFAULT
 neighbor 200.241.80.118 advertisement-interval 1
 neighbor 200.241.80.118 route-map NO-ROUTES_OUT out
 neighbor 200.249.145.26 remote-as 65069
 neighbor 200.249.145.26 description SLS/MULTI/28977
 neighbor 200.249.145.26 timers 20 60
 neighbor 200.249.145.26 activate
 neighbor 200.249.145.26 send-community both
 neighbor 200.249.145.26 default-originate route-map ABNAMRO_DEFAULT
 neighbor 200.249.145.26 advertisement-interval 1
 neighbor 200.249.145.26 route-map NO-ROUTES_OUT out
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
ip route 187.28.44.16 255.255.255.240 GigabitEthernet4/0/3.222 200.241.80.194
ip route 187.28.44.112 255.255.255.240 GigabitEthernet4/0/3.116 201.30.37.38
ip route 187.28.44.144 255.255.255.240 GigabitEthernet4/0/1.35 200.241.80.206
ip route 187.28.44.160 255.255.255.240 GigabitEthernet4/0/3.310 200.172.13.114
ip route 187.28.44.208 255.255.255.240 GigabitEthernet4/0/3.56 200.172.10.22
ip route 187.28.240.90 255.255.255.255 GigabitEthernet4/0/3.3
ip route 187.29.0.0 255.255.0.0 Null0 tag 200
ip route 187.30.0.0 255.255.0.0 Null0 tag 200
ip route 189.2.0.0 255.255.0.0 Null0 tag 200
ip route 189.3.0.0 255.255.0.0 Null0 tag 200
ip route 189.3.25.160 255.255.255.240 GigabitEthernet4/0/3.216 200.172.13.234
ip route 189.3.25.176 255.255.255.240 GigabitEthernet4/0/3.148 200.172.10.118
ip route 189.3.25.192 255.255.255.240 GigabitEthernet4/0/3.103 200.172.12.246
ip route 189.3.101.48 255.255.255.240 GigabitEthernet4/0/3.96 200.252.158.178
ip route 189.3.101.80 255.255.255.240 GigabitEthernet4/0/3.28 200.172.10.126
ip route 189.3.101.160 255.255.255.240 GigabitEthernet4/0/1.105 201.30.37.194
ip route 189.3.101.176 255.255.255.240 GigabitEthernet4/0/3.213 200.172.10.102
ip route 189.3.102.16 255.255.255.240 GigabitEthernet4/0/1.111 200.172.13.238
ip route 189.3.102.48 255.255.255.240 GigabitEthernet4/0/0.11 200.172.10.170
ip route 189.3.102.128 255.255.255.128 GigabitEthernet0/0/4.314 200.172.13.94
ip route 189.3.154.16 255.255.255.240 GigabitEthernet4/0/3.26 200.241.80.34
ip route 189.3.154.48 255.255.255.240 GigabitEthernet4/0/3.226 200.172.11.74
ip route 189.3.154.128 255.255.255.240 GigabitEthernet4/0/3.912 200.172.13.134
ip route 189.3.154.144 255.255.255.240 GigabitEthernet4/0/3.101 200.172.12.190
ip route 189.3.154.176 255.255.255.240 GigabitEthernet0/0/4.226 200.172.10.226
ip route 189.3.155.0 255.255.255.240 GigabitEthernet4/0/3.33 200.172.10.150
ip route 189.3.155.16 255.255.255.240 GigabitEthernet4/0/3.223 200.172.12.58
ip route 189.3.155.96 255.255.255.240 GigabitEthernet4/0/0.62 200.172.12.50
ip route 189.3.221.80 255.255.255.240 GigabitEthernet4/0/3.311 200.172.13.194
ip route 189.16.0.0 255.255.0.0 Null0 tag 200
ip route 189.16.241.0 255.255.255.192 GigabitEthernet4/0/0.53 200.172.12.18
ip route 189.16.241.128 255.255.255.240 GigabitEthernet4/0/3.4 200.172.12.250
ip route 189.16.241.176 255.255.255.240 GigabitEthernet0/0/4.303 200.241.80.94
ip route 189.16.248.128 255.255.255.128 GigabitEthernet0/0/4.314 200.172.13.94
ip route 189.16.255.32 255.255.255.240 GigabitEthernet4/0/1.2 200.252.158.218
ip route 189.16.255.64 255.255.255.240 GigabitEthernet4/0/0.71 200.172.12.78
ip route 189.17.0.0 255.255.0.0 Null0 tag 200
ip route 189.17.21.192 255.255.255.240 GigabitEthernet0/0/4.210 200.172.10.178
ip route 189.17.22.80 255.255.255.240 GigabitEthernet0/0/4.407 200.172.12.142
ip route 189.17.22.112 255.255.255.240 GigabitEthernet4/0/3.62 200.172.12.130
ip route 189.17.22.224 255.255.255.240 GigabitEthernet0/0/4.408 200.172.12.158
ip route 189.17.65.0 255.255.255.128 Serial3/3/0.1/1/6/3:2 200.249.145.74
ip route 189.17.65.176 255.255.255.240 GigabitEthernet4/0/1.106 201.30.37.210
ip route 189.17.66.64 255.255.255.240 GigabitEthernet4/0/3.88 201.30.37.66
ip route 189.17.66.80 255.255.255.240 GigabitEthernet4/0/3.38 200.241.80.2
ip route 189.17.131.32 255.255.255.240 GigabitEthernet4/0/3.110 200.172.10.98
ip route 189.17.173.32 255.255.255.240 Serial3/2/0.1/1/6/3:0
ip route 189.17.173.144 255.255.255.240 GigabitEthernet4/0/3.107 200.179.212.18
ip route 189.17.173.176 255.255.255.240 GigabitEthernet4/0/0.23 201.45.220.114
ip route 189.17.173.224 255.255.255.240 GigabitEthernet4/0/3.144 201.30.37.94
ip route 189.17.173.240 255.255.255.240 GigabitEthernet4/0/0.4 201.45.220.50
ip route 189.17.174.224 255.255.255.240 GigabitEthernet4/0/0.5 200.241.80.130
ip route 189.17.228.0 255.255.255.240 GigabitEthernet4/0/3.60 201.45.220.78
ip route 189.17.228.16 255.255.255.240 GigabitEthernet4/0/0.14 200.241.80.114
ip route 189.17.228.32 255.255.255.240 GigabitEthernet4/0/3.50 200.172.10.158
ip route 189.17.228.48 255.255.255.240 GigabitEthernet4/0/3.23 200.172.12.10
ip route 189.17.228.128 255.255.255.128 FastEthernet0/2/1 201.73.255.78
ip route 189.22.0.0 255.255.0.0 Null0 tag 200
ip route 189.22.180.0 255.255.255.240 GigabitEthernet0/0/4.110 200.172.12.134
ip route 189.22.180.16 255.255.255.240 Serial3/3/0.1/1/5/3:2 189.43.120.122
ip route 189.22.180.64 255.255.255.240 GigabitEthernet0/0/4.112 200.172.10.202
ip route 189.22.180.96 255.255.255.240 Serial3/3/0.1/2/1/1:2 201.45.138.118
ip route 189.22.180.144 255.255.255.240 Serial3/0/0.1/3/2/3:0
ip route 189.22.180.176 255.255.255.240 Multilink35592 200.172.13.34
ip route 189.22.181.0 255.255.255.128 GigabitEthernet4/0/3.106 201.30.37.2
ip route 189.22.181.240 255.255.255.240 GigabitEthernet0/0/4.115 200.172.10.86
ip route 189.22.226.0 255.255.255.240 GigabitEthernet0/0/4.304 200.241.80.78
ip route 189.22.226.216 255.255.255.248 GigabitEthernet4/0/3.46 189.23.68.18
ip route 189.22.228.0 255.255.255.192 GigabitEthernet0/0/4.203 200.249.145.210
ip route 189.22.228.64 255.255.255.192 GigabitEthernet0/0/4.203 200.249.145.210
ip route 189.22.228.144 255.255.255.240 GigabitEthernet4/0/3.210 200.172.13.2
ip route 189.22.228.224 255.255.255.240 GigabitEthernet4/0/3.34 200.172.13.166
ip route 189.22.238.192 255.255.255.240 FastEthernet0/2/5 200.241.80.18
ip route 189.22.238.208 255.255.255.240 Serial0/3/0.1/2/3/1:0
ip route 189.22.238.224 255.255.255.240 GigabitEthernet4/0/3.224 201.30.37.22
ip route 189.23.0.0 255.255.0.0 Null0 tag 200
ip route 189.23.27.128 255.255.255.128 GigabitEthernet0/0/4.214 201.73.255.154
ip route 189.23.142.160 255.255.255.240 GigabitEthernet4/0/3.10 200.172.10.54
ip route 189.23.142.208 255.255.255.240 GigabitEthernet0/0/4.111 200.172.10.70
ip route 189.23.220.0 255.255.255.128 Serial3/3/0.1/1/2/2:2 200.249.145.170
ip route 189.23.232.40 255.255.255.248 GigabitEthernet0/0/4.223 189.23.73.146
ip route 189.23.232.80 255.255.255.240 GigabitEthernet4/0/3.108 189.53.11.218
ip route 189.23.232.240 255.255.255.240 GigabitEthernet4/0/3.5 200.172.12.182
ip route 189.23.233.128 255.255.255.128 Serial3/3/0.1/1/4/1:1 189.23.28.50
ip route 189.42.0.0 255.255.0.0 Null0 tag 200
ip route 189.43.0.0 255.255.0.0 Null0 tag 200
ip route 189.43.17.112 255.255.255.240 GigabitEthernet4/0/3.121 200.172.10.238
ip route 189.43.18.128 255.255.255.128 Serial3/3/0.1/1/6/1:1 200.249.145.242
ip route 189.43.181.16 255.255.255.240 GigabitEthernet0/0/4.317 200.252.158.130
ip route 189.43.181.96 255.255.255.240 GigabitEthernet0/0/4.219 200.172.10.214
ip route 189.52.0.0 255.255.0.0 Null0 tag 200
ip route 189.52.170.192 255.255.255.240 GigabitEthernet0/0/4.106 187.29.255.250
ip route 189.52.170.224 255.255.255.240 GigabitEthernet4/0/0.350 201.30.37.46
ip route 189.52.170.240 255.255.255.240 GigabitEthernet4/0/3.78 200.172.12.6
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
ip route 200.166.97.80 255.255.255.240 GigabitEthernet0/0/4.204 200.172.10.166
ip route 200.166.97.112 255.255.255.240 GigabitEthernet0/0/4.307 200.172.10.114
ip route 200.166.99.32 255.255.255.240 GigabitEthernet4/0/1.13 200.172.10.190
ip route 200.166.99.112 255.255.255.240 GigabitEthernet4/0/3.51 200.179.212.218
ip route 200.167.0.0 255.255.0.0 Null0 tag 200
ip route 200.167.67.128 255.255.255.128 GigabitEthernet4/0/4 201.30.37.118
ip route 200.167.71.0 255.255.255.128 GigabitEthernet4/0/3.9 200.253.152.186
ip route 200.167.148.16 255.255.255.240 GigabitEthernet4/0/3.227 201.45.220.118
ip route 200.167.148.48 255.255.255.240 GigabitEthernet0/0/4.208 201.45.138.74
ip route 200.167.151.0 255.255.255.240 GigabitEthernet4/0/1.63 201.30.37.226
ip route 200.172.0.0 255.255.0.0 Null0 tag 200
ip route 200.172.84.128 255.255.255.128 Serial3/3/0.1/1/1/2:2 189.23.28.38
ip route 200.172.180.128 255.255.255.128 FastEthernet4/1/7 200.249.175.174
ip route 200.174.0.0 255.255.0.0 Null0 tag 200
ip route 200.178.0.0 255.255.0.0 Null0 tag 200
ip route 200.179.0.0 255.255.0.0 Null0 tag 200
ip route 200.182.0.0 255.255.0.0 Null0 tag 200
ip route 200.183.0.0 255.255.0.0 Null0 tag 200
ip route 200.191.0.0 255.255.0.0 Null0 tag 200
ip route 200.200.0.0 255.255.0.0 Null0 tag 200
ip route 200.208.0.0 255.255.0.0 Null0 tag 200
ip route 200.209.0.0 255.255.0.0 Null0 tag 200
ip route 200.209.37.0 255.255.255.128 GigabitEthernet4/0/0.117 200.249.169.210
ip route 200.209.121.0 255.255.255.128 GigabitEthernet4/0/4 201.30.37.118
ip route 200.209.188.112 255.255.255.240 GigabitEthernet4/0/3.217 200.241.80.18
ip route 200.209.191.128 255.255.255.128 GigabitEthernet4/0/3.22 187.28.122.254
ip route 200.210.0.0 255.255.0.0 Null0 tag 200
ip route 200.211.0.0 255.255.0.0 Null0 tag 200
ip route 200.212.0.0 255.255.0.0 Null0 tag 200
ip route 200.213.0.0 255.255.0.0 Null0 tag 200
ip route 200.214.0.0 255.255.0.0 Null0 tag 200
ip route 200.214.114.128 255.255.255.128 GigabitEthernet4/0/3.102 200.167.41.118
ip route 200.227.0.0 255.255.0.0 Null0 tag 200
ip route 200.228.0.0 255.255.0.0 Null0 tag 200
ip route 200.230.0.0 255.255.0.0 Null0 tag 200
ip route 200.231.0.0 255.255.0.0 Null0 tag 200
ip route 200.241.0.0 255.255.0.0 Null0 tag 200
ip route 200.242.0.0 255.255.0.0 Null0 tag 200
ip route 200.243.0.0 255.255.0.0 Null0 tag 200
ip route 200.243.105.192 255.255.255.240 GigabitEthernet4/0/0.38 200.172.13.246
ip route 200.244.0.0 255.255.0.0 Null0 tag 200
ip route 200.245.0.0 255.255.0.0 Null0 tag 200
ip route 200.246.0.0 255.255.0.0 Null0 tag 200
ip route 200.247.0.0 255.255.0.0 Null0 tag 200
ip route 200.248.0.0 255.255.0.0 Null0 tag 200
ip route 200.249.0.0 255.255.0.0 Null0 tag 200
ip route 200.249.77.160 255.255.255.240 GigabitEthernet0/0/4.323 200.252.158.182
ip route 200.249.77.208 255.255.255.240 GigabitEthernet4/0/3.221 201.45.220.2
ip route 200.249.151.128 255.255.255.128 GigabitEthernet4/0/4 201.30.37.118
ip route 200.249.159.0 255.255.255.128 GigabitEthernet4/0/0.60 200.172.12.42
ip route 200.249.167.144 255.255.255.240 GigabitEthernet4/0/1.42 201.30.37.142
ip route 200.249.167.160 255.255.255.240 GigabitEthernet4/0/1.57 201.30.37.146
ip route 200.249.167.240 255.255.255.240 GigabitEthernet4/0/3.12 200.179.212.70
ip route 200.250.0.0 255.255.0.0 Null0 tag 200
ip route 200.251.0.0 255.255.0.0 Null0 tag 200
ip route 200.252.0.0 255.255.0.0 Null0 tag 200
ip route 200.253.0.0 255.255.0.0 Null0 tag 200
ip route 200.253.129.192 255.255.255.240 GigabitEthernet4/0/4 201.30.37.118
ip route 200.253.129.208 255.255.255.240 GigabitEthernet4/0/0.143 201.45.220.62
ip route 200.253.153.128 255.255.255.128 Multilink45357 200.241.80.206
ip route 200.253.158.128 255.255.255.192 GigabitEthernet0/0/4.209 200.253.152.66
ip route 200.254.0.0 255.255.0.0 Null0 tag 200
ip route 200.255.0.0 255.255.0.0 Null0 tag 200
ip route 201.30.0.0 255.255.0.0 Null0 tag 200
ip route 201.31.0.0 255.255.0.0 Null0 tag 200
ip route 201.38.0.0 255.255.0.0 Null0 tag 200
ip route 201.38.44.0 255.255.255.128 GigabitEthernet4/0/3.25 200.249.175.182
ip route 201.38.47.0 255.255.255.240 GigabitEthernet4/0/1.6 200.172.12.114
ip route 201.38.203.208 255.255.255.240 GigabitEthernet4/0/0.17 200.172.13.182
ip route 201.38.205.0 255.255.255.128 Serial3/3/0.1/1/2/1:1 189.23.28.54
ip route 201.38.233.48 255.255.255.240 Serial3/3/0.1/2/2/2:2 201.45.138.150
ip route 201.38.233.80 255.255.255.240 Serial3/3/0.1/2/2/2:1 201.45.138.134
ip route 201.38.234.0 255.255.255.240 GigabitEthernet4/0/3.90 200.241.80.242
ip route 201.39.0.0 255.255.0.0 Null0 tag 200
ip route 201.39.89.0 255.255.255.240 GigabitEthernet4/0/0.43 200.172.13.254
ip route 201.39.89.16 255.255.255.240 Serial3/1/0.1/1/5/2:0
ip route 201.39.89.64 255.255.255.240 FastEthernet4/1/7 200.249.175.174
ip route 201.39.89.80 255.255.255.240 Serial3/1/0.1/2/2/1:0 200.209.190.178
ip route 201.39.89.128 255.255.255.240 GigabitEthernet0/0/4.413 200.241.80.90
ip route 201.44.0.0 255.255.0.0 Null0 tag 200
ip route 201.45.0.0 255.255.0.0 Null0 tag 200
ip route 201.45.204.32 255.255.255.240 GigabitEthernet4/0/0.24 200.172.13.206
ip route 201.56.0.0 255.255.0.0 Null0 tag 200
ip route 201.57.0.0 255.255.0.0 Null0 tag 200
ip route 201.57.39.176 255.255.255.240 GigabitEthernet0/0/4.103 200.172.10.26
ip route 201.57.39.208 255.255.255.240 Multilink35635 200.241.80.246
ip route 201.57.40.144 255.255.255.240 GigabitEthernet4/0/3.64 201.30.37.214
ip route 201.57.170.224 255.255.255.240 GigabitEthernet4/0/3.122 201.30.37.154
ip route 201.57.172.48 255.255.255.240 GigabitEthernet4/0/1.107 200.172.12.238
ip route 201.57.172.96 255.255.255.240 GigabitEthernet4/0/0.53 200.172.12.18
ip route 201.64.0.0 255.255.0.0 Null0 tag 200
ip route 201.65.0.0 255.255.0.0 Null0 tag 200
ip route 201.65.78.208 255.255.255.240 Multilink45337 187.28.240.22
ip route 201.65.78.240 255.255.255.240 GigabitEthernet4/0/3.2 200.172.10.138
ip route 201.65.121.176 255.255.255.240 GigabitEthernet4/0/3.119 200.179.212.118
ip route 201.65.221.16 255.255.255.240 GigabitEthernet4/0/3.15 189.52.211.34
ip route 201.65.221.64 255.255.255.240 GigabitEthernet0/0/4.406 200.172.12.138
ip route 201.65.221.208 255.255.255.248 Serial3/3/0.1/2/2/3:1 201.45.138.198
ip route 201.65.223.0 255.255.255.240 GigabitEthernet4/0/3.8 201.30.37.34
ip route 201.65.223.16 255.255.255.240 GigabitEthernet4/0/3.102 200.167.41.118
ip route 201.65.223.64 255.255.255.240 GigabitEthernet4/0/0.27 200.172.13.214
ip route 201.65.223.112 255.255.255.240 GigabitEthernet4/0/0.31 200.172.13.226
ip route 201.72.0.0 255.255.0.0 Null0 tag 200
ip route 201.73.0.0 255.255.0.0 Null0 tag 200
ip route 201.73.61.104 255.255.255.248 Serial3/3/0.1/2/3/2:1 189.52.190.14
ip route 201.73.61.176 255.255.255.240 GigabitEthernet0/0/4.421 201.30.37.174
ip route 201.73.254.128 255.255.255.240 GigabitEthernet0/0/4.319 189.53.246.158
ip route 201.73.254.208 255.255.255.240 GigabitEthernet4/0/3.118 200.172.12.122
ip route 201.90.0.0 255.255.0.0 Null0 tag 200
ip route 203.0.113.0 255.255.255.0 Null0 tag 200
ip route vrf BBRASIL:1588 10.6.134.161 255.255.255.255 Serial3/3/0.1/3/1/1:4.1 10.7.156.90
ip route vrf BCP_NO:4026 10.91.161.0 255.255.255.128 Serial3/1/0.1/2/5/3:0 200.253.132.74
ip route vrf BITCARD:6262 192.168.200.0 255.255.255.0 Serial3/3/0.1/3/7/2:1.1 200.252.158.166
ip route vrf NOVA_SOCIC:4117 172.16.60.0 255.255.255.0 GigabitEthernet4/0/0.35 200.172.12.206
ip route vrf GCRGOIANIA:3789 192.168.52.0 255.255.255.0 GigabitEthernet4/0/0.119 200.249.169.98
ip route vrf GCRGOIANIA:3789 192.168.54.0 255.255.255.0 GigabitEthernet4/0/0.99 200.249.169.78
ip route vrf INFRAERO:4781 10.0.248.64 255.255.255.255 Multilink35645 10.10.34.2
ip route vrf INFRAERO:4781 10.10.48.65 255.255.255.255 10.10.34.2
ip route vrf INFRAERO:4781 10.10.52.65 255.255.255.255 10.10.34.2
ip route vrf INFRAERO:4781 10.99.16.0 255.255.240.0 Multilink35645 10.10.34.2
ip route vrf MOURA:1648 172.17.102.0 255.255.255.0 Serial3/0/0.1/3/4/2:2.1 200.249.175.98
ip route vrf MPT_NOVA:6115 10.16.66.0 255.255.254.0 Multilink45324 192.168.41.206
ip route vrf REALIP_CLIENTE:5581 200.172.10.128 255.255.255.252 GigabitEthernet4/0/3.125 200.172.10.42
ip route vrf REALIP_CLIENTE:5581 200.172.10.192 255.255.255.252 GigabitEthernet4/0/3.54 200.172.10.146
ip route vrf REALIP_CLIENTE:5581 200.172.10.196 255.255.255.252 GigabitEthernet4/0/3.79 200.172.10.18
ip route vrf REALIP_CLIENTE:5581 200.172.10.220 255.255.255.252 GigabitEthernet4/0/0.64 200.172.10.50
ip route vrf REALIP_CLIENTE:5581 200.172.12.20 255.255.255.252 GigabitEthernet4/0/3.43 200.172.10.206
ip route vrf REALIP_CLIENTE:5581 200.172.12.200 255.255.255.252 GigabitEthernet4/0/3.63 200.172.10.182
ip route vrf REALIP_CLIENTE:5581 200.172.12.212 255.255.255.252 GigabitEthernet4/0/3.94 200.172.12.166
ip route vrf REALIP_CLIENTE:5581 200.172.12.240 255.255.255.252 GigabitEthernet4/0/0.50 200.172.10.74
ip route vrf REALIP_CLIENTE:5581 200.172.12.252 255.255.255.252 GigabitEthernet4/0/0.59 200.172.12.150
ip route vrf REALIP_CLIENTE:5581 200.172.13.4 255.255.255.252 GigabitEthernet4/0/3.75 200.172.12.230
ip route vrf REALIP_CLIENTE:5581 200.172.13.44 255.255.255.252 GigabitEthernet4/0/3.24 200.172.13.46
ip route vrf REALIP_CLIENTE:5581 200.172.13.72 255.255.255.252 GigabitEthernet4/0/3.67 200.172.12.94
ip route vrf REALIP_CLIENTE:5581 200.172.13.96 255.255.255.252 GigabitEthernet4/0/0.51 200.172.13.70
ip route vrf REALIP_CLIENTE:5581 200.172.13.140 255.255.255.252 GigabitEthernet4/0/0.73 200.172.10.6
ip route vrf REALIP_CLIENTE:5581 200.172.13.152 255.255.255.252 GigabitEthernet4/0/3.49 200.172.13.106
ip route vrf REALIP_CLIENTE:5581 200.179.212.4 255.255.255.252 GigabitEthernet4/0/3.155 200.241.80.126
ip route vrf REALIP_CLIENTE:5581 200.179.212.60 255.255.255.252 GigabitEthernet4/0/3.24 200.172.13.46
ip route vrf REALIP_CLIENTE:5581 200.179.212.124 255.255.255.252 GigabitEthernet4/0/0.56 200.179.212.122
ip route vrf REALIP_CLIENTE:5581 200.179.212.168 255.255.255.252 GigabitEthernet4/0/3.105 200.172.13.242
ip route vrf REALIP_CLIENTE:5581 200.179.212.208 255.255.255.252 GigabitEthernet4/0/1.306 200.179.212.206
ip route vrf REALIP_CLIENTE:5581 200.179.212.224 255.255.255.252 GigabitEthernet4/0/1.27 200.179.212.222
ip route vrf REALIP_CLIENTE:5581 200.179.212.228 255.255.255.252 GigabitEthernet4/0/3.82 200.179.212.90
ip route vrf REALIP_CLIENTE:5581 200.179.212.232 255.255.255.252 GigabitEthernet4/0/0.58 200.172.13.86
ip route vrf REALIP_CLIENTE:5581 200.179.212.240 255.255.255.252 GigabitEthernet4/0/1.305 200.179.212.238
ip route vrf REALIP_CLIENTE:5581 200.179.212.248 255.255.255.252 GigabitEthernet4/0/3.301 200.179.212.246
ip route vrf REALIP_CLIENTE:5581 200.241.80.28 255.255.255.252 GigabitEthernet4/0/1.4 200.172.13.158
ip route vrf REALIP_CLIENTE:5581 200.241.80.80 255.255.255.252 GigabitEthernet4/0/0.21 200.172.12.110
ip route vrf REALIP_CLIENTE:5581 200.241.80.104 255.255.255.252 GigabitEthernet4/0/3.55 200.241.80.86
ip route vrf REALIP_CLIENTE:5581 200.241.80.144 255.255.255.252 GigabitEthernet4/0/3.57 200.172.10.62
ip route vrf REALIP_CLIENTE:5581 200.241.80.156 255.255.255.252 GigabitEthernet4/0/3.87 200.172.12.62
ip route vrf REALIP_CLIENTE:5581 200.241.80.216 255.255.255.252 GigabitEthernet4/0/3.66 200.241.80.122
ip route vrf REALIP_CLIENTE:5581 200.241.80.224 255.255.255.252 GigabitEthernet4/0/3.39 200.172.12.118
ip route vrf REALIP_CLIENTE:5581 201.30.37.16 255.255.255.252 GigabitEthernet4/0/3.85 200.172.13.210
ip route vrf REALIP_CLIENTE:5581 201.30.37.32 255.255.255.252 GigabitEthernet4/0/3.48 201.30.37.10
ip route vrf REALIP_CLIENTE:5581 201.30.37.72 255.255.255.252 GigabitEthernet4/0/3.71 201.30.37.62
ip route vrf REALIP_CLIENTE:5581 201.30.37.84 255.255.255.252 GigabitEthernet4/0/1.51 201.30.37.78
ip route vrf REALIP_CLIENTE:5581 201.30.37.108 255.255.255.252 GigabitEthernet4/0/0.65 200.172.13.230
ip route vrf REALIP_CLIENTE:5581 201.30.37.120 255.255.255.252 GigabitEthernet4/0/3.74 200.241.80.26
ip route vrf REALIP_CLIENTE:5581 201.30.37.176 255.255.255.252 GigabitEthernet4/0/3.37 200.172.12.14
ip route vrf REALIP_CLIENTE:5581 201.30.37.180 255.255.255.252 GigabitEthernet4/0/3.68 201.30.37.134
ip route vrf REALIP_CLIENTE:5581 201.30.37.184 255.255.255.252 GigabitEthernet4/0/0.29 200.172.10.106
ip route vrf REALIP_CLIENTE:5581 201.30.37.204 255.255.255.252 GigabitEthernet4/0/3.44 201.30.37.190
ip route vrf REALIP_CLIENTE:5581 201.30.37.240 255.255.255.252 GigabitEthernet4/0/0.3 200.172.12.170
ip route vrf REALIP_CLIENTE:5581 201.30.37.252 255.255.255.252 GigabitEthernet4/0/3.72 201.30.37.106
ip route vrf REALIP_CLIENTE:5581 201.45.220.8 255.255.255.252 GigabitEthernet4/0/3.58 201.45.220.6
ip route vrf REALIP_CLIENTE:5581 201.45.220.16 255.255.255.252 GigabitEthernet4/0/3.19 201.45.220.14
ip route vrf REALIP_CLIENTE:5581 201.45.220.24 255.255.255.252 GigabitEthernet4/0/3.32 201.45.220.22
ip route vrf REALIP_CLIENTE:5581 201.45.220.56 255.255.255.252 GigabitEthernet4/0/3.302 201.45.220.54
ip route vrf REALIP_CLIENTE:5581 201.45.220.68 255.255.255.252 GigabitEthernet4/0/3.20 201.45.220.66
ip route vrf REALIP_CLIENTE:5581 201.45.220.72 255.255.255.252 GigabitEthernet4/0/0.30 201.45.220.46
ip route vrf REALIP_CLIENTE:5581 201.45.220.84 255.255.255.252 GigabitEthernet4/0/0.32 201.45.220.82
ip route vrf REALIP_CLIENTE:5581 201.45.220.88 255.255.255.252 GigabitEthernet4/0/3.70 201.30.37.126
ip route vrf REALIP_CLIENTE:5581 201.45.220.92 255.255.255.252 GigabitEthernet4/0/3.83 200.172.13.30
ip route vrf REALIP_CLIENTE:5581 201.45.220.100 255.255.255.252 GigabitEthernet4/0/3.84 201.45.220.98
ip route vrf REALIP_CLIENTE:5581 201.45.220.108 255.255.255.252 GigabitEthernet4/0/3.91 201.45.220.106
ip route vrf REDEVIP_BLD_MLPPP:3799 0.0.0.0 0.0.0.0 200.230.224.25 global
ip route vrf REDEVIP_BLD_MLPPP:3799 0.0.0.0 0.0.0.0 200.230.224.45 global
ip route vrf REDEVIP_BLD_MLPPP:3799 0.0.0.0 0.0.0.0 200.244.41.18 global
ip route vrf REDEVIP_BLD_MLPPP:3799 0.0.0.0 0.0.0.0 200.244.41.23 global
ip route vrf REDEVIP_BLD_MLPPP:3799 200.167.71.0 255.255.255.128 GigabitEthernet4/0/3.9 200.253.152.186
ip route vrf SET_MA:3377 192.168.50.0 255.255.255.0 Serial3/0/0.1/3/3/3:5 189.43.120.58
ip route vrf SET_MA:3377 192.168.80.0 255.255.255.0 Serial3/0/0.1/3/4/1:1 200.249.174.230
ip route vrf SET_MA:3377 192.168.122.0 255.255.255.0 Serial3/0/0.1/3/3/2:7 189.43.120.106
ip route vrf SUPERMMACIEL:3754 0.0.0.0 0.0.0.0 Multilink12 187.28.240.110
ip route vrf SUPERMMACIEL:3754 150.61.99.0 255.255.255.0 Multilink35705 189.52.190.38
ip route vrf SUPERMMACIEL:3754 192.168.1.0 255.255.255.0 Multilink35705 189.52.190.38
ip route vrf SUPERMMACIEL:3754 192.168.3.0 255.255.255.0 Multilink35544 189.43.120.186
ip route vrf TECBAN:1221 10.250.5.216 255.255.255.248 GigabitEthernet4/0/0.95 10.245.2.238
ip route vrf TECBAN:1221 10.250.33.216 255.255.255.248 GigabitEthernet4/0/0.90 10.245.16.238
ip route vrf TECBAN:1221 10.250.35.64 255.255.255.248 GigabitEthernet4/0/0.96 10.245.17.162
ip route vrf TECBAN:1221 10.250.51.240 255.255.255.248 GigabitEthernet4/0/0.92 10.245.25.250
ip route vrf TECBAN:1221 10.250.52.40 255.255.255.248 GigabitEthernet4/0/0.94 10.245.26.22
ip route vrf TECBAN:1221 10.250.59.184 255.255.255.248 GigabitEthernet4/0/0.106 10.245.29.222
ip route vrf TECBAN:1221 10.250.59.200 255.255.255.248 GigabitEthernet4/0/0.118 10.245.29.230
ip route vrf TVGLOBO_NOVA:2610 192.9.0.0 255.255.0.0 GigabitEthernet0/0/4.403 200.249.145.2
ip route vrf UNICRED:1647 10.98.64.0 255.255.255.0 Serial3/0/0.1/3/4/1:3.1 200.172.11.22
ip tacacs source-interface Loopback0
!
ip extcommunity-list 54 permit rt 4230:154151
ip extcommunity-list 55 permit rt 4230:4794
ip extcommunity-list 56 permit rt 4230:3564
ip extcommunity-list 57 permit rt 4230:154152
ip extcommunity-list 58 permit rt 28513:50172
ip extcommunity-list 59 permit rt 4230:1337
ip extcommunity-list 61 permit rt 4230:1340
ip extcommunity-list 62 permit rt 4230:1956
ip extcommunity-list 80 permit rt 4230:1663
ip extcommunity-list 81 permit rt 4230:1912
ip extcommunity-list 82 permit rt 4230:4523
ip extcommunity-list 111 permit RT:4230:2908
ip extcommunity-list 112 permit RT:4230:3449
ip extcommunity-list 113 permit RT:4230:1337
ip extcommunity-list 171 permit rt 4230:5027
ip extcommunity-list 172 permit rt 4230:4384
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
ip community-list 149 permit 4230:5581
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
ip community-list 188 permit 4230:188
ip community-list 191 permit 4230:191
ip community-list 192 permit 4230:192
ip community-list 193 permit 4230:193
ip community-list 194 permit 4230:194
ip community-list 195 permit 4230:195
ip community-list 196 permit 4230:196
ip community-list 198 permit 4230:198
ip community-list 222 permit 4384:4384
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
ip community-list standard TINET-BLACKHOLE permit 3257:2666
ip community-list standard BERTIN_LIS permit 700:700
ip community-list standard FRIBOI_SPO permit 500:500
ip community-list standard INTELIQUENT-BLACKHOLE permit 3257:2666
ip community-list standard TELIASONERA-BLACKHOLE permit 1299:999
ip community-list standard TATA-BLACKHOLE permit 64999:0
ip community-list standard BLACKHOLE-PE-NAC-CLIENTE permit 4230:10008
ip community-list standard BLACKHOLE-PE-NAC-EBT permit 4230:10009
ip community-list standard BLACKHOLE-PE-CLIENTE permit 4230:10006
ip community-list standard BLACKHOLE-PE-EBT permit 4230:10007
ip community-list expanded ANTT-VOIP permit 1124:323
ip community-list expanded VRF_DNPM_VOIP permit 323:323
ip community-list expanded TST10 permit 1024:23
ip community-list expanded TST11 permit 1024:324
ip community-list expanded TST12 permit 1024:323
ip community-list expanded TST13 permit 1024:200
ip community-list expanded ANVISA-VOIP permit 65001:4356
ip community-list expanded ANVISA-GER permit 65001:4357
ip community-list expanded DPRF-VOIP permit 1024:1323
ip community-list expanded DPRF-GERENCIA permit 1024:1001
ip as-path access-list 1 permit ^$
ip as-path access-list 101 permit ^(53128_)+$
ip as-path access-list 102 permit ^(53212_)+$
ip as-path access-list 104 permit ^(266161_)+$
ip as-path access-list 106 permit ^(28573_)+$
ip as-path access-list 107 permit ^(263430_)+$
ip as-path access-list 108 permit ^(263049_)+$
ip as-path access-list 109 permit ^(264262_)+$
ip as-path access-list 200 permit ^$
ip ospf name-lookup
ip pim ssm range 99
ip pim vrf BBRASIL:1588 rp-address 10.6.128.3 override
ip pim vrf BBRASIL_PAE:7041 rp-address 10.6.128.3 override
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
ip pim vrf MPT_NOVA:6115 rp-address 192.168.253.2 override
ip pim vrf RCC_GST_MPLS1:4457 rp-address 10.6.127.254 override
ip pim vrf RCC_RUN_MPLS1:4455 rp-address 10.6.127.254 override
ip pim vrf BBRASIL_NAC:7399 rp-address 10.53.128.254 override
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
ip pim vrf HONEY_INT_0:7013 autorp listener
!
!
ip prefix-list ABNAMRO_DEFAULT seq 5 permit 10.0.0.0/8
!
ip prefix-list ANULA_DEFAULT seq 5 permit 0.0.0.0/0 ge 1
!
ip prefix-list COND_LOOP seq 10 permit 200.244.41.1/32
!
ip prefix-list NORSEGEL seq 5 permit 189.43.197.88/30
ip prefix-list NORSEGEL seq 10 permit 189.43.197.90/32
!
ip prefix-list REDE_IMIFARMA seq 5 permit 0.0.0.0/0 le 32
!
ip prefix-list REDE_SERMA seq 5 permit 0.0.0.0/0
ip prefix-list REDE_SERMA seq 10 permit 172.31.5.250/32
!
ip prefix-list REMOTE_NET_WAN seq 5 permit 187.28.0.0/16 le 30
ip prefix-list REMOTE_NET_WAN seq 10 permit 187.29.0.0/16 le 30
ip prefix-list REMOTE_NET_WAN seq 15 permit 187.30.0.0/16 le 30
ip prefix-list REMOTE_NET_WAN seq 20 permit 189.2.0.0/16 le 30
ip prefix-list REMOTE_NET_WAN seq 25 permit 189.3.0.0/16 le 30
ip prefix-list REMOTE_NET_WAN seq 30 permit 189.16.0.0/16 le 30
ip prefix-list REMOTE_NET_WAN seq 35 permit 189.17.0.0/16 le 30
ip prefix-list REMOTE_NET_WAN seq 40 permit 189.22.0.0/16 le 30
ip prefix-list REMOTE_NET_WAN seq 45 permit 189.23.0.0/16 le 30
ip prefix-list REMOTE_NET_WAN seq 50 permit 189.42.0.0/16 le 30
ip prefix-list REMOTE_NET_WAN seq 55 permit 189.43.0.0/16 le 30
ip prefix-list REMOTE_NET_WAN seq 60 permit 189.52.0.0/16 le 30
ip prefix-list REMOTE_NET_WAN seq 65 permit 189.53.0.0/16 le 30
ip prefix-list REMOTE_NET_WAN seq 70 permit 189.86.0.0/16 le 30
ip prefix-list REMOTE_NET_WAN seq 75 permit 189.87.0.0/16 le 30
ip prefix-list REMOTE_NET_WAN seq 80 permit 200.166.0.0/16 le 30
ip prefix-list REMOTE_NET_WAN seq 85 permit 200.167.0.0/16 le 30
ip prefix-list REMOTE_NET_WAN seq 90 permit 200.172.0.0/16 le 30
ip prefix-list REMOTE_NET_WAN seq 95 permit 200.174.0.0/16 le 30
ip prefix-list REMOTE_NET_WAN seq 100 permit 200.178.0.0/16 le 30
ip prefix-list REMOTE_NET_WAN seq 105 permit 200.179.0.0/16 le 30
ip prefix-list REMOTE_NET_WAN seq 110 permit 200.182.0.0/16 le 30
ip prefix-list REMOTE_NET_WAN seq 115 permit 200.183.0.0/16 le 30
ip prefix-list REMOTE_NET_WAN seq 117 permit 200.190.0.0/16 le 30
ip prefix-list REMOTE_NET_WAN seq 119 permit 200.191.0.0/16 le 30
ip prefix-list REMOTE_NET_WAN seq 120 permit 200.200.0.0/16 le 30
ip prefix-list REMOTE_NET_WAN seq 125 permit 200.208.0.0/16 le 30
ip prefix-list REMOTE_NET_WAN seq 130 permit 200.209.0.0/16 le 30
ip prefix-list REMOTE_NET_WAN seq 135 permit 200.210.0.0/16 le 30
ip prefix-list REMOTE_NET_WAN seq 140 permit 200.211.0.0/16 le 30
ip prefix-list REMOTE_NET_WAN seq 145 permit 200.212.0.0/16 le 30
ip prefix-list REMOTE_NET_WAN seq 150 permit 200.213.0.0/16 le 30
ip prefix-list REMOTE_NET_WAN seq 155 permit 200.214.0.0/16 le 30
ip prefix-list REMOTE_NET_WAN seq 157 permit 200.227.0.0/16 le 30
ip prefix-list REMOTE_NET_WAN seq 160 permit 200.228.0.0/16 le 30
ip prefix-list REMOTE_NET_WAN seq 165 permit 200.230.0.0/16 le 30
ip prefix-list REMOTE_NET_WAN seq 170 permit 200.231.0.0/16 le 30
ip prefix-list REMOTE_NET_WAN seq 175 permit 200.241.0.0/16 le 30
ip prefix-list REMOTE_NET_WAN seq 180 permit 200.242.0.0/16 le 30
ip prefix-list REMOTE_NET_WAN seq 185 permit 200.243.0.0/16 le 30
ip prefix-list REMOTE_NET_WAN seq 190 permit 200.244.0.0/16 le 30
ip prefix-list REMOTE_NET_WAN seq 195 permit 200.245.0.0/16 le 30
ip prefix-list REMOTE_NET_WAN seq 200 permit 200.246.0.0/16 le 30
ip prefix-list REMOTE_NET_WAN seq 205 permit 200.247.0.0/16 le 30
ip prefix-list REMOTE_NET_WAN seq 210 permit 200.248.0.0/16 le 30
ip prefix-list REMOTE_NET_WAN seq 215 permit 200.249.0.0/16 le 30
ip prefix-list REMOTE_NET_WAN seq 220 permit 200.250.0.0/16 le 30
ip prefix-list REMOTE_NET_WAN seq 225 permit 200.251.0.0/16 le 30
ip prefix-list REMOTE_NET_WAN seq 230 permit 200.252.0.0/16 le 30
ip prefix-list REMOTE_NET_WAN seq 235 permit 200.253.0.0/16 le 30
ip prefix-list REMOTE_NET_WAN seq 240 permit 200.254.0.0/16 le 30
ip prefix-list REMOTE_NET_WAN seq 245 permit 200.255.0.0/16 le 30
ip prefix-list REMOTE_NET_WAN seq 250 permit 201.30.0.0/16 le 30
ip prefix-list REMOTE_NET_WAN seq 255 permit 201.31.0.0/16 le 30
ip prefix-list REMOTE_NET_WAN seq 260 permit 201.38.0.0/16 le 30
ip prefix-list REMOTE_NET_WAN seq 265 permit 201.39.0.0/16 le 30
ip prefix-list REMOTE_NET_WAN seq 270 permit 201.44.0.0/16 le 30
ip prefix-list REMOTE_NET_WAN seq 275 permit 201.45.0.0/16 le 30
ip prefix-list REMOTE_NET_WAN seq 280 permit 201.56.0.0/16 le 30
ip prefix-list REMOTE_NET_WAN seq 285 permit 201.57.0.0/16 le 30
ip prefix-list REMOTE_NET_WAN seq 290 permit 201.64.0.0/16 le 30
ip prefix-list REMOTE_NET_WAN seq 295 permit 201.65.0.0/16 le 30
ip prefix-list REMOTE_NET_WAN seq 300 permit 201.72.0.0/16 le 30
ip prefix-list REMOTE_NET_WAN seq 305 permit 201.73.0.0/16 le 30
ip prefix-list REMOTE_NET_WAN seq 310 permit 201.90.0.0/16 le 30
!
ip prefix-list ROTA_DEFAULT seq 5 permit 0.0.0.0/0
!
ip prefix-list SAM_DADOS seq 5 permit 189.88.240.0/20 le 32
ip prefix-list SAM_DADOS seq 10 deny 0.0.0.0/0 le 32
!
ip prefix-list SPV_GCPE seq 10 permit 200.255.27.192/26 le 32
!
ip access-list standard CANAO_SLS
  permit 200.244.41.235
  permit 200.244.41.234
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
map-class frame-relay QOS_CLASS_A_F_2048K_200K_200K_528K_0B
 service-policy input QOS_POLICY_IN_A_10P_25P
 service-policy output QOS_POLICY_OUT_A_10P_25P
!
map-class frame-relay QC_AF_1024K_13_N_0_50_10_10_2_14_0B
 service-policy input QPI_A_1024K_13_N_0_50_10_10_2_14
 service-policy output QPO_A_1024K_13_0_50_10_10_2_14
!
map-class frame-relay QC_AF_512K_10_N_0_54_22_0_4_9_256B
 frame-relay fragment 256
 service-policy input QPI_A_512K_10_N_0_54_22_0_4_9
 service-policy output QPO_A_512K_10_0_54_22_0_4_9
!
map-class frame-relay QC_AF_512K_13_N_0_25_0_0_4_57_512B
 frame-relay fragment 512
 service-policy input QPI_A_512K_13_N_0_25_0_0_4_57
 service-policy output QPO_A_512K_13_0_25_0_0_4_57
!
map-class frame-relay QC_AF_2048K_7_N_0_63_0_15_2_12_0B
 service-policy input QPI_A_2048K_7_N_0_63_0_15_2_12
 service-policy output QPO_A_2048K_7_0_63_0_15_2_12
!
map-class frame-relay QC_BBONE_EXP_V1
 service-policy input QPI_BBONE_EXP_V1
!
map-class frame-relay QC_64K_BBrasil_PAE_IOS_V1
!
map-class frame-relay QC_AF_1024K_22_N_0_0_50_0_2_22_0B
 service-policy input QPI_A_1024K_22_N_0_0_50_0_2_22
 service-policy output QPO_A_1024K_22_0_0_50_0_2_22
!
map-class frame-relay QC_AF_512K_10_N_0_54_22_0_4_9_0B
 service-policy input QPI_A_512K_10_N_0_54_22_0_4_9
 service-policy output QPO_A_512K_10_0_54_22_0_4_9
!
map-class frame-relay QC_AF_256K_10_N_0_61_13_0_7_8_256B
 frame-relay fragment 256
 service-policy input QPI_A_256K_10_N_0_61_13_0_7_8
 service-policy output QPO_A_256K_10_0_61_13_0_7_8
!
map-class frame-relay QC_AF_256K_25_N_0_50_0_0_7_16_256B
 frame-relay fragment 256
 service-policy input QPI_A_256K_25_N_0_50_0_0_7_16
 service-policy output QPO_A_256K_25_0_50_0_0_7_16
!
map-class frame-relay QC_AF_512K_7_N_0_11_16_0_4_61_512B
 frame-relay fragment 512
 service-policy input QPI_A_512K_7_N_0_11_16_0_4_61
 service-policy output QPO_A_512K_7_0_11_16_0_4_61
!
map-class frame-relay QC_AF_1024K_25_N_0_40_0_0_2_32_0B
 service-policy input QPI_A_1024K_25_N_0_40_0_0_2_32
 service-policy output QPO_A_1024K_25_0_40_0_0_2_32
!
map-class frame-relay QC_AF_512K_7_N_0_11_16_0_4_61_0B
 service-policy input QPI_A_512K_7_N_0_11_16_0_4_61
 service-policy output QPO_A_512K_7_0_11_16_0_4_61
!
map-class frame-relay QC_2M_820_0_312_162_134_108_0B_A_V1
 service-policy input QPI_2M_820_0_312_162_134_108_0B_A_V1
 service-policy output QDO_2M_820_0_312_162_134_108_0B_A_V1
!
map-class frame-relay QC_AF_512K_21_N_0_50_0_0_4_24_0B
 service-policy input QPI_A_512K_21_N_0_50_0_0_4_24
 service-policy output QPO_A_512K_21_0_50_0_0_4_24
!
map-class frame-relay QC_AF_512K_13_N_0_25_25_13_4_2_512B
 frame-relay fragment 512
 service-policy input QPI_A_512K_13_N_0_25_25_13_4_2
 service-policy output QPO_A_512K_13_0_25_25_13_4_2
!
map-class frame-relay QC_AF_512K_50_N_0_10_0_0_4_35_512B
 frame-relay fragment 512
 service-policy input QPI_A_512K_50_N_0_10_0_0_4_35
 service-policy output QPO_A_512K_50_0_10_0_0_4_35
!
map-class frame-relay QC_AF_256K_13_N_0_4_0_0_7_75_256B
 frame-relay fragment 256
 service-policy input QPI_A_256K_13_N_0_4_0_0_7_75
 service-policy output QPO_A_256K_13_0_4_0_0_7_75
!
map-class frame-relay QC_AF_256K_13_N_0_4_0_0_7_74_256B
 frame-relay fragment 256
 service-policy input QPI_A_256K_13_N_0_4_0_0_7_74
 service-policy output QPO_A_256K_13_0_4_0_0_7_74
!
map-class frame-relay QC_AF_512K_10_N_0_54_22_0_4_9_512B
 frame-relay fragment 512
 service-policy input QPI_A_512K_10_N_0_54_22_0_4_9
 service-policy output QPO_A_512K_10_0_54_22_0_4_9
!
map-class frame-relay QC_AF_512K_5_N_0_2_0_0_4_88_0B
 service-policy input QPI_A_512K_5_N_0_2_0_0_4_88
 service-policy output QPO_A_512K_5_0_2_0_0_4_88
!
map-class frame-relay QC_MCI_ETM_1536K_64K_1472K_V1
 service-policy input QPI_MCI_ETM_1536K_64K_1472K_V1
 service-policy output QDO_MCI_ETM_1536K_64K_1472K_V1
!
map-class frame-relay QC_MB_512_152_128_104_0B_G5_V1
 service-policy input QPI_MB_512_152_128_104_0B_G5_V1
 service-policy output QDO_MB_512_152_128_104_0B_G5_V1
!
map-class frame-relay QC_AF_512K_7_N_0_24_27_5_4_2_512B
 frame-relay fragment 512
 service-policy input QPI_A_512K_7_N_0_24_27_5_4_2
 service-policy output QPO_A_512K_7_0_24_27_5_4_2
!
map-class frame-relay QC_AF_256K_38_C_0_36_0_0_7_18_256B
 frame-relay fragment 256
 service-policy input QPI_A_256K_38_C_0_36_0_0_7_18
 service-policy output QPO_A_256K_38_0_36_0_0_7_18
!
map-class frame-relay QC_64_30_0_25_8_0_0_0B_A_V1
 frame-relay fragment 128
 service-policy input QPI_64_30_0_25_8_0_0_0B_A_V1
 service-policy output QPO_64_30_0_25_8_0_0_0B_A_V1
!
map-class frame-relay QC_BBONE_DSCP_V1
 service-policy input QPI_BBONE_DSCP_V1
!
map-class frame-relay QC_MCI_ETM_1536K_0_1536K_V1
 service-policy input QPI_MCI_ETM_1536K_0_1536K_V1
 service-policy output QDO_MCI_ETM_1536K_0_1536K_V1
!
map-class frame-relay QC_BBONE_N_256_V1
 service-policy input QPI_BBONE_N_256_V1
 service-policy output QPO_BBONE_256_V1
!
map-class frame-relay QC_AF_512K_13_N_0_47_13_13_4_7_640B
 frame-relay fragment 512
 service-policy input QPI_A_512K_13_N_0_47_13_13_4_7
 service-policy output QPO_A_512K_13_0_47_13_13_4_7
!
map-class frame-relay QC_AF_512K_30_N_0_21_10_30_4_4_0B
 service-policy input QPI_A_512K_30_N_0_21_10_30_4_4
 service-policy output QPO_A_512K_30_0_21_10_30_4_4
!
map-class frame-relay QC_256K_BBrasil_NAC_GACC_V1
 service-policy input QDI_256K_BBrasil_NAC_GACC_V1
 service-policy output QDO_256K_BBrasil_NAC_GACC_V1
!
map-class frame-relay QC_AF_512K_25_N_0_10_0_0_4_60_640B
 frame-relay fragment 512
 service-policy input QPI_A_512K_25_N_0_10_0_0_4_60
 service-policy output QPO_A_512K_25_0_10_0_0_4_60
!
map-class frame-relay QC_AF_256K_25_N_0_50_0_0_7_16_320B
 frame-relay fragment 256
 service-policy input QPI_A_256K_25_N_0_50_0_0_7_16
 service-policy output QPO_A_256K_25_0_50_0_0_7_16
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
access-list 51 deny   200.218.65.32 0.0.0.31
access-list 51 deny   200.218.64.160 0.0.0.15
access-list 51 permit any
access-list 99 permit 239.232.0.0 0.0.255.255
access-list 99 permit 239.233.0.0 0.0.255.255
access-list 2020 permit ip any 177.105.209.54 0.0.0.1
access-list 2020 permit ip any 177.105.209.10 0.0.0.1
access-list 2020 permit ip any 177.105.211.10 0.0.0.1
access-list 2020 permit ip any any
access-list 2300 permit ip 78.152.39.224 0.0.0.15 host 189.22.181.199
access-list 2300 deny   ip any any
access-list 2301 permit ip host 200.249.84.133 any
access-list 2301 permit ip any any
access-list 2302 permit ip any host 200.249.84.133
access-list 2302 permit ip any any
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
route-map REALIP_CLIENTE permit 10
 set community 4230:5581
!
route-map NETSERVICOS_IN permit 10
 match as-path 106
 set community 4230:21 4230:30 4230:198
!
route-map MC_QUARESMA_IN permit 10
 match as-path 109
 set community 4230:11 4230:30 4230:113
!
route-map SAM_DADOS_IN permit 10
 match ip address prefix-list SAM_DADOS
 set community 4230:4 4230:21 4230:198
!
route-map CEUMA_IN permit 10
 match as-path 104
 set community 4230:11 4230:30 4230:195
!
route-map LATAM_TELMEX permit 10
 set community 28513:1281
!
route-map ZUNET_IN permit 10
 match as-path 102
 set community 4230:21 4230:30 4230:31 4230:198
!
route-map CVRD_ULTRA_IMP deny 5
 match community 102
!
route-map CVRD_ULTRA_IMP deny 8
 match community 222
!
route-map CVRD_ULTRA_IMP permit 10
 match extcommunity 171 172
 set metric 150
 set weight 150
!
route-map CVRD_ULTRA_IMP permit 20
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
route-map NGN_ONLY permit 10
 match ip address CANAO_SLS
!
route-map NGN_ONLY deny 20
!
route-map BBRASIL_CE_OUT permit 10
 match community 421 431
!
route-map REALIP_SBC permit 10
 match community 149
!
route-map COND_DEFAULT permit 10
 match ip address prefix-list COND_LOOP
!
route-map RM_ECT_CONNECTED permit 10
 set community 0:2120
!
route-map TESTE_PROSEGUR deny 5
 match ip address prefix-list NORSEGEL
!
route-map TESTE_PROSEGUR permit 10
 match ip address prefix-list ROTA_DEFAULT
!
route-map STATIC deny 5
 match tag 200
!
route-map STATIC permit 10
 match ip address 2550
 set origin igp
 set community 4230:50 4230:198
!
route-map SERVENGMATRIZ_46711872812222 permit 10
!
route-map WIMAX_EBT_385517216082 permit 10
!
route-map CAEMA_34631892328122 permit 10
!
route-map CEMAR_EXT_EQUATORIAL permit 10
 match ip address prefix-list ROTA_DEFAULT
 set extcommunity rt  4230:3468
!
route-map CEMAR_EXT_EQUATORIAL permit 20
!
route-map NORSERGEL_PROSEGUR permit 10
 match extcommunity 57
!
route-map NORSERGEL_PROSEGUR permit 20
 match extcommunity 55
!
route-map NORSERGEL_PROSEGUR permit 30
 match extcommunity 59
!
route-map SERPRO_SLS_RFB_10_590910532158 permit 10
!
route-map CAEMA_346318943197194 permit 10
!
route-map CAEMA_346320145138182 permit 10
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
route-map CAEMA_346318943197170 permit 10
!
route-map CAEMA_346318943197214 permit 10
!
route-map CAEMA_3463201451382 permit 10
!
route-map LATAM_TELMEX_285_SG permit 10
 set community 28513:285 28513:1281 additive
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
route-map BB-LT2-NAC-REMOTOS-IN permit 10
 match community 442
!
route-map BB-LT3-NAC-REMOTOS-IN permit 10
 match community 444
!
route-map OLC_SERVICOS_IN permit 10
 match as-path 107
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
route-map DNPM_EXPORT_MAP permit 20
 match community VRF_DNPM_VOIP
 set extcommunity rt  4230:153482
!
route-map DNPM_EXPORT_MAP permit 40
!
route-map SBC_CLIENTE permit 10
 set community 4230:3108
!
route-map SET_COMMUNITY_GERENCIA_CQMR permit 10
 set community 4230:5110 additive
!
route-map ANTT_EXPORT_MAP permit 20
 description marcacao de extcommunity para as loopbacks 323 aprendidas
 match community ANTT-VOIP
 set extcommunity rt  4230:152753
!
route-map ANTT_EXPORT_MAP permit 40
 description nao altera extcommunity para as demais rotas
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
route-map VIA_EMBRATEL_IN permit 10
 match as-path 101
 set community 4230:21 4230:30 4230:198
!
route-map COELHOEFERNANDES_IN permit 10
 match as-path 108
 set community 4230:21 4230:30 4230:198
!
route-map NGN-GER_1416102532178 permit 10
!
route-map GERENCIA_GCPE deny 10
 match ip address prefix-list SPV_GCPE
!
route-map GERENCIA_GCPE permit 20
 match ip address prefix-list REMOTE_NET_WAN
 match as-path 200
!
route-map CONNECTED permit 10
 match ip address 2550
 set origin igp
 set community 4230:50 4230:198
!
route-map LATAM_TELMEX_286 permit 10
 match ip address LATAM_TELMEX
 set community 4230:5110 28513:286 28513:1281 additive
!
route-map LATAM_TELMEX_285 permit 10
 set community 28513:285 28513:1281 additive
!
route-map IBGP_RR-CLIENT_PARTIAL_OUT permit 10
 match as-path 1
!
route-map IBGP_RR-CLIENT_PARTIAL_OUT permit 20
 match community 2 3 4
!
route-map FROM_OS_999_TO_OS_BB permit 10
 set metric 999
 set tag 9998
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
tacacs-server key 7 03074E050F032842491C18
!
tag-switching tdp router-id Loopback0 force
control-plane slot 0
 service-policy input CoPP
!
control-plane slot 1
 service-policy input CoPP
!
control-plane slot 2
 service-policy input CoPP
!
control-plane slot 3
 service-policy input CoPP
!
control-plane slot 4
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
ntp clock-period 17171144
ntp source Loopback0
ntp update-calendar
ntp server 200.255.253.242
ntp server 200.245.255.33
no cns aaa enable
end

gacc03.sls#
