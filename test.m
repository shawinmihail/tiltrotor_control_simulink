clc
clear

% %% data
% ex = [1;0;0];
% ez = [0;0;1];
% 
% OmegaB = [0;0;0];
% OmegaB_dot = [0;0;1];
% Th = [0;0;0;0]*1;
% Th_dot = [0;0;0;0];
% W = [1;-1;1;-1];
% 
% IP = eye(3)*1e-5;
% IB = eye(3)*1e-3;
% 
% %% R_PB
% R_PB = zeros(12,3);
% for i=1:4
%     z=(i-1)*pi/2;
%     x = Th(i);
%     Rz = axang2rotm([0 0 1 z]);
%     Rx = axang2rotm([1 0 0 x]);
%     R_PB(3*i-2:3*i, 1:3) = Rz*Rx;
% end
% 
% %% omegaP
% omegaP = zeros(4*3,1);
% for i = 1:4
%     R = R_PB(3*i-2:3*i, 1:3);
%     w = sign(W(i))*sqrt(abs(W(i)));
%     omegaP(3*i-2:3*i, 1) = R'*OmegaB + [Th_dot(i); 0; w];
% end
% omegaP_dot = zeros(12,1);
% 
% %% rays
% l = 0.13;
% rays = l*[1;0;0;
%           0;1;0;
%           -1;0;0
%           0;-1;0;];
%  rot_dirs = [1;1;1;1];
% 
% %% tauB
% k = 1e-5;
% b = 1e-6;
% 
% tau = [0;0;0];
% F = [0;0;0];
% for i = 1:4
%     
%     ray = rays(3*i-2:3*i);
%     dir = rot_dirs(i);
%     omega_p = omegaP(3*i-2:3*i);
%     omega_pz = omega_p(3);
%     omega_p_dot = omegaP_dot(3*i-2:3*i);
%     R = R_PB(3*i-2:3*i, 1:3);
%    
%     fp = dir*[0;0;k*W(i)];
%     fb = R*fp;
%     
%     tau_p_ext = [0;0;-b*abs(omega_pz)*omega_pz];
%     tau_p = IP*omega_p_dot + cross(omega_p, IP*omega_p) - tau_p_ext;
%     tau_b = cross(ray, fb) - R*tau_p;
%     
%     tau = tau + tau_b;
%     F = F + fb;
% end
% 
% %% R2w
% R = magic(3);
% omega = [-R(2,3); R(1,3); -R(1,2)];
% 
% %% draw
% R_IB = R_PB(1:3, 1:3);
% 
% ex = [1;0;0];
% ey = [0;1;0];
% ez = [0;0;1];
% 
% x = R_IB*ex;
% y = R_IB*ey;
% z = R_IB*ez;
% 
% line ([0 x(1)], [0 x(2)], [0 x(3)], 'color', 'r')
% line ([0 y(1)], [0 y(2)], [0 y(3)], 'color', 'g')
% line ([0 z(1)], [0 z(2)], [0 z(3)], 'color', 'b')
% 
% scale = 1.5;
% axis([-scale scale -scale scale -scale scale]);
% xlabel('x');
% ylabel('y');
% zlabel('z');

%% other

% W = [0;0;0;0];
% Th = [0;0;0;0];
% k = 1;
% b = 1;
% r = 1; 
% R = eye(3,3);
% R_dot = R;
% m = 1;
% I_B = R;
% Z = [0;0;0;0;0;0;0;0];
% 
% 
% s = sin(Th);
% c = cos(Th);
% s1 = s(1);
% s2 = s(2);
% s3 = s(3);
% s4 = s(4);
% c1 = c(1);
% c2 = c(2);
% c3 = c(3);
% c4 = c(4);
% W1 = W(1);
% W2 = W(2);
% W3 = W(3);
% W4 = W(4);
% 
% f = [0, -k*s2, 0, k*s4;
%     -k*s1, 0, k*s3, 0;
%     k*c1, -k*c2, k*c3, - k*c4
%     ];
% 
% tau = [  0, -r*k*c2-b*s2, 0, r*k*c4+b*s4;
%        -r*k*c1+b*s1, 0, r*k*c3-b*s3, 0
%        -r*k*s1-b*c1, r*k*s2-b*c2, -r*k*s3-b*c3, r*k*s4-b*c4
%        ];
% 
% dfW = [0, -k*c2*W2, 0, k*c4*W4;
%       -k*c1*W1, 0, k*c3*W3, 0;
%      -k*s1*W2, k*s2*W2, -k*s3*W3, k*s4*W4
%      ];   
%    
% dtauW = [0, (r*k*s2-b*c2)*W2, 0, (-r*k*s4+b*c4)*W4;
%         (r*k*s1+b*c1)*W1, 0, (-r*k*s3-b*c3)*W3, 0
%         (-r*k*c1+b*s1)*W1, (r*k*c2+b*s2)*W2, (-r*k*c3+b*s3)*W3, (r*k*c4+b*s4)*W4
%         ];
%     
% J = [f;tau]; 
% dJW = [dfW;dtauW];
% J_r = [R/m, zeros(3,3);
%     zeros(3,3), I_B^(-1)];
% 
% A = J_r*[J, dJW];
% Arev = pinv(A);
% 
% F = (eye(8) - Arev*A)*Z;
% B = [R_dot/m*f*W; zeros(3,1)];

%%
R = eye(3)
eul = rotm2eul(R);
eul = eul'


