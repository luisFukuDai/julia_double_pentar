function MCalc(q,p)

M1 = [   (p.Mg*p.lg*p.lg+p.Iyy) (p.Mg*p.lg*p.rw*cos(q[1]));
        p.Mg*p.lg*p.rw*cos(q[1]) ((p.Mg + p.mw)*p.rw^2 + p.Iwa)];

  
M2 = [p.ma 0 0;0 p.ma 0;0 0 p.Ia];

[M1 zeros(2,3) ; zeros(3,2) M2];

end
