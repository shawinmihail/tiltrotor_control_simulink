%%
clc
close all

path = '\img\';
save = 0;
trees = 1;

%%
t = time.Data;

r_m = r_mes.Data;
r_f = r_filtered.Data;
r_r = r_real.Data;
r_d = r_des.Data;

eul_d = eul_des.Data;
eul_f = eul_filtered.Data;
eul_m =eul_mes.Data;
eul_r =eul_real.Data;

r_fr = r_f - r_r;
r_mr = r_m - r_r;

%%
w = 2;
s = 22;
r2 = [0.5 0 0];
g2  = [0 0.5 0];
b2 = [0 1 1];


%% roll filtered vs noise
subplot(3,1,1);
hold on
grid on;
plot(t, eul_m(:,3)-eul_r(:,3),'Color','r','LineWidth',w, 'linestyle', '-');
plot(t, eul_f(:,3)-eul_r(:,3),'Color', r2,'LineWidth',w, 'linestyle', '-');
set(gca,'FontSize',s)
leg = legend('roll noise', 'roll filtered', 'Location','southeast');
set(leg,'FontSize',s);
xlabel('time, s');
ylabel('angle, rad');
% ylim([-pi-0.1, pi+0.1]);

%% pitch filtered vs noise
subplot(3,1,2);
hold on
grid on;
plot(t, eul_m(:,2)-eul_r(:,2),'Color','g','LineWidth',w, 'linestyle', '-');
plot(t, eul_f(:,2)-eul_r(:,2),'Color',g2,'LineWidth',w-1, 'linestyle', '-');
set(gca,'FontSize',s)
leg = legend('pitch noise', 'pitch filtered', 'Location','southeast');
set(leg,'FontSize',s);
xlabel('time, s');
ylabel('angle, rad');
ylim([-pi-0.1, pi+0.1]);

%% yaw filtered vs noise
subplot(3,1,3);
hold on
grid on;
plot(t, eul_m(:,1)-eul_r(:,1),'Color','b','LineWidth',w, 'linestyle', '-');
plot(t, eul_f(:,1)-eul_r(:,1),'Color',b2,'LineWidth',w-1, 'linestyle', '-');
set(gca,'FontSize',s)
leg = legend('pitch noise', 'pitch filtered', 'Location','southeast');
set(leg,'FontSize',s);
xlabel('time, s');
ylabel('angle, rad');
ylim([-pi-0.1, pi+0.1]);

set(gcf, 'PaperUnits', 'centimeters', 'PaperPosition', [0 0 60 20]);
if save
    saveas(gcf, [pwd path 'eulNoiseVsFilter.png']);
end

%% %% yaw filtered vs noise 
figure
subplot(3,1,1);
hold on
grid on;
plot(t, r_m(:,1)-r_r(:,1),'Color','r','LineWidth',w, 'linestyle', '-');
plot(t, r_f(:,1)-r_r(:,1),'Color',r2,'LineWidth',w-1, 'linestyle', '-');
set(gca,'FontSize',s)
leg = legend('x noise', 'x filtered', 'Location','southeast');
set(leg,'FontSize',s);
xlabel('t, s');
ylabel('x, m');

subplot(3,1,2);
hold on
grid on;
plot(t, r_m(:,2)-r_r(:,2),'Color','g','LineWidth',w, 'linestyle', '-');
plot(t, r_f(:,2)-r_r(:,2),'Color',g2,'LineWidth',w-1, 'linestyle', '-');
set(gca,'FontSize',s)
leg = legend('y noise', 'y filtered', 'Location','southeast');
set(leg,'FontSize',s);
xlabel('t, s');
ylabel('y, m');

subplot(3,1,3);
hold on
grid on;
plot(t, r_m(:,3)-r_r(:,3),'Color','b','LineWidth',w, 'linestyle', '-');
plot(t, r_f(:,3)-r_r(:,3),'Color',b2,'LineWidth',w-1, 'linestyle', '-');
set(gca,'FontSize',s)
leg = legend('z noise', 'z filtered', 'Location','southeast');
set(leg,'FontSize',s);
xlabel('t, s');
ylabel('z, m');

set(gcf, 'PaperUnits', 'centimeters', 'PaperPosition', [0 0 60 20]);
if save
    saveas(gcf, [pwd path 'rNoiseVsFilter.png']);
end


% %% noise and filtered noise
% figure
% subplot(3,1,1);
% hold on
% grid on;
% plot(t, r_ne(:,1),'Color','r','LineWidth',w, 'linestyle', '-');
% plot(t, r_fe(:,1),'Color',r2,'LineWidth',w, 'linestyle', '-');
% set(gca,'FontSize',s)
% leg = legend('x noise', 'x filtered', 'Location','southeast');
% set(leg,'FontSize',s);
% xlabel('t, s');
% ylabel('x, m');
% 
% subplot(3,1,2);
% hold on
% grid on;
% plot(t, r_ne(:,2),'Color','g','LineWidth',w, 'linestyle', '-');
% plot(t, r_fe(:,2),'Color',g2,'LineWidth',w, 'linestyle', '-');
% set(gca,'FontSize',s)
% leg = legend('y noise', 'y filtered', 'Location','southeast');
% set(leg,'FontSize',s);
% xlabel('t, s');
% ylabel('y, m');
% 
% subplot(3,1,3);
% hold on
% grid on;
% plot(t, r_ne(:,3),'Color','b','LineWidth',w, 'linestyle', '-');
% plot(t, r_fe(:,3),'Color',b2,'LineWidth',w, 'linestyle', '-');
% set(gca,'FontSize',s)
% leg = legend('z noise', 'z filtered', 'Location','southeast');
% set(leg,'FontSize',s);
% xlabel('t, s');
% ylabel('z, m');
% 
% set(gcf, 'PaperUnits', 'centimeters', 'PaperPosition', [0 0 60 20]);
% if save
%     saveas(gcf, [pwd path 'noises.png']);
% end
% 
% % close all
