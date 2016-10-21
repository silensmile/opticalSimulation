%% 三孔干涉
clear;

%% 参数设定
positionOfSourse = 0;                %光源位置
distanceOfSourseAndPoint = 0.1;      %光源到三孔平面的距离
distanceOfPointAndScreen = 1;        %三孔到屏幕的距离
radius = 0.0000001:0.000000010:0.0000025;                %三孔到原点的距离   
wavelength = 550 * 10^-9;            %波长
amplitude = 1;                       %振幅   
intensityOfWave = 1;                 %光强
[X1,Y1] = meshgrid(-5 : 0.025 : 5 ,-5 : 0.025 : 5 );     %屏上的采样点
MOVIE=moviein(length(radius));

%% 计算部分
for i = 1:length(radius)
    
    point1x = radius(i) * cos(pi/2   ); 
    point1y = radius(i) * sin(pi/2   );         %第一个孔的坐标
    point2x = radius(i) * cos(7*pi/6 ); 
    point2y = radius(i) * sin(7*pi/6 );         %第二个孔的坐标 
    point3x = radius(i) * cos(11*pi/6); 
    point3y = radius(i) * sin(11*pi/6);         %第二个孔的坐标 
    
%     point1x = radius(i) * cos(pi/2   +2*pi*i/length(radius)); 
%     point1y = radius(i) * sin(pi/2   +2*pi*i/length(radius));         %第一个孔的坐标
%     point2x = radius(i) * cos(7*pi/6 +2*pi*i/length(radius)); 
%     point2y = radius(i) * sin(7*pi/6 +2*pi*i/length(radius));         %第二个孔的坐标 
%     point3x = radius(i) * cos(11*pi/6+2*pi*i/length(radius)); 
%     point3y = radius(i) * sin(11*pi/6+2*pi*i/length(radius));         %第二个孔的坐标 

% 计算距离
    distanceToPoint1 = sqrt(point1x ^2 + point1y ^2 + distanceOfSourseAndPoint ^2) + ...
        sqrt((X1 - point1x ).^2 + (Y1 - point1y ).^2 + distanceOfPointAndScreen ^2);
    distanceToPoint2 = sqrt(point2x ^2 + point2y ^2 + distanceOfSourseAndPoint ^2) + ...
        sqrt((X1 - point2x ).^2 + (Y1 - point2y ).^2 + distanceOfPointAndScreen ^2);
    distanceToPoint3 = sqrt(point3x ^2 + point3y ^2 + distanceOfSourseAndPoint ^2) + ...
        sqrt((X1 - point3x ).^2 + (Y1 - point3y ).^2 + distanceOfPointAndScreen ^2);
% 计算相位
    phaseDifference1 = 2 * pi * distanceToPoint1 / wavelength ;
    phaseDifference2 = 2 * pi * distanceToPoint2 / wavelength ;
    phaseDifference3 = 2 * pi * distanceToPoint3 / wavelength ;
% 计算复振幅
    EIntensity = amplitude * exp(1i*phaseDifference1)+...
        amplitude * exp(1i*phaseDifference2)+...
        amplitude * exp(1i*phaseDifference3);

%% 绘图
    surf(X1,Y1,EIntensity .* conj(EIntensity) ./3);
    axis equal;
    view(2);
    shading interp;
    colormap(jet);

    MOVIE(i)=getframe;
end

%movie(MOVIE)
%movie2avi(MOVIE,'ThreePointInterference','compression','none')