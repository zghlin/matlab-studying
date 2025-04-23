function g1()
    % ��������
    lambda = 1;               % ����
    k = 2*pi/lambda;          % ����
    omega = 2*pi;             % Ƶ��
    A = 1;                    % ���
    t_max = 2*pi;             % ���ʱ�䣨һ�����ڣ�
    frames = 100;             % ����֡��

    % ������ͳ��figure����
    fig = figure('Name', '���ĵ���', 'Position', [100 100 800 600]);

    % �����ռ�����
    [x, y, z] = meshgrid(-5:0.1:5, -5:0.1:5, -5:0.1:5);  % ��ά�ռ�
    r1 = sqrt((x - 2).^2 + (y - 2).^2 + z.^2);  % ��һ����Դ��λ����(2,2,0)
    r2 = sqrt((x + 2).^2 + (y + 2).^2 + z.^2);  % �ڶ�����Դ��λ����(-2,-2,0)

    % �������0��r=0 ���趨Ϊ��Сֵ��
    r1(r1 == 0) = 1e-6;
    r2(r2 == 0) = 1e-6;

    % ����ͼ��
    ax = axes(fig, 'Position', [0.1, 0.2, 0.8, 0.75]);
    h = surf(ax, x(:,:,1), y(:,:,1), zeros(size(x(:,:,1))));  % ��ʼ����

    % �����ӽǺ�ͼ������
    colormap jet;
    colorbar;
    title('���ĵ���');
    xlabel('x'); ylabel('y'); zlabel('E(x,y,z,t)');
    zlim(ax, [-2 2]);  % ����z�᷶Χ
    axis(ax, [-5 5 -5 5 -2 2]);
    view(ax, 3);           % ������ά�ӽ�

    % ����ѭ��
    for t = 0:0.1:t_max
        % �����һ���������沨��E1(r, t) = A/r * cos(k*r - omega*t)
        E1 = (A ./ r1) .* cos(k * r1 - omega * t);
        % ����ڶ����������沨��E2(r, t) = A/r * cos(k*r - omega*t)
        E2 = (A ./ r2) .* cos(k * r2 - omega * t);

        % ���ĵ���
        E = E1 + E2;  % ���ĵ���

        % ���²���ͼ�񣬻��Ʋ�ǰ
        h.ZData = E(:,:,1);  % ����z��Ĳ���

        % ���±�����ʾʱ��
        title(ax, sprintf('���ĵ��� - ʱ�� t = %.2f', t));

        % ��ͣ�����ƶ���֡����
        pause(0.05);
    end
end
