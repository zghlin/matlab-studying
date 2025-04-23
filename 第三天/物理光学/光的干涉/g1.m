function g1()
    % 创建 GUI 窗口
    fig = figure('Name', '光的干涉', 'Position', [100 100 800 600]);

    % 添加滑块控制波长
    lbl_lambda = uicontrol(fig, 'Style', 'text', 'Position', [30, 550, 120, 20], 'String', '光的波长 λ');
    sl_lambda = uicontrol(fig, 'Style', 'slider', 'Position', [150, 550, 200, 20]);
    sl_lambda.Value = 0.5;
    sl_lambda.Min = 0.1;
    sl_lambda.Max = 1.0;

    % 添加滑块控制间距
    lbl_d = uicontrol(fig, 'Style', 'text', 'Position', [30, 500, 120, 20], 'String', '光源间距 d');
    sl_d = uicontrol(fig, 'Style', 'slider', 'Position', [150, 500, 200, 20]);
    sl_d.Value = 1.0;
    sl_d.Min = 0.5;
    sl_d.Max = 2.0;

    % 创建 axes 用于显示干涉图样
    ax = axes(fig, 'Position', [0.1, 0.2, 0.75, 0.75]);
    xlabel(ax, 'x');
    ylabel(ax, 'Intensity');
    title(ax, '光的干涉图样');

    % 更新波形的函数
    function update_interference(~, ~)
        % 获取当前滑块值
        lambda = sl_lambda.Value;  % 波长
        d = sl_d.Value;            % 光源间距

        % 空间坐标
        x = linspace(-10, 10, 1000);  % 空间范围
        k = 2*pi / lambda;            % 波数
        R = 10;                       % 光源到屏幕的距离

        % 光源1和光源2的相位差
        phase_diff = k * d * x / R;  % 两束光波的相位差

        % 模拟两束光波的电场和干涉图样
        E1 = cos(k * x);             % 光源1的电场
        E2 = cos(k * x + phase_diff);% 光源2的电场

        % 波的叠加
        I = (E1 + E2).^2;            % 光强（电场的平方）

        % 清除原有图形并绘制更新的干涉图样
        cla(ax);
        plot(ax, x, I, 'k', 'LineWidth', 2);
    end

    % 将滑块回调函数与更新干涉图样绑定
    addlistener(sl_lambda, 'ContinuousValueChange', @update_interference);
    addlistener(sl_d, 'ContinuousValueChange', @update_interference);

    % 初始化干涉图样
    update_interference();
end
