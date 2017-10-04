clc
close all

path = '\img\';
save = 0;
s = 14;

%%
t = time.Data;

rr = r_real.Data;
rf = r_filtered.Data;
rd = r_des.Data;
vr = v_real.Data;
vf = v_filtered.Data;
vdr = vdot_real.Data;
vdf = vdot_filtered.Data;
norm_vr = norm3d(vdr);

elr = eul_real.Data;
elf = eul_filtered.Data;
eld = eul_des.Data;
omr = omega_real.Data;
omf = omega_filtered.Data;

w = 1;
figure
xlabel('x'); ylabel('y'); zlabel('z'); 
hold on

%% 1
subplot(1,1,1);
hold on
grid on;
plot(t, vdf(:,1),'Color','r','LineWidth',w, 'linestyle', '-');
plot(t, vdf(:,2),'Color','g','LineWidth',w, 'linestyle', '-');
plot(t, vdf(:,3),'Color','b','LineWidth',w, 'linestyle', '-');
xlabel('t, s');
ylabel('velocity, m/s');
% xlim([0 14])
% ylim([-1.4 1.4])

if save
    saveas(gcf, [pwd path 'vel.png']);
end