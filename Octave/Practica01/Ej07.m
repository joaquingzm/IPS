%% Ej7 a) P1 - IPS

close all; clc; clear all;

addpath('Funciones');

%{

% a)
N = 1000; % Cantidad de muestras
x = rand(1,N); % Genera numeros aleatorios uniformemente
               % distribuidos entre 0 y 1
figure, plot(x);
figure,hist(x);

y = 10*(rand(1,N)-0.5); % Genera numeros aleatorios uniformemente
                        % distribuidos entr 0 y 1, después con el
                        % -0.5 quedan entre -0.5 y 0.5 . Y con el
                        % 10* queda entre -5 y 5.
figure, plot(y);
figure, hist(y); % Genera un histograma de 10 intervalos por defecto


% b)
N = 1000;
K = 30;
z = randn(1,N);
figure, plot(z);
figure, hist(z,K); % Genera un histograma de K intervalos
%}


% c)
N = 1000;
M = 2;
x = rand(M,N)-0.5; % Genera una matriz de M filas y N columnas
                   % con numeros aleatorios entre -0.5 y 0.5
y = sum(x,1); % Suma las N columnas de la 1era fila
figure, hist(x'); % x' -> Matriz raspuesta de N filas y M columnas
                  % hist(x') genera M histogramas (uno por columna)
                  % de los N valores en cada columna.
figure, hist(y);

