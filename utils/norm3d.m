function [ ns ] = norm3d( vs )
s = size(vs);
n = s(1);
ns = zeros(n, 1);
for i = 1:n
    ns(i) = norm(vs(i, :));
end
end

