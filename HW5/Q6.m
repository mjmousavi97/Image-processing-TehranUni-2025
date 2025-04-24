% =========================================================================
% Title: Basic RGB Image Processing and Edge Detection
% Description:
% This script includes two main parts for basic image processing using MATLAB:
%
% Part (a): Color Manipulation in RGB Images
% - The goal is to adjust the intensity of specific colors (cyan, magenta, yellow, black)
%   in an RGB image ('woman baby.tif') by either weakening or enhancing them.
% - A function is implemented that takes an RGB image, a color type, and an effect 
%   ('weakness' or 'heaviness') as input and returns the modified image.
% - The results are shown in a 2x4 subplot: each column corresponds to a color type, 
%   and each row displays the effect of weakening or enhancing that color compared to the original image.
%
% Part (b): Grayscale Conversion and Edge Detection
% - The image 'peppers.png' is converted to grayscale using rgb2gray.
% - Several edge detection algorithms (Sobel, Prewitt, Roberts, Laplacian of Gaussian, and Canny) 
%   are applied to the grayscale image.
% - The outputs of the edge detection methods are displayed along with the original image
%   in a 2x3 subplot layout for visual comparison.
% =========================================================================
clc;
clear;
close all;
%% Part a
% Load image
peppers_img = imread("images\woman_baby.tif");

colors = {'cyan', 'yellow', 'magenta', 'black'};
effects = {'weakness', 'heaviness'};

for i = 1:4
    subplot(2,4,i);  % Row 1: Weakness
    imshow(modifyColor(peppers_img, colors{i}, effects{1}));
    title(['Weak ', colors{i}]);

    subplot(2,4,i+4);  % Row 2: Heaviness
    imshow(modifyColor(peppers_img, colors{i}, effects{2}));
    title(['Heavy ', colors{i}]);
end

%% Part b
% Load the image
peppers_img = imread('peppers.png');

% Convert RGB to Grayscale
gray_img = rgb2gray(peppers_img);

% Apply edge detection methods
edge_sobel   = edge(gray_img, 'sobel');
edge_prewitt = edge(gray_img, 'prewitt');
edge_roberts = edge(gray_img, 'roberts');
edge_log     = edge(gray_img, 'log');
edge_canny   = edge(gray_img, 'canny');

% Display all results in a 2x3 grid
figure(2);

subplot(2,3,1);
imshow(peppers_img);
title('Original RGB');

subplot(2,3,2);
imshow(edge_sobel);
title('Sobel');

subplot(2,3,3);
imshow(edge_prewitt);
title('Prewitt');

subplot(2,3,4);
imshow(edge_roberts);
title('Roberts');

subplot(2,3,5);
imshow(edge_log);
title('Laplacian of Gaussian');

subplot(2,3,6);
imshow(edge_canny);
title('Canny');

sgtitle('Edge Detection Methods Comparison');
