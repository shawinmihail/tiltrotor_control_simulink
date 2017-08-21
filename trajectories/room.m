%% room

l1 = 2;
a1 = 1;
t1 = sqrt(2*l1/a1);
v1 = a1*t1;
r1 = 0;

radius = 2;
period = 2*pi*radius/v1;
phase = 0;
dr1 = [2;-2;0];
t2 = (2*pi*radius/4)/v1;
h = 1.5;
r2 = 0;
t3 = t1 + t2 + 1

if t < t1
    r_des = [a1*t^2/2;0;0.5];
    eul_des = [0;0;0]*pi/180;
    r1 = r_des;
elseif t < t1 + t2
    T = t - t1;
    arg = T*2*pi/period + phase;
    x = r1(1) + radius*sin(arg) + dr1(1);
    y = r1(1) + radius*cos(arg) + dr1(2);
    r_des = [x;y;0.5 + T*h/(t2)];
    eul_des = [-arg;0;atan(1.5/2)];
else
    r_des = [4;-16;2];
    eul_des = [-pi/2;0;0];
end
R_des = eul2rotm(eul_des');
