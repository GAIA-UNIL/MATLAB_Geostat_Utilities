function grid=MGSimulFFT(x,y,z,mu,sigma2,m,lx,ly,lz)

% See DS user guide for functions documentation

% Written by Gregoire Mariethoz, 2010

% m = 1 for an exponential covariance
% m = 2 for a gaussian covariance
%
% Original code from Olaf Cirpka - Stuttgart - 2003

x=x-1; y=y-1; z=z-1;
[xx,yy,zz]=meshgrid(0:x,0:y,0:z);

nx=size(xx,2); ny=size(xx,1); nz=size(xx,3); 

xc=(xx(1,end)-xx(1,1))./2; % coordinates of the center of the grid
yc=(yy(end,1)-yy(1,1))./2;
zc=(zz(end,1)-zz(1,1))./2;

lx=lx/3; ly=ly/3; lz=lz/3;
h=sqrt(((xx-xc)/lx).^2+((yy-yc)/ly).^2+((zz-zc)/lz).^2); % distance to the centre

if m==1
    c=exp(-abs(h))*sigma2;  % exponential covariance
elseif m==2
    c=exp(-h.^2)*sigma2;    % gaussian covariance
end

grid=fftn(fftshift(c))/(nx*ny*nz);                  
grid=abs(grid);grid(1,1,1)=0;                         
ran=sqrt(grid).*exp(1i*angle(fftn(rand(ny,nx,nz)))); 
grid=real(ifftn(ran*nx*ny*nz));                 
l=reshape(grid,nx*ny*nz,1);                       
sl=std(l);                                  
grid=grid./sl*sqrt(sigma2)+mu;                  


