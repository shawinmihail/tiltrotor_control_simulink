function [ r_des, R_des, eul_des ] = current_traj( t, rr)

%% sin
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

