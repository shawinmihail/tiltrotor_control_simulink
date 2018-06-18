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
qc.rot_dirs = [1;-1;1;-1];

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
qc.vertical_acc_max = min(5, (qc.tw-1.15)*abs(qc.g(3))); % at least 15% for horizontal thrust
qc.vertical_acc_min = -qc.vertical_acc_max;

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

%% force&torqs lim
qc.torq_h_lim = 0.1;
qc.torq_v_lim = 2;
qc.acc_v_lim = 3;
qc.acc_h_lim = 3;

gN = abs(qc.g(3));
qc.f_v_max_lim = qc.m*(gN + qc.acc_v_lim);
qc.f_v_min_lim = qc.m*(gN - qc.acc_v_lim);
qc.f_h_lim_bound = qc.acc_h_lim*qc.m;
qc.t3_typical = qc.m*gN*qc.b/2/qc.k;
qc.f_h_lim = xflLimits( qc.t3_typical, qc.f_v_max_lim, qc.f_h_lim_bound, qc.torq_h_lim, qc.torq_v_lim, qc.W_lim, qc.Th_lim);



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
jacobian_own( qc.rays, qc.rot_dirs, qc.k, qc.b, qc.l)
jacobian_torque_advanced( qc.rays, qc.rot_dirs, qc.k, qc.b, qc.l, qc.I_P(3,3), qc.time_step)

%%
thlim = qc.Th_lim
wlim = sqrt(qc.W_lim)
