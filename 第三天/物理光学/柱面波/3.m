clc,clear,close all;
% 参数设置
lambda = 1;              % 波长
k = 2*pi/lambda;         % 波数
omega = 2*pi;            % 频率
A = 1;                   % 振幅

% 空间网格
[x, y, z] = meshgrid(-5:0.1:5, -5:0.1:5, -1:0.1:1);  % 生成三维空间
r = sqrt(x.^2 + y.^2);  % 计算到波源的距离

% 避免除以0（r=0 处设定为极小值）
r(r==0) = 1e-6;

% 创建图像窗口
figure;

for t = 0:0.05:2
    % 柱面波表达式
    E = (A ./ sqrt(r)) .* cos(k*r - omega*t);  % 振幅随r衰减
    
    % 绘制三维柱面波
    surf(x(:,:,1), y(:,:,1), E(:,:,1));   % 只显示z=0平面的切片
    shading interp;
    colormap jet;
    colorbar;
    title(sprintf('柱面波三维图 - 时间 t = %.2f', t));
    xlabel('x'); ylabel('y'); zlabel('E(x,y,t)');
    zlim([-1 1]);   % 限制z轴范围
    axis([-5 5 -5 5 -1 1]);
    view(45, 35);   % 设置视角
    drawnow;
end
