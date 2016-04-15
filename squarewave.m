close all                              % clear all figures

N = 11;                            %  N must be odd
f = 0.5;                           % Fundamental frequency (Hz)
wo = 2*pi*f;                        % Fundamental frequency (rad/s)
DC = 0;                            % DC bias
A=1;                                %Amplitude
t = -3:0.01:3;                     % Time scale

x = DC*ones(size(t));             % Set DC level
figure(1)
subplot(2,1,1)
set(gcf,'Color','w')
for n = 1:2:N,                     % n is series index 
    x = x + A*4/(n*wo)*sin(n*wo*t);  % Fourier series 
    plot(t,x,'k');
    xlabel('t (seconds)')
    ylabel('y(t)');
    title(['Square wave Fourier Series, n= ',...
        num2str(n)]);
    pause
end


plot([-3 -2 -2 -1 -1  0 0 1  1  2 2 3],...    % Square wave
     [-1 -1  1  1 -1 -1 1 1 -1 -1 1 1]*A+DC, 'r');
hold on;
plot(t,x);
xlabel('t [s]')
ylabel('x(t)');
title(['Square wave Fourier series, N = ',...
         num2str(n)]);
hold

% Amplitude spectrum
subplot(2,1,2)
stem(0,DC);                        % plot DC at nwo = 0

hold
for n = 1:2:N,                    % loop over series index n
  stem(n*wo/2/pi,A*4/(n*wo),'k')              % plot  Fourier Series Coefficient |cn| vs nf
end
for n = 2:2:N-1,                % loop over even series index n 
% Fourier Series Coefficient for even wo is zero
  stem(n*wo/2/pi,0,'k');      
end
stem(0,DC,'k');  %DC-level at f=0

xlabel('f [Hz]')
ylabel('|cn|(f)')
title(['Amplitude Spectrum with N = ',num2str(N)]);

