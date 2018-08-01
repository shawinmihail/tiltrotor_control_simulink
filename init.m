addpath(genpath(pwd))
clear
clc
close all
 
%% X
qc.l = 0.25;  
qc.rays =  [1;1;0;
          -1;1;0;
           -1;-1;0
           1;-1;0];

for i = 1:4
    qc.rays(3*i-2:3*i) = qc.l*qc.rays(3*i-2:3*i)/norm(qc.rays(3*i-2:3*i));
end
qc.rot_dirs = [-1;1;-1;1];

%% dyn
qc.g = [0;0;-9.81]*1;
qc.m = 3.6;
qc.I_B =  [0.0348 0 0
          0 0.0420 0
          0 0 0.0685];
      
qc.I_P = 1*[8.450 0 0
          0 8.450 0
          0 0 4.580]*1e-9;
      
%% aerodyn
qc.k = 1.13e-5;
qc.b = 1.5*1e-6;
qc.S = 40*30*1e-4;
qc.c = 1.05;
qc.ro = 1;

%% constraints
qc.tw = 2.0;
qc.max_tw = qc.tw+0.2;
qc.Th_lim = 40*pi/180;
qc.Th_dot_lim = 6;
qc.W_lim = 0.8*qc.tw*abs(qc.m*qc.g(3))/(4*qc.k);
qc.W_lim_max_tw = qc.max_tw*abs(qc.m*qc.g(3))/(4*qc.k);
qc.w_dot_lim = 0.5 * qc.b*qc.W_lim / qc.I_P(3,3); % tau max = -b*Wmax

%% error lims
qc.r_error_lim = 20;
qc.rdot_error_lim = 16;
qc.r2dot_error_lim = 3;
qc.omega_error_lim = 1.5;
qc.omegadot_error_lim = 1.5;

%% des lim
qc.rdot_des_lim = 20;
qc.r2dot_des_lim = 1*qc.tw*abs(qc.g(3))/qc.m;
qc.w_des_lim = pi;
qc.wdot_des_lim = pi/2;

%% init pose
qc.r0 = 0*[0;0;0];
qc.v0 = 0*[0.47;0.94;0];
alpha = 0*pi/2;
pin = [0;0;-1];
qc.qBI0 = [cos(alpha/2);pin*sin(alpha/2)];
qc.qBI0 = [0.8507;0;0;0.5257];
qc.qBI0 = [1;0;0;0];
qc.omegaB0 = 0*[1;0;1]*2*pi;
wg = abs(qc.m*qc.g(3))/(4*qc.k);
qc.W0 = 1*qc.rot_dirs*wg;
th = 0;
qc.Th0 = 0*[th;th;-th;-th]*pi/180;

%% simulation
qc.time_step = 10*(1e-3);
qc.draw_mode = 1;
qc.draw_tick = 0.1;


%% transfer cooefs
qc.Th_transfer_top = [0.4 6];
qc.Th_transfer_bot = [0.06 1 6];

%% generate
% generate_jacobian_own( qc.rays, qc.rot_dirs, qc.k, qc.b, qc.l)
% generate_jacobian_torque_advanced( qc.rays, qc.rot_dirs, qc.k, qc.b, qc.l, qc.I_P(3,3), qc.time_step)
generate_solution_MPMP(qc.k, qc.b, qc.l)
generate_jacobian_xfl(qc.k, qc.b, qc.l, qc.rot_dirs, qc.rays)

%% limits
d = [2.5 2.5 2.5 0.05 0.05 0.05]; % suppose v(1) = v(2), v(4) = v(5)
T0 = qc.m*norm(qc.g)*qc.b/2/qc.k; % torque from pair of motors in hover
F0 = qc.m*norm(qc.g); %thrust from all of motors in hover
a_range = [13 20];
step = 0.5;
% limits = find_limits_rectangle_MPMP(T0, F0, qc.k, qc.b, qc.l, qc.W_lim,  qc.Th_lim, d, a_range, step)
limits = [8.6585    8.6585    8.6585    0.1732    0.1732    0.1732];
qc.force_v_lim = limits(1);
qc.force_h_min = F0 - limits(3);
qc.force_h_max = F0 + limits(3);
qc.torq_balance_coeff = T0;
qc.torq_h_lim = limits(4);
qc.torq_v_lim = limits(6);


%%
thlim = qc.Th_lim;
wlim = sqrt(qc.W_lim);
