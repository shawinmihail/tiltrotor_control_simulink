function [ r_des, R_des, eul_des, proj_aim ] = current_traj( t, r, qIB)

r_aim0 = 1*[15, 50, 5]';
A = 45;
T = 60;

t1 = min(10, t);
r_aim = r_aim0 + [2*A*sin(2*pi*t/T) , -1.0*A*cos(2*pi*t/T), 4*sqrt(t)]';

r_des = r_aim;

r_target = r_aim0 + [0.9*A*sin(2*pi*t/T) , -0.25*t1*A*cos(2*pi*t/T), sqrt(t) + 10 * sin(2*pi*t / 31) + 10 * sin(2*pi*t / 61) ]';
q = quatBetweenVectors([1 0 0]', r_target-r);
R_des = quat2rotm(q');
eul_des = quat2eul(q')';

proj_aim = quatRotate(quatDual(qIB), r_target-r);
proj_aim = proj_aim / norm(proj_aim);
proj_aim = proj_aim .* [0 1 1]';
end

