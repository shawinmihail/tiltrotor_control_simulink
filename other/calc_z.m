function [ y ] = calc_z( x, min, norm )

ktan = 1e2;
ksq =  1e0;

if x < norm
    arg = 0.5*pi*(x-min)/(norm-min);
    arg = arg - pi/2;
    y = -ktan*tan(arg)^3;
else
    arg = x - norm;
    y = -ksq*arg;
end
    
end

