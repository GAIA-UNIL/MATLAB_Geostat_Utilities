function y=normalscore_param(z,F,zv,m,s)
% NORMALSCORE Normal Score Transform
%
% Usage: zv=normalscore(z,F,zv)
%
%   zv = values to be transformed
%   (z,F) = vectors describing the cdf of the variable z
%           F(z) = P( Z <= z )
%   y  = transformed values
%   m = mean of the transformed variable
%   s = variance of the transformed variable

p=interp1(z,F,zv);
y=norminv(p,m,sqrt(s));
