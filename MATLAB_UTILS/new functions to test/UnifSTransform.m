function [y,z,F]=UnifSTransform(zv,bins,tail)
% NORMALSCORE Normal Score Transform
%
% Usage: zv=normalscore(z,F,zv)
%
%   zv = values to be transformed
%   (z,F) = vectors describing the cdf of the variable z
%           F(z) = P( Z <= z )
%   y  = transformed values

%%
zv=zv(:);
[F,z] = hist(zv,bins);

F=cumsum(F);
F=F/max(F);

%z=[0 z z(end)*(1+tail)];
%F=[0 F 1+tail]+z*0.0000001;

p=interp1(z,F,zv,'pchip');
%p=((p)/max(p))*(1-(2*tail))+tail;
p=p-min(p)+tail;
p=p/(max(p+tail));
%p=p/(max(p)*(1+tail));
y=unifinv(p);

%plot(zv,p,'.')

