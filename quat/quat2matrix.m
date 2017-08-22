function [ R ] = quat2matrix( q )
R = quat2rotm(q');
end