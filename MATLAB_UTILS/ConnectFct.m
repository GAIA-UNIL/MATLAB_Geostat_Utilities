function connectfct=ConnectFct(grid,var,show)

% See DS user guide for functions documentation

% Written by Gregoire Mariethoz, 2010

%% keep only desired variable
grid=grid(:,:,:,var);
dims=sum(size(grid)>0);

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
save -ascii tmp grid

%% run connectivity function
%here the path should be adapted if needed
command=['connectfct_parallel.exe tmp ',num2str(x),' ',num2str(y),' ',num2str(z),' ',num2str(nf),' > tmp2'];
system(command);
output=load('tmp2');
delete('tmp');
delete('tmp2');

output2=reshape(output(5:end),output(1)+output(2)+output(3),output(4));
connectfct.x=output2(1:output(1),:);
connectfct.y=output2(output(1)+1:output(1)+output(2),:);
connectfct.z=output2(output(1)+output(2)+1:output(1)+output(2)+output(3),:);

%% show
if show==1
    
    labels={};
    for i=1:nf
        labels=[labels;['facies ',num2str(i-1)]];
    end
    colors=linspace(0.2,0.8,nf);
    
    if dims==3
        
        subplot(1,3,1)
        cla;hold on
        for i=1:nf
            plot(1:size(connectfct.x(:,1),1),connectfct.x(:,i),'color',[colors(i) colors(i) colors(i)]) 
        end
        axis([0 output(1) 0 1])
        legend(labels)
        title('X direction')
        xlabel('Lag distance (pixels)'),ylabel('Probability of connection')
        
        subplot(1,3,2)
        cla;hold on
        for i=1:nf
            plot(1:size(connectfct.y(:,1),1),connectfct.y(:,i),'color',[colors(i) colors(i) colors(i)])
        end
        axis([0 output(2) 0 1])
        legend(labels)
        title('Y direction')
        xlabel('Lag distance (pixels)'),ylabel('Probability of connection')
        
        subplot(1,3,3)
        cla;hold on
        for i=1:nf
            plot(1:size(connectfct.z(:,1),1),connectfct.z(:,i),'color',[colors(i) colors(i) colors(i)])
        end
        axis([0 output(3) 0 1])
        legend(labels)
        title('Z direction')
        xlabel('Lag distance (pixels)'),ylabel('Probability of connection')
        
    else
        
        subplot(1,2,1)
        cla;hold on
        for i=1:nf
            plot(1:size(connectfct.x(:,1),1),connectfct.x(:,i),'color',[colors(i) colors(i) colors(i)])  
        end
        axis([0 output(1) 0 1])
        legend(labels,'Location','Best')
        title('X direction')
        xlabel('Lag distance (pixels)'),ylabel('Probability of connection')
        
        subplot(1,2,2)
        cla;hold on
        for i=1:nf
            plot(1:size(connectfct.y(:,1),1),connectfct.y(:,i),'color',[colors(i) colors(i) colors(i)])  
        end
        axis([0 output(2) 0 1])
        legend(labels,'Location','Best')
        title('Y direction')
        xlabel('Lag distance (pixels)'),ylabel('Probability of connection')
        
    end
    
end



