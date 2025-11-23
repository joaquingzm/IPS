function y = sistema3(x)

  % Desplazo la entrada para obtener x[n-1]
  x_n1 = [0 x(1:end-1)];

  % Inicializo salida
  y = zeros(size(x));

  % Recorro todas las muestras
  for n = 1:length(x)
    if n == 1
      % y[n-1] = y[0] = 0
      y_prev = 0;
    else
      y_prev = y(n-1);
    end

    y(n) = 0.25*x(n) + 0.25*x_n1(n) + 0.5*y_prev;
  end

end

