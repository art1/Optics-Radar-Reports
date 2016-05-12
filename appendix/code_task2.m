close all;clear all;clc;
%% Load Data
data{1} = load('ESRAD_data_codes/TXT_20060228_test3.txt');
data{2} = load('ESRAD_data_codes/TXT_20060228_test4.txt');
data{3} = load('ESRAD_data_codes/TXT_20060228_test5.txt');

% data files with format
% UT - Altitude - Signal amplitude - SNR - zonal - meridional - vertical 
% Dataset 1 90, Dataset 2 85, Dataset 3 100
intervall = [90,85,100];
windDirections = 3;     % number of windDirections
windDataTest = 2;       % which test data is used

%% Parse Test Data & Plot
parsedData = cell(1,6); % first three SNR data; rest wind data for test 4
cMax = 0;
cMin = 0;
for n = 1 : length(data)
    cMin = min([data{n}(:,4);cMin])
    cMax = max([data{n}(:,4);cMax])
end

for n = 1:length(data)
    intervallQuantity = cellfun('length',data(1,n))/intervall(n);
    parsedData{1,n} = zeros(1,intervallQuantity);
    
    for k = 1:intervall(n)
        parsedData{1,n}(k,:) = (data{1,n}(k:intervall(n):cellfun('length',data(1,n)),4))';
    end
   
    subplot(1,3,n);
    pcolor(data{n}(1:(intervall(n)):(cellfun('length',data(1,n))),1),data{n}(1:intervall(n),2),parsedData{1,n})
    caxis([cMin,cMax]);
    colormap jet;
    shading flat;
    grid on;
    xlabel(sprintf('Universal time (hours), Test %d',n+2));

end

p = get(subplot(131),'Position');
xlabel(colorbar('southoutside','Position',[p(1) 0.95 0.68 0.02]),'SNR (dB)','Position',[29 -.2 0])
set(get(subplot(131),'YLabel'),'String','Altitude (km)');

%% Parse Wind data for test4
f = 3; % data already in parsedDate
len = cellfun('length',data(1,windDataTest));
w = windDataTest;

figure;
for n = 1:windDirections
    intervallQuantity = len / intervall(w);
    parsedData{1,n+f} = zeros(1,intervallQuantity);

    for k = 1:intervall(w)
       parsedData{1,n+f}(k,:) = (data{1,w}(k:intervall(w):len,n+4))';
    end
    
    subplot(1,3,n);
    pcolor(data{w}(1:(intervall(w)):(len),1),data{w}(1:intervall(w),2),parsedData{1,n+f})
    colormap jet;
    shading flat;
    grid on;
    xlabel(sprintf('Universal time (hours), (%d)',n));
end

p = get(subplot(131),'Position');
xlabel(colorbar('southoutside','Position',[p(1) 0.95 0.6 0.02]),'Wind Speed (m/s)','Position',[20 -.2 0])
set(get(subplot(131),'YLabel'),'String','Altitude (km)');

