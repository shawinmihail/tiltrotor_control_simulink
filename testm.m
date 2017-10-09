r_reg = [1;1;1];
tgTh24 = r_reg(1)/r_reg(3);
tgTh13 = r_reg(1)/r_reg(2);
Th13 = atan(tgTh13);
Th24 = atan(tgTh24);
Th = [-Th13; Th24; Th13; -Th24]*180/pi