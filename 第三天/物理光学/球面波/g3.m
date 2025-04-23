function g3()
    % ��������
    lambda = 1;              % ����
    k = 2*pi/lambda;         % ����
    omega = 2*pi;            % Ƶ��
    A = 1;                   % ��ʼ���
    t = 0;                   % �̶�ʱ��� t = 0

    % ������ͳ��figure����
    fig = figure('Name', '��̬���沨�ֲ�', 'Position', [100 100 800 600]);

    % �����ռ�����
    [x, y, z] = meshgrid(-5:0.1:5, -5:0.1:5, -5:0.1:5);  % ��ά�ռ�
    r = sqrt(x.^2 + y.^2 + z.^2);  % ���㵽Դ��ľ���

    % �������0��r=0 ���趨Ϊ��Сֵ��
    r(r == 0) = 1e-6;

    % �������沨��E(r, t) = A/r * cos(k*r - omega*t)
    E = (A ./ r) .* cos(k * r - omega * t);

    % ���ƾ�̬ͼ����ʾĳһʱ�̵����沨�ֲ�
    % ��������ѡ����� z = 0 ƽ�����Ƭ
    surf(x(:,:,1), y(:,:,1), E(:,:,1));  % ֻ���� z = 0 ƽ�����Ƭ
    shading interp;
    colormap jet;
    colorbar;
    title('���沨��ʱ�� t = 0 �ķֲ�');
    xlabel('x'); ylabel('y'); zlabel('E(x,y,t)');
    zlim([-1 1]);   % ����z�᷶Χ
    axis([-5 5 -5 5 -1 1]);
    view(2);   % ���ô��Ϸ��۲�
end
