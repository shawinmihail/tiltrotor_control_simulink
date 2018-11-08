clc
close all

%%
t = time.Data;

r_r= r_real.Data;
r_d = r_des.Data;

eul_r = eul_real.Data;
eul_d = eul_des.Data;


eul_error = wrapToPi(eul_d - eul_r);
r_error = r_d - r_r;    


%%
xlshift = [0.5, 0.2];
ylshift = [0.065, 0.5];

r2 = [0.5 0 0];
g2  = [0 0.5 0];
b2 = [0 0.5 1];
gray = [0.7 0.7 0.7];

EULLIM = 0.2;
%% roll error
figure
hold on
grid on;
plot(t, eul_error(:,3),'Color','r','LineWidth',w, 'linestyle', '-');
set(gca,'FontSize',s)

leg = legend('\delta_{\alpha}', 'Location','southeast');
set(leg,'FontSize',s);

% legend boxoff

xl = xlabel('t, s');
yl = ylabel('\delta, rad');

ylim([-0.1 0.1])
set(gcf, 'PaperUnits', 'p', 'PaperPosition', [0 0 height width]);
if save
    saveas(gcf, [pwd path 'roll_error.png']);
    saveas(gcf, [pwd path 'roll_error.fig']);
end

%% pitch error
figure
hold on
grid on;
plot(t, eul_error(:,2),'Color','g','LineWidth',w, 'linestyle', '-');
set(gca,'FontSize',s)

leg = legend('\delta_{\beta}', 'Location','southeast');
set(leg,'FontSize',s);
set(leg,'FontSize',s);
% legend boxoff

xl = xlabel('t, s');
yl = ylabel('\delta, rad');

ylim([-0.1 0.1])
set(gcf, 'PaperUnits', 'p', 'PaperPosition', [0 0 height width]);
if save
    saveas(gcf, [pwd path 'pitch_error.png']);
    saveas(gcf, [pwd path 'pitch_error.fig']);
end

%% yaw error
figure
hold on
grid on;
plot(t, eul_error(:,1),'Color','b','LineWidth',w, 'linestyle', '-');
set(gca,'FontSize',s)

leg = legend('\delta_{\gamma}', 'Location','southeast');
set(leg,'FontSize',s);
set(leg,'FontSize',s);
% legend boxoff

xl = xlabel('t, s');
yl = ylabel('\delta, rad');

ylim([-0.1 0.1])
set(gcf, 'PaperUnits', 'p', 'PaperPosition', [0 0 height width]);
if save
    saveas(gcf, [pwd path 'yaw_error.png']);
    saveas(gcf, [pwd path 'yaw_error.fig']);
end


RLIM = 0.3;
%% x
figure
hold on
grid on;
plot(t, r_error(:,1),'Color','r','LineWidth',w, 'linestyle', '-');
set(gca,'FontSize',s)
leg = legend('\delta_{x}', 'Location','southeast');
set(leg,'FontSize',s);
xlabel('t, s');
ylabel('x, m');

set(gcf, 'PaperUnits', 'p', 'PaperPosition', [0 0 height width]);
if save
    saveas(gcf, [pwd path 'x_error.png']);
    saveas(gcf, [pwd path 'x_error.fig']);
end

%% y
figure
hold on
grid on;
plot(t, r_error(:,2),'Color','g','LineWidth',w, 'linestyle', '-');
set(gca,'FontSize',s)
leg = legend('\delta_{y}', 'Location','southeast');
set(leg,'FontSize',s);
xlabel('t, s');
ylabel('y, m');

set(gcf, 'PaperUnits', 'p', 'PaperPosition', [0 0 height width]);
if save
    saveas(gcf, [pwd path 'y_error.png']);
    saveas(gcf, [pwd path 'y_error.fig']);
end

%% z
figure
hold on
grid on;
plot(t, r_error(:,3),'Color','b','LineWidth',w, 'linestyle', '-');
set(gca,'FontSize',s)
leg = legend('\delta_{z}', 'Location','southeast');
set(leg,'FontSize',s);
xlabel('t, s');
ylabel('z, m');

set(gcf, 'PaperUnits', 'p', 'PaperPosition', [0 0 height width]);
if save
    saveas(gcf, [pwd path 'z_error.png']);
    saveas(gcf, [pwd path 'z_error.fig']);
end
