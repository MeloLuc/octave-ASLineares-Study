%Script: operacoes_sinais_continuos.m

clear all;
close all;
clc;


% eixo de tempo
t = -10:0.01:10;

% função anônima do sinal

x_t = @(t)( (t+2).*(t>=-2 & t<=0) + 2*(t>0 & t<=2) + (-t+4).*(t>2 & t<=4) );


%Deslocamento temporal
x_atraso = x_t(t-2);
x_avanco = x_t(t+1);

%Escalamento temporal
x_comp = x_t(2*t); % compressão
x_exp = x_t(t/2); % expansão


% Plotagem dos Sinais
figure;
subplot(3,2,1);
plot(t,x_t(t), 'LineWidth', 2);
ylim([0 2.5]);
grid on;
title('Sinal Original', 'FontSize', 12);
xlabel('t(s)', 'FontSize', 12);
ylabel('x(t)');

subplot(3,2,2);
plot(t,x_t(-t), 'LineWidth', 2);
ylim([0 2.5]);
grid on;
title('Operação de Reflexão');
xlabel('t(s)');
ylabel('x(-t)');

subplot(3,2,3);
plot(t,x_atraso, 'LineWidth', 2);
ylim([0 2.5]);
grid on;
title('Operação de Deslocamento (atraso)');
xlabel('t(s)');
ylabel('x(t-2)');

subplot(3,2,4);
plot(t,x_avanco, 'LineWidth', 2);
ylim([0 2.5]);
grid on;
title('Operação de Deslocamento (avanço)');
xlabel('t(s)');
ylabel('x(t+1)');

subplot(3,2,5);
plot(t,x_comp, 'LineWidth', 2);
ylim([0 2.5]);
grid on;
title('Operação de Escalamento (compressão)');
xlabel('t(s)');
ylabel('x(2t)');

subplot(3,2,6);
plot(t,x_exp, 'LineWidth', 2);
ylim([0 2.5]);
grid on;
title('Operação de Escalamento (expansão)');
xlabel('t(s)');
ylabel('x(t/2)');
