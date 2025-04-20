%Ϊ8.m�ĸ�������

clc; clear; close all;

% ��������
a = -20;
eps0 = 1;
eps1 = 0.0001; % ����ƫ�� z1 ������ eps ��ͻ
[x, y] = meshgrid(-10:0.2:10);  % ��������

% ���� z1 ����
z1 = (x.^2 - 2 * y.^2) + eps1;
z2 = a * ones(size(x));        % ��ʼ z2 �ǳ�����

% �ҳ� z1 �� z2 �ӽ��ĵ㣨��ֵС�� eps0��
r0 = abs(z1 - z2) <= eps0;
zz = r0 .* z2;
xx = r0 .* x;
yy = r0 .* y;

% subplot 2: ��ͼ�����ϣ�
subplot(2, 2, 2);
h1 = plot3(xx(r0~=0), yy(r0~=0), zz(r0~=0), '+');
set(h1, 'MarkerSize', 2);
hold on;
axis([-10 10 -10 10 -80 80]);
grid on;
title('z1 �볣���潻�㣨����ͼ��');

% subplot 1: ����ͼ�����ϣ�
subplot(2, 2, 1);
mesh(x, y, z1);
hold on;
mesh(x, y, z2);
h2 = plot3(xx(r0~=0), yy(r0~=0), zz(r0~=0), '.');
set(h2, 'MarkerSize', 6);
axis([-10 10 -10 10 -80 80]);
grid on;
title('z1 �� z2 ���潻��');

% subplot 3: �仯�еĽ���
subplot(2, 2, 3);
for i = 1:5
    a = 70 - i * 30;
    z2 = a * ones(size(x));
    r0 = abs(z1 - z2) <= 1;
    zz = r0 .* z2;
    xx = r0 .* x;
    yy = r0 .* y;
    
    mesh(x, y, z1);
    hold on;
    mesh(x, y, z2);
    hidden off;
    
    h2 = plot3(xx(r0~=0), yy(r0~=0), zz(r0~=0), 'o');
    set(h2, 'MarkerSize', 2);
    
    axis([-10 10 -10 10 -80 80]);
    grid on;
    title(['����仯��a = ', num2str(a)]);
    pause(0.5);
    
    cla;  % �����ǰsubplot��ֻ�����һСͼ��
end
