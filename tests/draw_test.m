t = time.Data;
m1 = tau1.Data;
m2 = tau2.Data;
summ = m2(:, 1) + m1(:, 1);
hold on
plot(t, summ, 'r')
plot(t, m1(:,1), 'b')
plot(t, m2(:,1), 'k')