% main.m – Menú de ejecución de ejercicios e incisos
clc; clear; close all;

fprintf("====================================================================\n");
fprintf("     Practica con utilitario 1 – Joaquín Guzmán y Tomás Gamarra      \n");
fprintf("====================================================================0\n\n");



while true
    fprintf("=========== MENÚ PRINCIPAL ===========\n");
    fprintf("1) Ejercicio 1\n");
    fprintf("2) Ejercicio 2\n");
    fprintf("0) Salir\n");
    opcion = input("\nSeleccione una opción: ");

    switch opcion
        case 1
            ejecutarEjercicio1();
             clc;
        case 2
            ejecutarEjercicio2();
            clc;
        case 0
            fprintf("\nSaliendo...\n");
            break;
        otherwise
            fprintf("Opción inválida. Intente nuevamente.\n");
    end
end

