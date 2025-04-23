% 参数设置
lambda = 1;              % 波长
k = 2*pi/lambda;         % 波数
theta = pi/6;            % 传播方向（30度）
omega = 2*pi;            % 角频率
A = 1;                   % 振幅

% 空间网格
[x, y] = meshgrid(-5:0.1:5, -5:0.1:5);
kx = k * cos(theta);
ky = k * sin(theta);

% 创建图像窗口
figure;

for t = 0:0.05:2
    % 波动表达式（波随时间传播）
    E = A * cos(kx*x + ky*y - omega*t);
    
    % 绘制三维波面
    surf(x, y, E);
    shading interp;
    colormap jet;
    zlim([-1 1]);
    caxis([-1 1]);
    xlabel('x'); ylabel('y'); zlabel('E(x,y,t)');
    title(sprintf('平面波在时间中传播 - t = %.2f', t));
    
    % 设置视角（可调）
    view(45, 35);
    axis tight;
    
    % 动画刷新
    drawnow;
end
