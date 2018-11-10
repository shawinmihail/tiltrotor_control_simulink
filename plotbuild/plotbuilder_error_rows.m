clc
close all

%%
t = time.Data;

r_r= r_real.Data;
r_d = r_des.Data;

eul_r = eul_real.Data;
eul_d = eul_des.Data;


eul_error = wrapToPi(eul_d - eul_r);
r_error = r_d - r_r;    


%%
xlshift = [0.5, 0.2];
ylshift = [0.065, 0.5];

r2 = [0.5 0 0];
g2  = [0 0.5 0];
b2 = [0 0.5 1];
gray = [0.7 0.7 0.7];

EULLIM = 0.2;

%% roll error
subplot(3, 2, 1)
hold on
grid on;
plot(t, eul_error(:,3),'Color','r','LineWidth',w, 'linestyle', '-');
set(gca,'FontSize',s)
leg = legend('\delta_{\alpha}', 'Location','southeast');
set(leg,'FontSize',s+dsleg);
xlabel('t, s');
ylabel('\delta, rad');
ylim([-0.1 0.1])
xlim([0 60])

%% pitch error
subplot(3, 2, 3)
hold on
grid on;
plot(t, eul_error(:,2),'Color','g','LineWidth',w, 'linestyle', '-');
set(gca,'FontSize',s)
leg = legend('\delta_{\beta}', 'Location','southeast');
set(leg,'FontSize',s+dsleg);
xlabel('t, s');
ylabel('\delta, rad');
ylim([-0.1 0.1])
xlim([0 60])

%% yaw error
subplot(3, 2, 5)
hold on
grid on;
plot(t, eul_error(:,1),'Color','b','LineWidth',w, 'linestyle', '-');
set(gca,'FontSize',s)
leg = legend('\delta_{\gamma}', 'Location','southeast');
set(leg,'FontSize',s+dsleg);
xl = xlabel('t, s');
yl = ylabel('\delta, rad');
ylim([-0.05 0.05])
xlim([0 60])

RLIM = 1;
%% x
subplot(3, 2, 2)
hold on
grid on;
plot(t, r_error(:,1),'Color','r','LineWidth',w, 'linestyle', '-');
set(gca,'FontSize',s)
leg = legend('\delta_{x}', 'Location','southeast');
set(leg,'FontSize',s+dsleg);
xlabel('t, s');
ylabel('x, m');
ylim([-RLIM RLIM])
xlim([0 60])

%% y
subplot(3, 2, 4)
hold on
grid on;
plot(t, r_error(:,2),'Color','g','LineWidth',w, 'linestyle', '-');
set(gca,'FontSize',s)
leg = legend('\delta_{y}', 'Location','southeast');
set(leg,'FontSize',s+dsleg);
xlabel('t, s');
ylabel('y, m');
ylim([-RLIM RLIM])
xlim([0 60])

%% z
subplot(3, 2, 6)
hold on
grid on;
plot(t, r_error(:,3),'Color','b','LineWidth',w, 'linestyle', '-');
set(gca,'FontSize',s)
leg = legend('\delta_{z}', 'Location','southeast');
set(leg,'FontSize',s+dsleg);
xlabel('t, s');
ylabel('z, m');
ylim([-RLIM RLIM])
xlim([0 60])

%% save
set(gcf, 'PaperUnits', 'p', 'PaperPosition', [0 0 height width]);
if save
    saveas(gcf, [pwd path 'errors_rows.png']);
    saveas(gcf, [pwd path 'errors_rows.fig']);
end
