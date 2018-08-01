function generate_solution_MPMP( k, b, l )

syms f1 f2 f3 t1 t2 t3

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
end

