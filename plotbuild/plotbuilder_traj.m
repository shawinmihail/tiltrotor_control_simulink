clc
close all

path = '\img\';

save = 1;
save_size = [];
s = 8;

%%
t = time.Data;

rr = r_real.Data;
% rf = r_filtered.Data;
rd = r_des.Data;
vr = v_real.Data;
% vf = v_filtered.Data;
% vdr = vdot_real.Data;
% vdf = vdot_filtered.Data;

elr = eul_real.Data;
% elf = eul_filtered.Data;
% eld = eul_des.Data;
% omr = omega_real.Data
% omf = omega_filtered.Data;

w = 1;
figure
xlabel('x'); ylabel('y'); zlabel('z'); 
hold on

%% 1
subplot(1,1,1);
hold on
grid on;
plot(rr(:,1), rr(:,2),'Color','g','LineWidth',w, 'linestyle', '-');
plot(rd(:,1), rd(:,2),'Color','k','LineWidth',w, 'linestyle', '--');
xl = xlabel('x, m');
yl = ylabel('y, m');
set(xl, 'Units', 'Normalized', 'Position', [0.5, 0.1, 0]);
set(yl, 'Units', 'Normalized', 'Position', [0.1, 0.5, 0]);
% xlim([0 14])
% ylim([-1.4 1.6])

%% wals
% wallX = [0;0];
% wallY = [-1;0.5];
% e = [1;1];
% plot(wallX + (2+5/4)*e, wallY ,'Color','r','LineWidth',w, 'linestyle', '-');
% plot(wallX + (2+5/4+1*5/2)*e, -wallY ,'Color','r','LineWidth',w, 'linestyle', '-');
% plot(wallX + (2+5/4+2*5/2)*e, wallY ,'Color','r','LineWidth',w, 'linestyle', '-');
% plot(wallX + (2+5/4+3*5/2)*e, -wallY ,'Color','r','LineWidth',w, 'linestyle', '-');
% plot(wallX + (2+5/4+4*5/2)*e, wallY ,'Color','r','LineWidth',w, 'linestyle', '-');

%% leg
set(gca,'FontSize',s)
[leg, hobj1] = legend('y(x) real', 'y(x) desired', 'Location','southeast');
set(leg,'FontSize',s);
rect = [0.66, 0.85, .1, .1];
set(leg, 'Position', rect)
legend boxoff

% 2
% subplot(2,1,2);
% hold on
% grid on;
% r = norm3d(rd - rr);
% plot(t, r,'Color','b','LineWidth',w, 'linestyle', '-');
% xlabel('time, s');
% ylabel('error, m');
% leg = legend('error', 'Location','southeast');
% set(leg,'FontSize',s);
% % xlim([0 8])
% % ylim([-1 1])

%% 3d
% plot3(x1(:,1), x1(:,2), x1(:,3), 'Color','r','LineWidth',w, 'linestyle', '-')
% plot3(x2(:,1), x2(:,2), x2(:,3), 'Color','k','LineWidth',w, 'linestyle', '--');

%%
set(gcf, 'PaperUnits', 'p', 'PaperPosition', [0 0 200 180]);
if save
    saveas(gcf, [pwd path 'traj.eps'], 'epsc');
end