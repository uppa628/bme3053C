# bme3053C

clear;
clc;

%OG Graph

load('208m (2).mat');
subplot(4,1,1);
plot(val);
title('ECG Unfiltered');

%SmoothData Func Graph

val2 = smoothdata(val);
subplot(4,1,2);
plot(val2);
title('ECG Filtered (Smoothdata Func)');

% Moving Average Filter Graph

val3 = zeros(1,3600);
for ii=1:1:3600
    if ii>1 && ii<3600
        y = (val(ii)+val(ii-1)+val(ii+1))/3;
    elseif ii==1
        y = (val(ii)+val(ii+1))/2;
    elseif ii==3600
        y = (val(ii)+val(ii-1))/2;
    end
    val3(ii) = y;
end
subplot(4,1,3);
plot(val3);
title('ECG Filtered (Moving Average Filter)');

%Savitzky-Golay Filter Graph

val4 = zeros(1,3600);
for ii=1:1:3600
    if ii>2 && ii<3599
       
