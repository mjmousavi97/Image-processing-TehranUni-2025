clc;
clear;
close all;
%% Part a
% Load the image
img = imread('Images/WashingtonDC.tif');
whos img

img_bits = uint8(img); % Ensure the image is in uint8 format (0-255)
img_modified = bitand(img_bits, uint8(255 - 32));

figure;
subplot(1,3,1), imshow(img), title('Original Image');
subplot(1,3,2), imshow(img_modified), title('Modified Image');

% Step 4: Display the difference
difference = abs(double(img) - double(img_modified));  % Compute absolute difference
subplot(1,3,3), imshow(difference, []), title('Difference Image');

% Step 5: Calculate the information lost (Mean Square Error or Bit Difference)
info_loss = sum(difference(:)) / numel(difference); % Sum of the pixel differences
fprintf('Information lost (mean pixel difference): %f\n', info_loss);

%% Part b
% Step 1: Load the images
mask_image = imread('Images/angiography_mask.tif');
live_image = imread('Images/angiography_live.tif');

% Step 2: Perform subtraction (highlight the blood vessels)
blood_vessels = double(live_image) - double(mask_image);  % Convert to double for subtraction

% Step 3: Enhance visualization by displaying the negative of the result
blood_vessels_negative = 255 - uint8(blood_vessels);  % Make sure it's in the 0-255 range

% Step 4: Display the original images and the results
figure;

% Display the original mask image
subplot(1, 5, 1);
imshow(mask_image);
title('Mask Image');

% Display the original live image
subplot(1, 5, 2);
imshow(live_image);
title('Live Image');

% Display the blood vessels result (before negating)
subplot(1, 5, 3);
imshow(uint8(blood_vessels));  % Convert back to uint8 for proper display
title('Blood Vessels (Before Negating)');

% Display the blood vessels result (after negating)
subplot(1, 5, 4);
imshow(blood_vessels_negative);
title('Blood Vessels (Negative)');

subplot(1, 5, 5);
imshow(blood_vessels, []);
title('Blood Vessels');


