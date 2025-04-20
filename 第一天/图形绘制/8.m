%此为错误源代码
clc,clear,close all
clf;
a=-20;
eps0=1;
[x,y]=meshigrid(-10:0.2:10);

z1=(x.^2-2*y.^2)+eps;
z2=a*ones(size(x));
r0=abs(z1-z2)<=eps0;
zz=r0.*z2;
xx=r0.*x;
yy=r0.*y;
subplot(2,2,2);
h1=plot3(xx(r0~=0),yy(r0~=0),zz(r0~=0),'+');
set(h1,'markersize',2);
hold on;
axis(v);
grid on;
subplot(2,2,1);
mesh(x,y,z1);
grid;
hold on;

mesh(x,y,z2);
h2=plot3(xx(r0~=0),yy(r0~=0),zz(r0~=0),'.');
set(h2,'markersize',6);
hold on;
axis(v);
for i=1:5;
    a=70-i*30;
    z2=a*ones(size(x));
    r0=abs(z1-z2)<=1;
    zz=r0.*z2;
    yy=r0.*y;
    xx=r0.*x;
    subplot(2,2,3);
    mesh(x,y,z1);
    grid;
    hold on;
    mesh(x,y,z2);
    hidden off;
    h2=lot3(xx(0~=0),yy(r~=0),zz(r0~=0),'o');
    set(h4,'markersize',2);
    hold on;
    axis(v);
    grid on;
end    
    
    
    
    
    
    
    
    
    
    
    
















































