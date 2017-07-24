for a = 1:64
    eul_des = 1*[a;0;0]*pi/180;
    R_des(:,:,i) = eul2rotm(eul_des');
end
plot(R_des)