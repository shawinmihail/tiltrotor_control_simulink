v0 = [1 0 0]';
v1 = [0 1 0]';

n_v1 = norm(v1);
n_v0 = norm(v0);

n_lim = 0.5;
if n_v1 < n_lim || n_v0 < n_lim
    v = v1;
else
    v0_n = v0 / n_v0;
    v1_n = v1 / n_v1;
    pin = cross(v1, v0);
    alpha = norm(cross(v1, v0));

    alpha_lim = pi/8;
    alpha_limited = min(max(-alpha_lim, alpha), alpha_lim);
    q_limited = [cos(alpha_limited/2); -pin * sin(alpha_limited/2)];
    
    v1 = quatRotate(q_limited, v0);
end

v1