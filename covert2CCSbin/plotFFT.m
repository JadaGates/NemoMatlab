% -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
%   This Program is written by

%            JingX

% -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -

clc;
clear all;
close all;

%%- - - Initializing Parameter - - -%%
fl = 'matlab.mat';

if(strfind(fl, 'bin'))
    FileFlag = 1;
else
    FileFlag = 0;
end

if FileFlag
auvdat = fopen(fl,'r');
data_int16 = fread(auvdat, [4, 1024 * 1400], 'int16')';
fclose(auvdat);
end

if FileFlag == 0
    data_int16 = importdata(fl);
end

signal = data_int16;
DataClipStart = 1;
DataClipEnd = length(data_int16);
DataLength = DataClipEnd - DataClipStart;
DataField = data_int16(DataClipStart : DataClipEnd , 1);

figure
f = 200e3 * (0: DataLength)/DataLength;
FFTdat = fft(DataField);
plot(f , abs(FFTdat));
axis([0 f(length(f)/2) 0 max(abs(FFTdat))]);
xlabel('Frenquency /Hz');title('AUV DataClip FFT');
% imgName = ['S', num2str(DataClipStart / 1e6), 'e', num2str(DataClipEnd / 1e6) '_FFT.png'];
% saveas(gcf, imgName);

% figure
% figloc;
% spectrogram(DataField, 1024 ,512, 1024 , 200e3);
%  imgName = ['S', num2str(DataClipStart / 1e6), 'e', num2str(DataClipEnd / 1e6) '_Spec.png'];
% saveas(gcf, imgName);