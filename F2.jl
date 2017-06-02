function F2(q,u,p)

  M = MCalc(q,p);
  V = VCalc(q,p);
  # 	C = CCalc(q,p);
  G = GCalc(q,p);


  E = [-1 1;1 0;0 0;0 0;0 1];

  J, dJ = ConstraintJacobian(q,p);


  Fext = (-V-G+E*u);

 zeros(10,1);

  W = inv(M);
  lambda = (J*W*J')\(-dJ*q[6:10]-J*W*Fext);
  Fc = J'*lambda;

  xa = p.rw*q[2] + p.lb*sin(q[1]) + p.la*sin(q[5]);
  ya = p.rw + p.lb*cos(q[1]) - p.la*cos(q[5]);

  Fx = [0 0 400*(xa-q[3])-40*q[8] 0 0]';
  Fy = [0 0 0 400*(ya-q[4])-40*q[9] 0]';

  [q[6:10];W*(Fc+Fext+Fx*0+Fy*0)];
end 
