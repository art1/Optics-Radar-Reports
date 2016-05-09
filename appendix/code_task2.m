close all;clear all;clc;
%% Load Data
data{1} = load('ESRAD_data_codes/TXT_20060228_test3.txt');
data{2} = load('ESRAD_data_codes/TXT_20060228_test4.txt');
data{3} = load('ESRAD_data_codes/TXT_20060228_test5.txt');

% data files with format
% UT - Altitude - Signal amplitude (linear) - SNR, dB 
% Dataset 1 intervall 90, Dataset 2 intervall 85, Dataset 3 intervall 100
intervall = [90,85,100];

%% Parse Test Data & Plot
parsedData = cell(1,3);

cMax = 0;
cMin = 0;

for n = 1 : length(data)
    cMin = min([data{n}(:,4);cMin])
    cMax = max([data{n}(:,4);cMax])
end

for n = 1:length(data)
    intervallQuantity = cellfun('length',data(1,n))/intervall(n);
    parsedData{1,n} = zeros(1,intervallQuantity);
    k =1;
    while k < intervall(n)+1
        parsedData{1,n}(k,:) = (data{1,n}(k:intervall(n):cellfun('length',data(1,n)),4))';
        k = k+1;
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

