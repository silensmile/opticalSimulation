%% 双孔干涉 （P334） 
clear;
%% 参数设定
positionOfSourse = 0;                %光源位置
distanceOfSourseAndPoint = 0.1;      %光源到双孔的距离
distanceOfPointAndScreen = 1;        %双孔到屏幕的距离
distanceOfTwoPoints = 0.00001;       %两个孔间的距离
wavelength = 550 * 10^-9;            %波长
intensityOfWave = 1;                 %光强
[X1,Y1] = meshgrid(-5 : 0.01 : 5 ,-5 : 0.01 : 5 );     %屏上的采样点

%% 计算部分

%% 观察位置一（主轴上）
distanceToPoint1 = sqrt((distanceOfTwoPoints / 2 - positionOfSourse )^2 + distanceOfSourseAndPoint ^2 ) +...
    sqrt((X1 - distanceOfTwoPoints /2).^2 + Y1 .^2 + distanceOfPointAndScreen ^2);
distanceToPoint2 = sqrt((distanceOfTwoPoints / 2 + positionOfSourse )^2 + distanceOfSourseAndPoint ^2 ) +...
    sqrt((X1 + distanceOfTwoPoints /2).^2 + Y1 .^2 + distanceOfPointAndScreen ^2);
opticalPathDifference = abs(distanceToPoint1 - distanceToPoint2 );
intensity = 4 * intensityOfWave * cos(pi * opticalPathDifference / wavelength ).^2;
finalIntensity1 = intensity ./ (4 * intensityOfWave);

%% 观察位置二（两个孔的连线上）
distanceOfPointAndScreen = 1;
[X2 ,Y2] = meshgrid(-5 : 0.01 : 5 ,-5 : 0.01 : 5 );
distanceToPoint1 = sqrt((distanceOfTwoPoints / 2 - positionOfSourse )^2 + distanceOfSourseAndPoint ^2 ) + ...
    sqrt(X2 .^2 + Y2 .^2 + (distanceOfPointAndScreen - distanceOfTwoPoints / 2 ) .^2 );
distanceToPoint2 = sqrt((distanceOfTwoPoints / 2 + positionOfSourse )^2 + distanceOfSourseAndPoint ^2 ) + ...
    sqrt(X2 .^2 + Y2 .^2 + (distanceOfPointAndScreen + distanceOfTwoPoints / 2 ) .^2) ;
opticalPathDifference = abs(distanceToPoint1 - distanceToPoint2 );
intensity = 4 * intensityOfWave * cos(pi * opticalPathDifference / wavelength ).^2;
finalIntensity2 = intensity ./ (4 * intensityOfWave);

%% 绘图部分
subplot(1,2,1)
surf(X1,Y1,finalIntensity1 );
axis equal;
view(2);
shading interp;
colormap(gray);
title('观察位置一（主轴上）');

subplot(1,2,2)
surf(X2,Y2,finalIntensity2 );
axis equal;
view(2);
shading interp;
colormap(gray);
title('观察位置二（双孔的连线上）');

clear;