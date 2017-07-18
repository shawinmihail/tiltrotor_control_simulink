hold on 

eul = [10 20 0] * pi/180;
R_IB = eul2rotm(eul);
l = 0.13;

%% plus
rays =    [1;0;0;
          0;1;0;
          -1;0;0
          0;-1;0];

%% X
rays =    [1;1;0;
          1;-1;0;
          -1;-1;0
          -1;1;0];

% %% K
% rays =    [1;1;0;
%           0;1;0;
%           0;-1;0
%           1;-1;0];
      
for i = 1:4
    rays(3*i-2:3*i) = l*rays(3*i-2:3*i)/norm(rays(3*i-2:3*i));
end
Th = [0;0;0;0];

%% R_BP (flat case)
ex = [1;0;0];
R_BP = zeros(14, 3);
for i = 1:4
    ray = rays(3*i-2:3*i);
    cosAlpha = dot(ex, ray/norm(ray));
    alpha = acos(cosAlpha);
    if(ray(2) < 0)
        alpha = -alpha;
    end
    x = Th(i);
    Rz = axang2rotm([0 0 1 alpha]);
    Rx = axang2rotm([1 0 0 x]);
    R_BP(3*i-2:3*i, 1:3) = Rz*Rx;
end

%% rays and propellers axis
m = 0.25;
for i = 1:4
    ray = rays(3*i-2:3*i);
    ray_rotated = R_IB*ray;
    line ([0 ray_rotated(1)], [0 ray_rotated(2)], [0 ray_rotated(3)], 'color', 'k', 'linestyle', '-')
    
    % propeller axis
    ex = [1;0;0]*l*m;
    ey = [0;1;0]*l*m;
    ez = [0;0;1]*l*m;
    r_bp = R_BP(3*i-2:3*i, 1:3);
    x =  R_IB * r_bp * ex;
    y =  R_IB * r_bp * ey;
    z =  R_IB * r_bp * ez;
    line ([ray_rotated(1) x(1)+ray_rotated(1)], [ray_rotated(2) x(2)+ray_rotated(2)], [ray_rotated(3) x(3)+ray_rotated(3)], 'color', 'r')
    line ([ray_rotated(1) y(1)+ray_rotated(1)], [ray_rotated(2) y(2)+ray_rotated(2)], [ray_rotated(2) y(3)+ray_rotated(3)], 'color', 'g')
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
    rp_rotated = R_IB*rp;
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

x = R_IB*ex;
y = R_IB*ey;
z = R_IB*ez;

line ([0 x(1)], [0 x(2)], [0 x(3)], 'color', 'r')
line ([0 y(1)], [0 y(2)], [0 y(3)], 'color', 'g')
line ([0 z(1)], [0 z(2)], [0 z(3)], 'color', 'b')


%% 
scale = l*1.5;
axis([-scale scale -scale scale -scale scale]);
xlabel('x');
ylabel('y');
zlabel('z');
