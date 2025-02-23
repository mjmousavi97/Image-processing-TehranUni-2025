clc;
clear;
close all;

%% Project: Intensity Level Reduction in a Grayscale Image
%
% In this project, we process the "skull.tif" image to analyze the effect of reducing intensity levels.
% The original image has 256 intensity levels (0-255). We display the image at reduced intensity levels 
% of 64, 16, 4, and 2 while keeping the image size constant.

img_path = 'Images/skull.tif';  
skull_img = imread(img_path);

% Display the original image
figure;
subplot(2, 3, 1);
imshow(skull_img);
title('Original Image');

% Define a function to reduce intensity levels
reduce_level = @(img, levels) uint8(floor(double(img) / (256 / levels)) * (256 / levels));

% Function for reducing to 2 intensity levels (black and white)
reduce_level_2 = @(img) uint8(img > 127) * 255;  % Pixels are divided into two groups: 0 or 255

levels = [64, 16, 4, 2];

for i = 1:length(levels)
    if levels(i) == 2
        img_reduced = reduce_level_2(skull_img);
    else
        img_reduced = reduce_level(skull_img, levels(i));
    end
    
    % Display images with different intensity levels
    subplot(2, 3, i + 1);
    imshow(img_reduced);
    title(sprintf('Intensity Level: %d', levels(i)));
end
