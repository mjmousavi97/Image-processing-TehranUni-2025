% ---------------------------------------------------------------
% Problem 6 – Laplacian Filtering in Spatial and Frequency Domains
% ---------------------------------------------------------------
% This script applies Laplacian edge detection to a grayscale image
% and analyzes the filter in both spatial and frequency domains.
%
% Steps:
% 1. Load the input image 'bld.tif' and convert to grayscale.
% 2. Define the Laplacian kernel.
% 3. Apply the Laplacian filter using convolution in the spatial domain.
% 4. Compute the 2D Fourier Transform of the Laplacian kernel.
% 5. Shift and visualize the frequency spectrum of the kernel.
% 6. Zero-pad the kernel and apply frequency-domain filtering by
%    multiplying with the Fourier Transform of the image.
% 7. Perform inverse Fourier Transform to reconstruct the filtered
%    image in the spatial domain.
% 8. Compare spatial-domain and frequency-domain filtered images.
% ---------------------------------------------------------------

clc;
clear;
close all;
%% Part a
% Load the image
img = imread('data/images/q6/bld.tif');
if size(img, 3) == 3  % Convert only if the image is RGB
    img = rgb2gray(img);
end
disp(size(img));

% Define the Laplacian kernel
laplacian_kernel = [-1 -1 -1; -1 8 -1; -1 -1 -1];

% Apply the Laplacian filter using convolution
%filtered_img = imfilter(double(img), laplacian_kernel, 'replicate');
filtered_img = conv2(laplacian_kernel, img);
filtered_img_clip = uint8(min(max(filtered_img, 0), 255));

% Display the original and filtered images
figure(1);
subplot(1,2,1); imshow(img); title('Original Image');
subplot(1,2,2); imshow(filtered_img_clip, []); title('Laplacian Filtered Image');

%% Part b
% Compute the 2D Fourier Transform of the kernel
fft_kernel = fft2(laplacian_kernel, 600, 600); 

% Shift the zero-frequency component to the center
fft_shifted = fftshift(abs(fft_kernel));

% Convert to logarithmic scale for better visualization
fft_magnitude = log(1 + fft_shifted);

% Plot the frequency spectrum
figure(2);
imagesc(fft_magnitude); 
colormap('gray'); colorbar;
title('Frequency Spectrum of Laplacian Filter');
xlabel('Frequency (u)');
ylabel('Frequency (v)');

%% Part c
pad_mask = padarray(laplacian_kernel,[597 597], 'post');
mask_fft=fftshift(fft2(pad_mask));
img_fft=fftshift(fft2(img));

img_frequency_filtered=ifft2(ifftshift(mask_fft .* img_fft));
img_frequency_filtered_clip = uint8(min(max(img_frequency_filtered, 0), 255));

figure(3);
subplot(2, 2, 1);
imshow(filtered_img, []); title('Laplacian Filtered Image in spatial domain');

subplot(2, 2, 2);
imshow(img_frequency_filtered, []); title('Laplacian Filtered Image in frequency domain');

subplot(2, 2, 3);
imshow(filtered_img_clip, []); title('Laplacian Filtered Image in frequency domain(clip to 0-255)');

subplot(2, 2, 4);
imshow(img_frequency_filtered_clip, []); title('Laplacian Filtered Image in frequency domain(clip to 0-255)');

