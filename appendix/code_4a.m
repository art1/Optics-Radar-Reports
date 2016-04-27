close all;clear all;clc;
%% Load Data
data{1} = load('TXT_20060228_test1.fca');
data{2} = load('TXT_20060228_test2.fca');

% data files with format
% UT - Altitude - Signal amplitude (linear) - SNR, dB 

% Dataset 1 - 150m resolution, Dataset 2 - 1200m resolution
intervall = [100,12];

%% Parse Test Data & Plot
parsedData = cell(2,1);
n = 1;
while n < 3
    intervallQuantity = cellfun('length',data(1,n))/intervall(n);
    parsedData{1,n} = zeros(1,intervallQuantity);
    k =1;
    while k < intervall(n)+1
        parsedData{1,n}(k,:) = (data{1,n}(k:intervall(n):cellfun('length',data(1,n)),4))';
        k = k+1;
    end
    
    subplot(1,2,n);
    pcolor(parsedData{1,n})
    colormap jet;
    shading flat;
    grid on;
    xlabel('Universal time (hours)');
    xlabel(colorbar,'SNR (dB)');
    ylabel('Altitude (km)');
    set(gca,'XTickLabel',[data{n}(1),data{n}(cellfun('length',data(1,n)))]);
       
    n = n+1;
end