function drawcdf(x,titlab,xlab,ylab)

[pdfy,pdfx]=hist(x,100);
cdfy=cumsum(pdfy);
cdfy=(cdfy/max(cdfy))*100;
plot(cdfy,pdfx)

