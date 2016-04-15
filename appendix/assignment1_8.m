
clear all; clc;
dt=1;
% t=0:dt:2000*dt;
t=0:1:5;
N=length(t);
T=dt*N;
% T=0:1:5;

du=1/T;
u=(-N/2)*du:du:(N/2 -1)*du;
f=200*du; 

% xs=cos(2*pi*f*t);
xs=[1 1 1 0 0 0];
Xs=fftshift(fft(xs)/N);           % Do the FFT and scale

M=50;
du2=1/(M*dt);
%Note: scaling with the original number of elements 
Xs2=fftshift(fft(xs,M)/N); %Zeropads to M elements 
u2=(-M/2)*du2:du2:(M/2 -1)*du2;
% stem(u,abs(Xs),'r', 'filled');
% hold on
% stem(u2,abs(Xs2),'k');
% xlabel('u [Hz]');
% ylabel('Amplitude');
% title('Amplitude Diagram')


d=[1];   % N=1
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
