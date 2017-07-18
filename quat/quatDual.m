function [ qdual ] = quatDual( q )
qdual = [q(1); -q(2); -q(3); -q(4)];
end

