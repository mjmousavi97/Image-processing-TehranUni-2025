clc;
clear;
close all;
%% Part a
img = imread("Images\shapes.tif");
figure(1); imshow(img); title('Binary Image')

[labeled, num_objects] = bwlabel(img);
fprintf('Number of objects in the image: %d\n', num_objects);

%% Part b
bw_filled = imfill(img, 'holes');
holes = bw_filled & ~img;

figure(2); imshow(holes); title('Holes in the Image');

[~, num_holes] = bwlabel(holes);

fprintf('Number of holes in the image: %d\n', num_holes);

%% Part c
objects_with_hole = 0;

for k = 1:num_objects
    mask = (labeled == k);

    filled = imfill(mask, 'holes');
    hole_in_object = filled & ~mask;

    if any(hole_in_object(:))
        objects_with_hole = objects_with_hole + 1;
    end
end

fprintf('Number of objects with one or more holes: %d\n', objects_with_hole);

%% Part d
bw = img;

filled = imfill(bw, 'holes');

% Extract edges using Canny method
edges = edge(filled, 'canny');

% Remove small noisy components
edges = bwareaopen(edges, 30);

% Close gaps in the edges using morphological closing
se = strel('disk', 2);
edges = imclose(edges, se);

% Fill any closed shapes after closing
edges = imfill(edges, 'holes');

% Label connected components and extract boundaries
[labeled_img, num_objects] = bwlabel(edges);
props = regionprops(labeled_img, 'Area', 'Centroid', 'BoundingBox');
boundaries = bwboundaries(edges);

% Detect squares using vu and aspect ratio
square_count = 0;
figure; imshow(img); title('Detected Squares'); hold on;

for k = 1:num_objects
    obj_mask = (labeled_img == k);
    centroid = props(k).Centroid;
    area = props(k).Area;
    bbox = props(k).BoundingBox;   % [x, y, width, height]
    width = bbox(3);
    height = bbox(4);
    aspect_ratio = width / height;

    b = boundaries{k};
    dists = sqrt((b(:,2) - centroid(1)).^2 + (b(:,1) - centroid(2)).^2);
    r_min = min(dists);
    vu = area / (4 * r_min^2);

    % Combined condition for square: vu ≈ 1 and aspect_ratio ≈ 1
    if vu > 0.97 && vu < 1.05 && aspect_ratio > 0.9 && aspect_ratio < 1.1
        square_count = square_count + 1;
        text(centroid(1), centroid(2), 'Square', 'Color', 'blue', 'FontSize', 10);
    end
end

fprintf('Number of squares detected (via vu + aspect ratio): %d\n', square_count);


