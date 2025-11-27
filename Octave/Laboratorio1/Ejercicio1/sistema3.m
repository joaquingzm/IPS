function [ny, y] = sistema3(nx,x)


  x_1 = [0 x]; %x[n-1]
  x_aux = [x 0]; %x[n]

  ny = (nx(1) : (nx(end) + 1)); % Nuevos indices para el cual estara definida la señal de salida y[n]
  % Inicializo salida
  y = zeros(size(ny));

  % Recorro todas las muestras
  for n = 1:length(ny)
    if n == 1
      % y[n-1] = y[0] = 0 (Condiciones iniciales nulas)
      y_1 = 0;
    else
      y_1 = y(n-1);
    end

    y(n) = 0.25*x_aux(n) + 0.25*x_1(n) + 0.5*y_1;
  end

end

