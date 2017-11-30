clear
clc
close all

g = 9.81;
m = 3.6;
tw = 1.6;
k = 1.13e-5;
b = 1.5e-6;


thLim = pi/3
wLim = m*g*tw / k / 4
t1Lim = 0.25;
t3Lim = 2.5;
T0 = m*g*b/2/k;
T = -T0 + t3Lim/2;
vert_acc_lim = 0.5;
f3Lim = m*(g + vert_acc_lim)/2
acc_h_lim = 5;
f2Lim0 = acc_h_lim*m;


hold on
grid on
f2Lim = 0;

step = 1;
for f2 = 0:step:f2Lim0
        w1 = W1(f2,f3Lim,t1Lim,T);
        w3 = W3(f2,f3Lim,t1Lim,T);
        th1 = Th1(f2,f3Lim,t1Lim,T);
        th3 = Th3(f2,f3Lim,t1Lim,T);
%         scatter3(f2, f3, w1(3), 'r');
%         scatter3(f2, f3, w3(3), 'g');
%         scatter3(f2, f3, th1(3), 'm');
%         scatter3(f2, f3, th3(3), 'c');
          scatter(f2, th1(3), 'r');
          scatter(f2, th3(3), 'g');
          if abs(th1(3)) > thLim || abs(w3(3)) > wLim
              f2Lim = f2 - step;
              break
          end
          f2Lim = f2Lim0;
end

% s0 = Th1(f2,f3,t1,2.64)
% s1 = Th1(f2,f3,t1,2.64-3) - s0
% s1 = s0 -Th1(f2,f3,t1,t3+3)