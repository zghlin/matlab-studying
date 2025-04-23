% 柱面波 - 某一时刻的空间分布

% 参数设置
lambda = 1;
k = 2*pi/lambda;
omega = 2*pi;  % 频率
A = 1;
t = 0;         % 时间固定

% 空间网格
[x, y] = meshgrid(-5:0.05:5, -5:0.05:5);
r = sqrt(x.^2 + y.^2);        % 极坐标距离

% 避免除以0（r=0 处设定为极小值）
r(r==0) = 1e-6;

% 柱面波表达式（简化2D形式）
E = (A ./ sqrt(r)) .* cos(k*r - omega*t);

% 可视化
figure;
imagesc([-5 5], [-5 5], E);
colormap(jet);
colorbar;
axis image;
title('柱面波静态图像（某一时刻）');
xlabel('x'); ylabel('y');
