% a = pi/4;
% ex = [1;0;0];
% r = [1;1;1]
% q = [cos(a/2);ex*sin(a/2)]
% R = quat2matrix(q)
% 
% x1 = R*r
% x2 = quatRotate(q, r)

qw = [0;0;1;1];
q_BI = [1;0;0;1];
q_BI = q_BI/norm(q_BI);
quatMultiply(q_BI,qw)
quatMultiply(qw, q_BI)