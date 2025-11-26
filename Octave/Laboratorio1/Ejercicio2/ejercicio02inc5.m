% Carpeta donde está este archivo
baseDir = fileparts(mfilename('fullpath'));
% Funciones está DOS niveles arriba
funcDir = fullfile(baseDir, '..', '..', 'Funciones');
addpath(funcDir);
%IPS2025_PU1 está UN nivel arriba
labDir = fullfile(baseDir, '..', 'IPS2025_PU1');
addpath(labDir);

clear all; close all; clc;

[z , fs] = audioread('IPS2025_PU1/audio.wav'); %Devuelve en z una matriz de 2 columnas dado que el audio es estereo
x1 = (z(:,1)).'; %Toma la primera columna (z(:,1) es un vector columna) → canal izquierdo. Luego .' lo transpone → lo convierte en vector fila.
x2 = (z(:,2)).';
x = (x1+x2)/2; %Promedio obteniendo audio mono


n = 1:length(x);

[ny,y] = canal(n,x);

[nyfinal,y1]=filtro1(ny,y);

sound(y1,fs);

[nyfinal,y2]=filtro2(ny,y);

sound(y2,fs);

[nyfinal,y3]=filtro3(ny,y);

sound(y3,fs);


