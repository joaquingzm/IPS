function ejercicio02inc5 ()
clear all; close all; clc;
% Carpeta donde está este archivo
baseDir = fileparts(mfilename('fullpath'));
% Funciones está DOS niveles arriba
funcDir = fullfile(baseDir, '..', '..', 'Funciones');
addpath(funcDir);
%IPS2025_PU1 está UN nivel arriba
labDir = fullfile(baseDir, '..', 'IPS2025_PU1');
addpath(labDir);
audioPath= fullfile(labDir, 'audio.wav');

%!!! Si hay directorios con la letra ñ no se va a cargar correctamente el audio !!!
[z , fs] = audioread(audioPath); %Devuelve en z una matriz de 2 columnas dado que el audio es estereo
x1 = (z(:,1)).'; %Toma la primera columna (z(:,1) es un vector columna) → canal izquierdo. Luego .' lo transpone → lo convierte en vector fila.
x2 = (z(:,2)).'; %Mismo pero con canal derecho
x = (x1+x2)/2; %Promedio obteniendo audio mono


n = 1:length(x);

sound(x,fs);
%Salida al aplicarle audio.wav al canal
[ny,y] = canal(n,x);
%Salida del Filtro FIR con 1 rama de retardo al aplicarle la salida del canal
[nyfinal,y1]=filtro1(ny,y);

sound(y1,fs);
%Salida del Filtro FIR con 2 ramas de retardo al aplicarle la salida del canal
[nyfinal,y2]=filtro2(ny,y);

sound(y2,fs);
%Salida del Filtro FIR con 3 ramas de retardo al aplicarle la salida del canal
[nyfinal,y3]=filtro3(ny,y);

sound(y3,fs);

end
