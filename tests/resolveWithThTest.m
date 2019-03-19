clc
clear
%%
% syms k b l q
k = 1.13e-5;
b = 1.5e-6;
l = 0.25;

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

F(1) = subs(F(1), [W(1), W(3)], [0, 0]);
F(2) = subs(F(2), [W(2), W(4)], [0, 0]);
F(4) = subs(F(4), [W(1), W(3)], [0, 0]);
F(5) = subs(F(5), [W(2), W(4)], [0, 0]);

syms t1 t2 t3a t3b
assume([t1 t2 t3a t3b], 'real')
X = [t1 t2 t3a t3b]';
eqs = sym('eq', [4 1]);
for i = 1:4
    eqs(i) = F(i) - X(i);
    eq = eqs(i)
end
s = solve(eqs, W)
w1 = s.W1;
w1 = subs(w1, [t1 t2 t3a t3b], [0.01 0.01 3 -3]);
w1 = subs(w1, Th, [rand() rand() rand() rand()]'-[1 1 1 1]'*0.5);
w1d = double(w1)

return


%% generate
s1 = solve(eqII, [W(1) W(3)]);
s2 = solve(eqI, [W(2) W(4)]);
w1 = s1.W1
w3 = s1.W3
w2 = s2.W2
w4 = s2.W4

% matlabFunction(w1, 'file', 'tests/W1ThPredicted.m');
% matlabFunction(w3, 'file', 'tests/W3ThPredicted.m');
% matlabFunction(w2, 'file', 'tests/W2ThPredicted.m');
% matlabFunction(w4, 'file', 'tests/W4ThPredicted.m');

return
