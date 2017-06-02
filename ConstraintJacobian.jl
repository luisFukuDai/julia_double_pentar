function ConstraintJacobian(q,p)

  J = [-p.lb*cos(q[1]) -p.rw    1  0   -p.la*cos(q[5]);
       p.lb*sin(q[1]) 0       0   1   -p.la*sin(q[5])];

  dJ = [  p.lb*sin(q[1])*q[6] 0 0 0 p.la*sin(q[5])*q[10];
        p.lb*cos(q[1])*q[6] 0 0 0 -p.la*cos(q[5])*q[10]];


  J,dJ
end
