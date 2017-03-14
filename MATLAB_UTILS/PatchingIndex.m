function I=PatchingIndex(A,B)

sizexA=size(A,1);
sizeyA=size(A,2);
sizexB=size(B,1);
sizeyB=size(B,2);

for n=2:200
    disp(['checking size ',num2str(n)])
    Br=0;

    for xA=1:sizexA-n+1
        for yA=1:sizeyA-n+1
            %pattern A
            PA=A(xA:xA+n-1,yA:yA+n-1);
            
            C=conv2(B,PA,'valid');
            if min(C(:))==0;
                Br=1;
                break
            end
            
        end
        if Br==1
            break
        end
    end
    
    if Br~=1
        I=n-1;
        return
    end
end




