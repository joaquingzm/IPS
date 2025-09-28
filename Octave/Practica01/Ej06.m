addpath('./Funciones/.');

t = [-2:0.001:5];

h0 = tri(t);
h1 = 2*tri(0.5*(t-1));


%Primer plto
plotCompleto([t(1) t(end) -2 5],'t','h0(t)','Señal h0(t)',20,'r*-',0.5,t,h0,211);

%Segundo plot
plotCompleto([t(1) t(end) -2 5],'t','h0(1/2(t-1))','Señal h0(1/2(t-1))',20,'y*-',0.5,t,h1,212);

