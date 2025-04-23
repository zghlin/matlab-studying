% 柱面波 - 随时间向外传播的动态图

% 参数设置
lambda = 1;
k = 2*pi/lambda;
omega = 2*pi;
A = 1;

[x, y] = meshgrid(-5:0.05:5, -5:0.05:5);
r = sqrt(x.^2 + y.^2);
r(r==0) = 1e-6;

figure;
for t = 0:0.05:2
    E = (A ./ sqrt(r)) .* cos(k*r - omega*t);  % 波动表达式

    imagesc([-5 5], [-5 5], E);
    colormap(jet); colorbar;
    axis image;
    title(sprintf('柱面波传播动画 - t = %.2f', t));
    xlabel('x'); ylabel('y');
    drawnow;
end
