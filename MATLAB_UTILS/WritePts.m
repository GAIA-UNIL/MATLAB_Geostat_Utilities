function WritePts(pts,filename,namevar)

% See DS user guide for functions documentation

% Written by Gregoire Mariethoz, 2010

fid=fopen(filename,'wt');

if fid==-1
    disp('cannot open file')
    fclose(fid);
    return
end

npts=size(pts,1);
nvar=size(pts,2)-3;

fprintf(fid,'%i\n',size(pts,1));
fprintf(fid,'%i\n',size(pts,2));
fprintf(fid,'x\ny\nz\n');

for i=1:nvar
    if iscell(namevar)==1
        str=namevar{i};
        %str=cell2mat(str);
    else
        str=namevar;
    end
    fprintf(fid,'%s\n',str);
end

for j=1:npts
    
    ind=pts(j,4:end)==-999999999;
    if sum(ind)<nvar
        
        fprintf(fid,'%i %i %i',pts(j,1),pts(j,2),pts(j,3));
        for i=1:nvar
            fprintf(fid,' %f',pts(j,i+3));
        end
        fprintf(fid,'\n');
    end
end

fclose(fid);


