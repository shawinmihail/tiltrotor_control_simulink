clc
close all

%%
t = time.Data;

rr = r_real.Data;
rtg = r_target.Data;
rd = r_des.Data;
vr = v_real.Data;
qr = q_real.Data;
elr = eul_real.Data;

figure
hold on
grid on;
r = norm3d(rd - rr);
plot(t, r,'Color',[1 0.5 0],'LineWidth',w, 'linestyle', '-');
xlabel('t, s');
ylabel('\delta, m');
leg = legend('|\delta r|', 'Location','northeast');
set(leg,'FontSize',s);
set(gca,'FontSize',s)
legend boxoff

set(gcf, 'PaperUnits', 'p', 'PaperPosition', [0 0 height width]);
if save
    saveas(gcf, [pwd path 'norn_r_err.png']);
    saveas(gcf, [pwd path 'norn_r_err.fig']);
end


% 3d
figure 
hold on
grid on;

plot3(rr(:,1), rr(:,2), rr(:,3), 'Color',[0.1 1 0.5],'LineWidth',w, 'linestyle', '-');
plot3(rd(:,1), rd(:,2), rd(:,3), 'Color','k','LineWidth',w, 'linestyle', '--');
plot3(rtg(:,1), rtg(:,2), rtg(:,3), 'Color',[1 0.1 0.5],'LineWidth',w, 'linestyle', '-');

xl = xlabel('x, m');
yl = ylabel('y, m');
zl = zlabel('z, m');
leg = legend('r', 'r_{des}', 'r_{aim}', 'Location','southeast');
set(gca,'FontSize',s)
set(leg,'FontSize',s);
legend boxoff
zlim([-10 35])

if save
    saveas(gcf, [pwd path 'traj.png']);
    saveas(gcf, [pwd path 'traj.fig']);
end

r_to_tg = norm3d(rd - rtg);
figure
hold on
grid on;
plot(t, r_to_tg, 'Color',[0.1 1 0.5],'LineWidth',w, 'linestyle', '-');


