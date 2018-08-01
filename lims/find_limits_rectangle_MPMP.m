function limits = find_limits_rectangle_MPMP( T_, F_, k_, b_, l_, W_,  Th_, d, a_range, step)

syms k b l
syms f1 f2 f3 t1 t2 t3

B1 = (b*f3 - k*t3 - f2*k*l);
B3 = (b*f3 - k*t3 + f2*k*l);
B2 = (b*f3 + k*t3 - f1*k*l);
B4 = (b*f3 + k*t3 + f1*k*l);

A1 = (f3*k*l + b*f2 - k*t2);
A3 = (f3*k*l - b*f2 + k*t2);
A2 = (f3*k*l + b*f1 + k*t1);
A4 = (f3*k*l - b*f1 - k*t1);

X1 = A1*tan(Th_) - abs(B1);
Y1 = 2*l_*k*k_*W_*sqrt(2) - abs(A1) + abs(B1);
X3 = A3*tan(Th_) - abs(B3);
Y3 = 2*l_*k*k_*W_*sqrt(2) - abs(A3) + abs(B3);

X2 = A2*tan(Th_) - abs(B2);
Y2 = 2*l_*k*k_*W_*sqrt(2) - abs(A2) + abs(B2);
X4 = A4*tan(Th_) - abs(B4);
Y4 = 2*l_*k*k_*W_*sqrt(2) - abs(A4) + abs(B4);

conditions_vector = [X1 X2 X3 X4 Y1 Y2 Y3 Y4];
for i = 1 : length(conditions_vector)
    f = subs(conditions_vector(i), [k b l], [k_ b_ l_]);
    name = sprintf('generated/limitCondition%1d.m ',i);
    matlabFunction(f, 'file', name);
end

y0 = [0 0 F_ 0 0 0];
d = d / norm(d);

ends = 0;
a_star = -1;
limits = 0;

for a = a_range(1):step:a_range(2)
    
    disp(a)
    
    ps = permn([1 -1], 6); %% finding all vertixes of 6-n cube
    s = size(ps);
    
    for i = 1:s(1)
        p = ps(i, :);
        y = a * d .* p + y0;
        
        f3_13 = y(3)/2;
        f3_24 = y(3)/2;
        t3_13 =  T_ + y(6)/2;
        t3_24 = -T_ - y(6)/2;
        
        subX1 = limitCondition1(y(2),f3_13,y(5),t3_13);
        subY1 = limitCondition3(y(2),f3_13,y(5),t3_13);
        subX3 = limitCondition5(y(2),f3_13,y(5),t3_13);
        subY3 = limitCondition7(y(2),f3_13,y(5),t3_13);
        
        subX2 = limitCondition2(y(1),f3_24,y(4),t3_24);
        subY2 = limitCondition4(y(1),f3_24,y(4),t3_24);
        subX4 = limitCondition6(y(1),f3_24,y(4),t3_24);
        subY4 = limitCondition8(y(1),f3_24,y(4),t3_24);
        
        checkX1 = double(subX1) < 0;
        checkY1 = double(subY1) < 0;
        checkX2 = double(subX2) < 0;
        checkY2 = double(subY2) < 0;
        checkX3 = double(subX3) < 0;
        checkY3 = double(subY3) < 0;
        checkX4 = double(subX4) < 0;
        checkY4 = double(subY4) < 0;
        
        if checkX1+checkY1+checkX2+checkY2+checkX3+checkY3+checkX4+checkY4 > 0
            a_star = a - step;
            ends = 1;
            break;
        end
    end
    if ends
        break
    end
end
limits = a_star*d;
end

