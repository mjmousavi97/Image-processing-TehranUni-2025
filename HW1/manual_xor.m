% XOR operation
function result = manual_xor(A, B)
    
    [rowsA, colsA] = size(A);
    [rowsB, colsB] = size(B);
    
    if rowsA ~= rowsB || colsA ~= colsB
        error('Matrices must have the same size!');
    end
    
    result = zeros(rowsA, colsA);
    
    for y = 1:rowsA
        for x = 1:colsA
            if A(y, x) ~= B(y, x)  
                result(y, x) = 1;  
            else
                result(y, x) = 0;  
            end
        end
    end
end
