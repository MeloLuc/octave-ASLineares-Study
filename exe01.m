% Script exe01.m

% -------------------------------------------------------------------
% Atividade 1: Esboço de Sinais em Tempo Contínuo
% Disciplina: Análise de Sistemas Lineares
% -------------------------------------------------------------------

% Definindo a função degrau unitário para reuso
u = @(t) (t >= 0);


% --- Exercício 1 ---
% sinal x(t) = 1 + u(t)
figure('Name', 'Exercício 1'); %cria uma janela de gráfico por quetao
t = -5:0.01:5;
x1 = 1 + u(t);
plot(t, x1, 'LineWidth', 2);
grid on;
title('Exercício 1: x(t) = 1 + u(t)');
xlabel('t');
ylabel('x(t)');
ylim([-0.5, 2.5]); % Ajuste do eixo y para melhor visualização


% --- Exercício 2 ---
% sinal x(t) = e^(-2t)u(t)
figure('Name', 'Exercício 2');
t = -1:0.01:5;
x2 = exp(-2*t) .* u(t);
plot(t, x2, 'LineWidth', 2);
grid on;
title('Exercício 2: x(t) = e^{-2t}u(t)');
xlabel('t');
ylabel('x(t)');


% --- Exercício 3 ---
% sinal x(t) = cos(2*pi*t)
figure('Name', 'Exercício 3');
t = -2:0.01:2;
x3 = cos(2*pi*t);
plot(t, x3, 'LineWidth', 2);
grid on;
title('Exercício 3: x(t) = cos(2\pi t)');
xlabel('t');
ylabel('x(t)');


% --- Exercício 4 ---
% sinal triangular
figure('Name', 'Exercício 4');
t = -5:0.01:5;
x4 = zeros(size(t)); %vetor de y zeros
% Encontra os índices onde |t| <= 3
idx = abs(t) <= 3;
% Calcula o valor da função apenas para esses índices
x4(idx) = 2 - abs(t(idx)); %seleciona apenas onde idx for true(1)
plot(t, x4, 'LineWidth', 2);
grid on;
title('Exercício 4: Sinal Triangular');
xlabel('t');
ylabel('x(t)');
ylim([-1.5, 2.5]);


% --- Exercício 5 ---
% Operações sobre o pulso retangular x(t) = u(t) - u(t-2)
figure('Name', 'Exercício 5');
t = -3:0.01:5;
x_base_5 = u(t) - u(t-2);

% Sinal Original para comparação
subplot(3, 2, 1);
plot(t, x_base_5, 'r', 'LineWidth', 2);
grid on;
title('Sinal Original x(t)');
ylim([-0.5, 1.5]);

% (a) x(t-1) (deslocamento para a direita)
subplot(3, 2, 2);
x5a = u(t-1) - u(t-3);
plot(t, x5a, 'LineWidth', 2);
grid on;
title('(a) x(t-1)');
ylim([-0.5, 1.5]);

% (b) x(t+1) (deslocamento para a esquerda)
subplot(3, 2, 3);
x5b = u(t+1) - u(t-1);
plot(t, x5b, 'LineWidth', 2);
grid on;
title('(b) x(t+1)');
ylim([-0.5, 1.5]);

% (c) x(-t) (reflexão temporal)
subplot(3, 2, 4);
x5c = u(-t) - u(-t-2);
plot(t, x5c, 'LineWidth', 2);
grid on;
title('(c) x(-t)');
ylim([-0.5, 1.5]);

% (d) x(2t) (compressão temporal)
subplot(3, 2, 5);
x5d = u(2*t) - u(2*t-2);
plot(t, x5d, 'LineWidth', 2);
grid on;
title('(d) x(2t)');
ylim([-0.5, 1.5]);

% (e) x(t/2) (expansão temporal)
subplot(3, 2, 6);
x5e = u(t/2) - u(t/2-2);
plot(t, x5e, 'LineWidth', 2);
grid on;
title('(e) x(t/2)');
ylim([-0.5, 1.5]);



% --- Exercício 6 ---
% sinal x(t) = e^(-t)u(t)
figure('Name', 'Exercício 6');
t = -2:0.01:8;
x_base_6 = @(t) exp(-t) .* u(t);

% Sinal Original para comparação
subplot(2, 2, 1);
plot(t, x_base_6(t), 'r', 'LineWidth', 2);
grid on;
title('Sinal Original x(t)');

% (a) x(t-3)
subplot(2, 2, 2);
plot(t, x_base_6(t-3), 'LineWidth', 2);
grid on;
title('(a) x(t-3)');

% (b) x(-t)
subplot(2, 2, 3);
plot(t, x_base_6(-t), 'LineWidth', 2);
grid on;
title('(b) x(-t)');

% (c) x(2t-4)
subplot(2, 2, 4);
plot(t, x_base_6(2*(t - 4)), 'LineWidth', 2); #ordem de precedencia das operações importa muito
grid on;
title('(c) x(2t-4)');



% --- Exercício 7 ---
% Esboce y(t) = [u(t)-u(t-2)]*cos(pi*t)
figure('Name', 'Exercício 7');
t = -1:0.01:3;
pulso = u(t) - u(t-2);
x7 = pulso .* cos(pi*t);
plot(t, x7, 'LineWidth', 2);
grid on;
title('Exercício 7: y(t) = [u(t)-u(t-2)] \cdot cos(\pi t)');
xlabel('t');
ylabel('y(t)');



% --- Exercício 8 ---
% Esboce x(t) = x1(t) + x2(t)
figure('Name', 'Exercício 8');
t = -1:0.01:3;
x1_t = u(t) - u(t-1);
x2_t = u(t-1) - u(t-2);
x8 = x1_t + x2_t; % Isso equivale a u(t) - u(t-2)
plot(t, x8, 'LineWidth', 2);
grid on;
title('Exercício 8: x(t)=x_{1}(t)+x_{2}(t)');
xlabel('t');
ylabel('x(t)');
ylim([-0.5, 1.5]);



% --- Exercício 9 ---
% Esboce o sinal x(t) = 2*e^(-|t|)
figure('Name', 'Exercício 9');
t = -5:0.01:5;
x9 = 2 * exp(-abs(t));
plot(t, x9, 'LineWidth', 2);
grid on;
title('Exercício 9: x(t) = 2e^{-|t|}');
xlabel('t');
ylabel('x(t)');



% --- Exercício 10 ---
% Esboce x(t) = sin(2*pi*t) * [u(t+1)-u(t-1)]
figure('Name', 'Exercício 10');
t = -2:0.01:2;
janela = u(t+1) - u(t-1);
x10 = sin(2*pi*t) .* janela;
plot(t, x10, 'LineWidth', 2);
grid on;
title('Exercício 10: x(t) = sin(2\pi t) \cdot [u(t+1)-u(t-1)]');
xlabel('t');
ylabel('x(t)');



% --- Exercício 11 ---
% Esboce o sinal rampa limitada x(t) = t*[u(t)-u(t-2)]
figure('Name', 'Exercício 11');
t = -1:0.01:3;
janela_rampa = u(t) - u(t-2);
x11 = t .* janela_rampa;
plot(t, x11, 'LineWidth', 2);
grid on;
title('Exercício 11: Rampa Limitada x(t) = t[u(t)-u(t-2)]');
xlabel('t');
ylabel('x(t)');



% --- Exercício 12 ---
% Esboce x(t) = u(t)-2u(t-1)+u(t-2)
figure('Name', 'Exercício 12');
t = -1:0.01:4;
x12 = u(t) - 2*u(t-1) + u(t-2);
plot(t, x12, 'LineWidth', 2);
grid on;
title('Exercício 12: x(t) = u(t)-2u(t-1)+u(t-2)');
xlabel('t');
ylabel('x(t)');
ylim([-1.5, 1.5]);


% --- Exercício 13 ---
% Esboce o sinal senoidal amortecido
figure('Name', 'Exercício 13');
t = -1:0.01:5;
x13 = exp(-0.5*t) .* cos(2*pi*t) .* u(t);
plot(t, x13, 'LineWidth', 2);
grid on;
title('Exercício 13: Senoidal Amortecido x(t) = e^{-0.5t}cos(2\pi t)u(t)');
xlabel('t');
ylabel('x(t)');
