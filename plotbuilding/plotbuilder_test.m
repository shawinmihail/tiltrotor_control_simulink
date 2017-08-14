clc
close all

%%
t = time.Data;

rr = r_real.Data;
rf = r_filtered.Data;
vr = v_real.Data;
vf = v_filtered.Data;
vdr = vdot_real.Data;
vdf = vdot_filtered.Data;

elr = eul_real.Data;
elf = eul_filtered.Data;
omr = omega_real.Data;
omf = omega_filtered.Data;

x1 = rr;
x2 = rf;
name = 'r';
run('plotXYZ');

x1 = vr;
x2 = vf;
name = 'v';
run('plotXYZ');

x1 = vdr;
x2 = vdf;
name = 'a';
run('plotXYZ');

x1 = rr;
x2 = rf;
name = 'r';
run('plotXYZ');

x1 = elr;
x2 = elf;
name = 'eul';
run('plotXYZ');

x1 = omr;
x2 = omf;
name = 'omega';
run('plotXYZ');