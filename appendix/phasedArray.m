clear all; clc; 


% number of linear lined up isotropic antennas
% composite main antenna in vertical direction
N = 64;

% frequency in Hz
f = 52e6;

% wavelength in m
c = 299792458; % speed of light in m/s
lambda = c/f; 

% scanning angle in degrees, 0 is zenith
delta = -90:.01:90;


%% Varying Antenna Spacing
% distance to wavelength ratio (used in AF later on)
dl_ratio = [0.01 0.15 0.25 0.5 0.75 1];

figure
for i=1:6
    % calculate distance from distance/wavelength ratio (each antenna is fed uniformly)
    d(i) = dl_ratio(i) * lambda;
    % Antenna Factor, derivated on whiteboard
    AF = (abs(sin(N * pi * d(i) * sind(delta) / lambda) ./ sin(pi * d(i) * sind(delta) / lambda)))/N;
    subplot(2,3,i)
    plot(delta,AF)
    axis([-90 90 0 1])
    xlabel(sprintf('incidence angle, ratio %2.2f',dl_ratio(i)))
    ylabel('normalized Array Factor')
end

% max spacing to prevent grating lobes
dX = lambda / (1+sind(90));


%% Number of Antenna Elements
idealRatio = 0.5;
N = [1 6 18 30 42 51 64 96 128];

figure
for i=1:9
    % Antenna Factor, derivated on whiteboard
    AF = (abs(sin(N(i) * pi * idealRatio * sind(delta)) ./ sin(pi * idealRatio * sind(delta)))/N(i));
    subplot(3,3,i)
    plot(delta,AF)
%     axis([-90 90 0 1])
    xlabel(sprintf('incidence angle, %2.0f Elements ',N(i)))
    ylabel('normalized Array Factor')
end


%% Spatial Weighting
% Antenna Elements
N = 64;
% ideal spacing
ideal_d = idealRatio * lambda;
% Using inverse triangular function to increase distance between elements
for i=(N/2):N
    m = 2/N;
    weight = m * (i - N/2) + 1;
    d(i) = weight * ideal_d;
    d(N - i+1) = d(i);
end

% calculating complete radiation pattern, isotropic radiation
E0 = 1;
E = 0;
phase_n = 0;    % zenith angle pointing
for i=1:N
    E = E + E0*exp(complex(0, (2*pi*d(i) * (i-1) * sind(delta)/lambda + phase_n)));
end

figure
subplot(1,2,1)
plot(delta,abs(E)/N);
axis([-90 90 0 1])
xlabel('incidence angle, 64 Elements, zenith pointing');
ylabel('normalized radiation pattern');
subplot(1,2,2)
antennaNum = [1:1:64];
plot(antennaNum,d);
grid on;
axis([0 N ideal_d max(d)])
xlabel('Antenna Element Number');
ylabel('distance to the next array Element [m]');

