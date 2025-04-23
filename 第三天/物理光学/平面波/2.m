% ƽ�沨��̬����

% ��������
lambda = 1;
k = 2*pi/lambda;
theta = pi/3;          % ��������60��
A = 1;
omega = 2*pi;
[x, y] = meshgrid(-5:0.05:5, -5:0.05:5);
kx = k * cos(theta);
ky = k * sin(theta);

% ����
figure;
for t = 0:0.05:2
    phase = kx*x + ky*y - omega*t;
    E = A * cos(phase);
    imagesc(E); 
    colormap('jet'); 
    colorbar;
    title(sprintf('ʱ�� t = %.2f', t));
    axis image;
    drawnow;
end