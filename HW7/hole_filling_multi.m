function filled_img = hole_filling_multi(binary_img, seed_points)
    A_comp = ~binary_img;

    B = strel("arbitrary", [0 1 0;1 1 1;0 1 0]);

    total_fill = false(size(binary_img));

    for k = 1:size(seed_points, 1)
        seed = seed_points(k, :);

        X = false(size(binary_img));
        X(seed(1), seed(2)) = true;

        while true
            X_next = dilation(X, B.Neighborhood) & A_comp;

            if isequal(X_next, X)
                break;
            end
            X = X_next;
        end
        
        total_fill = total_fill | X;
    end

    % Final result
    filled_img = binary_img | total_fill;
end