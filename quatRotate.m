function [ r_rotated ] = quatRotate( q, r )
r_rotated = quatrotate(q',r');
r_rotated = r_rotated';
end

