function [v0,s0]=KrigptSimple(x,y,v,mu,x0,y0,a,sill,param3,type,nugget,nn)

% See DS user guide for functions documentation

% Written by Gregoire Mariethoz, 2010

X=[x,y];

dist=sqrt((x0-X(:,1)).^2+(y0-X(:,2)).^2);
[d2,i]=sort(dist);
X(i(nn+1:end),:)=[];
v(i(nn+1:end))=[];

% Calcul de la matrice des distances
d=squareform(pdist(X));

% Calcul de la matrice des covariances
M=covarfct(d,a,sill,param3,type,nugget);

% Distance entre point a estimer et donnees
d=sqrt((x0-X(:,1)).^2+(y0-X(:,2)).^2);

% Covariance
d=covarfct(d,a,sill,param3,type,nugget);

% Calcul des poids de krigeage
w=inv(M)*d;

%poids de la moyenne
wm=1-sum(w);

% Estimation
v0=w'*v+mu*wm;

% Variance d'estimation
s0=covarfct(0,a,sill,param3,type,nugget)-w'*d;

%avoid numerical errors with variances very cluse to 0.
if (s0<=0)
    s0=eps;
end
