function plotCompleto(lim_ejes,eje_x,eje_y,titulo,tam_letra,col,grosor,t,x,pos)
% plotCompleto(lim_ejes,eje_x,eje_y,titulo,tam_letra,col,grosor,t,x)
%

  subplot(pos);
  plot(t,x,col,'Linewidth',grosor); % Grafico. Color (y marcador) y grosor.
  axis(lim_ejes); % L´ımites de los ejes. Grilla.
  grid on; % Grilla

  % Configurar propiedades de la grilla
  set(gca, 'GridLineStyle', '-'); % Estilo de la grilla: '-' para líneas continuas
  set(gca, 'GridColor', [0.1 0.1 0.1]); % Color de la grilla (gris oscuro)
  set(gca, 'GridAlpha', 0.7); % Opacidad de la grilla (0 a 1, 0.7 para mayor visibilidad)
  set(gca,'FontSize', tam_letra); % Tama~no de letra para la leyenda y ejes.

  % Dibujar ejes x=0 y y=0 más oscuros y gruesos
  x_limits = lim_ejes(1:2); % Límites del eje x [xmin xmax]
  y_limits = lim_ejes(3:4); % Límites del eje y [ymin ymax]

  if y_limits(1) <= 0 && y_limits(2) >= 0 % Solo dibujar si y=0 está en el rango
    line(x_limits, [0 0], 'Color', [0 0 0], 'LineWidth', 2, 'HandleVisibility', 'off');
  end

  % Línea x=0 (eje y)
  if x_limits(1) <= 0 && x_limits(2) >= 0 % Solo dibujar si x=0 está en el rango
      line([0 0], y_limits, 'Color', [0 0 0], 'LineWidth', 2, 'HandleVisibility', 'off');
  end
  hold off;

  % Etiquetas y titulos
  xlabel(eje_x); % Nombro el eje x.
  ylabel(eje_y); % Nombro el eje y.
  title(titulo); % Coloco tıtulo para el grafico.

  % Fondo de la figura (gris claro)
  set(gcf,'Color',[0.9 0.9 0.9]);
end
