clc
clear

%% data
ex = [1;0;0];
ez = [0;0;1];

OmegaB = [0;0;0];
OmegaB_dot = [0;0;1];
Th = [0;0;0;0]*1;
Th_dot = [0;0;0;0];
W = [1;-1;1;-1];

IP = eye(3)*1e-5;
IB = eye(3)*1e-3;

%% R_PB
R_PB = zeros(12,3);
for i=1:4
    z=(i-1)*pi/2;
    x = Th(i);
    Rz = axang2rotm([0 0 1 z]);
    Rx = axang2rotm([1 0 0 x]);
    R_PB(3*i-2:3*i, 1:3) = Rz*Rx;
end

%% omegaP
omegaP = zeros(4*3,1);
for i = 1:4
    R = R_PB(3*i-2:3*i, 1:3);
    w = sign(W(i))*sqrt(abs(W(i)));
    omegaP(3*i-2:3*i, 1) = R'*OmegaB + [Th_dot(i); 0; w];
end
omegaP_dot = zeros(12,1);

%% rays
l = 0.13;
rays = l*[1;0;0;
          0;1;0;
          -1;0;0
          0;-1;0;];
 rot_dirs = [1;1;1;1];

%% tauB
k = 1e-5;
b = 1e-6;

tau = [0;0;0];
F = [0;0;0];
for i = 1:4
    
    ray = rays(3*i-2:3*i);
    dir = rot_dirs(i);
    omega_p = omegaP(3*i-2:3*i);
    omega_pz = omega_p(3);
    omega_p_dot = omegaP_dot(3*i-2:3*i);
    R = R_PB(3*i-2:3*i, 1:3);
   
    fp = dir*[0;0;k*W(i)];
    fb = R*fp;
    
    tau_p_ext = [0;0;-b*abs(omega_pz)*omega_pz];
    tau_p = IP*omega_p_dot + cross(omega_p, IP*omega_p) - tau_p_ext;
    tau_b = cross(ray, fb) - R*tau_p;
    
    tau = tau + tau_b;
    F = F + fb;
end

%% R2w
R = magic(3);
omega = [-R(2,3); R(1,3); -R(1,2)];

%% draw
R_IB = R_PB(1:3, 1:3);

ex = [1;0;0];
ey = [0;1;0];
ez = [0;0;1];

x = R_IB*ex;
y = R_IB*ey;
z = R_IB*ez;

line ([0 x(1)], [0 x(2)], [0 x(3)], 'color', 'r')
line ([0 y(1)], [0 y(2)], [0 y(3)], 'color', 'g')
line ([0 z(1)], [0 z(2)], [0 z(3)], 'color', 'b')

scale = 1.5;
axis([-scale scale -scale scale -scale scale]);
xlabel('x');
ylabel('y');
zlabel('z');


