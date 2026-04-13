%Script: operacoes_combinadas_sinais_c.m

close all;
clear all;
clc;

% vetor de tempo
t = -10:0.001:10;

% pulso retangular centrado na origem com largura de 4s
x = @(t)((t>=-2 & t<=2)*2);
%x = @(t)(t >= 0.0); % degrau unitário

% fatores usado nas operações
r = -1;  % reflexão
a = 0.5; % escalamento (compressão)
b = 2;  % deslocamento (atraso)

% Operações: x(r*a*t+b)
t_escala = a*t;
x_escala = x(t_escala);


t_desloc = a*(t+b);
x_desloc = x(t_desloc);



t_reflex = r*a*(t+b);
x_reflex = x(t_reflex);


subplot(2,2,1);
plot(t, x(t), 'b', 'LineWidth', 2);
title('Sinal Original');
xlabel('t(s)', 'FontSize', 14);
ylabel('x(t)');
grid on;

subplot(2,2,2);
plot(t, x_desloc, 'r', 'LineWidth', 2);
title(sprintf('Deslocamento, b=%.2f', b), 'FontSize', 14);
xlabel('t(s)');
ylabel('x(t)');
grid on;

subplot(2,2,3);
plot(t, x_escala, 'g', 'LineWidth', 2);
title(sprintf('Escalamento, a=%.2f b=%.2f', a, b), 'FontSize', 14);
xlabel('t(s)');
ylabel('x(t)');
grid on;

subplot(2,2,4);
plot(t, x_reflex, 'm', 'LineWidth', 2);
title(sprintf('Reflexão, r=%.2f  a=%.2f b=%.2f', r, a, b), 'FontSize', 14);
xlabel('t(s)');
ylabel('x(t)');
grid on;

