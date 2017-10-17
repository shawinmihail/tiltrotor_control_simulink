function [ r_des, R_des, eul_des ] = current_traj( t, rr)
traj_num = 2;

if traj_num == 1
r_des = 1*[40;20;20];
eul_des = 0*[0;8*sin(t/5);0]*pi/180;
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
end


end

