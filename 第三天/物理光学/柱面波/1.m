% ���沨 - ĳһʱ�̵Ŀռ�ֲ�

% ��������
lambda = 1;
k = 2*pi/lambda;
omega = 2*pi;  % Ƶ��
A = 1;
t = 0;         % ʱ��̶�

% �ռ�����
[x, y] = meshgrid(-5:0.05:5, -5:0.05:5);
r = sqrt(x.^2 + y.^2);        % ���������

% �������0��r=0 ���趨Ϊ��Сֵ��
r(r==0) = 1e-6;

% ���沨���ʽ����2D��ʽ��
E = (A ./ sqrt(r)) .* cos(k*r - omega*t);

% ���ӻ�
figure;
imagesc([-5 5], [-5 5], E);
colormap(jet);
colorbar;
axis image;
title('���沨��̬ͼ��ĳһʱ�̣�');
xlabel('x'); ylabel('y');
