clc,clear,close all;



obj = imread('peppers.png');     % 彩椒图
R=obj(:,:,1);
G=obj(:,:,2);
B=obj(:,:,3);
obj_gray=rgb2gray(obj);
BW1=im2bw(obj_gray,0.49);
BW2=roicolor(obj_gray,120,200);
subplot(331),imshow(obj);
title('原图像')

subplot(332),imshow(obj_gray);
title('灰度图像')

subplot(333),imshow(BW1);
title('二值化图像')

subplot(334),imshow(R);
title('R通道图像')

subplot(335),imshow(G);
title('G通道图像')

subplot(336),imshow(B);
title('B通道图像')

subplot(313),imshow(BW2);
title('区域选择图像')
