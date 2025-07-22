clc;
clear;
close all;
%% Local Averaging (Mean Filtering) on an Image using a 3×3 Window
% ---------------------------------------------------------------
% This script performs local averaging (mean filtering) on "lenna.png" 
% using a 3*3, 7*7, 11*11 and 23*23 filter.

% Read the image
lenna_img = imread('Images/lenna.png');

% Define a 3*3 avraging filter
kernel_3 = ones(3, 3) / 9;
kernel_7 = ones(7, 7) / 49;
kernel_11 = ones(11, 11) / 121;
kernel_23 = ones(23, 23) / 529;

% Apply the filter using convolution
smooth_lenna_kernel3 = conv2(double(lenna_img), kernel_3, 'same');
smooth_lenna_kernel7 = conv2(double(lenna_img), kernel_7, 'same');
smooth_lenna_kernel11 = conv2(double(lenna_img), kernel_11, 'same');
smooth_lenna_kernel23 = conv2(double(lenna_img), kernel_23, 'same');

% Convert to uint8 format
smooth_lenna_kernel3 = uint8(smooth_lenna_kernel3);
smooth_lenna_kernel7 = uint8(smooth_lenna_kernel7);
smooth_lenna_kernel11 = uint8(smooth_lenna_kernel11);
smooth_lenna_kernel23 = uint8(smooth_lenna_kernel23);

% Display the resule
figure;
subplot(2,3,1);
imshow(lenna_img);
title('Original Image');

subplot(2,3,2);
imshow(smooth_lenna_kernel3);
title('Smoothed Image (Local Averaging using 3*3 filter)');

subplot(2,3,3);
imshow(smooth_lenna_kernel7);
title('Smoothed Image (Local Averaging using 7*7 filter)');

subplot(2,3,4);
imshow(smooth_lenna_kernel11);
title('Smoothed Image (Local Averaging using 11*11 filter)');

subplot(2,3,5);
imshow(smooth_lenna_kernel23);
title('Smoothed Image (Local Averaging using 23*23 filter)');

