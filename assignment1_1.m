clc;
clear all;
% Assignment 1
% 1 Preparations
x = -pi:0.01:pi;
%A harmonic function with amplitude A and frequency f and phase zero (cosine)
%y = cos(x);
% A harmonic function with amplitude A and frequency f and phase ?/2 (sine)
y = sin(x);
z = fft(y);
plot(x,z,x,y)