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
subs(eqI, [Th(2) Th(4)], [0 0])

eq2 = F(2) == X(2);
eq3 = F(3) == X(3);
eq5 = F(5) == X(5);
eq6 = F(6) == X(6);
eqII = [eq2 eq3 eq5 eq6];
eqII = subs(eqII, [W(2), W(4)], [0, 0]);

%% generate
s = solve(eqII, [W(1) W(3) Th(1) Th(3)]);
th3 = simplify(s.Th3(4));

%%
% f3_ = 20;
% t2_ = 0;
% t3_ = -2.64;
% th3 = vpa(subs(th3, [f3 t2 t3], [f3_ t2_ t3_]));
% ezplot(th3, [-25 25])
% TgHalfTh3 = -tan(th3/2);
% z = solve(TgHalfTh3==-tan(pi/6));
% double(z)
%%
return

matlabFunction(s.W1, 'file', 'tests/W1.m');
matlabFunction(s.W3, 'file', 'tests/W3.m');
matlabFunction(s.Th1, 'file', 'tests/Th1.m');
matlabFunction(s.Th3, 'file', 'tests/Th3.m');

s = solve(eqI, [W(2) W(4) Th(2) Th(4)]);
% simplify(s.W2)
% simplify(s.W4)
matlabFunction(s.W2, 'file', 'tests/W2.m');
matlabFunction(s.W4, 'file', 'tests/W4.m');
matlabFunction(s.Th2, 'file', 'tests/Th2.m');
matlabFunction(s.Th4, 'file', 'tests/Th4.m');

return
%%
x = [10*rand()-5; 10*rand()-5; 40+10*rand(); rand()-0.5; rand()-0.5; 3*rand()-1.5]
d = rand()/2;
if x(6) > 0
    tI = x(6) + d;
    tII = -d;
else
    tI = d;
    tII =  x(6) - d;
end
w2 = W2(x(1), x(3)/2, x(4), tI);
th2 = Th2(x(1), x(3)/2, x(4), tI);
w4 = W4(x(1), x(3)/2, x(4), tI);
th4 = Th4(x(1), x(3)/2, x(4), tI);
w1 = W1(x(2), x(3)/2, x(5), tII);
th1 = Th1(x(2), x(3)/2, x(5), tII);
w3 = W3(x(2), x(3)/2, x(5), tII);
th3 = Th3(x(2), x(3)/2, x(5), tII);

sW = [w1(3);w2(4);w3(3);w4(4)]
sTh = [th1(3);th2(4);th3(3);th4(4)]

double(subs(F, [W Th], [sW, sTh])-x)

% q = sqrt(2)/2;
% ef1 = [q*sin(Th(1));-q*sin(Th(1));cos(Th(1))];
% ef2 = [-q*sin(Th(2));-q*sin(Th(2));-cos(Th(2))];
% et1 = [q*l*cos(Th(1));-q*l*cos(Th(1));-l*sin(Th(1))];
% et2 = [-q*l*cos(Th(2));-q*l*cos(Th(2));l*sin(Th(2))];
% 
% 
% e1 = [ef1;et1];
% e2 = [ef2;et2];
% eN = cross(e1,e2);
% eS = dot(X,eN)
