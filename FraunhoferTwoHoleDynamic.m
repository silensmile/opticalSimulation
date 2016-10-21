clear;
delta = 0.0000001;
[X1,Y1] = meshgrid(-0.1+delta : 0.001 : 0.1+delta ,-0.1+delta : 0.001 : 0.1+delta );
radius = 0.002:0.0005:0.026;
MOVIE=moviein(length(radius));

for i = 1:length(radius)
    II1 = (  2*besselj( 1,2*pi*0.00001*sin(atan(sqrt((X1-radius(i)).^2+Y1.^2)/1))/550e-9 )./...
        (2*pi*0.00001*sin(atan(sqrt((X1-radius(i)).^2+Y1.^2)/1))/550e-9)  ).^2;
    II2 = (  2*besselj( 1,2*pi*0.00001*sin(atan(sqrt((X1+radius(i)).^2+Y1.^2)/1))/550e-9 )./...
        (2*pi*0.00001*sin(atan(sqrt((X1+radius(i)).^2+Y1.^2)/1))/550e-9)  ).^2;
    II = II1 + II2;
    surf(X1,Y1,II.^0.65);
    view(0,90);
    colormap(hot);
    axis equal;
    axis off;
    shading interp;
    MOVIE(i)=getframe;
end

movie(MOVIE)
movie2avi(MOVIE,'FraunhoferTwoHole','compression','none')