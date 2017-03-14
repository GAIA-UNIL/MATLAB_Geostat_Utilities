function [meanh,gammah,nbpairs,cvar]=CVariogram(pts,nblags,maxh,sampling,draw)

% See DS user guide for functions documentation

% Written by Gregoire Mariethoz, 2010

xyz=pts(:,[1 2 3]);
v1=pts(:,4);
v2=pts(:,5);

ind=randperm(size(xyz,1));
xyz=xyz(ind(1:sampling:end),:);
x=xyz(:,1);y=xyz(:,2);z=xyz(:,3);
v1=v1(ind(1:sampling:end));
v2=v2(ind(1:sampling:end));

%calculate covariance
m1=mean(v1);
m2=mean(v2);
cvar=mean((v1-m1).*(v2-m2));

%calculating distances matrix
nbpoints=size(x,1);
h=zeros(nbpoints,nbpoints);
gamma=zeros(nbpoints,nbpoints);
for i=1:nbpoints
    for j=1:nbpoints
        h(i,j)=sqrt(((x(j)-x(i))^2+(y(j)-y(i))^2));
        %calculating variogram cloud
        gamma(i,j)=0.5*((v1(i)-v1(j))*((v2(i)-v2(j))));
    end
end

%maxh=max(max(h))*fract;
step=maxh/nblags;

%looping categories
for i=1:nblags
    maxlag=i*step;
    category_points_max=find(h<=maxlag);
    category_points_min= h(category_points_max)>(i-1)*step;
    category_points=category_points_max(category_points_min);
    meanh(i)=maxlag-(step/2);
    gammah(i)=mean(gamma(category_points));
    nbpairs(i)=sum(category_points(:));
end

%drawing variogram
if draw==1
    plot(meanh,gammah)
    plot(meanh,cvar,'.k')
end
