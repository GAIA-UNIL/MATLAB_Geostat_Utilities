xr=round(x);
yr=round(y);
%points2d=[0,0,0];
c=0;
for xi=1:250
    for yi=1:250
        fx=find(xr==xi);
        fy=fx(find(yr(fx)==yi));
        if size(fy,1)>0
            c=c+1;
            points2d(c,:)=[xi,yi,mean(log10(rho(fy)))];
        end
    end
end
