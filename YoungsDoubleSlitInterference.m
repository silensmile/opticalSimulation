tic;
%% 杨氏双缝干涉 
clear;
%% 参数设定
positionOfSourse = 0;               %光源位置
distanceOfSourseAndSlit = 0.1;      %光源到狭缝的距离
distanceOfSlitAndScreen = 1;        %狭缝到屏幕的距离
distanceOfTwoSlits = 0.001;         %两个狭缝间的距离
wavelength = 550 * 10^-9;           %波长
intensityOfWave = 1;                %光强
y = (-0.002 : 0.00001 : 0.002);    %屏上的采样点

%% 计算部分
%% 光源在中间
distanceToSlit1 = sqrt((distanceOfTwoSlits/2 - positionOfSourse)^2 + distanceOfSourseAndSlit^2 ) +...
    sqrt((y - distanceOfTwoSlits / 2).^2 + distanceOfSlitAndScreen^2);
distanceToSlit2 = sqrt((distanceOfTwoSlits/2 + positionOfSourse)^2 + distanceOfSourseAndSlit^2 ) +...
    sqrt((y + distanceOfTwoSlits / 2).^2 + distanceOfSlitAndScreen^2);
opticalPathDifference = abs(distanceToSlit1 - distanceToSlit2);
intensity = 4 * intensityOfWave * cos(pi * opticalPathDifference / wavelength).^2;
finalIntensity1 = intensity ./ (4 * intensityOfWave);

%% 光源向上移动delta
delta = 0.00001;
positionOfSourse = positionOfSourse + delta;
distanceToSlit1 = sqrt((distanceOfTwoSlits/2 - positionOfSourse)^2 + distanceOfSourseAndSlit^2 ) +...
    sqrt((y - distanceOfTwoSlits / 2).^2 + distanceOfSlitAndScreen^2);
distanceToSlit2 = sqrt((distanceOfTwoSlits/2 + positionOfSourse)^2 + distanceOfSourseAndSlit^2 ) +...
    sqrt((y + distanceOfTwoSlits / 2).^2 + distanceOfSlitAndScreen^2);
opticalPathDifference = abs(distanceToSlit1 - distanceToSlit2);
intensity = 4 * intensityOfWave * cos(pi * opticalPathDifference / wavelength).^2;
finalIntensity2 = intensity ./ (4 * intensityOfWave);

%% 狭缝变窄distanceOfTwoSlits = 0.0005（光源仍在中心位置）
positionOfSourse = 0;
distanceOfTwoSlits = 0.0005;
distanceToSlit1 = sqrt((distanceOfTwoSlits/2 - positionOfSourse)^2 + distanceOfSourseAndSlit^2 ) +...
    sqrt((y - distanceOfTwoSlits / 2).^2 + distanceOfSlitAndScreen^2);
distanceToSlit2 = sqrt((distanceOfTwoSlits/2 + positionOfSourse)^2 + distanceOfSourseAndSlit^2 ) +...
    sqrt((y + distanceOfTwoSlits / 2).^2 + distanceOfSlitAndScreen^2);
opticalPathDifference = abs(distanceToSlit1 - distanceToSlit2);
intensity = 4 * intensityOfWave * cos(pi * opticalPathDifference / wavelength).^2;
finalIntensity3 = intensity ./ (4 * intensityOfWave);

%% 波长变小
distanceOfTwoSlits = 0.001; 
wavelength = 400 * 10^-9;
distanceToSlit1 = sqrt((distanceOfTwoSlits/2 - positionOfSourse)^2 + distanceOfSourseAndSlit^2 ) +...
    sqrt((y - distanceOfTwoSlits / 2).^2 + distanceOfSlitAndScreen^2);
distanceToSlit2 = sqrt((distanceOfTwoSlits/2 + positionOfSourse)^2 + distanceOfSourseAndSlit^2 ) +...
    sqrt((y + distanceOfTwoSlits / 2).^2 + distanceOfSlitAndScreen^2);
opticalPathDifference = abs(distanceToSlit1 - distanceToSlit2);
intensity = 4 * intensityOfWave * cos(pi * opticalPathDifference / wavelength).^2;
finalIntensity4 = intensity ./ (4 * intensityOfWave);

%% 绘图部分
%% 一维
subplot(2,2,1);
plot(y,finalIntensity1,'k');
title('光源上移');xlabel('屏上位置');ylabel('光强');
hold on;
plot(y,finalIntensity2,'b');
legend('原始光线','光源上移后');

subplot(2,2,2);
plot(y,finalIntensity1,'k');
title('狭缝变窄');xlabel('屏上位置');ylabel('光强');
hold on;
plot(y,finalIntensity3,'r');
legend('原始光线','狭缝变窄后');

subplot(2,2,3);
plot(y,finalIntensity1,'k');
title('波长变小');xlabel('屏上位置');ylabel('光强');
hold on;
plot(y,finalIntensity4,'g');
legend('原始光线','波长变小后');

%% 二维
Y = ones(length(y) , 1);
Z = Y * finalIntensity1;
subplot(2,2,4);
surf(y,y,Z);
view(2);
shading interp;
colormap(hot);
title('原始光线干涉在屏上的空间分布(可变换视角)');xlabel('屏上x');ylabel('屏上y');zlabel('强度');

toc;