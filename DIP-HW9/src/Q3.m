% ---------------------------------------------------------------
% Problem 3 – Texture Analysis of Images
% ---------------------------------------------------------------
% This script performs texture analysis on three grayscale images.
% It computes both global and local (bottom-right 100x100 region)
% texture statistics, including mean, variance, skewness, kurtosis,
% smoothness, uniformity (energy), and entropy.
%
% Steps:
% 1. Add the utils folder to MATLAB path to access helper functions.
% 2. Load the images and convert to grayscale if needed.
% 3. Compute global texture statistics for each image.
% 4. Crop bottom-right 100x100 region and compute local texture stats.
% 5. Display the results in neatly formatted tables.
% ----------------------------------------------------------------

clc;
clear;
close all;
%%
addpath(fullfile(pwd, 'src', 'utils')); 

% Load images
images = cell(1,3);
for i = 1:3
    images{i} = imread(['data/Images/img', num2str(i), '.tif']);
    if size(images{i}, 3) == 3
        images{i} = rgb2gray(images{i});
    end
end

% Compute global texture stats for all images
global_stats = [compute_statistical_texture(images{1});
                compute_statistical_texture(images{2});
                compute_statistical_texture(images{3})];

% Crop bottom-right 100x100 region and compute local texture stats
local_stats = [compute_statistical_texture(crop_100x100(images{1}));
               compute_statistical_texture(crop_100x100(images{2}));
               compute_statistical_texture(crop_100x100(images{3}))];

% Display results in tables
print_texture_table(global_stats, 'GLOBAL TEXTURE STATISTICS');
print_texture_table(local_stats, 'LOCAL (100x100) TEXTURE STATISTICS');


