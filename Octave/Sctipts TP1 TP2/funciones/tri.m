function h = tri(t)
    % Se�al triangular del Ej 6 de la P1
    h = (t+1).*(t >= -1 & t < 0) + (-t + 1).*(t >= 0 & t <= 1);
end