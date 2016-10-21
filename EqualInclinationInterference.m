%% 等倾干涉
clear;
%% 参数设定
focalLengthOfLens = 1;                              %透镜焦距
distanceOfFlatToScreen = 2 * focalLengthOfLens;     %平板到屏幕的距离
refractiveIndexOfAir = 1;
refractiveIndexOfFlat = 1.5;                        %折射率
thicknessOfFlat = 0.01;                             %平板厚度
wavelength = 550 * 10^-9;                           %波长
intensityOfWave = 1;                                %光强
[X1,Y1] = meshgrid(-0.02 : 0.0002 : 0.02 ,-0.02 : 0.0002 : 0.02 );  %屏上的采样点

%% 计算部分
theta1 = atan( sqrt(X1 .^2 + Y1 .^2) / focalLengthOfLens);
theta2 = asin( sin(theta1) * refractiveIndexOfAir / refractiveIndexOfFlat);
opticalPathDifference = 2 * refractiveIndexOfFlat * thicknessOfFlat *cos(theta2) + wavelength / 2;
intensity = 4 * intensityOfWave * cos(pi * opticalPathDifference / wavelength ).^2;
finalIntensity = intensity / (400 * intensityOfWave);    %参数400只为绘制三维图时比例好看

%% 绘图部分
surf(X1,Y1,finalIntensity );
axis equal;
view(0,90);
shading interp;
colormap(gray);

%clear;
