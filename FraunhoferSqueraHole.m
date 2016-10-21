clear;
delta = 0.0000001;
[X1,Y1] = meshgrid(-0.005+delta : 0.0001 : 0.005+delta ,-0.005+delta : 0.0001 : 0.005+delta );
II = (sin(pi*0.005*sin(atan(X1./10))/550e-9)./(pi*0.005*sin(atan(X1./10))/550e-9)).^2.*...
    (sin(pi*0.005*sin(atan(Y1./10))/550e-9)./(pi*0.005*sin(atan(Y1./10))/550e-9)).^2;
surf(X1,Y1,II.^0.70./100);
view(45,45);
colormap(jet);
axis equal;
axis off;
shading interp;
figure
surf(X1,Y1,II.^0.7./100);
colormap(hot);
view(0,90);
axis equal;
axis off;
shading interp;