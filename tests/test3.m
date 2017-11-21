clc
rm = rM.Data;
rf = rF.Data;


f1 = 20*rand()-10;
f3 = 20 + 10*rand();
t1 = rand()-0.5;
t3= rand()-0.5;
hold on
grid on
for i = 1:numel(rf)
    th1 = Th1(f2,f3,t2,t3);
    th2 = Th2(f1,f3,t1,t3);
    th3 = Th3(f2,f3,t2,t3);
    th4 = Th4(f1,f3,t1,t3);
    
    w1 = W1(f2,f3,t2,t3);
    w2 = W2(f1,f3,t1,t3);
    w3 = W3(f2,f3,t2,t3);
    w4 = W4(f1,f3,t1,t3);

%     scatter3(f3, t3, th1(3));
    scatter([f3 f3 f3 f3], th1, 'r')
    scatter([f3 f3 f3 f3], th2, 'g')
    scatter([f3 f3 f3 f3], th3, 'b')
    scatter([f3 f3 f3 f3], th4, 'm')
end