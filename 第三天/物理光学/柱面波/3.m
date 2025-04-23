clc,clear,close all;
% ��������
lambda = 1;              % ����
k = 2*pi/lambda;         % ����
omega = 2*pi;            % Ƶ��
A = 1;                   % ���

% �ռ�����
[x, y, z] = meshgrid(-5:0.1:5, -5:0.1:5, -1:0.1:1);  % ������ά�ռ�
r = sqrt(x.^2 + y.^2);  % ���㵽��Դ�ľ���

% �������0��r=0 ���趨Ϊ��Сֵ��
r(r==0) = 1e-6;

% ����ͼ�񴰿�
figure;

for t = 0:0.05:2
    % ���沨���ʽ
    E = (A ./ sqrt(r)) .* cos(k*r - omega*t);  % �����r˥��
    
    % ������ά���沨
    surf(x(:,:,1), y(:,:,1), E(:,:,1));   % ֻ��ʾz=0ƽ�����Ƭ
    shading interp;
    colormap jet;
    colorbar;
    title(sprintf('���沨��άͼ - ʱ�� t = %.2f', t));
    xlabel('x'); ylabel('y'); zlabel('E(x,y,t)');
    zlim([-1 1]);   % ����z�᷶Χ
    axis([-5 5 -5 5 -1 1]);
    view(45, 35);   % �����ӽ�
    drawnow;
end
