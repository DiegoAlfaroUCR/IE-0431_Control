clear
clc

A = [0.6 5; 4 0.2];

RGA = 1/det(A) .* [A(1,1)*A(2,2) -A(1,2)*A(2,1);
                  -A(1,2)*A(2,1) A(1,1)*A(2,2)]

% lambda = 1/( 1-A(1,2)*A(2,1)/(A(1,1)*A(2,2)) );
% indiceInteraccion = [lambda 1-lambda;1-lambda lambda ]

syms s

% P = 0.6*exp(-37*s)/(39*s+1);
% Gd = 0.25*exp(-57*s)/(31*s+1);
% Gff = -Gd/P