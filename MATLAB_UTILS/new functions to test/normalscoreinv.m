function zv=normalscoreinv(z,F,y)
% NORMALSCOREINV Inverse Normal Score Transform
%
% Usage: zv=normalscoreinv(z,F,y)
%
%   zv = back transformed variable
%   (z,F) = vectors describing the cdf of the variable z
%           F(z) = P( Z <= z )
%   y  = values to be transformed

p=normcdf(y);
zv=interp1(F,z,p);