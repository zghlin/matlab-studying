clc
close all;
clear all;

b=2*pi;
x=linspace(0,b,50);
for k = 1:1:9
    y=sin(k*x).*cos(.52*x);
    subplot(3,3,k);
    plot(x,y,'linewidth',2);
    %������
    
    
end
