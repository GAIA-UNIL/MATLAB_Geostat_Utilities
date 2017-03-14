function grid=Pts2Grid(pts,grid,xx,yy,zz)

% See DS user guide for functions documentation

% Written by Gregoire Mariethoz, 2010

x=size(grid,1);
y=size(grid,2);
z=size(grid,3);
nvargrid=size(grid,4);
xyz=x*y*z;

xx=xx(:);
yy=yy(:);
zz=zz(:);

npts=size(pts,1);
nvarpts=size(pts,2)-3;

if (nvargrid~=nvarpts)
    disp('Warning: not the same number of variables in the grid and in the pointset!')
    disp('Points on variables that do not exist on the grid will not be migrated.')
end

for i=1:npts
    
    %compute distance with all grid nodes
    d = sqrt((pts(i,1)-xx).^2 + (pts(i,2)-yy).^2 + (pts(i,3)-zz).^2);
    %find indice of closest node, in 3D
    ind=find(d==min(d));
    
    %attribute value on each variable
    for j=0:nvargrid-1
        grid(ind+xyz*j)=pts(i,4+j);        
    end
end





