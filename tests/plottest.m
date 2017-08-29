k = 0;

for i=-50:0.1:50
    k = k + 1;
    Ths = resolve_th(i, 0)
    ThA = Ths(1, :)'
    ThB = Ths(2, :)'
    x(k) = i;
    y1(k) = ThB(1);
    y2(k) = ThB(2);
    y3(k) = ThB(3);
    y4(k) = ThB(4);
end

hold on
plot(x, y1)
plot(x, y2)
plot(x, y3)
plot(x, y4)

