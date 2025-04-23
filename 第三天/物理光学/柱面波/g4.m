function g4()
    % 参数设置
    lambda = 1;              % 波长
    k = 2*pi/lambda;         % 波数
    omega = 2*pi;            % 频率
    A = 1;                   % 初始振幅

    % 创建传统的figure窗口
    fig = figure('Name', '柱面波振幅调节', 'Position', [100 100 800 600]);

    % 创建图形显示区域
    ax = axes(fig, 'Position', [0.1, 0.2, 0.8, 0.75]);

    % 创建振幅调整滑动条
    uicontrol('Style', 'text', 'Position', [150 50 200 20], 'String', '调整振幅A');
    slider = uicontrol('Style', 'slider', 'Position', [150 20 500 20], 'Min', 0, 'Max', 5, 'Value', 1);

    % 设置初始显示
    updateWave(slider, ax, lambda, k, omega);

    % 设置滑动条回调
    addlistener(slider, 'ContinuousValueChange', @(src, event) updateWave(src, ax, lambda, k, omega));

    function updateWave(src, ax, lambda, k, omega)
        % 获取当前振幅A
        A = src.Value;  % 获取滑动条的值
        
        % 创建空间网格
        [x, y, z] = meshgrid(-5:0.1:5, -5:0.1:5, -1:0.1:1);  % 三维空间
        r = sqrt(x.^2 + y.^2);  % 计算到源点的距离

        % 避免除以0（r=0 处设定为极小值）
        r(r == 0) = 1e-6;

        % 计算柱面波
        E = (A ./ sqrt(r)) .* cos(k * r - omega * 0);  % t = 0 时的柱面波

        % 更新图形
        surf(ax, x(:,:,1), y(:,:,1), E(:,:,1));
        shading interp;
        colormap jet;
        colorbar;
        title(ax, sprintf('柱面波 - 振幅 A = %.2f', A));
        xlabel(ax, 'x'); ylabel(ax, 'y'); zlabel(ax, 'E(x,y,t)');
        zlim(ax, [-1 1]);   % 设置z轴范围
        axis(ax, [-5 5 -5 5 -1 1]);
        view(ax, 45, 35);   % 设置视角
    end
end
