Th = [0;0;0;0]*pi/2;
rays = qc.rays;
ex = [1;0;0];
ez = [0;0;1];
q_PB = zeros(4, 4);
for i = 1:4
    ray = rays(3*i-2:3*i);
    cosAlpha = dot(ex, ray/norm(ray));
    alpha = acos(cosAlpha);
    if(ray(2) < 0)
        alpha = -alpha;
    end
    alpha = - alpha;
    th = - Th(i);
    qth = [cos(th/2);ex*sin(th/2)];
    qa = [cos(alpha/2);ez*sin(alpha/2)];
    q = quatMultiply(qth, qa);
    q_PB(:,i) = q;
end