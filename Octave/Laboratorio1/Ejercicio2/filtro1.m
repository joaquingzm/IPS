function [ny,y] = filtro1(nx,x)
  %Valores obtenidos de plantear la respuesta total Canal + Filtro y buscar que la salida sea una unica delta de kronecker
  n1 = 8820;
  beta=-0.4;
  %Calculo del soporte final
  Lx = length(x);
  L_final = Lx + n1;

  % x[n]
  x_aux = [x zeros(1, n1)];

  % x[n - n1]
  x1 = [zeros(1,n1) x zeros(1, L_final - (n1 + Lx))];

  % Salida
  y = x_aux + beta*x1;

  % Nuevos indices para el cual estara definida la señal de salida y[n]
  ny = (nx(1) : (nx(end) + n1));
end
