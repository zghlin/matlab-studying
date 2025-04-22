clc;
clear;
close all;

obj = imread('peppers.png');     % �ʽ�ͼ
R = obj(:,:,1);
G = obj(:,:,2);
B = obj(:,:,3);
obj_gray = rgb2gray(obj);
BW1 = imbinarize(obj_gray, 0.49);     % �Ƽ���imbinarize���im2bw
BW2 = roicolor(obj_gray, 120, 200);

% ͳһʹ�� 3x3 ��ͼ
figure;
subplot(3,3,1), imshow(obj);
title('ԭͼ��');

subplot(3,3,2), imshow(obj_gray);
title('�Ҷ�ͼ��');

subplot(3,3,3), imshow(BW1);
title('��ֵ��ͼ��');

subplot(3,3,4), imshow(R);
title('Rͨ��ͼ��');

subplot(3,3,5), imshow(G);
title('Gͨ��ͼ��');

subplot(3,3,6), imshow(B);
title('Bͨ��ͼ��');

subplot(3,3,7), imshow(BW2);
title('����ѡ��ͼ��');
