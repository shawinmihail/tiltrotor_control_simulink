clc

qB = q_real.Data();
Th = Th_real.Data();

diluter = 100;
filename = 'uav.gif';

axis tight manual 
k = 0;
for i = 1:numel(qB)
    if mod(i, diluter) ~= 0
        continue
    end
    th = Th(i, :)';
    qb = qB(i, :)';
    qp = quatPB(th, qc.rays);
    drawFly(qb, qp, qc.rays, qc.l, 1)
    frame = getframe(gca); 
    im = frame2im(frame); 
    [imind,cm] = rgb2ind(im,256);
    if k == 0 
          imwrite(imind,cm,filename,'gif', 'Loopcount',inf); 
     else 
          imwrite(imind,cm,filename,'gif','WriteMode','append'); 
    end
    k = k + 1;
end