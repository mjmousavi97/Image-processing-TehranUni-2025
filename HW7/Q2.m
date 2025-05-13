% =========================================================================
% Title: Noise Suppression using Morphological Operations
%
% Description:
% This script demonstrates noise reduction techniques using morphological
% image processing methods on a noisy grayscale image ('Cygnus.tif').
% The goal is to suppress small bright and dark noise components while
% preserving important image structures, following the approach outlined
% on page 671 of the course textbook.
%
% Sections:
% (a): Perform Opening followed by Closing using disk-shaped structuring 
%      elements with different radii (e.g., 2, 3, 5) to evaluate the impact 
%      of structuring element size on noise suppression.
%
% (b): Perform Alternating Sequential Filtering (ASF), where Opening and 
%      Closing operations are repeated over multiple iterations (e.g., 3), 
%      to demonstrate the progressive denoising effect.
%
% Final denoised results are visualized for both approaches to assess and 
% compare their effectiveness.
%
% Note: All operations are performed using basic morphological functions 
% like imopen, imclose, and strel; no high-level denoising functions are used.
% =========================================================================
clc;
clear;
close all;
%% Section a
% Load noisy image
I = imread("Images\cygnus.tif");

% Define Structuring Element Radii
radii = [2, 3, 5];

figure(1);
subplot(2, 2, 1);
imshow(I, []);
title('Original Noisy Image');

for i = 1:length(radii)
    radius = radii(i);
    se = strel('disk', radius);

    I_open = imopen(I, se);
    I_denoised = imclose(I_open, se);

    subplot(2, 2, i+1);
    imshow(I_denoised, []);
    title(['Radius = ' num2str(radius)]);
end

%% section b
numIterations = length(radii);

I_result = I;  % Initialize result image

figure(2);

% Display original image
subplot(2, ceil((numIterations+1)/2), 1);
imshow(I);
title('Original Image');

for i = 1:numIterations
    % Create structuring element with current radius
    radius = radii(i);
    se = strel('disk', radius);

    % Apply opening and closing
    I_result = imopen(I_result, se);
    I_result = imclose(I_result, se);

    % Show filtered result after current iteration
    subplot(2, ceil((numIterations+1)/2), i+1);
    imshow(I_result, []);
    title(['Iteration ' num2str(i) ' (radius = ' num2str(radius) ')']);
end

    




































