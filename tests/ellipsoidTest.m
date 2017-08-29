clear all
clc
i = 1;
a = 15;
b1 = -pi/3;
b2 = pi/3;
for Th1 = b1 : pi/a : b2
    for Th2 = b1 : pi/a : b2
            for Th3 = b1 : pi/a : b2
                    for Th4 = b1 : pi/a : b2
                        i = i+1;
                        f(1:6, i) = J_fcn(Th1, Th2, Th3, Th4)*[1;-1;1;-1];
                    end
            end
    end
end


for k = 1:i
    x(k) = f(1, k);
    y(k) = f(2, k);
    z(k) = f(3, k);
end

scatter3(x,y,z)