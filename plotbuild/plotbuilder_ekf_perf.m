clc
close all

path = '\img\';
save = 0;

%%
t = time.Data;

r_r= r_real.Data;
r_m= r_mes.Data;
r_f = r_filtered.Data;
r_d = r_des.Data;
r_u = r_filtered_ukf.Data;

eul_r = eul_real.Data;
eul_d = eul_des.Data;
eul_m = eul_mes.Data;
eul_f = eul_filtered.Data;
eul_u = eul_filtered_ukf.Data;

omega_r = omega_real.Data;
omega_m = omega_mes.Data;
% eul_f = eul_filtered.Data;
% eul_u = eul_filtered_ukf.Data;

vdot_r = vdot_real.Data;
vdot_m = rddot_mes.Data;
% eul_f = eul_filtered.Data;
% eul_u = eul_filtered_ukf.Data;

%%
w = 2;
s = 36;
r2 = [0.5 0 0];
g2  = [0 0.5 0];
b2 = [0 0.5 1];
gray = [0.7 0.7 0.7];


% %%%
% figure
% hold on
% grid on
% color = [0.7789    0.8669    0.4068]
% plot(t, vdot_m(:,1) - vdot_r(:,1),'Color',color,'LineWidth',w+2, 'linestyle', ':');
% 
% set(gca,'FontSize',s)
% leg = legend('a_x noisy', 'Location','southeast');
% set(leg,'FontSize',s);
% xlabel('time, s');
% ylabel('error, m/s^2');
% ylim([-10 10])
% 
% figure
% hold on
% grid on
% color = [0.5789    0.8669    0.4068]
% plot(t, r_m(:,1) - r_r(:,1),'Color',color,'LineWidth',w+2, 'linestyle', ':');
% 
% set(gca,'FontSize',s)
% leg = legend('r_x noisy', 'Location','southeast');
% set(leg,'FontSize',s);
% xlabel('time, s');
% ylabel('error, m');
% ylim([-11 11])
% 
% 
% figure
% hold on
% grid on
% color = [0.8789    0.4669    0.4068]
% plot(t, eul_m(:,3)*180/pi - eul_r(:,3)*180/pi,'Color',color,'LineWidth',w+2, 'linestyle', ':');
% 
% set(gca,'FontSize',s)
% leg = legend('pitch noisy', 'Location','southeast');
% set(leg,'FontSize',s);
% xlabel('time, s');
% ylabel('error, deg');
% ylim([-11 11])
% 
% 
% figure
% hold on
% grid on
% color = [0.4789    0.4669    0.8068]
% plot(t, omega_m(:,3) - omega_r(:,3),'Color',color,'LineWidth',w+2, 'linestyle', ':');
% 
% set(gca,'FontSize',s)
% leg = legend('\Omega_x noisy', 'Location','southeast');
% set(leg,'FontSize',s);
% xlabel('time, s');
% ylabel('error, deg/s');
% ylim([-0.8 0.8])

%% roll
subplot(1,1,1);
hold on
grid on;
n = 3;
plot(t, eul_m(:,n),'Color',gray,'LineWidth',w+3, 'linestyle', '-');
plot(t, eul_r(:,n),'Color','r','LineWidth',w, 'linestyle', '-');
% plot(t, eul_d(:,1),'Color',b2,'LineWidth',w-1, 'linestyle', '--');
plot(t, eul_u(:,n),'Color','g','LineWidth',w, 'linestyle', ':');
plot(t, eul_f(:,n),'Color','b','LineWidth',w, 'linestyle', ':');

set(gca,'FontSize',s)
leg = legend('roll noisy', 'roll clean', 'roll UKF', 'roll EKF', 'Location','southeast');
set(leg,'FontSize',s);
xlabel('time, s');
ylabel('angle, rad');

rollStdDevEkf = sqrt(mean((eul_r(:,n) - eul_f(:,n)).^2))
rollStdDevUkf = sqrt(mean((eul_r(:,n) - eul_u(:,n)).^2))

% ylim([-pi-0.1, pi+0.1]);

% %% pitch
% subplot(3,1,2);
% hold on
% grid on;
% n = 2;
% plot(t, eul_m(:,n),'Color',gray,'LineWidth',w+3, 'linestyle', '-');
% plot(t, eul_r(:,n),'Color','r','LineWidth',w, 'linestyle', '-');
% % plot(t, eul_d(:,1),'Color',b2,'LineWidth',w-1, 'linestyle', '--');
% plot(t, eul_u(:,n),'Color','g','LineWidth',w, 'linestyle', ':');
% plot(t, eul_f(:,n),'Color','b','LineWidth',w, 'linestyle', ':');
% 
% set(gca,'FontSize',s)
% leg = legend('pitch noisy', 'pitch clean', 'pitch UKF', 'pitch EKF', 'Location','southeast');
% set(leg,'FontSize',s);
% xlabel('time, s');
% ylabel('angle, rad');
% % ylim([-pi-0.1, pi+0.1]);
% 
% %% yaw
% subplot(3,1,3);
% hold on
% grid on;
% n = 1;
% plot(t, eul_m(:,n),'Color',gray,'LineWidth',w+3, 'linestyle', '-');
% plot(t, eul_r(:,n),'Color','r','LineWidth',w, 'linestyle', '-');
% % plot(t, eul_d(:,1),'Color',b2,'LineWidth',w-1, 'linestyle', '--');
% plot(t, eul_u(:,n),'Color','g','LineWidth',w, 'linestyle', ':');
% plot(t, eul_f(:,n),'Color','b','LineWidth',w, 'linestyle', ':');
% 
% set(gca,'FontSize',s)
% leg = legend('yaw noisy', 'yaw clean', 'yaw UKF', 'yaw EKF', 'Location','southeast');
% set(leg,'FontSize',s);
% xlabel('time, s');
% ylabel('angle, rad');
% % ylim([-pi-0.1, pi+0.1]);
% 
% set(gcf, 'PaperUnits', 'centimeters', 'PaperPosition', [0 0 60 20]);
% if save
%     saveas(gcf, [pwd path 'eul.png']);
% end

figure
%% x
subplot(1,1,1);
hold on
grid on;
n = 1;
plot(t, r_m(:,n),'Color',gray,'LineWidth',w+3, 'linestyle', '-');
plot(t, r_r(:,n),'Color','r','LineWidth',w, 'linestyle', '-');
% plot(t, eul_d(:,1),'Color',b2,'LineWidth',w-1, 'linestyle', '--');
plot(t, r_u(:,n),'Color','g','LineWidth',w, 'linestyle', ':');
plot(t, r_f(:,n),'Color','b','LineWidth',w, 'linestyle', ':');

set(gca,'FontSize',s)
leg = legend('x noisy', 'x clean', 'x UKF', 'x EKF', 'Location','southeast');
set(leg,'FontSize',s);
xlabel('time, s');
ylabel('x, m');

xStdDevEkf = sqrt(mean((r_r(:,n) - r_f(:,n)).^2))
xStdDevUkf = sqrt(mean((r_r(:,n) - r_u(:,n)).^2))
% ylim([-pi-0.1, pi+0.1]);
return
%% y
subplot(3,1,2);
hold on
grid on;
n = 2;
plot(t, r_m(:,n),'Color',gray,'LineWidth',w+3, 'linestyle', '-');
plot(t, r_r(:,n),'Color','r','LineWidth',w, 'linestyle', '-');
% plot(t, eul_d(:,1),'Color',b2,'LineWidth',w-1, 'linestyle', '--');
plot(t, r_u(:,n),'Color','g','LineWidth',w, 'linestyle', ':');
plot(t, r_f(:,n),'Color','b','LineWidth',w, 'linestyle', ':');

set(gca,'FontSize',s)
leg = legend('y noisy', 'y clean', 'y UKF', 'y EKF', 'Location','southeast');
set(leg,'FontSize',s);
xlabel('time, s');
ylabel('y, m');
% ylim([-1, 1]);

%% z
subplot(3,1,3);
hold on
grid on;
n = 3;
plot(t, r_m(:,n),'Color',gray,'LineWidth',w+3, 'linestyle', '-');
plot(t, r_r(:,n),'Color','r','LineWidth',w, 'linestyle', '-');
% plot(t, eul_d(:,1),'Color',b2,'LineWidth',w-1, 'linestyle', '--');
plot(t, r_u(:,n),'Color','g','LineWidth',w, 'linestyle', ':');
plot(t, r_f(:,n),'Color','b','LineWidth',w, 'linestyle', ':');

set(gca,'FontSize',s)
leg = legend('z noisy', 'z clean', 'z UKF', 'z EKF', 'Location','southeast');
set(leg,'FontSize',s);
xlabel('time, s');
ylabel('z, m');
% ylim([-1, 1]);
