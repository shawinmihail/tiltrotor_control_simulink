q = [1;1;0;1];
Q = [-q(2) -q(3) -q(4);
      q(1) -q(4)  q(3) ;
      q(4)  q(1) -q(2)
     -q(3)  q(2)  q(1)];
 r = [1;2;3];
 rq = [0;r]
 r1 = quatMultiply(q, rq)
 r2 = Q*r