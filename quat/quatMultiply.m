function [q3] = quatMultiply( q1 ,q2 )
q3 = quatmultiply( q1', q2');
q3 = q3';
end

