function q = quatFromEul( eul )
    
    roll = eul(1);
    pitch = eul(2);
    yaw = eul(3);

	cy = cos(yaw * 0.5);
	sy = sin(yaw * 0.5);
	cr = cos(roll * 0.5);
	sr = sin(roll * 0.5);
	cp = cos(pitch * 0.5);
	sp = sin(pitch * 0.5);

	q0 = cy * cr * cp + sy * sr * sp;
	q1 = cy * sr * cp - sy * cr * sp;
	q2 = cy * cr * sp + sy * sr * cp;
	q3 = sy * cr * cp - cy * sr * sp;
	
    q = [q0; q1; q2; q3];
end

