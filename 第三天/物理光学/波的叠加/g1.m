function g1()
    % 参数设置
    lambda = 1;               % 波长
    k = 2*pi/lambda;          % 波数
    omega = 2*pi;             % 频率
    A = 1;                    % 振幅
    t_max = 2*pi;             % 最大时间（一个周期）
    frames = 100;             % 动画帧数

    % 创建传统的figure窗口
    fig = figure('Name', '波的叠加', 'Position', [100 100 800 600]);

    % 创建空间网格
    [x, y, z] = meshgrid(-5:0.1:5, -5:0.1:5, -5:0.1:5);  % 三维空间
    r1 = sqrt((x - 2).^2 + (y - 2).^2 + z.^2);  % 第一个波源的位置在(2,2,0)
    r2 = sqrt((x + 2).^2 + (y + 2).^2 + z.^2);  % 第二个波源的位置在(-2,-2,0)

    % 避免除以0（r=0 处设定为极小值）
    r1(r1 == 0) = 1e-6;
    r2(r2 == 0) = 1e-6;

    % 创建图形
    ax = axes(fig, 'Position', [0.1, 0.2, 0.8, 0.75]);
    h = surf(ax, x(:,:,1), y(:,:,1), zeros(size(x(:,:,1))));  % 初始波形

    % 设置视角和图形属性
    colormap jet;
    colorbar;
    title('波的叠加');
    xlabel('x'); ylabel('y'); zlabel('E(x,y,z,t)');
    zlim(ax, [-2 2]);  % 设置z轴范围
    axis(ax, [-5 5 -5 5 -2 2]);
    view(ax, 3);           % 设置三维视角

    % 动画循环
    for t = 0:0.1:t_max
        % 计算第一个波的球面波：E1(r, t) = A/r * cos(k*r - omega*t)
        E1 = (A ./ r1) .* cos(k * r1 - omega * t);
        % 计算第二个波的球面波：E2(r, t) = A/r * cos(k*r - omega*t)
        E2 = (A ./ r2) .* cos(k * r2 - omega * t);

        % 波的叠加
        E = E1 + E2;  % 波的叠加

        % 更新波形图像，绘制波前
        h.ZData = E(:,:,1);  % 更新z轴的波形

        % 更新标题显示时间
        title(ax, sprintf('波的叠加 - 时间 t = %.2f', t));

        % 暂停，控制动画帧速率
        pause(0.05);
    end
end
