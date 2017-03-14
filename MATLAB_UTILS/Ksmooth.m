function [pdf,xx,yy]=Ksmooth(Y, sigx, sigy, Xspacing, Yspacing) %, gridX, gridY)


%dx=(max(Y(:,1))-min(Y(:,1)))/gridX;
%dy=(max(Y(:,2))-min(Y(:,2)))/gridY;
%[xx,yy]=meshgrid(min(Y(:,1)):dx:max(Y(:,1)),min(Y(:,2)):dy:max(Y(:,2)));

%dx=Xspacing(2); dy=Yspacing(2);
[xx,yy]=meshgrid(Xspacing(1):Xspacing(2):Xspacing(3),Yspacing(1):Yspacing(2):Yspacing(3));

pdf=zeros(size(xx));

%sigx=sig; 
%sigy=sig ;
rho=0;

for i=1:size(Y,1)
    
    mux=Y(i,1);
    muy=Y(i,2);

    f=1./(2*pi*sigx*sigy*sqrt(1-rho.^2));
    pdf_tmp=(f.*exp(-1./2.*(1-rho.^2)*((xx-mux).^2./sigx.^2+(yy-muy).^2./sigy.^2-2.*rho.*(xx-mux).*(yy-muy)/(sigx.*sigy))));
    %removing NANs
    ind=isnan(pdf_tmp);
    pdf_tmp(ind)=0;
    %Adding kernel and weighting with likelihood
    pdf=pdf+pdf_tmp;
   
end

%normalizing
%pdf=pdf./sum(pdf(:));
