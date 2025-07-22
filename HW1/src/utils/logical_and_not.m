% AND-NOT operation
function result = logical_and_not(A, B)
    [rows, cols] = size(A);
    result = zeros(rows, cols);  
    for x = 1:rows
        for y = 1:cols
            result(x, y) = A(x, y) * ~B(x, y);  
        end
    end
end