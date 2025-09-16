% Script: pulso_retangular.m

close all;
clear all;
clc;

% eixo de tempo
dt = 0.001; % problema da imprecissão dos decimais
t = -3:dt:3;

TOL = 1e-6; % tolerancia

u = @(t)(t >= -TOL); % degrau unitário

p = @(t)(u(t) -u(t-2)); % pulso retangular

subplot(2, 1, 1);
plot(t, u(t), 'LineWidth', 1.5);
title('Degrau unitário');
xlabel('t(s)');
ylabel('u(t)');
grid on;

subplot(2, 1, 2);
plot(t, p(t), 'LineWidth', 1.5);
title('Degrau unitário');
xlabel('t(s)');
ylabel('p(t)');
grid on;
% há erros na inclinações devido ao erro de imprecissão dos numeros decimais [dt]. (zoom)
% usar tolerancia para 'resolver' esss problema (o problema está na igualdade)
