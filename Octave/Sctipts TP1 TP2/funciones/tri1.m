function h = tri1(t)
    % Señal triangular del Ej 6 de la P1
    h = (t+1).*(t >= -1 & t < 1) + (-t + 3).*(t >= 1 & t < 3);
end