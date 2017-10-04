%%
clc
close all

path = '\img\';
save = 0;

%%
t = time.Data;
r_m = r_mes.Data;
r_f = r_filtered.Data;
r_r = r_real.Data;
eul_f = eul_filtered.Data;
eul_m =eul_mes.Data;
eul_r =eul_real.Data;


%%
xm = r_m - r_r;
xm = xm(:, 1);

xf = r_f - r_r;
xf = xf(:, 1);

LIM = 0.25;
xname = 'x';
xunit = 'm';
%%
w = 2;
s = 22;
r2 = [0.5 0 0];
g2  = [0 0.5 0];
b2 = [0 1 1];


%% x mes error
subplot(2,1,1);
hold on
grid on;
plot(t, xm,'Color','b','LineWidth',w, 'linestyle', '-');
set(gca,'FontSize',s)
label = strcat(xname, ' mesured error');
leg = legend(label, 'Location','southeast');
set(leg,'FontSize',s);
xlabel('time, s');
ylabel(['error, ', xunit]);
ylim([-LIM, LIM]);

%% x filtered error
subplot(2,1,2);
hold on
grid on;
plot(t, xf,'Color','b','LineWidth',w, 'linestyle', '-');
set(gca,'FontSize',s)
label = strcat(xname, ' filtered error');
leg = legend(label, 'Location','southeast');
set(leg,'FontSize',s);
xlabel('time, s');
ylabel(['error, ', xunit]);
ylim([-LIM, LIM]);


set(gcf, 'PaperUnits', 'centimeters', 'PaperPosition', [0 0 60 20]);
if save
    saveas(gcf, [pwd path 'mesErrVsFiltrdError.png']);
end
