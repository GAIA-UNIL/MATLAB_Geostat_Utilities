function zv=UnifSTransform_inv(z,F,y)
% NORMALSCOREINV Inverse Normal Score Transform
%
% Usage: zv=normalscoreinv(z,F,y)
%
%   zv = back transformed variable
%   (z,F) = vectors describing the cdf of the variable z
%           F(z) = P( Z <= z )
%   y  = values to be transformed

p = unifcdf(y);
p = p(:);
% p = unique(p);

% v = unique(v);
% [~,b] = unique(p,'first');
% ii = sort(b);
% out = p(ii);

% [p1, index] = sort(p(:,1));
% p2 = p(index, 2);
% uniq = [true, diff(p1) ~= 0];
% zv = interp1(F,z,p1(uniq),p2(uniq),'pchip');

[F,ia,ic]=unique(F);
z=z(ia);

zv=interp1(F,z,p,'pchip');