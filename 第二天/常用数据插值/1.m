clc,clear,close all;
format short;
hold off;
xx=1:1:17;
yx=[3.5,4,4.3,4.6,5,5.3,5.3,5,4.6,4,3.9,3.3,2.8,2.5,2.2,2.0,1.8];
xxi=1:0.3:17;
f0=interp1(xx,yx,xxi);
f1=interp1(xx,yx,xxi,'linear');
f2=interp1(xx,yx,xxi,'cubic');
f3=interp1(xx,yx,xxi,'spline');
f4=interp1(xx,yx,xxi,'nearest');
plot(xx,yx,'r--','linewidth',2);
hold on;

%plot(xxi,f0,'r--','linewidth',2);
plot(xxi,f1,'b--','linewidth',2);
plot(xxi,f2,'ro--','linewidth',2);
plot(xxi,f3,'k--','linewidth',2);
plot(xxi,f4,'b','linewidth',2);
legend('原始数据','线性插值','三次插值','样条插值','最近区域插值')
grid on;
