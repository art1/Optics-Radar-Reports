clear all; clc;
%Assignment 3 Task 1

dt=0.01;
t=0:dt:2000*dt;
N=length(t);
T=dt*N;
du=1/T;
u=0:du:(N-1)*du;

%--> this shit is used for assignment 4!

%Sampling interval 0.01 s=> time
%resolution
%Prepare a scale for time axis
%Number of samples
%Time duration of sampled and truncated
%function [s]
%Frequency resolution [Hz]
%Prepare a scale for frequency axis