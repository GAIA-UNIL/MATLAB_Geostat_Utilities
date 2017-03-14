function [gamma]=covarfct(h,a,c,param3,type,nugget)

% See DS user guide for functions documentation

% Written by Gregoire Mariethoz, 2010

%Defines covariance functions (variogram models) for kriging utilities
%Utilisation:
%covar(a,c,type)
%h: vector of distances
%a: range
%c: sill
%param3:third parameter (not used for the moment)
%type: model type 0=exponential, 1=gaussian
%nugget:nugget effect

if type==1
    %exponentiel
    gamma=-(c.*(1-exp(-(abs(3.*h)/a))))+c;
end

if type==2
    %gaussien
    gamma=-(c.*(1-exp(-(h.^2)/(a^2*1/3))))+c;
end

if type==3
    %sphérique
    gamma=c./2*((3.*h/a)-(h.^3/a^3));
    ind=find(h>a);
    gamma(ind)=c;
    gamma=-gamma+c;
end

if type==4
    %lineaire (power)
    gamma=-(c.*(c./a).*abs(h.^(param3)))+c;
end

if type==5
    %cardinal sine
    gamma=(c.*(a./(2.*pi.*h)).*sin((2*pi.*h)/a));
end


% if type==0
%     %exponential
%     gamma=-(c.*(1-exp(-(abs(3.*h)/(a*3)))))+c;
% end
% 
% if type==1
%     %gaussian
%     gamma=-(c.*(1-exp(-(h.^2)/a^2)))+c;
% end

gamma=gamma+nugget;