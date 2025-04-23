% 参数设置
lambda = 1;
k = 2*pi/lambda;
theta = pi/4;          % 传播方向角度（45度）
omega = 2*pi;
A = 1;

% 波矢分量
kx = k * cos(theta);
ky = k * sin(theta);

% 空间网格
[x, y] = meshgrid(-5:0.1:5, -5:0.1:5);

% 动画展示
figure;
for t = 0:0.05:2
    phase = kx*x + ky*y - omega*t;
    E = A * cos(phase);  % 或者 sin(phase)，效果类似

    surf(x, y, E);
    shading interp;        % 平滑表面
    colormap('jet');
    zlim([-1 1]);          % 固定振幅显示范围
    caxis([-1 1]);         % 保持颜色一致
    title(sprintf('平面波传播 - 时间 t = %.2f', t));
    xlabel('x'); ylabel('y'); zlabel('E(x,y,t)');
    view(45, 40);          % 设置视角
    axis tight;
    drawnow;
end
