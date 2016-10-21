%% 等厚干涉
clear;
%% 参数设定
distanceOfFlatToScreen = 1;                         %平板到屏幕的距离
refractiveIndexOfAir = 1;
refractiveIndexOfFlat = 1.5;                        %折射率
thicknessOfFlat = 0;                                %平板最薄处厚度
angleOfFlat = 0.005 * pi / 180;                     %平板斜角(位于平板左侧)
wavelength = 550 * 10^-9;                           %波长
intensityOfWave = 1;                                %光强
[X1,Y1] = meshgrid(-0.02 : 0.00002 : 0.02 ,-0.02 : 0.00002 : 0.02 );  %平板上的采样点

%% 计算部分
finalThicknessOfFlat = thicknessOfFlat + (X1 - X1(1,1)) .* tan(angleOfFlat);
opticalPathDifference = 2 * refractiveIndexOfFlat * finalThicknessOfFlat + wavelength / 2;
intensity = 4 * intensityOfWave * cos(pi * opticalPathDifference / wavelength ).^2 ;
finalIntensity = intensity / (400 * intensityOfWave);       %参数400只为绘制三维图时比例好看

%% 绘图部分
surf(X1,Y1,finalIntensity );
axis equal;
view(-10,10);
shading interp;
colormap(jet);

% clear;
