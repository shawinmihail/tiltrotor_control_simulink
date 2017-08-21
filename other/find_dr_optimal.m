function  dr  = find_dr( x, dx, r )
xn = norm(x);
xdxn = norm(x+dx);
if xn >= r
    dr = -(xn - r)*x;
elseif xdxn >= r
    y = (x + dx)/xdxn;
    dr = y - x;
else
    dr = dx;
end

