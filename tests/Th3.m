function out1 = Th3(f2,f3,t2,t3)
%TH3
%    OUT1 = TH3(F2,F3,T2,T3)

%    This function was generated by the Symbolic Math Toolbox version 6.3.
%    21-Nov-2017 07:12:06

t4 = f3.*3.541774862152234e15;
t5 = t3.*1.334068531410675e16;
t28 = f2.*3.335171328526687e15;
t6 = t4+t5-t28;
t7 = 1.0./t6;
t8 = f2.*3.541774862152234e15;
t9 = f3.*3.335171328526687e15;
t10 = t2.*1.334068531410675e16;
t11 = f2.*t2.*9.449940777877352e31;
t12 = f3.*t2.*8.898694232501173e31;
t13 = f3.*t3.*9.449940777877352e31;
t14 = f2.^2;
t15 = t14.*2.366753696479994e31;
t16 = f3.^2;
t17 = t16.*2.366753696479994e31;
t18 = t2.^2;
t19 = t18.*1.779738846500235e32;
t20 = t3.^2;
t21 = t20.*1.779738846500235e32;
t29 = f2.*t3.*8.898694232501173e31;
t22 = t11+t12+t13+t15+t17+t19+t21-t29;
t23 = sqrt(t22);
t24 = t8+t9+t10+t23;
t25 = t7.*t24;
t26 = atan(t25);
t27 = t26.*2.0;
t30 = t8+t9+t10-t23;
t31 = t7.*t30;
t32 = atan(t31);
t33 = t32.*2.0;
out1 = [t27;t27;t33;t33];
