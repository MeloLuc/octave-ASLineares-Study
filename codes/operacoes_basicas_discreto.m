%Script: operacoes_basicas_discreto.m

close all;
clear all;
clc;


% Definir o eixo do sinal
n = -10:10;  % 21 amostras: de -10 a 10

% Sinal original (função anônima)
x = @(n) (n >= 0 & n <= 5);   % pulso retangular

%x = @(n) (2*sin(pi/4*n));

%x = @(n) n .* (n >= 0 & n <= 4);

% 1) Deslocamento
x_atraso   = @(n,k) x(n - abs(k));
x_avanco = @(n, k) x(n + abs(k));


% 2) Reflexão
x_reflex = @(n) x(-n);


% 3) Reamostragem (Escalonamento)
% Decimação (Compressão)
x_compress = @(n, k) x(abs(k)*n);


% Interpolação (Expansão) - tratando índices inteiros, múltiplos de k
x_expan = @(n, k) x(n/k).*(mod(n,k)==0) + 0.5*( x((n-1)/2) + x((n+1)/2) ).*(mod(n,k)~=0);


kd = 2; % fator de deslocamento
ke = 2; % fator de escalamento

figure;
subplot(3,2,1);
stem(n, x(n), 'filled');
title('Sinal original x[n]');
xlabel('n'); ylabel('x[n]');
grid on;
ylim(ylim*1.2)

subplot(3,2,3);
stem(n, x_atraso(n, kd), 'filled');
title(sprintf('Atraso: x[n - %d]', abs(kd)));
grid on;
ylim(ylim*1.2)

subplot(3,2,4);
stem(n, x_avanco(n, kd), 'filled');
title(sprintf('Avanço: x[n + %d]', abs(kd)));
grid on;
ylim(ylim*1.2)

subplot(3,2,5);
stem(n, x_expan(n, ke), 'filled');
title(sprintf('Interpolação: x[n/%d]', abs(ke)));
grid on;
ylim(ylim*1.2)

subplot(3,2,6);
stem(n, x_compress(n, ke), 'filled');
title(sprintf('Decimação: x[%dn]', abs(ke)));
grid on;
ylim(ylim*1.2)

subplot(3,2,2);
stem(n, x_reflex(n), 'filled');
title('Reflexão: x[-n]');
grid on;
ylim(ylim*1.2)

% 4) Operação combinada
% y[n] = x[2n - 4]
##x_comb = @(n) x(2*n - 4);
##
##figure;
##stem(n, x_comb(n), 'filled');
##title('Operação combinada: x[2n - 4]');
##grid on;
##ylim(ylim*1.2);
