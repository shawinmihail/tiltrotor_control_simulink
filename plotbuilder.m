clc

hold on;
grid on;
w = 2;

t = time.Data;
r_r=r_real.Data;
eul_r = eul_real.Data;
r_d=r_des.Data;
eul_d = eul_des.Data;

%% roll
plot(t, eul_r(:,1),'Color','r','LineWidth',w, 'linestyle', '-');
plot(t, eul_d(:,1),'Color','k','LineWidth',w, 'linestyle', '--');

%% pitch
plot(t, eul_r(:,2),'Color','g','LineWidth',w, 'linestyle', '-');
plot(t, eul_d(:,2),'Color','k','LineWidth',w, 'linestyle', '--');

%% yaw
plot(t, eul_r(:,3),'Color','b','LineWidth',w, 'linestyle', '-');
plot(t, eul_d(:,3),'Color','k','LineWidth',w, 'linestyle', '--');

return
plot(t, yout(:,3),'Color','b','LineWidth',w);
plot(t, yout(:,4),'Color','m','LineWidth',w);
plot(t, yout(:,5),'Color','r','LineWidth',w, 'linestyle', '--');
plot(t, yout(:,6),'Color','g','LineWidth',w, 'linestyle', '--');
plot(t, yout(:,7),'Color','b','LineWidth',w, 'linestyle', '--');
plot(t, yout(:,8),'Color','m','LineWidth',w, 'linestyle', '--');
set(gca,'FontSize',18)

leg = legend('q_w^{real}','q_x^{real}','q_y^{real}','q_z^{real}','q_w^{req}','q_x^{req}','q_y^{req}','q_z^{req}');
set(leg,'FontSize',18);

ylim([-1.5;1.5]);
xlabel('t,c');
ylabel('q');