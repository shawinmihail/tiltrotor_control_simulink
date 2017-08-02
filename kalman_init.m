o33 = zeros(3, 3);
o34 = zeros(3, 4);
o43 = zeros(4, 3);
o44 = zeros(4, 4);
e33 = eye(3);
e44 = eye(4);

%% sensors noise
x = clock;
x = x(6)*1e4;
qc.seed = mod(x, 31*19*17);

qc.r_snr = 50;
qc.v_snr = 1000;
qc.vdot_snr = 1000;
qc.q_snr = 1000;
qc.omega_snr = 1000;
% qc.W_snr = 50;
% qc.Th_snr = 50;


%% Kalman
v_dot0 = [0;0;0];
omegaB_dot0 = [0;0;0];
qc.x0 = [qc.r0; qc.v0; v_dot0; qc.qBI0; qc.omegaB0; omegaB_dot0];
qc.H = [e33 o33 o33 o34 o33 o33;
        o33 o33 e33 o34 o33 o33;
        o43 o43 o43 e44 o43 o43;
        o33 o33 o33 o34 e33 o33];

Qr = 2*1e-6*[1 1 1];
Qv = 2*1e-2*[1 1 1];
Qvdot = 1e-6*[1 1 1];
Qquat = 1e-12*[1 1 1 1];
Qomega = 1e-12*[1 1 1];
Qomegadot = 1e-12*[1 1 1];
qc.Q = diag([Qr Qv Qvdot Qquat Qomega  Qomegadot]);

Pr = 0*[1 1 1];
Pv = 0*[1 1 1];
Pvdot = 0*[1 1 1];
Pquat = 0*[1 1 1 1];
Pomega = 0*[1 1 1];
Pomegadot = 0*[1 1 1];
qc.P0 = 1*diag([Pr Pv Pvdot Pquat Pomega  Pomegadot]);
qc.P0 = 100*qc.Q;

Rr = 3*1e-6*[1 1 1];
Rv_dot = 3*1e-4*[1 1 1];
Rquat = 1e-8*[1 1 1 1];
Romega = 1e-8*[1 1 1];
qc.R = diag([Rr Rv_dot Rquat Romega]);