close all
clc

path = '/img/';
save = 1;
s = 24;
w = 2;
width = 600;
height = 1400;

run('plotbuilder_traj');
run('plotbuilder_ekf_perf');
% return
run('plotbuilder_default');
run('plotbuilder_camera');
run('plotbuilder_control');
run('plotbuilder_error');


msg = 'FINISHED. Plot TRAGECTORY PLS!'
close all