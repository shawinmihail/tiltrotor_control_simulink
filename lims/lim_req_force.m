function [ h_force_lim, lim_req_f ] = lim_req_force( req_f, th_lim, forse_lim, v_force_max,  v_force_min)
lim_req_f = req_f;
lim_req_f(3) = set_between(lim_req_f(3), v_force_max, v_force_min);

if lim_req_f(3) < forse_lim*cos(th_lim)
    h_force_lim = req_f(3)*tan(th_lim)/2;
else
    c = lim_req_f(3)/forse_lim;
    s = sqrt(1-c*c);
    h_force_lim = forse_lim*s/2;
end

f_h = [lim_req_f(1);lim_req_f(2)];
f_h = h_force_lim*f_h/norm(f_h);
er = [1;0];
phi = acos(dot(er, f_h)/norm(f_h));
cphi = mod(phi-pi/4, pi/2);
if cphi < pi/4
    k = 1/cos(cphi);
else
    k = 1/sin(cphi);
end
fit_force = k*f_h/sqrt(2);
if norm(lim_req_f(1:2, 1)) > norm(fit_force)
    lim_req_f(1:2, 1) = fit_force;
end

%%
% cla(gca)
% hold on
% xsq = [1 0 -1 0 1]*h_force_lim;
% ysq = [0 1 0 -1 0]*h_force_lim;
% plot(xsq, ysq);
% % step = th_lim/3;
% % for th = -th_lim : step : th_lim
% %     plot3([0 0.5*forse_lim*sin(th)], [0 0], [0 forse_lim*cos(th)], 'b')
% %     plot3([0 0], [0 0.5*forse_lim*sin(th)], [0 forse_lim*cos(th)], 'b')
% % end
% plot3(lim_req_f(1), lim_req_f(2), lim_req_f(3), '*g')
% plot3([0 req_f(1)], [0 req_f(2)], [0 req_f(3)], 'r');
% xlim([-50, 50]);
% ylim([-50, 50]);
% zlim([0, 50]);
end

