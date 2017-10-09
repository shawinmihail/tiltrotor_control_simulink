function  dr  = find_dr( x, dx, r )
xn = norm(x);
xdxn = norm(x+dx);
if xn >= r
    dr = -(xn - r)*x;
elseif xdxn >= r
    s = calc_dr( x, dx, r );
    m = max(s);
    assert(m > 0);
    assert(m < 1);
    assert(isreal(m))
    dr = m*dx;
else
    dr = dx;
end

