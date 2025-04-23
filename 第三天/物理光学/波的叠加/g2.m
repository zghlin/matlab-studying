function g2()
    % 参数设置
    A1 = 1;                   % 波1的振幅
    A2 = 1;                   % 波2的振幅
    lambda1 = 1;              % 波1的波长
    lambda2 = 1.2;            % 波2的波长
    k1 = 2*pi/lambda1;        % 波1的波数
    k2 = 2*pi/lambda2;        % 波2的波数
    omega = 2*pi;             % 频率（假设两个波有相同频率）
    t_max = 2*pi;             % 最大时间（一个周期）
    x = linspace(-5, 5, 500); % 空间坐标

    % 创建图形窗口
    figure('Name', '平面波的叠加', 'Position', [100 100 900 600]);

    % 动画的时间循环
    for t = 0:0.1:t_max
        % 计算第一个平面波：E1(x, t) = A1 * cos(k1*x - omega*t)
        E1 = A1 * cos(k1 * x - omega * t);
        
        % 计算第二个平面波：E2(x, t) = A2 * cos(k2*x - omega*t)
        E2 = A2 * cos(k2 * x - omega * t);
        
        % 波的叠加
        E3 = E1 + E2;  % 波的叠加

        % 创建3个子图
        subplot(1, 3, 1);
        plot(x, E1, 'r'); % 波1的波形
        title('波1：平面波');
        xlabel('x');
        ylabel('E1(x,t)');
        axis([-5 5 -2 2]);
        grid on;

        subplot(1, 3, 2);
        plot(x, E2, 'b'); % 波2的波形
        title('波2：平面波');
        xlabel('x');
        ylabel('E2(x,t)');
        axis([-5 5 -2 2]);
        grid on;

        subplot(1, 3, 3);
        plot(x, E3, 'k'); % 波的叠加
        title('波3：波的叠加');
        xlabel('x');
        ylabel('E3(x,t)');
        axis([-5 5 -2 2]);
        grid on;
        
        % 暂停，控制动画帧速率
        pause(0.05);
    end
end
