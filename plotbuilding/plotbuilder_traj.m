clc
close all

path = '\img\';
save = 1;
s = 14;

%%
t = time.Data;

rr = r_real.Data;
rf = r_filtered.Data;
rd = r_des.Data;
vr = v_real.Data;
vf = v_filtered.Data;
vdr = vdot_real.Data;
vdf = vdot_filtered.Data;

elr = eul_real.Data;
elf = eul_filtered.Data;
eld = eul_des.Data;
omr = omega_real.Data;
omf = omega_filtered.Data;

x1 = rr;
x2 = rd;

w = 1;

figure
xlabel('x'); ylabel('y'); zlabel('z'); 
hold on

%% 1
subplot(1,1,1);
hold on
grid on;
plot(x1(:,1), x1(:,2),'Color','g','LineWidth',w, 'linestyle', '-');
plot(x2(:,1), x2(:,2),'Color','k','LineWidth',w, 'linestyle', '--');
xlabel('x, m');
ylabel('y, m');
xlim([0 14])
ylim([-1.4 1.4])

%% wals
wallX = [0;0];
wallY = [-1;0.5];
e = [1;1];
plot(wallX + (2+5/4)*e, wallY ,'Color','r','LineWidth',w, 'linestyle', '-');
plot(wallX + (2+5/4+5/2)*e, -wallY ,'Color','r','LineWidth',w, 'linestyle', '-');
plot(wallX + (2+5/4+5)*e, wallY ,'Color','r','LineWidth',w, 'linestyle', '-');
plot(wallX + (2+5/4+3*5/2)*e, -wallY ,'Color','r','LineWidth',w, 'linestyle', '-');

%% leg
set(gca,'FontSize',s)
leg = legend('y(x) real', 'y(x) desired', 'Location','southeast');
set(leg,'FontSize',s);

%% 2
% subplot(2,1,2);
% hold on
% grid on;
% plot(t, x1(:,3),'Color','b','LineWidth',w, 'linestyle', '-');
% plot(t, x2(:,3),'Color','k','LineWidth',w, 'linestyle', '--');
% xlabel('time, s');
% ylabel('z, m');
% xlim([0 8])
% ylim([-1 1])

%% 3d
% plot3(x1(:,1), x1(:,2), x1(:,3), 'Color','r','LineWidth',w, 'linestyle', '-')
% plot3(x2(:,1), x2(:,2), x2(:,3), 'Color','k','LineWidth',w, 'linestyle', '--');

%%

if save
    saveas(gcf, [pwd path 'traj.png']);
end