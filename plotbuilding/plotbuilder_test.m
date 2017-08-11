clc
close all

path = '\img\';
save = 0;
trees = 0;

%%
t = time.Data;

vdr = vdot_real.Data;
vdm = vdot_filtered.Data;

%%
w = 2;
s = 22;
r2 = [0.5 0 0];
g2  = [0 0.5 0];
b2 = [0 1 1];

hold on
grid on;
plot(t, vdr(:,3),'Color','r','LineWidth',w, 'linestyle', '-');
plot(t, vdm(:,3),'Color','k','LineWidth',w, 'linestyle', '--');
set(gca,'FontSize',s)
