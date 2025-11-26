function [ny,y] = sistema1(nx,x)
  x_shift = [0 x];   % x[n-1]
  disp(x(nx(end)))
  x_aux   = [x 0];   % x[n] con el tamaño adecuado
  y = 0.5*x_aux + 0.5 * x_shift;
  ny = (nx(1) : (nx(end) + 1));  % Nuevo soporte
end
