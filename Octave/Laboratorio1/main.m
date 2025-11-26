% main.m – Menú de ejecución de ejercicios e incisos
clc; clear; close all;

% Carpeta donde está este archivo
baseDir = fileparts(mfilename('fullpath'));
disp(baseDir)
% Agrego las carpetas de los ejercicios 1 y 2
funcDir = fullfile(baseDir, 'Ejercicio1');
addpath(funcDir);
funcDir = fullfile(baseDir, 'Ejercicio2');
addpath(funcDir);
fprintf("====================================================================\n");
fprintf("     Practica con utilitario 1 – Joaquín Guzmán y Tomás Gamarra      \n");
fprintf("====================================================================\n\n");



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

