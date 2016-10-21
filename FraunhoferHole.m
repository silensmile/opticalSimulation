clear;
delta = 0.0000001;
[X1,Y1] = meshgrid(-0.1+delta : 0.001 : 0.1+delta ,-0.1+delta : 0.001 : 0.1+delta );
II = (  2*besselj( 1,2*pi*0.00001*sin(atan(sqrt(X1.^2+Y1.^2)/1))/550e-9 )./...
    (2*pi*0.00001*sin(atan(sqrt(X1.^2+Y1.^2)/1))/550e-9)  ).^2;
surf(X1,Y1,II.^0.690);       %伽马调制 图像显示明显
view(0,90);
colormap(hot);
axis equal;
axis off;
shading interp;