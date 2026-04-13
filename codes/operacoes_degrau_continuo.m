clc
clear
close all

% eixo de tempo
t = -5:0.01:5;

% definicao do degrau unitario
u = @(x) double(x >= 0);

% sinal original
u_t = u(t);

% operacao u(-t+2)
u_transformado = u(-t + 2);

% graficos
figure

subplot(2,1,1)
plot(t, u_t, 'LineWidth',2)
grid on
title('Degrau unitário u(t)')
xlabel('t')
ylabel('u(t)')
ylim([-0.2 1.2])

subplot(2,1,2)
plot(t, u_transformado, 'LineWidth',2)
grid on
title('Sinal transformado u(-t+2)')
xlabel('t')
ylabel('u(-t+2)')
ylim([-0.2 1.2])
