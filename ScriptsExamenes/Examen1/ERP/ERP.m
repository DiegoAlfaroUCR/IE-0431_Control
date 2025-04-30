s = tf('s');
Ts = 0.1;
Ps = 10 / ((s + 1) * (s + 2));
%Hs = Ps*((1-exp(-s*Ts))/s);
c2d(Ps,Ts,'ZOH')