clear
clc

% s = tf('s');
syms Kp Td Ti K s

% Valores a definir;
%P = 2*(s+2)/(s^2 +2*s +2);

a = 21;
b = 0.1*a;

Ti = 1/b;

P = (s+a)/(s*(s+b));

C = Kp*(s+1/Ti)/s;
Mpn = 0;
ta2 = 0.8;

% Polinomio buscado, opcional
chi = sqrt((log(Mpn)^2)/(pi^2 + log(Mpn)^2));
wn = 4/(chi*ta2);
pcDeseado = s^2 + 2*chi*wn*s + wn^2;

% Polinomio característico
[nume, den] = numden(1+C*P);
pc = collect(nume, s);
coeficientes = coeffs(pc, s, "All");
pc_normalizado = collect(pc / coeficientes(1));
fprintf('pc = %s \n', pc_normalizado)

% Regla 8
k(s) = solve(pc, Kp);
Dko = diff(k, s);
o_array = solve(Dko == 0, s);
o_cruce = double(o_array(1));
fprintf('o_cruce = %f \n', o_cruce)

% Encontrar Kp
pc_poloDoble = (s-o_cruce)^2;
coeficientes_poloDoble = coeffs(pc_poloDoble, s, "All");
coeficientes_pc = coeffs(pc_normalizado, s, "All");
Kp = solve(coeficientes_poloDoble(2) == coeficientes_pc(2), Kp);
fprintf('Kp = %f \n', Kp)


% Estadisticas
zeta_doble = 1;
L = P*Kp;

[num_tf, den_tf] = numden(P);
P_tf = tf(sym2poly(num_tf), sym2poly(den_tf));
Myr = feedback(P_tf*sym2poly(Kp), 1);

% pole(Myr)
ta2 = 5.83 * -1/o_cruce;
Mpn = 100*exp(-(zeta_doble*pi)/sqrt(1-zeta_doble^2));
epr0 = limit(1/(1+L), s, 0) * 100;

fprintf('Ta2 = %f \n', ta2)
fprintf('Mpn = %f \n', Mpn)
fprintf('epr0 = %f \n', epr0)

% Verificación
s = tf('s');
%sisotool(P_tf, sym2poly(Kp))
