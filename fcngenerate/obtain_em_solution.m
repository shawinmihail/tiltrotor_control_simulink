%% B FRAME

clc
clear
%%
syms k b l q
W = sym('W', [4 1]);
assume(W, 'real')
Th = sym('Th', [4 1]);
f = sym('f', [3 1]);
assume(f, 'real')
t = sym('t', [3 1]);
assume(t, 'real')
F = zeros(6,1);
ex = [1;0;0];

rot_dirs = [-1;1;-1;1];
rays =  [1;1;0;
         -1;1;0;
         -1;-1;0
          1;-1;0];
%% J
for i = 1:4
    th = Th(i);
    w = W(i);
    dir = rot_dirs(i);
    ray = rays(3*i-2:3*i);
    cosAlpha = dot(ex, ray/norm(ray));
    alpha = acos(cosAlpha);
    if(ray(2) < 0)
        alpha = -alpha;
    end
    J(1, i) = k*(dir*sin(th)*sin(alpha));
    J(2, i) = k*(-dir*sin(th)*cos(alpha));
    J(3, i) = k*(dir*cos(th));
    J(4, i) = k*l*(dir*cos(th)*sin(alpha)) + 1*b*(-sin(th)*sin(alpha));
    J(5, i) = k*l*(-dir*cos(th)*cos(alpha)) + 1*b*(+sin(th)*cos(alpha));
    J(6, i) = k*l*(-dir*sin(th)) + 1*b*(-cos(th));
    F = F + J(:,i);
end
J2 = J * [W(1) 0 0 W(4)]'
eq0 = J2(1) == f(1);
eq1 = J2(4) == t(1);
eq2 = J2(5) == t(2);
% eq11 = eq1 - eq2;
% eq22 = eq1 + eq2;
eq3 = J2(6) == t(3);

eqs = [eq0 eq1 eq2 eq3]
s = solve(eqs, [W(1) W(4) Th(1) Th(4)], 'IgnoreProperties', true);

w1_ = simplify(s.W1)
w4_ = simplify(s.W4)
th1_ = simplify(s.Th1)
th4_ = simplify(s.Th4)


%% check
% th1 = em_solution_Th1(1, 0, 0, 0);
% th4 = em_solution_Th4(1, 0, 0, 0);
% w1 = em_solution_W1(1, 0, 0, 0);
% w4 = em_solution_W4(1, 0, 0, 0);
% 
% k_ = 1.13e-5;
% b_ = 1.5*1e-6;
% l_ = 0.25;
% x = subs(eqs, [k, b, l], [k_, b_, l_])
% x = subs(x, [W(1) W(4) Th(1) Th(4)], [w1 w4 th1 th4])
% xvpa = vpa(x)

return
w1 = -(2*b^4*f1^2 + 4*b^3*f1*k*t2 + 4*b^2*f1^2*k^2*l^2 - 2*2^(1/2)*b^2*f1*k^2*l*t3 + 2*b^2*k^2*t2^2 + 4*b*f1*k^3*l^2*t2 - 2*2^(1/2)*b*k^3*l*t2*t3 + 2*f1^2*k^4*l^4 - 2*2^(1/2)*f1*k^4*l^3*t3 + 2*k^4*l^2*t1^2 - 4*k^4*l^2*t1*t2 + 2*k^4*l^2*t2^2 + k^4*l^2*t3^2)^(1/2)/(2*k^2*l*(b^2 + k^2*l^2)^(1/2));
w4 = (2*b^4*f1^2 + 4*b^3*f1*k*t2 + 4*b^2*f1^2*k^2*l^2 + 2*2^(1/2)*b^2*f1*k^2*l*t3 + 2*b^2*k^2*t2^2 + 4*b*f1*k^3*l^2*t2 + 2*2^(1/2)*b*k^3*l*t2*t3 + 2*f1^2*k^4*l^4 + 2*2^(1/2)*f1*k^4*l^3*t3 + 2*k^4*l^2*t1^2 + 4*k^4*l^2*t1*t2 + 2*k^4*l^2*t2^2 + k^4*l^2*t3^2)^(1/2)/(2*k^2*l*(b^2 + k^2*l^2)^(1/2));
th1 = 2*atan((2*b^3*f1 - 2*k^3*l^2*t1 + 2*k^3*l^2*t2 + 2^(1/2)*(b^2 + k^2*l^2)^(1/2)*(2*b^4*f1^2 + 4*b^3*f1*k*t2 + 4*b^2*f1^2*k^2*l^2 - 2*2^(1/2)*b^2*f1*k^2*l*t3 + 2*b^2*k^2*t2^2 + 4*b*f1*k^3*l^2*t2 - 2*2^(1/2)*b*k^3*l*t2*t3 + 2*f1^2*k^4*l^4 - 2*2^(1/2)*f1*k^4*l^3*t3 + 2*k^4*l^2*t1^2 - 4*k^4*l^2*t1*t2 + 2*k^4*l^2*t2^2 + k^4*l^2*t3^2)^(1/2) + 2*b^2*k*t2 + 2*b*f1*k^2*l^2 - 2^(1/2)*b*k^2*l*t3)/(k*l*(2*f1*b^2 + 2*t1*b*k + 2*f1*k^2*l^2 - 2^(1/2)*t3*k^2*l)));
th4 = -2*atan((2*b^3*f1 + 2*k^3*l^2*t1 + 2*k^3*l^2*t2 + 2^(1/2)*(b^2 + k^2*l^2)^(1/2)*(2*b^4*f1^2 + 4*b^3*f1*k*t2 + 4*b^2*f1^2*k^2*l^2 + 2*2^(1/2)*b^2*f1*k^2*l*t3 + 2*b^2*k^2*t2^2 + 4*b*f1*k^3*l^2*t2 + 2*2^(1/2)*b*k^3*l*t2*t3 + 2*f1^2*k^4*l^4 + 2*2^(1/2)*f1*k^4*l^3*t3 + 2*k^4*l^2*t1^2 + 4*k^4*l^2*t1*t2 + 2*k^4*l^2*t2^2 + k^4*l^2*t3^2)^(1/2) + 2*b^2*k*t2 + 2*b*f1*k^2*l^2 + 2^(1/2)*b*k^2*l*t3)/(k*l*(2*f1*b^2 - 2*t1*b*k + 2*f1*k^2*l^2 + 2^(1/2)*t3*k^2*l)));