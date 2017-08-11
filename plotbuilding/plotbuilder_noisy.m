clc
close all

path = '\img\';
save = 0;
trees = 1;

%%
t = time.Data;

r_n=r_mes.Data;
r_f=r_filtered.Data;
r_r=r_real.Data;

eul_d = eul_des.Data;
eul_f = eul_filtered.Data;
eul_n =eul_mes.Data;
eul_r =eul_real.Data;

r_ce = r_f - r_r;
r_ne = r_n - r_r;
r_fe = r_f - r_r;

%%
w = 2;
s = 22;
r2 = [0.5 0 0];
g2  = [0 0.5 0];
b2 = [0 1 1];


%% roll
subplot(3,1,1);
hold on
grid on;
plot(t, eul_n(:,3)-eul_r(:,3),'Color','r','LineWidth',w, 'linestyle', '-');
plot(t, eul_f(:,3)-eul_r(:,3),'Color', r2,'LineWidth',w, 'linestyle', '-');
set(gca,'FontSize',s)
leg = legend('roll noisy', 'roll filtered', 'Location','southeast');
set(leg,'FontSize',s);
xlabel('time, s');
ylabel('angle, rad');
% ylim([-pi-0.1, pi+0.1]);

%% pitch
subplot(3,1,2);
hold on
grid on;
plot(t, eul_n(:,2),'Color','g','LineWidth',w, 'linestyle', '-');
plot(t, eul_f(:,2),'Color',g2,'LineWidth',w-1, 'linestyle', '-');
set(gca,'FontSize',s)
leg = legend('pitch measured', 'pitch filtered', 'Location','southeast');
set(leg,'FontSize',s);
xlabel('time, s');
ylabel('angle, rad');
ylim([-pi-0.1, pi+0.1]);

%% yaw
subplot(3,1,3);
hold on
grid on;
plot(t, eul_n(:,1),'Color','b','LineWidth',w, 'linestyle', '-');
plot(t, eul_f(:,1),'Color',b2,'LineWidth',w-1, 'linestyle', '-');
set(gca,'FontSize',s)
leg = legend('yaw measured', 'yaw filtered', 'Location','southeast');
set(leg,'FontSize',s);
xlabel('time, s');
ylabel('angle, rad');
ylim([-pi-0.1, pi+0.1]);

set(gcf, 'PaperUnits', 'centimeters', 'PaperPosition', [0 0 60 20]);
if save
    saveas(gcf, [pwd path 'eul mes.png']);
end
figure

%% trajectory
subplot(2,1,1);                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
hold on
grid on;
plot(r_n(:, 1), r_n(:,2),'Color','g','LineWidth',w, 'linestyle', '-');
plot(r_f(:, 1), r_f(:,2),'Color',g2,'LineWidth',w-1, 'linestyle', '-');
set(gca,'FontSize',s)
leg = legend('y(x) measured', 'y(x) filtered', 'Location','southeast');
set(leg,'FontSize',s);
xlabel('x, m');
ylabel('y, m');

%% trees
if trees > 0.5
    r = 0.5;
    i = 0:0.1:3*pi;
    x = r*sin(i);
    y = r*cos(i);

    r01 = [0;0];
    r02 = [3;0];
    r03 = [6;0];
    plot(x+r01(1), y+r01(2), 'LineWidth',w, 'Color','k');
    plot(x+r02(1), y+r02(2), 'LineWidth',w, 'Color','k');
    plot(x+r03(1), y+r03(2), 'LineWidth',w, 'Color','k');
    xlim([-2, 8]);
    ylim([-5, 5]);
end

%% alt
subplot(2,1,2);
hold on
grid on;
plot(t, r_n(:,3),'Color','b','LineWidth',w, 'linestyle', '-');
plot(t, r_f(:,3),'Color',b2,'LineWidth',w-1, 'linestyle', '-');
set(gca,'FontSize',s)
leg = legend('alt measured', 'alt filtered', 'Location','southeast');
set(leg,'FontSize',s);
xlabel('time, s');
ylabel('alt, m');

set(gcf, 'PaperUnits', 'centimeters', 'PaperPosition', [0 0 30 60]);
if save
    saveas(gcf, [pwd path 'r mes.png']);
end

%% control error
figure
subplot(3,1,1);
hold on
grid on;
plot(t, r_ce(:,1),'Color','r','LineWidth',w, 'linestyle', '-');
set(gca,'FontSize',s)
leg = legend('x control err', 'Location','southeast');
set(leg,'FontSize',s);
xlabel('t, s');
ylabel('x, m');

subplot(3,1,2);
hold on
grid on;
plot(t, r_ce(:,2),'Color','g','LineWidth',w, 'linestyle', '-');
set(gca,'FontSize',s)
leg = legend('y control err', 'vx(t) filtered', 'Location','southeast');
set(leg,'FontSize',s);
xlabel('t, s');
ylabel('y, m');

subplot(3,1,3);
hold on
grid on;
plot(t, r_ce(:,3),'Color','b','LineWidth',w, 'linestyle', '-');
set(gca,'FontSize',s)
leg = legend('z control err', 'vx(t) filtered', 'Location','southeast');
set(leg,'FontSize',s);
xlabel('t, s');
ylabel('z, m');

set(gcf, 'PaperUnits', 'centimeters', 'PaperPosition', [0 0 60 20]);
if save
    saveas(gcf, [pwd path 'control_err.png']);
end


%% noise and filtered noise
figure
subplot(3,1,1);
hold on
grid on;
plot(t, r_ne(:,1),'Color','r','LineWidth',w, 'linestyle', '-');
plot(t, r_fe(:,1),'Color',r2,'LineWidth',w, 'linestyle', '-');
set(gca,'FontSize',s)
leg = legend('x noise', 'x filtered', 'Location','southeast');
set(leg,'FontSize',s);
xlabel('t, s');
ylabel('x, m');

subplot(3,1,2);
hold on
grid on;
plot(t, r_ne(:,2),'Color','g','LineWidth',w, 'linestyle', '-');
plot(t, r_fe(:,2),'Color',g2,'LineWidth',w, 'linestyle', '-');
set(gca,'FontSize',s)
leg = legend('y noise', 'y filtered', 'Location','southeast');
set(leg,'FontSize',s);
xlabel('t, s');
ylabel('y, m');

subplot(3,1,3);
hold on
grid on;
plot(t, r_ne(:,3),'Color','b','LineWidth',w, 'linestyle', '-');
plot(t, r_fe(:,3),'Color',b2,'LineWidth',w, 'linestyle', '-');
set(gca,'FontSize',s)
leg = legend('z noise', 'z filtered', 'Location','southeast');
set(leg,'FontSize',s);
xlabel('t, s');
ylabel('z, m');

set(gcf, 'PaperUnits', 'centimeters', 'PaperPosition', [0 0 60 20]);
if save
    saveas(gcf, [pwd path 'noises.png']);
end

% close all
