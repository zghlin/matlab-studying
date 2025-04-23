% ��������
lambda = 1;
k = 2*pi/lambda;
theta = pi/4;          % ��������Ƕȣ�45�ȣ�
omega = 2*pi;
A = 1;

% ��ʸ����
kx = k * cos(theta);
ky = k * sin(theta);

% �ռ�����
[x, y] = meshgrid(-5:0.1:5, -5:0.1:5);

% ����չʾ
figure;
for t = 0:0.05:2
    phase = kx*x + ky*y - omega*t;
    E = A * cos(phase);  % ���� sin(phase)��Ч������

    surf(x, y, E);
    shading interp;        % ƽ������
    colormap('jet');
    zlim([-1 1]);          % �̶������ʾ��Χ
    caxis([-1 1]);         % ������ɫһ��
    title(sprintf('ƽ�沨���� - ʱ�� t = %.2f', t));
    xlabel('x'); ylabel('y'); zlabel('E(x,y,t)');
    view(45, 40);          % �����ӽ�
    axis tight;
    drawnow;
end
