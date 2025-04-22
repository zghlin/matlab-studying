# 简单图像处理

图像颜色千变万化，最常见是自然光，可以分成不同的颜色分量，主要由红、绿和黄三原光合成RGB，代表红绿蓝三个通道的颜色。



图像颜色区域处理对于静态图像非常重要。在matlab中提供了roicolor函数根据颜色选定区域。其调用格式如下：

BW=roicolor(A,low,high):色图范围为:[low,high],返回这些像素选择区域。BW内部值为1，外边为0的矩阵。



在哪里去找原图像



在 MATLAB 中使用图像处理时，你有几种方式获取原始图像：

------

## ✅ 一、使用 MATLAB 自带的示例图像

MATLAB 自带一些经典图像可直接使用，如：

```matlab
img = imread('peppers.png');     % 彩椒图
img = imread('cameraman.tif');   % 黑白摄影图
img = imread('coins.png');       % 硬币图
img = imread('saturn.png');      % 土星图
```

> 📁 这些图像在 MATLAB 安装目录下的 `toolbox/images/imdata/` 文件夹里。

------

## ✅ 二、使用本地图像（你自己的图片）

把图像文件（比如 `.jpg`, `.png`）放到当前工作目录，或者指定完整路径：

```matlab
img = imread('myphoto.jpg');         % 文件在当前目录
img = imread('D:\images\test.png');  % 指定绝对路径
```

------

## ✅ 三、从互联网下载图像

可以先用浏览器下载图片，然后读入：

```matlab
url = 'https://example.com/image.jpg';
filename = 'downloaded.jpg';
websave(filename, url);         % 下载图像
img = imread(filename);         % 读取图像
```

> ⚠️ 注意：websave 需要联网权限，有些 MATLAB 环境默认关闭联网。

------

## ✅ 四、用 MATLAB App 或 GUI 拾取图像

你可以用交互式方式选择图像：

```matlab
[filename, pathname] = uigetfile({'*.jpg;*.png;*.bmp'}, '选择图像');
if isequal(filename, 0)
    disp('用户取消了选择');
else
    img = imread(fullfile(pathname, filename));
    imshow(img);
end
```

------

需要我帮你下载一些经典图像素材用于测试吗？或者推荐一些公开的图像处理数据集？





图像处理是 MATLAB 的强项之一，它提供了强大的图像处理工具箱（Image Processing Toolbox）。下面是一些 **简单图像处理的常用操作和代码示例**，适合入门级学习：

------

## 🖼️ 1. 读取和显示图像

```matlab
img = imread('peppers.png'); % 读取图像
imshow(img);                 % 显示图像
```

------

## 🌈 2. 转换为灰度图像

```matlab
gray_img = rgb2gray(img);  % RGB 转灰度
imshow(gray_img);
```

------

## ✂️ 3. 裁剪图像

```matlab
cropped = imcrop(img, [50 50 100 100]);  % 裁剪矩形区域，格式：[x y width height]
imshow(cropped);
```

------

## 🧊 4. 图像缩放（Resize）

```matlab
small_img = imresize(img, 0.5);  % 缩小一半
imshow(small_img);
```

------

## 🔄 5. 图像旋转

```matlab
rotated = imrotate(img, 45);  % 旋转45度
imshow(rotated);
```

------

## 📈 6. 直方图增强（增强对比度）

```matlab
gray_img = rgb2gray(img);
enhanced = histeq(gray_img);   % 直方图均衡化
imshow(enhanced);
```

------

## 🔍 7. 图像边缘检测

```matlab
gray_img = rgb2gray(img);
edges = edge(gray_img, 'Canny');  % 使用Canny方法检测边缘
imshow(edges);
```

------

## 🧪 8. 图像滤波（模糊）

```matlab
h = fspecial('gaussian', [5 5], 2);  % 创建高斯滤波器
blurred = imfilter(img, h);
imshow(blurred);
```

------

如果你告诉我你想做哪一类图像处理（如去噪、特征提取、图像分割、边缘检测等），我可以给你更详细的示例和讲解。需要我生成一个完整的 GUI 示例吗？或者是单独模块的交互？



二值化是什么



好问题！**图像二值化**是图像处理中一个非常基础但很有用的操作，尤其是在边缘提取、目标识别、图像分割等任务中。

------

## 🧠 什么是二值化？

简单来说，**二值化就是把灰度图像变成只有黑白两种颜色的图像**。

- 黑色（0）：表示背景或低强度像素
- 白色（1 或 255）：表示目标或高强度像素

二值图像就像是“只保留轮廓”的效果。

------

## 🔧 二值化的原理

一般是设定一个阈值 `T`，灰度图像中：

- 像素值 ≥ `T` → 设置为白色（1 或 255）
- 像素值 < `T` → 设置为黑色（0）

------

## ✍️ MATLAB 示例：图像二值化

```matlab
img = imread('cameraman.tif');   % 灰度图
bw = imbinarize(img);            % 自动选阈值进行二值化（Otsu 方法）
imshow(bw);
```

你也可以手动设置阈值：

```matlab
bw = img > 100;    % 像素大于100为白，其余为黑
imshow(bw);
```

------

## 🎯 自动 vs 手动二值化

| 方法     | 函数              | 说明                              |
| -------- | ----------------- | --------------------------------- |
| 自动阈值 | `imbinarize(img)` | 使用 Otsu 方法自动找最佳阈值      |
| 手动阈值 | `img > T`         | 自己指定 T，比如 100、127、180 等 |

------

## 🖼️ 效果对比

- 原图：灰度图，像素值 0~255
- 二值图：只剩 0 和 255，像黑白漫画那样

------

需要我给你演示一个动态调节阈值的图像二值化 GUI（滑块控制）吗？这样你可以实时看到不同阈值的效果～



1.m



```matlab
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

```



你这段代码整体逻辑是正确的，但正如前面提到的，最后一行的 `subplot(313)` 会**覆盖前面的图像布局**，因为：

- `subplot(313)` 表示：把图像窗口分成 **3 行 1 列**，显示在第3行。
- 前面的 `subplot(331)` 到 `subplot(336)` 表示 **3行3列**，这样混合使用会导致布局冲突，可能出现图像重叠或显示不完整的问题。

------

### ✅ 正确做法：统一使用 `subplot(3, 3, x)` 或重新排布

下面是你代码的**推荐改进版**（保持你原意 + 完整显示所有图）：

```matlab
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
```

------

### 💡 小提示

- `im2bw` 是旧函数，建议改用 `imbinarize`，语法一样但更现代。
- `subplot` 最好整齐排布，否则图像可能被覆盖或压缩变形。
- `roicolor` 会返回逻辑图像，只显示你设定的灰度范围（120~200）的像素，常用于简单的分割任务。

------

如果你还想加一个 “滑动条调节阈值”的功能，做个交互式二值化界面（小GUI），我可以立刻帮你写个示例。需要的话可以直接说哈 😎



2.m

```matlab
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

```





gino.m

```matlab
function gino()
    % 创建窗口
    fig = figure('Name', '图像二值化演示', 'NumberTitle', 'off', ...
        'Position', [100, 100, 800, 400]);

    % 读取图像并转灰度
    img = imread('peppers.png');
    gray_img = rgb2gray(img);

    % 初始阈值
    initial_thresh = 0.5;

    % 显示原始灰度图像
    subplot(1,2,1);
    imshow(gray_img);
    title('灰度图像');

    % 显示初始二值图像
    hBinary = subplot(1,2,2);
    bw = imbinarize(gray_img, initial_thresh);
    hImg = imshow(bw);
    title(['二值图像 - 阈值 = ', num2str(initial_thresh)]);

    % 添加滑动条
    uicontrol('Style', 'slider', ...
        'Min', 0, 'Max', 1, 'Value', initial_thresh, ...
        'Units', 'normalized', ...
        'Position', [0.25 0.05 0.5 0.05], ...
        'Callback', @sliderCallback);

    % 添加标签
    uicontrol('Style','text',...
        'Units','normalized',...
        'Position',[0.25 0.01 0.5 0.03],...
        'String','拖动滑块以调整二值化阈值（0~1）');

    % 回调函数：根据滑动条更新图像
    function sliderCallback(src, ~)
        new_thresh = src.Value;
        new_bw = imbinarize(gray_img, new_thresh);
        set(hImg, 'CData', new_bw);
        title(hBinary, ['二值图像 - 阈值 = ', num2str(new_thresh, '%.2f')]);
    end
end

```





该程序的运行需在命令行中输入gino,即函数名

