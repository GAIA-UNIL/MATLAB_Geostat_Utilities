function pts=SampleGrid(grid,samplesize)

% See DS user guide for functions documentation

% Written by Gregoire Mariethoz, 2010

grid=YXZ2XYZ(grid);
x=size(grid,1);y=size(grid,2);z=size(grid,3);nvar=size(grid,4);
[xx,yy,zz]=meshgrid(1:y,1:x,1:z);
xx=xx(:);yy=yy(:);zz=zz(:);
grid=reshape(grid,x*y*z,nvar);

ind=randperm(x*y*z);
ind=ind(1:samplesize);

pts=[xx(ind,:) yy(ind,:) zz(ind,:)];
for i=1:nvar
    pts=[pts grid(ind,i)];
end

