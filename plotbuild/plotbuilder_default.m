clc
close all

%%
t = time.Data;

r_r= r_real.Data;
r_d = r_des.Data;

eul_r = eul_real.Data;
eul_d = eul_des.Data;

r2 = [0.5 0 0];
g2  = [0 0.5 0];
b2 = [0 0.5 1];
gray = [0.7 0.7 0.7];
k = 'k';

lim_q = 3;

%% roll
figure
hold on
grid on;
plot(t, eul_r(:,3),'Color','r','LineWidth',w, 'linestyle', '-');
plot(t, eul_d(:,3),'Color',k,'LineWidth',w, 'linestyle', '--');
set(gca,'FontSize',s)

xl = xlabel('t, ñ');
yl = ylabel('q_x');

set(gcf, 'PaperUnits', 'p', 'PaperPosition', [0 0 height width]);
if save
    saveas(gcf, [pwd path 'roll.png']);
    saveas(gcf, [pwd path 'roll.fig']);
end

%% pitch
figure
hold on
grid on;
plot(t, eul_r(:,2),'Color','g','LineWidth',w, 'linestyle', '-');
plot(t, eul_d(:,2),'Color',k,'LineWidth',w, 'linestyle', '--');
set(gca,'FontSize',s)


xl = xlabel('t, ñ');
yl = ylabel('q_y');

set(gcf, 'PaperUnits', 'p', 'PaperPosition', [0 0 height width]);
if save
    saveas(gcf, [pwd path 'pitch.png']);
    saveas(gcf, [pwd path 'pitch.fig']);
end

%% yaw
figure
hold on
grid on;
plot(t, eul_r(:,1),'Color','b','LineWidth',w, 'linestyle', '-');
plot(t, eul_d(:,1),'Color',k,'LineWidth',w, 'linestyle', '--');
set(gca,'FontSize',s)


xl = xlabel('t, c');
yl = ylabel('q_z');

set(gcf, 'PaperUnits', 'p', 'PaperPosition', [0 0 height width]);
if save
    saveas(gcf, [pwd path 'yaw.png']);
    saveas(gcf, [pwd path 'yaw.fig']);
end


%% x
figure
hold on
grid on;
plot(t, r_r(:,1),'Color','r','LineWidth',w, 'linestyle', '-');
plot(t, r_d(:,1),'Color',k,'LineWidth',w, 'linestyle', '--');
set(gca,'FontSize',s)


xl = xlabel('t, c');
yl = ylabel('x, ì');

set(gcf, 'PaperUnits', 'p', 'PaperPosition', [0 0 height width]);
if save
    saveas(gcf, [pwd path 'x.png']);
    saveas(gcf, [pwd path 'x.fig']);
end

%% y
figure
hold on
grid on;
plot(t, r_r(:,2),'Color','g','LineWidth',w, 'linestyle', '-');
plot(t, r_d(:,2),'Color',k,'LineWidth',w, 'linestyle', '--');
set(gca,'FontSize',s)


xl = xlabel('t, ñ');
yl = ylabel('y, ì');

set(gcf, 'PaperUnits', 'p', 'PaperPosition', [0 0 height width]);
if save
    saveas(gcf, [pwd path 'y.png']);
    saveas(gcf, [pwd path 'y.fig']);
end

%% z
figure
hold on
grid on;
plot(t, r_r(:,3),'Color','b','LineWidth',w, 'linestyle', '-');
plot(t, r_d(:,3),'Color',k,'LineWidth',w, 'linestyle', '--');
set(gca,'FontSize',s)


xl = xlabel('t, ñ');
yl = ylabel('z, ì');

set(gcf, 'PaperUnits', 'p', 'PaperPosition', [0 0 height width]);
if save
    saveas(gcf, [pwd path 'z.png']);
    saveas(gcf, [pwd path 'z.fig']);
end