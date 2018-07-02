function [FilePath, FilesName,FilesNum] = GetFilesNameInFolders(FolderPath)
% Get all files' name in the var Folder and then return Files' Path
% Files' Name and Files' Number in the Folder;
% IMPORTANT: if the length of files' names are not the same , you
% must use function *deblank* to delete the blank after the shorter
% files' name.

while iscell(FolderPath)
    FolderPath = cell2mat(FolderPath);
end

FolderPathLength = length(FolderPath);
LastChar = FolderPath(1 , FolderPathLength);

if LastChar ~= '\'
    Flag = '\';
    Adder = 1;
else
    Flag = [];
    Adder = 0;
end

FilesinFolder = dir(FolderPath);
[FilesinFolderNum, ~] = size(FilesinFolder);

for i=3 : FilesinFolderNum
    FileNameTemp = FilesinFolder(i , 1).name;
    [~, FileNameLength] = size(FileNameTemp);
    FilesName(i - 2 , 1 : FileNameLength) = FileNameTemp;
    FilePath(i - 2, 1 : (FolderPathLength + FileNameLength+Adder)) = strcat(FolderPath , Flag , FileNameTemp);
end
[FilesNum, ~] = size(FilesName);
end