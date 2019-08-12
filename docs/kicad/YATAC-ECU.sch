EESchema Schematic File Version 4
LIBS:YATAC-cache
EELAYER 29 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 5
Title "Execution & Control Unit"
Date "2019-08-10"
Rev "1.0.2"
Comp ""
Comment1 "(c) A J Hewitt 2019"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Label 3450 3400 0    50   ~ 0
I6
Entry Wire Line
	3450 3400 3350 3500
Text GLabel 5900 3200 0    50   Input ~ 0
~rst
$Comp
L 74xx:74LS139 U7
U 1 1 5CEE0F76
P 6400 3300
F 0 "U7" H 6400 3300 50  0000 C CNN
F 1 "74ALS139" H 6350 3200 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_LongPads" H 6400 3300 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS139" H 6400 3300 50  0001 C CNN
	1    6400 3300
	1    0    0    -1  
$EndComp
Text GLabel 3950 3200 0    50   Input ~ 0
~inst
Text GLabel 7300 3000 0    50   Input ~ 0
boot
Text GLabel 5900 3500 0    50   Input ~ 0
rclk
$Comp
L 74xx:74LS08 U?
U 2 1 5DB93202
P 1750 2800
AR Path="/5CDEEC9F/5DB93202" Ref="U?"  Part="2" 
AR Path="/5DAA5CD8/5DB93202" Ref="U2"  Part="2" 
F 0 "U2" H 1750 2800 50  0000 C CNN
F 1 "74F08" H 1750 3000 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 1750 2800 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 1750 2800 50  0001 C CNN
	2    1750 2800
	-1   0    0    1   
$EndComp
NoConn ~ 6900 3200
NoConn ~ 6900 3300
$Comp
L 74xx:74LS32 U?
U 3 1 5DB93154
P 7600 3100
AR Path="/5CDEEC9F/5DB93154" Ref="U?"  Part="3" 
AR Path="/5DAA5CD8/5DB93154" Ref="U5"  Part="3" 
F 0 "U5" H 7600 3100 50  0000 C CNN
F 1 "74F32" H 7600 2900 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 7600 3100 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 7600 3100 50  0001 C CNN
	3    7600 3100
	1    0    0    -1  
$EndComp
Text GLabel 7300 2600 0    50   Input ~ 0
sclk
$Comp
L 74xx:74LS32 U?
U 2 1 5DB933AD
P 7600 2700
AR Path="/5CDEEC9F/5DB933AD" Ref="U?"  Part="2" 
AR Path="/5DAA5CD8/5DB933AD" Ref="U5"  Part="2" 
F 0 "U5" H 7600 2700 50  0000 C CNN
F 1 "74F32" H 7600 2500 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 7600 2700 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 7600 2700 50  0001 C CNN
	2    7600 2700
	1    0    0    -1  
$EndComp
Text Label 3450 2800 0    50   ~ 0
I13
Entry Wire Line
	3450 2800 3350 2900
Text GLabel 9850 2600 2    50   Output ~ 0
~voe
Text GLabel 8850 2400 0    50   Input ~ 0
~inst
Text GLabel 8850 3300 0    50   Input ~ 0
dclk
Text GLabel 8850 3400 0    50   Input ~ 0
0
Text GLabel 9850 2800 2    50   Output ~ 0
~pgoe
Text GLabel 9850 2900 2    50   Output ~ 0
~pcoe
Text GLabel 9850 3000 2    50   Output ~ 0
~alue
Text GLabel 9850 2700 2    50   Output ~ 0
~yoe
$Comp
L power:VCC #PWR?
U 1 1 5DB9333A
P 9350 2100
AR Path="/5CDEEC9F/5DB9333A" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DB9333A" Ref="#PWR0141"  Part="1" 
F 0 "#PWR0141" H 9350 1950 50  0001 C CNN
F 1 "VCC" H 9367 2273 50  0000 C CNN
F 2 "" H 9350 2100 50  0001 C CNN
F 3 "" H 9350 2100 50  0001 C CNN
	1    9350 2100
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR?
U 1 1 5DB9316D
P 9350 3700
AR Path="/5CDEEC9F/5DB9316D" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DB9316D" Ref="#PWR0132"  Part="1" 
F 0 "#PWR0132" H 9350 3450 50  0001 C CNN
F 1 "GNDD" H 9354 3545 50  0000 C CNN
F 2 "" H 9350 3700 50  0001 C CNN
F 3 "" H 9350 3700 50  0001 C CNN
	1    9350 3700
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5D34E551
P 9350 4200
AR Path="/5D34E551" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5D34E551" Ref="#PWR0101"  Part="1" 
F 0 "#PWR0101" H 9350 4050 50  0001 C CNN
F 1 "VCC" H 9367 4373 50  0000 C CNN
F 2 "" H 9350 4200 50  0001 C CNN
F 3 "" H 9350 4200 50  0001 C CNN
	1    9350 4200
	1    0    0    -1  
$EndComp
Text GLabel 3950 2400 0    50   Input ~ 0
pclk1
Text GLabel 5550 1600 2    50   Output ~ 0
DA16
Text GLabel 5550 2000 2    50   Output ~ 0
DA17
Text GLabel 5550 2400 2    50   Output ~ 0
DA18
$Comp
L 74xx:74LS138 U?
U 1 1 5DB931C7
P 2550 3600
AR Path="/5CDEEC9F/5DB931C7" Ref="U?"  Part="1" 
AR Path="/5DAA5CD8/5DB931C7" Ref="U13"  Part="1" 
F 0 "U13" H 2550 3650 50  0000 C CNN
F 1 "74F138" H 2500 3550 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_LongPads" H 2550 3600 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS138" H 2550 3600 50  0001 C CNN
	1    2550 3600
	-1   0    0    -1  
$EndComp
Text GLabel 2050 3600 0    50   Output ~ 0
~vle
Text GLabel 2050 3800 0    50   Output ~ 0
~ele
Text GLabel 2050 3400 0    50   Output ~ 0
~pcle
Text GLabel 2050 3900 0    50   Output ~ 0
~xle
Text GLabel 2050 4000 0    50   Output ~ 0
~yle
Text GLabel 2050 3700 0    50   Output ~ 0
~hlle
$Comp
L power:VCC #PWR?
U 1 1 5DB933D1
P 2550 3000
AR Path="/5CDEEC9F/5DB933D1" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DB933D1" Ref="#PWR0147"  Part="1" 
F 0 "#PWR0147" H 2550 2850 50  0001 C CNN
F 1 "VCC" H 2567 3173 50  0000 C CNN
F 2 "" H 2550 3000 50  0001 C CNN
F 3 "" H 2550 3000 50  0001 C CNN
	1    2550 3000
	1    0    0    -1  
$EndComp
Text GLabel 3050 4000 2    50   Input ~ 0
qclk1
Text GLabel 2050 3500 0    50   Output ~ 0
~scle
Text GLabel 2050 2700 2    50   Input ~ 0
~rst
Text GLabel 1450 2800 0    50   Output ~ 0
~pcmr
Text GLabel 1900 3200 0    50   Output ~ 0
~pgle
Text GLabel 3050 3900 2    50   Input ~ 0
~rom2
$Comp
L 74xx:74LS08 U?
U 1 1 5DB9336B
P 3550 1300
AR Path="/5CDEEC9F/5DB9336B" Ref="U?"  Part="1" 
AR Path="/5DAA5CD8/5DB9336B" Ref="U2"  Part="1" 
F 0 "U2" H 3550 1300 50  0000 C CNN
F 1 "74F08" H 3550 1100 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 3550 1300 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 3550 1300 50  0001 C CNN
	1    3550 1300
	-1   0    0    1   
$EndComp
Text GLabel 1600 2000 0    50   Input ~ 0
DD[0..7]
Text Label 1650 2000 0    50   ~ 0
DD7
Text GLabel 3850 1200 2    50   Input ~ 0
~rst
NoConn ~ 2050 1500
Wire Wire Line
	3450 6200 3650 6200
Entry Wire Line
	3250 3800 3350 3900
Text Label 3150 3800 0    50   ~ 0
I15
Text GLabel 7300 2400 0    50   Input ~ 0
rclk
$Comp
L 74xx:74LS574 U?
U 1 1 5DB93147
P 2550 6000
AR Path="/5CDEEC9F/5DB93147" Ref="U?"  Part="1" 
AR Path="/5DAA5CD8/5DB93147" Ref="U11"  Part="1" 
F 0 "U11" H 2550 5800 50  0000 C CNN
F 1 "74F574" H 2550 5700 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm_LongPads" H 2550 6000 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 2550 6000 50  0001 C CNN
	1    2550 6000
	1    0    0    -1  
$EndComp
Entry Wire Line
	1850 5500 1750 5400
Entry Wire Line
	1850 5600 1750 5500
Entry Wire Line
	1850 5700 1750 5600
Entry Wire Line
	1850 5800 1750 5700
Entry Wire Line
	1850 5900 1750 5800
Entry Wire Line
	1850 6000 1750 5900
Entry Wire Line
	1850 6100 1750 6000
Entry Wire Line
	1850 6200 1750 6100
$Comp
L power:GNDD #PWR?
U 1 1 5DB932A0
P 2550 6800
AR Path="/5CDEEC9F/5DB932A0" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DB932A0" Ref="#PWR0136"  Part="1" 
F 0 "#PWR0136" H 2550 6550 50  0001 C CNN
F 1 "GNDD" H 2554 6645 50  0000 C CNN
F 2 "" H 2550 6800 50  0001 C CNN
F 3 "" H 2550 6800 50  0001 C CNN
	1    2550 6800
	1    0    0    -1  
$EndComp
Entry Wire Line
	3350 5600 3250 5500
Entry Wire Line
	3350 5700 3250 5600
Entry Wire Line
	3350 5800 3250 5700
Entry Wire Line
	3350 6300 3250 6200
Text Label 3450 5500 0    50   ~ 0
I8
Text Label 3450 5600 0    50   ~ 0
I9
Text Label 3450 5700 0    50   ~ 0
I10
Text Label 3450 5800 0    50   ~ 0
I11
Text Label 3450 5900 0    50   ~ 0
I12
Text Label 3450 6000 0    50   ~ 0
I13
Text Label 3450 6100 0    50   ~ 0
I14
Text Label 3450 6200 0    50   ~ 0
I15
Text Label 1850 5500 0    50   ~ 0
PD0
Text Label 1850 5600 0    50   ~ 0
PD1
Text Label 1850 5700 0    50   ~ 0
PD2
Text Label 1850 5800 0    50   ~ 0
PD3
Text Label 1850 5900 0    50   ~ 0
PD4
Text Label 1850 6000 0    50   ~ 0
PD5
Text Label 1850 6100 0    50   ~ 0
PD6
Text Label 1850 6200 0    50   ~ 0
PD7
$Comp
L power:VCC #PWR?
U 1 1 5DB933BF
P 2550 5000
AR Path="/5CDEEC9F/5DB933BF" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DB933BF" Ref="#PWR0144"  Part="1" 
F 0 "#PWR0144" H 2550 4850 50  0001 C CNN
F 1 "VCC" H 2567 5173 50  0000 C CNN
F 2 "" H 2550 5000 50  0001 C CNN
F 3 "" H 2550 5000 50  0001 C CNN
	1    2550 5000
	1    0    0    -1  
$EndComp
Entry Wire Line
	3350 6200 3250 6100
Entry Wire Line
	3350 6100 3250 6000
Entry Wire Line
	3350 6000 3250 5900
Entry Wire Line
	3350 5900 3250 5800
Text GLabel 4650 6400 2    50   Input ~ 0
~ihle
Wire Wire Line
	1850 5500 2050 5500
Wire Wire Line
	1850 5600 2050 5600
Wire Wire Line
	1850 5700 2050 5700
Wire Wire Line
	1850 5800 2050 5800
Wire Wire Line
	1850 5900 2050 5900
Wire Wire Line
	1850 6000 2050 6000
Wire Wire Line
	1850 6100 2050 6100
Wire Wire Line
	1850 6200 2050 6200
Wire Wire Line
	3450 5500 3650 5500
Wire Wire Line
	3450 5600 3650 5600
Wire Wire Line
	3450 5700 3650 5700
Wire Wire Line
	3450 5800 3650 5800
Wire Wire Line
	3450 5900 3650 5900
Wire Wire Line
	3450 6000 3650 6000
Wire Wire Line
	3450 6100 3650 6100
Entry Wire Line
	3450 4500 3350 4600
Entry Wire Line
	3450 4400 3350 4500
Text Label 3450 4400 0    50   ~ 0
I4
Text Label 3450 4500 0    50   ~ 0
I3
Entry Wire Line
	3450 3800 3350 3900
Text Label 3450 3800 0    50   ~ 0
I12
$Comp
L 74xx:74LS32 U?
U 1 1 5DB9314E
P 7600 2300
AR Path="/5CDEEC9F/5DB9314E" Ref="U?"  Part="1" 
AR Path="/5DAA5CD8/5DB9314E" Ref="U5"  Part="1" 
F 0 "U5" H 7600 2300 50  0000 C CNN
F 1 "74F32" H 7600 2100 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 7600 2300 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 7600 2300 50  0001 C CNN
	1    7600 2300
	1    0    0    -1  
$EndComp
Text GLabel 7300 2200 0    50   Input ~ 0
hblank
Text GLabel 9850 3100 2    50   Output ~ 0
~hloe
Entry Wire Line
	3450 2600 3350 2700
Text Label 3450 2600 0    50   ~ 0
I14
Text GLabel 2050 1300 0    50   Output ~ 0
PA16
Text GLabel 2050 1800 0    50   Output ~ 0
~inst
Text GLabel 2050 1700 0    50   Output ~ 0
hsel
Text GLabel 2050 1600 0    50   Output ~ 0
boot
Text GLabel 2050 1400 0    50   Output ~ 0
pcent
Entry Wire Line
	4550 1900 4450 1800
Text Label 4550 1900 0    50   ~ 0
Eo5
Entry Wire Line
	4550 2300 4450 2200
Entry Wire Line
	3250 1700 3350 1800
Text Label 4550 2300 0    50   ~ 0
Eo6
$Comp
L 74xx:74LS08 U?
U 4 1 5CED2B25
P 5250 4300
AR Path="/5DAA3954/5CED2B25" Ref="U?"  Part="4" 
AR Path="/5DAA5CD8/5CED2B25" Ref="U2"  Part="4" 
F 0 "U2" H 5250 4300 50  0000 C CNN
F 1 "74F08" H 5250 4100 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 5250 4300 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 5250 4300 50  0001 C CNN
	4    5250 4300
	1    0    0    -1  
$EndComp
Text Label 3150 1800 0    50   ~ 0
I4
Text Label 3150 1900 0    50   ~ 0
I5
Entry Wire Line
	3250 1800 3350 1900
Entry Wire Line
	3250 1900 3350 2000
Entry Wire Line
	3250 2000 3350 2100
Entry Wire Line
	3250 2100 3350 2200
Wire Wire Line
	3050 6200 3100 6200
Wire Wire Line
	3050 6100 3250 6100
Wire Wire Line
	3050 6000 3250 6000
Wire Wire Line
	3050 5900 3250 5900
Wire Wire Line
	3050 5800 3250 5800
Wire Wire Line
	3050 5700 3250 5700
Wire Wire Line
	3050 5600 3250 5600
Wire Wire Line
	3050 5500 3250 5500
Wire Wire Line
	4650 6200 4850 6200
Wire Wire Line
	4650 6100 4850 6100
Wire Wire Line
	4650 6000 4850 6000
Wire Wire Line
	4650 5900 4850 5900
Wire Wire Line
	4650 5800 4850 5800
Wire Wire Line
	4650 5700 4850 5700
Wire Wire Line
	4650 5600 4850 5600
Wire Wire Line
	4650 5500 4850 5500
Text GLabel 2050 6400 0    50   Input ~ 0
~ille
Entry Wire Line
	4950 5900 4850 5800
Entry Wire Line
	4950 6000 4850 5900
Entry Wire Line
	4950 6100 4850 6000
Entry Wire Line
	4950 6200 4850 6100
$Comp
L power:VCC #PWR?
U 1 1 5D12B0D3
P 2550 1100
AR Path="/5CDEEC9F/5D12B0D3" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5D12B0D3" Ref="#PWR0118"  Part="1" 
F 0 "#PWR0118" H 2550 950 50  0001 C CNN
F 1 "VCC" H 2567 1273 50  0000 C CNN
F 2 "" H 2550 1100 50  0001 C CNN
F 3 "" H 2550 1100 50  0001 C CNN
	1    2550 1100
	1    0    0    -1  
$EndComp
Text GLabel 1750 5200 1    50   Input ~ 0
PD[0..7]
Text Label 4700 6200 0    50   ~ 0
PD7
Text Label 4700 6100 0    50   ~ 0
PD6
Text Label 4700 6000 0    50   ~ 0
PD5
Text Label 4700 5900 0    50   ~ 0
PD4
Text Label 4700 5800 0    50   ~ 0
PD3
Text Label 4700 5700 0    50   ~ 0
PD2
Text Label 4700 5600 0    50   ~ 0
PD1
Text Label 4700 5500 0    50   ~ 0
PD0
Text Label 3150 6200 0    50   ~ 0
I7
Text Label 3150 6100 0    50   ~ 0
I6
Text Label 3150 6000 0    50   ~ 0
I5
Text Label 3150 5900 0    50   ~ 0
I4
Text Label 3150 5800 0    50   ~ 0
I3
Text Label 3150 5700 0    50   ~ 0
I2
Text Label 3150 5600 0    50   ~ 0
I1
Text Label 3150 5500 0    50   ~ 0
I0
Entry Wire Line
	4950 6300 4850 6200
Entry Wire Line
	4950 5800 4850 5700
Entry Wire Line
	4950 5700 4850 5600
Entry Wire Line
	4950 5600 4850 5500
$Comp
L power:GNDD #PWR?
U 1 1 5D12B0B8
P 4150 6800
AR Path="/5CDEEC9F/5D12B0B8" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5D12B0B8" Ref="#PWR0117"  Part="1" 
F 0 "#PWR0117" H 4150 6550 50  0001 C CNN
F 1 "GNDD" H 4154 6645 50  0000 C CNN
F 2 "" H 4150 6800 50  0001 C CNN
F 3 "" H 4150 6800 50  0001 C CNN
	1    4150 6800
	1    0    0    -1  
$EndComp
Entry Wire Line
	3350 6200 3450 6100
Entry Wire Line
	3350 6100 3450 6000
Entry Wire Line
	3350 6000 3450 5900
Entry Wire Line
	3350 5900 3450 5800
Entry Wire Line
	3350 5800 3450 5700
Entry Wire Line
	3350 5700 3450 5600
Entry Wire Line
	3350 5600 3450 5500
Entry Wire Line
	3350 6300 3450 6200
Text GLabel 2050 6500 0    50   Input ~ 0
0
$Comp
L 74xx:74LS574 U?
U 1 1 5D12B0A9
P 4150 6000
AR Path="/5CDEEC9F/5D12B0A9" Ref="U?"  Part="1" 
AR Path="/5DAA5CD8/5D12B0A9" Ref="U12"  Part="1" 
F 0 "U12" H 4150 5800 50  0000 C CNN
F 1 "74F574" H 4150 5700 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm_LongPads" H 4150 6000 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 4150 6000 50  0001 C CNN
	1    4150 6000
	-1   0    0    -1  
$EndComp
Entry Wire Line
	3250 3300 3350 3400
$Comp
L power:VCC #PWR?
U 1 1 5DB933B9
P 4150 5200
AR Path="/5CDEEC9F/5DB933B9" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DB933B9" Ref="#PWR0143"  Part="1" 
F 0 "#PWR0143" H 4150 5050 50  0001 C CNN
F 1 "VCC" H 4167 5373 50  0000 C CNN
F 2 "" H 4150 5200 50  0001 C CNN
F 3 "" H 4150 5200 50  0001 C CNN
	1    4150 5200
	1    0    0    -1  
$EndComp
Text GLabel 3350 6500 3    50   Output ~ 0
I[0..15]
Text Label 3150 2100 0    50   ~ 0
I7
Text Label 3150 2000 0    50   ~ 0
I6
Text Label 3150 1700 0    50   ~ 0
I3
Text Label 3150 3500 0    50   ~ 0
I2
Text Label 3150 3400 0    50   ~ 0
I1
Text Label 3150 3300 0    50   ~ 0
I0
$Comp
L power:GNDD #PWR?
U 1 1 5DB932AC
P 2550 4300
AR Path="/5CDEEC9F/5DB932AC" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DB932AC" Ref="#PWR0138"  Part="1" 
F 0 "#PWR0138" H 2550 4050 50  0001 C CNN
F 1 "GNDD" H 2554 4145 50  0000 C CNN
F 2 "" H 2550 4300 50  0001 C CNN
F 3 "" H 2550 4300 50  0001 C CNN
	1    2550 4300
	1    0    0    -1  
$EndComp
$Comp
L Logic_Programmable:GAL16V8 U?
U 1 1 5DB93291
P 2550 1800
AR Path="/5CDEEC9F/5DB93291" Ref="U?"  Part="1" 
AR Path="/5DAA5CD8/5DB93291" Ref="U14"  Part="1" 
F 0 "U14" H 2550 1650 50  0000 C CNN
F 1 "PAL16R4" H 2550 1550 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm_LongPads" H 2550 1800 50  0001 C CNN
F 3 "" H 2550 1800 50  0001 C CNN
	1    2550 1800
	-1   0    0    -1  
$EndComp
Entry Wire Line
	3250 3500 3350 3600
Entry Wire Line
	3250 3400 3350 3500
Text GLabel 3050 1600 2    50   Input ~ 0
hblank
Text GLabel 3050 1400 2    50   Input ~ 0
~rst
Text GLabel 3050 1500 2    50   Input ~ 0
pclk1
Text GLabel 3050 2200 2    50   Input ~ 0
0
Text GLabel 3850 1400 2    50   Input ~ 0
sclk
$Comp
L power:GNDD #PWR?
U 1 1 5DB931BB
P 2550 2500
AR Path="/5CDEEC9F/5DB931BB" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5DB931BB" Ref="#PWR0134"  Part="1" 
F 0 "#PWR0134" H 2550 2250 50  0001 C CNN
F 1 "GNDD" H 2554 2345 50  0000 C CNN
F 2 "" H 2550 2500 50  0001 C CNN
F 3 "" H 2550 2500 50  0001 C CNN
	1    2550 2500
	1    0    0    -1  
$EndComp
Text GLabel 6700 4300 2    50   Output ~ 0
cclk
Wire Wire Line
	6600 4300 6700 4300
$Comp
L 74xx:74LS32 U?
U 1 1 5DB93383
P 5250 3900
AR Path="/5CDEEC9F/5DB93383" Ref="U?"  Part="1" 
AR Path="/5DAA5CD8/5DB93383" Ref="U6"  Part="1" 
F 0 "U6" H 5250 3900 50  0000 C CNN
F 1 "74F32" H 5250 4150 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 5250 3900 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 5250 3900 50  0001 C CNN
	1    5250 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	3050 1700 3250 1700
Wire Wire Line
	3250 1800 3050 1800
Wire Wire Line
	3050 1900 3250 1900
Wire Wire Line
	3250 2000 3050 2000
Wire Wire Line
	3050 2100 3250 2100
Entry Wire Line
	4550 1500 4450 1400
Text Label 4550 1500 0    50   ~ 0
Eo4
$Comp
L Device:R_Network08_US RN?
U 1 1 5D3C355B
P 2850 4700
AR Path="/5DAA3954/5D3C355B" Ref="RN?"  Part="1" 
AR Path="/5DAA5CD8/5D3C355B" Ref="RN1"  Part="1" 
F 0 "RN1" V 3350 4650 50  0000 L CNN
F 1 "270" V 3250 4650 50  0000 L CNN
F 2 "Resistor_THT:R_Array_SIP9" V 3325 4700 50  0001 C CNN
F 3 "http://www.vishay.com/docs/31509/csc.pdf" H 2850 4700 50  0001 C CNN
	1    2850 4700
	0    -1   -1   0   
$EndComp
Entry Wire Line
	3350 4500 3250 4400
Entry Wire Line
	3350 5200 3250 5100
Entry Wire Line
	3350 4700 3250 4600
Entry Wire Line
	3350 4600 3250 4500
Entry Wire Line
	3350 4900 3250 4800
Entry Wire Line
	3350 4800 3250 4700
Entry Wire Line
	3350 5100 3250 5000
Entry Wire Line
	3350 5000 3250 4900
Wire Wire Line
	3050 4400 3250 4400
Wire Wire Line
	3050 4500 3250 4500
Wire Wire Line
	3050 4600 3250 4600
Wire Wire Line
	3050 4700 3250 4700
Wire Wire Line
	3050 4800 3250 4800
Wire Wire Line
	3050 4900 3250 4900
Wire Wire Line
	3050 5000 3250 5000
Wire Wire Line
	3050 5100 3250 5100
Text Label 3100 4400 0    50   ~ 0
I15
Text Label 3100 4500 0    50   ~ 0
I14
Text Label 3100 4600 0    50   ~ 0
I13
Text Label 3100 4700 0    50   ~ 0
I12
Text Label 3100 4800 0    50   ~ 0
I11
Text Label 3100 4900 0    50   ~ 0
I10
Text Label 3150 5000 0    50   ~ 0
I9
Text Label 3150 5100 0    50   ~ 0
I8
Text GLabel 4950 4900 0    50   Input ~ 0
qclk1
Wire Wire Line
	3100 6200 3100 7050
Wire Wire Line
	3100 7050 4750 7050
Wire Wire Line
	4750 7050 4750 6500
Wire Wire Line
	4750 6500 4650 6500
Connection ~ 3100 6200
Wire Wire Line
	3100 6200 3250 6200
Entry Bus Bus
	1750 7100 1850 7200
Entry Bus Bus
	4850 7200 4950 7100
Wire Bus Line
	1850 7200 4850 7200
Wire Wire Line
	3050 3800 3250 3800
Wire Wire Line
	3050 3500 3250 3500
Wire Wire Line
	3050 3400 3250 3400
Wire Wire Line
	3050 3300 3250 3300
Wire Wire Line
	2550 5200 2550 5100
Wire Wire Line
	2550 5100 2650 5100
Connection ~ 2550 5100
Wire Wire Line
	2550 5100 2550 5000
Text GLabel 5550 4300 2    50   Output ~ 0
~aoe
Text GLabel 5550 3900 2    50   Output ~ 0
~dwe
Text GLabel 3750 4700 0    50   Input ~ 0
~ram1
Wire Wire Line
	3450 3800 4950 3800
Wire Wire Line
	4750 4400 4950 4400
Wire Wire Line
	4900 4100 4800 4100
Text GLabel 4800 4100 0    50   Input ~ 0
~ram2
Wire Wire Line
	4950 4200 4900 4200
Wire Wire Line
	4900 4200 4900 4100
Wire Wire Line
	4900 4100 4900 4000
Wire Wire Line
	4900 4000 4950 4000
Connection ~ 4900 4100
$Comp
L 74xx:74LS32 U?
U 4 1 5DB93208
P 7600 3800
AR Path="/5CDEEC9F/5DB93208" Ref="U?"  Part="4" 
AR Path="/5DAA5CD8/5DB93208" Ref="U5"  Part="4" 
F 0 "U5" H 7600 3800 50  0000 C CNN
F 1 "74F32" H 7600 3600 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 7600 3800 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 7600 3800 50  0001 C CNN
	4    7600 3800
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS08 U?
U 3 1 5DB93371
P 4250 3300
AR Path="/5CDEEC9F/5DB93371" Ref="U?"  Part="3" 
AR Path="/5DAA5CD8/5DB93371" Ref="U2"  Part="3" 
F 0 "U2" H 4250 3300 50  0000 C CNN
F 1 "74F08" H 4250 3100 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 4250 3300 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 4250 3300 50  0001 C CNN
	3    4250 3300
	1    0    0    -1  
$EndComp
Text GLabel 4750 4600 2    50   Output ~ 0
~eoe
Text GLabel 4750 4500 2    50   Output ~ 0
~xroe
$Comp
L 74xx:74LS139 U?
U 2 1 5DB93139
P 4250 4500
AR Path="/5CDEEC9F/5DB93139" Ref="U?"  Part="2" 
AR Path="/5DAA5CD8/5DB93139" Ref="U7"  Part="2" 
F 0 "U7" H 4250 4500 50  0000 C CNN
F 1 "74ALS139" H 4200 4400 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_LongPads" H 4250 4500 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS139" H 4250 4500 50  0001 C CNN
	2    4250 4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	3450 4400 3750 4400
Wire Wire Line
	3450 4500 3750 4500
Wire Wire Line
	7250 4600 8350 4600
Connection ~ 8350 4600
Connection ~ 6600 4700
Wire Wire Line
	6600 4700 6650 4700
Wire Wire Line
	6600 4500 6600 4600
Wire Wire Line
	6600 4500 6650 4500
Wire Wire Line
	5900 4500 5900 4700
Wire Wire Line
	5900 4500 5950 4500
Wire Wire Line
	5950 4700 5900 4700
Wire Wire Line
	8350 5300 8850 5300
Wire Wire Line
	8350 4600 8450 4600
Text GLabel 8450 4600 2    50   Output ~ 0
dclk
$Comp
L 74xx:74LS00 U?
U 2 1 5DB93395
P 6950 4600
AR Path="/5CDEEC9F/5DB93395" Ref="U?"  Part="2" 
AR Path="/5DAA5CD8/5DB93395" Ref="U1"  Part="2" 
F 0 "U1" H 6950 4600 50  0000 C CNN
F 1 "74F00" H 7100 4400 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 6950 4600 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls00" H 6950 4600 50  0001 C CNN
	2    6950 4600
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS00 U?
U 1 1 5DB9315A
P 6250 4600
AR Path="/5CDEEC9F/5DB9315A" Ref="U?"  Part="1" 
AR Path="/5DAA5CD8/5DB9315A" Ref="U1"  Part="1" 
F 0 "U1" H 6250 4600 50  0000 C CNN
F 1 "74F00" H 6250 4400 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 6250 4600 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls00" H 6250 4600 50  0001 C CNN
	1    6250 4600
	1    0    0    -1  
$EndComp
Wire Wire Line
	9850 4500 10250 4500
Connection ~ 9900 4600
Wire Wire Line
	9900 4600 10250 4600
Wire Wire Line
	9850 4700 10250 4700
Wire Wire Line
	9850 4800 10250 4800
Connection ~ 10050 4900
Wire Wire Line
	10050 4900 10250 4900
Wire Wire Line
	9850 5000 10250 5000
Wire Wire Line
	9850 5100 10250 5100
Connection ~ 9900 5200
Wire Wire Line
	9900 5200 10250 5200
Wire Wire Line
	8800 4500 8850 4500
$Comp
L power:GNDD #PWR?
U 1 1 5D34E557
P 9350 5700
AR Path="/5D34E557" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5D34E557" Ref="#PWR0102"  Part="1" 
F 0 "#PWR0102" H 9350 5450 50  0001 C CNN
F 1 "GNDD" H 9354 5545 50  0000 C CNN
F 2 "" H 9350 5700 50  0001 C CNN
F 3 "" H 9350 5700 50  0001 C CNN
	1    9350 5700
	1    0    0    -1  
$EndComp
Text GLabel 10250 4700 2    50   Output ~ 0
pclk1
Text GLabel 10250 4800 2    50   Output ~ 0
qclk1
Text GLabel 10250 4900 2    50   Output ~ 0
pclk2
Text GLabel 10250 5000 2    50   Output ~ 0
qclk2
Text GLabel 10250 5100 2    50   Output ~ 0
rclk
Text GLabel 10250 5200 2    50   Output ~ 0
sclk
Text GLabel 10250 4500 2    50   Output ~ 0
mclk
Text GLabel 10250 4600 2    50   Output ~ 0
nclk
Wire Wire Line
	9850 4900 10050 4900
Wire Wire Line
	9850 4600 9900 4600
Wire Wire Line
	9850 5200 9900 5200
Wire Wire Line
	8800 4700 8850 4700
Wire Wire Line
	8850 4900 8800 4900
Wire Wire Line
	8800 4900 8800 4700
Wire Wire Line
	10050 4900 10050 6100
Wire Wire Line
	10050 6100 8650 6100
Wire Wire Line
	8650 6100 8650 5100
Wire Wire Line
	8650 5100 8850 5100
$Comp
L 74xx:74LS175 U?
U 1 1 5D34E56F
P 9350 4900
AR Path="/5D34E56F" Ref="U?"  Part="1" 
AR Path="/5DAA5CD8/5D34E56F" Ref="U9"  Part="1" 
F 0 "U9" H 9350 4900 50  0000 C CNN
F 1 "74F175" H 9350 4800 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_LongPads" H 9350 4900 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS175" H 9350 4900 50  0001 C CNN
	1    9350 4900
	1    0    0    -1  
$EndComp
Wire Wire Line
	6550 4600 6600 4600
Connection ~ 6600 4600
Wire Wire Line
	7650 5400 7650 5600
Wire Wire Line
	7650 5900 7650 6100
Wire Wire Line
	7150 5800 7150 6100
Wire Wire Line
	8150 5400 8150 5450
Wire Wire Line
	5900 6200 5900 6100
Connection ~ 6600 6100
Wire Wire Line
	6600 6100 6600 6000
Wire Wire Line
	5900 6100 6600 6100
Wire Wire Line
	5900 6000 5900 6100
$Comp
L Device:R_US R?
U 1 1 5D34E585
P 6600 5350
AR Path="/62D13D9D/5D34E585" Ref="R?"  Part="1" 
AR Path="/5D34E585" Ref="R?"  Part="1" 
AR Path="/5DAA5CD8/5D34E585" Ref="R2"  Part="1" 
F 0 "R2" H 6700 5400 50  0000 L CNN
F 1 "270" H 6700 5300 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 6640 5340 50  0001 C CNN
F 3 "~" H 6600 5350 50  0001 C CNN
	1    6600 5350
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R?
U 1 1 5D34E58B
P 6250 5100
AR Path="/62D13D9D/5D34E58B" Ref="R?"  Part="1" 
AR Path="/5D34E58B" Ref="R?"  Part="1" 
AR Path="/5DAA5CD8/5D34E58B" Ref="R1"  Part="1" 
F 0 "R1" V 6455 5100 50  0000 C CNN
F 1 "1k" V 6364 5100 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 6290 5090 50  0001 C CNN
F 3 "~" H 6250 5100 50  0001 C CNN
	1    6250 5100
	0    -1   -1   0   
$EndComp
$Comp
L Device:Crystal Y?
U 1 1 5D34E591
P 6250 5600
AR Path="/5D34E591" Ref="Y?"  Part="1" 
AR Path="/5CDEEC9F/5D34E591" Ref="Y?"  Part="1" 
AR Path="/5DAA5CD8/5D34E591" Ref="Y1"  Part="1" 
F 0 "Y1" H 6250 5868 50  0000 C CNN
F 1 "32M" H 6250 5777 50  0000 C CNN
F 2 "Crystal:Crystal_HC49-4H_Vertical" H 6250 5600 50  0001 C CNN
F 3 "~" H 6250 5600 50  0001 C CNN
	1    6250 5600
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5D34E597
P 5900 5850
AR Path="/5D34E597" Ref="C?"  Part="1" 
AR Path="/5CDEEC9F/5D34E597" Ref="C?"  Part="1" 
AR Path="/5DAA5CD8/5D34E597" Ref="C1"  Part="1" 
F 0 "C1" H 6015 5896 50  0000 L CNN
F 1 "22p" H 6015 5805 50  0000 L CNN
F 2 "Capacitor_THT:C_Rect_L7.0mm_W2.5mm_P5.00mm" H 5938 5700 50  0001 C CNN
F 3 "~" H 5900 5850 50  0001 C CNN
	1    5900 5850
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5D34E59D
P 6600 5850
AR Path="/5D34E59D" Ref="C?"  Part="1" 
AR Path="/5CDEEC9F/5D34E59D" Ref="C?"  Part="1" 
AR Path="/5DAA5CD8/5D34E59D" Ref="C2"  Part="1" 
F 0 "C2" H 6715 5896 50  0000 L CNN
F 1 "22p" H 6715 5805 50  0000 L CNN
F 2 "Capacitor_THT:C_Rect_L7.0mm_W2.5mm_P5.00mm" H 6638 5700 50  0001 C CNN
F 3 "~" H 6600 5850 50  0001 C CNN
	1    6600 5850
	1    0    0    -1  
$EndComp
Wire Wire Line
	6600 5700 6600 5600
Wire Wire Line
	5900 5700 5900 5600
Connection ~ 5900 5600
$Comp
L power:GNDD #PWR?
U 1 1 5D34E5A7
P 5900 6200
AR Path="/5D34E5A7" Ref="#PWR?"  Part="1" 
AR Path="/5CDEEC9F/5D34E5A7" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5D34E5A7" Ref="#PWR0103"  Part="1" 
F 0 "#PWR0103" H 5900 5950 50  0001 C CNN
F 1 "GNDD" H 5904 6045 50  0000 C CNN
F 2 "" H 5900 6200 50  0001 C CNN
F 3 "" H 5900 6200 50  0001 C CNN
	1    5900 6200
	1    0    0    -1  
$EndComp
Wire Wire Line
	6400 5100 6600 5100
Wire Wire Line
	5900 5600 6100 5600
Wire Wire Line
	6400 5600 6600 5600
Connection ~ 5900 6100
$Comp
L Switch:SW_Push SW?
U 1 1 5D34E5B1
P 8150 5750
AR Path="/5D34E5B1" Ref="SW?"  Part="1" 
AR Path="/5CDEEC9F/5D34E5B1" Ref="SW?"  Part="1" 
AR Path="/62D13D9D/5D34E5B1" Ref="SW?"  Part="1" 
AR Path="/5DAA5CD8/5D34E5B1" Ref="SW1"  Part="1" 
F 0 "SW1" V 8100 5950 50  0000 L CNN
F 1 "RESET" V 8200 5950 50  0000 L CNN
F 2 "FSMRA3JH04:SWITCH_FSMRA3JH04" H 8150 5950 50  0001 C CNN
F 3 "~" H 8150 5950 50  0001 C CNN
	1    8150 5750
	0    1    -1   0   
$EndComp
$Comp
L Device:C C?
U 1 1 5D34E5B7
P 7650 5750
AR Path="/5D34E5B7" Ref="C?"  Part="1" 
AR Path="/5CDEEC9F/5D34E5B7" Ref="C?"  Part="1" 
AR Path="/62D13D9D/5D34E5B7" Ref="C?"  Part="1" 
AR Path="/5DAA5CD8/5D34E5B7" Ref="C3"  Part="1" 
F 0 "C3" H 7765 5796 50  0000 L CNN
F 1 "100p" H 7765 5705 50  0000 L CNN
F 2 "Capacitor_THT:C_Rect_L7.0mm_W2.5mm_P5.00mm" H 7688 5600 50  0001 C CNN
F 3 "~" H 7650 5750 50  0001 C CNN
	1    7650 5750
	1    0    0    -1  
$EndComp
$Comp
L Power_Supervisor:TCM809 Q?
U 1 1 5D34E5BD
P 7250 5400
AR Path="/5D34E5BD" Ref="Q?"  Part="1" 
AR Path="/5CDEEC9F/5D34E5BD" Ref="Q?"  Part="1" 
AR Path="/62D13D9D/5D34E5BD" Ref="Q?"  Part="1" 
AR Path="/5DAA5CD8/5D34E5BD" Ref="Q1"  Part="1" 
F 0 "Q1" H 7400 5550 50  0000 R CNN
F 1 "DS1233" H 7800 5550 50  0000 R CNN
F 2 "Package_TO_SOT_THT:TO-92_HandSolder" H 6850 5550 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/21661E.pdf" H 6950 5650 50  0001 C CNN
	1    7250 5400
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5D34E5C4
P 7150 5000
AR Path="/5D34E5C4" Ref="#PWR?"  Part="1" 
AR Path="/5DAA5CD8/5D34E5C4" Ref="#PWR0104"  Part="1" 
F 0 "#PWR0104" H 7150 4850 50  0001 C CNN
F 1 "VCC" H 7167 5173 50  0000 C CNN
F 2 "" H 7150 5000 50  0001 C CNN
F 3 "" H 7150 5000 50  0001 C CNN
	1    7150 5000
	1    0    0    -1  
$EndComp
Wire Wire Line
	7550 5400 7650 5400
Wire Wire Line
	6100 5100 5900 5100
Wire Wire Line
	8050 6100 8050 6050
Wire Wire Line
	8050 6100 8150 6100
Wire Wire Line
	8150 6100 8150 6050
Connection ~ 8050 6100
Connection ~ 8800 4900
Wire Wire Line
	9900 5200 9900 5950
Wire Wire Line
	9900 5950 8800 5950
Wire Wire Line
	8800 4900 8800 5950
Wire Wire Line
	6600 6100 7150 6100
Text GLabel 8000 5200 2    50   Output ~ 0
~rst
Wire Wire Line
	6600 4600 6600 4700
Connection ~ 7650 5400
Connection ~ 7650 6100
Wire Wire Line
	7650 6100 8050 6100
Wire Wire Line
	7150 6100 7650 6100
Connection ~ 7150 6100
Wire Wire Line
	7900 5200 8000 5200
Connection ~ 8150 5400
Text GLabel 8850 1650 0    50   Input ~ 0
0
Text GLabel 8850 1450 0    50   Input ~ 0
qclk1
NoConn ~ 9850 1350
$Comp
L 74xx:74LS139 U8
U 2 1 5CEF3946
P 9350 1450
F 0 "U8" H 9350 1450 50  0000 C CNN
F 1 "74ALS139" H 9300 1350 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_LongPads" H 9350 1450 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS139" H 9350 1450 50  0001 C CNN
	2    9350 1450
	1    0    0    -1  
$EndComp
Text GLabel 9850 1650 2    50   Output ~ 0
~ram2
Text GLabel 9850 1550 2    50   Output ~ 0
~rom2
Text GLabel 9850 1450 2    50   Output ~ 0
~ram1
Text GLabel 5550 4800 2    50   Output ~ 0
~doe
Wire Wire Line
	7650 5400 7900 5400
Wire Wire Line
	7900 5200 7900 5400
Connection ~ 7900 5400
Wire Wire Line
	7900 5400 8150 5400
Wire Wire Line
	8000 3100 8000 2800
Wire Wire Line
	7900 3100 8000 3100
Wire Wire Line
	8150 2900 8150 3400
Wire Wire Line
	5900 5100 5900 5600
Wire Wire Line
	8150 5400 8850 5400
Connection ~ 5900 4700
Wire Wire Line
	6600 5600 6600 5500
Connection ~ 6600 5600
Wire Wire Line
	6600 5200 6600 5100
Connection ~ 6600 5100
Wire Wire Line
	5900 4700 5900 5100
Connection ~ 5900 5100
Wire Wire Line
	8350 4600 8350 5300
Text GLabel 7050 1450 0    50   Input ~ 0
hsel
Text GLabel 7050 1650 0    50   Input ~ 0
qclk1
Text GLabel 8050 1450 2    50   Output ~ 0
~ihle
Text GLabel 8050 1350 2    50   Output ~ 0
~ille
NoConn ~ 8050 1550
NoConn ~ 8050 1650
Text GLabel 7050 1350 0    50   Input ~ 0
~inst
$Comp
L 74xx:74LS139 U?
U 1 1 5DB93189
P 7550 1450
AR Path="/5CDEEC9F/5DB93189" Ref="U?"  Part="1" 
AR Path="/5DAA5CD8/5DB93189" Ref="U8"  Part="1" 
F 0 "U8" H 7550 1450 50  0000 C CNN
F 1 "74ALS139" H 7500 1350 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_LongPads" H 7550 1450 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS139" H 7550 1450 50  0001 C CNN
	1    7550 1450
	1    0    0    -1  
$EndComp
Wire Wire Line
	4750 4700 4950 4700
Wire Wire Line
	4800 2500 4800 2100
Wire Wire Line
	4800 2100 4800 1700
Connection ~ 4800 2100
Wire Wire Line
	8300 3500 8300 3000
Wire Wire Line
	8800 3950 9900 3950
Wire Wire Line
	8800 3950 8800 4500
Wire Wire Line
	9900 3950 9900 4600
Text GLabel 4450 1300 1    50   Input ~ 0
Eo[0..7]
Wire Wire Line
	4800 2500 4950 2500
Wire Wire Line
	4550 2300 4950 2300
Wire Wire Line
	4800 2100 4950 2100
Wire Wire Line
	4550 1900 4950 1900
Wire Wire Line
	4800 1700 4950 1700
Wire Wire Line
	4550 1500 4950 1500
Wire Wire Line
	2050 3300 2000 3300
Wire Wire Line
	2000 3300 2000 3200
Wire Wire Line
	2000 3200 1900 3200
Wire Wire Line
	2000 3200 2000 3100
Wire Wire Line
	2000 3100 2100 3100
Connection ~ 2000 3200
Wire Wire Line
	6600 4700 6600 5100
Wire Wire Line
	6600 4500 6600 4300
Connection ~ 6600 4500
Wire Wire Line
	2100 3100 2100 2900
Wire Wire Line
	2100 2900 2050 2900
Wire Wire Line
	7200 3200 7200 3400
Wire Wire Line
	7200 3200 7300 3200
$Comp
L 74xx:74LS08 U?
U 4 1 5EFAAEF0
P 5250 4800
AR Path="/62D13D9D/5EFAAEF0" Ref="U?"  Part="4" 
AR Path="/5DAA5CD8/5EFAAEF0" Ref="U3"  Part="4" 
F 0 "U3" H 5250 4800 50  0000 C CNN
F 1 "74F08" H 5350 5050 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 5250 4800 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 5250 4800 50  0001 C CNN
	4    5250 4800
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS32 U4
U 1 1 5F0EA1E5
P 5250 1600
F 0 "U4" H 5250 1600 50  0000 C CNN
F 1 "74F32" H 5250 1834 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 5250 1600 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 5250 1600 50  0001 C CNN
	1    5250 1600
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS32 U4
U 2 1 5F0ED4B1
P 5250 2000
F 0 "U4" H 5250 2000 50  0000 C CNN
F 1 "74F32" H 5250 2234 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 5250 2000 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 5250 2000 50  0001 C CNN
	2    5250 2000
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS32 U4
U 3 1 5F0EF9F6
P 5250 2400
F 0 "U4" H 5250 2400 50  0000 C CNN
F 1 "74F32" H 5250 2634 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 5250 2400 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 5250 2400 50  0001 C CNN
	3    5250 2400
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS32 U4
U 4 1 5F0F2786
P 4250 2500
F 0 "U4" H 4250 2500 50  0000 C CNN
F 1 "74F32" H 4250 2734 50  0001 C CNN
F 2 "Package_DIP:DIP-14_W7.62mm_LongPads" H 4250 2500 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS32" H 4250 2500 50  0001 C CNN
	4    4250 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	1600 2000 2050 2000
Wire Wire Line
	3050 1300 3250 1300
Wire Wire Line
	3450 2600 3950 2600
Wire Wire Line
	3450 3400 3950 3400
Wire Wire Line
	8550 1350 8850 1350
$Comp
L 74xx:74LS574 U?
U 1 1 5D4F75AC
P 9350 2900
AR Path="/5CDEEC9F/5D4F75AC" Ref="U?"  Part="1" 
AR Path="/5DAA5CD8/5D4F75AC" Ref="U10"  Part="1" 
F 0 "U10" H 9350 2700 50  0000 C CNN
F 1 "74F574" H 9350 2600 50  0000 C CNN
F 2 "Package_DIP:DIP-20_W7.62mm_LongPads" H 9350 2900 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS574" H 9350 2900 50  0001 C CNN
	1    9350 2900
	1    0    0    -1  
$EndComp
Text GLabel 9850 2500 2    50   Output ~ 0
~hsync
Text GLabel 8850 2500 0    50   Input ~ 0
~gsync
Wire Wire Line
	7300 3700 7200 3700
Wire Wire Line
	7200 3700 7200 3500
Wire Wire Line
	7900 3800 8450 3800
Wire Wire Line
	8450 3800 8450 3100
Text GLabel 2050 1900 0    50   Output ~ 0
mv
Text GLabel 7300 3900 0    50   Input ~ 0
mv
Wire Wire Line
	8550 1850 8550 1350
Wire Wire Line
	7900 2300 8000 2300
Wire Wire Line
	8000 2600 8000 2300
Wire Wire Line
	8550 1850 10150 1850
Wire Wire Line
	9850 2400 10150 2400
Wire Wire Line
	10150 2400 10150 1850
Wire Wire Line
	4550 2500 4800 2500
Connection ~ 4800 2500
Wire Wire Line
	8000 2600 8850 2600
Wire Wire Line
	7900 2700 8850 2700
Wire Wire Line
	8000 2800 8850 2800
Wire Wire Line
	8150 2900 8850 2900
Wire Wire Line
	8300 3000 8850 3000
Wire Wire Line
	8450 3100 8850 3100
Wire Wire Line
	6900 3400 7200 3400
Wire Wire Line
	6900 3500 7200 3500
Connection ~ 7200 3500
Wire Wire Line
	7200 3500 8300 3500
Wire Wire Line
	8150 3400 7200 3400
Connection ~ 7200 3400
Wire Wire Line
	4550 3300 5900 3300
Wire Wire Line
	3450 2800 7300 2800
Wire Bus Line
	4450 1300 4450 2200
Wire Bus Line
	4950 5600 4950 7100
Wire Bus Line
	1750 5200 1750 7100
Wire Bus Line
	3350 1800 3350 6500
$EndSCHEMATC
