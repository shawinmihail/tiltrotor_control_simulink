o33 = zeros(3, 3);
o34 = zeros(3, 4);
o43 = zeros(4, 3);
o44 = zeros(4, 4);
e33 = eye(3);
e44 = eye(4);



qc.ekf_x0 = [qc.r0; qc.v0; qc.qBI0; qc.omegaB0];
    
Q_r = 1e-6*[1 1 1];
Q_rdot = 1e-4*[1 1 1];
Q_quat = 1e-10*[1 1 1 1];
Q_omega = 1e-8*[1 1 1];
qc.ekf_Q = diag([Q_r Q_rdot Q_quat Q_omega]);

R_r = 1*1e-2*[1 1 1];
R_r2dot = 5*1e-4*[1 1 1];
R_quat = 1e-8*[1 1 1 1];
R_omega = 1e-10*[1 1 1];
qc.ekf_R = diag([R_r R_r2dot R_quat R_omega]);

% qc.ekf_R = diag([10e-4*[1 1 1]    5e-2*[1 1 1]    1e-6*[1 1 1 1]     1e-6*[1 1 1]]);
% qc.ekf_Q = diag([1*[1 1 1]    1*[1 1 1]    5e-3*[1 1 1 1]     5e-3*[1 1 1] ]);

qc.ekf_P0 = 100*qc.ekf_Q;

