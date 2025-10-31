% Script entrada_nula.m

clear all;
close all;
clc;

% =========================================================================
% 1. Definicao do Tempo
% =========================================================================
% Cria um vetor de tempo de 0 a 10 segundos com passo de 0.01s (para plotagem suave)
t = 0:0.01:10;



% =========================================================================
% 2. Calculo das Respostas de Entrada Nula (y0(t))
% =========================================================================

% --- Q1: Raizes Repetidas (lambda = -1, -1) ---
% Equacao: (D^2 + 2D + 1)y(t) = 0
% Solucao: y0(t) = (1 + t) * exp(-t)
% Condicoes: y(0)=1, Dy(0)=0
y0_1 = (1 + t) .* exp(-t);

% --- Q2: Raizes Imaginarias Puras (lambda = +/- j3) ---
% Equacao: (D^2 + 9)y(t) = 0
% Solucao: y0(t) = cos(3t)
% Condicoes: y(0)=1, Dy(0)=0
y0_2 = cos(3 * t);

% --- Q3: Raizes Complexas Amortecidas (lambda = -1 +/- j2) ---
% Equacao: (D^2 + 2D + 5)y(t) = 0
% Solucao: y0(t) = exp(-t) * (cos(2t) + 0.5 * sin(2t))
% Condicoes: y(0)=1, Dy(0)=0
y0_3 = exp(-t) .* (cos(2 * t) + 0.5 * sin(2 * t));

% --- Q4: Terceira Ordem (lambda = -4, -1 +/- j1) ---
% Equacao: (D^3 + 6D^2 + 10D + 8)y(t) = 0
% Solucao: y0(t) = 0.2*e^(-4t) + e^(-t) * (0.8*cos(t) + 1.6*sin(t))
% Condicoes: y(0)=1, Dy(0)=0, D^2y(0)=0
y0_4 = (1/5) * exp(-4 * t) + exp(-t) .* ((4/5) * cos(t) + (8/5) * sin(t));




% =========================================================================
% 3. Plotagem das Respostas
% =========================================================================

figure('Name', 'Respostas de Entrada Nula (Solucoes Homogeneas)');

% Plot Q1: Raizes Repetidas (Superamortecido)
subplot(2, 2, 1);
plot(t, y0_1, 'LineWidth', 2);
title('Q1: (D^2 + 2D + 1)y(t) = 0 (Raízes Repetidas)');
xlabel('Tempo t (s)');
ylabel('y_0(t)');
grid on;

% Plot Q2: Raizes Imaginarias Puras (Marginalmente Estavel)
subplot(2, 2, 2);
plot(t, y0_2, 'r', 'LineWidth', 2);
title('Q2: (D^2 + 9)y(t) = 0 (Raízes Imaginárias Puras)');
xlabel('Tempo t (s)');
ylabel('y_0(t)');
grid on;

% Plot Q3: Raizes Complexas Amortecidas
subplot(2, 2, 3);
plot(t, y0_3, 'g', 'LineWidth', 2);
title('Q3: (D^2 + 2D + 5)y(t) = 0 (Complexas Amortecidas)');
xlabel('Tempo t (s)');
ylabel('y_0(t)');
grid on;

% Plot Q4: Terceira Ordem (Composta)
subplot(2, 2, 4);
plot(t, y0_4, 'm', 'LineWidth', 2);
title('Q4: (D^3 + 6D^2 + 10D + 8)y(t) = 0 (Composta)');
xlabel('Tempo t (s)');
ylabel('y_0(t)');
grid on;
