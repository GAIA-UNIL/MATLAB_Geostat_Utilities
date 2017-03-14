function par=AdjustVario(h,g,par0,type)

options=optimset('MaxFunEvals',1000);
[par,fval] = fminsearch(@(par) optvario(par,h',g',type), par0,options);

%%
function x=optvario(par,h,g,type)

a=par(1);
c=par(2);
p=par(3);

g2=variofct(h,a,c,1,type,p);

w=(size(g,1):-1:1)';
x=sum( ((g-g2).^2).*(w.^3) );

%avoid very low nuggets
if p < g(1)/2 || p<0
    x=x*1000000;
end