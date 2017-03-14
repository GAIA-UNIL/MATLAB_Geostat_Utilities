function grid=NewGrid(x,y,z,nbvar,initialvalue)

% See DS user guide for functions documentation

% Written by Gregoire Mariethoz, 2010

grid=ones(y,x,z,nbvar).*initialvalue;