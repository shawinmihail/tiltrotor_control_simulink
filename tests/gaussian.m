clc
clear
close all
hold on
point_size = 1000;


% N = 3.0;
% x=linspace(-N, N);
% y=x;
% [X,Y]=meshgrid(x,y);
% z=(1000/sqrt(2*pi).*exp(-(X.^2/2)-(Y.^2/2)));
% 
% s = surf(X,Y,z);
% s.FaceAlpha = 0.99;
% shading interp
% axis tight
% 
% lim = 2.5;
% xlim([-lim lim])
% ylim([-lim lim])
% set(gca,'xtick',[])
% set(gca,'ytick',[])
% set(gca,'ztick',[])
% 
% x0 = [-12 -8 -3 5 9]/10;
% y0 = -abs(x0) .* [-0.6122    0.8492    0.6386    0.4979    0.9216];
% 
% z0 = (1000/sqrt(2*pi).*exp(-(x0.^2/2)-(y0.^2/2))) + 20 + 0 * [0.3426    0.0135    0.7008    0.8492    0.4206];
% scatter3(x0,y0,z0, point_size, 'MarkerEdgeColor',[0 0 0], 'MarkerFaceColor',[0.0 0.7 0.2])
% 
% x0 = [0];
% y0 = [0];
% z0 = (1000/sqrt(2*pi).*exp(-(x0.^2/2)-(y0.^2/2))) + 10;
% scatter3(x0,y0,z0, point_size, 'MarkerEdgeColor',[0 0 0], 'MarkerFaceColor',[0.9 0.1 0.1])


%%%%%%%%%%%%%
N = 3.0;
x=linspace(-N, N);
y=x;
[X,Y]=meshgrid(x,y);
z =  X .* 1;

s = surf(X,Y,z);
s.FaceAlpha = 0.99;
shading interp
axis tight

lim = 2.5;
xlim([-lim lim])
ylim([-lim lim])
set(gca,'xtick',[])
set(gca,'ytick',[])
set(gca,'ztick',[])

x0 = [0 1 1 -1 -1];
y0 = [0 1 -1 1 -1];

z0 = x0 + 0.2;
scatter3(x0,y0,z0, point_size, 'MarkerEdgeColor',[0 0 0], 'MarkerFaceColor',[0.0 0.7 0.2])
