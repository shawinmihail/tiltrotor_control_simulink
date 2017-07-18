function [ r_rotated ] = quatRotate( q, r )
q_dual = quatDual(q);
qr = [0;r];

r_rotated = quatMultiply(qr, q_dual);
r_rotated = quatMultiply(q, r_rotated);
r_rotated = [r_rotated(2); r_rotated(3); r_rotated(4)];
end

