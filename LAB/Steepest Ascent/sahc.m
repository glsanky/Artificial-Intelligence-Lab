function [result,path] = sahc(ad,n,fx,start,key)
        path=zeros(1,n);
        result=0;
        x=1;
        while true
               min=0;flag=0;
               path(x)=start;
               x=x+1;
               if start==key
                   result=1;
                   break;
               end
               for i=1:n
                    if ad(start,i)==1 
                        if flag==0
                            min=i;
                            flag=1;
                        else
                            if(fx(min)>fx(i))
                                min=i;
                            end
                        end
                    end
                end
                if min>0
                    start=min;
                else
                    break;
                end
        end
end

