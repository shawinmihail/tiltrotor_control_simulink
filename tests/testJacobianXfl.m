Th = [1 1 1 1]' * pi/2;
W = [-1 0 0 0]' * 1e6;

J = xfl_J_B(Th(1),Th(2),Th(3),Th(4))

f = J*W