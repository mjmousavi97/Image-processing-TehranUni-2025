% Function to perform NOT operation (voxel by voxel)
function result = logical_not(A)
    [rows, cols] = size(A);
    result = zeros(rows, cols);  % Initialize result matrix with zeros

    for x = 1:rows
        for y = 1:cols
            if A(x, y) == 1
                result(x, y) = 0;  % If A is 1, set to 0
            else
                result(x, y) = 1;  % If A is 0, set to 1
            end
        end
    end
end