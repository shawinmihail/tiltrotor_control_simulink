clear all
hold on
k=1;
for phi = 0 : pi/20 : 2*pi
    cphi = mod(phi-pi/4, pi/2);
    if cphi < pi/4
        k = 1/cos(cphi);
    else
        k = 1/sin(cphi);
    end
    plot(k*sin(phi), k*cos(phi), '*g')
    plot(sin(phi), cos(phi), '*r')
end
