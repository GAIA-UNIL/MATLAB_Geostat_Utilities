function [grid]=YXZ2XYZ(grid)

% See DS user guide for functions documentation

% Written by Gregoire Mariethoz, 2010

x=size(grid,1);y=size(grid,2);z=size(grid,3);
%Transpose each xy slice because matlab is inverted
grid2=zeros(y,x,z);
nbvar=size(grid,4);
for i=1:z
    for j=1:nbvar
        grid2(:,:,i,j)=grid(:,:,i,j)';
    end
end
grid=grid2;