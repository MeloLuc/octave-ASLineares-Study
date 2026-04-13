%Script: modelos_sinais.m

clear all;  % limpa a workspace
close all; % fecha todas as janelas de plot
clc

% O vetor de t (tempo em s)
% Período de amostrage: Ts = 1 ms
% Frequência de amostragem: fs = 1 kHz
t = -5:0.01:5;

% Largura do pulso retangular
epsilon = 0.001;

delta = zeros(length(t));

delta(abs(t) < epsilon/2) = 1/epsilon;

plot(t, delta, 'LineWidth', 2);
grid on;
title('Impulso Contínuo - Delta de Dirac');
xlabel('t (s)');
ylabel('\delta (t)');


