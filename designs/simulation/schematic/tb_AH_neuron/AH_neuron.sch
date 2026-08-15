v {xschem version=3.4.7 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
B 2 580 170 1090 480 {flags=graph
y1=-0.83
y2=3.8
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
node="vmem
\\"i_in;i(vdd_c1) 1400Meg * 0 *\\""
color="4 6"
dataset=-1
unitx=1
logx=0
logy=0
hilight_wave=-1}
B 2 580 -140 1090 170 {flags=graph
y1=-1.2e-07
y2=3
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
node="vout
x1.m1"
color="6 6"
dataset=-1
unitx=1
logx=0
logy=0
hilight_wave=0
rainbow=1}
T {1.3v synapse interface} -260 -160 0 0 0.2 0.2 {}
T {PULSE(0 1000p 1u 10n 10n 5u 10u)} -260 -180 0 0 0.2 0.2 {}
N 80 50 80 80 {lab=GND}
N 80 -140 80 -130 {lab=vdd}
N 210 -20 210 0 {lab=#net1}
N 210 60 210 80 {lab=#net1}
N 210 -100 210 -80 {lab=vdd}
N 420 0 420 30 {lab=vdd}
N 290 80 370 80 {lab=vmem}
N 470 80 490 80 {lab=vout}
N 420 130 420 150 {lab=GND}
N 490 140 490 150 {lab=GND}
N 420 150 490 150 {lab=GND}
N 210 0 210 60 {lab=#net1}
N 270 80 290 80 {lab=vmem}
N 80 260 80 290 {lab=GND}
C {vsource.sym} 80 20 0 0 {name=V1 value=vd_v savecurrent=false}
C {devices/code_shown.sym} -435 -100 0 0 {name=s1 only_toplevel=false value="
.option method=gear seed=12
.tran 100n 5m
.param vd_v=3.3
.save allcurrents
.options save currents
.control
    let start_v=3.3
    let stop_v=3.3
    let delta_v=1.6
    let v_act=start_v
    while v_act le stop_v
	alterparam vd_v = $&v_act
	reset
	save all
        run
        write sub_th_ah.raw
	let v_act=v_act+delta_v
	set appendwrite
    end
.endc
"
spice_ignore=False}
C {lab_pin.sym} 80 -140 0 0 {name=p1 sig_type=std_logic lab=vdd}
C {ammeter.sym} 80 -100 2 0 {name=Vdd_c savecurrent=true spice_ignore=0}
C {isource.sym} 210 -50 0 0 {name=I0 value="PULSE(0 1000p 1u 10n 10n 1u 5u)"}
C {lab_pin.sym} 210 -100 0 0 {name=p2 sig_type=std_logic lab=vdd}
C {lab_pin.sym} 420 0 0 0 {name=p3 sig_type=std_logic lab=vdd}
C {devices/code_shown.sym} -480 380 0 0 {name=MODELS1 only_toplevel=true
format="tcleval( @value )"
value="
.include $::180MCU_MODELS/design.ngspice
.lib $::180MCU_MODELS/sm141064.ngspice typical
.lib $::180MCU_MODELS/sm141064.ngspice cap_mim
.lib $::180MCU_MODELS/sm141064.ngspice res_typical
.lib $::180MCU_MODELS/sm141064.ngspice moscap_typical
.lib $::180MCU_MODELS/sm141064.ngspice mimcap_typical
"}
C {lab_pin.sym} 490 80 2 0 {name=p6 sig_type=std_logic lab=vout}
C {launcher.sym} 420 190 0 0 {name=h5
descr="load waves" 
tclcommand="xschem raw_read $netlist_dir/sub_th_ah.raw tran"
}
C {designs/libs/core_AH_neuron/AH_neuron.sym} 180 70 0 0 {name=x1}
C {lab_pin.sym} 320 80 3 0 {name=p4 sig_type=std_logic lab=vmem}
C {res.sym} 80 -40 0 0 {name=R1
value=10
footprint=1206
device=resistor
m=1}
C {gnd.sym} 420 150 0 0 {name=l1 lab=GND}
C {gnd.sym} 80 80 0 0 {name=l2 lab=GND}
C {res.sym} 490 110 0 0 {name=R2
value=250k
footprint=1206
device=resistor
m=1}
C {title.sym} -170 570 0 0 {name=l3 author="Royce Richmond"}
C {ammeter.sym} 240 80 3 0 {name=Vdd_c1 savecurrent=true spice_ignore=0}
C {vsource.sym} 80 230 0 0 {name=V2 value=0.49	 savecurrent=false}
C {lab_pin.sym} 80 140 0 0 {name=p5 sig_type=std_logic lab=v_bias}
C {res.sym} 80 170 0 0 {name=R3
value=10
footprint=1206
device=resistor
m=1}
C {gnd.sym} 80 290 0 0 {name=l4 lab=GND}
C {lab_pin.sym} 380 100 3 0 {name=p7 sig_type=std_logic lab=v_bias}
