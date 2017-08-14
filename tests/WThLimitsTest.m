clear

wmin = 0.5*10^5;
wnorm = 1.5*10^5;

k=1;
for i = wmin+1e4 : wnorm*1.1
    x(k) = i;
    y(k) = calc_z(i, wmin, wnorm);
    k = k+1;
end
plot(x,y)