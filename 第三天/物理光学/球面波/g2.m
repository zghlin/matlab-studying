function g2()
    % ��������
    lambda = 1;              % ����
    k = 2*pi/lambda;         % ����
    omega = 2*pi;            % Ƶ��
    A = 1;                   % ��ʼ���

    % ������ͳ��figure����
    fig = figure('Name', '���沨����', 'Position', [100 100 800 600]);

    % ����ͼ����ʾ����
    ax = axes(fig, 'Position', [0.1, 0.2, 0.8, 0.75]);

    % ���ó�ʼʱ��
    t_init = 0;  % ��ʼʱ������Ϊ 0
    % ���ó�ʼ��ʾ
    updateWave(ax, lambda, k, omega, A, t_init);

    % ����ʱ����ƻ�����
    uicontrol('Style', 'text', 'Position', [150 50 200 20], 'String', '����ʱ��');
    slider = uicontrol('Style', 'slider', 'Position', [150 20 500 20], 'Min', 0, 'Max', 2*pi, 'Value', t_init);

    % ���û������ص�
    addlistener(slider, 'ContinuousValueChange', @(src, event) updateWave(ax, lambda, k, omega, A, src.Value));

    function updateWave(ax, lambda, k, omega, A, t)
        % �����ռ�����
        [x, y, z] = meshgrid(-5:0.1:5, -5:0.1:5, -5:0.1:5);  % ��ά�ռ�
        r = sqrt(x.^2 + y.^2 + z.^2);  % ���㵽Դ��ľ���

        % �������0��r=0 ���趨Ϊ��Сֵ��
        r(r == 0) = 1e-6;

        % �������沨��E(r, t) = A/r * cos(k*r - omega*t)
        E = (A ./ r) .* cos(k * r - omega * t);

        % ���֮ǰ��ͼ�񣬱����ص�
        cla(ax);

        % �������沨�ĵ�ֵ��
        % ʹ�� contour3 ���������沨�ĵȷ���
        contour3(ax, x(:,:,1), y(:,:,1), E(:,:,1), 30);  % ���Ƶ�ֵ��
        shading interp;
        colormap jet;
        colorbar;
        title(ax, sprintf('���沨 - ʱ�� t = %.2f', t));
        xlabel(ax, 'x'); ylabel(ax, 'y'); zlabel(ax, 'E(x,y,t)');
        zlim(ax, [-1 1]);   % ����z�᷶Χ
        axis(ax, [-5 5 -5 5 -5 5]);
        view(ax, 45, 35);   % �����ӽ�
    end
end
