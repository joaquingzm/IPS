function y = sistema(x)

  % Desplazo la entrada para obtener x[n-n1]
  n1 = 8820;
  x_n1 = [zeros(1,n1) x(1:end-n1)];

  % Desplazo la entrada para obtener x[n-n2]
  n2 = 17640;
  x_n2 = [zeros(1,n2) x(1:end-n2)];

  % Inicializo salida
  y = 1*x + 0.4*x_n1 + 0.16*x_n2;
end
