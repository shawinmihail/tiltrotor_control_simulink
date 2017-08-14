w = 1;

figure
%% 1
subplot(3,1,1);
hold on
grid on;
plot(t, x1(:,1),'Color','r','LineWidth',w, 'linestyle', '-');
plot(t, x2(:,1),'Color','k','LineWidth',w, 'linestyle', '--');
xlabel('time, s');
ylabel(name);

%% 2
subplot(3,1,2);
hold on
grid on;
plot(t, x1(:,2),'Color','g','LineWidth',w, 'linestyle', '-');
plot(t, x2(:,2),'Color','k','LineWidth',w, 'linestyle', '--');
xlabel('time, s');
ylabel(name);

%% 3
subplot(3,1,3);
hold on
grid on;
plot(t, x1(:,3),'Color','b','LineWidth',w, 'linestyle', '-');
plot(t, x2(:,3),'Color','k','LineWidth',w, 'linestyle', '--');
xlabel('time, s');
ylabel(name);

