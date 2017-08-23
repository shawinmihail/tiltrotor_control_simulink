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
    ks = ellipsoidBoundaryOutside(a, b, c, xn, yn, zn);
    k = max(ks);
    dr = vn*(k-1) + dv;
elseif res2 >= 1 % v inside; v+dv outside
    ks = ellipsoidBoundaryInside(a, b, c, dx, dy, dz, x, y, z);
    k = max(ks);
    dr = k*dv;
else %  v+dv inside
    ks = ellipsoidBoundaryOutside(a, b, c, xn, yn, zn);
    k = max(ks);
    p = 1/k;
    koeff = 0.9;
    dr = -koeff*p*v + dv;
%     dr = dv;
end