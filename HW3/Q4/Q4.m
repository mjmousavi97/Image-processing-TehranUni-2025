clc;
clear;
close all
%% Part a
% Load the chest image
chest_img = imread('images/q4/chest.tif');

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
[u, v] = meshgrid(0:N-1, 0:M-1);
u = u - floor(N/2);
v = v - floor(M/2);

% Compute the frequency distance
D = sqrt(u.^2 + v.^2);

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
% Perform histogram equalization on the enhanced image to improve intensity distribution
equalized_image = histeq(uint8(ifft2(G)));

subplot(1,3,3);
imshow(equalized_image, []);
title('Equalized Enhanced Image');

