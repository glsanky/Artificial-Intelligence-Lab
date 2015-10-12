
function main()
v=input('Number of Vertices : ');
e=input('Number of Edges: ');

ad=zeros(v,v);

for i=1:e
    a=sscanf(input(''),'%d->%d');
    ad(a(1),a(2))=1;
end

start=input('Enter the start node ');
goal=input('Enter the goal node ');
 fx=zeros(1,v);
 disp('Enter fx values')
 for i=1:v
     fx(i)=input('');
 end

 [result,path]=sahc(ad,v,fx,start,goal);
 
 if(result==1)
     fprintf('%d',path(1));
     for i=2:v
         if(path(i)~=0)
             fprintf(' - %d',path(i));
         end
     end
 else
     disp('No path found')
 end
 disp('')
end
