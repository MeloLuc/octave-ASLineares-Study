% Script: pulso_triangular.m

% eixo de tempo
dt = 0.001;
t = -3:dt:3;

triang = @(t)((t+2).*(t>=-2 & t<=0) + (-t+2).*(t>0 & t<=2));

plot(t, triang(t), 'LineWidth', 1.5);
