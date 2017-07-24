qBI = [10;5;5;5];
qBI = qBI/norm(qBI);
R = quat2matrix(qBI);
r = [1;2;3];

x1 = quatRotate(qBI, r)
x2 = R*r