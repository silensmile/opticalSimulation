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
[X1,Y1] = meshgrid(-0.02 : 0.0001 : 0.02 ,-0.02 : 0.0001 : 0.02 );  %平板上的采样点
[X2,Y2] = meshgrid(-0.02 : 0.0001 : 0.02 ,-0.02 : 0.0001 : 0.02 );  %突起点范围
radius = 0.005;         %突起半球的半径
Z2 = sqrt(radius^2 - X2 .^2 - Y2 .^2 );
Z2 = Z2/50000;          %变成椭球
for i=1:length(X2)
    for j=1:length(X2)
        if X2(i,j)^2+Y2(i,j)^2 > radius^2
            X2(i,j)=0;Y2(i,j)=0;Z2(i,j)=0;
        end
    end
end
%% 计算部分
finalThicknessOfFlat = thicknessOfFlat + (X1 - X1(1,1)) .* tan(angleOfFlat) - Z2;   %突起
opticalPathDifference = 2 * refractiveIndexOfFlat * finalThicknessOfFlat + wavelength / 2;
intensity = 4 * intensityOfWave * cos(pi * opticalPathDifference / wavelength ).^2 ;
finalIntensity1 = intensity / (800*  intensityOfWave);       %参数800只为绘制三维图时比例好看
finalThicknessOfFlat = thicknessOfFlat + (X1 - X1(1,1)) .* tan(angleOfFlat) + Z2;   %凹陷
opticalPathDifference = 2 * refractiveIndexOfFlat * finalThicknessOfFlat + wavelength / 2;
intensity = 4 * intensityOfWave * cos(pi * opticalPathDifference / wavelength ).^2 ;
finalIntensity2 = intensity / (800*  intensityOfWave);
%% 绘图部分
subplot(1,2,1);
surf(X1,Y1,finalIntensity1 );
title('半椭球状突起');
axis equal;
view(0,90);
shading interp;
colormap(gray);

subplot(1,2,2);
surf(X1,Y1,finalIntensity2 );
title('半椭球状凹陷');
shading interp;
axis equal;
view(0,90);

