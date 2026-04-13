% Script: operacoes_temporais_combinadas.m

close all;
clear all;
clc;


% Vetor de tempo
t = -5:0.01:5;


% Sinal original (função anônima)
x = @(t) (t >= -2 & t <= 2);


% Operações temporais (funções anônimas)

% Deslocamento: x(t + b)
desloc = @(x, b) @(t) x(t + b);

% Inversão: x(-t)
reflex = @(x, r) @(t) x(r*t);  % r=1: sem reflexão  r=-1 : com reflexão

% Escalamento: x(a.t)
escala = @(x, a) @(t) x(a*t);


% Sequência de operações: E -> D -> R
x1 = desloc(x, -1);
x2 = escala(x1, 2);

x3 = reflex(x2, -1);


% Plotagem dos sinais
figure;

subplot(4,1,1);
plot(t, x(t), 'LineWidth', 2);
grid on;
title('x(t)');

subplot(4,1,2);
plot(t, x1(t), 'LineWidth', 2);
grid on;
%title('Escalamento');
title('Deslocamento');

subplot(4,1,3);
plot(t, x2(t), 'LineWidth', 2);
grid on;
title('Escalamento');
%title('Deslocamento');

subplot(4,1,4);
plot(t, x3(t), 'LineWidth', 2);
grid on;
title('Reflexão');

xlabel('t');
