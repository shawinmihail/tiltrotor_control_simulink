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

x1 = rr;
x2 = rf;
x3 = rd;
name = 'r';
run('plotXYZ3');

x1 = vr;
x2 = vr;
name = 'v';
run('plotXYZ');

x1 = elr;
x2 = elf;
x3 = eld;
name = 'eul';
run('plotXYZ3');

