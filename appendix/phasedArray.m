clear all; clc; 


% number of linear lined up isotropic antennas
% composite main antenna in vertical direction
N = 64;

% frequency in Hz
f = 52e6;

% wavelength in m
c = 299792458; % speed of light in m/s
lambda = f/c; 

% incidence angle in degrees, 0 is zenith
delta = -90:.01:90;



% distance to wavelength ratio (used in AF later on)
% dl_ratio = d / lambda;
dl_ratio = [0.01 0.15 0.25 0.5 0.75 1];





% AF2 = (abs(sin(N * pi * dl_ratio * sind(delta)) ./ sin(pi * dl_ratio * sind(delta))))/N;
% do i take the absolute value because i

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
title('varying distance/wavelength ratio')




% phase shift between antennas
% phi = 2*pi * (d/lambda) * sin(delta);


