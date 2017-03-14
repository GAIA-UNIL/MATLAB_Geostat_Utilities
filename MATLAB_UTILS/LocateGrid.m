function [xx,yy,zz] = LocateGrid(grid,dx,dy,dz,ox,oy,oz)

% See DS user guide for functions documentation

% Written by Gregoire Mariethoz, 2010

x=(size(grid,1)-1)*dx+ox;
y=(size(grid,2)-1)*dy+oy;
z=(size(grid,3)-1)*dz+oz;

[yy,xx,zz]=meshgrid(oy:dy:y,ox:dx:x,oz:dz:z);




