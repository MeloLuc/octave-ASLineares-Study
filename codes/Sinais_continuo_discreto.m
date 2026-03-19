%Script: sinais_continuos_discretos.m
close all;
clear all;
clc;

fs = 20 %Frequência de amostragem
Ts = 1/fs %Período de amostragem

f = 1; %Frequência do sinal x(t)

t = -2:Ts:2;

A = 2; %Amplitude de pico
omega = 2*pi*f; %Frequência angular contínua (rad/s)
x_t = A * sin(omega*t)

Omega = 2*pi*f/fs %Frequência angular discreta (rad/amostra)
n = t / Ts %Eixo das amostras
x_n = A * sin(Omega * n);

figure
subplot(2, 1, 1);
plot(t, x_t, 'r');
subplot(2, 1, 2);
stem(n, x_n, 'Filled');
