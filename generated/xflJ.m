function J = xflJ(Th1,Th2,Th3,Th4)
%XFLJ
%    J = XFLJ(TH1,TH2,TH3,TH4)

%    This function was generated by the Symbolic Math Toolbox version 6.3.
%    08-Aug-2018 12:55:38

t2 = cos(Th2);
t3 = sin(Th2);
t4 = cos(Th4);
t5 = sin(Th4);
t6 = cos(Th1);
t7 = sin(Th1);
t8 = cos(Th3);
t9 = sin(Th3);
J = reshape([0.0,t7.*1.13e-5,t6.*(-1.13e-5),0.0,t6.*2.825e-6+t7.*1.5e-6,t6.*(-1.5e-6)+t7.*2.825e-6,t3.*1.13e-5,0.0,t2.*1.13e-5,t2.*2.825e-6-t3.*1.5e-6,0.0,t2.*(-1.5e-6)-t3.*2.825e-6,0.0,t9.*(-1.13e-5),t8.*(-1.13e-5),0.0,t8.*(-2.825e-6)-t9.*1.5e-6,t8.*(-1.5e-6)+t9.*2.825e-6,t5.*(-1.13e-5),0.0,t4.*1.13e-5,t4.*(-2.825e-6)+t5.*1.5e-6,0.0,t4.*(-1.5e-6)-t5.*2.825e-6],[6,4]);
