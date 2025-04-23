% ƽ�沨��̬ͼ����ʾ

% ��������
lambda = 1;                   % ����
k = 2*pi/lambda;              % ����
theta = pi/4;                 % ��������Ƕ� (45��)
A = 1;                        % ���
t = 0;                        % ʱ���
omega = 2*pi;                 % ��Ƶ��

% �ռ�����
[x, y] = meshgrid(-5:0.05:5, -5:0.05:5);
kx = k * cos(theta);          % x����ʸ����
ky = k * sin(theta);          % y����ʸ����

% ���㲨��
phase = kx*x + ky*y - omega*t;
E = A * cos(phase);

% ��ͼ
figure;
imagesc(E); 
colormap('jet'); 
colorbar;
title('��άƽ�沨 - ĳһʱ��');
axis image;
