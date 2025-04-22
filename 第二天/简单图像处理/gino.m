function gino()
    % ��������
    fig = figure('Name', 'ͼ���ֵ����ʾ', 'NumberTitle', 'off', ...
        'Position', [100, 100, 800, 400]);

    % ��ȡͼ��ת�Ҷ�
    img = imread('peppers.png');
    gray_img = rgb2gray(img);

    % ��ʼ��ֵ
    initial_thresh = 0.5;

    % ��ʾԭʼ�Ҷ�ͼ��
    subplot(1,2,1);
    imshow(gray_img);
    title('�Ҷ�ͼ��');

    % ��ʾ��ʼ��ֵͼ��
    hBinary = subplot(1,2,2);
    bw = imbinarize(gray_img, initial_thresh);
    hImg = imshow(bw);
    title(['��ֵͼ�� - ��ֵ = ', num2str(initial_thresh)]);

    % ��ӻ�����
    uicontrol('Style', 'slider', ...
        'Min', 0, 'Max', 1, 'Value', initial_thresh, ...
        'Units', 'normalized', ...
        'Position', [0.25 0.05 0.5 0.05], ...
        'Callback', @sliderCallback);

    % ��ӱ�ǩ
    uicontrol('Style','text',...
        'Units','normalized',...
        'Position',[0.25 0.01 0.5 0.03],...
        'String','�϶������Ե�����ֵ����ֵ��0~1��');

    % �ص����������ݻ���������ͼ��
    function sliderCallback(src, ~)
        new_thresh = src.Value;
        new_bw = imbinarize(gray_img, new_thresh);
        set(hImg, 'CData', new_bw);
        title(hBinary, ['��ֵͼ�� - ��ֵ = ', num2str(new_thresh, '%.2f')]);
    end
end
