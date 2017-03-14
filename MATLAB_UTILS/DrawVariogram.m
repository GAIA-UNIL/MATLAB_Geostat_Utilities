function DrawVariogram(meanh,range,sill,param3,type,nugget)

% See DS user guide for functions documentation

% Written by Gregoire Mariethoz, 2010

[gammah]=variofct(meanh,range,sill,param3,type,nugget);

hold on
plot(meanh,gammah,'k')

