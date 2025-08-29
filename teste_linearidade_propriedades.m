% Script: teste_linearidade_propriedades.m
clear all;
close all;
clc;

t = 0:0.001:2; % eixo dos tempos
x1 = t; % sinal rampa
x2 = sin(10 * pi * t); % sinal senoidal sen(2*pi*f*t) - 5 Hz

% escalares
k1 = 2; k2 = -3;

% definição: y(t) = 2 * x(t)
S = @(x)(2 * x); % função anônima

% teste de homogeneidade (escalamento)
% S( k1 * x1(t) } ?=  k1 * S{ x1(t) }
le_hom = S(k1 * x1); % lado esquerdo da propriedade
ld_hom = k1 * S(x1); % lado direito da propriedade

% teste de aditividade
% S { x1(t) + x2(t) } ?= S{ x1(t) } + S{ x2(t) }
le_ad = S(x1 + x2);
ld_ad = S(x1) + S(x2);

% teste de superposição/linearidade
% S { k1 * x1(t) + k2 * x2(t) } ?= k1 * S{ x1(t) } + k2 * S{ x2(t) }
le_sup = S(k1 * x1 + k2 * x2);
ld_sup = k1 * S(x1) + k2 * S(x2);

% plotagem dos sinais
% Avaliação numerica/qualitativa (incerteza), avaliação analítica(certeira)
% sinais de entrada
subplot(2, 2, 1);
plot(t, x1, 'b', t, x2, 'r');
legend('x1(t)', 'x2(t)');
xlabel('t(s)');
ylabel('x1(t) & x2(t)- entradas');
title('Sinais de entrada - Sistema: y(t) = 2 * x(t)');
grid on;

% propriedade da homogeneidade
subplot(2, 2, 2);
plot(t, le_hom, '-b', 'LineWidth', 1.5, t, ld_hom, '--r');
legend('S( k * x )', 'k * S( x )');
xlabel('t(s)');
ylabel('Homegeneidade');
title('S{ k * x(t)} =  k * S{ x(t)} - Sistema: y(t) = 2 * x(t)');
grid on;

% propriedade de aditividade
subplot(2, 2, 3);
plot(t, le_ad, '-b', 'LineWidth', 1.5, t, ld_ad, '--r');
legend('S( x1 + x2 )', 'S( x1 ) + S( x2)');
xlabel('t(s)');
ylabel('Aditividade');
title('S{ x1(t) + x2(t) } = S{ x1(t) } + S{ x2(t) } - Sistema: y(t) = 2 * x(t)');
grid on;

% propriedade da superposição/linearidade
subplot(2, 2, 4);
plot(t, le_sup, '-b', 'LineWidth', 1.5, t, ld_sup, '--r');
legend('S(k1 * x1 + k2 * x2)', 'k1 * S(x1) + k2 * S(x2)');
xlabel('t(s)');
ylabel('Superposição');
title('S { k1 * x1(t) + k2 * x2(t) } ?= k1 * S{ x1(t) } + k2 * S{ x2(t) } - Sistema: y(t) = 2 * x(t)');
grid on;


