clc
clear
%%
syms k b l q
% k = 1.13e-5;
% b = 1.5e-6;
% l = 0.25;

W = sym('W', [4 1]);
Th = sym('Th', [4 1]);
f = sym('f', [3 1]);
% f = [5; 10; 40];
F = zeros(6,1);

% assume([k b l],'real')
rot_dirs = [1;-1;1;-1];
rays =  [1;1;0;
         -1;1;0;
         -1;-1;0
          1;-1;0];
ex = [1;0;0];
er = rays(1:3);
er = er / norm(er);
%% J
for i = 1:4
    eps = 1e-1;
%     th = sign(2.5-i)*Th(2-mod(i,2));
    th = Th(i);
    w = W(i);
    dir = rot_dirs(i);
    ray = rays(3*i-2:3*i);
%     cosAlpha = dot(ex, ray/norm(ray));
    cosAlpha = dot(er, ray/norm(ray));
    alpha = acos(cosAlpha);
    if(ray(2) < 0)
        alpha = -alpha;
    end
%     w = 1;
%     if i == 2 || i == 4
%         w=0;
%     end
    c = cos(alpha);
    s = sin(alpha);
    if abs(c) < eps
        c = 0;
    end
    if abs(s) < eps
        s = 0;
    end
    J(1, i) = k*(dir*sin(th)*s);
    J(2, i) = k*(-dir*sin(th)*c);
    J(3, i) = k*(dir*cos(th));
    J(4, i) = k*l*(dir*cos(th)*s) + 1*b*(-sin(th)*s);
    J(5, i) = k*l*(-dir*cos(th)*c) + 1*b*(+sin(th)*c);
    J(6, i) = k*l*(-dir*sin(th)) + 1*b*(-cos(th));
    F = F + J(:,i)*w;
end

% matlabFunction(J,'file', 'tests/xflJ');

syms f1 f2 f3 t1 t2 t3
f = [f1;f2;f3];
t = [t1;t2;t3];
X = [f;t];

eq1 = F(1) - X(1);
eq3 = F(3) - X(3);
eq4 = F(4) - X(4);
eq6 = F(6) - X(6);
eqI = [eq1 eq3 eq4 eq6];
eqI = subs(eqI, [W(1), W(3)], [0, 0]);
% subs(eqI, [Th(2) Th(4)], [0 0]);

eq2 = F(2) == X(2);
eq3 = F(3) == X(3);
eq5 = F(5) == X(5);
eq6 = F(6) == X(6);
eqII = [eq2 eq3 eq5 eq6];
eqII = subs(eqII, [W(2), W(4)], [0, 0]);

%% generate
s = solve(eqII, [W(1) W(3) Th(1) Th(3)]);
pretty(simplify(s.W3))
pretty(simplify(s.Th3))

s = solve(eqI, [W(2) W(4) Th(2) Th(4)]);
simplify(s.W4)
