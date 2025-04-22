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
