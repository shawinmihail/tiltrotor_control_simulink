function Th4 = solutionTh4(f1,f3,t1,t3)
%SOLUTIONTH4
%    TH4 = SOLUTIONTH4(F1,F3,T1,T3)

%    This function was generated by the Symbolic Math Toolbox version 6.3.
%    15-Jan-2019 21:40:18

Th4 = atan((f1.*1.5e-6-f3.*2.825e-6+t1.*1.13e-5+sqrt(f1.*t1.*3.39e-11+f1.*t3.*6.3845e-11-f3.*t1.*6.3845e-11+f3.*t3.*3.39e-11+f1.^2.*1.0230625e-11+f3.^2.*1.0230625e-11+t1.^2.*1.2769e-10+t3.^2.*1.2769e-10))./(f1.*2.825e-6+f3.*1.5e-6+t3.*1.13e-5)).*-2.0;
