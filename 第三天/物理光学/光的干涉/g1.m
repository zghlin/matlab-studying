function g1()
    % ���� GUI ����
    fig = figure('Name', '��ĸ���', 'Position', [100 100 800 600]);

    % ��ӻ�����Ʋ���
    lbl_lambda = uicontrol(fig, 'Style', 'text', 'Position', [30, 550, 120, 20], 'String', '��Ĳ��� ��');
    sl_lambda = uicontrol(fig, 'Style', 'slider', 'Position', [150, 550, 200, 20]);
    sl_lambda.Value = 0.5;
    sl_lambda.Min = 0.1;
    sl_lambda.Max = 1.0;

    % ��ӻ�����Ƽ��
    lbl_d = uicontrol(fig, 'Style', 'text', 'Position', [30, 500, 120, 20], 'String', '��Դ��� d');
    sl_d = uicontrol(fig, 'Style', 'slider', 'Position', [150, 500, 200, 20]);
    sl_d.Value = 1.0;
    sl_d.Min = 0.5;
    sl_d.Max = 2.0;

    % ���� axes ������ʾ����ͼ��
    ax = axes(fig, 'Position', [0.1, 0.2, 0.75, 0.75]);
    xlabel(ax, 'x');
    ylabel(ax, 'Intensity');
    title(ax, '��ĸ���ͼ��');

    % ���²��εĺ���
    function update_interference(~, ~)
        % ��ȡ��ǰ����ֵ
        lambda = sl_lambda.Value;  % ����
        d = sl_d.Value;            % ��Դ���

        % �ռ�����
        x = linspace(-10, 10, 1000);  % �ռ䷶Χ
        k = 2*pi / lambda;            % ����
        R = 10;                       % ��Դ����Ļ�ľ���

        % ��Դ1�͹�Դ2����λ��
        phase_diff = k * d * x / R;  % �����Ⲩ����λ��

        % ģ�������Ⲩ�ĵ糡�͸���ͼ��
        E1 = cos(k * x);             % ��Դ1�ĵ糡
        E2 = cos(k * x + phase_diff);% ��Դ2�ĵ糡

        % ���ĵ���
        I = (E1 + E2).^2;            % ��ǿ���糡��ƽ����

        % ���ԭ��ͼ�β����Ƹ��µĸ���ͼ��
        cla(ax);
        plot(ax, x, I, 'k', 'LineWidth', 2);
    end

    % ������ص���������¸���ͼ����
    addlistener(sl_lambda, 'ContinuousValueChange', @update_interference);
    addlistener(sl_d, 'ContinuousValueChange', @update_interference);

    % ��ʼ������ͼ��
    update_interference();
end
