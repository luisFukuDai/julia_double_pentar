include("setParam.jl");
include("MCalc.jl");
include("VCalc.jl");
include("CCalc.jl");
include("GCalc.jl");
include("ConstraintJacobian.jl");
include("F2.jl");
include("rk4.jl");

tf = 30.0;
N = Int64(tf/p.dt + 1);

t = [0:1:N-1;]*p.dt;
q = zeros(Float64,length(t),length(p.q0));

ii = 0.0;

for i = 1:N-1

 p.t = t[i];

 u1 = 144.0*q[i,1] + 12.0*q[i,6] + 1.0*q[i,2] + 0.78*q[i,7];
 u2 = -(9*(q[i,5]-0.01) + 6*q[i,10])/50 - ii*1.5;
 ii = ii + (q[i,5]-0.01)*p.dt;
 q[i+1,:] = rk4(q[i,:],[u1;u2],p,F2)';

end
