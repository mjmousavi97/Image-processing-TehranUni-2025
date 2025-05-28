%--------------------------------------------------------------------------
% Title: Granulometry Analysis using Morphological Opening
%
% |Section a|
% Description:
% This script performs granulometry on the image 'wood dowels.tif' to estimate
% the size distribution of objects (dowels) based on morphological operations.
%
% Step-by-step procedure:
% 1. Load the input image and apply morphological smoothing (closing + opening)
%    with a disk-shaped structuring element of radius 3 to reduce noise.
% 2. Perform successive morphological openings using disk-shaped structuring 
%    elements with increasing radii.
% 3. After each opening, compute the total pixel intensity (sum of grayscale values).
% 4. Calculate the difference in intensity between successive openings to identify
%    significant drops, which correspond to dominant object sizes.
% 5. Plot the granulometry curve (difference in intensity vs. SE radius).
%    Peaks in the curve indicate prevalent dowel sizes in the image.
%
% |Section b|
% Description:
% Textural Segmentation of blobs.tif (similar to Example 9.43 from Gonzalez book)
%
% This script segments two types of blobs (small & large) by applying:
% 1. Morphological closing to remove small blobs.
% 2. Morphological opening to remove background spaces between large blobs.
% 3. Morphological gradient to extract boundary between regions.
% 4. Overlay boundary on original image.
%
%--------------------------------------------------------------------------
clc;
clear;
close all;
%% Part a
% Load image
I = imread("Images\wood_dowels.tif");
I = im2double(I);
figure(1);
imshow(I);
title('Original Image');

% Smoothing
se_smooth = strel('disk', 3);

% I_closed = imclose(I, se_smooth);
% I_smoothed = imopen(I_closed, se_smooth);

I_open = imopen(I, se_smooth);
I_smoothed = imclose(I_open, se_smooth);

figure(2);
imshow(I_smoothed);
title("Smoothed Image (Closing + Opening with radius 3)");

% Granulometry Analysis
radii = 5:40;
sum_intensities = zeros(size(radii));

for i = 1:length(radii)
    se = strel('disk', radii(i));
    I_opened = imopen(I_smoothed, se);

    sum_intensities(i) = sum(I_opened(:));
end

diff_intensities = -diff(sum_intensities);

figure(3);
plot(radii(2:end), diff_intensities, 'b-o', 'LineWidth', 2, 'MarkerSize', 5);
xlabel('Structuring Element Radius');
ylabel('Difference in Intensity');
title('Granulometry Curve (Size Distribution of Dowels)');
grid on;

% Notes:
disp('Peaks in this plot indicate dominant object sizes in the image.');
% _______________________________________________________________________________________________________
% %% Part b
% % Load image
% image = imread("Images\blobs.tif");
% image = im2double(image);
% 
% figure(4);
% imshow(image);
% title('Original Image');
% 
% 
% % Closing to remove small blobs
% se_close = strel('disk', 30);   % size > small blobs
% I_closed = imclose(image, se_close);
% 
% figure(5);
% imshow(I_closed, []);
% title('After closing(small blobs removed)');
% 
% 
% % Opening to remove light areas between large blobs
% se_open = strel('disk', 60);
% I_opened2 = imopen(I_closed, se_open);
% 
% figure(6);
% imshow(I_opened2, []);
% title('After opening(light gaps removed)');
% 
% 
% % Morphological Gradient to Find Boundary
% se_gradient = strel('square', 3);  % Small SE for gradient
% I_dilated = imdilate(I_opened2, se_gradient);
% I_eroded = imerode(I_opened2, se_gradient);
% I_gradient = I_dilated - I_eroded;
% 
% figure(7);
% imshow(I_gradient, []);
% title('Morphological Gradient (Boundary)');
% 
% 
% % Overlay Boundary on Original Image
% boundary_overlay = image;
% boundary_overlay(I_gradient > 0.01) = 1;  % Highlight boundary in white
% figure(8); imshow(boundary_overlay); title('Original Image with Boundary Overlay');











































































