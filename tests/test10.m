syms z(t) w(t) a1 a2
eq1 = diff(z, t) == a1/sin(z);
s = dsolve(eq1);
pretty(s)

