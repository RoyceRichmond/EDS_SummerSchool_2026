v {xschem version=3.4.7 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
B 2 630 -860 1140 -550 {flags=graph
y1=-8.4e-08
y2=3.1
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=0
x2=0.005
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
dataset=-1
unitx=1
logx=0
logy=0
hilight_wave=0
color="4 5"
node="\\"vout PEX; vout\\"
\\"vout Pre layout; vout2\\""}
B 2 630 -1170 1140 -860 {flags=graph
y1=-0.87
y2=4.2
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1
x1=0
x2=0.005
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
node="\\"vmem pex;vmem\\"
\\"vmem pre layout;vmem2\\""
color="6 4"
dataset=-1
unitx=1
logx=0
logy=0
hilight_wave=0
rainbow=1}
N 260 -1050 260 -1030 {lab=#net1}
N 260 -970 260 -950 {lab=#net1}
N 260 -1130 260 -1110 {lab=vdd}
N 470 -1030 470 -1000 {lab=vdd}
N 340 -950 420 -950 {lab=vmem}
N 520 -950 540 -950 {lab=vout}
N 470 -900 470 -880 {lab=vss}
N 540 -890 540 -880 {lab=vss}
N 470 -880 540 -880 {lab=vss}
N 260 -1030 260 -970 {lab=#net1}
N 320 -950 340 -950 {lab=vmem}
N 370 -610 370 -580 {lab=GND}
N 270 -620 270 -590 {lab=GND}
N 270 -760 270 -680 {lab=vss}
N 260 -1390 260 -1370 {lab=#net2}
N 260 -1310 260 -1290 {lab=#net2}
N 260 -1470 260 -1450 {lab=vdd}
N 470 -1370 470 -1340 {lab=vdd}
N 340 -1290 420 -1290 {lab=vmem2}
N 520 -1290 540 -1290 {lab=vout2}
N 470 -1240 470 -1220 {lab=vss}
N 540 -1230 540 -1220 {lab=vss}
N 470 -1220 540 -1220 {lab=vss}
N 260 -1370 260 -1310 {lab=#net2}
N 320 -1290 340 -1290 {lab=vmem2}
C {vsource.sym} 270 -790 0 0 {name=V1 value=3.3 savecurrent=false}
C {devices/code_shown.sym} -405 -1230 0 0 {name=s1 only_toplevel=false value="
.option method=gear seed=12
.tran 100n 5m
.include /foss/designs/Mosbious_2025_Spikcore/designs/pex/AH_neuron/AH_neuron_pex.spice
.param vd_v=3.3
.save allcurrents
.options save currents
.control
	set num_threads=16
	reset
	save all
        run
        write AH_neuron_pex.raw
.endc
"
spice_ignore=False}
C {lab_pin.sym} 270 -880 1 0 {name=p1 sig_type=std_logic lab=vdd}
C {isource.sym} 260 -1080 0 0 {name=I0 value="PULSE(0 1000p 1u 10n 10n 1u 5u)"}
C {lab_pin.sym} 260 -1130 0 0 {name=p2 sig_type=std_logic lab=vdd}
C {lab_pin.sym} 470 -1030 0 0 {name=p3 sig_type=std_logic lab=vdd}
C {devices/code_shown.sym} -410 -950 0 0 {name=MODELS2 only_toplevel=true
format="tcleval( @value )"
value="
.include $::180MCU_MODELS/design.ngspice
.lib $::180MCU_MODELS/sm141064.ngspice typical
.lib $::180MCU_MODELS/sm141064.ngspice cap_mim
.lib $::180MCU_MODELS/sm141064.ngspice res_typical
.lib $::180MCU_MODELS/sm141064.ngspice moscap_typical
.lib $::180MCU_MODELS/sm141064.ngspice mimcap_typical
"}
C {lab_pin.sym} 540 -950 2 0 {name=p6 sig_type=std_logic lab=vout}
C {lab_pin.sym} 370 -950 3 0 {name=p4 sig_type=std_logic lab=vmem}
C {res.sym} 270 -850 0 0 {name=R1
value=10
footprint=1206
device=resistor
m=1}
C {res.sym} 540 -920 0 0 {name=R2
value=250k
footprint=1206
device=resistor
m=1}
C {title.sym} -120 -460 0 0 {name=l4 author="Royce Richmond"}
C {ammeter.sym} 290 -950 3 0 {name=Vdd_c1 savecurrent=true spice_ignore=0}
C {vsource.sym} 370 -640 0 0 {name=V2 value=0.49	 savecurrent=false}
C {lab_pin.sym} 370 -730 0 0 {name=p5 sig_type=std_logic lab=v_bias}
C {res.sym} 370 -700 0 0 {name=R3
value=10
footprint=1206
device=resistor
m=1}
C {gnd.sym} 370 -580 0 0 {name=l5 lab=GND}
C {lab_pin.sym} 430 -930 3 0 {name=p7 sig_type=std_logic lab=v_bias}
C {vsource.sym} 270 -650 0 0 {name=V3 value=0	 savecurrent=false}
C {lab_pin.sym} 270 -740 0 0 {name=p8 sig_type=std_logic lab=vss}
C {gnd.sym} 270 -590 0 0 {name=l3 lab=GND}
C {launcher.sym} 450 -820 0 0 {name=h5
descr="load waves" 
tclcommand="xschem raw_read $netlist_dir/AH_neuron_pex.raw tran"
}
C {lab_pin.sym} 470 -880 3 0 {name=p14 sig_type=std_logic lab=vss}
C {designs/libs/core_AH_neuron/AH_neuron.sym} 230 -1300 0 0 {name=x2}
C {isource.sym} 260 -1420 0 0 {name=I1 value="PULSE(0 1000p 1u 10n 10n 1u 5u)"}
C {lab_pin.sym} 260 -1470 0 0 {name=p10 sig_type=std_logic lab=vdd}
C {lab_pin.sym} 470 -1370 0 0 {name=p11 sig_type=std_logic lab=vdd}
C {lab_pin.sym} 540 -1290 2 0 {name=p12 sig_type=std_logic lab=vout2}
C {lab_pin.sym} 370 -1290 3 0 {name=p13 sig_type=std_logic lab=vmem2}
C {res.sym} 540 -1260 0 0 {name=R5
value=250k
footprint=1206
device=resistor
m=1}
C {ammeter.sym} 290 -1290 3 0 {name=Vdd_c2 savecurrent=true spice_ignore=0}
C {lab_pin.sym} 430 -1270 3 0 {name=p15 sig_type=std_logic lab=v_bias}
C {lab_pin.sym} 470 -1220 3 0 {name=p16 sig_type=std_logic lab=vss}
C {designs/pex/AH_neuron/AH_neuron_pex.sym} 230 -960 0 0 {name=x1}
