
r = [8.21 3.39 9.04 9.83 4.61 1.29];
y = [6.58 3.59 8.33 2.69 5.94 3.21];
t = [0.5 0.55 0.6 0.65 0.7 0.75];

Kp = 5.6;
C = Kp;

e = r-y;
Ts = t(2) - t(1);
u = C.*e;

IAE  = Ts*sum(abs(e))
ITAE = Ts*sum(abs(e).*t)
ISE  = Ts*sum(power(e, 2))
ITSE = Ts*sum(power(e, 2).*t)
TVu  = sum(abs(u(2:end) - u(1:end-1)))