% 平面波静态图像演示

% 参数设置
lambda = 1;                   % 波长
k = 2*pi/lambda;              % 波数
theta = pi/4;                 % 传播方向角度 (45度)
A = 1;                        % 振幅
t = 0;                        % 时间点
omega = 2*pi;                 % 角频率

% 空间网格
[x, y] = meshgrid(-5:0.05:5, -5:0.05:5);
kx = k * cos(theta);          % x方向波矢分量
ky = k * sin(theta);          % y方向波矢分量

% 计算波动
phase = kx*x + ky*y - omega*t;
E = A * cos(phase);

% 绘图
figure;
imagesc(E); 
colormap('jet'); 
colorbar;
title('二维平面波 - 某一时刻');
axis image;
