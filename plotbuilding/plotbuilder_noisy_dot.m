%%
clc
close all

path = '\img\';
save = 0;
trees = 1;

%%
t = time.Data;

% rdor_m = rdot_mes.Data;
% rdot_f = rdot_filtered.Data;
% rdor_r = rdot_real.Data;

om_f = omega_filtered.Data;
om_m =omega_mes.Data;
om_r =omega_real.Data;

% r_fr = rdot_f - rdor_r;
% r_mr = rdor_m - rdor_r;

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
plot(t, om_m(:,3)-om_r(:,3),'Color','r','LineWidth',w, 'linestyle', '-');
plot(t, om_f(:,3)-om_r(:,3),'Color', r2,'LineWidth',w, 'linestyle', '-');
set(gca,'FontSize',s)
leg = legend('roll noise', 'roll filtered', 'Location','southeast');
set(leg,'FontSize',s);
xlabel('time, s');
ylabel('angle, rad');
ylim([-0.6, 0.6]);

%% pitch filtered vs noise
subplot(3,1,2);
hold on
grid on;
plot(t, om_m(:,2)-om_r(:,2),'Color','g','LineWidth',w, 'linestyle', '-');
plot(t, om_f(:,2)-om_r(:,2),'Color',g2,'LineWidth',w-1, 'linestyle', '-');
set(gca,'FontSize',s)
leg = legend('pitch noise', 'pitch filtered', 'Location','southeast');
set(leg,'FontSize',s);
xlabel('time, s');
ylabel('angle, rad');
ylim([-0.6, 0.6]);

%% yaw filtered vs noise
subplot(3,1,3);
hold on
grid on;
plot(t, om_m(:,1)-om_r(:,1),'Color','b','LineWidth',w, 'linestyle', '-');
plot(t, om_f(:,1)-om_r(:,1),'Color',b2,'LineWidth',w-1, 'linestyle', '-');
set(gca,'FontSize',s)
leg = legend('pitch noise', 'pitch filtered', 'Location','southeast');
set(leg,'FontSize',s);
xlabel('time, s');
ylabel('angle, rad');
ylim([-0.6, 0.6]);

set(gcf, 'PaperUnits', 'centimeters', 'PaperPosition', [0 0 60 20]);
if save
    saveas(gcf, [pwd path 'eulNoiseVsFilter.png']);
end

%% x filtered vs noise 
figure
subplot(3,1,1);
hold on
grid on;
plot(t, rdor_m(:,1)-rdor_r(:,1),'Color','r','LineWidth',w, 'linestyle', '-');
plot(t, rdot_f(:,1)-rdor_r(:,1),'Color',r2,'LineWidth',w-1, 'linestyle', '-');
set(gca,'FontSize',s)
leg = legend('x noise', 'x filtered', 'Location','southeast');
set(leg,'FontSize',s);
xlabel('t, s');
ylabel('x, m');

%% y filtered vs noise 
subplot(3,1,2);
hold on
grid on;
plot(t, rdor_m(:,2)-rdor_r(:,2),'Color','g','LineWidth',w, 'linestyle', '-');
plot(t, rdot_f(:,2)-rdor_r(:,2),'Color',g2,'LineWidth',w-1, 'linestyle', '-');
set(gca,'FontSize',s)
leg = legend('y noise', 'y filtered', 'Location','southeast');
set(leg,'FontSize',s);
xlabel('t, s');
ylabel('y, m');

%% z filtered vs noise 
subplot(3,1,3);
hold on
grid on;
plot(t, rdor_m(:,3)-rdor_r(:,3),'Color','b','LineWidth',w, 'linestyle', '-');
plot(t, rdot_f(:,3)-rdor_r(:,3),'Color',b2,'LineWidth',w-1, 'linestyle', '-');
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
