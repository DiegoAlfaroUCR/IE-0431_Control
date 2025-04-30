clear
clc

s = tf('s');

a = 21;
b = 0.1*a;

Ti = 1/b;

P = (s+a)/(s*(s+b));
C = 84*(s+1/Ti)/s;

%step(P)
sisotool(P*C)