function [meanh,gammah,nbpairs]=Variogram(pts,nblags,maxh,sampling,draw)

% See DS user guide for functions documentation

% Written by Gregoire Mariethoz, 2010

xyz=pts(:,[1 2 3]);
v=pts(:,4);

ind=randperm(size(xyz,1));
xyz=xyz(ind(1:sampling:end),:);
v=v(ind(1:sampling:end));

meanh=zeros(1,nblags);
gammah=zeros(1,nblags);

%calculating distances matrix
h=squareform(pdist(xyz));
gamma=0.5*squareform(pdist(v).^2);

step=maxh/nblags;
%looping categories
for i=1:nblags
    maxlag=i*step;
    category_points=(h<=maxlag & h>(i-1)*step);
    meanh(i)=mean(mean(h(category_points)));
    gammah(i)=mean(gamma(category_points));
    nbpairs(i)=sum(category_points(:));
end

if draw==1; draw='b'; end
if draw==0; draw=[]; end

%drawing variogram
if numel(draw)>0
    hold on
    %plot(h(:),gamma(:),'r.')
    plot(meanh,gammah,draw)
    plot([0 maxh],[var(v) var(v)],':k','linewidth',2)
    xlabel('h')
    ylabel('\gamma(h)')
end
