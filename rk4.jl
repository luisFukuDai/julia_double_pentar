function rk4(q,u,p,dq_fun)

k1 = p.dt*dq_fun(q,u,p);
k2 = p.dt*dq_fun(q + k1/2,u,p);
k3 = p.dt*dq_fun(q + k2/2,u,p);
k4 = p.dt*dq_fun(q + k3,u,p);


q + (k1 + 2*k2 + 2*k3 + k4)/6;
end
