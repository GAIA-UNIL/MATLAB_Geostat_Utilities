function grid=MGSimulSGS(x,y,pts,mu,sigma2,m,lx,nn)

% Only works in 2D for the moment!!!
% See DS user guide for functions documentation

% Written by Gregoire Mariethoz, 2010

z=1;
[xx,yy,zz]=meshgrid(1:x,1:y,1:z);

%% krige errors
grid=nan(size(xx));

if numel(pts)>0
    grid=Pts2Grid(pts,grid,xx,yy,zz);
end

nxyz=numel(grid);
path=randperm(nxyz);

for i=1:nxyz
    if isnan(grid(path(i)))==1
        
        if numel(pts)>4
            
            [v0,s0]=KrigptSimple(pts(:,1),...
                pts(:,2),pts(:,4),mu,xx(path(i)),yy(path(i)),...
                lx,sigma2,[],m,0,nn);            
        else
            v0=mu;
            s0=sigma2;
        end
        
        grid(path(i))=norminv(rand,v0,sqrt(s0));
        
        pts=[pts;[xx(path(i)) yy(path(i)) zz(path(i)) grid(path(i))]];
    end
end

