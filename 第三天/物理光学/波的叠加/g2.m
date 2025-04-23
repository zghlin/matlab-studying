function g2()
    % ��������
    A1 = 1;                   % ��1�����
    A2 = 1;                   % ��2�����
    lambda1 = 1;              % ��1�Ĳ���
    lambda2 = 1.2;            % ��2�Ĳ���
    k1 = 2*pi/lambda1;        % ��1�Ĳ���
    k2 = 2*pi/lambda2;        % ��2�Ĳ���
    omega = 2*pi;             % Ƶ�ʣ���������������ͬƵ�ʣ�
    t_max = 2*pi;             % ���ʱ�䣨һ�����ڣ�
    x = linspace(-5, 5, 500); % �ռ�����

    % ����ͼ�δ���
    figure('Name', 'ƽ�沨�ĵ���', 'Position', [100 100 900 600]);

    % ������ʱ��ѭ��
    for t = 0:0.1:t_max
        % �����һ��ƽ�沨��E1(x, t) = A1 * cos(k1*x - omega*t)
        E1 = A1 * cos(k1 * x - omega * t);
        
        % ����ڶ���ƽ�沨��E2(x, t) = A2 * cos(k2*x - omega*t)
        E2 = A2 * cos(k2 * x - omega * t);
        
        % ���ĵ���
        E3 = E1 + E2;  % ���ĵ���

        % ����3����ͼ
        subplot(1, 3, 1);
        plot(x, E1, 'r'); % ��1�Ĳ���
        title('��1��ƽ�沨');
        xlabel('x');
        ylabel('E1(x,t)');
        axis([-5 5 -2 2]);
        grid on;

        subplot(1, 3, 2);
        plot(x, E2, 'b'); % ��2�Ĳ���
        title('��2��ƽ�沨');
        xlabel('x');
        ylabel('E2(x,t)');
        axis([-5 5 -2 2]);
        grid on;

        subplot(1, 3, 3);
        plot(x, E3, 'k'); % ���ĵ���
        title('��3�����ĵ���');
        xlabel('x');
        ylabel('E3(x,t)');
        axis([-5 5 -2 2]);
        grid on;
        
        % ��ͣ�����ƶ���֡����
        pause(0.05);
    end
end
