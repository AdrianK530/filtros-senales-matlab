%% Limpiar
clear; clc; close all;

%% 1. Señal de entrada
fs = 1000;                 % frecuencia de muestreo
t = 0:1/fs:1;              % tiempo

% señal con 2 frecuencias
senal = sin(2*pi*50*t) + sin(2*pi*200*t);

% agregar ruido
ruido = 0.5*randn(size(t));
senal_ruido = senal + ruido;

%% 2. Diseño de filtros

% Filtro pasa bajas (100 Hz)
fc_pb = 100;
[b_pb, a_pb] = butter(4, fc_pb/(fs/2), 'low');

% Filtro pasa altas (150 Hz)
fc_pa = 150;
[b_pa, a_pa] = butter(4, fc_pa/(fs/2), 'high');

% Filtro pasa banda (80 - 180 Hz)
fc_pbanda = [80 180];
[b_pba, a_pba] = butter(4, fc_pbanda/(fs/2), 'bandpass');

%% 3. Aplicar filtros
salida_pb = filter(b_pb, a_pb, senal_ruido);
salida_pa = filter(b_pa, a_pa, senal_ruido);
salida_pba = filter(b_pba, a_pba, senal_ruido);

%% 4. Graficar resultados
figure;

subplot(4,1,1)
plot(t, senal_ruido)
title('Señal original con ruido')

subplot(4,1,2)
plot(t, salida_pb)
title('Filtro Pasa Bajas')

subplot(4,1,3)
plot(t, salida_pa)
title('Filtro Pasa Altas')

subplot(4,1,4)
plot(t, salida_pba)
title('Filtro Pasa Banda')
