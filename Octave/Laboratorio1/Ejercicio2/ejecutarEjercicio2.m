function ejecutarEjercicio2()
    clc;

    while true
        fprintf("=====================================\n");
        fprintf("          EJERCICIO 2\n");
        fprintf("=====================================\n\n");

        fprintf("  1) Inciso 1 - Gráfico de respuesta al impulso de hcanald.m \n");
        fprintf("  2) Inciso 2 - Gráfico de respuesta al impulso obtenida al ingresar una delta de kronecker a la ecuación en diferencias que se dedujo en el inciso 1 \n");
        fprintf("  3) Inciso 3 - Gráfico de la señal de entrada (audio.wav) y de la salida del canal al aplicarle esta\n");
        fprintf("  4) Inciso 4 - Gráficos de la respuesta impulsional Canal + Filtro. Para filtros con 1, 2 y 3 ramas de retardo. \n");
        fprintf("  5) Inciso 5 - Aplicación de filtros a la salida de hcanald.m y comparacion de como se escuchan las salidas.\n");
        fprintf("  0) Volver al menú principal\n");

        opcion = input("\nSeleccione un inciso: ");

        switch opcion
            case 1
              ejercicio02inc1();
              clc;
            case 2
              ejercicio02inc2();
              clc;
            case 3
              ejercicio02inc3();
              clc;
            case 4
              ejercicio02inc4();
              clc;
            case 5
              ejercicio02inc5();
              clc;
            case 0, return;
            otherwise
                fprintf("Opción inválida.\n\n");
        end
    end
end

