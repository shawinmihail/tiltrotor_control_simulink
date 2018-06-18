function dF = dF_own_fnc(Th1,Th2,Th3,Th4,W1,W2,W3,W4)
%DF_OWN_FNC
%    DF = DF_OWN_FNC(TH1,TH2,TH3,TH4,W1,W2,W3,W4)

%    This function was generated by the Symbolic Math Toolbox version 6.3.
%    18-Jun-2018 15:59:31

t2 = sqrt(2.0);
t3 = sin(Th1);
t4 = t2.*t3.*5.65e-6;
t5 = sin(Th2);
t6 = sin(Th3);
t7 = sin(Th4);
t8 = t2.*t7.*5.65e-6;
t9 = cos(Th1);
t10 = W1.*t2.*t9.*5.65e-6;
t11 = cos(Th2);
t12 = cos(Th3);
t13 = cos(Th4);
t14 = W4.*t2.*t13.*5.65e-6;
t15 = t2.*t9.*1.4125e-6;
t16 = t2.*t5.*(-7.5e-7)-t2.*t11.*1.4125e-6;
t17 = t2.*t6.*7.5e-7;
t18 = t2.*t13.*1.4125e-6;
t19 = t2.*t7.*7.5e-7;
t20 = t18+t19;
t21 = W2.*t2.*t5.*1.4125e-6;
t22 = t21-W2.*t2.*t11.*7.5e-7;
t23 = W3.*t2.*t12.*7.5e-7;
t24 = W3.*t2.*t6.*1.4125e-6;
t25 = W4.*t2.*t13.*7.5e-7;
t26 = t25-W4.*t2.*t7.*1.4125e-6;
dF = reshape([t4,-t4,t9.*1.13e-5,t15-t2.*t3.*7.5e-7,-t15+t2.*t3.*7.5e-7,t3.*(-2.825e-6)-t9.*1.5e-6,t2.*t5.*(-5.65e-6),t2.*t5.*(-5.65e-6),t11.*(-1.13e-5),t16,t16,t5.*2.825e-6-t11.*1.5e-6,t2.*t6.*(-5.65e-6),t2.*t6.*5.65e-6,t12.*1.13e-5,t17-t2.*t12.*1.4125e-6,-t17+t2.*t12.*1.4125e-6,t6.*(-2.825e-6)-t12.*1.5e-6,t8,t8,t13.*(-1.13e-5),t20,t20,t7.*2.825e-6-t13.*1.5e-6,t10,-t10,W1.*t3.*(-1.13e-5),W1.*t2.*t3.*(-1.4125e-6)-W1.*t2.*t9.*7.5e-7,W1.*t2.*t3.*1.4125e-6+W1.*t2.*t9.*7.5e-7,W1.*t3.*1.5e-6-W1.*t9.*2.825e-6,W2.*t2.*t11.*(-5.65e-6),W2.*t2.*t11.*(-5.65e-6),W2.*t5.*1.13e-5,t22,t22,W2.*t5.*1.5e-6+W2.*t11.*2.825e-6,W3.*t2.*t12.*(-5.65e-6),W3.*t2.*t12.*5.65e-6,W3.*t6.*(-1.13e-5),t23+t24,-t23-t24,W3.*t6.*1.5e-6-W3.*t12.*2.825e-6,t14,t14,W4.*t7.*1.13e-5,t26,t26,W4.*t7.*1.5e-6+W4.*t13.*2.825e-6],[6,8]);
