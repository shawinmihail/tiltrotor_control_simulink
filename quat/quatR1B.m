function [ qR1B ] = quatR1B()
alpha = pi/4;
pin = [0;0;1];
qR1B = [cos(alpha/2);pin*sin(alpha/2)];
end

