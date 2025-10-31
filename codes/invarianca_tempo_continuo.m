% Script invariancia_tempo_continuo.m
clear all;
close all;
clc;

t = -5:0.001:5; % eixo dos tempos

% Definiação dos sinais de entradas usando funções anonimas
sinais = {
  @(t) (t>=0), % Degrau unitário
  @(t) (abs(t) <= 2), % Pulso retangular com largura de 4s
  @(t) (2*sin(4*pi*t)), % Senoide de 2Hz
  @(t) (t .*(t >=0)), % Rampa
  @(t) (0.1 * exp(-t)), % Exponencial decresncente
  @(t) ((2 * t + 4) .* (t >= -2 & t <= 0) + (-2 * t + 4) .* (t > 0 & t <= 2)) % Pulso triangular com largura de 4s
};

nomes_sinais = {"Degrau unitário", "Pulso Retangular", "Senoide", "Rampa", "Exponencial", "Pulso Trinagular"};

% Definição dos sistemas
S = @(x, t) (2 * x);
nome_sistema = {"y(t) = 2 * x(t)"};


% plotagem automaticas de sinais em quadrado perfeitos (quadramento)
num_sinais = length(sinais);
num_linhas = ceil(sqrt(num_sinais));
num_colunas = ceil(num_sinais/num_linhas);

t0 = 2;

for k=1:num_sinais

  % Propriedades de invariância no tempos
  x = sinais{k}(t);

  y_original = S(x, t);

  y_entrada_desloc = S(sinais{k}(t-t0), t);

  y_original_desloc = S(sinais{k}(t-t0), t-t0);

  subplot(num_linhas, num_colunas, k);
  plot(t, sinais{k}(t));

end


