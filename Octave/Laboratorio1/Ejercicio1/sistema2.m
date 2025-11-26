function [ny,y] = sistema2(nx,x)
  x_shift = [0 x];   % x[n-1]
  x_aux   = [x 0];   % x[n] con el tamaño adecuado
  y = 0.5*x_aux - 0.5 * x_shift;
  ny = (nx(1) : (nx(end) + 1));  % Nuevo soporte
end
