function [ q ] = quatBetweenVectors( v1, v2 )
    if norm(v1) == 0
        q = [1;0;0;0];
        return;
    end
    if norm(v2) == 0
        q = [1;0;0;0];
        return;
    end
    pin = cross(v1, v2);
    w = sqrt((norm(v1)^2) * (norm(v2)^2)) + dot(v1, v2);
    q = [w, pin(1), pin(2), pin(3)];
    if norm(q) == 0
        q = [0;0;0;1];
        return;
    end
    q = q/norm(q);
    q = [q(1);q(2);q(3);q(4)];
end

