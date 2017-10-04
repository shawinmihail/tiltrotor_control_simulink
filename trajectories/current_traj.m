function [ r_des, R_des, eul_des ] = current_traj( t, rr)

% r_des = 0*[10;0;10];
% eul_des = 1*[0;30;0]*pi/180;
% R_des = eul2rotm(eul_des');

%% sin
l1 = 2;
a1 = 1.0;
t1 = sqrt(2*l1/a1);
v1 = a1*t1;

r02 = [l1;0;0];
l2 = 5*2;
v2 = v1;
t2 = l2/v2;

r03 = [l1+v2*t2;0;0];
v3 = v2;
a3 = a1;
dr = [0;0;0];
if t < t1
    x = a1*t^2/2;
    a = 2.4961347784740068944135913136399;
    b = -5.6786033427967179120564872855637;
    c = -0.50341832934526592342369583293774;
    y = exp(a*x+b) + c;
    dx = a1*t;
    dy = dx*a*exp(b + a*x);
    r_des = [x;y;0.0];
    dr = [dx;dy;0];
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
    T = t - t1;
    period = t2 / 2;
    arg = T*2*pi/period;
    a = 2.4961347784740068944135913136399;
    b = 11.725041375262481183447842935354;
    c = 0.50341832934526592342369583293774;
    x = r02(1) + v2*T;
    y = c - exp(a*(b - x));
    r_des = [x;y;0];
    dx = v2;
    dy = dx*a*exp(a*(b - x));
    dr = [dx; dy; 0];
end
q = quatBetweenVectors([1;0;0], dr);
% q = quatBetweenVectors([1;0;0], [1;0;0]);
R_des = quat2rotm(q');
eul_des = quat2eul(q')';



end

