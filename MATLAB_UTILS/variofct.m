function [gamma]=variofct(h,a,c,param3,type,pepite)
%Utilisation:
%covar(a,c,type)
%h: vecteur des h
%a: port�e
%c: palier
%param3:t�me parma�tre
%type: type de mod�le 1=sph�rique, 2=exponentiel, 3=gaussien
%pepite:quantit� d'effet de p�pite
% a=25
% c=0.75
% type=1

if type==1
    %exponentiel
    gamma=-(c.*(1-exp(-(abs(3.*h)/(a)))))+c;
end

if type==2
    %gaussien
    gamma=-(c.*(1-exp(-(h.^2)/(a^2*1/3))))+c;
end

if type==3
    %sph�rique
    gamma=c./2*((3.*h/a)-(h.^3/a^3));
    ind= h>a;
    gamma(ind)=c;
    gamma=-gamma+c;
end

if type==4
    %power
    gamma=-(c.*(c./a).*abs(h.^(param3)))+c;
end

if type==5
    %cardinal sine
    gamma=(c.*(a./(2.*pi.*h)).*sin((2*pi.*h)/a));
end

if type==6
    %linear
    gamma=-c.*h;
end

gamma=-gamma+c+pepite;

