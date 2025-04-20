%Ϊ8.m�ľ�̬�����汾
clc; clear; close all;

% ��������
eps0 = 1;
eps1 = 1e-4;  % ���⸲�� eps ���ú���
[x, y] = meshgrid(-10:0.2:10);  % ��������

% ���� z1 ����
z1 = (x.^2 - 2 * y.^2) + eps1;

% ��ͼ1������������ z1
subplot(2,2,1);
mesh(x, y, z1);
title('���� z_1 = x^2 - 2y^2');
xlabel('x'); ylabel('y'); zlabel('z');
grid on;
axis([-10 10 -10 10 -80 80]);

% ��ͼ2�����Ƴ�ʼ z2 �棨a = -20��
a = -20;
z2 = a * ones(size(x));
r0 = abs(z1 - z2) <= eps0;
zz = r0 .* z2;
xx = r0 .* x;
yy = r0 .* y;

subplot(2,2,2);
mesh(x, y, z1); hold on;
mesh(x, y, z2);
plot3(xx(r0~=0), yy(r0~=0), zz(r0~=0), 'r.', 'MarkerSize', 6);
title(['���ߣ�z_2 = ', num2str(a), '��']);
xlabel('x'); ylabel('y'); zlabel('z');
grid on;
axis([-10 10 -10 10 -80 80]);

% ��ͼ3��һ���Ի��ƶ�����ߣ�a �� 40 �� -50��
subplot(2,2,[3,4]);
mesh(x, y, z1);
hold on;
colors = lines(5);  % ��ȡ5����ɫ

for i = 1:5
    a = 70 - i * 30;  % �� 40 �� -50
    z2 = a * ones(size(x));
    r0 = abs(z1 - z2) <= eps0;
    zz = r0 .* z2;
    xx = r0 .* x;
    yy = r0 .* y;
    
    mesh(x, y, z2, 'FaceAlpha', 0.1);  % ��͸����
    plot3(xx(r0~=0), yy(r0~=0), zz(r0~=0), '.', 'Color', colors(i,:), 'MarkerSize', 6);
end

title('�����ͬ�߶�ƽ��Ľ���');
xlabel('x'); ylabel('y'); zlabel('z');
axis([-10 10 -10 10 -80 80]);
grid on;
legend('z_1', 'z_2 @ 40', 'z_2 @ 10', 'z_2 @ -20', 'z_2 @ -50', 'Location','northeastoutside');
