function depthFirst()
v=input('Number of Vertices : '); 
e=input('Number of Edges: ');
e1=zeros(1,e); 
e2=zeros(1,e);
for i=1:e 
    a=sscanf(input(''),'%d->%d'); 
    e1(i)=a(1);
    e2(i)=a(2);
end
DG = sparse(e1,e2,true,v,v);
view(biograph(DG));
start=input('Enter the start node: ');
goal=input('Enter the goal node: ');
disp('Enter problem in production system representation:'); 
order = graphtraverse(DG,start);
for i = 1:length(order) 
    if order(i)==goal
    disp('Success! Goal Path:') 
    disp(order(1:i));
    break
elseif i==length(order)
    disp('Failure! Goal not reachable.')
    end
end
end