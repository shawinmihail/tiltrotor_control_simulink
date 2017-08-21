%% sin

l1 = 2;
a1 = 1;
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
    eul_des = [0;0;0]*pi/180;
elseif t < t1 + t2
    T = t - t1;
    period = t2 / 2;
    arg = T*2*pi/period;
    x = r02(1) + v2*T;
    y = r02(2) + sin(arg);
    r_des = [x;y;0];
    eul_des = [atan(cos(arg))/v2;0;0];
else
    T = t - t2 - t1;
    period = t2 / 2;
    arg = T*2*pi/period;
    x = r03(1) +v3*T - 0.5*a3*T^2;
    y = r03(2) + (1/(0.5 + 10*T*T))*sin(arg);
    y = r03(2);
    r_des = [x;y;0];
    eul_des = [0;0;0];
end
R_des = eul2rotm(eul_des');