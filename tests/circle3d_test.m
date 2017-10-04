k = 0;
for t = -pi:pi/10:pi
    k = k+1;
    r = cos(t)*[0;0;1] + sin(t)*[1;-1;0];
    x(k) = r(1);
    y(k) = r(2);
    z(k) = r(3);
end

plot3(x, y, z)