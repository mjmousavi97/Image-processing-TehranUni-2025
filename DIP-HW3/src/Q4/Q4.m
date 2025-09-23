% ---------------------------------------------------------------
% Problem 4 – High-Frequency Emphasis Filtering & Histogram Equalization
% ---------------------------------------------------------------
% This script enhances a chest X-ray image using frequency 
% domain processing. A Gaussian high-pass filter is applied 
% in combination with high-frequency emphasis filtering to 
% highlight fine details and edges, while maintaining the 
% overall brightness of the image.
%
% Steps:
% 1. Load the input image 'chest.tif'.
% 2. Convert to grayscale and double precision for processing.
% 3. Compute the 2D Fourier Transform and shift the spectrum 
%    to center the low frequencies.
% 4. Design a Gaussian High-Pass Filter (HPF) in the frequency 
%    domain.
% 5. Apply High-Frequency Emphasis Filtering using constants k1 
%    and k2 to combine low- and high-frequency components.
% 6. Perform the Inverse Fourier Transform to reconstruct the 
%    enhanced image in the spatial domain.
% 7. Apply histogram equalization to improve the intensity 
%    distribution and enhance image contrast.
% 8. Display the original, filtered, and equalized images.
% ---------------------------------------------------------------

clc;
clear;
close all
%% Part a
% Load the chest image
chest_img = imread('data/images/q4/chest.tif');

% Convert to grayscale if the image is not already
if size(chest_img, 3) == 3
    chest_img = rgb2gray(chest_img);
end

%  Convert the image to double for processing
chest_img = double(chest_img);

% Apply Fourier Transform to the image
F = fft2(chest_img);

% Shift the zero-frequency component to the center
F_shifted = fftshift(F);

% Create the Gaussian high-pass filter
[M, N] = size(chest_img);
u = -floor(M/2):floor(M/2)-1;
v = -floor(N/2):floor(N/2)-1;
[U, V] = meshgrid(v, u);

% Compute the frequency distance
D = sqrt(U.^2 + V.^2);

% Set the standard deviation (sigma) for the Gaussian filter
sigma = 10;  

% Gaussian High-pass filter
H_hp = 1 - exp(- (D.^2) / (2 * sigma^2));

% Step 6: Define the constants k1 and k2
k1 = 0.5;
k2 = 0.75;

% High-Frequency Emphasis Filtering
G_shifted = (k1 + k2 * H_hp) .* F_shifted;

% Inverse Fourier Transform to get the filtered image
G = ifftshift(G_shifted);  % Reverse the shift before performing inverse FFT
g = real(ifft2(G));

% Display the results
figure;
subplot(1, 3, 1);
imshow(chest_img, []);
title('Original Chest Image');

subplot(1, 3, 2);
imshow(g, []);
title('High-Frequency Emphasis Filtered Image');

%% Part b
% % Perform histogram equalization on the enhanced image to improve intensity distribution
real_img = g;  % or real(ifft2(G));

% Normalize to [0,1] then convert to uint8
real_img_norm = mat2gray(real_img);     % scales to [0,1]
uint8_img = im2uint8(real_img_norm);    % scales to [0,255] as uint8

% Apply histogram equalization
equalized_image = histeq(uint8_img);
subplot(1,3,3);
imshow(equalized_image, []);
title('Equalized Enhanced Image');

