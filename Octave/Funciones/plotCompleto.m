function plotCompleto(t, x, varargin)
    % plotCompleto(t, x, 'ParameterName', ParameterValue, ...)
    %
    % Parámetros opcionales (nombre-valor):
    %   - 'Subplot' (vector/celda): Configuración de subplot
    %       Formato 1: [filas, columnas, índice]
    %       Formato 2: {filas, columnas, vector_de_índices}
    %   - 'Hold' (true/false): Mantener gráfico actual para superponer (default: false)
    %   - 'Maximize' (true/false): Maximizar ventana (default: false)
    %   - 'AxisLimits' (vector): Límites de ejes [xmin xmax ymin ymax] (default: auto)
    %   - 'XLabel' (string): Etiqueta eje X (default: '')
    %   - 'YLabel' (string): Etiqueta eje Y (default: '')
    %   - 'Title' (string): Título del gráfico (default: '')
    %   - 'FontSize' (number): Tamaño de fuente (default: 12)
    %   - 'LineStyle' (string): Estilo/color de línea (default: 'b-')
    %   - 'LineWidth' (number): Grosor de línea (default: 1)
    %
    % Ejemplos:
    %    t = 0:0.1:10;
    %    x1 = sin(t);
    %    x2 = cos(t);
    %
    %    % Subplot tradicional
    %    plotCompleto(t, x1, 'Subplot', [2,1,1], 'Title', 'Seno');
    %    plotCompleto(t, x2, 'Subplot', [2,1,2], 'Title', 'Coseno');
    %
    %    % Subplot con múltiples índices (usando celda)
    %    plotCompleto(t, x1, 'Subplot', {2,2,[1,2]}, 'Title', 'Seno en subplot combinado');
    %    plotCompleto(t, x2, 'Subplot', {2,2,3}, 'Title', 'Coseno');
    %    plotCompleto(t, x1+x2, 'Subplot', {2,2,4}, 'Title', 'Suma');

    % Valores por defecto
    defaultParams = struct(...
        'Subplot', [], ...
        'Hold', false, ...
        'Maximize', false, ...
        'AxisLimits', [], ...
        'XLabel', '', ...
        'YLabel', '', ...
        'Title', '', ...
        'FontSize', 12, ...
        'LineStyle', '', ...
        'LineWidth', 1);

    % Parsear parámetros
    params = parseParams(defaultParams, varargin);

    % Manejar subplots
    if ~isempty(params.Subplot)
        % Determinar el formato del parámetro Subplot
        if iscell(params.Subplot)
            % Formato de celda: {filas, columnas, índices}
            if numel(params.Subplot) ~= 3
                error('El parámetro Subplot en formato celda debe tener 3 elementos: {filas, columnas, índices}');
            end
            m = params.Subplot{1};
            n = params.Subplot{2};
            p = params.Subplot{3};
        else
            % Formato de vector: [filas, columnas, índice] o [filas, columnas, índice1, índice2, ...]
            if numel(params.Subplot) < 3
                error('El parámetro Subplot debe tener al menos 3 elementos');
            end
            m = params.Subplot(1);
            n = params.Subplot(2);
            p = params.Subplot(3:end);
        end

        % Crear figura si no existe o no estamos en modo hold
        if ~params.Hold
            if params.Maximize
                figure('units','normalized','outerposition',[0 0 1 1]);
            else
                figure;
            end
        end

        % Seleccionar subplot (maneja tanto índices escalares como vectores)
        subplot(m, n, p);
    else
        % Crear figura o mantener actual (solo si no hay subplot)
        if ~params.Hold
            if params.Maximize
                figure('units','normalized','outerposition',[0 0 1 1]);
            else
                figure;
            end
        else
            hold on;
        end
    end

    % Graficar
    plot(t, x, params.LineStyle, 'Linewidth', params.LineWidth);

    % Configurar ejes
    if ~isempty(params.AxisLimits)
        axis(params.AxisLimits);
    end
    grid on;

    % ----------
    % Cosas que agregué

    % Dibujar ejes x=0 y y=0 más oscuros y gruesos

    %plot(xlim, [0 0], 'k', 'LineWidth', 2);  % eje x
    %plot([0 0], ylim, 'k', 'LineWidth', 2);  % eje y

    % ----------


    % ------------------------------------------------------------

    % En octave ciertos comandos de este codigo no funcionan, reescribo abajo

    % Configurar texto (solo si no estamos en modo hold o es la primera vez)
    %if ~params.Hold || isempty(get(gca, 'XLabel').String)
    %    set(gca, 'FontSize', params.FontSize);
    %    if ~isempty(params.XLabel)
    %        xlabel(params.XLabel, 'Interpreter', 'Latex');
    %    end
    %    if ~isempty(params.YLabel)
    %        ylabel(params.YLabel, 'Interpreter', 'Latex');
    %    end
    %    if ~isempty(params.Title)
    %        title(params.Title, 'Interpreter', 'Latex');
    %    end
    %end

    xlabelHandle = get(gca, 'xlabel');
    if ~params.Hold || isempty(get(xlabelHandle, 'string'))
        set(gca, 'FontSize', params.FontSize);
        if ~isempty(params.XLabel)
            xlabel(params.XLabel);
        end
        if ~isempty(params.YLabel)
            ylabel(params.YLabel);
        end
        if ~isempty(params.Title)
            title(params.Title);
        end
    end



    % ------------------------------------------------------------

    % Restaurar estado hold si es necesario
    if params.Hold
        hold on;
    else
        hold off;
    end
end

function params = parseParams(defaultParams, varargin)
    p = inputParser;
    addParameter(p, 'Subplot', defaultParams.Subplot, @(x) isempty(x) || isnumeric(x) || iscell(x));
    addParameter(p, 'Hold', defaultParams.Hold);
    addParameter(p, 'Maximize', defaultParams.Maximize);
    addParameter(p, 'AxisLimits', defaultParams.AxisLimits);
    addParameter(p, 'XLabel', defaultParams.XLabel);
    addParameter(p, 'YLabel', defaultParams.YLabel);
    addParameter(p, 'Title', defaultParams.Title);
    addParameter(p, 'FontSize', defaultParams.FontSize);
    addParameter(p, 'LineStyle', defaultParams.LineStyle);
    addParameter(p, 'LineWidth', defaultParams.LineWidth);

    parse(p, varargin{1}{:});
    params = p.Results;
end


% function plotCompleto(maximizar,lim_ejes,eje_x,eje_y,titulo,tam_letra,col,grosor,t,x)
%
%     % plotCompleto(lim_ejes,eje_x,titulo,tam_letra,col,grosor,t,x)
%     %
%     % Ej:
%     %    t = -40:0.01:40;
%     %    xa = -2*sin(-0.2*t + 5/3*pi);
%     %    plotCompleto([t(1) t(end) -2 2],'t','f(t)','Function \ f(t)',20,'r.-',2,t,xa)
%
%     if maximizar
%         figure('units','normalized','outerposition',[0 0 1 1]) % Creo y maximizo figura.
%     end
%     plot(t,x,col,'Linewidth',grosor); % Grafico. Color (y marcador) y grosor.
%     axis(lim_ejes);grid on; % Coloco los limites de los ejes. Grilla.
%     set(gca, 'FontSize', tam_letra); % Tamaño de letra para la leyenda y ejes.
%     xlabel(eje_x,'Interpreter','Latex'); % Nombro el eje x.
%     ylabel(eje_y,'Interpreter','Latex'); % Nombro el eje y.
%     title(titulo,'Interpreter','Latex');                       % Coloco título para el gráfico.
%
%     % Nota: Lo de 'interpreter', 'Latex' es opcional...sólo modifica la
%     % fuente. Pueden googlear Latex como editor de textos...
%
% end
