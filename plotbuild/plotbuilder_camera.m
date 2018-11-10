%%
clc
close all

%%
t = time.Data;
d = dirB.Data;


%%
r2 = [0.5 0 0];
g2  = [0 0.5 0];
b2 = [0 1 1];
%%
LIM = 0.15;
%% W
subplot(1,1,1);
hold on
grid on;
plot(d(:, 2), d(:, 3), 'Color','r','LineWidth',w, 'linestyle', '-.');
set(gca,'FontSize',s)
leg = legend('\psi', 'Location', 'southeast');
set(leg,'FontSize',s+dsleg);
xlabel('\psi_1, rad');
ylabel('\psi_2, rad');
ylim([-0.1, 0.1]);
xlim([-0.05, 0.05]);

set(gcf, 'PaperUnits', 'centimeters', 'PaperPosition', [0 0 60 20]);
set(gcf, 'PaperUnits', 'p', 'PaperPosition', [0 0 height width]);
if save
    saveas(gcf, [pwd path 'camera.png']);
    saveas(gcf, [pwd path 'camera.fig']);
end

