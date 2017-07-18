clear
clc

%% config
qc.l = 0.2;

% plus
qc.rays = [1;0;0;
          0;1;0;
          -1;0;0
          0;-1;0];
          
%% X
qc.rays =  [1;1;0;
          -1;1;0;
           -1;-1;0
           1;-1;0];

% % % K
% qc.rays = [1;1;0;
%           0;1;0;
%           0;-1;0
%           1;-1;0];
% % 
% % % random
% qc.rays = [1;2;0;
%           -2;1;0;
%           3;-1;0
%           -1;0;0];

for i = 1:4
    qc.rays(3*i-2:3*i) = qc.l*qc.rays(3*i-2:3*i)/norm(qc.rays(3*i-2:3*i));
end

qc.rot_dirs = [1;-1;1;-1];

%% dyn
qc.g = [0;0;-9.81]*1;
qc.m = 1.32;
qc.I_B = [0.0154 0 0
          0 0.0154 0
          0 0 0.0263];
      
qc.I_P = [8.450 0 0
          0 8.450 0
          0 0 4.580]*1e-5;

%% init pose
qc.r0 = [0;0;0];
qc.R0 = [
1,0,0;
0,1,0;
0,0,1;
];
qc.omega0 = [0;0;1]*0;
qc.W0 = 1*[1;-1;1;-1]*150^2;
qc.Th0 = 1*[45;45;45;45]*pi/180;

%% aerodyn
qc.k = 2.5*1e-5;
qc.b = 1*1e-6;

%% lims
qc.Th_dot_lim = inf;
qc.der_filter = 8;

%% jacobian
jacobian(qc.rays, qc.rot_dirs, qc.k, qc.b, qc.l);
