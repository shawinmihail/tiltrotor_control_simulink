clear
clc
% rm = rM.Data;
% rf = rF.Data;


f1 = 20*rand()-10;
f2 = 20*rand()-10;
f3 = 20 + 10*rand();
t1 = rand()-0.5;
t2 = rand()-0.5;
t3= 5*rand()-2.5;

% f1 = 9;
% f2 = -5;
% f3 = 40;
% t1 = 0.09;
% t2 = 0.03;
% t3= 0;

hold on
grid on
HalfF3Lim = 20;
for f3 = 0*HalfF3Lim:1:2*HalfF3Lim
    for T3 = 6:1:6
    
    tI = 0.5*t3 - T3;
    tII =  0.5*t3 + T3;
    fI = f3;
    fII = 2*HalfF3Lim-f3;
        
    th1 = Th1(f1,fI,t2,tI);
    th2 = Th2(f1,fII,t1,tII);
    th3 = Th3(f1,fI,t2,tI);
    th4 = Th4(f1,fII,t1,tII);
    
    w1 = W1(f2,fI,t2,tI);
    w2 = W2(f2,fII,t1,tII);
    w3 = W3(f2,fI,t2,tI);
    w4 = W4(f2,fII,t1,tII);
    zlim([-pi/3 pi/3])

%     scatter3(f3, t3, th1(3));

%     scatter(T3, th1(3), 'r')
%     scatter(T3, th2(4), 'g')
%     scatter(T3, th3(3), 'b')
%     scatter(T3, th4(4), 'm')
%     scatter(T3, abs(th1(3))+abs(th2(4))+abs(th3(3))+abs(th4(4)), 'k')
    
    scatter(f3, th1(3), 'r')
    scatter(f3, th2(4), 'g')
    scatter(f3, th3(3), 'b')
    scatter(f3, th4(4), 'm')

%     scatter3(f3,T3, th1(3), 'r')
%     scatter3(f3,T3, th2(4), 'g')
%     scatter3(f3,T3, th3(3), 'b')
%     scatter3(f3,T3, th4(4), 'm')
    end
end