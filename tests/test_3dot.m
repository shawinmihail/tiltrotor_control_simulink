g = [0;0;-10];
J = ones(6, 4);
Jr = ones(6, 6);
W = [1;1;1;1];
f = [g;zeros(3,1)];

s_ddot = f + Jr*J*W;
r_ddot = s_ddot(1:4);
w_dot = s_ddot(5:8);
