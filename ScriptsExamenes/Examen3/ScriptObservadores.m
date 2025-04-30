clc
close all

% MVE
a = 11.20;
b = 24.09;
c = 26.17;

A = [a 1; 0 -2*a];
B = [0; b];
C = [c 0];
D = 0;

Q = [100 0; 0 1];
R = [0.01];

% Posición de los polos
J = [-20 -20];

% Método a usar 
% 1 = Observadores
% 2 = Realimentación
% 3 = Con integrador 
% 4 = LQR
metodo = 1;

% Verificación
numMVE = length(B);

W = ctrb(A, B);

if (height(A) == length(C))
    O = obsv(A, C);
end

Ahat = [A zeros(height(A),1); -C 0];
Bhat = [B;-D];
What = ctrb(Ahat, Bhat);

% Obtención de Ke y respuesta
if(metodo == 1 & rank(O) == numMVE)
    Ke = acker(A', C', J);

elseif(metodo == 2 & rank(W) == numMVE)
    Ke = acker(A, B, J);

elseif(metodo == 3 & rank(What) == numMVE + 1)
    Ke = acker(Ahat, Bhat, J);

elseif(metodo == 4)
    Ke = lqr(A, B, Q, R);
else
    fprintf('ERROR: No se cumplieron las condiciones.')
end

% Respuesta
if(metodo == 3)
    fprintf('Ke = [%s] \n', num2str(Ke(1:end-1), '%.4f '));
    fprintf('Ki = [%s] \n', num2str(Ke(end), '%.4f '));
else
    fprintf('Se cumple las especificacdiones con rango = %i\n', numMVE)
    fprintf('Ke = [%s] \n', num2str(Ke, '%.4f '));
end
