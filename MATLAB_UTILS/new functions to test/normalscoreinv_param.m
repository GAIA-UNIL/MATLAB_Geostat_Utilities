function zv=normalscoreinv_param(z,F,y,m,s)
% NORMALSCOREINV Inverse Normal Score Transform
%
% Usage: zv=normalscoreinv(z,F,y)
%
%   zv = back transformed variable
%   (z,F) = vectors describing the cdf of the variable z
%           F(z) = P( Z <= z )
%   y  = values to be transformed
%   m = mean of the transformed variable
%   s = variance of the transformed variable

p=normcdf(y,m,sqrt(s));
zv=interp1(F,z,p);