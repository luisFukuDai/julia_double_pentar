syms t tf p0 dp0 ddp0 p1 dp1 ddp1;


A = [0 0 0 0 0 1;
     0 0 0 0 1 0;
	 0 0 0 2 0 0;
	 tf^5 tf^4 tf^3 tf^2 tf 1;
	 5*tf^4 4*tf^3 3*tf^2 2*tf 1 0;
	 20*tf^3 12*tf^2 6*tf^2 2 0 0];

%B  = [p0 dp0 ddp0 p1 dp1 ddp1]';
B  = [0 0 0 0 0 0]';

a = (A\B);

p = a'*[t^5 t^4 t^3 t^2 t 1]';
ddp = diff(diff(p,t));