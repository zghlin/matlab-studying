clc,clear,close all;



obj = imread('peppers.png');     % �ʽ�ͼ
R=obj(:,:,1);
G=obj(:,:,2);
B=obj(:,:,3);
obj_gray=rgb2gray(obj);
BW1=im2bw(obj_gray,0.49);
BW2=roicolor(obj_gray,120,200);
subplot(331),imshow(obj);
title('ԭͼ��')

subplot(332),imshow(obj_gray);
title('�Ҷ�ͼ��')

subplot(333),imshow(BW1);
title('��ֵ��ͼ��')

subplot(334),imshow(R);
title('Rͨ��ͼ��')

subplot(335),imshow(G);
title('Gͨ��ͼ��')

subplot(336),imshow(B);
title('Bͨ��ͼ��')

subplot(313),imshow(BW2);
title('����ѡ��ͼ��')
