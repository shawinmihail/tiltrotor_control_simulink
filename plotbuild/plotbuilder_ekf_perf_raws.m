clc
close all

%%
t = time.Data;

r_r= r_real.Data;
r_m= r_mes.Data - r_r;
r_d = r_des.Data;
r_u = r_filtered_ukf.Data - r_r;

eul_r = eul_real.Data;
eul_d = eul_des.Data;
eul_m = eul_mes.Data - eul_r;
eul_u = eul_filtered_ukf.Data - eul_r;

omega_r = omega_real.Data;
omega_m = omega_mes.Data;

vdot_r = vdot_real.Data;
vdot_m = rddot_mes.Data;

%%
r2 = [0.5 0 0];
g2  = [0 0.5 0];
b2 = [0 0.5 1];
gray = [0.7 0.7 0.7];
lim_q = 0.05;
lim_r = 5;

%% roll
subplot(3, 2, 1)
hold on
grid on;
n = 3;
plot(t, eul_m(:,n),'Color',gray,'LineWidth',w+3, 'linestyle', '-');
plot(t, eul_u(:,n),'Color','r','LineWidth',w, 'linestyle', ':');
set(gca,'FontSize',s)
leg = legend('\delta\alpha_{mes}', '\delta\alpha_{ukf}', 'Location','southeast');
set(leg,'FontSize',s+dsleg);
xlabel('t, s');
ylabel('\delta_{mes}, rad');
ylim([-lim_q lim_q])

%% ptch
subplot(3, 2, 3)
hold on
grid on;
n = 2;
plot(t, eul_m(:,n),'Color',gray,'LineWidth',w+3, 'linestyle', '-');
plot(t, eul_u(:,n),'Color','g','LineWidth',w, 'linestyle', ':');
set(gca,'FontSize',s)
leg = legend('\delta\beta_{mes}', '\delta\beta_{ukf}', 'Location','southeast');
set(leg,'FontSize',s+dsleg);
xlabel('t, s');
ylabel('\delta_{mes}, rad');
ylim([-lim_q lim_q])


%% yaw
subplot(3, 2, 5)
hold on
grid on;
n = 1;
plot(t, eul_m(:,n),'Color',gray,'LineWidth',w+3, 'linestyle', '-');
plot(t, eul_u(:,n),'Color','b','LineWidth',w, 'linestyle', ':');
set(gca,'FontSize',s)
leg = legend('\delta\gamma_{mes}', '\delta\gamma_{ukf}', 'Location','southeast');
set(leg,'FontSize',s+dsleg);
xlabel('t, s');
ylabel('\delta_{mes}, rad');
ylim(2*[-lim_q lim_q])


%% x
subplot(3, 2, 2)
hold on
grid on;
n = 1;
plot(t, r_m(:,n),'Color',gray,'LineWidth',w+3, 'linestyle', '-');
plot(t, r_u(:,n),'Color','r','LineWidth',w, 'linestyle', ':');
set(gca,'FontSize',s)
leg = legend('\delta x_{mes}', '\delta x_{ukf}', 'Location','southeast');
set(leg,'FontSize',s+dsleg);
xlabel('t, s');
ylabel('\delta, m');
ylim([-lim_r lim_r])


%% y
subplot(3, 2, 4)
hold on
grid on;
n = 2;
plot(t, r_m(:,n),'Color',gray,'LineWidth',w+3, 'linestyle', '-');
plot(t, r_u(:,n),'Color','g','LineWidth',w, 'linestyle', ':');
set(gca,'FontSize',s)
leg = legend('\delta y_{mes}', '\delta y_{ukf}', 'Location','southeast');
set(leg,'FontSize',s+dsleg);
xlabel('t, s');
ylabel('\delta, m');
ylim([-lim_r lim_r])


%% z
subplot(3, 2, 6)
hold on
grid on;
n = 3;
plot(t, r_m(:,n),'Color',gray,'LineWidth',w+3, 'linestyle', '-');
plot(t, r_u(:,n),'Color','b','LineWidth',w, 'linestyle', ':');
set(gca,'FontSize',s)
leg = legend('\delta z_{mes}', '\delta z_{ukf}', 'Location','southeast');
set(leg,'FontSize',s+dsleg);
xlabel('t, s');
ylabel('\delta, m');
ylim(2*[-lim_r lim_r])

% save
set(gcf, 'PaperUnits', 'p', 'PaperPosition', [0 0 height width]);
if save
    saveas(gcf, [pwd path 'ukf_perf_raws.png']);
    saveas(gcf, [pwd path 'ukf_perf_raws.fig']);
end
