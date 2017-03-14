function [v0,s0]=KrigptOrd(x,y,v,x0,y0,a,sill,param3,type,nugget,nn)

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
c=covarfct(d,a,sill,param3,type,nugget);

% Taille du probl?me
n=size(X,1);

% Matrice des covariances avec la colonne et ligne de 1
o=ones(n,1);
M=[c,o;o',0];

% Distance entre point a estimer et donnees
d=sqrt((x0-X(:,1)).^2+(y0-X(:,2)).^2);

% Covariance
d=covarfct(d,a,sill,param3,type,nugget);

d=[d;1];

% Calcul des poids de krigeage
w=inv(M)*d;

% Elimination du parametre de Lagrange
mu=w(end);
w=w(1:end-1);

% Estimation
v0=w'*v;

% Variance d'estimation
s0=covarfct(0,a,sill,param3,type,nugget)-w'*d(1:end-1)-mu;
