function g3()
    % 参数设置
    lambda = 1;              % 波长
    k = 2*pi/lambda;         % 波数
    omega = 2*pi;            % 频率
    A = 1;                   % 初始振幅
    t = 0;                   % 固定时间点 t = 0

    % 创建传统的figure窗口
    fig = figure('Name', '静态球面波分布', 'Position', [100 100 800 600]);

    % 创建空间网格
    [x, y, z] = meshgrid(-5:0.1:5, -5:0.1:5, -5:0.1:5);  % 三维空间
    r = sqrt(x.^2 + y.^2 + z.^2);  % 计算到源点的距离

    % 避免除以0（r=0 处设定为极小值）
    r(r == 0) = 1e-6;

    % 计算球面波：E(r, t) = A/r * cos(k*r - omega*t)
    E = (A ./ r) .* cos(k * r - omega * t);

    % 绘制静态图像：显示某一时刻的球面波分布
    % 这里我们选择绘制 z = 0 平面的切片
    surf(x(:,:,1), y(:,:,1), E(:,:,1));  % 只绘制 z = 0 平面的切片
    shading interp;
    colormap jet;
    colorbar;
    title('球面波在时刻 t = 0 的分布');
    xlabel('x'); ylabel('y'); zlabel('E(x,y,t)');
    zlim([-1 1]);   % 设置z轴范围
    axis([-5 5 -5 5 -1 1]);
    view(2);   % 设置从上方观察
end
