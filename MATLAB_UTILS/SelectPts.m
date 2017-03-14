function pts=SelectPts(grid,xx,yy)

% See DS user guide for functions documentation

% Written by Gregoire Mariethoz, 2010

h=figure;
disp('Press ENTER when you have finished selecting points')

%surf(yy,xx,zeros(size(xx)),grid)
%view(0,90)
%shading flat
%ViewGrid(grid);
imagesc(grid);
axis equal tight xy

pts_t = ginput;

pts=zeros(size(pts_t));

%x0=xx(1,1)-1; y0=yy(1,1)-1;
for i=1:size(pts,1)
    pts(i,1)=xx(round(pts_t(i,2)),round(pts_t(i,1)));
    pts(i,2)=yy(round(pts_t(i,2)),round(pts_t(i,1)));
    pts(i,3)=1;
    pts(i,4)=grid(round(pts_t(i,2)),round(pts_t(i,1)));
end

close(h)






