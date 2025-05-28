%% Part f - Identify circular objects with holes

img = imread("Images/shapes.tif");
bw = img; 

% Label connected objects
[labeled, num_objects] = bwlabel(bw);
props = regionprops(labeled, 'Area', 'Perimeter', 'Centroid');

circular_with_hole_count = 0;

figure; imshow(img); title('Circular Objects with Holes'); hold on;

for k = 1:num_objects
    mask = (labeled == k);
    area = props(k).Area;
    perimeter = props(k).Perimeter;
    centroid = props(k).Centroid;

    % Compute circularity metric
    metric = (4 * pi * area) / (perimeter^2);

    % Threshold for being considered a circle
    is_circle = metric > 0.83;

    % Check for holes (same as Part e)
    filled = imfill(mask, 'holes');
    hole_mask = filled & ~mask;
    has_hole = any(hole_mask(:));

    % If both conditions met
    if is_circle && has_hole
        circular_with_hole_count = circular_with_hole_count + 1;
        text(centroid(1), centroid(2), 'Circle+Hole', 'Color', 'green', 'FontSize', 10);
    end
end

fprintf('Part (f): Circular objects with at least one hole: %d\n', circular_with_hole_count);
