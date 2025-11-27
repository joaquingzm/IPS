function [ny,y] = filtro2(nx,x)
  %Valores obtenidos de plantear la respuesta total Canal + Filtro y buscar que la salida sea una unica delta de kronecker
  n1=8820;
  n2=3*8820;
  b1=-0.4;
  b2=0.4^3;
  n_max = max([n1 n2]);


  Lx = length(x);
  L_final = Lx + n_max;

  % x[n]
  x0 = [x zeros(1, n_max)];

  % x[n - n1]
  x1 = [zeros(1,n1) x zeros(1, L_final - (n1 + Lx))];

  % x[n - n2]
  x2 = [zeros(1,n2) x zeros(1, L_final - (n2 + Lx))];

  % Salida
  y = x0 + b1*x1 +b2*x2;

  % Busco soporte hasta max(nx) + n2
  ny = (nx(1) : (nx(end) + n_max));
end
