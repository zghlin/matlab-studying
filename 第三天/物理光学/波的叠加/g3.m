function g3()
    % ��ʼ��������
    A1 = 1;                   % ��1�ĳ�ʼ���
    A2 = 1;                   % ��2�ĳ�ʼ���
    lambda1 = 1;              % ��1�Ĳ���
    lambda2 = 1.2;            % ��2�Ĳ���
    k1 = 2*pi/lambda1;        % ��1�ĳ�ʼ����
    k2 = 2*pi/lambda2;        % ��2�ĳ�ʼ����
    omega = 2*pi;             % Ƶ�ʣ���������������ͬƵ�ʣ�
    t_max = 2*pi;             % ���ʱ�䣨һ�����ڣ�
    x = linspace(-5, 5, 500); % �ռ�����

    % ����GUI����
    fig = figure('Name', 'ʵʱ���ε���', 'Position', [100 100 900 600]);

    % ���UI�ؼ����������
    lbl_A1 = uicontrol(fig, 'Style', 'text', 'Position', [30, 550, 100, 20], 'String', 'Wave 1 Amplitude');
    sl_A1 = uicontrol(fig, 'Style', 'slider', 'Position', [150, 550, 200, 20]);
    sl_A1.Value = A1;

    lbl_A2 = uicontrol(fig, 'Style', 'text', 'Position', [30, 500, 100, 20], 'String', 'Wave 2 Amplitude');
    sl_A2 = uicontrol(fig, 'Style', 'slider', 'Position', [150, 500, 200, 20]);
    sl_A2.Value = A2;

    % ���UI�ؼ�����������
    lbl_k1 = uicontrol(fig, 'Style', 'text', 'Position', [30, 450, 100, 20], 'String', 'Wave 1 k (Wave number)');
    sl_k1 = uicontrol(fig, 'Style', 'slider', 'Position', [150, 450, 200, 20]);
    sl_k1.Value = k1;

    lbl_k2 = uicontrol(fig, 'Style', 'text', 'Position', [30, 400, 100, 20], 'String', 'Wave 2 k (Wave number)');
    sl_k2 = uicontrol(fig, 'Style', 'slider', 'Position', [150, 400, 200, 20]);
    sl_k2.Value = k2;

    % ���UI�ؼ��������ǶȻ���
    lbl_angle1 = uicontrol(fig, 'Style', 'text', 'Position', [30, 350, 100, 20], 'String', 'Wave 1 Angle (deg)');
    sl_angle1 = uicontrol(fig, 'Style', 'slider', 'Position', [150, 350, 200, 20]);
    sl_angle1.Value = 0;

    lbl_angle2 = uicontrol(fig, 'Style', 'text', 'Position', [30, 300, 100, 20], 'String', 'Wave 2 Angle (deg)');
    sl_angle2 = uicontrol(fig, 'Style', 'slider', 'Position', [150, 300, 200, 20]);
    sl_angle2.Value = 0;

    % ����axes������ʾ����
    ax = axes(fig, 'Position', [0.1, 0.2, 0.75, 0.75]);
    axis(ax, [-5 5 -2 2]);
    grid(ax, 'on');
    xlabel(ax, 'x');
    ylabel(ax, 'Amplitude');
    title(ax, '���ε���');

    % ���º���
    function update_wave(~, ~)
        % ��ȡ��ǰ�Ļ���ֵ
        A1 = sl_A1.Value;
        A2 = sl_A2.Value;
        k1 = sl_k1.Value;
        k2 = sl_k2.Value;
        angle1 = deg2rad(sl_angle1.Value); % ת��Ϊ����
        angle2 = deg2rad(sl_angle2.Value); % ת��Ϊ����

        % ���㲨1�Ͳ�2�Ĵ��������������ɽǶȾ���
        E1 = A1 * cos(k1 * (x * cos(angle1)) - omega * t_max); % ���㲨1
        E2 = A2 * cos(k2 * (x * cos(angle2)) - omega * t_max); % ���㲨2

        % ���ĵ���
        E3 = E1 + E2;  % ���ĵ���

        % ���ԭ��ͼ�β����Ƹ��µĲ���
        cla(ax);
        plot(ax, x, E1, 'r', 'DisplayName', 'Wave 1');
        hold(ax, 'on');
        plot(ax, x, E2, 'b', 'DisplayName', 'Wave 2');
        plot(ax, x, E3, 'k', 'DisplayName', 'Wave 3 (Superposition)');
        hold(ax, 'off');

        legend(ax, 'show');
    end

    % ������ص���������²��ΰ�
    addlistener(sl_A1, 'ContinuousValueChange', @update_wave);
    addlistener(sl_A2, 'ContinuousValueChange', @update_wave);
    addlistener(sl_k1, 'ContinuousValueChange', @update_wave);
    addlistener(sl_k2, 'ContinuousValueChange', @update_wave);
    addlistener(sl_angle1, 'ContinuousValueChange', @update_wave);
    addlistener(sl_angle2, 'ContinuousValueChange', @update_wave);

    % ��ʼ������
    update_wave();
end
