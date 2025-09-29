function stemCompleto(n, x, varargin)
    % stemCompleto(n, x, 'ParameterName', ParameterValue, ...)
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
    %   - 'Color' (string): Color de la línea y marcadores (default: 'b')
    %   - 'LineStyle' (string): Estilo de línea (default: '-')
    %   - 'LineWidth' (number): Grosor de línea (default: 1)
    %   - 'MarkerFaceColor' (string) : Color del interior de marcadores
    %   - 'MarkerEdgeColor' (string) : Color del borde de marcadores
    %   - 'Marker' (string): Estilo de marcador (default: 'o')
    %   - 'MarkerSize' (number): Tamaño de marcador (default: 6)
    %   - 'Filled' (true/false): Rellenar los marcadores (default: false)
    %   - 'SupTitle' (string):
    %
    % Ejemplos:
    %    n = 0:20;
    %    x = sin(0.2*pi*n);
    %
    %    % Stem básico con marcadores rellenos
    %    stemCompleto(n, x, 'Filled', true);
    %
    %    % Stem con múltiples parámetros
    %    stemCompleto(n, x, 'Maximize', true, 'AxisLimits', [0 20 -1.2 1.2], ...
    %                 'XLabel', 'n', 'YLabel', 'x[n]', 'Title', 'Señal discreta', ...
    %                 'FontSize', 16, 'Color', 'r', 'LineStyle', '-', ...
    %                 'LineWidth', 2, 'Marker', 's', 'MarkerSize', 8, 'Filled', true);

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
        'Color', 'b', ...
        'LineStyle', '-', ...
        'LineWidth', 1, ...
        'MarkerFaceColor', 'none', ...
        'MarkerEdgeColor', 'auto', ...
        'Marker', 'o', ...
        'MarkerSize', 6, ...
        'Filled', true);

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
            n_sub = params.Subplot{2};
            p = params.Subplot{3};
        else
            % Formato de vector: [filas, columnas, índice] o [filas, columnas, índice1, índice2, ...]
            if numel(params.Subplot) < 3
                error('El parámetro Subplot debe tener al menos 3 elementos');
            end
            m = params.Subplot(1);
            n_sub = params.Subplot(2);
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
        subplot(m, n_sub, p);
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

    % Preparar propiedades para stem
    stemProperties = {'Color', params.Color, ...
                     'LineStyle', params.LineStyle, ...
                     'LineWidth', params.LineWidth, ...
                     'Marker', params.Marker, ...
                     'MarkerFaceColor', params.MarkerFaceColor,...
                     'MarkerEdgeColor', params.MarkerEdgeColor,...
                     'MarkerSize', params.MarkerSize};

    % Graficar con stem
    if params.Filled
        h = stem(n, x, 'filled', stemProperties{:});
    else
        h = stem(n, x, stemProperties{:});
    end

    % Configurar ejes
    if ~isempty(params.AxisLimits)
        axis(params.AxisLimits);
    end
    grid on;


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
    addParameter(p, 'Color', defaultParams.Color);
    addParameter(p, 'LineStyle', defaultParams.LineStyle);
    addParameter(p, 'LineWidth', defaultParams.LineWidth);
    addParameter(p, 'MarkerFaceColor', defaultParams.MarkerFaceColor);
    addParameter(p, 'MarkerEdgeColor', defaultParams.MarkerEdgeColor);
    addParameter(p, 'Marker', defaultParams.Marker);
    addParameter(p, 'MarkerSize', defaultParams.MarkerSize);
    addParameter(p, 'Filled', defaultParams.Filled);

    parse(p, varargin{1}{:});
    params = p.Results;
end

% function stemCompleto(lim_ejes,eje_x,eje_y,titulo,tam_letra,col,filled,t,x)
%
%     % StemCompleto(lim_ejes,eje_x,titulo,tam_letra,col,filled,t,x)
%     %
%     % Ej:
%     %    t = -40:0.01:40;
%     %    xa = -2*sin(-0.2*t + 5/3*pi);
%     %    stemCompleto([t(1) t(end) -2 2],'t','f(t)','Function \ f(t)',20,'r.-',2,t,xa)
%
% %     figure('units','normalized','outerposition',[0 0 1 1]) % Creo y maximizo figura.
%     stem(t,x,col,filled,'LineWidth',5,'MarkerSize',10); % Grafico. Color (y marcador) y grosor.
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
