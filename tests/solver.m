% syms x a b c p
% 
% p = 1.2566;
% 
% x1 = 0;
% y1 = -0.5;
% 
% x2 = 2;
% y2 = 0;
% yd2 = p;
% 
% f1 = exp(a*x+b) + c;
% f2 = diff(f1);
% 
% eq1 = subs(f1, x1) == y1;
% eq2 = subs(f1, x2) == y2;
% eq3 = subs(f2, x2) == yd2;
% 
% s = solve([eq1, eq2 eq3], [a, b c]);
% s.a;
% s.b;
% s.c;

% syms x a b c p
% 
% p = 1.2566;
% x1 = 12;
% y1 = 0;
% yd1 = p;
% 
% x2 = 14;
% y2 = 0.5;
% 
% f = a*log(x+c)+b
% df = diff(f)
% 
% eq1 = subs(f, x1) == y1;
% eq2 = subs(df, x1) == yd1;
% eq3 = subs(f, x2) == y2;
% 
% s = solve([eq1 eq2 eq3], [a b c])
% 
% s.a
% s.b
% s.c


syms x a b c p

p = 1.2566;
x1 = 12;
y1 = 0;
yd1 = p;

x2 = 14;
y2 = 0.5;

f = -1/exp(a*(x-b)) + c
df = diff(f)

eq1 = subs(f, x1) == y1;
eq2 = subs(df, x1) == yd1;
eq3 = subs(f, x2) == y2;

s = solve([eq1 eq2 eq3], [a b c])

s.a
s.b
s.c