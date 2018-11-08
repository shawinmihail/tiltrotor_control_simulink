qc.spkf_L = 13;
qc.spkf_yN = 13;
qc.spkf_alpha = 1e-5;
qc.spkf_beta = 2;
qc.spkf_kappa = 0;

qc.spkf_lambda = 3 - qc.spkf_L;
qc.spkf_gamma = sqrt(qc.spkf_L + qc.spkf_lambda);
qc.spkf_w0m = qc.spkf_lambda / (qc.spkf_L + qc.spkf_lambda);
qc.spkf_w0c = qc.spkf_w0m + (1 - qc.spkf_alpha*qc.spkf_alpha + qc.spkf_beta);
qc.spkf_wim = 1/(2*(qc.spkf_L+qc.spkf_lambda));
qc.spkf_wic = qc.spkf_wim;


qc.spkf_X0 = [qc.r0;    qc.v0;    qc.qBI0;    qc.omegaB0]';

qc.spkf_R0 = diag([5e-4*[1 1 1]    5e-4*[1 1 1]    1e-6*[1 1 1 1]     1e-8*[1 1 1]]);
qc.spkf_Q0 = diag([1*[1 1 1]    1*[1 1 1]    1e-4*[1 1 1 1]     1e-3*[1 1 1] ]);

% qc.spkf_R0 = qc.ekf_R;
% qc.spkf_Q0 = qc.ekf_Q;

qc.spkf_P0 = 100 * qc.spkf_Q0;