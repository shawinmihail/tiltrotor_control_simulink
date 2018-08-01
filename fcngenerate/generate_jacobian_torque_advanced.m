function jacobian_torque_advanced( rays, rot_dirs, k, b, l, Ipz, dt)
%%
W0 = sym('W0', [4 1]);
Th = sym('Th', [4 1]);
Jt = sym('Jt', [3 4]);
ft = sym('ft', [3 4]);
ex = [1;0;0];

%% Jt
for i = 1:4
    th = Th(i);
    w_ = sqrt(abs(W0(i)));
    dir = rot_dirs(i);
    ray = rays(3*i-2:3*i);
    cosAlpha = dot(ex, ray/norm(ray));
    alpha = acos(cosAlpha);
    if(ray(2) < 0)
        alpha = -alpha;
    end
    Jt(1, i) = k*l*(dir*cos(th)*sin(alpha)) + b*(-sin(th)*sin(alpha)) + (Ipz/(2*w_*dt))*(-sin(th)*sin(alpha));
    Jt(2, i) = k*l*(-dir*cos(th)*cos(alpha)) + b*(+sin(th)*cos(alpha)) +  (Ipz/(2*w_*dt))*(+sin(th)*cos(alpha));
    Jt(3, i) = k*l*(-dir*sin(th)) + b*(-cos(th)) + (Ipz/(2*w_*dt))*(-cos(th));
    
    ft(1, i) = (Ipz/(2*w_*dt))*(-sin(th)*sin(alpha));
    ft(2, i) = (Ipz/(2*w_*dt))*(+sin(th)*cos(alpha));
    ft(3, i) = (Ipz/(2*w_*dt))*(-cos(th));
end

matlabFunction(Jt, 'file', 'generated/Jt_fcn_advanced.m');
matlabFunction(ft, 'file', 'generated/ft_fcn_advanced.m');
end

