% ---------------------------------------------------------------
% Problem 5 – Shape Signature Representation and Analysis
% ---------------------------------------------------------------
% This script computes and visualizes shape signatures for multiple
% objects within a binary image. A shape signature is a compact
% representation of an object's boundary, typically based on the
% distance of contour points from the centroid as a function of angle.
%
% Steps:
% 1. Load the input image containing multiple shapes.
% 2. Convert the image to grayscale and then to binary form.
% 3. Extract object boundaries using bwboundaries with 'noholes' option.
% 4. For each detected boundary:
%    - Pass the boundary coordinates to the custom function
%      my_signature to compute:
%         * dist: radial distances of boundary points to centroid.
%         * angle: angular positions of boundary points.
% 5. Plot the distance-angle signature for each object in separate
%    subplots to compare their geometric characteristics.
% ---------------------------------------------------------------
clc
close all
clear
%% load image

addpath(fullfile(pwd, 'src', 'utils'));

image_rgb = imread('data/images/Shape.png');
image_gray = rgb2gray(image_rgb);
image = imbinarize(image_gray);

figure(1);
subplot(1,3,1), imshow(image_rgb), title('Original RGB')
subplot(1,3,2), imshow(image_gray), title('Grayscale Image')
subplot(1,3,3), imshow(image), title('Binary Image')

[B, L] = bwboundaries(image,'noholes');
numComponents = length(B);

fprintf('Number of connected components found: %d\n', numComponents);

figure(2);
imshow(label2rgb(L, @jet, [.5 .5 .5]))

[distSq1,angleSq1] = my_signature(B{1});
[distSq2,angleSq2] = my_signature(B{2});
[distSq3,angleSq3] = my_signature(B{3});
[distSq4,angleSq4] = my_signature(B{4});
[distSq5,angleSq5] = my_signature(B{5});
[distSq6,angleSq6] = my_signature(B{6});

figure(3);
subplot(2,3,1), plot(angleSq1,distSq1), title 'object 1'
subplot(2,3,2), plot(angleSq2,distSq2) , title 'object 2'
subplot(2,3,3), plot(angleSq3,distSq3), title 'object 3'
subplot(2,3,4), plot(angleSq4,distSq4) , title 'object 4'
subplot(2,3,5), plot(angleSq5,distSq5), title 'object 5'
subplot(2,3,6), plot(angleSq6,distSq6) , title 'object 6'