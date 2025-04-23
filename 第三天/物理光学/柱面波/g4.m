function g4()
    % ��������
    lambda = 1;              % ����
    k = 2*pi/lambda;         % ����
    omega = 2*pi;            % Ƶ��
    A = 1;                   % ��ʼ���

    % ������ͳ��figure����
    fig = figure('Name', '���沨�������', 'Position', [100 100 800 600]);

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
        r = sqrt(x.^2 + y.^2);  % ���㵽Դ��ľ���

        % �������0��r=0 ���趨Ϊ��Сֵ��
        r(r == 0) = 1e-6;

        % �������沨
        E = (A ./ sqrt(r)) .* cos(k * r - omega * 0);  % t = 0 ʱ�����沨

        % ����ͼ��
        surf(ax, x(:,:,1), y(:,:,1), E(:,:,1));
        shading interp;
        colormap jet;
        colorbar;
        title(ax, sprintf('���沨 - ��� A = %.2f', A));
        xlabel(ax, 'x'); ylabel(ax, 'y'); zlabel(ax, 'E(x,y,t)');
        zlim(ax, [-1 1]);   % ����z�᷶Χ
        axis(ax, [-5 5 -5 5 -1 1]);
        view(ax, 45, 35);   % �����ӽ�
    end
end
