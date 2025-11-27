function ejercicio02inc1 ()
clear all; close all; clc;
% Carpeta donde está este archivo
baseDir = fileparts(mfilename('fullpath'));
% Funciones está DOS niveles arriba
funcDir = fullfile(baseDir, '..', '..', 'Funciones');
addpath(funcDir);
%IPS2025_PU1 está UN nivel arriba
labDir = fullfile(baseDir, '..', 'IPS2025_PU1');
addpath(labDir);



[n, h] = hcanald(037514);

stemCompleto(n,h,...
  'AxisLimits',[min(n) max(n) min(h)*1.2 max(h)*1.2],...
  'Hold',1,...
  %'Subplot',[2 1 1],...
  'XLabel','n',...
  'YLabel','h_c_a_n_a_l[n]',...
  'Title','Respuesta impulsional del canal',...
  'FontSize', 20,...
  'LineStyle','-',...
  'Color','r',...
  'MarkerFaceColor','r',...
  'MarkerEdgeColor','r',...
  'LineWidth',3);

%Con este for vemos los valores donde h[n] != 0 y los respectivos valores de n, de esta manera obtenemos
%los coeficientes y desplazamientos para armar la ecuacion en diferencias
%{
for i = 1:length(n)
  if h(i) != 0
    disp(n(i));
    disp(h(i));
  endif
end

Los valores de n fueron : 0 8820 17640
Los valores de h para esos n fueron: 1 0.4 0.16
%}
end

