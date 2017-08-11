clear

wmin = 100;
wmax = 200;
wavg = 0.5*(wmin+wmax);

k=1;
for i = wmin+10 : wmax-10
    x(k) = i;
    
    arg = (i-wmin)*pi/(wmax-wmin)-pi/2;
    a(k) = arg;
    y(k) = -tan(arg)^3;
    
    k = k+1;
end
plot(x,y)