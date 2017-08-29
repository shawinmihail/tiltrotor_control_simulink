function  dr  = find_dr_ellipsoid(v, dv, a, b, c)

x = v(1);
y = v(2);
z = v(3);
dx = dv(1);
dy = dv(2);
dz = dv(3);

vn = v + dv;
xn = vn(1);
yn = vn(2);
zn = vn(3);

res1 = (x)^2/a^2 + (y)^2/b^2 + (z)^2/c^2;
res2 = (x + dx)^2/a^2 + (y + dy)^2/b^2 + (z + dz)^2/c^2;

if res1 >= 1 % v outside ellips
    ks = ellipsoidBoundary(a, b, c, dx, dy, dz, x, y, z);
    k = max(ks);
    if k < 1
        dr = -1*v*(1-k) + dv;
    else
        dr = dv;
    end
elseif res2 >= 1 % v inside; v+dv outside
    ks = ellipsoidBoundary(a, b, c, dx, dy, dz, x, y, z);
    k = max(ks);
    if k < 1
        dr = -1*v*(1-k) + dv;
    else
        dr = dv;
    end
else %  v+dv inside
    dr = dv;
end