function [ret,array]=steepesthill(mat,start,goaldis,n)
global visit;
global index;
i=1;
index=1; 
max=goaldis(start); 
flag=0; 
array(1,index)=start; 
index=index+1; 
visit(1,start)=1; 
while(1)
    i=1;
    flag=0; 
    while(n>=i)
        if(mat(start,i)==1&&visit(1,i)==0) 
            visit(1,i)=1;
        if(max>goaldis(i)) temp=i;
            flag=1;
        max=goaldis(i);
        end
        end
    i=i+1;
    end
    if(goaldis(start)==0)
        ret=1;
        break; 
    end
if(flag==0) 
    ret=0; 
    break;
end
start = temp; 
array(1,index)=start; 
index=index+1;
end
end