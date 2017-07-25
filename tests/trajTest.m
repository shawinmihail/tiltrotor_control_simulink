close all
clear all

T = 0:0.1:27;
radius = 1.5;
period = 9;
for i=1:numel(T)
    t = T(i);
if t < 0.5*period
    phase = -pi;
    arg = t*2*pi/period + phase;
    r0 = [0; 0; 0];
    x(i) = radius*cos(arg) + r0(1);
    y(i) = radius*sin(arg) + r0(2);
elseif t < period
    phase = 0;
    arg = -t*2*pi/period + phase;
    r0 = [2*radius; 0; 0];
    x(i) = radius*cos(arg) + r0(1);
    y(i) = radius*sin(arg) + r0(2);
elseif t < 2*period
    phase = -pi;
    arg = t*2*pi/period + phase;
    r0 = [4*radius; 0; 0];
    x(i) = radius*cos(arg) + r0(1);
    y(i) = radius*sin(arg) + r0(2);
elseif t < 2.5*period
    phase = 0;
    arg = -t*2*pi/period + phase;
    r0 = [2*radius; 0; 0];
    x(i) = radius*cos(arg) + r0(1);
    y(i) = radius*sin(arg) + r0(2);
elseif t < 3*period
    phase = -pi;
    arg = t*2*pi/period + phase;
    r0 = [0; 0; 0];
    x(i) = radius*cos(arg) + r0(1);
    y(i) = radius*sin(arg) + r0(2);
end
end
plot(x, y)