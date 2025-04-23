function g4()
    % 参数设置
    lambda = 1;              % 波长
    k = 2*pi/lambda;         % 波数
    omega = 2*pi;            % 频率
    A = 1;                   % 初始振幅
    t_max = 2*pi;            % 最大时间（周期）

    % 创建传统的figure窗口
    fig = figure('Name', '球面波传播动画', 'Position', [100 100 800 600]);

    % 创建空间网格
    [x, y, z] = meshgrid(-5:0.1:5, -5:0.1:5, -5:0.1:5);  % 三维空间
    r = sqrt(x.^2 + y.^2 + z.^2);  % 计算到源点的距离

    % 避免除以0（r=0 处设定为极小值）
    r(r == 0) = 1e-6;

    % 初始化图形显示
    ax = axes(fig, 'Position', [0.1, 0.2, 0.8, 0.75]);
    h = surf(ax, x(:,:,1), y(:,:,1), zeros(size(x(:,:,1))));  % 初始波形

    % 设置视角和图形属性
    colormap jet;
    colorbar;
    title('球面波传播动画');
    xlabel('x'); ylabel('y'); zlabel('E(x,y,t)');
    zlim(ax, [-1 1]);
    axis(ax, [-5 5 -5 5 -1 1]);
    view(ax, 2);   % 设置从上方观察

    % 动画循环
    for t = 0:0.1:t_max
        % 计算球面波：E(r, t) = A/r * cos(k*r - omega*t)
        E = (A ./ r) .* cos(k * r - omega * t);

        % 更新波形图像
        h.ZData = E(:,:,1);  % 更新z轴的波形
        title(ax, sprintf('球面波 - 时间 t = %.2f', t));  % 更新标题

        % 暂停，控制动画帧速率
        pause(0.1);
    end
end
