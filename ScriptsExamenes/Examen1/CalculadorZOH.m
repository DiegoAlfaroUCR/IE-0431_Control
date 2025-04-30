clear
clc

s = tf('s');


k= 3.3;
a = 4.6;
T = 0.18;

H = (k*s^2)/(s+a)^2;


Hz = c2d(H,T,'ZOH');
polos = pole(Hz)
cero = zero(Hz)
ganancia = evalfr(Hz, 0)