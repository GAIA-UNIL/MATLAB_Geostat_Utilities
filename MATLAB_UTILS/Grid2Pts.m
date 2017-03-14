function pts=Grid2Pts(grid,xx,yy,zz)

% See DS user guide for functions documentation

% Written by Gregoire Mariethoz, 2010

grid=YXZ2XYZ(grid);
xx=YXZ2XYZ(xx);
yy=YXZ2XYZ(yy);
zz=YXZ2XYZ(zz);
x=size(grid,1);y=size(grid,2);z=size(grid,3);
nvar=size(grid,4);
grid=reshape(grid,x*y*z,nvar);

pts=[xx(:) yy(:) zz(:) grid];


