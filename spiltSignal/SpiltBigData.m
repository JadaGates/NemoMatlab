% -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
%   This Program is written by

%            JingX
% This program is a batch program, it can spilt
% big bin data into 16 parts and plot ervery part
% and its spectrogram.
% You just input the absolute path of your data
% if path > 1, write them in a cell as shown prefered.
% -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -

clc;
clear all;
close all;

%%- - - Initializing Parameter - - -%%

FolderPath = { 'E:\AUV\SAUVC2018\Sauvc2018CompetitionData'};
[FolderPathLength, ~] = size(FolderPath);    % folder nums
try
    for Counter_i = 1 : FolderPathLength
        
        FolderPathTemp = FolderPath(Counter_i, 1)    %#ok
        [AllFilePath ,FileNameTemp, FileNum] = GetFilesNameInFolders(FolderPathTemp);
        
        for file_i = 1 : FileNum
            fl = AllFilePath(file_i, :);
            fl = deblank(fl);   % delete some unexpected blank
            binFlag = strfind(fl , '.bin');
            if isempty(binFlag)
                continue;
            end
            %%%|| - - -  name the folder  - - - ||%%%
            RegExpression = '.+\\';    % Find every char before "\"
            ReplaceContent = '';
            flName = regexprep(fl, RegExpression, ReplaceContent);
            FolderPathPrefix = strrep(fl, flName, '');
            FolderName = strrep(flName, '.bin', '');
            FileInfo = dir(fl);
            newFolder = [FolderPathPrefix , FolderName];
            mkdir(newFolder);   % Creat a folder that name it with data's name and storage spilted data
            
            spiltNums = 16;
            Channels = 4;
            DeSpilt = 2 * Channels * spiltNums;
            spiltLength = FileInfo.bytes / DeSpilt;     % 2 * Channels * spiltNums
            auvdat = fopen(fl, 'r');
            for counter_j = 1 : 16
                DataTemp = fread(auvdat, [Channles, spiltLength], 'int16')';
                if isempty(DataTemp)
                    errorinfo = ['counter_j = ', num2str(counter_j) , ' is empty'];
                    disp(errorinfo);
                    continue;
                end
                plotsave;
            end
            fclose(auvdat);
        end
    end
    
catch ErrorInfo %捕获到的错误是一个MException对象
    ErrorLogName =[ErrorInfo.stack.name, '_ErrorLog.txt'];
    TimeStamp = datestr(now , 'yyyy/mm/dd HH:MM:SS');
    fileID = fopen(ErrorLogName, 'w+');
    fclose(fileID);
    diary(ErrorLogName);
    disp(ErrorInfo);
    disp(ErrorInfo.cause);
    disp(ErrorInfo.stack);
    diary off;
    ErrorContent = loadErrorContent(ErrorLogName);
    RegExpression = '<.*?>';    % Find every char between <>
    ReplaceContent = '';
    modifyErrorContent = regexprep(ErrorContent, RegExpression, ReplaceContent);
    modifyErrorContent = strrep(modifyErrorContent, '\', '\\');
    fileID = fopen(ErrorLogName, 'w+');
    fprintf(fileID, [TimeStamp,'\r\n']);
    for col_i = 1 : length(modifyErrorContent)
        ErrorContentTemp =strcat(modifyErrorContent(col_i),'\r\n');
        fprintf(fileID, ErrorContentTemp);
    end
    fclose(fileID);
    %     mail2me(ErrorLogName);
end
