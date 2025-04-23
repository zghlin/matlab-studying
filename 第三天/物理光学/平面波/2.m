% 平面波动态动画

% 参数设置
lambda = 1;
k = 2*pi/lambda;
theta = pi/3;          % 传播方向：60度
A = 1;
omega = 2*pi;
[x, y] = meshgrid(-5:0.05:5, -5:0.05:5);
kx = k * cos(theta);
ky = k * sin(theta);

% 动画
figure;
for t = 0:0.05:2
    phase = kx*x + ky*y - omega*t;
    E = A * cos(phase);
    imagesc(E); 
    colormap('jet'); 
    colorbar;
    title(sprintf('时间 t = %.2f', t));
    axis image;
    drawnow;
end