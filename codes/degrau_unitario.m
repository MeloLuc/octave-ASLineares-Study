% =========================================================
% Script Octave: Degrau Unitário Contínuo u(t) e u(-t+2)
% Operações: reflexão no tempo + deslocamento
% =========================================================

clear; clc; close all;

% --- Eixo de tempo ---
t = linspace(-5, 5, 10000);

% =========================================================
% 1) Degrau unitário original: u(t)
%    u(t) = 1 para t >= 0
%           0 para t <  0
% =========================================================
u_t = double(t >= 0);

% =========================================================
% 2) Transformação: u(-t + 2)
%    Passo a passo:
%      a) u(-t)   → reflexão em torno de t = 0
%                   degrau vai de +inf até 0 (ativo em t <= 0)
%      b) u(-t+2) → deslocamento: substitui t por (t-2) em u(-t)
%                   equivalente a refletir e depois deslocar 2 para direita
%                   ativo em: -t+2 >= 0  →  t <= 2
% =========================================================
u_neg_t_mais_2 = double(-t + 2 >= 0);   % equivalente a: t <= 2

% =========================================================
% Plotagem
% =========================================================
figure('Name', 'Degrau Unitário e Transformação', ...
       'Position', [100, 100, 900, 600]);

% --- Subplot 1: u(t) original ---
subplot(2, 1, 1);
plot(t, u_t, 'b-', 'LineWidth', 2.5);
hold on;
% Marca o ponto de descontinuidade
plot(0, 0, 'bo', 'MarkerSize', 8, 'MarkerFaceColor', 'white'); % círculo aberto em t=0-
plot(0, 1, 'bs', 'MarkerSize', 8, 'MarkerFaceColor', 'blue');  % quadrado fechado em t=0+
plot([0 0],   [-0.3 1.5], '--k', 'LineWidth', 0.8);  % linha vertical em t=0
plot([-5 5],  [1   1],   '--k', 'LineWidth', 0.8);   % linha horizontal em u=1
xlim([-5, 5]);
ylim([-0.3, 1.5]);
xlabel('t', 'FontSize', 13);
ylabel('u(t)', 'FontSize', 13);
title('Degrau Unitário Original:  u(t)', 'FontSize', 14, 'FontWeight', 'bold');
legend('u(t) = 1, para t \geq 0', 'Location', 'northwest', 'FontSize', 11);
grid on;
set(gca, 'FontSize', 11);

% --- Subplot 2: u(-t+2) transformado ---
subplot(2, 1, 2);
plot(t, u_neg_t_mais_2, 'r-', 'LineWidth', 2.5);
hold on;
% Marca o ponto de descontinuidade em t = 2
plot(2, 1, 'ro', 'MarkerSize', 8, 'MarkerFaceColor', 'white'); % círculo aberto
plot(2, 0, 'rs', 'MarkerSize', 8, 'MarkerFaceColor', 'red');   % quadrado fechado
plot([2 2],   [-0.3 1.5], '--k', 'LineWidth', 0.8);  % linha vertical em t=2
plot([-5 5],  [1   1],   '--k', 'LineWidth', 0.8);   % linha horizontal em u=1
xlim([-5, 5]);
ylim([-0.3, 1.5]);
xlabel('t', 'FontSize', 13);
ylabel('u(-t+2)', 'FontSize', 13);
title('Degrau Transformado:  u(-t+2)   [Reflexão + Deslocamento +2]', ...
      'FontSize', 14, 'FontWeight', 'bold');
legend('u(-t+2) = 1, para t \leq 2', 'Location', 'northeast', 'FontSize', 11);
grid on;
set(gca, 'FontSize', 11);

% Título geral via annotation
annotation('textbox', [0 0.96 1 0.04], 'String', ...
  'Transformações no Tempo do Degrau Unitário Contínuo', ...
  'HorizontalAlignment', 'center', 'FontSize', 15, ...
  'FontWeight', 'bold', 'EdgeColor', 'none');

% =========================================================
% Impressão no console: análise matemática
% =========================================================
fprintf('\n========================================================\n');
fprintf('  ANÁLISE: Transformações do Degrau Unitário u(t)\n');
fprintf('========================================================\n\n');

fprintf('1) u(t):\n');
fprintf('   Definição : u(t) = 1 se t >= 0\n');
fprintf('                      0 se t <  0\n');
fprintf('   Transição em t = 0\n\n');

fprintf('2) u(-t+2) — operações aplicadas:\n');
fprintf('   Passo 1 → Reflexão temporal:  t → -t\n');
fprintf('             u(-t): ativo para -t >= 0  →  t <= 0\n');
fprintf('   Passo 2 → Deslocamento:       substituir t por (t-2)\n');
fprintf('             u(-(t-2)) = u(-t+2): ativo para -t+2 >= 0  →  t <= 2\n\n');

fprintf('   Resultado: u(-t+2) = 1 se t <= 2\n');
fprintf('                        0 se t >  2\n');
fprintf('   Transição em t = 2\n\n');

fprintf('========================================================\n\n');

% Salva a figura
print('degrau_transformado.png', '-dpng', '-r150');
fprintf('Figura salva como: degrau_transformado.png\n');
