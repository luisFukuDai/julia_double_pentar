function xh= eso(xh0,x0,u,p)

e = (x0(1)-xh0(1));

w0 = p.w0;
l = conv([1 w0],conv([1 w0],[1 w0]));


xh(1) = xh0(1) + p.dt*(xh0(2) + l(2)*(e));
xh(2) = xh0(2) + p.dt*(xh0(3) + l(3)*(e) + p.bIn*u);
xh(3) = xh0(3) + p.dt*( p.hD + l(4)*(e));



% dq = [xh0(2) + l(2)*(e);xh0(3) + l(3)*(e) + p.bIn*u;l(4)*(e)];
% k1 = p.dt*dq;
% 
% dq = [xh0(2) + l(2)*(e);xh0(3) + l(3)*(e) + p.bIn*u;l(4)*(e)] + k1/2;
% k2 = p.dt*dq;
% 
% dq = [xh0(2) + l(2)*(e);xh0(3) + l(3)*(e) + p.bIn*u;l(4)*(e)] + k2/2;
% k3 = p.dt*dq;
% 
% dq = [xh0(2) + l(2)*(e);xh0(3) + l(3)*(e) + p.bIn*u;l(4)*(e)] + k3;
% k4 = p.dt*dq;
% 
% 
% % k2 = p.dt*dq_fun(q + k1/2,u,p);
% % k3 = p.dt*dq_fun(q + k2/2,u,p);
% % k4 = p.dt*dq_fun(q + k3,u,p);
% 
% xh = xh0 + (k1 + 2*k2 + 2*k3 + k4)'/6;
% 
