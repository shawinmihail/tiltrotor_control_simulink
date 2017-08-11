function [ y ] = lim_tg( x, min, max )

d = 0.01;
arg = (x-min)*pi/(max-min);
if arg < d
    arg = d;
elseif arg > pi-d
    arg = pi-d;
end
arg = arg - pi/2;
y = -1e0*tan(arg)^3;

end

