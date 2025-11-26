function [ny, y] = sistema3(nx,x)

  %x[n-1]
  x_shift = [0 x];
  x_aux = [x 0];
  %Nuevo soporte
  ny = (nx(1) : (nx(end) + 1));
  % Inicializo salida
  y = zeros(size(ny));

  % Recorro todas las muestras
  for n = 1:length(ny)
    if n == 1
      % y[n-1] = y[0] = 0
      y_prev = 0;
    else
      y_prev = y(n-1);
    end

    y(n) = 0.25*x_aux(n) + 0.25*x_shift(n) + 0.5*y_prev;
  end

end

