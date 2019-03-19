clc
clear
%%
syms k b l q
% k = 1e-5;
% b = 3e-6;
% l = 0.25;

W = sym('W', [4 1]);
Th = sym('Th', [4 1]);
f = sym('f', [3 1]);
% f = [5; 10; 40];
F = zeros(6,1);
ex = [1;0;0];


% assume([k b l],'real')
rot_dirs = [1;-1;1;-1];
rays =  [1;1;0;
         -1;1;0;
         -1;-1;0
          1;-1;0];
%% J
for i = 1:4
%     th = sign(2.5-i)*Th(2-mod(i,2));
    th = Th(i);
    w = W(i);
    dir = rot_dirs(i);
    ray = rays(3*i-2:3*i);
    cosAlpha = dot(ex, ray/norm(ray));
    alpha = acos(cosAlpha);
    if(ray(2) < 0)
        alpha = -alpha;
    end
%     w = 1;
%     if i == 2 || i == 4
%         w=0;
%     end
    J(1, i) = k*(dir*sin(th)*sin(alpha));
    J(2, i) = k*(-dir*sin(th)*cos(alpha));
    J(3, i) = k*(dir*cos(th));
    J(4, i) = k*l*(dir*cos(th)*sin(alpha)) + 1*b*(-sin(th)*sin(alpha));
    J(5, i) = k*l*(-dir*cos(th)*cos(alpha)) + 1*b*(+sin(th)*cos(alpha));
    J(6, i) = k*l*(-dir*sin(th)) + 1*b*(-cos(th));
    F = F + J(:,i);
end
J * [1 0 0 1]'
