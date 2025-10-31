% Script: sinal_continuo_discreto.m
clear all;
close all;
clc;

% Sinal senoidal contínuo
f = 20;                % frequência em Hz
t = 0:0.0001:0.05;     % vetor de tempo
x_cont = 2*sin(2*pi*f*t);

subplot(2,2,1);
plot(t, x_cont, 'r', 'LineWidth', 1.5);
title('Sinal Senoidal em Tempo Contínuo - f = 20Hz');
xlabel('tempo (s)');
ylabel('x(t)');
grid on;

% Sinal senoidal discreto
n = 0:50;
x_disc = 2*sin(2*pi*f*(n/1000));  % assumindo Fs = 1000Hz
subplot(2,2,2);
stem(n, x_disc, 'b', 'filled');
title('Sinal Senoidal em Tempo Discreto - f = 20Hz');
xlabel('n');
ylabel('x[n]');
grid on;

% Sinal contínuo com amostras (stem sobre plot contínuo)
subplot(2,2,3);
plot(t, x_cont, 'r', 'LineWidth', 1.2); hold on;
stem(n/1000, x_disc, 'filled');
title('Sinal Contínuo com Amostras');
xlabel('tempo (s)');
ylabel('x(t)');
grid on;

% Sinal degrau discreto
n2 = -10:10;
x_step = n2 >= 0;
subplot(2,2,4);
stem(n2, x_step, 'filled');
title('Sinal Degrau Discreto');
xlabel('n');
ylabel('x[n]');
grid on;

