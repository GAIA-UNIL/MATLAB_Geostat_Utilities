clear
home
nodes=load('nodes_domain.txt');
elements=load('elem_domain.txt');
nodes(:,1)=[];
elements(:,1)=[];

%find equations of each plan

A=zeros(size(elements,2),3,size(elements,1));
Aeq=zeros(size(elements,2),4);
Aeq(:,[1])=1;
beq=ones(4,1);
b=zeros(4,1);
A1=ones(4,1);

for i=1:size(elements,1)
    p1=nodes(elements(i,1),1:3)';
    p2=nodes(elements(i,2),1:3)';
    p3=nodes(elements(i,3),1:3)';
    u=p1-p2;
    v=p1-p3;
    abc=cross(u,v);
    d=-(abc(1)*p1(1))-(abc(2)*p1(2))-(abc(3)*p1(3));
    plan(i,:)=[abc' d]
end