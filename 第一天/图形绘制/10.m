%为8.m的静态更正版本
clc; clear; close all;

% 参数设置
eps0 = 1;
eps1 = 1e-4;  % 避免覆盖 eps 内置函数
[x, y] = meshgrid(-10:0.2:10);  % 生成网格

% 定义 z1 曲面
z1 = (x.^2 - 2 * y.^2) + eps1;

% 子图1：绘制主曲面 z1
subplot(2,2,1);
mesh(x, y, z1);
title('曲面 z_1 = x^2 - 2y^2');
xlabel('x'); ylabel('y'); zlabel('z');
grid on;
axis([-10 10 -10 10 -80 80]);

% 子图2：绘制初始 z2 面（a = -20）
a = -20;
z2 = a * ones(size(x));
r0 = abs(z1 - z2) <= eps0;
zz = r0 .* z2;
xx = r0 .* x;
yy = r0 .* y;

subplot(2,2,2);
mesh(x, y, z1); hold on;
mesh(x, y, z2);
plot3(xx(r0~=0), yy(r0~=0), zz(r0~=0), 'r.', 'MarkerSize', 6);
title(['交线（z_2 = ', num2str(a), '）']);
xlabel('x'); ylabel('y'); zlabel('z');
grid on;
axis([-10 10 -10 10 -80 80]);

% 子图3：一次性绘制多个交线（a 从 40 到 -50）
subplot(2,2,[3,4]);
mesh(x, y, z1);
hold on;
colors = lines(5);  % 提取5种颜色

for i = 1:5
    a = 70 - i * 30;  % 从 40 到 -50
    z2 = a * ones(size(x));
    r0 = abs(z1 - z2) <= eps0;
    zz = r0 .* z2;
    xx = r0 .* x;
    yy = r0 .* y;
    
    mesh(x, y, z2, 'FaceAlpha', 0.1);  % 半透明面
    plot3(xx(r0~=0), yy(r0~=0), zz(r0~=0), '.', 'Color', colors(i,:), 'MarkerSize', 6);
end

title('多个不同高度平面的交线');
xlabel('x'); ylabel('y'); zlabel('z');
axis([-10 10 -10 10 -80 80]);
grid on;
legend('z_1', 'z_2 @ 40', 'z_2 @ 10', 'z_2 @ -20', 'z_2 @ -50', 'Location','northeastoutside');
