clear all; clc;
d=[1];   % N=1
M = 50;
D=fft(d,M);
plot(u2,abs(D));

dt=0.2;N=200;
t=-(N/2)*dt:dt:N/2*dt;
T=N*dt;
du=1/T;
u=0:du:(N-1)*du;
cut=[1:N/2+1];
xs=sin(pi*t)./pi./t;
%sin(x)/x is not defined for x=0, but will be 1 for lim x?0
xs(N/2+1)=1;