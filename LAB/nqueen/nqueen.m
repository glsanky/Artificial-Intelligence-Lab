function [varargout]=nqueen(n)
%% Function Main
%#ok<*ISMT>
a=zeros(1,5); % temporary solution array
b=zeros(n); % temporary storage of valid solutions
j=1; % column counter of b -> valid solution matrix
bt=0; % trigger for backtrack
nsol=0; % counter for found valid solutions
over=0; % exit
while(~over) % till all solutions are not found
    i(j:n)=1; % reset all start points to 1
    temp=get_valid(a,n); % load valid positions for next column
    if temp(1)==-1 % a valid solution is found
        j=j-1; % compensate for additional increment
        nsol=nsol+1; % increment solution counter
        sol(nsol,:)=a; % store the solution
        bt=1; % backtrack needed
    elseif temp(1)==0 % dead end
        j=j-1; % go back
        bt=1; % backtrack needed
    else
        for c=1:length(temp) b(c,j)=temp(c); end % load values into valid matrix column
    end
    if a==0 % initial condition, only happens for the first time
        j=j+1; % increment column number
        a=b(1); % do not change
    elseif (b(1,j)>0 && length(b(:,j)>i(j)) && bt==0) % Available value & 'i' remains inside the limit of allowed values
        a=[a,b(i(j),j)]; % concatenate valid position
        j=j+1; % increment column number
    elseif (b(1,j)==0 && bt==0) % No furthur solution
        bt=1; % BACKTRACK needed
    end
    if bt==1 % If backtrack needed
        while (non_zero_length(b(:,j))==i(j)) % till max possible values are reached
            j=j-1; % decrement column number
            if j==0 % extinguished all possible solutions
                over=1; % stop backtracking
                break; % exit 'while' loop
            else
                b(:,j+1)=0; % reset valididity matrix column
                a=a(1:j); % step back on solution array
            end
        end
        if j>0 % do only if any solutions left
            i(j)=i(j)+1; % move to next possible position in same column
            a(j)=b(i(j),j); % store value next possible value in solution array
            j=j+1; % increment column number
            bt=0; % reset backtrack switch
        end
    end
end
varargout(1)={sol}; % output solutions
if nargout==2 varargout(2)={nsol}; end % output number of solutions
end
%% Function get_valid()
function [out]=get_valid(n,s)
count=0;
len=non_zero_length(n); % length for checking condition
if len==0 || (len==1 && n(1)==0)
    out=1:s; % Initially all available
    return
end
for inc_count=1:len
    if n(inc_count)~=0 in(inc_count)=n(inc_count); end
end
len=length(in);
if len==s
    out=-1; % All elements allready present
    return
elseif (len>s || max(in)>s)
    error('Invalid usage');
else
    out=0; % Continue program
end
for curr_count=1:s
    sum=0;
    for n=1:len
        if curr_count==in(n) % Is in same row
            sum=sum+1;
        elseif abs(curr_count-in(n))==abs(len+1-n) % Is in major or minor axis
            sum=sum+1;
        end
    end
    if sum==0 count=count+1; out(count)=curr_count; end
end
end
%% Function non_zero_length
function len=non_zero_length(in)
len=0;
for len_count=1:length(in)
    if in(len_count)~=0 len=len+1; end
end
end
