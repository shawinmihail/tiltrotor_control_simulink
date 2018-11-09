function eul = quat2Eul( q )
	sinr = 2.0 * (q(1) * q(2) + q(3) * q(4));
	cosr = 1.0 - 2.0 * (q(2) * q(2) + q(3) * q(3));
	roll = atan2(sinr, cosr);

	sinp = 2.0 * (q(1) * q(3) - q(4) * q(2));
	if (abs(sinp) >= 1)
		pitch = sign(sinp) * pi / 2;
	else
		pitch = asin(sinp);
    end

    siny = 2.0 * (q(1) * q(4) + q(2) * q(3));
	cosy = 1.0 - 2.0 * (q(3) * q(3) + q(4) * q(4));  
	yaw = atan2(siny, cosy);
    eul = [roll;pitch;yaw];
end

