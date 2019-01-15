clc
clear

%%
syms C m KrdotX KrdotY KrdotZ KrX KrY KrZ
assume([C m KrdotX KrdotY KrdotZ KrX KrY KrZ], 'real')
syms t rX(t) rdotX(t) rddotX(t) rY(t) rdotY(t) rddotY(t) rZ(t) rdotZ(t) rddotZ(t)
assume([t rX(t) rdotX(t) rddotX(t) rY(t) rdotY(t) rddotY(t) rZ(t) rdotZ(t) rddotZ(t)], 'real')
syms tau T rXtau rdotXtau rYtau rdotYtau rZtau rdotZtau rZT
assume([tau T rXtau rdotXtau rYtau rdotYtau rZtau rdotZtau rZT], 'real')
syms v
assume(v, 'real')
syms rZaim
assume(rZaim, 'real')
syms p1(t) p2(t) p3(t) p4(t)
assume([p1(t) p2(t) p3(t) p4(t)], 'real')
p = [p1; p2; p3; p4];
syms p1tau p2tau p3tau p4tau
assume([p1tau p2tau p3tau p4tau], 'real')
syms a1 a2 a3 a4
assume([a1 a2 a3 a4], 'real')
a = [a1 a2 a3 a4].';

%% eqs
x = [rX; rZ; rdotX; rdotZ];
fx = [rdotX; rdotZ; -KrdotX*rdotX; -KrdotZ*rdotZ + KrZ*(rZT-rZ)];
eq = diff(x) == fx;
s = dsolve(eq.', [rX(tau) == rXtau, rZ(tau) == rZtau, rdotX(tau) == rdotXtau, rdotZ(tau) == rdotZtau]);
xs = simplify([s.rX; s.rZ; s.rdotX; s.rdotZ])
return

%% p
H = dot(formula(p), formula(fx),1);
H = subs(H, x, a);
eq = diff(p,t) == -gradient(H, a);
s = dsolve(eq.', [p1(tau) == p1tau, p2(tau) == p2tau, p3(tau) == p3tau, p4(tau) == p4tau]);
ps = [s.p1; s.p2; s.p3; s.p4];
ps = subs(ps, a, x);

%%
F = rdotX^2 + rdodZ^2;
M = rZaim - rZ;

pT = -[0;0;2*rdotX;2*rdotZ] + [0;-1;0;0] * (2*rdotX*rddotX + 2*rdotZ*rddotZ); % by hands
return
x = [th;r;thdot;rdot];
fx = [thdot; rdot; -2* rdot / r; 0];
fx_qk = [thdot; rdot; -2* rdot / r + qth; -k*r + qr];
eq = diff(x) == fx;
s = dsolve(eq.', [th(tau) == th_tau, r(tau) == r_tau, thdot(tau) == rdot_tau, rdot(tau) == rdot_tau]);
xs = [s.th; s.r; s.thdot; s.rdot];

%%
ts = solve(xs(2) == r1, t);
xT = simplify(subs(xs, t, ts));

%%
H = dot(formula(p), formula(fx),1);
syms x1 x2 x3 x4
assume([x1 x2 x3 x4], 'real')
x_ = [x1 x2 x3 x4].';
H = subs(H, x, x_);
eq = diff(p,t) == gradient(H, x_);
s = dsolve(eq.', [p1(tau) == p1tau, p2(tau) == p2tau, p3(tau) == p3tau, p4(tau) == p4tau]);
ps = [s.p1; s.p2; s.p3; s.p4];
ps = subs(ps, x_, x)



%%
syms p1T p2T p3T p4T
assume([p1T p2T p3T p4T], 'real')
pT = [p1T p2T p3T p4T].';
F = th^2;
M = r - r1;
pT = (-[2*th;0;0;0] + [0;1;0;0] * (2*th*thdot/rdot));

%%
eq = pT == ps;
s = solve(eq, [p1_tau p2_tau p3_tau p4_tau]);
p_taus = [s.p1_tau s.p2_tau s.p3_tau s.p4_tau].';
p_taus = subs(p_taus, t, ts);
p_taus = subs(p_taus, [th r thdot rdot], xT.');
p_taus = simplify(p_taus)

%%

% fx = [thdot; rdot; -2* rdot / r; 0];
% fx_qk = [thdot; rdot; -2* rdot / r + qth; -k*r + qr];

eq = p_taus(1)*thdot+p_taus(2)*rdot+p_taus(3)*(-2* rdot / r) ==  p_taus(1)*thdot+p_taus(2)*rdot+p_taus(3)*(-2* rdot / r + qth)+p_taus(4)*(-k*r + qr)
ks = solve(eq, k);
syms y1 y2 ydot1 ydot2
ks = subs(ks, [th_tau r_tau thdot_tau rdot_tau], [y1 y2 ydot1 ydot2]);
ks = subs(ks, [t th(t) r(t) thdot(t)], [y1 y2 ydot1 ydot2]);
simplify(ks);

