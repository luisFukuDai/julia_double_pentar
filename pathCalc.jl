function r = pathCalc(p,q,t)

persistent rKeep;
persistent state;
persistent tf;
persistent B;
persistent t2;

if(t == 0)
	state = 0;
	tf = -1;
end



switch (state)
	case 0,
		B = [q(1) 0 0 0 p.psiMax 0 -28 0];
		state = 1;
	case 1,
		if (t >= tf)
			state = 2;
			B = [rKeep(1) rKeep(2) rKeep(3) 0  0 0 0 0];
			t2 = t;
			t = 0;
			
		end
	case 2,
		t = t - t2;
		if (tf <= t);
			state = 3;
		end
	case 3,
		r = [0 0 0];
		return;
		
end
		

p0 = B(1);
dp0 = B(2);
ddp0 = B(3);
dddp0 = B(4);
p1 = B(5);
dp1 = B(6);
ddp1 = B(7);
dddp1 = B(8);


tfPoly = [(6*dddp1+6*dddp0),...
	(72*ddp0-72*ddp1),...
	(360*dp1+360*dp0),...
	(-720*p1+720*p0),+...
	0,0];

b = 360*(dp1+dp0);
a = 72*(ddp0-ddp1);
c = 720*(p0-p1);

tf = [(-b+sqrt(b^2-4*a*c))/2/a (-b-sqrt(b^2-4*a*c))/2/a];

%tf = roots(tfPoly)
tf = max(tf);


A = [0,0,0,0,0,0,1;
	0,0,0,0,0,1,0;
	0,0,0,0,2,0,0;
	0,0,0,6,0,0,0;
	tf^6,tf^5,tf^4,tf^3,tf^2,tf,1;
	6*tf^5,5*tf^4,4*tf^3,3*tf^2,2*tf,1,0;
	30*tf^4,20*tf^3,12*tf^2,6*tf,2,0,0;
	120*tf^3,60*tf^2,24*tf,6,0,0,0];

a = A\B';
da = [6,5,4,3,2,1].*a(1:6)';
dda = [30,20,12,6,2].*a(1:5)';

r = [polyval(a,t) polyval(da,t) polyval(dda,t)];
rKeep = r;

