function ejecutarEjercicio1()
    clc;

    while true
        fprintf("=====================================\n");
        fprintf("          EJERCICIO 1\n");
        fprintf("=====================================\n\n");

        fprintf("  1) Inciso 1 - Grafico de senial.m y  de la aproximación de su TFTD\n");
        fprintf("  2) Inciso 2 - Graficos de la respuesta impulsional y la respuesta en frecuencia de cada uno de los sistemas (de manera analítica)\n");
        fprintf("  3) Inciso 3 - Implementación de los sistemas y graficos comparativos entre lo obtenido analiticamente y sus aproximaciones\n");
        fprintf("  4) Inciso 4 - Graficos de la señal de salida para cada sistema, cuando se aplica a la entrada la señal del inciso 1.\n");
        fprintf("  5) Inciso 5 - Graficos de las aproximaciones de las TFTD de la salida para cada sistema al ingresar senial.m \n");
        fprintf("  0) Volver al menú principal\n");

        opcion = input("\nSeleccione un inciso: ");

        switch opcion
            case 1
              ejercicio01inc1();
              clc;
            case 2
              ejercicio01inc2();
              clc;
            case 3
              ejercicio01inc3();
              clc;
            case 4
              ejercicio01inc4();
              clc;
            case 5
              ejercicio01inc5();
              clc;
            case 0, return;
            otherwise
                fprintf("Opción inválida.\n\n");
        end
    end
end
