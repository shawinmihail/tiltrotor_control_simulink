clc
close all

%%
t = time.Data;

rr = r_real.Data;
rf = r_filtered.Data;
rd = r_des.Data;
vr = v_real.Data;
vf = v_filtered.Data;
vdr = vdot_real.Data;
vdf = vdot_filtered.Data;

elr = eul_real.Data;
elf = eul_filtered.Data;
eld = eul_des.Data;
omr = omega_real.Data;
omf = omega_filtered.Data;

x1 = rf;
x2 = rd;
x3 = rd;
run('plotTraj');