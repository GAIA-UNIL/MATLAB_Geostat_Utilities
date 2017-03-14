function SkipComments2(fid)

% See DS user guide for functions documentation

% Written by Gregoire Mariethoz, 2010

%skip initial spaces or newlines
c=fscanf(fid,'%c',1);
while(isspace(c))
    c=fscanf(fid,'%c',1);
end

%go back one line
fseek(fid,-1,'cof');
c=fscanf(fid,'%c',2);
%look for //. If found, get the entire line.
if (strcmp(c,'//'))
    fgets(fid);
end

%look for /*. If found, continue until */ is found.
if (strcmp(c,'/*'))
    while(strcmp(c,'*/')==0)
        fseek(fid,-1,'cof');
        c=fscanf(fid,'%c',2);
    end
end

%skip spaces or newlines
c=fscanf(fid,'%c',1);
while(isspace(c))
    c=fscanf(fid,'%c',1);
end

%if a / found, go back one character and skip this new comment
if (strcmp(c,'/'))
    fseek(fid,-2,'cof');
    SkipComments2(fid)
end









