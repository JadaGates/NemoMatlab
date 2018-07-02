% -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -
%   This Program is written by

%            JingX

% -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -  -

function figureLocation = figloc(ratio)
% figloc(ratio): Ratio means figure size relative to you actual screen size;
  if nargin<1
	  FigureScreenRatio = 0.6;
  else
	  FigureScreenRatio = ratio;
  end
  zoom on;  % 默认打开放大功能
  ScreenSize = get(0,'ScreenSize');
  FigureSize = ScreenSize(3 : end) * FigureScreenRatio;
  FigurePosition_left =  0.5 * (ScreenSize(3)  - FigureSize(1));
  FigurePosition_bottom = 0.6 * (ScreenSize(4) - FigureSize(2));
  ax = gca;
  set (gcf,'OuterPosition',[FigurePosition_left, FigurePosition_bottom, FigureSize(1), FigureSize(2) * 1.2]);		% 设置figure在屏幕的位置[left bottom width height]
  set(ax,'position',[0.06,0.09,0.89,0.85]); % 设置plot在figure的位置[left bottom width height]
  box  on;
end