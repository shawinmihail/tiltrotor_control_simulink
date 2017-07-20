hold on;
grid on;
w = 2;
t = (0:5 * (1e-4):25);
plot(t, yout(:,1),'Color','r','LineWidth',w);
plot(t, yout(:,2),'Color','g','LineWidth',w);
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