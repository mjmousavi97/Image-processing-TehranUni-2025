function translatedImage = translationFunction(inputImage, tx, ty)
    % Get the dimensions of the input image
    [rows, cols, channels] = size(inputImage);
    
    % Create a new image with the same dimensions as the input image
    translatedImage = zeros(rows, cols, channels, 'like', inputImage);
    
    % Loop through each pixel of the input image
    for m = 1:rows
        for n = 1:cols
            x = m + tx;
            y = n + ty;
            
            % Ensure the new coordinates are within the image bounds
            if x > 0 && x <= rows && y > 0 && y <= cols
                translatedImage(x, y, :) = inputImage(m, n, :);
            end
        end
    end
end
