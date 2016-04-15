clear all; clc;
% Assignment 4 Task 1

dt=0.01;
t=0:dt:2000*dt;
N=length(t);
T=dt*N;
du=1/T;
u=0:du:(N-1)*du;

f=200*du; 
% xs=cos(2*pi*f*t);
xs1 = 1 * cos(2*pi*(200.9*du)*t);
% xs2 = 5 * cos(2*pi*(300*du)*t);
% Xs=fft(xs)/N;           % Do the FFT and scale
Xs1=fft(xs1)/N;
% Xs2=fft(xs2)/N;
% stem(u,abs(Xs));        % show amplitude diagram
% hold on;
stem(u,abs(Xs1));
% hold on;
% stem(u,abs(Xs2));
xlabel('u [Hz]');
ylabel('Amplitude');

legend('A=1,f=200.9*du','A=4,f=100*du', 'A=5,f=300*du')

title('Amplitude Diagram')
set(gcf,'Color','w')