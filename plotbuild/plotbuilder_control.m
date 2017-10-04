%%
clc
close all

path = '\img\';
save = 0;

%%
t = time.Data;
W = W_real.Data;
Th = Th_real.Data;
lim = qc.Wlim*ones(numel(t));
lim = lim';


%%
w = 2;
s = 22;
r2 = [0.5 0 0];
g2  = [0 0.5 0];
b2 = [0 1 1];
%%

%% W
subplot(1,1,1);
hold on
grid on;
plot(t, W(:, 1), 'Color','b','LineWidth',w, 'linestyle', '-');
plot(t, W(:, 2), 'Color','g','LineWidth',w, 'linestyle', '-');
plot(t, W(:, 3), 'Color','m','LineWidth',w, 'linestyle', '-');
plot(t, W(:, 4), 'Color','c','LineWidth',w, 'linestyle', '-');
plot(t, lim, 'Color','r','LineWidth',w, 'linestyle', '--');
plot(t, -lim, 'Color','r','LineWidth',w, 'linestyle', '--');
set(gca,'FontSize',s)
leg = legend('w1', 'w2', 'w3', 'w4', 'w lim', 'Location', 'southeast');
set(leg,'FontSize',s);
xlabel('time, s');
ylabel('w, rad/s');
% ylim([-LIM, LIM]);

set(gcf, 'PaperUnits', 'centimeters', 'PaperPosition', [0 0 60 20]);
if save
    saveas(gcf, [pwd path 'mesErrVsFiltrdError.png']);
end
