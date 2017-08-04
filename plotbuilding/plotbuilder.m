clc
close all

path = '\img\';
save = 0;
trees = 0;

%%
t = time.Data;
r_r=r_real.Data;
eul_r =eul_real.Data;
r_d=r_des.Data;
eul_d = eul_des.Data;
eul_d = mod(eul_d + pi, 2*pi)-pi;
eul_err = eul_d - eul_r;
eps = 3e-3;
eul_err = sign(eul_err).*mod(abs(eul_err), pi-eps);
r_err = r_d - r_r;
vel_r = [[0,0,0];diff(r_r)./[diff(t),diff(t),diff(t)]];
vel_d = [[0,0,0];diff(r_d)./[diff(t),diff(t),diff(t)]];

%%
w = 2;
s = 22;
r2 = [0.5 0 0];
g2  = [0 0.5 0];
b2 = [0 0.5 1];


%% roll
subplot(1,3,1);
hold on
grid on;
plot(t, eul_r(:,3),'Color','r','LineWidth',w, 'linestyle', '-');
plot(t, eul_d(:,3),'Color',r2,'LineWidth',w, 'linestyle', '--');
set(gca,'FontSize',s)
leg = legend('roll real', 'roll desired', 'Location','southeast');
set(leg,'FontSize',s);
xlabel('time, s');
ylabel('angle, rad');
ylim([-pi-0.1, pi+0.1]);

%% pitch
subplot(1,3,2);
hold on
grid on;
plot(t, eul_r(:,2),'Color','g','LineWidth',w, 'linestyle', '-');
plot(t, eul_d(:,2),'Color',g2,'LineWidth',w, 'linestyle', '--');
set(gca,'FontSize',s)
leg = legend('pitch real', 'pitch desired', 'Location','southeast');
set(leg,'FontSize',s);
xlabel('time, s');
ylabel('angle, rad');
ylim([-pi-0.1, pi+0.1]);

%% yaw
subplot(1,3,3);
hold on
grid on;
plot(t, eul_r(:,1),'Color','b','LineWidth',w, 'linestyle', '-');
plot(t, eul_d(:,1),'Color',b2,'LineWidth',w, 'linestyle', '--');
set(gca,'FontSize',s)
leg = legend('yaw real', 'yaw desired', 'Location','southeast');
set(leg,'FontSize',s);
xlabel('time, s');
ylabel('angle, rad');
ylim([-pi-0.1, pi+0.1]);

set(gcf, 'PaperUnits', 'centimeters', 'PaperPosition', [0 0 60 20]);
if save
    saveas(gcf, [pwd path 'eul.png']);
end
figure
%% roll err
subplot(1,3,1);
hold on
grid on;
plot(t, eul_err(:,3),'Color','r','LineWidth',w, 'linestyle', '-');
set(gca,'FontSize',s)
leg = legend('roll error', 'Location','southeast');
set(leg,'FontSize',s);
xlabel('time, s');
ylabel('angle, rad');

%% pitch err
subplot(1,3,2);
hold on
grid on;
plot(t, eul_err(:,2),'Color','g','LineWidth',w, 'linestyle', '-');
set(gca,'FontSize',s)
leg = legend('pitch error', 'Location','southeast');
set(leg,'FontSize',s);
xlabel('time, s');
ylabel('angle, rad');

%% yaw err
subplot(1,3,3);
hold on
grid on;
plot(t, eul_err(:,1),'Color','b','LineWidth',w, 'linestyle', '-');
set(gca,'FontSize',s)
leg = legend('yaw error','Location','southeast');
set(leg,'FontSize',s);
xlabel('time, s');
ylabel('angle, rad');

set(gcf, 'PaperUnits', 'centimeters', 'PaperPosition', [0 0 60 20]);
if save
    saveas(gcf, [pwd path 'eul_err.png']);
end
figure

%% trajectory
subplot(2,1,1);                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             
hold on
grid on;
plot(r_r(:, 1), r_r(:,2),'Color','g','LineWidth',w, 'linestyle', '-');
plot(r_d(:, 1), r_d(:,2),'Color',g2,'LineWidth',w, 'linestyle', '--');
set(gca,'FontSize',s)
leg = legend('y(x) real', 'y(x) desired', 'Location','southeast');
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
plot(t, r_r(:,3),'Color','b','LineWidth',w, 'linestyle', '-');
plot(t, r_d(:,3),'Color',b2,'LineWidth',w, 'linestyle', '--');
set(gca,'FontSize',s)
leg = legend('alt real', 'alt desired', 'Location','southeast');
set(leg,'FontSize',s);
xlabel('time, s');
ylabel('alt, m');

set(gcf, 'PaperUnits', 'centimeters', 'PaperPosition', [0 0 30 60]);
if save
    saveas(gcf, [pwd path 'r.png']);
end

%% vel
figure
subplot(2,1,1);
hold on
grid on;
plot(t, r_r(:,1),'Color','r','LineWidth',w, 'linestyle', '-');
plot(t, r_d(:,1),'Color',r2,'LineWidth',w, 'linestyle', '--');
set(gca,'FontSize',s)
leg = legend('x(t) real', 'x(t) desired', 'Location','southeast');
set(leg,'FontSize',s);
xlabel('t, s');
ylabel('x, m');

subplot(2,1,2);
hold on
grid on;
plot(t, vel_r(:,1),'Color','r','LineWidth',w, 'linestyle', '-');
plot(t, vel_d(:,1),'Color',r2,'LineWidth',w, 'linestyle', '--');
set(gca,'FontSize',s)
leg = legend('vx(t) real', 'vx(t) desired', 'Location','southeast');
set(leg,'FontSize',s);
xlabel('t, s');
ylabel('vx, m/s');

set(gcf, 'PaperUnits', 'centimeters', 'PaperPosition', [0 0 60 20]);
if save
    saveas(gcf, [pwd path 'vx.png']);
end
% close all
