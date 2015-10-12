function queen
clc;
counter = 0;
n = 4;
board = zeros(1,n);
[board,counter] = back(1, board,counter);
fprintf('Solution count: %d\n',counter);
%%
function value =  isSolution(board)

for  i = 1:length(board)
   for  j = (i+1): length(board)
       if abs(board(i) - board(j)) == abs(i-j)
          value = false;
          return;
       end      
   end
end
value = true;
%%
function [board,counter] =  back(depth, board,counter)

if  (depth == length(board)+1) && isSolution(board)
    counter = counter + 1;
    disp(board);
end

if ( depth <= length(board))
   for  i = 1:length(board)
       if ~any(board==i)
           board(1,depth) = i;           
           [~,counter] = back(depth+1, board,counter);
       end       
   end
end