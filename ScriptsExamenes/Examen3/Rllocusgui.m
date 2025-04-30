s = tf('s');

% Se escribe L sin el K variable.
P = 2*(s+2)/(s^2 +2*s +2) * 1/s;

RLocusGui(P);

Myr = feedback(P, 1);
step(Myr)