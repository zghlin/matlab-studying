function g6()
    % ��������
    lambda = 1;              % ����
    k = 2*pi/lambda;         % ����
    omega = 2*pi;            % Ƶ��
    A = 1;                   % ��ʼ���

    % ������ͳ��figure����
    fig = figure('Name', 'ƽ�沨�������', 'Position', [100 100 800 600]);

    % ����ͼ����ʾ����
    ax = axes(fig, 'Position', [0.1, 0.2, 0.8, 0.75]);

    % �����������������
    uicontrol('Style', 'text', 'Position', [150 50 200 20], 'String', '�������A');
    slider = uicontrol('Style', 'slider', 'Position', [150 20 500 20], 'Min', 0, 'Max', 5, 'Value', 1);

    % ���ó�ʼ��ʾ
    updateWave(slider, ax, lambda, k, omega);

    % ���û������ص�
    addlistener(slider, 'ContinuousValueChange', @(src, event) updateWave(src, ax, lambda, k, omega));

    function updateWave(src, ax, lambda, k, omega)
        % ��ȡ��ǰ���A
        A = src.Value;  % ��ȡ��������ֵ
        
        % �����ռ�����
        [x, y, z] = meshgrid(-5:0.1:5, -5:0.1:5, -1:0.1:1);  % ��ά�ռ�
        % ����ƽ�沨��E(x, y, t) = A * cos(k * x - omega * t)
        t = 0;  % �������� t = 0������Ժ����޸�������ʱ��ı仯
        E = A * cos(k * x - omega * t);  % �������ʽ

        % ����ͼ��
        surf(ax, x(:,:,1), y(:,:,1), E(:,:,1));  % ֻ���� z = 0 ƽ�����Ƭ
        shading interp;
        colormap jet;
        colorbar;
        title(ax, sprintf('ƽ�沨 - ��� A = %.2f', A));
        xlabel(ax, 'x'); ylabel(ax, 'y'); zlabel(ax, 'E(x,y,t)');
        zlim(ax, [-1 1]);   % ����z�᷶Χ
        axis(ax, [-5 5 -5 5 -1 1]);
        view(ax, 45, 35);   % �����ӽ�
    end
end
