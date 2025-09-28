function histCompleto(lim_ejes,eje_x,eje_y,titulo,size_letra,r,x)

    % histCompleto(lim_ejes,eje_x,titulo,size_letra,r,x)
    %
    %   r : Secuencia aleatoria
    %   x : Num. de celdas.
    %
    % Ej: 
    %    N = 10000;
    %    r1 = randn(1,N);
    %    histCompleto([-4 4 0 2e3],'$r_1[n]$','$Frecuencia$','Histograma de $r_1[n]$',20,r1,25)

%     figure('units','normalized','outerposition',[0 0 1 1]) % Creo y maximizo figura.
    hist(r,x);axis(lim_ejes);grid on; % Grafico. Coloco los limites de los ejes. Grilla.
    set(gca, 'FontSize', size_letra); % Tamaño de letra para la leyenda y ejes.
    xlabel(eje_x,'Interpreter','Latex'); % Nombro el eje x.
    ylabel(eje_y,'Interpreter','Latex'); % Nombro el eje y.
    title(titulo,'Interpreter','Latex'); % Coloco título para el gráfico.
    
    % Nota: Lo de 'interpreter', 'Latex' es opcional...sólo modifica la
    % fuente. Pueden googlear Latex como editor de textos...

end