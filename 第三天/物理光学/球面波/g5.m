function g5()
    % 参数设置
    lambda = 1;               % 波长
    k = 2*pi/lambda;          % 波数
    omega = 2*pi;             % 频率
    A = 1;                    % 振幅
    t_max = 2*pi;             % 最大时间（一个周期）
    frames = 100;             % 动画帧数

    % 创建传统的figure窗口
    fig = figure('Name', '球面波三维传播', 'Position', [100 100 800 600]);

    % 创建空间网格
    [x, y, z] = meshgrid(-5:0.1:5, -5:0.1:5, -5:0.1:5);  % 三维空间
    r = sqrt(x.^2 + y.^2 + z.^2);  % 计算到源点的距离

    % 避免除以0（r=0 处设定为极小值）
    r(r == 0) = 1e-6;

    % 创建图形
    ax = axes(fig, 'Position', [0.1, 0.2, 0.8, 0.75]);
    h = surf(ax, x(:,:,1), y(:,:,1), zeros(size(x(:,:,1))));  % 初始波形

    % 设置视角和图形属性
    colormap jet;
    colorbar;
    title('球面波三维传播');
    xlabel('x'); ylabel('y'); zlabel('E(x,y,z,t)');
    zlim(ax, [-1 1]);  % 设置z轴范围
    axis(ax, [-5 5 -5 5 -1 1]);
    view(3);           % 设置三维视角

    % 动画循环
    for t = 0:0.1:t_max
        % 计算球面波：E(r, t) = A/r * cos(k*r - omega*t)
        E = (A ./ r) .* cos(k * r - omega * t);

        % 更新波形图像，绘制波前
        h.ZData = E(:,:,1);  % 更新z轴的波形

        % 更新标题显示时间
        title(ax, sprintf('球面波 - 时间 t = %.2f', t));

        % 暂停，控制动画帧速率
        pause(0.05);
    end
end
