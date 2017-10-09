% hold on
% req_f = [1;1;1];
% lim_req_f = req_f;
% 
% th_lim = pi/3;
% step = th_lim/30;
% 
% fmax = 1;
% fz = 0.4;
% if fz < fmax*cos(th_lim)
%     fh = 0.5*fz*tan(th_lim);
% else
%     c = (fz)/fmax;
%     s = sqrt(1-c*c);
%     fh = fmax*s/2;
% end
% plot(fh, fz, '*r');
% 
% k = 0;
% for th = -th_lim : step : th_lim
%     k = k + 1;
%     thrust = [0.5*sin(th); 1*cos(th)];
% %     thrusts(1:2, k) = thrust;
%     plot([0 thrust(1)], [0 thrust(2)], 'b')
% end
% xlim([-0.5 0.5]);
% ylim([0 1]);
% 
% xsq = [1 0 -1 0 1]*fh;
% ysq = [0 1 0 -1 0]*fh;
% plot(xsq, ysq)
% 
% for i=2:4
%     seg1 = [xsq(i-1) ysq(i-1) xsq(i) ysq(i)];
%     seg2 = [0 0 req_f(1) req_f(2)];
%     res = lineSegmentIntersect(seg1, seg2);
%     if res.intAdjacencyMatrix == 1
%         req_f(1) = res.intMatrixX;
%         req_f(2) = res.intMatrixY;
%     end
% end
% plot(req_f(1), req_f(2), '*r'); 
% 
clc
 lim_req_f  = lim_req_force( [20;20;30], pi/3, 20 , 0.66)
