%ECG thresholding and diagnosis
clear; clc;

%OG Graph
load('208m (2).mat'); 
figure(1)
subplot(2,1,1); 
plot(val); 
title('ECG Unfiltered');
xlabel('Time (ms)');
ylabel('Voltage (uV)');

%SmoothData Func Graph
val2 = smoothdata(val);

figure(2)
[~,Rwaves] = findpeaks(val2,'MinPeakProminence',220);
[~,Swaves] = findpeaks(-val2,'MinPeakProminence',220);
[~,Qwaves] = findpeaks(-val2,'MinPeakDistance',85);
combined_QRwaves = sort([Qwaves Rwaves]);
locsR = ismember(combined_QRwaves,Rwaves);
new_Qwaves = [];
for i=2:length(locsR)
    if locsR(i) == 1
        new_Qwaves = [new_Qwaves combined_QRwaves(i-1)];
    end
end

subplot(2,1,2);
plot(val2);
hold on
plot(Rwaves,val2(Rwaves),'rv','MarkerFaceColor','r')
plot(Swaves,val2(Swaves),'rs','MarkerFaceColor','b')
plot(new_Qwaves,val2(new_Qwaves),'ro','MarkerFaceColor','g')
hold off
title('ECG Filtered (Smooth Data Func)');
xlabel('Time (ms)');
ylabel('Voltage (uV)');
legend('ECG SIgnal', 'R waves', 'S waves', 'Q waves');