function ft = ft_fcn_advanced(Th1,Th2,Th3,Th4,W01,W02,W03,W04)
%FT_FCN_ADVANCED
%    FT = FT_FCN_ADVANCED(TH1,TH2,TH3,TH4,W01,W02,W03,W04)

%    This function was generated by the Symbolic Math Toolbox version 6.3.
%    01-Dec-2017 18:45:17

t2 = sqrt(2.0);
t3 = abs(W01);
t4 = 1.0./sqrt(t3);
t5 = sin(Th1);
t6 = abs(W02);
t7 = 1.0./sqrt(t6);
t8 = sin(Th2);
t9 = abs(W03);
t10 = 1.0./sqrt(t9);
t11 = sin(Th3);
t12 = t2.*t10.*t11.*1.145e-3;
t13 = abs(W04);
t14 = 1.0./sqrt(t13);
t15 = sin(Th4);
t16 = t2.*t14.*t15.*1.145e-3;
ft = reshape([t2.*t4.*t5.*(-1.145e-3),t2.*t4.*t5.*1.145e-3,t4.*cos(Th1).*(-2.29e-3),t2.*t7.*t8.*(-1.145e-3),t2.*t7.*t8.*(-1.145e-3),t7.*cos(Th2).*(-2.29e-3),t12,-t12,t10.*cos(Th3).*(-2.29e-3),t16,t16,t14.*cos(Th4).*(-2.29e-3)],[3,4]);
