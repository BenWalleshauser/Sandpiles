%Abelian Sandpile Model
%12/1/2021

%% Main

%Dimensions of the sandpile
dim = 200;

%Initialize the sandpile
%A = floor(4*rand(dim,dim));
A = zeros(dim,dim);

%Perturb the sandpile
A(dim/2,dim/2) = 30000;

%Run until toppling stops
while(max(max(A))) > 3 
    for i = 1:dim
        for j = 1:dim
            if A(i,j) > 3 
                A(i,j) = A(i,j) - 4;
                nbinds = neighbors(i+(j-1)*dim,dim,dim);
                A(nbinds) = A(nbinds)+1;
            end
        end
    end
end

%% Plotting result

axis equal
figure(1)
imagesc(A)
set(gca,'xtick',[])
set(gca,'ytick',[])

%% Finds neighbor indices for a point

function [neighbors] = neighbors(num, rows, cols)
    
k = 0; %num of neighbors
%Neighbor beneath
Bottom = 0;
if num/rows ~= ceil(num/rows)
    k = k+1;
    Bottom = 1;
    neighbors(k) = num+1;
end

%Neighbor above
Top = 0;
if (num-1)/rows ~= ceil((num-1)/rows) & num ~= 1
    k = k+1;
    Top = 1;
    neighbors(k) = num-1;
end

%Neighbor right
Right = 0;
if num <= rows*cols-rows
    k = k+1;
    Right = 1;
    neighbors(k) = num + rows;
end


%Neighbor left
Left = 0;
if num >= rows+1
    k = k+1;
    Left = 1;
    neighbors(k) = num - rows;
end


end
