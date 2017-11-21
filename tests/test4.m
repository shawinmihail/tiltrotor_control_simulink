clc
clear

f1 = 40*rand()-20;
f2 = 40*rand()-20;
f3 = 30 + 5*rand();
t1 = 3*rand()-1.5;
t2 = 1*rand()-0.5;
t3 = 1*rand()-0.5;
T3 = 6;

% f1 = 0;
% f2 = 0 ;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
% f3 = 30;
% t1 = 0;
% t2 = 0;
% t3 = 0;

grid on
hold on
mth1=666;
mth2=666;
mth3=666;
mth4=666;
max_v = 666;
min_v = -666;
for v = -20:0.5:20

    ths1 = Th1(f2,f3/2,v,0.5*t3-T3);
    th1 = ths1(3);
    ths3 = Th3(f2,f3/2,v,0.5*t3-T3);
    th3 = ths3(3);
%     ths2 = Th2(f1,f3/2,t1,0.5*t3+T3);
%     th2 = ths2(4);
%     ths4 = Th4(f1,f3/2,t1,0.5*t3+T3);
%     th4 = ths4(4);
%     c = pi/3;
%     if abs(th1) < c && abs(th2) < c && abs(th3) < c && abs(th4) < c
%         mth1=th1;
%         mth2=th2;
%         mth3=th3;
%         mth4=th4;
%         max_v = v;
%         if min_v < -100
%             min_v = v;
%         end
%     end
    scatter(v, th1, 'r')
    scatter(v, th3, 'g')
%     scatter(v, th2, 'b')
%     scatter(v, th4, 'm')
end
% mth1
% mth2
% mth3
% mth4

min_v
max_v