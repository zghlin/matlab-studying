clc;
clear;
close all;

obj = imread('peppers.png');     % 彩椒图
R = obj(:,:,1);
G = obj(:,:,2);
B = obj(:,:,3);
obj_gray = rgb2gray(obj);
BW1 = imbinarize(obj_gray, 0.49);     % 推荐用imbinarize替代im2bw
BW2 = roicolor(obj_gray, 120, 200);

% 统一使用 3x3 子图
figure;
subplot(3,3,1), imshow(obj);
title('原图像');

subplot(3,3,2), imshow(obj_gray);
title('灰度图像');

subplot(3,3,3), imshow(BW1);
title('二值化图像');

subplot(3,3,4), imshow(R);
title('R通道图像');

subplot(3,3,5), imshow(G);
title('G通道图像');

subplot(3,3,6), imshow(B);
title('B通道图像');

subplot(3,3,7), imshow(BW2);
title('区域选择图像');
