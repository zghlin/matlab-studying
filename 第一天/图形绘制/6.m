clc
clear all;
close all;
t=0:0.1:1.5;
vx=2*t;
vy=2*t.^2;
vz=6*t.^3-t.^2;

x=t.^2;
y=(2/3)*t.^3;
z=(6/4)*t.^4-(1/3)*t.^3;
plot3(x,y,z,'r.-');
hold on;

vx=gradient(x);
vy=gradient(y);
vz=gradient(z);
quiver3(x,y,z,vx,vy,vz);
grid on;
xlabel('x');
ylabel('y');
zlabel('z');




















