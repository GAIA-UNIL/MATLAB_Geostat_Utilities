function WriteGrid(grid,filename,namevar)

% See DS user guide for functions documentation

% Written by Gregoire Mariethoz, 2010

fid=fopen(filename,'wt');

if fid==-1
    disp('cannot open file')
    fclose(fid);
    return
end

x=size(grid,1);
y=size(grid,2);
z=size(grid,3);
nvar=size(grid,4);

fprintf(fid,'%i %i %i\n',x,y,z);
fprintf(fid,'%i\n',nvar);

for i=1:nvar
    if iscell(namevar)==1
        str=namevar{i};
        %str=cell2mat(str);
    else
        str=namevar;
    end
    fprintf(fid,'%s\n',str);
end

grid=reshape(grid,x*y*z,nvar);

xyz=x*y*z;

% if integer
if (isinteger(grid)==1 || isa(grid,'logical'))
    for j=1:xyz
        fprintf(fid,'%i ',grid(j,:));
        fprintf(fid,'\n');
    end
end

% if float
if isfloat(grid)==1
    for j=1:xyz
        fprintf(fid,'%f ',grid(j,:));
        fprintf(fid,'\n');
    end
end

fclose(fid);


