
wm = w.Data;
wdm = wdot.Data;

w3 = wm(2000:end, 3);
wdot3 = wdm(2000:end, 3);

w3 = w3';
wdot3 = wdot3';

x = tsmovavg(w3, 's', 50);
y = diff(x);

hold on
plot(wdot3,  'Color', 'r')
plot(y*1000, 'Color', 'g')
