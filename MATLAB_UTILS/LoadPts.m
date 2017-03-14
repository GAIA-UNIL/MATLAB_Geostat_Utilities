function [pts,nbvar,namevar]=LoadPts(filename)

% See DS user guide for functions documentation

% Written by Gregoire Mariethoz, 2010

fid=fopen(filename,'r');
if fid==-1
    disp('cannot open file')
    fclose(fid);
    return
end

nbpts=fscanf(fid,'%i',1);
nbvar=fscanf(fid,'%i',1);
dummy=fscanf(fid,'%s',1);
dummy=fscanf(fid,'%s',1);
dummy=fscanf(fid,'%s',1);

namevar='';
for i=1:nbvar-3
   namevar=[namevar,{fscanf(fid,'%s',1)}];
end
pts=fscanf(fid,'%f',nbpts*nbvar);
pts=reshape(pts,nbvar,nbpts)';

fclose(fid);