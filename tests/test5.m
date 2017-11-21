clc
clear

f1 = 40*rand()-20
f2 = 40*rand()-20
f3 = 30 + 5*rand()
t1 = 3*rand()-1.5
t2 = 3*rand()-1.5
t3 = 5*rand()-2.5;

T3 = 8;
t3 = 0.5*t3 - T3 

k = 1.13e-5;
b = 3e-6;
l = 0.25;

Y = (b*f2 + k*t2 - (b^2*f2^2 + b^2*f3^2 + 2*b*f2*k*t2 + 2*b*f3*k*t3 + f2^2*k^2*l^2 + 2*f2*k^2*l*t3 + f3^2*k^2*l^2 - 2*f3*k^2*l*t2 + k^2*t2^2 + k^2*t3^2)^(1/2) - f3*k*l)/(b*f3 + k*t3 + f2*k*l)
Y = (b*f2 + k*t2 - f3*k*l - sqrt((f2^2+f3^2)*(b^2+k^2*l^2) + (t2^2 + t3^2)*k^2 + 2*f2*(b*k*t2 + k^2*l*t3)+ 2*f3*(b*k*t3 - k^2*l*t2)))/(b*f3 + k*t3 + f2*k*l)
return
% a1 = b*f2
% a2 = k*t2
% a3 = sqrt(b^2 *f2^2  + b^2*f3^2  + 2*b*f2*k*t2 + 2*b*f3*k*t3 + f2^2*k^2*l^2  + 2*f2*k^2*l*t3 + f3^2*k^2*l^2  - 2*f3*k^2*l*t2 + k^2*t2^2  + k^2*t3^2)
% a4 = f3* k* l
% 
% b1 = b *f3
% b2 = k *t3 
% b3 = f2 *k *l
% 
% c1 = b^2 *f2^2
% c2 = b^2*f3^2
% c3 = 2*b*f2*k*t2
% c4 = 2*b*f3*k*t3
% c5 = f2^2*k^2*l^2
% c6 = 2*f2*k^2*l*t3
% c7 = f3^2*k^2*l^2 
% c8 = 2*f3*k^2*l*t2
% c9 = k^2*t2^2
% c10 = k^2*t3^2

simpleY = (b*f2 - f3*k*l - (b^2*f2^2 + b^2*f3^2 + 2*b*f3*k*t3 + f2^2*k^2*l^2 + 2*f2*k^2*l*t3 + f3^2*k^2*l^2 + k^2*t3^2)^(1/2))/(b*f3 + k*t3 + f2*k*l);
simpleY = (b*f2 - f3*k*l - (f2^2*(b^2+ k^2*l^2) + f3^2+(b^2 + k^2*l^2) + 2*b*f3*k*t3  + 2*f2*k^2*l*t3  + k^2*t3^2)^(1/2))/(b*f3 + k*t3 + f2*k*l);

