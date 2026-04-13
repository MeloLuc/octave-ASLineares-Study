%questão 01 da atividade 01 da disciplina de análise de sinais
%Discente: Lucas de Melo Monteiro peixoto

clear all;
close all;
clc;

% Amostragem para simular continuidade no intervalo de [-1, 5]
t = -1:0.01:5;

% SIMULÇÃO DA REPRESENTAÇÃO FUNCIONAL DO SINAL
x_funcional = zeros(size(t));

for i = 1:length(t)
  if t(i) >=0 && t(i) <= 2
    x_funcional(i) = t(i);
  elseif t(i) > 2 && t(i) <= 3
    x_funcional(i) = -2*t(i) + 6;
  else
    x_funcional(i) = 0;
  end
end


% SIMULAÇÃO DA REPRESENTAÇÃO POR SINAIS BÁSICOS
u = @(tau) (tau >=0);

r = @(tau) tau .* u(tau)

x_basico = r(t) - 3*r(t-2) + 2*r(t-3);


figure('Name', 'Resolução questão 1');

subplot(2, 1, 1);
plot(t, x_funcional, 'b', 'Linewidth', 2);
title('Gráfico por representação funcional do sinal');
xlabel('Tempo t');
ylabel('x(t)');
axis([-1 5 -0.5 2.5])
grid on

subplot(2, 1, 2);
plot(t, x_basico, 'r--', 'Linewidth', 2);
title('Gráfico da representação por sinais básicos');
xlabel('Tempo t');
ylabel('x(t)');
axis([-1 5 -0.5 2.5]);
grid on;

