clc
close all

path = '\img\';

save = 1;
save_size = [];
s = 20;

%%
t = time.Data;

rr = r_real.Data;
% rf = r_filtered.Data;
rd = r_des.Data;
vr = v_real.Data;
qr = q_real.Data;
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

ex = [1;0;0];
for i = 1:1/qc.time_step:numel(qr(:,1))*1+0
q = qr(i,:)';
v = quatRotate(q, ex);
e(:,i) = v/5;
plot([rr(i,1),rr(i,1)+e(1,i)], [rr(i,2),rr(i,2)+e(2,i)],'Color','b','LineWidth',w, 'linestyle', '-');
end


xl = xlabel('x, m');
yl = ylabel('y, m');
set(xl, 'Units', 'Normalized', 'Position', [0.5, 0.1, 0]);
set(yl, 'Units', 'Normalized', 'Position', [0.1, 0.5, 0]);
% xlim([0 14])
% ylim([-1.4 1.6])

%% leg
set(gca,'FontSize',s)
[leg, hobj1] = legend('y(x) real', 'y(x) desired', 'Location','southeast');
set(leg,'FontSize',s);
rect = [0.42, 0.85, .1, .1];
set(leg, 'Position', rect)
legend boxoff

%%
set(gcf, 'PaperUnits', 'p', 'PaperPosition', [0 0 800 600]);
if save
    saveas(gcf, [pwd path 'traj.eps'], 'epsc');
end

figure
hold on
grid on;
r = norm3d(rd - rr);
plot(t, r,'Color','b','LineWidth',w, 'linestyle', '-');
xlabel('time, s');
ylabel('error, m');
leg = legend('error', 'Location','southeast');
set(leg,'FontSize',s);
% xlim([0 8])
% ylim([-1 1])

% 3d
figure
hold on
grid on;
plot3(rr(:,1), rr(:,2), rr(:,3), 'Color','g','LineWidth',w, 'linestyle', '-');
plot3(rd(:,1), rd(:,2), rd(:,3), 'Color','k','LineWidth',w, 'linestyle', '--');

xl = xlabel('x, m');
yl = ylabel('y, m');
zl = ylabel('z, m');
leg = legend('trajectory', 'trajectory desired', 'Location','southeast');
set(leg,'FontSize',22);