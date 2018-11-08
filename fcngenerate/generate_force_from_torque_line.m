function generate_force_from_torque_line( rays, rot_dirs, k, b, l)
%%
W = sym('W', [4 1]);
Th = sym('Th', [4 1]);
t = sym('t', [3 1]);
syms W0

F = zeros(6,1);
ex = [1;0;0];
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
    J(4, i) = k*l*(dir*cos(th)*sin(alpha)) + b*(-sin(th)*sin(alpha));
    J(5, i) = k*l*(-dir*cos(th)*cos(alpha)) + b*(+sin(th)*cos(alpha));
    J(6, i) = k*l*(-dir*sin(th)) + b*(-cos(th));
    F = F + J(:,i)*w;
end

J_t = J(4:6,:);
F_f = F(1:3,:);
eq = [1 0 0 0];
A = [J_t;eq]
y = [t; W0]
x = [W(1);W(2);W(3);W(4)]

eqs = A*x == y;
s = solve(eqs, x)
s.W1
s.W2
s.W3
s.W4
x0 = [s.W1;s.W2;s.W3;s.W4];

F_f_w = subs(F_f, x, x0);
hold on
for i = 1:50
    Th0 = 2 * pi/3 * (0.5*ones(4,1) - rand(4,1));
    t0 = 0.5 * pi/3 * (0.5*ones(3,1) - rand(3,1));
    F_f_w0 = subs(F_f_w, [Th; t], [Th0; t0]);
    W_lim = 1e6;

    p1 = double(subs(F_f_w0, W0, 0));
    p2 = double(subs(F_f_w0, W0, -W_lim));
    plot3([p1(1) p2(1)], [p1(2) p2(2)], [p1(3) p2(3)])
end
grid on


% matlabFunction(J, 'file', 'generated/xfl_J_B.m');
end

