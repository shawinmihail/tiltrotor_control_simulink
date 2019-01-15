eul = [0, 0, 0.1];
R = eul2rotm(eul);
r = [10; 3; 5];
N = 6;
rs1 = 10:100:N*100;

syms z1 z2 R r

R1 = eul2rotm(0, 0, 0.1)
r1 = [100 50 z1];
r2 = [112 48 z2];
eq = r2 == R1