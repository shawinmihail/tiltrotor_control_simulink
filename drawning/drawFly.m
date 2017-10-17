function drawFly(q_BI, q_PB, rays, l, draw_mode)
if draw_mode == 1

hold on
cla(gca)
%% rays and propellers axis
m = 0.25;
for i = 1:4
    ray = rays(3*i-2:3*i);
    ray_rotated = quatRotate(q_BI, ray);
    line ([0 ray_rotated(1)], [0 ray_rotated(2)], [0 ray_rotated(3)], 'color', 'k', 'linestyle', '-')
    
    % propeller axis
    ex = [1;0;0]*l*m;
    ey = [0;1;0]*l*m;
    ez = [0;0;1]*l*m;
    q_pb = q_PB(:, i);
    x =  quatRotate(q_BI, quatRotate(q_pb, ex));
    y =  quatRotate(q_BI, quatRotate(q_pb, ey));
    z =  quatRotate(q_BI, quatRotate(q_pb, ez));
    line ([ray_rotated(1) x(1)+ray_rotated(1)], [ray_rotated(2) x(2)+ray_rotated(2)], [ray_rotated(3) x(3)+ray_rotated(3)], 'color', 'r')
    line ([ray_rotated(1) y(1)+ray_rotated(1)], [ray_rotated(2) y(2)+ray_rotated(2)], [ray_rotated(3) y(3)+ray_rotated(3)], 'color', 'g')
    line ([ray_rotated(1) z(1)+ray_rotated(1)], [ray_rotated(2) z(2)+ray_rotated(2)], [ray_rotated(3) z(3)+ray_rotated(3)], 'color', 'b')
end

%% circle
step = 0.1;
ang=0:step:2*pi + step; 
xp=l*cos(ang);
yp=l*sin(ang);
s = size(xp);
xp_rotated = zeros(1, s(2));
yp_rotated = zeros(1, s(2));
zp_rotated = zeros(1, s(2));
for i = 1:s(2)
    rp = [xp(i);yp(i);0];   
    rp_rotated = quatRotate(q_BI, rp);
    xp_rotated(1, i) = rp_rotated(1);
    yp_rotated(1, i) = rp_rotated(2);
    zp_rotated(1, i) = rp_rotated(3);
end
plot3(xp_rotated,yp_rotated,zp_rotated);

%% body axis
m = 1/2;
ex = [1;0;0]*l*m;
ey = [0;1;0]*l*m;
ez = [0;0;1]*l*m;

x = quatRotate(q_BI, ex);
y = quatRotate(q_BI, ey);
z = quatRotate(q_BI, ez);

line ([0 x(1)], [0 x(2)], [0 x(3)], 'color', 'r')
line ([0 y(1)], [0 y(2)], [0 y(3)], 'color', 'g')
line ([0 z(1)], [0 z(2)], [0 z(3)], 'color', 'b')

%% draw
scale = l*1.5;
axis([-scale scale -scale scale -scale scale]);
xlabel('x');
ylabel('y');
zlabel('z');

end