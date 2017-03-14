function [slice]=ExtractSlice(sim,dim,coord);

% See DS user guide for functions documentation

% Written by Gregoire Mariethoz, 2010

y=size(sim,1);x=size(sim,2);z=size(sim,3);
[xx,yy,zz]=meshgrid(1:x,1:y,1:z);
sim=double(sim);

% y slice
if dim==2
    slicex=xx(coord,:,:);
    slicey=yy(coord,:,:);
    slicez=zz(coord,:,:);
    slicev=sim(coord,:,:);
    slice=[slicey(:) slicex(:) slicez(:) slicev(:)];    
end

% x slice
if dim==1
    slicex=xx(:,coord,:);
    slicey=yy(:,coord,:);
    slicez=zz(:,coord,:);
    slicev=sim(:,coord,:);
    slice=[slicey(:) slicex(:) slicez(:) slicev(:)];    
end

% z slice
if dim==3
    slicex=xx(:,:,coord);
    slicey=yy(:,:,coord);
    slicez=zz(:,:,coord);
    slicev=sim(:,:,coord);
    slice=[slicey(:) slicex(:) slicez(:) slicev(:)];    
end

