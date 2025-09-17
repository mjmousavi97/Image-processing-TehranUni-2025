% ---------------------------------------------------------------
% Problem 4 – Skeletonization and Shape Representation
% ---------------------------------------------------------------
% This script implements the skeletonization algorithm described
% in Section 11.1.7 of the textbook. Skeletonization reduces
% binary objects to their skeletal forms while preserving
% topological and structural properties. This enables extraction
% of shape features and geometric signatures.
%
% Steps:
% 1. Add the utils folder to MATLAB path to access helper functions.
% 2. Load the fingerprint image and convert to grayscale if needed.
% 3. Binarize the image and set foreground=1, background=0.
% 4. Apply the iterative thinning (Zhang-Suen) algorithm:
%    - In each iteration, mark deletable pixels using two
%      sub-iterations with neighbor and transition conditions.
%    - Remove marked pixels until convergence.
% 5. Display the original binary image alongside the skeletonized result.
% ---------------------------------------------------------------
clc;
clear;
close all;
%%
addpath(fullfile(pwd, 'src', 'utils'));

% Load and image
img = imread('data/Images/fingerprint.png');
if size(img,3) == 3
    img = rgb2gray(img);
end

% Apply threshold to get binary image
binary = imbinarize(img);

% invert: foreground = 1, background = 0
img = ~img; 

% Apply skeletonization
skeleton = my_skeletonize(img);

% Show results
figure;
subplot(1,2,1); imshow(binary); title('Original Binary Image');
subplot(1,2,2); imshow(skeleton); title('Skeletonized Image');
