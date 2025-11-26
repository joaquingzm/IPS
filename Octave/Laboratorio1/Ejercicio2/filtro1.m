function [ny,y] = filtro1(nx,x)

  %Valores obtenidos de plantear la respuesta total y buscar una unica delta de kronecker
  n1 = 8820;
  beta=-0.4;

  Lx = length(x);
  L_final = Lx + n1;

  % x[n]
  x0 = [x zeros(1, n1)];

  % x[n - n1]
  x1 = [zeros(1,n1) x zeros(1, L_final - (n1 + Lx))];

  % Salida
  y = x0 + beta*x1;

  % Busco soporte hasta max(nx) + n1
  ny = (nx(1) : (nx(end) + n1));
end
