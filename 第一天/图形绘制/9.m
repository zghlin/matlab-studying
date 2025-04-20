%为8.m的更正代码

clc; clear; close all;

% 参数设置
a = -20;
eps0 = 1;
eps1 = 0.0001; % 用于偏移 z1 避免与 eps 冲突
[x, y] = meshgrid(-10:0.2:10);  % 生成网格

% 定义 z1 曲面
z1 = (x.^2 - 2 * y.^2) + eps1;
z2 = a * ones(size(x));        % 初始 z2 是常数面

% 找出 z1 和 z2 接近的点（差值小于 eps0）
r0 = abs(z1 - z2) <= eps0;
zz = r0 .* z2;
xx = r0 .* x;
yy = r0 .* y;

% subplot 2: 点图（右上）
subplot(2, 2, 2);
h1 = plot3(xx(r0~=0), yy(r0~=0), zz(r0~=0), '+');
set(h1, 'MarkerSize', 2);
hold on;
axis([-10 10 -10 10 -80 80]);
grid on;
title('z1 与常数面交点（正视图）');

% subplot 1: 曲面图（左上）
subplot(2, 2, 1);
mesh(x, y, z1);
hold on;
mesh(x, y, z2);
h2 = plot3(xx(r0~=0), yy(r0~=0), zz(r0~=0), '.');
set(h2, 'MarkerSize', 6);
axis([-10 10 -10 10 -80 80]);
grid on;
title('z1 和 z2 曲面交线');

% subplot 3: 变化中的交面
subplot(2, 2, 3);
for i = 1:5
    a = 70 - i * 30;
    z2 = a * ones(size(x));
    r0 = abs(z1 - z2) <= 1;
    zz = r0 .* z2;
    xx = r0 .* x;
    yy = r0 .* y;
    
    mesh(x, y, z1);
    hold on;
    mesh(x, y, z2);
    hidden off;
    
    h2 = plot3(xx(r0~=0), yy(r0~=0), zz(r0~=0), 'o');
    set(h2, 'MarkerSize', 2);
    
    axis([-10 10 -10 10 -80 80]);
    grid on;
    title(['交点变化：a = ', num2str(a)]);
    pause(0.5);
    
    cla;  % 清除当前subplot（只清空这一小图）
end
