clc,clear,close all;

x=[0.5,1.0,1.5,2.0,2.5,3.0];
y=[1.75,2.45,3.81,4.8,7,8.6];
a1=polyfit(x,y,1);
a2=polyfit(x,y,2);
a3=polyfit(x,y,3);

x1=[0.5:0.05:3.0];
y1=a1(2)+a1(1).*x1;
y2=a2(3)+a2(2).*x1+a2(1).*x1.*x1;
y3=a3(1).*x1.*x1.*x1+a3(2).*x1.*x1+a3(3)*x1+a3(4);
plot(x,y,'*');
hold on;

plot(x1,y1,'b--',x1,y2,'k',x1,y3,'ro-');
legend('原始数据','一次拟合','二次拟合','三次拟合');

p1=polyval(a1,x)
p2=polyval(a2,x)
p3=polyval(a3,x)

v1=y-p1;
v2=y-p2;
v3=y-p3;

s1=norm(v1,'fro');
s2=norm(v2,'fro');
s3=norm(v3,'fro');

disp('一次拟合结果:');
disp(p1);

disp('二次拟合结果:');
disp(p2);

disp('三次拟合结果:');
disp(p3);

















