% 参数设置
lambda = 1;
k = 2*pi/lambda;
theta = pi/4;  % 传播方向角度（45度）
omega = 2*pi;
t = 0;         % 固定时间点
A = 1;

% 波矢分量
kx = k * cos(theta);
ky = k * sin(theta);

% 空间网格
[x, y] = meshgrid(-5:0.05:5, -5:0.05:5);

% 波函数
phase = kx*x + ky*y - omega*t;
E = A * cos(phase);

% 可视化
figure;

% 彩色图
imagesc([-5 5], [-5 5], E); 
colormap(jet);
colorbar;
hold on;

% 等相位线叠加
contour(x, y, E, 20, 'k', 'LineWidth', 0.7);  % 20 条黑色等值线

% 添加波矢箭头
quiver(0, 0, cos(theta), sin(theta), 3, 'w', 'LineWidth', 2, 'MaxHeadSize', 2);
text(1.5*cos(theta), 1.5*sin(theta), '\bfk', 'Color', 'w', 'FontSize', 12);

% 格式调整
axis image;
xlabel('x'); ylabel('y');
title('二维平面波图示：伪彩色 + 等相位线 + 波矢方向');
