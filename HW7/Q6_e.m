%% Part e - Identify square objects with holes

img = imread("Images/shapes.tif");
bw = img;

[labeled, num_objects] = bwlabel(bw);
props = regionprops(labeled, 'Area', 'Centroid', 'BoundingBox');
boundaries = bwboundaries(bw);

% Initialize counter and display
square_with_hole_count = 0;
figure; imshow(img); title('Squares with Holes'); hold on;

for k = 1:num_objects
    mask = (labeled == k);
    centroid = props(k).Centroid;
    area = props(k).Area;
    bbox = props(k).BoundingBox;
    width = bbox(3);
    height = bbox(4);
    aspect_ratio = width / height;

    % Compute distances from boundary points to centroid
    b = boundaries{k};
    dists = sqrt((b(:,2) - centroid(1)).^2 + (b(:,1) - centroid(2)).^2);
    r_min = min(dists);

    % Calculate vu parameter for squareness
    vu = area / (4 * r_min^2);

    % Check if it's a square (same criteria as Part d)
    is_square = vu > 0.97 && vu < 1.05 && aspect_ratio > 0.9 && aspect_ratio < 1.1;

    % Check if it has holes
    filled = imfill(mask, 'holes');
    hole_mask = filled & ~mask;
    has_hole = any(hole_mask(:));

    % If both conditions met, count and label
    if is_square && has_hole
        square_with_hole_count = square_with_hole_count + 1;
        text(centroid(1), centroid(2), 'Square+Hole', 'Color', 'red', 'FontSize', 10);
    end
end

fprintf('Part (e): Squares with at least one hole: %d\n', square_with_hole_count);
