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


%%
w = 2;
s = 22;
r2 = [0.5 0 0];
g2  = [0 0.5 0];
b2 = [0 0.5 1];
gray = [0.7 0.7 0.7];


figure
%% angle PITCH
subplot(2,1,1);
hold on
grid on;
plot(t, eul_r(:,3),'Color','r','LineWidth',w, 'linestyle', '-');
plot(t, eul_d(:,3),'Color','k','LineWidth',w-1, 'linestyle', '--');

set(gca,'FontSize',s)
leg = legend('pitch real', 'pitch des', 'Location','southeast');
set(leg,'FontSize',s);
xlabel('time, s');
ylabel('angle, rad');
% ylim([-pi-0.1, pi+0.1]);

%% angle ROLL
subplot(2,1,2);
hold on
grid on;
plot(t, eul_r(:,2),'Color','g','LineWidth',w, 'linestyle', '-');
plot(t, eul_d(:,2),'Color','k','LineWidth',w-1, 'linestyle', '--');

set(gca,'FontSize',s)
leg = legend('roll real', 'roll des', 'Location','southeast');
set(leg,'FontSize',s);
xlabel('time, s');
ylabel('angle, rad');
% ylim([-pi-0.1, pi+0.1]);

set(gcf, 'PaperUnits', 'centimeters', 'PaperPosition', [0 0 60 20]);
if save
    saveas(gcf, [pwd path 'pitchAndRoll.png']);
end

figure
%% angle PITCH
subplot(2,1,1);
hold on
grid on;
plot(t, eul_r(:,3),'Color','r','LineWidth',w, 'linestyle', '-');
plot(t, eul_d(:,3),'Color','k','LineWidth',w-1, 'linestyle', '--');

set(gca,'FontSize',s)
leg = legend('pitch real', 'pitch des', 'Location','southeast');
set(leg,'FontSize',s);
xlabel('time, s');
ylabel('angle, rad');
% ylim([-pi-0.1, pi+0.1]);

%% error PITCH
subplot(2,1,2);
hold on
grid on;
plot(t, eul_r(:,3)-eul_d(:,3),'Color','r','LineWidth',w, 'linestyle', '-');
set(gca,'FontSize',s)
leg = legend('pitch error', 'Location','southeast');
set(leg,'FontSize',s);
xlabel('time, s');
ylabel('angle, rad');
% ylim([-pi-0.1, pi+0.1]);

set(gcf, 'PaperUnits', 'centimeters', 'PaperPosition', [0 0 60 20]);
if save
    saveas(gcf, [pwd path 'pitchAndError.png']);
end

figure
%% angle ROLL
subplot(2,1,1);
hold on
grid on;
plot(t, eul_r(:,2),'Color','g','LineWidth',w, 'linestyle', '-');
plot(t, eul_d(:,2),'Color','k','LineWidth',w-1, 'linestyle', '--');

set(gca,'FontSize',s)
leg = legend('roll real', 'roll des', 'Location','southeast');
set(leg,'FontSize',s);
xlabel('time, s');
ylabel('angle, rad');
% ylim([-pi-0.1, pi+0.1]);

%% error ROLL
subplot(2,1,2);
hold on
grid on;
plot(t, eul_r(:,2)-eul_d(:,2),'Color','g','LineWidth',w, 'linestyle', '-');
set(gca,'FontSize',s)
leg = legend('roll error', 'Location','southeast');
set(leg,'FontSize',s);
xlabel('time, s');
ylabel('angle, rad');
% ylim([-pi-0.1, pi+0.1]);

set(gcf, 'PaperUnits', 'centimeters', 'PaperPosition', [0 0 60 20]);
if save
    saveas(gcf, [pwd path 'rollAndError.png']);
end

figure
%% angle YAW
subplot(2,1,1);
hold on
grid on;
plot(t, eul_r(:,1),'Color','b','LineWidth',w, 'linestyle', '-');
plot(t, eul_d(:,1),'Color','k','LineWidth',w-1, 'linestyle', '--');

set(gca,'FontSize',s)
leg = legend('yaw real', 'yaw des', 'Location','southeast');
set(leg,'FontSize',s);
xlabel('time, s');
ylabel('angle, rad');
% ylim([-pi-0.1, pi+0.1]);

%% error YAW
subplot(2,1,2);
hold on
grid on;
plot(t, eul_r(:,1)-eul_d(:,1),'Color','b','LineWidth',w, 'linestyle', '-');
set(gca,'FontSize',s)
leg = legend('yaw error', 'Location','southeast');
set(leg,'FontSize',s);
xlabel('time, s');
ylabel('angle, rad');
% ylim([-pi-0.1, pi+0.1]);

set(gcf, 'PaperUnits', 'centimeters', 'PaperPosition', [0 0 60 20]);
if save
    saveas(gcf, [pwd path 'yawAndError.png']);
end
