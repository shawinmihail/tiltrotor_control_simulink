%%
clc
close all

%%
t = time.Data;
W = W_real.Data;
Th = Th_real.Data;
w_lim = qc.W_lim;
w_lim = sign(w_lim) .* sqrt(abs(w_lim))';

th_lim = qc.Th_lim;
%%
r2 = [0.5 0 0];
g2  = [0 0.5 0];
b2 = [0 1 1];
%%

%% W
subplot(1,1,1);
hold on
grid on;
plot(t, sign(W(:, 1)) .* sqrt(abs(W(:, 1))), 'Color','b','LineWidth',w, 'linestyle', '-');
plot(t, sign(W(:, 2)) .* sqrt(abs(W(:, 2))), 'Color','g','LineWidth',w, 'linestyle', '-');
plot(t, sign(W(:, 3)) .* sqrt(abs(W(:, 3))), 'Color','m','LineWidth',w, 'linestyle', '-');
plot(t, sign(W(:, 4)) .* sqrt(abs(W(:, 4))), 'Color','c','LineWidth',w, 'linestyle', '-');
plot([t(1) t(end)], [w_lim w_lim], 'Color',[1 0 0.5],'LineWidth',w, 'linestyle', '--');
plot([t(1) t(end)], [-w_lim -w_lim], 'Color',[1 0.5 0],'LineWidth',w, 'linestyle', '--');
set(gca,'FontSize',s)
leg = legend('\omega_1', '\omega_2', '\omega_3', '\omega_4', '\omega_{lim}^+', '\omega_{lim}^-', 'Location', 'southeast');
set(leg,'FontSize',s);
xlabel('t, s');
ylabel('\omega, rad/s');
% ylim([-LIM, LIM]);
set(gcf, 'PaperUnits', 'p', 'PaperPosition', [0 0 height width]);
if save
    saveas(gcf, [pwd path 'rotor_rates.png']);
    saveas(gcf, [pwd path 'rotor_rates.fig']);
end

%% TH
figure
subplot(1,1,1);
hold on
grid on;
plot(t, Th(:, 1), 'Color','b','LineWidth',w, 'linestyle', '-');
plot(t, Th(:, 2), 'Color','g','LineWidth',w, 'linestyle', '-');
plot(t, Th(:, 3), 'Color','m','LineWidth',w, 'linestyle', '-');
plot(t, Th(:, 4), 'Color','c','LineWidth',w, 'linestyle', '-');
plot([t(1) t(end)], [th_lim th_lim], 'Color',[1 0 0.5],'LineWidth',w, 'linestyle', '--');
plot([t(1) t(end)], [-th_lim -th_lim], 'Color',[1 0.5 0],'LineWidth',w, 'linestyle', '--');
set(gca,'FontSize',s)
leg = legend('\theta_1', '\theta_2', '\theta_3', '\theta_4', '\theta_{lim}^+', '\theta_{lim}^-', 'Location', 'southeast');
set(leg,'FontSize',s);
xlabel('t, s');
ylabel('\theta, rad');
% ylim([-LIM, LIM]);
set(gcf, 'PaperUnits', 'p', 'PaperPosition', [0 0 height width]);
if save
    saveas(gcf, [pwd path 'rotor_angles.png']);
    saveas(gcf, [pwd path 'rotor_angles.fig']);
end
