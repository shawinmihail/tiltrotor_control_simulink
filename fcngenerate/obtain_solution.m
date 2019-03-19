clc
clear
%%
syms k b l q

W = sym('W', [4 1]);
Th = sym('Th', [4 1]);
F = zeros(6,1);

assume([k b l],'real')
rot_dirs = [-1;1;-1;1];
rays =  [1;1;0;
         -1;1;0;
         -1;-1;0
          1;-1;0];
ex = [1;0;0];
er = rays(1:3);
er = er / norm(er);
%% J
for i = 1:4
    eps = 1e-2;
    th = Th(i);
    w = W(i);
    dir = rot_dirs(i);
    ray = rays(3*i-2:3*i);
    cosAlpha = dot(er, ray/norm(ray));
    alpha = acos(cosAlpha);
    if(ray(2) < 0)
        alpha = -alpha;
    end
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

syms f1 f2 f3 t1 t2 t3 eps
f = [f1;f2;f3];
t = [t1;t2;t3];
X = [f;t];

eq1 = F(1) - X(1);
eq3 = F(3) - X(3);
eq4 = F(4) - X(4);
eq6 = F(6) - X(6);
eqI = [eq1 eq3 eq4 eq6];
eqI = subs(eqI, [W(1), W(3)], [0, 0]);

eq2 = F(2) == X(2);
eq3 = F(3) == X(3);
eq5 = F(5) == X(5);
eq6 = F(6) == X(6);
eqII = [eq2 eq3 eq5 eq6];
eqII = subs(eqII, [W(2), W(4)], [0, 0]);

%% generate
s13 = solve(eqII, [W(1) W(3) Th(1) Th(3)], 'IgnoreProperties', true);
s24 = solve(eqI, [W(2) W(4) Th(2) Th(4)], 'IgnoreProperties', true);

W1s = simplify(s13.W1);
W2s = simplify(s24.W2);
W3s = simplify(s13.W3);
W4s = simplify(s24.W4);

Th1s = simplify(s13.Th1);
Th2s = simplify(s24.Th2);
Th3s = simplify(s13.Th3);
Th4s = simplify(s24.Th4);

B1 = (b*f3 - k*t3 - f2*k*l);
B3 = (b*f3 - k*t3 + f2*k*l);
B2 = (b*f3 + k*t3 - f1*k*l);
B4 = (b*f3 + k*t3 + f1*k*l);

A1 = (f3*k*l + b*f2 - k*t2);
A3 = (f3*k*l - b*f2 + k*t2);
A2 = (f3*k*l + b*f1 + k*t1);
A4 = (f3*k*l - b*f1 - k*t1);



% check on A B
% expand(A1^2 + B1^2) - (W1s(1)*2*k*k*l)^2
% expand(A1^2 + B1^2) - (W1s(2)*2*k*k*l)^2
% expand(A1^2 + B1^2) - (W1s(3)*2*k*k*l)^2
% expand(A1^2 + B1^2) - (W1s(4)*2*k*k*l)^2
% 
% expand(A2^2 + B2^2) - (W2s(1)*2*k*k*l)^2
% expand(A2^2 + B2^2) - (W2s(2)*2*k*k*l)^2
% expand(A2^2 + B2^2) - (W2s(3)*2*k*k*l)^2
% expand(A2^2 + B2^2) - (W2s(4)*2*k*k*l)^2
% 
% expand(A4^2 + B4^2) - (W4s(1)*2*k*k*l)^2
% expand(A4^2 + B4^2) - (W4s(2)*2*k*k*l)^2
% expand(A4^2 + B4^2) - (W4s(3)*2*k*k*l)^2
% expand(A4^2 + B4^2) - (W4s(4)*2*k*k*l)^2
% 
% expand(A3^2 + B3^2) - (W3s(1)*2*k*k*l)^2
% expand(A3^2 + B3^2) - (W3s(2)*2*k*k*l)^2
% expand(A3^2 + B3^2) - (W3s(3)*2*k*k*l)^2
% expand(A3^2 + B3^2) - (W3s(4)*2*k*k*l)^2

% W1 = rot_dirs(1) * (A1^2 + B1^2) / 2*k*k*l
% W2 = rot_dirs(1) * (A2^2 + B2^2) / 2*k*k*l
% W3 = rot_dirs(1) * (A3^2 + B3^2) / 2*k*k*l
% W4 = rot_dirs(1) * (A4^2 + B4^2) / 2*k*k*l
