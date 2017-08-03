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
qc.seed = 100;

qc.r_snr = 55;
qc.v_snr = 55;
qc.vdot_snr = 55;
qc.q_snr = 55;
qc.omega_snr = 55;
% qc.W_snr = 50;
% qc.Th_snr = 50;


%% Kalman

% x = r rdot q omega
% z = r r2dot q omega
qc.x0 = [qc.r0; qc.v0; qc.qBI0; qc.omegaB0];

Q_r = 1e-6*[1 1 1];
Q_rdot = 1e-4*[1 1 1];
Q_quat = 1e-6*[1 1 1 1];
Q_omega = 1e-5*[1 1 1];
qc.Q = diag([Q_r Q_rdot Q_quat Q_omega]);

qc.P0 = 100*qc.Q;

R_r = 1e-4*[1 1 1];
R_r2dot = 1e-4*[1 1 1];
R_quat = 1e-8*[1 1 1 1];
R_omega = 1e-4*[1 1 1];
qc.R = diag([R_r R_r2dot R_quat R_omega]);