% ��������
lambda = 1;
k = 2*pi/lambda;
theta = pi/4;  % ��������Ƕȣ�45�ȣ�
omega = 2*pi;
t = 0;         % �̶�ʱ���
A = 1;

% ��ʸ����
kx = k * cos(theta);
ky = k * sin(theta);

% �ռ�����
[x, y] = meshgrid(-5:0.05:5, -5:0.05:5);

% ������
phase = kx*x + ky*y - omega*t;
E = A * cos(phase);

% ���ӻ�
figure;

% ��ɫͼ
imagesc([-5 5], [-5 5], E); 
colormap(jet);
colorbar;
hold on;

% ����λ�ߵ���
contour(x, y, E, 20, 'k', 'LineWidth', 0.7);  % 20 ����ɫ��ֵ��

% ��Ӳ�ʸ��ͷ
quiver(0, 0, cos(theta), sin(theta), 3, 'w', 'LineWidth', 2, 'MaxHeadSize', 2);
text(1.5*cos(theta), 1.5*sin(theta), '\bfk', 'Color', 'w', 'FontSize', 12);

% ��ʽ����
axis image;
xlabel('x'); ylabel('y');
title('��άƽ�沨ͼʾ��α��ɫ + ����λ�� + ��ʸ����');
