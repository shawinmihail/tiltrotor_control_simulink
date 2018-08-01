clc
clear
close all

%% original

% syms k b l
syms f1 f2 f3 t1 t2 t3
k = 1.13e-5;
b = 1.5*1e-6;
l = 0.25;

W1 = -(b^2*f2^2 + b^2*f3^2 - 2*b*f2*k*t2 - 2*b*f3*k*t3 + f2^2*k^2*l^2 + 2*f2*k^2*l*t3 + f3^2*k^2*l^2 - 2*f3*k^2*l*t2 + k^2*t2^2 + k^2*t3^2)^(1/2)/(2*k^2*l);
W3 = -(b^2*f2^2 + b^2*f3^2 - 2*b*f2*k*t2 - 2*b*f3*k*t3 + f2^2*k^2*l^2 - 2*f2*k^2*l*t3 + f3^2*k^2*l^2 + 2*f3*k^2*l*t2 + k^2*t2^2 + k^2*t3^2)^(1/2)/(2*k^2*l);
W2 =  (b^2*f1^2 + b^2*f3^2 + 2*b*f1*k*t1 + 2*b*f3*k*t3 + f1^2*k^2*l^2 - 2*f1*k^2*l*t3 + f3^2*k^2*l^2 + 2*f3*k^2*l*t1 + k^2*t1^2 + k^2*t3^2)^(1/2)/(2*k^2*l);
W4 =  (b^2*f1^2 + b^2*f3^2 + 2*b*f1*k*t1 + 2*b*f3*k*t3 + f1^2*k^2*l^2 + 2*f1*k^2*l*t3 + f3^2*k^2*l^2 - 2*f3*k^2*l*t1 + k^2*t1^2 + k^2*t3^2)^(1/2)/(2*k^2*l);

Th1 = 2*atan((-b*f2 + k*t2 + (b^2*f2^2 + b^2*f3^2 - 2*b*f2*k*t2 - 2*b*f3*k*t3 + f2^2*k^2*l^2 + 2*f2*k^2*l*t3 + f3^2*k^2*l^2 - 2*f3*k^2*l*t2 + k^2*t2^2 + k^2*t3^2)^(1/2) - f3*k*l)/(b*f3 - k*t3 - f2*k*l));
Th3 = 2*atan((b*f2 - k*t2 + (b^2*f2^2 + b^2*f3^2 - 2*b*f2*k*t2 - 2*b*f3*k*t3 + f2^2*k^2*l^2 - 2*f2*k^2*l*t3 + f3^2*k^2*l^2 + 2*f3*k^2*l*t2 + k^2*t2^2 + k^2*t3^2)^(1/2) - f3*k*l)/(b*f3 - k*t3 + f2*k*l));
Th2 =  2*atan((b*f1 + k*t1 - (b^2*f1^2 + b^2*f3^2 + 2*b*f1*k*t1 + 2*b*f3*k*t3 + f1^2*k^2*l^2 - 2*f1*k^2*l*t3 + f3^2*k^2*l^2 + 2*f3*k^2*l*t1 + k^2*t1^2 + k^2*t3^2)^(1/2) + f3*k*l)/(b*f3 + k*t3 - f1*k*l));
Th4 = 2*atan((-b*f1 - k*t1 - (b^2*f1^2 + b^2*f3^2 + 2*b*f1*k*t1 + 2*b*f3*k*t3 + f1^2*k^2*l^2 + 2*f1*k^2*l*t3 + f3^2*k^2*l^2 - 2*f3*k^2*l*t1 + k^2*t1^2 + k^2*t3^2)^(1/2) + f3*k*l)/(b*f3 + k*t3 + f1*k*l));

matlabFunction(W1, 'file', 'generated/solutionW1.m');
matlabFunction(W2, 'file', 'generated/solutionW2.m');
matlabFunction(W3, 'file', 'generated/solutionW3.m');
matlabFunction(W4, 'file', 'generated/solutionW4.m');
matlabFunction(Th1, 'file', 'generated/solutionTh1.m');
matlabFunction(Th2, 'file', 'generated/solutionTh2.m');
matlabFunction(Th3, 'file', 'generated/solutionTh3.m');
matlabFunction(Th4, 'file', 'generated/solutionTh4.m');

return
%% show original

if (0)

k_= 1e-5;
b_= 1e-6;
l_ = 0.3;
    
f3_ = (15 + 45*rand())/2;
t3min = -10;
t3max = 10;
f1_ = 30*(rand() - 0.5);
f2_ = 30*(rand() - 0.5);
t1_ = rand() - 0.5;
t2_ = rand() - 0.5;

i=1;
W1_ = subs(W1, [k b l f1 f2 f3 t1 t2], [k_ b_ l_ f1_ f2_ f3_ t1_ t2_]);
W2_ = subs(W2, [k b l f1 f2 f3 t1 t2], [k_ b_ l_ f1_ f2_ f3_ t1_ t2_]);
W3_ = subs(W3, [k b l f1 f2 f3 t1 t2], [k_ b_ l_ f1_ f2_ f3_ t1_ t2_]);
W4_ = subs(W4, [k b l f1 f2 f3 t1 t2], [k_ b_ l_ f1_ f2_ f3_ t1_ t2_]);
Th1_ = subs(Th1, [k b l f1 f2 f3 t1 t2], [k_ b_ l_ f1_ f2_ f3_ t1_ t2_]);
Th2_ = subs(Th2, [k b l f1 f2 f3 t1 t2], [k_ b_ l_ f1_ f2_ f3_ t1_ t2_]);
Th3_ = subs(Th3, [k b l f1 f2 f3 t1 t2], [k_ b_ l_ f1_ f2_ f3_ t1_ t2_]);
Th4_ = subs(Th4, [k b l f1 f2 f3 t1 t2], [k_ b_ l_ f1_ f2_ f3_ t1_ t2_]);

i = 1;
for t3_ = t3min:0.1:t3max
    plotW1(i) = double(subs(W1_, t3, t3_));
    plotW2(i) = double(subs(W2_, t3, t3_));
    plotW3(i) = double(subs(W3_, t3, t3_));
    plotW4(i) = double(subs(W4_, t3, t3_));
    plotTh1(i) = double(subs(Th1_, t3, t3_));
    plotTh2(i) = double(subs(Th2_, t3, t3_));
    plotTh3(i) = double(subs(Th3_, t3, t3_));
    plotTh4(i) = double(subs(Th4_, t3, t3_));
    plott3(i) = t3_;
    i = i + 1;
end

hold on
grid on
plot(plott3,plotW1,'r')
plot(plott3,plotW3,'g')
plot(plott3,plotW2,'r--')
plot(plott3,plotW4,'g--')
figure
hold on
grid on
plot(plott3,plotTh1,'r')
plot(plott3,plotTh3,'g')
plot(plott3,plotTh2,'r--')
plot(plott3,plotTh4,'g--')

return
end

%% simplify

underSqrtW1 = b^2*f2^2 + b^2*f3^2 - 2*b*f2*k*t2 - 2*b*f3*k*t3 + f2^2*k^2*l^2 + 2*f2*k^2*l*t3 + f3^2*k^2*l^2 - 2*f3*k^2*l*t2 + k^2*t2^2 + k^2*t3^2;
underSqrtW3 = b^2*f2^2 + b^2*f3^2 - 2*b*f2*k*t2 - 2*b*f3*k*t3 + f2^2*k^2*l^2 - 2*f2*k^2*l*t3 + f3^2*k^2*l^2 + 2*f3*k^2*l*t2 + k^2*t2^2 + k^2*t3^2;
underSqrtW2 = b^2*f1^2 + b^2*f3^2 + 2*b*f1*k*t1 + 2*b*f3*k*t3 + f1^2*k^2*l^2 - 2*f1*k^2*l*t3 + f3^2*k^2*l^2 + 2*f3*k^2*l*t1 + k^2*t1^2 + k^2*t3^2;
underSqrtW4 = b^2*f1^2 + b^2*f3^2 + 2*b*f1*k*t1 + 2*b*f3*k*t3 + f1^2*k^2*l^2 + 2*f1*k^2*l*t3 + f3^2*k^2*l^2 - 2*f3*k^2*l*t1 + k^2*t1^2 + k^2*t3^2;
underAtanTh1 = (-b*f2 + k*t2 + (b^2*f2^2 + b^2*f3^2 - 2*b*f2*k*t2 - 2*b*f3*k*t3 + f2^2*k^2*l^2 + 2*f2*k^2*l*t3 + f3^2*k^2*l^2 - 2*f3*k^2*l*t2 + k^2*t2^2 + k^2*t3^2)^(1/2) - f3*k*l)/(b*f3 - k*t3 - f2*k*l);
underAtanTh3 = (b*f2 - k*t2 + (b^2*f2^2 + b^2*f3^2 - 2*b*f2*k*t2 - 2*b*f3*k*t3 + f2^2*k^2*l^2 - 2*f2*k^2*l*t3 + f3^2*k^2*l^2 + 2*f3*k^2*l*t2 + k^2*t2^2 + k^2*t3^2)^(1/2) - f3*k*l)/(b*f3 - k*t3 + f2*k*l);
underAtanTh2 = (b*f1 + k*t1 - (b^2*f1^2 + b^2*f3^2 + 2*b*f1*k*t1 + 2*b*f3*k*t3 + f1^2*k^2*l^2 - 2*f1*k^2*l*t3 + f3^2*k^2*l^2 + 2*f3*k^2*l*t1 + k^2*t1^2 + k^2*t3^2)^(1/2) + f3*k*l)/(b*f3 + k*t3 - f1*k*l);
underAtanTh4 = (-b*f1 - k*t1 - (b^2*f1^2 + b^2*f3^2 + 2*b*f1*k*t1 + 2*b*f3*k*t3 + f1^2*k^2*l^2 + 2*f1*k^2*l*t3 + f3^2*k^2*l^2 - 2*f3*k^2*l*t1 + k^2*t1^2 + k^2*t3^2)^(1/2) + f3*k*l)/(b*f3 + k*t3 + f1*k*l);


B1 = (b*f3 - k*t3 - f2*k*l);
B3 = (b*f3 - k*t3 + f2*k*l);
B2 = (b*f3 + k*t3 - f1*k*l);
B4 = (b*f3 + k*t3 + f1*k*l);

A1 = (f3*k*l + b*f2 - k*t2);
A3 = (f3*k*l - b*f2 + k*t2);
A2 = (f3*k*l + b*f1 + k*t1);
A4 = (f3*k*l - b*f1 - k*t1);

%% check: if 0 -- ok

if (1)
    
checkW1 = simplify(underSqrtW1 - A1^2 - B1^2);
checkW3 = simplify(underSqrtW3 - A3^2 - B3^2);
checkW2 = simplify(underSqrtW2 - A2^2 - B2^2);
checkW4 = simplify(underSqrtW4 - A4^2 - B4^2);

checkTh1 = simplify((underAtanTh1*B1 + A1)^2 - A1^2 - B1^2);
checkTh3 = simplify((underAtanTh3*B3 + A3)^2 - A3^2 - B3^2);
checkTh2 = simplify((underAtanTh2*B2 - A2)^2 - A2^2 - B2^2);
checkTh4 = simplify((underAtanTh4*B4 - A4)^2 - A4^2 - B4^2);

% checkSignTh1 = simplify((underAtanTh1*B1 + A1))
% checkSignTh3 = simplify((underAtanTh3*B3 + A3))
% checkSignTh2 = simplify((underAtanTh2*B2 - A2))
% checkSignTh4 = simplify((underAtanTh4*B4 - A4))
end

%% chek on sign before sqrt and before Ai!
W1simple = -(A1^2 + B1^2)^(1/2)/(2*k^2*l);
W3simple = -(A3^2 + B3^2)^(1/2)/(2*k^2*l);
W2simple =  (A2^2 + B2^2)^(1/2)/(2*k^2*l);
W4simple =  (A4^2 + B4^2)^(1/2)/(2*k^2*l);

Th1simple = (-A1 + (A1^2 + B1^2)^(1/2))/B1;
Th3simple = (-A3 + (A3^2 + B3^2)^(1/2))/B3;
Th2simple = ( A2 - (A2^2 + B2^2)^(1/2))/B2;
Th4simple = ( A4 - (A4^2 + B4^2)^(1/2))/B4;


%% shwow simpled
if (0)
syms f(x, y)
f(x, y)= ( x - (x^2 + y^2)^(1/2))/y;
fsurf(f(x, y), [-1 1]);
xlabel('A');
ylabel('B');
zlabel('D');
return
end

%% plot polar limits
if (0)
syms phi a
D = (cos(phi) - 1) / sin(phi);
fplot(D, [-1 1]*pi*2)
grid on
xlabel('\phi')
ylabel('D(\phi)')
xticks([-2*pi -3*pi/2 -pi -1*pi/2 0  1*pi/2 pi 3*pi/2 2*pi])
xticklabels({'-2\pi' '-1.5\pi' '-\pi' '-0.5\pi' '0' '0.5\pi' '\pi' '1.5\pi' '2\pi'})
return
end

%% find lims
k_= 1e-5;
b_= 1e-6;
l_ = 0.3;

W_ = 2e6;
Th_ = pi/3;

X1 = A1*tan(Th_) - abs(B1);
Y1 = 2*l_*k*k_*W_*sqrt(2) - abs(A1) + abs(B1);
X3 = A3*tan(Th_) - abs(B3);
Y3 = 2*l_*k*k_*W_*sqrt(2) - abs(A3) + abs(B3);

X2 = A2*tan(Th_) - abs(B2);
Y2 = 2*l_*k*k_*W_*sqrt(2) - abs(A2) + abs(B2);
X4 = A4*tan(Th_) - abs(B4);
Y4 = 2*l_*k*k_*W_*sqrt(2) - abs(A4) + abs(B4);

y0 = [0 0 35 0 0 0];
d = [1 1 1 0.05 0.05 0.05];
d = d / norm(d)

ends = 0;
a_star = -1;

for a = 15:1:18
    
    disp(a)
    
    ps = permn([1 -1], 6);
    s = size(ps);
    
    for i = 1:s(1)
        p = ps(i, :);
        y = a * d .* p + y0;
        
        f3_13 = y(3)/2;
        f3_24 = y(3)/2;
        T = 6;
        t3_13 =  T + y(6)/2;
        t3_24 = -T - y(6)/2;
        
        subX1 = subs(X1, [k b l f1 f2 f3 t1 t2 t3], [k_ b_ l_ y(1) y(2) f3_13 y(4) y(5) t3_13]);
        subY1 = subs(Y1, [k b l f1 f2 f3 t1 t2 t3], [k_ b_ l_ y(1) y(2) f3_13 y(4) y(5) t3_13]);
        subX3 = subs(X3, [k b l f1 f2 f3 t1 t2 t3], [k_ b_ l_ y(1) y(2) f3_13 y(4) y(5) t3_13]);
        subY3 = subs(Y3, [k b l f1 f2 f3 t1 t2 t3], [k_ b_ l_ y(1) y(2) f3_13 y(4) y(5) t3_13]);
        
        subX2 = subs(X2, [k b l f1 f2 f3 t1 t2 t3], [k_ b_ l_ y(1) y(2) f3_24 y(4) y(5) t3_24]);
        subY2 = subs(Y2, [k b l f1 f2 f3 t1 t2 t3], [k_ b_ l_ y(1) y(2) f3_24 y(4) y(5) t3_24]);
        subX4 = subs(X4, [k b l f1 f2 f3 t1 t2 t3], [k_ b_ l_ y(1) y(2) f3_24 y(4) y(5) t3_24]);
        subY4 = subs(Y4, [k b l f1 f2 f3 t1 t2 t3], [k_ b_ l_ y(1) y(2) f3_24 y(4) y(5) t3_24]);
        
        checkX1 = double(subX1) < 0;
        checkY1 = double(subY1) < 0;
        checkX2 = double(subX2) < 0;
        checkY2 = double(subY2) < 0;
        checkX3 = double(subX3) < 0;
        checkY3 = double(subY3) < 0;
        checkX4 = double(subX4) < 0;
        checkY4 = double(subY4) < 0;
        
        if checkX1+checkY1+checkX2+checkY2+checkX3+checkY3+checkX4+checkY4 > 0
            a_star = a;
            ends = 1;
            break;
        end
    end
    if ends
        break
    end
end
a_star
lims = a_star*d