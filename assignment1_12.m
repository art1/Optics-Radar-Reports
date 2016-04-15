N=2001;
stdev=0.1 %sqrt(Watts)=> Amplitude in Volts over R= 1 Ohm 
noise=randn(1,N)*stdev;
Noise=abs(fft(noise)).^2/N; %Note the scaling %Compute auto correlation 
rn=(convn(noise,fliplr(noise),'same'));
%Compute spectral density
S=fft(rn)/N;
mean(noise)
std(noise).^2
max(rn)
close all
subplot(3,1,1)
plot(noise,'b.-')
xlabel('t [s] ')
ylabel('Noise amplitude [V] ')
subplot(3,1,2)
plot(rn,'r--')
subplot(3,1,3)
plot(abs(S),'r--')
hold
plot(abs(Noise),'b.-')
mean(Noise)
mean(abs(S))