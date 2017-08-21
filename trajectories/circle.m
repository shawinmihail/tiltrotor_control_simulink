%% camera

radius = 4;
period = 1*2*pi/8;
phase = 0;
r_des = 1*[radius*sin(t*period+phase);radius*cos(t*period+phase);0];
eul_des = 1*[period*t;0;0*pi/180];
R_des = eul2rotm(eul_des');