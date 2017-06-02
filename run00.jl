include("setParam.jl");
tf = 30.0;
N = tf/p.dt - 1;

q = p.q0;
t = (0:1:N-1)*p.dt;
u = 0;
ii = 0.0;

for i = 1 : 1 :N-1
    ii = ii + (q[i,5]-0.01)*p.dt;
    q[i+1,:] = rk4(q[i,:]',[u1;u2],p,F2);
end

