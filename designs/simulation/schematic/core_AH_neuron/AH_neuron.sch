v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
T {og 0.22/2.4
1.6 0.42u/4.2u} -250 100 0 0 0.2 0.2 {}
N 110 -50 110 50 {lab=#net1}
N -20 -20 -20 20 {lab=#net1}
N -20 0 110 0 {lab=#net1}
N -60 -50 -60 50 {lab=Current_in}
N -20 -100 -20 -80 {lab=vdd}
N -20 -50 0 -50 {lab=vdd}
N 0 -80 0 -50 {lab=vdd}
N -20 -80 0 -80 {lab=vdd}
N 150 -100 150 -80 {lab=vdd}
N 150 -50 170 -50 {lab=vdd}
N 170 -80 170 -50 {lab=vdd}
N 150 -80 170 -80 {lab=vdd}
N 150 -20 150 20 {lab=vout}
N -20 80 -20 100 {lab=vss}
N -20 50 0 50 {lab=vss}
N 0 50 0 80 {lab=vss}
N -20 80 0 80 {lab=vss}
N 150 50 170 50 {lab=vss}
N 170 50 170 80 {lab=vss}
N 150 80 170 80 {lab=vss}
N 150 80 150 100 {lab=vss}
N 90 -140 260 -140 {lab=vout}
N 260 -140 260 -10 {lab=vout}
N 150 0 260 0 {lab=vout}
N 260 -10 260 0 {lab=vout}
N -90 -140 30 -140 {lab=Current_in}
N -90 0 -60 0 {lab=Current_in}
N -210 0 -90 0 {lab=Current_in}
N 260 0 260 170 {lab=vout}
N -110 170 -90 170 {lab=vss}
N -110 170 -110 200 {lab=vss}
N -110 200 -90 200 {lab=vss}
N -120 -140 -90 -140 {lab=Current_in}
N -120 -140 -120 0 {lab=Current_in}
N -50 170 -20 170 {lab=vout}
N 40 170 260 170 {lab=vout}
N 260 0 290 -0 {lab=vout}
N -90 200 -90 220 {lab=vss}
N -20 170 40 170 {lab=vout}
N -110 110 -90 110 {lab=vss}
N -110 110 -110 170 {lab=vss}
N -90 0 -90 80 {lab=Current_in}
C {lab_pin.sym} -20 -100 0 0 {name=p3 sig_type=std_logic lab=vdd}
C {lab_pin.sym} 150 -100 0 0 {name=p4 sig_type=std_logic lab=vdd}
C {symbols/pfet_03v3.sym} 130 -50 0 0 {name=M5
L=1.4u
W=0.84u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=pfet_03v3
spiceprefix=X
}
C {symbols/pfet_03v3.sym} -40 -50 0 0 {name=M1
L=0.56u
W=0.44u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=pfet_03v3
spiceprefix=X
}
C {symbols/nfet_03v3.sym} 130 50 0 0 {name=M2
L=0.78u
W=0.42u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=nfet_03v3
spiceprefix=X
}
C {symbols/nfet_03v3.sym} -40 50 0 0 {name=M3
L=0.56u
W=0.44u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=nfet_03v3
spiceprefix=X
}
C {symbols/nfet_03v3.sym} -70 170 0 1 {name=M4
L=1.68u
W=0.42u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=nfet_03v3
spiceprefix=X
}
C {iopin.sym} -240 -100 0 0 {name=p1 lab=vdd}
C {iopin.sym} -240 -70 0 0 {name=p8 lab=vss}
C {iopin.sym} -210 0 2 0 {name=p9 lab=Current_in}
C {iopin.sym} 290 0 0 0 {name=p10 lab=vout}
C {lab_pin.sym} -20 90 2 0 {name=p12 sig_type=std_logic lab=vss}
C {lab_pin.sym} 150 100 0 0 {name=p13 sig_type=std_logic lab=vss}
C {lab_pin.sym} -90 220 0 0 {name=p5 sig_type=std_logic lab=vss}
C {title.sym} -260 310 0 0 {name=l1 author="Royce Richmond"}
C {symbols/cap_mim_2f0fF.sym} 60 -140 1 0 {name=C3
W=6e-6
L=5e-6
model=cap_mim_2f0fF
spiceprefix=X
m=1}
C {symbols/nfet_03v3.sym} -70 110 0 1 {name=M6
L=5.6u
W=0.42u
nf=1
m=1
ad="'int((nf+1)/2) * W/nf * 0.18u'"
pd="'2*int((nf+1)/2) * (W/nf + 0.18u)'"
as="'int((nf+2)/2) * W/nf * 0.18u'"
ps="'2*int((nf+2)/2) * (W/nf + 0.18u)'"
nrd="'0.18u / W'" nrs="'0.18u / W'"
sa=0 sb=0 sd=0
model=nfet_03v3
spiceprefix=X
}
C {iopin.sym} -50 110 0 0 {name=p2 lab=v_bias}
