p1 = [2 -2 0];
p2 = [2 2 0];
p3 = [5 2 0];
p4 = [5 -2 0];
p5 = [2 -2 3];
p6 = [2 2  3];
p7 = [5 2  3];
p8 = [5 -2 3];
a = 0.5;

x = [p1(1) p2(1) p3(1) p4(1)];
y = [p1(2) p2(2) p3(2) p4(2)];
z = [p1(3) p2(3) p3(3) p4(3)];
f = fill3(x, y, z, 1);
set(f,'FaceAlpha',a,'EdgeAlpha',a);

x = [p5(1) p6(1) p7(1) p8(1)];
y = [p5(2) p6(2) p7(2) p8(2)];
z = [p5(3) p6(3) p7(3) p8(3)];
f = fill3(x, y, z, 1);
set(f,'FaceAlpha',a,'EdgeAlpha',a);
 
x = [p2(1) p6(1) p7(1) p3(1)];
y = [p2(2) p6(2) p7(2) p3(2)];
z = [p2(3) p6(3) p7(3) p3(3)];
f = fill3(x, y, z, 1);
set(f,'FaceAlpha',a,'EdgeAlpha',a);

x = [p1(1) p5(1) p8(1) p4(1)];
y = [p1(2) p5(2) p8(2) p4(2)];
z = [p1(3) p5(3) p8(3) p4(3)];
f = fill3(x, y, z, 1);
set(f,'FaceAlpha',a,'EdgeAlpha',a);
 
x = [p6(1) p2(1) p1(1) p5(1)];
y = [p6(2) p2(2) p1(2) p5(2)];
z = [p6(3) p2(3) p1(3) p5(3)];
f = fill3(x, y, z, 1);
set(f,'FaceAlpha',a,'EdgeAlpha',a);

x = [p4(1) p8(1) p7(1) p3(1)];
y = [p4(2) p8(2) p7(2) p3(2)];
z = [p4(3) p8(3) p7(3) p3(3)];
f = fill3(x, y, z, 1);
set(f,'FaceAlpha',a,'EdgeAlpha',a);

p1 = [2 -1 0];
p2 = [2  1 0];
p3 = [2 1  2];
p4 = [2 -1 2];
x = [p1(1) p2(1) p3(1) p4(1)];
y = [p1(2) p2(2) p3(2) p4(2)];
z = [p1(3) p2(3) p3(3) p4(3)];
f = fill3(x, y, z, 2);
set(f,'FaceAlpha',1,'EdgeAlpha',1);

p1 = [3.8 -2 1.8];
p2 = [3.8 -2 2.2];
p3 = [4.2 -2 2.2];
p4 = [4.2 -2 1.8];
x = [p1(1) p2(1) p3(1) p4(1)];
y = [p1(2) p2(2) p3(2) p4(2)];
z = [p1(3) p2(3) p3(3) p4(3)];
f = fill3(x, y, z, 2);
set(f,'FaceAlpha',1,'EdgeAlpha',1);

xlim([-1 6])
ylim([-4 4])
zlim([0 4])