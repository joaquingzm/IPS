% Sistema Ej5 P3
function y = Sej5(x,N,n)
  y = zeros(1,length(n));

  for i = 1:length(n);
    % Caso i-N<n(1) se toma x(i-N<n(1))=0
    % El límite inferior de la ventana toma valores de x que no existen
    if i-N<1
      y(i) = sum([x(1:i+N)]);
    endif

    % Caso i-N>=n(1) y i+N<=n(length(n))
    % Ambos límites de la ventana toman valores de x que existen
    if i-N>=1 & i+N<=length(n)
      y(i) = sum([x(i-N:i+N)]);
    endif

    % Caso i+N>n(length(n)) se toma x(i+N>n(length(n))=0
    % El límite superior de la ventana toma valores de x que no existen
    if i+N>length(n)
      y(i) = sum([x(i-N:length(n))]);
    endif
  endfor

end

