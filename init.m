addpath(genpath(pwd))
clear
clc
close all
o3 = zeros(3, 3);
e3 = eye(3);

%% config
qc.l = 0.25;

% %% plus
% qc.rays = [1;0;0;
%           0;1;0;
%           -1;0;0
%           0;-1;0];
          
% X
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
qc.m = 3.6;
qc.I_B = [0.0348 0 0
          0 0.0420 0
          0 0 0.0685];
      
qc.I_P = 1*[8.450 0 0
          0 8.450 0
          0 0 4.580]*1e-5;
      
%% aerodyn
qc.k = 10*1e-5;
qc.b = 3*1e-6;
qc.S = 40*30*1e-4;
qc.c = 1.05;
qc.ro = 1;

%% control
jacobian(qc.rays, qc.rot_dirs, qc.k, qc.b, qc.l);
qc.wmin = abs(qc.m*qc.g(3))/(4*qc.k);
qc.wrest = qc.wmin * 4;

%% init pose
qc.r0 = 0*[-1.5;0.05;0];
qc.v0 = [0;0;0];
qBI0 = [1;0;0;0];
qc.qBI0 = qBI0/norm(qBI0);
qc.omegaB0 = [0;0;0]*2*pi;
qc.W0 = 1*qc.rot_dirs*qc.wmin*1;
th = 0;
qc.Th0 = 1*[th;th;-th;-th]*pi/180;
%% lims
qc.Th_dot_lim = inf;
qc.W_lim = inf;

%% saturations
qc.r_sat_lim = 10;
qc.w_des_sat_lim = pi;

qc.draw_tick = 0.1;
qc.control_delay = 100e-4;

%% sensors noise
x = clock;
x = x(6)*1e4;
qc.seed = mod(x, 31*19*17);

qc.r_snr = 50;
qc.v_snr = 100;
qc.q_snr = 5000;
qc.omega_snr = 5000;
qc.W_snr = 50;
qc.Th_snr = 50;

%% calman
out_d = 13;
in_d = 19;

v_dot0 = [0;0;0];
omegaB_dot0 = [0;0;0];
qc.x0 = [qc.r0; qc.v0; qc.qBI0; qc.omegaB0; v_dot0; omegaB_dot0];
qc.H = eye(in_d);
qc.H = qc.H(1:out_d,:);

Qr = 1e-1*[1 1 1];
Qv = 1e-1*[1 1 1];
Qquat = 1e-1*[1 1 1 1];
Qomega = 1e-1*[1 1 1];
Qvdot = 1e-1*[1 1 1];
Qomegadot = 1e-1*[1 1 1];
qc.Q = diag([Qr Qv Qquat Qomega Qvdot Qomegadot]);

Pr = 1*[1 1 1];
Pv = 1*[1 1 1];
Pquat = 1*[1 1 1 1];
Pomega = 1*[1 1 1];
Pvdot = 1*[1 1 1];
Pomegadot = 1*[1 1 1];
qc.P0 = 1e-6*diag([Pr Pv Pquat Pomega Pvdot Pomegadot]);

Rr = 1e-4*[1 1 1];
Rv = 1e-4*[1 1 1];
Rquat = 1e-4*[1 1 1 1];
Romega = 5*1e-4*[1 1 1];
qc.R = diag([Rr Rv Rquat Romega]);
