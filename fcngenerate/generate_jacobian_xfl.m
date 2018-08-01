function generate_jacobian_xfl( k, b, l, rot_dirs, rays )

W = sym('W', [4 1]);
Th = sym('Th', [4 1]);
F = zeros(6,1);
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

matlabFunction(J,'file', 'generated/xflJ');

end

