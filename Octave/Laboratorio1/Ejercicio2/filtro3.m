function [ny,y] = filtro3(nx,x)

  %Valores obtenidos de plantear la respuesta total Canal + Filtro y buscar que la salida sea una unica delta de kronecker
  n1=8820;
  n2=3*8820;
  n3=35280;
  b1=-0.4;
  b2=0.4^3;
  b3=-0.0256;
  n_max = max([n1 n2 n3]);


  Lx = length(x);
  L_final = Lx + n_max;

  % x[n]
  x0 = [x zeros(1, n_max)];

  % x[n - n1]
  x1 = [zeros(1,n1) x zeros(1, L_final - (n1 + Lx))];

  % x[n - n2]
  x2 = [zeros(1,n2) x zeros(1, L_final - (n2 + Lx))];

  % x[n - n3]
  x3 = [zeros(1,n3) x zeros(1, L_final - (n3 + Lx))];

  % Salida
  y = x0 + b1*x1 +b2*x2 + b3*x3;

  % Busco soporte hasta max(nx) + n3
  ny = (nx(1) : (nx(end) + n_max));
end
