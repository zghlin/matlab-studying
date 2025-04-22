

clc,clear,close all;

x1=1;
x2=3;
y1=ysw_sum(x1,x2);
y2=ysw_sum(x1,x2)*ysw_sum(x1,x2);
fprintf('y1=%.2f\n',y1);
fprintf('y2%.2f\n',y2);

function y=ysw_sum(a,b)
y=a+b;
end