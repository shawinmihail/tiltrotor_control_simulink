%%
rot_dirs = [1;-1;1;-1];
rays =  [1;1;0;
          -1;1;0;
           -1;-1;0
           1;-1;0];
ex = [1;0;0];
k = 1;
b = 1;
l = 1;

%%

y =  sym('y',  [2 1]);
Th = sym('Th', [4 1]);
W = sym('W', [4 1]);
Jf = sym('Jf', [3 4]);
Jt = sym('Jt', [3 4]);


%% Jf
for i = 1:4
    th_sym = Th(i);
    dir = rot_dirs(i);
    ray = rays(3*i-2:3*i);
    cosAlpha = dot(ex, ray/norm(ray));
    alpha = acos(cosAlpha);
    if(ray(2) < 0)
        alpha = -alpha;
    end
    Jf(1, i) = k*(dir*(th_sym)*sin(alpha));
    Jf(2, i) = k*(-dir*(th_sym)*cos(alpha));
    Jf(3, i) = k*(dir*(1-th_sym*th_sym));
end

%% Jt
for i = 1:4
    th_sym = Th(i);
    dir = rot_dirs(i);
    ray = rays(3*i-2:3*i);
    cosAlpha = dot(ex, ray/norm(ray));
    alpha = acos(cosAlpha);
    if(ray(2) < 0)
        alpha = -alpha;
    end
    Jt(1, i) = k*l*(dir*(1-th_sym)*sin(alpha)) + b*(-(th_sym)*sin(alpha));
    Jt(2, i) = k*l*(-dir*(1-th_sym)*cos(alpha)) + b*((th_sym)*cos(alpha));
    Jt(3, i) = k*l*(-dir*(th_sym)) + b*(-(1-0*th_sym));
end

eqXYZ = Jf * W;
eqXZ = eqXYZ(1) / eqXYZ(3);
eqYZ = eqXYZ(2) / eqXYZ(3);

eq1 = eqXZ == y(1);
eq2 = eqYZ == y(2);

eq3 = Th(1) + Th(3) == 0;
eq4 = Th(2) + Th(4) == 0;
% eq3 = Th(1) + Th(2) + Th(3) + Th(4) == 0;

eq = [eq1 eq2 eq3 eq4];
s = solve(eq, Th);
s.Th1
matlabFunction([s.Th1, s.Th2, s.Th3, s.Th4], 'file', 'system/resolve_th_W.m');


