v {xschem version=3.4.7 file_version=1.2}
G {}
K {}
V {}
S {}
E {}
B 2 660 -120 1170 190 {flags=graph
y1=0.56
y2=1.96
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
\\"i_in;i(vdd_c1) 1400Meg *\\""
color="4 6"
dataset=-1
unitx=1
logx=0
logy=0
hilight_wave=-1}
B 2 660 -430 1170 -120 {flags=graph
y1=-0.61
y2=4
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
hilight_wave=1
rainbow=1
color="4 12 13 10"
node="pad_in
asig_in
asig
pad"}
N -360 30 -360 60 {lab=GND}
N -360 -160 -360 -150 {lab=vdd}
N 450 -310 450 -290 {lab=pad}
N 450 -390 450 -370 {lab=vdd}
N -20 -20 -20 10 {lab=vdd}
N -150 60 -70 60 {lab=ASIG_in}
N 30 60 50 60 {lab=ASIG}
N -20 110 -20 130 {lab=GND}
N 450 -290 450 -230 {lab=pad}
N -170 60 -150 60 {lab=ASIG_in}
N -130 -210 -130 -170 {lab=GND}
N -30 -210 -30 -170 {lab=GND}
N -190 -310 -190 -270 {lab=DVDD}
N -130 -310 -130 -270 {lab=DVSS}
N -30 -310 -30 -270 {lab=VSS}
N -180 -170 -180 -150 {lab=GND}
N -350 260 -350 290 {lab=GND}
N 370 -230 450 -230 {lab=pad}
N -190 -210 -190 -170 {lab=GND}
N -190 -170 -30 -170 {lab=GND}
C {vsource.sym} -360 0 0 0 {name=V1 value=vd_v savecurrent=false}
C {devices/code_shown.sym} -95 280 0 0 {name=s1 only_toplevel=false value="
.option method=gear seed=12
.tran 100u 15m
.include /foss/designs/Mosbious_2025_Spikcore/designs/pex/AH_neuron/AH_neuron_pex.spice
.include /foss/designs/Mosbious_2025_Spikcore/miscellaneous/sscs-chipathon/resources/Integration/Chipathon2025_pads/xschem/gf180mcu_fd_io__asig_5p0_extracted.spice
.param vd_v=3.3
.save allcurrents
.options save currents
.control
	set num_threads=24
	run
	write AH_neuron_pad.raw
.endc
"
spice_ignore=False}
C {lab_pin.sym} -360 -160 0 0 {name=p1 sig_type=std_logic lab=vdd}
C {ammeter.sym} -360 -120 2 0 {name=Vdd_c savecurrent=true spice_ignore=0}
C {isource.sym} 450 -340 0 0 {name=I0 value="PULSE(0 1000p 1u 10n 10n 1u 5u)"}
C {lab_pin.sym} 450 -390 0 0 {name=p2 sig_type=std_logic lab=vdd}
C {lab_pin.sym} -20 -20 0 0 {name=p3 sig_type=std_logic lab=vdd}
C {devices/code_shown.sym} -840 360 0 0 {name=MODELS1 only_toplevel=true
format="tcleval( @value )"
value="
.include $::180MCU_MODELS/design.ngspice
.lib $::180MCU_MODELS/sm141064.ngspice diode_typical
.lib $::180MCU_MODELS/sm141064.ngspice typical
.lib $::180MCU_MODELS/sm141064.ngspice cap_mim
.lib $::180MCU_MODELS/sm141064.ngspice res_typical
.lib $::180MCU_MODELS/sm141064.ngspice moscap_typical
.lib $::180MCU_MODELS/sm141064.ngspice mimcap_typical
"}
C {lab_pin.sym} 50 60 1 0 {name=p6 sig_type=std_logic lab=ASIG}
C {launcher.sym} 460 210 0 0 {name=h5
descr="load waves" 
tclcommand="xschem raw_read $netlist_dir/AH_neuron_pad.raw tran"
}
C {res.sym} -360 -60 0 0 {name=R1
value=10
footprint=1206
device=resistor
m=1}
C {gnd.sym} -20 130 0 0 {name=l1 lab=GND}
C {gnd.sym} -360 60 0 0 {name=l2 lab=GND}
C {res.sym} -260 220 0 0 {name=R2
value=250k
footprint=1206
device=resistor
m=1}
C {title.sym} -170 570 0 0 {name=l3 author="Royce Richmond"}
C {vsource.sym} -190 -240 0 0 {name=V2 value=5 savecurrent=false}
C {vsource.sym} -130 -240 0 0 {name=V4 value=0 savecurrent=false}
C {vsource.sym} -30 -240 0 0 {name=V5 value=0 savecurrent=false}
C {lab_wire.sym} -190 -310 0 0 {name=p5 sig_type=std_logic lab=DVDD}
C {gnd.sym} -180 -150 0 0 {name=l4 lab=GND}
C {lab_wire.sym} -130 -310 0 0 {name=p8 sig_type=std_logic lab=DVSS}
C {lab_wire.sym} -30 -310 0 0 {name=p9 sig_type=std_logic lab=VSS}
C {lab_pin.sym} -260 190 0 0 {name=p7 sig_type=std_logic lab=pad}
C {gnd.sym} -260 250 0 0 {name=l5 lab=GND}
C {/foss/designs/sscs-chipathon-2025/resources/Integration/Chipathon2025_pads/xschem/symbols/io_asig_5p0.sym} 330 140 0 1 {name=IO1
model=gf180mcu_fd_io__asig_5p0_extracted
spiceprefix=X
}
C {vsource.sym} -350 230 0 0 {name=V3 value=0.49	 savecurrent=false}
C {lab_pin.sym} -350 140 0 0 {name=p10 sig_type=std_logic lab=v_bias}
C {res.sym} -350 170 0 0 {name=R3
value=10
footprint=1206
device=resistor
m=1}
C {gnd.sym} -350 290 0 0 {name=l6 lab=GND}
C {lab_pin.sym} -60 80 0 0 {name=p11 sig_type=std_logic lab=v_bias}
C {lab_pin.sym} 130 60 2 1 {name=p12 sig_type=std_logic lab=ASIG}
C {lab_wire.sym} 250 -20 0 1 {name=p13 sig_type=std_logic lab=DVDD}
C {lab_wire.sym} 250 140 0 1 {name=p14 sig_type=std_logic lab=DVSS}
C {lab_wire.sym} 210 140 0 1 {name=p15 sig_type=std_logic lab=VSS}
C {lab_pin.sym} 210 -20 0 1 {name=p16 sig_type=std_logic lab=vdd}
C {lab_pin.sym} 330 60 0 1 {name=p17 sig_type=std_logic lab=pad}
C {lab_pin.sym} 170 -230 2 1 {name=p18 sig_type=std_logic lab=ASIG_in}
C {lab_pin.sym} -170 60 2 1 {name=p24 sig_type=std_logic lab=ASIG_in}
C {designs/pex/AH_neuron/AH_neuron_pex.sym} -260 50 0 0 {name=x2}
C {devices/code_shown.sym} -885 -790 0 0 {name=s2 only_toplevel=false value="
.option method=gear seed=12
.tran 10u 5m
.include /foss/designs/Mosbious_2025_Spikcore/miscellaneous/sscs-chipathon/resources/Integration/Chipathon2025_pads/xschem/gf180mcu_fd_io__asig_5p0_extracted.spice
.param vd_v=3.3
.save allcurrents
.options save currents
.control
reset
save all
run
write AH_neuron_pad.raw
.endc
"
spice_ignore=true}
C {/foss/designs/sscs-chipathon-2025/resources/Integration/Chipathon2025_pads/xschem/symbols/io_asig_5p0.sym} 370 -150 0 1 {name=IO2
model=gf180mcu_fd_io__asig_5p0_extracted
spiceprefix=X
}
C {lab_wire.sym} 290 -310 0 1 {name=p19 sig_type=std_logic lab=DVDD}
C {lab_wire.sym} 290 -150 0 1 {name=p20 sig_type=std_logic lab=DVSS}
C {lab_wire.sym} 250 -150 0 1 {name=p21 sig_type=std_logic lab=VSS}
C {lab_pin.sym} 250 -310 0 1 {name=p22 sig_type=std_logic lab=vdd}
C {lab_pin.sym} 390 -230 3 1 {name=p23 sig_type=std_logic lab=pad}
