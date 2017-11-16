clear
clc
hold on

f = [10*rand(); 10*rand(); 30+10*rand()];
for th2 = -pi/3:pi/100:pi/3
    th1 = Th1(th2, f(1), f(2), f(3));
    plot(th1, th2, 'b*')
end

figure
th2 = pi/6;
th1 = Th1(th2, f(1), f(2), f(3));
