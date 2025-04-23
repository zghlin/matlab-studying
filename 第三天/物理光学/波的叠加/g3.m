function g3()
    % 初始参数设置
    A1 = 1;                   % 波1的初始振幅
    A2 = 1;                   % 波2的初始振幅
    lambda1 = 1;              % 波1的波长
    lambda2 = 1.2;            % 波2的波长
    k1 = 2*pi/lambda1;        % 波1的初始波数
    k2 = 2*pi/lambda2;        % 波2的初始波数
    omega = 2*pi;             % 频率（假设两个波有相同频率）
    t_max = 2*pi;             % 最大时间（一个周期）
    x = linspace(-5, 5, 500); % 空间坐标

    % 创建GUI窗口
    fig = figure('Name', '实时波形叠加', 'Position', [100 100 900 600]);

    % 添加UI控件：振幅滑块
    lbl_A1 = uicontrol(fig, 'Style', 'text', 'Position', [30, 550, 100, 20], 'String', 'Wave 1 Amplitude');
    sl_A1 = uicontrol(fig, 'Style', 'slider', 'Position', [150, 550, 200, 20]);
    sl_A1.Value = A1;

    lbl_A2 = uicontrol(fig, 'Style', 'text', 'Position', [30, 500, 100, 20], 'String', 'Wave 2 Amplitude');
    sl_A2 = uicontrol(fig, 'Style', 'slider', 'Position', [150, 500, 200, 20]);
    sl_A2.Value = A2;

    % 添加UI控件：波数滑块
    lbl_k1 = uicontrol(fig, 'Style', 'text', 'Position', [30, 450, 100, 20], 'String', 'Wave 1 k (Wave number)');
    sl_k1 = uicontrol(fig, 'Style', 'slider', 'Position', [150, 450, 200, 20]);
    sl_k1.Value = k1;

    lbl_k2 = uicontrol(fig, 'Style', 'text', 'Position', [30, 400, 100, 20], 'String', 'Wave 2 k (Wave number)');
    sl_k2 = uicontrol(fig, 'Style', 'slider', 'Position', [150, 400, 200, 20]);
    sl_k2.Value = k2;

    % 添加UI控件：传播角度滑块
    lbl_angle1 = uicontrol(fig, 'Style', 'text', 'Position', [30, 350, 100, 20], 'String', 'Wave 1 Angle (deg)');
    sl_angle1 = uicontrol(fig, 'Style', 'slider', 'Position', [150, 350, 200, 20]);
    sl_angle1.Value = 0;

    lbl_angle2 = uicontrol(fig, 'Style', 'text', 'Position', [30, 300, 100, 20], 'String', 'Wave 2 Angle (deg)');
    sl_angle2 = uicontrol(fig, 'Style', 'slider', 'Position', [150, 300, 200, 20]);
    sl_angle2.Value = 0;

    % 创建axes用于显示波形
    ax = axes(fig, 'Position', [0.1, 0.2, 0.75, 0.75]);
    axis(ax, [-5 5 -2 2]);
    grid(ax, 'on');
    xlabel(ax, 'x');
    ylabel(ax, 'Amplitude');
    title(ax, '波形叠加');

    % 更新函数
    function update_wave(~, ~)
        % 获取当前的滑块值
        A1 = sl_A1.Value;
        A2 = sl_A2.Value;
        k1 = sl_k1.Value;
        k2 = sl_k2.Value;
        angle1 = deg2rad(sl_angle1.Value); % 转换为弧度
        angle2 = deg2rad(sl_angle2.Value); % 转换为弧度

        % 计算波1和波2的传播：传播方向由角度决定
        E1 = A1 * cos(k1 * (x * cos(angle1)) - omega * t_max); % 计算波1
        E2 = A2 * cos(k2 * (x * cos(angle2)) - omega * t_max); % 计算波2

        % 波的叠加
        E3 = E1 + E2;  % 波的叠加

        % 清除原有图形并绘制更新的波形
        cla(ax);
        plot(ax, x, E1, 'r', 'DisplayName', 'Wave 1');
        hold(ax, 'on');
        plot(ax, x, E2, 'b', 'DisplayName', 'Wave 2');
        plot(ax, x, E3, 'k', 'DisplayName', 'Wave 3 (Superposition)');
        hold(ax, 'off');

        legend(ax, 'show');
    end

    % 将滑块回调函数与更新波形绑定
    addlistener(sl_A1, 'ContinuousValueChange', @update_wave);
    addlistener(sl_A2, 'ContinuousValueChange', @update_wave);
    addlistener(sl_k1, 'ContinuousValueChange', @update_wave);
    addlistener(sl_k2, 'ContinuousValueChange', @update_wave);
    addlistener(sl_angle1, 'ContinuousValueChange', @update_wave);
    addlistener(sl_angle2, 'ContinuousValueChange', @update_wave);

    % 初始化波形
    update_wave();
end
