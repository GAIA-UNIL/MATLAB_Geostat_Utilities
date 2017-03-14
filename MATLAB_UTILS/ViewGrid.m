function ViewGrid(grid)

% See DS user guide for functions documentation

% Written by Gregoire Mariethoz, 2010

hold on

grid=YXZ2XYZ(grid);

xo=0;dx=1;yo=0;dy=1;zo=0;dz=1;
nlin=size(grid,1); ncol=size(grid,2); ntra=size(grid,3);
nbvar=size(grid,4);
if nbvar>1
    disp('Cannot display multivariate images. Call this function for each variable in a separate figure')
    return
end

nnodlin=nlin+1; nnodcol=ncol+1; nnodtra=ntra+1;

% Faces with constant y - Faces 1 et 2
nnodface12=nnodlin*nnodcol;
[xnod12,znod12]=meshgrid(xo:dx:xo+dx*ncol,zo:dz:zo+dz*nlin);
xnod12=reshape(xnod12,nnodface12,1);
ynod1=ones(nnodface12,1)*yo;
ynod2=ones(nnodface12,1)*yo+dy*ntra;
znod12=reshape(znod12,nnodface12,1);
val1=reshape(grid(:,:,1),nlin*ncol,1);
val2=reshape(grid(:,:,end),nlin*ncol,1);
vert1=[xnod12,ynod1,znod12];
vert2=[xnod12,ynod2,znod12];
faces=[(1:ncol*(nlin+1)-1)',(2:ncol*(nlin+1))',(nlin+3:nnodface12)',(nlin+2:nnodface12-1)'];
faces(nnodlin:nnodlin:nnodlin*(nnodcol-2),:)=[];
patch('Faces',faces,'Vertices',vert1,'CData',val1,'FaceColor','flat','EdgeColor','none')
patch('Faces',faces,'Vertices',vert2,'CData',val2,'FaceColor','flat','EdgeColor','none')

% Faces with constant x - Faces 3 et 4
nnodface34=nnodlin*nnodtra;
[ynod34,znod34]=meshgrid(yo:dy:yo+dy*ntra,zo:dz:zo+dz*nlin);
ynod34=reshape(ynod34,nnodface34,1);
xnod3=ones(nnodface34,1)*xo;
xnod4=ones(nnodface34,1)*xo+dx*ncol;
znod34=reshape(znod34,nnodface34,1);
val3=reshape(grid(:,1,:),nlin*ntra,1);
val4=reshape(grid(:,end,:),nlin*ntra,1);
vert3=[xnod3,ynod34,znod34];
vert4=[xnod4,ynod34,znod34];
faces=[(1:ntra*(nlin+1)-1)',(2:ntra*(nlin+1))',(nlin+3:nnodface34)',(nlin+2:nnodface34-1)'];
faces(nnodlin:nnodlin:nnodlin*(nnodtra-2),:)=[];
patch('Faces',faces,'Vertices',vert3,'CData',val3,'FaceColor','flat','EdgeColor','none')
patch('Faces',faces,'Vertices',vert4,'CData',val4,'FaceColor','flat','EdgeColor','none')

% Faces with constant z - Faces 5 et 6
nnodface56=nnodcol*nnodtra;
[ynod56,xnod56]=meshgrid(yo:dy:yo+dy*ntra,xo:dx:xo+dx*ncol);
xnod56=reshape(xnod56,nnodface56,1);
znod5=ones(nnodface56,1)*zo;
znod6=ones(nnodface56,1)*zo+dz*nlin;
ynod56=reshape(ynod56,nnodface56,1);
val5=reshape(grid(1,:,:),ncol*ntra,1);
val6=reshape(grid(end,:,:),ncol*ntra,1);
vert5=[xnod56,ynod56,znod5];
vert6=[xnod56,ynod56,znod6];
faces=[(1:ntra*(ncol+1)-1)',(2:ntra*(ncol+1))',(ncol+3:nnodface56)',(ncol+2:nnodface56-1)'];
faces(nnodcol:nnodcol:nnodcol*(nnodtra-2),:)=[];
patch('Faces',faces,'Vertices',vert5,'CData',val5,'FaceColor','flat','EdgeColor','none')
patch('Faces',faces,'Vertices',vert6,'CData',val6,'FaceColor','flat','EdgeColor','none')

view([0 0])
camproj perspective;
axis ij equal tight
