clc

%%
t = time.Data;
r_r=r_real.Data;
eul_r = eul_real.Data;
r_d=r_des.Data;
eul_d = eul_des.Data;

%%
w = 2;
r2 = [0.5 0 0];
g2  = [0 0.5 0];
b2 = [0 0.5 1];


%% roll
subplot(3,1,1);
hold on
grid on;
plot(t, eul_r(:,1),'Color','r','LineWidth',w, 'linestyle', '-');
plot(t, eul_d(:,1),'Color',r2,'LineWidth',w, 'linestyle', '--');
set(gca,'FontSize',18)
leg = legend('roll real', 'roll desired', 'Location','southeast');
set(leg,'FontSize',18);
xlabel('time, s');
ylabel('angle, rad');

%% pitch
subplot(3,1,2);
hold on
grid on;
plot(t, eul_r(:,2),'Color','g','LineWidth',w, 'linestyle', '-');
plot(t, eul_d(:,2),'Color',g2,'LineWidth',w, 'linestyle', '--');
set(gca,'FontSize',18)
leg = legend('pitch real', 'pitch desired', 'Location','southeast');
set(leg,'FontSize',18);
xlabel('time, s');
ylabel('angle, rad');

%% yaw
subplot(3,1,3);
hold on
grid on;
plot(t, eul_r(:,3),'Color','b','LineWidth',w, 'linestyle', '-');
plot(t, eul_d(:,3),'Color',b2,'LineWidth',w, 'linestyle', '--');
set(gca,'FontSize',18)
leg = legend('yaw real', 'yaw desired', 'Location','southeast');
set(leg,'FontSize',18);
xlabel('time, s');
ylabel('angle, rad');

figure
%% trajectory
subplot(2,1,1);
hold on
grid on;
plot(r_r(:, 1), r_r(:,2),'Color','g','LineWidth',w, 'linestyle', '-');
plot(r_d(:, 1), r_d(:,2),'Color',g2,'LineWidth',w, 'linestyle', '--');
set(gca,'FontSize',18)
leg = legend('y(x) real', 'y(x) desired', 'Location','southeast');
set(leg,'FontSize',18);
xlabel('x, m');
ylabel('y, m');

%% alt
subplot(2,1,2);
hold on
grid on;
plot(t, r_r(:,3),'Color','b','LineWidth',w, 'linestyle', '-');
plot(t, r_d(:,3),'Color',b2,'LineWidth',w, 'linestyle', '--');
set(gca,'FontSize',18)
leg = legend('alt real', 'alt desired', 'Location','southeast');
set(leg,'FontSize',18);
xlabel('time, s');
ylabel('alt, m');
