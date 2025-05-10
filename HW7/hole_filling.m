function filled_img = hole_filling(binary_img, seed_point)

    % Complement of the binary image    
    A_comp = ~binary_img;

    % Structuring element (3x3)
    B = strel("arbitrary", [0 1 0;1 1 1;0 1 0]);

    % Initialize X0 with the seed point
    X = false(size(binary_img));
    X(seed_point(1), seed_point(2)) = true;

    while true
        X_next = dilation(X, B.Neighborhood) & A_comp;

        if isequal(X_next, X)
            break;
        end
        X = X_next; 
    end

    % Final result: union of original image and filled region
    filled_img = binary_img | X;
end