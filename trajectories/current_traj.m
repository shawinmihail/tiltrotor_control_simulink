function [ r_des, R_des, eul_des ] = current_traj( t, rr)
traj_num = 2;

if traj_num == 0
%% point
r_des = 0*[2*t;0;0];
eul_des = 1*[45;0;0]*pi/180;
R_des = eul2rotm(eul_des');


elseif traj_num == 1
%% circle
radius = 1.5;
v = 3;
period = 2*pi*radius/v;
r_des = 1*[radius*sin(2*pi*t/period);radius*cos(2*pi*t/period);0];
eul_des = 0*[period*t;0;0*pi/180];
R_des = eul2rotm(eul_des');

elseif traj_num == 2
%% trees
v = 2.0;
radius = 1.5;
period = 2*pi*radius/v;
r_des = [0;0;0];
dr = [1;0;0];
if t < 0.5*period
    phase = -pi;
    arg = t*2*pi/period + phase;
    r0 = [0; 0; 0];
    x = radius*cos(arg) + r0(1);
    y = radius*sin(arg) + r0(2);
    r_des = [x;y;0];
    dr = [-radius*sin(arg); radius*cos(arg); 0];
elseif t < period
    phase = 0;
    arg = -t*2*pi/period + phase;
    r0 = [2*radius; 0; 0];
    x = radius*cos(arg) + r0(1);
    y = radius*sin(arg) + r0(2);
    r_des = [x;y;0];
    dr = [radius*sin(arg); -radius*cos(arg); 0];
elseif t < 2*period
    phase = -pi;
    arg = t*2*pi/period + phase;
    r0 = [4*radius; 0; 0];
    x = radius*cos(arg) + r0(1);
    y = radius*sin(arg) + r0(2);
    r_des = [x;y;0];
    dr = [-radius*sin(arg); radius*cos(arg); 0];
elseif t < 2.5*period
    phase = 0;
    arg = -t*2*pi/period + phase;
    r0 = [2*radius; 0; 0];
    x = radius*cos(arg) + r0(1);
    y = radius*sin(arg) + r0(2);
    r_des = [x;y;0];
    dr = [radius*sin(arg); -radius*cos(arg); 0];
elseif t < 3*period
    phase = -pi;
    arg = t*2*pi/period + phase;
    r0 = [0; 0; 0];
    x = radius*cos(arg) + r0(1);
    y = radius*sin(arg) + r0(2);
    r_des = [x;y;0];
    dr = [-radius*sin(arg); radius*cos(arg); 0];
end
q = quatBetweenVectors([1;0;0], dr);
R_des = quat2rotm(q');
eul_des = quat2eul(q')';

elseif traj_num == 3
%% labirint
l1 = 2;
a1 = 0.5;
t1 = sqrt(2*l1/a1);
v1 = a1*t1;
r02 = [l1;0;0];
l2 = 5*2;
v2 = v1;
t2 = l2/v2;
r03 = [l1+v2*t2;0;0];
v3 = v2;
a3 = a1;
if t < t1
    r_des = [a1*t^2/2;0;0.0];
    dr = [1;0;0];
elseif t < t1 + t2
    T = t - t1;
    period = t2 / 2;
    arg = T*2*pi/period;
    x = r02(1) + v2*T;
    y = r02(2) + sin(arg);
    r_des = [x;y;0];
    dx = v2;
    dy = cos(arg)*2*pi/period;
    dr = [dx; dy; 0];
else
    T = t - t2 - t1;
    x = r03(1) +v3*T - 0.5*a3*T^2;
    y = r03(2);
    r_des = [x;y;0];
    dr = [1;0;0];
end
q = quatBetweenVectors([1;0;0], dr);
R_des = quat2rotm(q');
eul_des = quat2eul(q')';
end


end

