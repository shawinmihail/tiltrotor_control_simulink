clc
clear all
%%
% syms k b l q
k = 1e-5;
b = 3e-6;
l = 0.25;

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

% f = [4*(10*rand()-5); 4*(10*rand()-5); 30+10*rand()];
% t = [2*(rand()-0.5); 2*(rand()-0.5); 2*(rand()-0.5)];
% Y = [f;t];
% Y = Y/norm(Y)
% for k = 1:4
% X = J(:,k);
% % syms eq
% % eq = 0;
% % for i=1:6
% %     eq = eq + (X(i)-Y(i))^2;
% % end
% v_min = 1e16;
% V_min = 1e16;
% t_min = 1e16;
% hold on
% for th = -pi/3:pi/33:pi/3
%     V = double(subs(X, Th(k), th));
%     V =  V/norm(V);
%     v = norm((V - Y));
%     scatter(th, v)
%     if v_min > v
%         v_min = v;
%         th_min = th;
%         V_min = V;
%     end
% end
% Y;
% th_min
% % V_min
% Y = Y - V_min;
% end
% Y

% weight = 0.0000001;
% Y = [f;weight*t];
% for k = 1:4
% wK = W(k);
% thK = Th(k);
% X = J(:,k)*wK;
% X(3:6) = X(3:6)*weight;
% syms eq
% eq = 0;
% for i=1:6
%     eq = eq + (X(i)-Y(i))^2;
% end
% min = 1e16;
% w_min = 1e16;
% t_min = 1e16;
% for w = 3e5:1e5:1e6
%     for th = -pi/3:pi/20:pi/3
%         v = double(subs(eq, [wK thK], [w th]));
% %         scatter3(th, w, v)
%         if min > v
%             min = v;
%             w_min = w;
%             th_min = th;
%         end
%     end
% end
% w_min;
% th_min;
% dY = double(subs(X, [wK thK], [w_min th_min]));
% Y = Y - dY;
% end
% Y
% Y-Y0

% q = sqrt(2)/2;
% ef1 = [q*sin(Th(1));-q*sin(Th(1));cos(Th(1))];
% ef2 = [-q*sin(Th(2));-q*sin(Th(2));-cos(Th(2))];
% et1 = [q*l*cos(Th(1));-q*l*cos(Th(1));-l*sin(Th(1))];
% et2 = [-q*l*cos(Th(2));-q*l*cos(Th(2));l*sin(Th(2))];
% syms f1 f2 f3
% f = [f1 f2 f3];
% assume(f, 'real');
% 
% v_cross = cross(ef1, ef2);
% a_dot = dot(f, v_cross);
% eq_tg = 0 == f(1)*(q*tan(Th(2)) + q*tan(Th(1))) - f(2)*(q*tan(Th(2)) - q*tan(Th(1))) - 2*f3*q^2*tan(Th(1))*tan(Th(2));
% s = solve(eq_tg, Th(1));
% matlabFunction(s, 'file', 'tests/Th1');
% 
% % th2 = rand()
% hold on
% grid on
% f = [4*(10*rand()-5); 4*(10*rand()-5); 30+10*rand()]
% t = [2*(rand()-0.5); 2*(rand()-0.5); 2*(rand()-0.5)]
% for th2=-pi/2:pi/20:pi/2
% syms wp1 wp2 wm1 wm2
% ef1 = [q*sin(Th(1));-q*sin(Th(1));cos(Th(1))];
% ef2 = [-q*sin(Th(2));-q*sin(Th(2));-cos(Th(2))];
% et1 = [q*l*cos(Th(1));-q*l*cos(Th(1));-l*sin(Th(1))];
% et2 = [-q*l*cos(Th(2));-q*l*cos(Th(2));l*sin(Th(2))];
% 
% th1 = Th1(th2, f(1), f(2), f(3));
% ef1 = subs(ef1, th1);
% ef2 = subs(ef2, th2);
% et1 = subs(et1, th1);
% et2 = subs(et2, th2);
% v_cross = double(cross(ef1, ef2));
% % check = double(dot(f, v_cross));
% 
% eq_wp =  k*ef1(1:2)*wp1+k*ef2(1:2)*wp2 == f(1:2);
% s = solve(eq_wp,[wp1, wp2]);
% if isempty(s.wp1)
%     'cant resolve'
%     continue
% end
% wp1 = double(s.wp1);
% wp2 = double(s.wp2);
% plot(th2, wp1, 'b*')
% plot(th2, wp2, 'g*')
% % check = double(k*ef1(3)*wp1+k*ef2(3)*wp2 - f(3));
% 
% eq_wm = k*et1*wm1 + k*et2*wm2 - b*ef1*wp1 + b*ef2*wp2 == t;
% s = solve(eq_wm(1:2),[wm1, wm2]);
% wm1 = double(s.wm1);
% wm2 = double(s.wm2);
% n = 3;
% y = double(k*et1(n)*wm1 + k*et2(n)*wm2 - b*ef1(n)*wp1 + b*ef2(n)*wp2 - t(n));
% if isempty(y)
%     'cant resolve'
%     continue
% end
% plot(th2, y*5e5, 'r*')
% end



% syms wp wm1 wm2 t1 t2 t3
% f = [10*rand(); 10*rand(); 40 + rand()];
% % t = [t1; t2; t3];
% t = [rand(); rand(); rand()];
% k1 = (f(1)-f(2))/q/k;
% k2 = -(f(1)+f(2))/q/k;
% k3 = f(3)/k;
% P = 2*atan((k1-k2)/k3);
% M = 2*atan((k1+k2)/k3);
% th1 = (P + M)/2;
% th2 = (P - M)/2;
% 
% ef1 = subs(ef1, Th(1), th1);
% ef2 = subs(ef2, Th(2), th2);
% et1 = subs(et1, Th(1), th1);
% et2 = subs(et2, Th(2), th2);
% eq = b*(ef1-ef2)*wp + k*et1*wm1 + k*et2*wm2 == t;
% eq = vpa(eq)*1e6;
% x = solve(eq, [wp, wm1, wm2]);
% P = x.wp;
% M1 = x.wm1;
% M2 = x.wm2;
% w1 = (P + M1)/2;
% w3 = (P - M1)/2;
% w2 = (-P + M2)/2;
% w4 = (-P - M2)/2;
% 
% J = J_fcn(th1, th2, -th1, -th2);
% Jt = J(4:6,:);
% eq_add = k*[1 1 1 1];
% A = [eq_add; Jt];
% W = pinv(A)*[norm(f);t];
% [f;t]-J*W

% F(1) - F(2)
% F(1) + F(2)
% F(3)