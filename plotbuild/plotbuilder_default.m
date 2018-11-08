clc
close all

%%
t = time.Data;

r_r= r_real.Data;
r_d = r_des.Data;

eul_r = eul_real.Data;
eul_d = eul_des.Data;

r2 = [0.5 0 0];
g2  = [0 0.5 0];
b2 = [0 0.5 1];
gray = [0.7 0.7 0.7];
k = 'k';

lim_q = 0.5;

%% roll
figure
hold on
grid on;
plot(t, eul_r(:,3),'Color','r','LineWidth',w, 'linestyle', '-');
plot(t, eul_d(:,3),'Color',k,'LineWidth',w, 'linestyle', '--');
set(gca,'FontSize',s)

leg = legend('\alpha', '\alpha_0', 'Location','southeast');
set(leg,'FontSize',s);

legend boxoff

xl = xlabel('t, s');
yl = ylabel('\alpha, rad');

ylim([-lim_q lim_q])
set(gcf, 'PaperUnits', 'p', 'PaperPosition', [0 0 height width]);
if save
    saveas(gcf, [pwd path 'roll.png']);
    saveas(gcf, [pwd path 'roll.fig']);
end

%% pitch
figure
hold on
grid on;
plot(t, eul_r(:,2),'Color','g','LineWidth',w, 'linestyle', '-');
plot(t, eul_d(:,2),'Color',k,'LineWidth',w, 'linestyle', '--');
set(gca,'FontSize',s)

leg = legend('\beta', '\beta_0', 'Location','southeast');
set(leg,'FontSize',s);

legend boxoff

xl = xlabel('t, s');
yl = ylabel('\beta, rad');

ylim([-lim_q lim_q])
set(gcf, 'PaperUnits', 'p', 'PaperPosition', [0 0 height width]);
if save
    saveas(gcf, [pwd path 'pitch.png']);
    saveas(gcf, [pwd path 'pitch.fig']);
end

%% yaw
figure
hold on
grid on;
plot(t, eul_r(:,1),'Color','b','LineWidth',w, 'linestyle', '-');
plot(t, eul_d(:,1),'Color',k,'LineWidth',w, 'linestyle', '--');
set(gca,'FontSize',s)

leg = legend('\gamma', '\gamma_0', 'Location','southeast');
set(leg,'FontSize',s);

legend boxoff

xl = xlabel('t, s');
yl = ylabel('\gamma, rad');

ylim([-1 1])
set(gcf, 'PaperUnits', 'p', 'PaperPosition', [0 0 height width]);
if save
    saveas(gcf, [pwd path 'yaw.png']);
    saveas(gcf, [pwd path 'yaw.fig']);
end


%% x
figure
hold on
grid on;
plot(t, r_r(:,1),'Color','r','LineWidth',w, 'linestyle', '-');
plot(t, r_d(:,1),'Color',k,'LineWidth',w, 'linestyle', '--');
set(gca,'FontSize',s)

leg = legend('x', 'x_0', 'Location','southeast');
set(leg,'FontSize',s);

legend boxoff

xl = xlabel('t, s');
yl = ylabel('x, m');

set(gcf, 'PaperUnits', 'p', 'PaperPosition', [0 0 height width]);
if save
    saveas(gcf, [pwd path 'x.png']);
    saveas(gcf, [pwd path 'x.fig']);
end

%% y
figure
hold on
grid on;
plot(t, r_r(:,2),'Color','g','LineWidth',w, 'linestyle', '-');
plot(t, r_d(:,2),'Color',k,'LineWidth',w, 'linestyle', '--');
set(gca,'FontSize',s)

leg = legend('y', 'y_0', 'Location','southeast');
set(leg,'FontSize',s);

legend boxoff

xl = xlabel('t, s');
yl = ylabel('y, m');

set(gcf, 'PaperUnits', 'p', 'PaperPosition', [0 0 height width]);
if save
    saveas(gcf, [pwd path 'y.png']);
    saveas(gcf, [pwd path 'y.fig']);
end

%% z
figure
hold on
grid on;
plot(t, r_r(:,3),'Color','b','LineWidth',w, 'linestyle', '-');
plot(t, r_d(:,3),'Color',k,'LineWidth',w, 'linestyle', '--');
set(gca,'FontSize',s)

leg = legend('z', 'z_0', 'Location','southeast');
set(leg,'FontSize',s);

legend boxoff

xl = xlabel('t, s');
yl = ylabel('z, m');

set(gcf, 'PaperUnits', 'p', 'PaperPosition', [0 0 height width]);
if save
    saveas(gcf, [pwd path 'z.png']);
    saveas(gcf, [pwd path 'z.fig']);
end