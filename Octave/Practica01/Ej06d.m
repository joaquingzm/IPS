%% Ej6 d) P1 - IPS

addpath('Funciones');

clc; clear all; close all;

% Vector que se utilizara
dt = 1e-2
L = 100;
t = -L:dt:L

% II) Aproximacion de Energia y Potencia de la senal

% Valores arbitrarios (No definidos en el ejercicio)
f0 = 5; %HZ
phi = 2;
A = 1;
T = 1/f0;

% Senal
xII = A.*sin((2*pi*f0).*t + phi);

% Energia
energiaII = sum((xII).^2)*dt;
disp('Energia del II):');
disp(energiaII);

% Potencia
potenciaII = energiaII*(A^2)/(2*L);

disp('Potencia del II:');
disp(potenciaII);


% IV)

% Vector que se utilizara
N = 100;
n = -N:N;

% Senal
xIV = ((1/2).^(n)).*escalon(n);

% Energia
energiaIV = sum(xIV.^2);
disp('Energia del IV:');
disp(energiaIV);

%Potencia
potenciaIV = energiaIV/(2*N +1);
disp(potenciaIV);
disp(potenciaIV);



