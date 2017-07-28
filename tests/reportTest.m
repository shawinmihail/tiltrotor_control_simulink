clc 
clear all

m = 3;
g = 10;
tw = 2;
f1 = 15;
fm = 4*f1;
thm = 60*pi/180;
ro = 1.2;
Sv = 0.44;
Sh = 0.2;
c = 1.05;
v0 = 5;

% vv = sqrt(2*(fm-m*g)/(ro*c*Sv))

%% x
% fm = 4*f1*sin(thm)*cos(pi/4) %
% vR = sqrt(fm/3)
% fbr = fm; %
% tbr = m*(v0-vR)/fbr
% dbr = v0*tbr-fbr*tbr*tbr/(2*m)
% dm = dbr + 1
% vh = sqrt(2*(fm)/(ro*c*Sh))

% th30 = 30*pi/180;
% ff = m*g/(4*cos(th30))
% fn = 4*ff*sin(th30)*cos(pi/4)
% vR = sqrt(fn/3)
% fbr = fn %
% tbr = m*(v0-vR)/fbr
% dbr = v0*tbr-fbr*tbr*tbr/(2*m)
% dm = dbr + 1
% vh = sqrt(2*(fn)/(ro*c*Sh))

% % H
% fm = 2*f1*sin(thm) %
% vR = sqrt(fm/3)
% fbr = fm; %
% tbr = m*(v0-vR)/fbr
% dbr = v0*tbr-fbr*tbr*tbr/(2*m)
% dm = dbr + 1
% vh = sqrt(2*(fm)/(ro*c*Sh))
% 
% th30 = 30*pi/180;
% ff = m*g/(4*cos(th30))
% fn = 4*ff*sin(th30)*cos(pi/4)
% vR = sqrt(fn/3)
% fbr = fn %
% tbr = m*(v0-vR)/fbr
% dbr = v0*tbr-fbr*tbr*tbr/(2*m)
% dm = dbr + 1
% vh = sqrt(2*(fn)/(ro*c*Sh))

% k
% fm = 2*f1*sin(thm)*cos(pi/4) %
% vR = sqrt(fm/3)
% fbr = fm + 2*f1*sin(thm) %
% tbr = m*(v0-vR)/fbr
% dbr = v0*tbr-fbr*tbr*tbr/(2*m)
% dm = dbr + 1
% vh = sqrt(2*(fbr)/(ro*c*Sh))

th30 = 30*pi/180;
ff = m*g/(4*cos(th30))
fn = 2*ff*sin(th30)*cos(pi/4)
vR = sqrt(fn/3)
fbr = fn+2*ff*sin(th30) %
tbr = m*(v0-vR)/fbr
dbr = v0*tbr-fbr*tbr*tbr/(2*m)
dm = dbr + 1
vh = sqrt(2*(fbr)/(ro*c*Sh))