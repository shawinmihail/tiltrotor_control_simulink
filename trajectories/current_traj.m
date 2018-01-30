function [ r_des, R_des, eul_des ] = current_traj( t, rr)

% r_des = 1*[10;7;5];
% eul_des = [0;0;0];
% R_des = eul2rotm(eul_des'); 
% return;

%% 8
radius = 10;
period = 20;
r_des = radius * [sin(t*2*pi/period);sin(2*t*2*pi/period); 0];
dr = radius * [cos(t*2*pi/period)*2*pi/period; cos(2*t*2*pi/period)*2*2*pi/period; 0];
q = quatBetweenVectors([1;0;0], dr);
R_des = quat2rotm(q');
eul_des = quat2eul(q')';

end

