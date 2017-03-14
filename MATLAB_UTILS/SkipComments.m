function SkipComments(fid)

% See DS user guide for functions documentation

% Written by Gregoire Mariethoz, 2010

SkipComments2(fid);
fseek(fid,-1,'cof');
