%% Ejercicio 5 d) - P5

addpath('Funciones');

% Limpiar
clear all; close all; clc;

% Se tiene el sistema SLID:
% y[n] + b1 y[n − 1] + b2 y[n − 2] = a0 x[n] + a1 x[n − 1] + a2 x[n − 2]

% Índice de frecuencia
ds = 1e-3;
s = -2:ds:2;

% Matriz de casos para los coeficientes
coef = [
  1  1  0   0    0;   % i
  1 -1  0   0    0;   % ii
  1  0 -1   0    0;   % iii
  1  1  1   0    0;   % iv
  1 -1  1   0    0;   % v
  1  1 -1   0    0;   % vi
  1  0  0  -0.5  0;   % vii
  1  0  0   0.5  0;   % viii
  1  0  0   0.8  0.8; % ix
  1  0  0   0.2  0.8; % x
  1  0  0   0.8  0.2; % xi
];

for i = 1:size(coef,1)

end

% Rta impulsional analítica del SLID
function H = Hfreq (s,a0, a1, a2, b1, b2)
  H = (a0 + a1*exp(-1i*2*pi*s) + a2*exp(-1i*2*pi*s*2) )./(1 + b1*exp(-1i*2*pi*s) + b2*exp(-1i*2*pi*s*2) )
end
