function  dr  = find_dr_1d( x, dx, r )
xn = norm(x);
xdxn = norm(x+dx);
if xn >= r
    dr = -(xn - r)*x;
elseif xdxn >= r
    dr = xdxn - r;
else
    dr = dx;
end

