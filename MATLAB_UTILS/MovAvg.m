function movavg=MovAvg(grid,window)

movavg=zeros(size(grid));
s=size(grid);

if numel(s)==3  %3D
    n=nan(size(grid,1)+window*2,size(grid,2)+window*2,size(grid,3)+window*2);
    n(window+1:end-window,window+1:end-window,window+1:end-window)=grid;
    
    for x=window+1:size(n,2)-window
        for y=window+1:size(n,1)-window
            for z=window+1:size(n,3)-window
                neigh=n(y-window:y+window,x-window:x+window,z-window:z+window);
                ind=isfinite(neigh);
                movavg(y,x,z)=mean(neigh(ind));
            end
        end
    end
    movavg=movavg(window+1:end,window+1:end,window+1:end);  

    
elseif (numel(s)==2 && s(2)~=1)    %2D
    n=nan(size(grid,1)+window*2,size(grid,2)+window*2);
    n(window+1:end-window,window+1:end-window)=grid;
    
    
    for x=window+1:size(n,2)-window
        for y=window+1:size(n,1)-window
            neigh=n(y-window:y+window,x-window:x+window);
            ind=isfinite(neigh);
            movavg(y,x)=mean(neigh(ind));
        end
    end
    movavg=movavg(window+1:end,window+1:end);
    
    
else    %1D
    n=nan(size(grid,1)+window*2,1);
    n(window+1:end-window)=grid;
    
        for y=window+1:size(n,1)-window
            neigh=n(y-window:y+window);
            ind=isfinite(neigh);
            movavg(y)=mean(neigh(ind));
        end
    movavg=movavg(window+1:end);    
end






