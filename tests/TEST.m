clc
clear

k = 1.1300e-05;
b = 1.5000e-06;
l = 0.2500;
W_lim = 1.3022e+06;
Th_lim = 1.0472;
hforce = 2;
vforce = 2;
htorque = 0.05;
vtorque = 0.05;
d = [hforce hforce vforce htorque htorque vtorque]; % suppose v(1) = v(2), v(4) = v(5)
FC = 19.6200; % thrust from all of motors in hover
a_range = [13.5 13.8];
step = 0.01;

max = -1;
T0max = -1;
for T0 = 2.5:0.5:2.7
    F0 = 0;
    limits = find_limits_rectangle_MPMP(T0, F0, FC, k, b, l, W_lim,  Th_lim, d, a_range, step)
    res = norm(limits);
    if max < res
        max = res;
        T0max = T0;
    end 
end
max
T0max

% max = -1;
% F0max = -1;
% limits_max = zeros(1,6)
% for F0 = -10:1:10
%     T0 = 2.6;
%     limits = find_limits_rectangle_MPMP(T0, F0, FC, k, b, l, W_lim,  Th_lim, d, a_range, step)
%     res = norm(limits);
%     if max < res
%         max = res;
%         F0max = F0;
%         limits_max = limits
%     end 
% end
% max
% F0max
% limits_max