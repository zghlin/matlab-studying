function g4()
    % ��������
    lambda = 1;              % ����
    k = 2*pi/lambda;         % ����
    omega = 2*pi;            % Ƶ��
    A = 1;                   % ��ʼ���
    t_max = 2*pi;            % ���ʱ�䣨���ڣ�

    % ������ͳ��figure����
    fig = figure('Name', '���沨��������', 'Position', [100 100 800 600]);

    % �����ռ�����
    [x, y, z] = meshgrid(-5:0.1:5, -5:0.1:5, -5:0.1:5);  % ��ά�ռ�
    r = sqrt(x.^2 + y.^2 + z.^2);  % ���㵽Դ��ľ���

    % �������0��r=0 ���趨Ϊ��Сֵ��
    r(r == 0) = 1e-6;

    % ��ʼ��ͼ����ʾ
    ax = axes(fig, 'Position', [0.1, 0.2, 0.8, 0.75]);
    h = surf(ax, x(:,:,1), y(:,:,1), zeros(size(x(:,:,1))));  % ��ʼ����

    % �����ӽǺ�ͼ������
    colormap jet;
    colorbar;
    title('���沨��������');
    xlabel('x'); ylabel('y'); zlabel('E(x,y,t)');
    zlim(ax, [-1 1]);
    axis(ax, [-5 5 -5 5 -1 1]);
    view(ax, 2);   % ���ô��Ϸ��۲�

    % ����ѭ��
    for t = 0:0.1:t_max
        % �������沨��E(r, t) = A/r * cos(k*r - omega*t)
        E = (A ./ r) .* cos(k * r - omega * t);

        % ���²���ͼ��
        h.ZData = E(:,:,1);  % ����z��Ĳ���
        title(ax, sprintf('���沨 - ʱ�� t = %.2f', t));  % ���±���

        % ��ͣ�����ƶ���֡����
        pause(0.1);
    end
end
