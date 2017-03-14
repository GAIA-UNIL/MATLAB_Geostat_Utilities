function grid=MGSimulFFTCond(x,y,pts,mu,sigma2,m,lx,nn)

% Only works in 2D for the moment!!!
% See DS user guide for functions documentation

% Written by Gregoire Mariethoz, 2010

z=1;
[xx,yy,zz]=meshgrid(1:x,1:y,1:z);

%% gernerate unconditional simul using fft
uncondit=MGSimulFFT(x,y,z,mu,sigma2,m,lx,lx,lx);

%% compute errors
errorpts=pts;
for i=1:size(pts,1)
    errorpts(i,4)=uncondit(pts(i,2),pts(i,1),pts(i,3))-pts(i,4);
end

%% krige errors
kriggrid=zeros(size(xx));

nxyz=numel(kriggrid);
path=randperm(nxyz);

for i=1:nxyz
    [kriggrid(path(i)),s0]=krigptSimple(errorpts(:,1),...
        errorpts(:,2),errorpts(:,4),mu,xx(path(i)),yy(path(i)),...
        lx,sigma2,[],m,0,nn);
end

%%
grid=uncondit-kriggrid;

