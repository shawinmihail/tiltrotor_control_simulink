function [ r_des, R_des ] = pitchYawRotation(t)
lim = 5;
if t > lim
    t = lim;
end
r_des = [0;0;0];
eul = [0;15;0]*pi/180;
R_des = eul2rotm(eul');

% q = [10;0;0;1];
% q=q/norm(q);
% R_des = quat2rotm(q');
end

