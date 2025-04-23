% ��������
lambda = 1;              % ����
k = 2*pi/lambda;         % ����
theta = pi/6;            % ��������30�ȣ�
omega = 2*pi;            % ��Ƶ��
A = 1;                   % ���

% �ռ�����
[x, y] = meshgrid(-5:0.1:5, -5:0.1:5);
kx = k * cos(theta);
ky = k * sin(theta);

% ����ͼ�񴰿�
figure;

for t = 0:0.05:2
    % �������ʽ������ʱ�䴫����
    E = A * cos(kx*x + ky*y - omega*t);
    
    % ������ά����
    surf(x, y, E);
    shading interp;
    colormap jet;
    zlim([-1 1]);
    caxis([-1 1]);
    xlabel('x'); ylabel('y'); zlabel('E(x,y,t)');
    title(sprintf('ƽ�沨��ʱ���д��� - t = %.2f', t));
    
    % �����ӽǣ��ɵ���
    view(45, 35);
    axis tight;
    
    % ����ˢ��
    drawnow;
end
