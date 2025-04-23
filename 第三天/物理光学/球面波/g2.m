function g2()
    % 参数设置
    lambda = 1;              % 波长
    k = 2*pi/lambda;         % 波数
    omega = 2*pi;            % 频率
    A = 1;                   % 初始振幅

    % 创建传统的figure窗口
    fig = figure('Name', '球面波传播', 'Position', [100 100 800 600]);

    % 创建图形显示区域
    ax = axes(fig, 'Position', [0.1, 0.2, 0.8, 0.75]);

    % 设置初始时间
    t_init = 0;  % 初始时间设置为 0
    % 设置初始显示
    updateWave(ax, lambda, k, omega, A, t_init);

    % 创建时间控制滑动条
    uicontrol('Style', 'text', 'Position', [150 50 200 20], 'String', '调整时间');
    slider = uicontrol('Style', 'slider', 'Position', [150 20 500 20], 'Min', 0, 'Max', 2*pi, 'Value', t_init);

    % 设置滑动条回调
    addlistener(slider, 'ContinuousValueChange', @(src, event) updateWave(ax, lambda, k, omega, A, src.Value));

    function updateWave(ax, lambda, k, omega, A, t)
        % 创建空间网格
        [x, y, z] = meshgrid(-5:0.1:5, -5:0.1:5, -5:0.1:5);  % 三维空间
        r = sqrt(x.^2 + y.^2 + z.^2);  % 计算到源点的距离

        % 避免除以0（r=0 处设定为极小值）
        r(r == 0) = 1e-6;

        % 计算球面波：E(r, t) = A/r * cos(k*r - omega*t)
        E = (A ./ r) .* cos(k * r - omega * t);

        % 清除之前的图像，避免重叠
        cla(ax);

        % 绘制球面波的等值面
        % 使用 contour3 来绘制球面波的等幅面
        contour3(ax, x(:,:,1), y(:,:,1), E(:,:,1), 30);  % 绘制等值面
        shading interp;
        colormap jet;
        colorbar;
        title(ax, sprintf('球面波 - 时间 t = %.2f', t));
        xlabel(ax, 'x'); ylabel(ax, 'y'); zlabel(ax, 'E(x,y,t)');
        zlim(ax, [-1 1]);   % 设置z轴范围
        axis(ax, [-5 5 -5 5 -5 5]);
        view(ax, 45, 35);   % 设置视角
    end
end
