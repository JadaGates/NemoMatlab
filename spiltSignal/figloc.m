% -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
%   This Program is written by

%            JingX

% -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -

function figloc(~)
% figloc(~): Ratio means figure's width / height;
  if nargin < 1
	  FigureRatio = 0.75;
      ratio = 4;
      PositionMar = [0.10, 0.09, 0.85, 0.85];
  else
	  FigureRatio = 9 / 16;
      ratio = 3;
      PositionMar = [0.06, 0.09, 0.89, 0.85];
  end
  
  zoom on;  % 默认打开放大功能
  ScreenSize = get(0,'ScreenSize');
  FigureSize = ScreenSize(ratio) * 0.6 .* [1 FigureRatio];
  
  FigurePosition_left =  0.46 * (ScreenSize(3)  - FigureSize(1));
  FigurePosition_bottom = 0.6 * (ScreenSize(4) - FigureSize(2));
  
  ax = gca;
  set (gcf,'OuterPosition',[FigurePosition_left, FigurePosition_bottom, FigureSize(1), FigureSize(2) * 1.2]);		% 设置figure在屏幕的位置[left bottom width height]
  set(ax,'position', PositionMar,  'FontSize', 13, 'LineWidth', 0.8); % 设置plot在figure的位置[left bottom width height]
  ax.Title.FontSize = 13;
  ax.XLabel.FontSize = 14;
  ax.YLabel.FontSize = 14;
  box  on;
end