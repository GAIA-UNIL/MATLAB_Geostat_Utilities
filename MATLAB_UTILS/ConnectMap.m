function connectmap=ConnectMap(grid,var,facies)

% See DS user guide for functions documentation

% Written by Gregoire Mariethoz, 2010

%% keep only desired variable
grid=grid(:,:,:,var);

%% make sure the grid is ok
x=size(grid,1);
y=size(grid,2);
z=size(grid,3);

if min(grid)~=0
    disp('Facies must start with 0')
    return
end

checkint=sum((round(grid)-grid).^2);
if sum(checkint)~=0
    disp('The grid must be populated with facies')
    return
end

nf=max(grid(:))+1;

%% save grid in column format
grid=reshape(grid,x*y*z,1);
save -ascii tmp1 grid

%% run connectivity function
command=['connectmap.exe tmp1 ',num2str(x),' ',num2str(y),' ',num2str(z),' ',num2str(nf),' > tmp2'];
system(command);
output=load('tmp2');
delete('tmp1');
delete('tmp2');

ind=output(:,1)==facies;
connectmap=reshape(output(ind,2),x,y,z);

