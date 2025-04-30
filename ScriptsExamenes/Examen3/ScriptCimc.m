clear
clc
syms s Tf

% Asignación de la planta
K = 1.6;
T = 7.2;
L = 3.6;

Pinv = K/(T*s+1)^2;
n = 2; % Grado de filtro necesario

% Controlador obtenido
Cimc = 1/Pinv * 1/(Tf*s+1)^n;

% Límite de amplificacion de ruido
limInf = limit(Cimc, s, Inf);
limCero = limit(Cimc, s, 0);
eqCimc = abs(limInf/limCero) == 20;
fprintf('Tf = %f \n', solve(eqCimc, Tf))

% Ganancia
fprintf('Ganancia = %f \n', limCero)
