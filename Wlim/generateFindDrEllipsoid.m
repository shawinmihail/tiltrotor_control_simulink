syms a b c x y z dx dy dz k

eq1 = (x + k*dx)^2/a^2 + (y + k*dy)^2/b^2 + (z + k*dz)^2/c^2 == 1;
s1 = solve(eq1 , k);
% matlabFunction(s1, 'file', 'Wlim/ellipsoidBoundaryInside.m');

eq2 =   (k*x)^2/a^2 + (k*y)^2/b^2 + (k*z)^2/c^2 == 1;
s2 = solve(eq2 ,k);
% matlabFunction(s2, 'file', 'Wlim/ellipsoidBoundaryOutside.m');

eq3 = (k*x + dx)^2/a^2 + (k*y + dy)^2/b^2 + (k*z + dz)^2/c^2 == 1;
s3 = solve(eq3 , k);
matlabFunction(s3, 'file', 'Wlim/ellipsoidBoundary.m');