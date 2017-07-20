x = simout.Data(:,1);
y = simout.Data(:,2);
z = simout.Data(:,3);
x1 = simout1.Data(:,1);
y1 = simout1.Data(:,2);
z1 = simout1.Data(:,3);

hold on

plot3(x, y, z, '--b')
axis([-20 20 -20 20 0 20])
grid on
% plot(x1, y1, 'r')
