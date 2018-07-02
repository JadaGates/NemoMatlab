spiltName = [newFolder, '\' , num2str(counter_j), '.mat'];
save(spiltName, 'DataTemp');
figTitle = [FileInfo.name, '\_', num2str(counter_j)];
imgPath = [newFolder, '\' , num2str(counter_j), '.png'];
figure
figloc;
for col_i = 1 : 4
    plot(DataTemp(: , col_i) + (col_i - 1) * 40000);
    hold on;
end
hold off;
title(figTitle);
saveas(gcf, imgPath);
close gcf
figTitle = [FileInfo.name, '\_', num2str(counter_j), '\_Spec'];
imgPath = [newFolder, '\' , num2str(counter_j), '_Spec.png'];
figure
figloc;
spectrogram(DataTemp(: , 1), 1024 ,512, 1024 , 200e3);
ax = gca;
gca.FontSize = 15;
title(figTitle);
saveas(gcf, imgPath);
close gcf
clear DataTemp;