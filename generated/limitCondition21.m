function f = limitCondition21(f1,f3,t1,t3)
%LIMITCONDITION21
%    F = LIMITCONDITION21(F1,F3,T1,T3)

%    This function was generated by the Symbolic Math Toolbox version 6.3.
%    08-Nov-2018 13:48:02

f = f1.*5.462599658153797e-1-f3.*4.268078971844237+t1.*3.277559794892278e-6-abs(f1.*1.953318584070796+f3.*(1.0./4.0)+t3.*1.5e-6);
