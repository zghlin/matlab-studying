%该程序为一个独立程序，无需依赖其他程序运行

clc,clear,close all %初始化matlab 属于内置命令 多行并列有标点
t=0:pi/50:4*pi;      %声明变量
y0=exp(-t/3);       %设定函数y0
y=exp(-t/3).*sin(3*t);  %设定函数y

%前置准备


plot(t,y,t,y0,t,-y0);   %画图 自变量后紧随因变量，共三组，均用,隔开

  %网格化 属于内置命令 无标点
grid on

