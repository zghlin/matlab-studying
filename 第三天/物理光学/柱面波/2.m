% ���沨 - ��ʱ�����⴫���Ķ�̬ͼ

% ��������
lambda = 1;
k = 2*pi/lambda;
omega = 2*pi;
A = 1;

[x, y] = meshgrid(-5:0.05:5, -5:0.05:5);
r = sqrt(x.^2 + y.^2);
r(r==0) = 1e-6;

figure;
for t = 0:0.05:2
    E = (A ./ sqrt(r)) .* cos(k*r - omega*t);  % �������ʽ

    imagesc([-5 5], [-5 5], E);
    colormap(jet); colorbar;
    axis image;
    title(sprintf('���沨�������� - t = %.2f', t));
    xlabel('x'); ylabel('y');
    drawnow;
end
