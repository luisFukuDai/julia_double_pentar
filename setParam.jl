type mainParam
Mg::Float64
mw::Float64
ma ::Float64
lg ::Float64
b ::Float64
rw ::Float64
la ::Float64
lb ::Float64
Iyy ::Float64
Ira ::Float64
Iwa ::Float64
Ia ::Float64
s ::Float64
Cw ::Float64
g ::Float64
dt ::Float64
q0 ::Array{Float64,2}
t ::Float64
beta ::Float64
end

p = mainParam(
0.0,
0.0,
0.0,
0.0,
0.0,
0.0,
0.0,
0.0,
0.0,
0.0,
0.0,
0.0,
0.0,
0.0,
0.0,
0.0,
zeros(Float64,1,5),
0.0,
0.0);


p.Mg = 38.6;
p.mw = 1.25*2;
p.ma = 1.0;

p.lg = 0.2004;
p.b = 1/(4.3*60/29);
p.rw = 0.1;
p.la = 0.2;
p.lb = 0.6;

p.Iyy = 1/3*p.Mg*p.lg^2;
#p.Iyy = 1.39;
p.Ira = 0.015;
#p.Iwa = 1/2*p.mw*p.rw^2;
p.Iwa = 0.01475;
p.Ia = 1/12*p.ma*p.la^2;

p.s = 1;
p.Cw = 0.1;
p.g = 9.81;
p.dt = 0.01;

psi = 0;
theta_w = 0;
theta_1 = 0.0001;
xa = p.rw*theta_w + p.lb*sin(psi) + p.la*sin(theta_1);
ya = p.rw + p.lb*cos(psi) - p.la*cos(theta_1);

p.q0 = [psi theta_w xa ya theta_1 0 0 0 0 0];

