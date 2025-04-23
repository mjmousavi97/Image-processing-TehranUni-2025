% =========================================================================
% Title: RGB Image Denoising
% Description:
% This script performs noise removal on color images.
% (a)-(c): Remove salt & pepper noise and color artifacts from 'frog noisy.png'.
% (d)-(e): Load 'lenna noisy1' and 'lenna noisy2', identify noise types, and apply suitable filters (median, average, harmonic) to denoise them.
% Results are visualized for comparison.
% =========================================================================
clc;
clear;
close all;
%% Part a
% Load the image
img = imread("images\frog_noisy.png");

R = img(:,:,1);
G = img(:,:,2);
B = img(:,:,3);

%% Part b
% Remove salt and pepper noise using median filtering
R_med = medfilt2(R, [3,3]);
G_med = medfilt2(G, [3,3]);
B_med = medfilt2(B, [3,3]);

% Optional: show filtered channels
figure, imshow(R_med), title('Red Channel after Median Filter');
figure, imshow(G_med), title('Green Channel after Median Filter');
figure, imshow(B_med), title('Blue Channel after Median Filter');

% Compute the 2D Fourier Transform
F_R = fft2(double(R_med));
F_G = fft2(double(G_med));
F_B = fft2(double(B_med));

% Shift the zero-frequency component to the center of the spectrum
F_R_shift = fftshift(F_R);
F_G_shift = fftshift(F_G);
F_B_shift = fftshift(F_B);

% Compute the magnitude spectrum (use log for better visualization)
spectrum_R = log(1 + abs(F_R_shift));
spectrum_G = log(1 + abs(F_G_shift));
spectrum_B = log(1 + abs(F_B_shift));

% Display the frequency spectrum of red and green channels
figure(4);
subplot(1,3,1);
imshow(spectrum_R, []); colormap(gca, 'jet'); colorbar;
title('FFT of Red Channel');

subplot(1,3,2);
imshow(spectrum_G, []); colormap(gca, 'jet'); colorbar;
title('FFT of Green Channel');

subplot(1,3,3);
imshow(spectrum_B, []); colormap(gca, 'jet'); colorbar;
title('FFT of Blue Channel');

% Apply notch filter
notch_coords_red = [286 204; 326 204];  
notch_coords_green = [306 198; 306 210];  

% Call the function
R_filtered = notch_filter_fft(R_med, notch_coords_red, 1);     
G_filtered = notch_filter_fft(G_med, notch_coords_green, 2);

% Combine channels
final_img = cat(3, R_filtered, G_filtered, B_med);
figure(5);

subplot(1,2,1);
imshow(final_img);
title('Image after FFT Notch Filtering');

subplot(1,2,2);
imshow(img);
title('Original Image');


%% 
% Compute the 2D Fourier Transform
F_R_filtered = fft2(double(R_filtered));
F_G_filtered = fft2(double(G_filtered));
F_B = fft2(double(B_med));

% Shift the zero-frequency component to the center of the spectrum
F_R_shift = fftshift(F_R_filtered);
F_G_shift = fftshift(F_G_filtered);
F_B_shift = fftshift(F_B);

% Compute the magnitude spectrum 
spectrum_R = log(1 + abs(F_R_shift));
spectrum_G = log(1 + abs(F_G_shift));
spectrum_B = log(1 + abs(F_B_shift));

% Display the frequency spectrum of red and green channels
figure(6);
subplot(1,3,1);
imshow(spectrum_R, []); colormap(gca, 'jet'); colorbar;
title('FFT of Red Channel');

subplot(1,3,2);
imshow(spectrum_G, []); colormap(gca, 'jet'); colorbar;
title('FFT of Green Channel');

subplot(1,3,3);
imshow(spectrum_B, []); colormap(gca, 'jet'); colorbar;
title('FFT of Blue Channel');





