clc
close all

path = '\img\';
save = 0;

%%
t = time.Data;

r_r= r_real.Data;
r_m= r_mes.Data;
r_f = r_filtered.Data;
r_d = r_des.Data;

eul_r = eul_real.Data;
eul_d = eul_des.Data;
eul_m = eul_mes.Data;
eul_f = eul_filtered.Data;

eul_error = eul_d - eul_r;
r_error = r_d - r_r;


%%
w = 2;
s = 22;
r2 = [0.5 0 0];
g2  = [0 0.5 0];
b2 = [0 0.5 1];
gray = [0.7 0.7 0.7];

EULLIM = 0.2;
%% roll error
subplot(3,1,1);
hold on
grid on;
plot(t, eul_error(:,3),'Color','r','LineWidth',w, 'linestyle', '-');
set(gca,'FontSize',s)
leg = legend('roll error', 'Location','southeast');
set(leg,'FontSize',s);
xlabel('time, s');
ylabel('angle, rad');
ylim([-EULLIM, EULLIM]);

%% pitch error
subplot(3,1,2);
hold on
grid on;
plot(t, eul_error(:,2),'Color','g','LineWidth',w, 'linestyle', '-');
set(gca,'FontSize',s)
leg = legend('pitch error', 'Location','southeast');
set(leg,'FontSize',s);
xlabel('time, s');
ylabel('angle, rad');
ylim([-EULLIM, EULLIM]);

%% yaw error
subplot(3,1,3);
hold on
grid on;
plot(t, eul_error(:,1),'Color','b','LineWidth',w, 'linestyle', '-');
set(gca,'FontSize',s)
leg = legend('yaw error', 'Location','southeast');
set(leg,'FontSize',s);
xlabel('time, s');
ylabel('angle, rad');
ylim([-1, 1]);

set(gcf, 'PaperUnits', 'centimeters', 'PaperPosition', [0 0 60 20]);
if save
    saveas(gcf, [pwd path 'eulError.png']);
end

figure

RLIM = 0.3;
%% x
subplot(3,1,1);
hold on
grid on;
plot(t, r_error(:,1),'Color','r','LineWidth',w, 'linestyle', '-');
set(gca,'FontSize',s)
leg = legend('x error', 'Location','southeast');
set(leg,'FontSize',s);
xlabel('time, s');
ylabel('x, m');
ylim([-RLIM, RLIM]);

%% y
subplot(3,1,2);
hold on
grid on;
plot(t, r_error(:,2),'Color','g','LineWidth',w, 'linestyle', '-');
set(gca,'FontSize',s)
leg = legend('y error', 'Location','southeast');
set(leg,'FontSize',s);
xlabel('time, s');
ylabel('y, m');
ylim([-RLIM, RLIM]);

%% z
subplot(3,1,3);
hold on
grid on;
plot(t, r_error(:,3),'Color','b','LineWidth',w, 'linestyle', '-');
set(gca,'FontSize',s)
leg = legend('z error', 'Location','southeast');
set(leg,'FontSize',s);
xlabel('time, s');
ylabel('z, m');
ylim([-RLIM, RLIM]);

set(gcf, 'PaperUnits', 'centimeters', 'PaperPosition', [0 0 60 20]);
if save
    saveas(gcf, [pwd path 'rError.png']);
end
