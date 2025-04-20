%6.m的优化版


clc;
clear all;
close all;

% 定义时间向量和速度分量
t = 0:0.1:1.5;               % 时间向量，从 0 到 1.5，每步 0.1
vx = 2 * t;                  % x 方向的速度，vx = 2 * t
vy = 2 * t.^2;               % y 方向的速度，vy = 2 * t^2
vz = 6 * t.^3 - t.^2;        % z 方向的速度，vz = 6 * t^3 - t^2

% 计算轨迹的空间坐标
x = t.^2;                    % x 方向位置，x = t^2
y = (2/3) * t.^3;            % y 方向位置，y = (2/3) * t^3
z = (6/4) * t.^4 - (1/3) * t.^3; % z 方向位置，z = (6/4) * t^4 - (1/3) * t^3

% 绘制动态三维轨迹和速度箭头
figure;
grid on;
xlabel('x');
ylabel('y');
zlabel('z');
title('动态轨迹和速度箭头');
hold on;

% 动态绘制轨迹和速度箭头
for i = 1:length(t)
    % 清除上一个图形
    clf;
    
    % 动态绘制轨迹
    plot3(x(1:i), y(1:i), z(1:i), 'r.-', 'LineWidth', 2);  % 绘制到当前时刻为止的轨迹
    hold on;

    % 动态绘制速度箭头
    quiver3(x(i), y(i), z(i), vx(i), vy(i), vz(i), 0.5, 'MaxHeadSize', 2); % 速度箭头
    
    % 设置图形的轴范围
    axis([-1, 2.5, -1, 2.5, -1, 2.5]);
    
    % 暂停，显示动画效果
    pause(0.05);  
end
