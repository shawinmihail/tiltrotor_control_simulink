function out1 = Th4(f1,f3,t1,t3)
%TH4
%    OUT1 = TH4(F1,F3,T1,T3)

%    This function was generated by the Symbolic Math Toolbox version 6.3.
%    21-Nov-2017 07:12:09

t4 = f1.*3.335171328526687e15;
t5 = t3.*1.334068531410675e16;
t26 = f3.*3.541774862152234e15;
t6 = t4+t5-t26;
t7 = 1.0./t6;
t8 = f1.*3.541774862152234e15;
t9 = f3.*3.335171328526687e15;
t10 = t1.*1.334068531410675e16;
t11 = f1.*t3.*8.898694232501173e31;
t12 = f1.^2;
t13 = t12.*2.366753696479994e31;
t14 = f3.^2;
t15 = t14.*2.366753696479994e31;
t16 = t1.^2;
t17 = t16.*1.779738846500235e32;
t18 = t3.^2;
t19 = t18.*1.779738846500235e32;
t27 = f1.*t1.*9.449940777877352e31;
t28 = f3.*t1.*8.898694232501173e31;
t29 = f3.*t3.*9.449940777877352e31;
t20 = t11+t13+t15+t17+t19-t27-t28-t29;
t21 = sqrt(t20);
t22 = t8+t9-t10-t21;
t23 = t7.*t22;
t24 = atan(t23);
t25 = t24.*2.0;
t30 = t8+t9-t10+t21;
t31 = t7.*t30;
t32 = atan(t31);
t33 = t32.*2.0;
out1 = [t25;t25;t33;t33];
