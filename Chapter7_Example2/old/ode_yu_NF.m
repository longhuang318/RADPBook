function [t,Y]=ode_yu_NF(t0,tf,x0,dt)
h=dt;                                                            % stepsize                                      % step numbers, 100 is the final time                                   
t=t0:dt:tf;                                                      % initial time                         
y=x0;       
Y=[];
    for clock=t  
        %clock
       y=y+motor2DNF(clock,y)*h;      
       Y=[Y y];
    end 
Y=Y';
end


function dX=motor2DNF(t,X)

para;

x=X(1:6);
z=X(7:8);


dx=x;

x=x(:);

u=-K*x;

w=randn(2,1)*sqrt(dt);

M=[c1*u(1) c2*u(2); -c2*u(1) c1*u(2)];

v=M*w; % control dependent noise

f=z;

VF=[-10.1 -11.2; -11.2 11.1];

dx(1:4)=A*x(1:4)+B*(x(5:6)+f);
dx(5:6)=B1*(-x(5:6)+u+v./dt); 
dz=[0;0];
dX=[dx;dz];
end