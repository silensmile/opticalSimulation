%% 三孔干涉
clear;

%% 参数设定
positionOfSourse = 0;                %光源位置
distanceOfSourseAndPoint = 0.1;      %光源到三孔平面的距离
distanceOfPointAndScreen = 1;        %三孔到屏幕的距离
radius = 0.00001;                    %三孔到原点的距离   
point1x = 0; point1y = radius;                                            %第一个孔的坐标
point2x = radius * cos(7*pi/6); point2y = radius * sin(7*pi/6);           %第二个孔的坐标 
point3x = radius * cos(11*pi/6); point3y = radius * sin(11*pi/6);         %第三个孔的坐标 
wavelength = 550 * 10^-9;            %波长
amplitude = 1;                       %振幅   
intensityOfWave = 1;                 %光强
[X1,Y1] = meshgrid(0 : 0.005 : 2.5 ,0 : 0.005 : 2.5 );     %屏上的采样点
[X2,Y2] = meshgrid(-2.5 : 0.005 : 0 , 0 : 0.005 : 2.5 );
[X3,Y3] = meshgrid(-2.5 : 0.005 : 0 , -2.5 : 0.005 : 0 );
[X4,Y4] = meshgrid(0 : 0.005 : 2.5 , -2.5 : 0.005 : 0 );
%% 计算部分
% 由于计算机硬件原因 采取分块计算
%% 一象限
% 计算距离
distanceToPoint1 = sqrt(point1x ^2 + point1y ^2 + distanceOfSourseAndPoint ^2) + ...
    sqrt((X1 - point1x ).^2 + (Y1 - point1y ).^2 + distanceOfPointAndScreen ^2);
distanceToPoint2 = sqrt(point2x ^2 + point2y ^2 + distanceOfSourseAndPoint ^2) + ...
    sqrt((X1 - point2x ).^2 + (Y1 - point2y ).^2 + distanceOfPointAndScreen ^2);
distanceToPoint3 = sqrt(point3x ^2 + point3y ^2 + distanceOfSourseAndPoint ^2) + ...
    sqrt((X1 - point3x ).^2 + (Y1 - point3y ).^2 + distanceOfPointAndScreen ^2);
% 计算强度
finalIntensity1 = (amplitude *cos( 2 * pi * distanceToPoint1 / wavelength ) + ...
    amplitude *cos( 2 * pi * distanceToPoint2 / wavelength ) + ...
    amplitude *cos( 2 * pi * distanceToPoint3 / wavelength )).^2+...
    (amplitude *sin( 2 * pi * distanceToPoint1 / wavelength ) + ...
    amplitude *sin( 2 * pi * distanceToPoint2 / wavelength ) + ...
    amplitude *sin( 2 * pi * distanceToPoint3 / wavelength )).^2;


%% 二象限
% 计算距离
distanceToPoint1 = sqrt(point1x ^2 + point1y ^2 + distanceOfSourseAndPoint ^2) + ...
    sqrt((X2 - point1x ).^2 + (Y2 - point1y ).^2 + distanceOfPointAndScreen ^2);
distanceToPoint2 = sqrt(point2x ^2 + point2y ^2 + distanceOfSourseAndPoint ^2) + ...
    sqrt((X2 - point2x ).^2 + (Y2 - point2y ).^2 + distanceOfPointAndScreen ^2);
distanceToPoint3 = sqrt(point3x ^2 + point3y ^2 + distanceOfSourseAndPoint ^2) + ...
    sqrt((X2 - point3x ).^2 + (Y2 - point3y ).^2 + distanceOfPointAndScreen ^2);
% 计算强度
finalIntensity2 = (amplitude *cos( 2 * pi * distanceToPoint1 / wavelength ) + ...
    amplitude *cos( 2 * pi * distanceToPoint2 / wavelength ) + ...
    amplitude *cos( 2 * pi * distanceToPoint3 / wavelength )).^2+...
    (amplitude *sin( 2 * pi * distanceToPoint1 / wavelength ) + ...
    amplitude *sin( 2 * pi * distanceToPoint2 / wavelength ) + ...
    amplitude *sin( 2 * pi * distanceToPoint3 / wavelength )).^2;

%% 三象限
% 计算距离
distanceToPoint1 = sqrt(point1x ^2 + point1y ^2 + distanceOfSourseAndPoint ^2) + ...
    sqrt((X3 - point1x ).^2 + (Y3 - point1y ).^2 + distanceOfPointAndScreen ^2);
distanceToPoint2 = sqrt(point2x ^2 + point2y ^2 + distanceOfSourseAndPoint ^2) + ...
    sqrt((X3 - point2x ).^2 + (Y3 - point2y ).^2 + distanceOfPointAndScreen ^2);
distanceToPoint3 = sqrt(point3x ^2 + point3y ^2 + distanceOfSourseAndPoint ^2) + ...
    sqrt((X3 - point3x ).^2 + (Y3 - point3y ).^2 + distanceOfPointAndScreen ^2);
% 计算强度
finalIntensity3 = (amplitude *cos( 2 * pi * distanceToPoint1 / wavelength ) + ...
    amplitude *cos( 2 * pi * distanceToPoint2 / wavelength ) + ...
    amplitude *cos( 2 * pi * distanceToPoint3 / wavelength )).^2+...
    (amplitude *sin( 2 * pi * distanceToPoint1 / wavelength ) + ...
    amplitude *sin( 2 * pi * distanceToPoint2 / wavelength ) + ...
    amplitude *sin( 2 * pi * distanceToPoint3 / wavelength )).^2;

%% 四象限
% 计算距离
distanceToPoint1 = sqrt(point1x ^2 + point1y ^2 + distanceOfSourseAndPoint ^2) + ...
    sqrt((X4 - point1x ).^2 + (Y4 - point1y ).^2 + distanceOfPointAndScreen ^2);
distanceToPoint2 = sqrt(point2x ^2 + point2y ^2 + distanceOfSourseAndPoint ^2) + ...
    sqrt((X4 - point2x ).^2 + (Y4 - point2y ).^2 + distanceOfPointAndScreen ^2);
distanceToPoint3 = sqrt(point3x ^2 + point3y ^2 + distanceOfSourseAndPoint ^2) + ...
    sqrt((X4 - point3x ).^2 + (Y4 - point3y ).^2 + distanceOfPointAndScreen ^2);
% 计算强度
finalIntensity4 = (amplitude *cos( 2 * pi * distanceToPoint1 / wavelength ) + ...
    amplitude *cos( 2 * pi * distanceToPoint2 / wavelength ) + ...
    amplitude *cos( 2 * pi * distanceToPoint3 / wavelength )).^2+...
    (amplitude *sin( 2 * pi * distanceToPoint1 / wavelength ) + ...
    amplitude *sin( 2 * pi * distanceToPoint2 / wavelength ) + ...
    amplitude *sin( 2 * pi * distanceToPoint3 / wavelength )).^2;
%% 绘图
surf(X1,Y1,finalIntensity1 );
hold on;
surf(X2,Y2,finalIntensity2 );
surf(X3,Y3,finalIntensity3 );
surf(X4,Y4,finalIntensity4 );
axis equal;
view(0,90);
shading interp;
colormap(gray);
title('三孔圆周均匀分布干涉');
hold off;

clear;