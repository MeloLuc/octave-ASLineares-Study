%questão 03 da atividade 01 da disciplina de análise de sinais
%Discente: Lucas de Melo Monteiro peixoto

clear all;
close all;
clc;

%Definição do vetor de tempo amplo (para caber todos os deslocamentos)
t = -8:0.01:8;

%Criação da função anônima do sinal original x(t)
x = @(tau) (-tau) .* (tau >= -4 & tau <= 0) + (tau) .* (tau > 0 & tau <= 2);

%Cálculo das transformações (basta passar a nova equação do tempo para a função)
x_orig = x(t);
x_a    = x(t - 4);
x_b    = x(t / 1.5);
x_c    = x(-t);
x_d    = x(2.*t - 4);
x_e    = x(2 - t);



% PLOTAGEM DOS RESULTADOS (Subplots 3x2)
figure('Name', 'Transformacoes no Tempo - Questao 3', 'Position', [100, 100, 900, 600]);

% Sinal Original
subplot(3,2,1);
plot(t, x_orig, 'k', 'LineWidth', 2);
title('Sinal Original: x(t)'); grid on;
axis([-8 8 -1 5]);

% a) Atraso
subplot(3,2,2);
plot(t, x_a, 'b', 'LineWidth', 2);
title('a) Atraso: x(t - 4)'); grid on;
axis([-8 8 -1 5]);

% b) Expansão
subplot(3,2,3);
plot(t, x_b, 'r', 'LineWidth', 2);
title('b) Expansao: x(t / 1.5)'); grid on;
axis([-8 8 -1 5]);

% c) Reversão
subplot(3,2,4);
plot(t, x_c, 'g', 'LineWidth', 2);
title('c) Reversao: x(-t)'); grid on;
axis([-8 8 -1 5]);

% d) Compressão + Atraso
subplot(3,2,5);
plot(t, x_d, 'm', 'LineWidth', 2);
title('d) Comp. + Atraso: x(2t - 4)'); grid on;
axis([-8 8 -1 5]);

% e) Reversão + Avanço
subplot(3,2,6);
plot(t, x_e, 'c', 'LineWidth', 2);
title('e) Reversao + Avanco: x(2 - t)'); grid on;
axis([-8 8 -1 5]);
