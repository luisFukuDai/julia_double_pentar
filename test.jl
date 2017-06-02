include("rk4.jl");
include("foo.jl");

t =(0:0.001:1000);
q = zeros(t);
q[1] = 1;
type param
dt 
end

p = param(0.001);

for i = 1:1:length(t)-1
    u = 0;
    q[i+1]=rk4(q[i],u,p,foo);
end

