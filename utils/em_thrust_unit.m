function unit = em_thrust_unit()


th1 = em_solution_Th1(1, 0, 0, 0);
th4 = em_solution_Th4(1, 0, 0, 0);
J = xfl_J_B(th1,0,0,th4);
xdyn = J*[-1 0 0 1]';
unit = xdyn(1:3);
unit = unit / norm(unit);


end

