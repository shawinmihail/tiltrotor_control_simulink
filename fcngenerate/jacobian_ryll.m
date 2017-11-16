function jacobian_ryll( rays, rot_dirs, k, b, l)
%%
W = sym('W', [4 1]);
Th = sym('Th', [4 1]);
Jf = sym('Jf', [3 4]);
Jt = sym('Jt', [3 4]);
dJf_w = zeros(3, 4);
dJt_w = zeros(3, 4);
ex = [1;0;0];

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
    Jf(1, i) = k*(dir*sin(th_sym)*sin(alpha));
    Jf(2, i) = k*(-dir*sin(th_sym)*cos(alpha));
    Jf(3, i) = k*(dir*cos(th_sym));
end

%% dJf*w
for i = 1:4
    th_sym = Th(i);
    w_sym = W(i);
    dJf_w = dJf_w + diff(Jf, th_sym)*w_sym;
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
    Jt(1, i) = k*l*(dir*cos(th_sym)*sin(alpha)) + b*(-sin(th_sym)*sin(alpha));
    Jt(2, i) = k*l*(-dir*cos(th_sym)*cos(alpha)) + b*(+sin(th_sym)*cos(alpha));
    Jt(3, i) = k*l*(-dir*sin(th_sym)) + b*(-cos(th_sym));
end
%% dJt_w
for i = 1:4
    th_sym = Th(i);
    w_sym = W(i);
    dJt_w = dJt_w + diff(Jt, th_sym)*w_sym;
end

J = [Jf; Jt];
dJ_w = [dJf_w; dJt_w];

matlabFunction(J, 'file', 'system/J_fcn.m');
matlabFunction(dJ_w, 'file', 'system/dJ_w_fcn.m');
end

