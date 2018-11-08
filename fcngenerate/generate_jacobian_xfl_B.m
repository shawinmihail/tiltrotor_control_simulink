function generate_jacobian_xfl_B( rays, rot_dirs, k, b, l)
%%
W = sym('W', [4 1]);
Th = sym('Th', [4 1]);
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

matlabFunction(J, 'file', 'generated/xfl_J_B.m');
end

