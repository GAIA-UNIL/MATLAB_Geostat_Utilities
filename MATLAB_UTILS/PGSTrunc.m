function grid=PGSTrunc(s,t,rtrfile,show)

rtr=imread(rtrfile);   %rock type rule
rtr=mean(rtr,3);

[x,y]=size(s);
grid=zeros(x,y);

s=(s/(max(max(abs(s)))*2))+0.5;   %centring the values between 0 and 1
t=(t/(max(max(abs(t)))*2))+0.5;

s=round(size(rtr,1)*s);         %round ing all values between 0 and size of the RTR
t=round(size(rtr,2)*t);
s(find(s<=1))=1;        %removing negatives values
t(find(t<=1))=1;

for j=1:x
    for k=1:y        
        grid(j,k)=rtr(s(j,k),t(j,k));
     end
end
