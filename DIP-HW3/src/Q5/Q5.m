% ---------------------------------------------------------------
% Problem 5 – Moiré Pattern Removal using Multiple Notch Filters
% ---------------------------------------------------------------
% This script removes periodic noise (Moiré patterns) from a 
% grayscale image using multiple notch filters in the frequency domain.
%
% Steps:
% 1. Load the input image 'carmoire.tif' and convert to grayscale.
% 2. Compute the 2D Fourier Transform and shift the spectrum 
%    so that low frequencies are centered.
% 3. Display the magnitude spectrum of the original image 
%    to identify the periodic noise frequencies.
% 4. Define multiple notch filter centers and a radius to target 
%    the specific noise frequencies.
% 5. Apply the multiple notch filters to the shifted Fourier 
%    spectrum to suppress the periodic noise.
% 6. Perform the inverse Fourier Transform to reconstruct the 
%    filtered image in the spatial domain.
% 7. Display the original image, filtered frequency spectrum, 
%    and the resulting filtered image.
% ---------------------------------------------------------------

clc;
clear;
close all;
%% Part a
% Load the image
image_path = 'data/images/q5/carmoire.tif';
carmoire_img = imread(image_path);

% convert to grayscale
if size(carmoire_img, 3) == 3
    carmoire_img = rgb2gray(carmoire_img);
end

% compute FT
F = fft2(carmoire_img);
F_shifted = fftshift(F);

figure(1);
subplot(1, 2, 1);
imshow(carmoire_img, []);
title('Original image');

magnitude_spectrum = log(1 + abs(F_shifted));
subplot(1, 2, 2);
imshow(magnitude_spectrum, []);
datacursormode on
title('Frequency spectrum');
%% Part b
notch_points = [41, 112; 81, 112; 41, 56; 83, 55; 166, 58;161, 114; 207, 58;203, 114];
radius = 7;

notch_filtered_F = apply_multiple_notch_filters(F_shifted, size(F_shifted), notch_points, radius);

% Inverse Fourier Transform to obtain the filtered image
F_ift = ifftshift(notch_filtered_F); % Shift back
filtered_image = ifft2(F_ift); % Inverse FFT to get the image in spatial domain

figure;
subplot(1, 3, 1);
imshow(carmoire_img, []);
title('Original Image');

subplot(1, 3, 2);
imshow(log(1 + abs(notch_filtered_F)), []);
title('Frequency Spectrum after Multiple Notch Filtering');

subplot(1, 3, 3);
imshow(abs(filtered_image), []);
title('Filtered Image');

