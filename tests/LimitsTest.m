clc
clear

Wlim = 1.5e6;
Thlim = pi/4;

torq_h_lim = 0.2;
torq_v_lim = 1;
torq_step = 1;
T3 = 6;

force_h_lim = 10;
force_v_max = 50;
force_v_min = 22;
force_step = 1;

grid on
hold on
for fV = force_v_min:force_step:force_v_max
for fH = -force_h_lim:force_step:force_h_lim
for tV = -torq_v_lim:torq_step:torq_v_lim
for tH = -torq_v_lim:torq_step:torq_v_lim
                
    ths1 = Th1(fH,fV/2,tH,0.5*tV-T3);
    th1 = ths1(3);
    ths3 = Th3(fH,fV/2,tH,0.5*tV-T3);
    th3 = ths3(3);
    
    ths2 = Th2(fH,fV/2,tH,0.5*tV-T3);
    th2 = ths2(4);
    ths4 = Th4(fH,fV/2,tH,0.5*tV-T3);
    th4 = ths4(4);
    
    ws1 = W1(fH,fV/2,tH,0.5*tV-T3);
    w1 = ws1(3);
    ws3 = W3(fH,fV/2,tH,0.5*tV-T3);
    w3 = ws3(3);
    ws2 = W2(fH,fV/2,tH,0.5*tV-T3);
    w2 = ws2(4);
    ws4 = W4(fH,fV/2,tH,0.5*tV-T3);
    w4 = ws4(4);

    if abs(th1) < Thlim && abs(th2) < Thlim && abs(th3) < Thlim && abs(th4) < Thlim
        if abs(th1) < Thlim && abs(th2) < Thlim && abs(th3) < Thlim && abs(th4) < Thlim

        end
    end
    
end
end
end
end
