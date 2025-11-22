addpath('Funciones')

% iii. q(t) = ⊓ (t/4) y T = 8

% Limpiar todo
clear all; close all; clc;


% ------------------------- Inicio c) -------------------------------

% --- Aproximación de los coef de la SF de x(t) ---

% Período
T = 8;

% ∆T
dt = T/1000;

% Vector de tiempo
%
%     t = n.∆T , donde n viene a ser el n-esimo paso
%     de tamaño ∆T. Resulta entonces t ser el vector
%     que por cada posición tiene el valor de cada
%     paso:
%     t = ∆T.(-500) , ∆T.(-499) , ... , ∆T.499 , ∆T.500
%
t = -.5*T:dt:.5*T;

% Vector índice de los valores ck a calcular
K = 19;
ks = -K:K;

% Un período de x(t)
q = cajon(t/4);

% Vector de los valores ck a calcular
c_aprox = zeros(1,2*K+1);

% Un bucle que itera sobre los valores del vector ks
%
%     Para un k fijo, se evalúa la expresión de la sumatoria
%     en todos los pasos que contiene el vector t, eso después
%     se asigna a la posición correspondiente del vector c
%
for k = ks
  c_aprox(K+k+1) = (dt/T)*sum(q.*exp(-1i*2*pi*k.*t/T));
end

% Valores de ck reales

c_real = (4/T)*sinc(4.*ks/T)


% ------------------------- Fin c) -------------------------------


% ------------------------- Inicio d) -------------------------------

% SF de x en base a coef aproximados

% Vector de tiempo
%
%     Cambié el paso del vector t porque aumenta mucho
%     el tiempo de computo y lo extendí para que entren
%     varios períodos de la SF
%
%{
t = -30:0.05:30;
SFx_aprox = zeros(size(t))
for k = ks
  SFx_aprox = SFx_aprox + exp(1i*2*pi*k*t/T)*c_aprox(K+1+k)
end
%}
% ------------------------- Fin d) -------------------------------



% ------------------------- Inicio e) -------------------------------

f = -20:1e-2:20;
H = 1i*2*pi*f./( (1i*2*pi.*f).^2 + 1i*2*pi*f + 1 )


fk = ks/T
Hk = 1i*2*pi.*fk/( (1i*2*pi.*fk).^2 + 1i*2*pi.*fk + 1 )

c_salida = c_aprox .*Hk

SFy_aprox = zeros(size(t))
for k = ks
  SFy_aprox = SFy_aprox + exp(1i*2*pi*k*t/T)*c_salida(K+1+k)
end

% ------------------------- Fin e) -------------------------------


% --- GRAFICAS ---

% Comparación de coeficientes de la SF

% Coeficientes aproximados
%
%     Los coeficientes tienen una mínima parte imaginaria
%     del orden de 1e-16, por lo que se ignoran
%
stemCompleto(ks,real(c_aprox),...
  'AxisLimits',[min(ks) max(ks) (min(real(c_aprox))*1.5) (max(real(c_aprox))*1.5)],...
  'Hold',1,...
  'Subplot',[3 1 1],...
  'XLabel','k',...
  'Title','Coeficientes aproximados de la SF de la señal x[n]',...
  'FontSize', 20,...
  'LineStyle','-',...
  'Color','r',...
  'MarkerFaceColor','r',...
  'MarkerEdgeColor','r',...
  'LineWidth',3);

legend('c_a_p_r_o_x[k]','location','northwest');

% Coeficientes reales
stemCompleto(ks,c_real,...
  'AxisLimits',[min(ks) max(ks) (min(c_real)*1.5) (max(c_real)*1.5)],...
  'Hold',1,...
  'Subplot',[3 1 2],...
  'XLabel','k',...
  'Title','Coeficientes de la SF de la señal x[n]',...
  'FontSize', 20,...
  'LineStyle','-',...
  'Color','r',...
  'MarkerFaceColor','r',...
  'MarkerEdgeColor','r',...
  'LineWidth',3);

legend('c[k]','location','northwest');

plotCompleto(t,real(SFx_aprox),...
    'Subplot',[2 1 1],...
    'AxisLimits',[min(t) max(t)  -1 3],...
    'XLabel','f',...
    'Title','SF de x en base a coef aproximados ',...
    'FontSize',20,...
    'LineStyle','b.-',...
    'LineWidth',3);

legend('SF(t)','location','northwest');

plotCompleto(t,cajon(t/4),...
    'Hold',1,...
    'Subplot',[2 1 2],...
    'AxisLimits',[min(t) max(t)  -1 3],...
    'XLabel','f',...
    'Title','Un período q de x',...
    'FontSize',20,...
    'LineStyle','b.-',...
    'LineWidth',3);

legend('q(t)','location','northwest');

% SF de la salida del sistema del inciso e)


plotCompleto(t,real(SFy_aprox),...
    'Subplot',[2 1 1],...
    'AxisLimits',[min(t) max(t)  min(real(SFy_aprox))*1.5 max(real(SFy_aprox))*1.5],...
    'XLabel','f',...
    'Title','SF de la salida del sistema',...
    'FontSize',20,...
    'LineStyle','b.-',...
    'LineWidth',3);

plotCompleto(f,abs(H),...
    'Hold',1,...
    'AxisLimits',[-0.5 0.5  -2 2],...
    'Subplot',[2 1 2],...
    'XLabel','f',...
    'Title','SF de la salida del sistema',...
    'FontSize',20,...
    'LineStyle','b.-',...
    'LineWidth',3);

legend('H(f)','location','northwest');

