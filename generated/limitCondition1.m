function f = limitCondition1(f2,f3,t2,t3)
%LIMITCONDITION1
%    F = LIMITCONDITION1(F2,F3,T2,T3)

%    This function was generated by the Symbolic Math Toolbox version 6.3.
%    09-Nov-2018 17:12:30

f = -abs(f2.*2.825e-6-f3.*1.5e-6+t3.*1.13e-5)+sqrt(3.0).*(f2.*1.5e-6+f3.*2.825e-6-t2.*1.13e-5);
