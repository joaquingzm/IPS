function [ny,y] = sistema2(nx,x)
  x_1 = [0 x];   % x[n-1]
  x_aux   = [x 0];   % x[n]
  y = 0.5*x_aux - 0.5 * x_1;
  ny = (nx(1) : (nx(end) + 1));  % Nuevos indices para el cual estara definida la señal de salida y[n]
end
