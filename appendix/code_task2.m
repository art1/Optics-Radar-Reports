close all;clear all;clc;
%% Load Data
data{1} = load('ESRAD_data_codes/TXT_20060228_test3.txt');
data{2} = load('ESRAD_data_codes/TXT_20060228_test4.txt');
data{3} = load('ESRAD_data_codes/TXT_20060228_test5.txt');

% data files with format
% UT - Altitude - Signal amplitude (linear) - SNR, dB 

% Dataset 1 intervall 90, Dataset 2 intervall 85
intervall = [90,85,100];

%% Parse Test Data & Plot
parsedData = cell(2,1);
n = 1;
while n < 4
    intervallQuantity = cellfun('length',data(1,n))/intervall(n);
    parsedData{1,n} = zeros(1,intervallQuantity);
    k =1;
    while k < intervall(n)+1
        parsedData{1,n}(k,:) = (data{1,n}(k:intervall(n):cellfun('length',data(1,n)),4))';
        k = k+1;
    end
    
    subplot(1,3,n);
    pcolor(data{n}(1:(intervall(n)):(cellfun('length',data(1,n))),1),data{n}(1:intervall(n),2),parsedData{1,n})
    colormap jet;
    shading flat;
    grid on;
    labelx = sprintf('Universal time (hours),\n Test %d',n+2);
    xlabel(labelx);
    xlabel(colorbar,'SNR (dB)');
    ylabel('Altitude (km)');
    
    n = n+1;
end