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
qc.H = eye(19);
for i = 4:6
    qc.H(i,i) = 0;
end
for i = 17:19
    qc.H(i,i) = 0;
end
qc.H = qc.H(1:13, :);

Qr = 1e-8*[1 1 1];
Qv = 1e-4*[1 1 1];
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
qc.P0 = 50*qc.Q;

Rr = 1e-6*[1 1 1];
Rv_dot = 1e0*[1 1 1];
Rquat = 1e-12*[1 1 1 1];
Romega = 1e-12*[1 1 1];
qc.R = diag([Rr Rv_dot Rquat Romega]);