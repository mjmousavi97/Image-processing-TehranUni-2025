% =========================================================================
% Title: Basic Morphology Applications
% Description:
% This script performs essential morphological operations in image processing.
% (a): Load 'Man.tif' and compute the object boundary using erosion (A - (A ⊖ B)).
% (b): Load 'Brain.tif' and compute the morphological gradient ((f ⊕ b) - (f ⊖ b)).
% (c): Load 'Holes.tif' and fill internal holes using morphological reconstruction.
% Note: Do not use built-in functions such as bwboundary, imfill, or imgradient.
% =========================================================================
clc;
clear;
close all;
%% Part a
% Load image
A = imread("Images\Man.tif");
A = im2bw(A);   % Convert to binary if needed
B = strel('square', 3);

A_eroded = erosion(A, B.Neighborhood);
boundary = A - A_eroded;

figure(1);
imshow(boundary);
title('Boundary of Man.tif');

%% Part b
f = imread("Images\Brain.tif");
f = im2bw(f);   % Convert to binary if needed
b = strel('square', 3);

dilated = dilation(f, b.Neighborhood);
eroded = erosion(f, b.Neighborhood);

gradient_img = dilated - eroded;

figure(2);
imshow(gradient_img);
title('Gradient of Brain.tif');

%% Part c-1
% Load and binarize image
gray_img = imread('Images\Holes.tif');          
bw = imbinarize(gray_img);         

% set seed point
seed = [44, 57];  % [row, col]

result = hole_filling(bw, seed);

% Show the results
figure(3);
subplot(1,2,1), imshow(bw), title('Original Image');
subplot(1,2,2), imshow(result), title('Hole Filled');

%% Part c-2
% Set seeds
seeds = [44, 57; 45, 180; 36, 367; 144, 261; 158, 92; 144, 261; 177, 4; 204, 178; 136, 464; 233, 415; 300, 110; 311, 239; 370, 385; 354, 510; 450, 61; 461, 237; 480, 405; 490, 505];

gray_img = imread('Images\Holes.tif');          
bw = imbinarize(gray_img);

result = hole_filling_multi(bw, seeds);

figure(4);
subplot(1,2,1), imshow(bw), title('Original');
subplot(1,2,2), imshow(result), title('All Holes Filled');












