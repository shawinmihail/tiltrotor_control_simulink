% clear
% W = 1:500^2;
% kh1 = 1;
% kh2 = 1;
% wrest = 200^2;
% wmin = 100^2;
% g1 = pi/(2*(wrest-wmin));
% g2 = -g1*wrest;
% k= 1;
% 
% for i=110^2:160^2
%     w = abs(W(i));
%     if w > wrest
%         z(i) = kh2*(w-wrest)^2;
%     elseif w > wmin
%         z(i) = kh1*(tan(g1*w+g2))^2;
%     else
%         z(i) = 0;
%     end
% end
% plot(z)

% syms kh1 kh2 w wrest pi wmin
% g1 = pi/(2*(wrest-wmin));
% g2 = -g1*wrest;
% f1 = kh2*(w-wrest)^2;
% f2 = kh1*(tan(g1*w+g2))^2;
% f11 = diff(f1, w)
% f22 = diff(f2, w)
% 


clear
W = 1:500^2;
kh1 = 1e2;
kh2 = 1e-2;
wrest = 200^2;
wmin = 100^2;
g1 = pi/(2*(wrest-wmin));
g2 = -g1*wrest;
k= 1;
for i=105^2:1:205^2
    w = abs(W(i));
    if w > wrest
        z(i) = kh2*(2*w - 2*wrest);
    elseif w > wmin
        z(i) = (2*kh1*pi*tan((w*pi)/(2*wmin - 2*wrest) - (wrest*pi)/(2*wmin - 2*wrest))*(tan((w*pi)/(2*wmin - 2*wrest) - (wrest*pi)/(2*wmin - 2*wrest))^2 + 1))/(2*wmin - 2*wrest);
    else
        z(i) = 1e4;
    end
end
z=-z;
plot(z)