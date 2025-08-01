% ---------------------------------------------------------------
% Problem 5 - Local Averaging (Mean Filtering) of an Image
% ---------------------------------------------------------------
% Local averaging is a simple and effective technique used to smooth images 
% and reduce noise by replacing each pixel with the mean of its neighbors. 
% This script demonstrates local averaging on the image "lenna.png" using 
% various filter window sizes (3×3, 7×7, 11×11, and 23×23).
%
% a. First, the image is smoothed using a 3×3 averaging filter.
% b. Then, the process is repeated with larger filter sizes (7×7, 11×11, 23×23)
%    to observe the effect of increasing the window size.
%
% As the window size increases, the image becomes more blurred,
% illustrating the trade-off between noise reduction and loss of detail.
% ---------------------------------------------------------------

clc;
clear;
close all;
%%
% Read the image
lenna_img = imread('data/Images/lenna.png');

if size(lenna_img, 3) == 3
    lenna_img = rgb2gray(lenna_img); 
end

lenna_double = im2double(lenna_img);

% Define a 3*3 avraging filter
kernel_3 = ones(3, 3) / 9;
kernel_7 = ones(7, 7) / 49;
kernel_11 = ones(11, 11) / 121;
kernel_23 = ones(23, 23) / 529;

% Apply the filter using convolution
smooth_lenna_kernel3 = conv2(lenna_double, kernel_3, 'same');
smooth_lenna_kernel7 = conv2(lenna_double, kernel_7, 'same');
smooth_lenna_kernel11 = conv2(lenna_double, kernel_11, 'same');
smooth_lenna_kernel23 = conv2(lenna_double, kernel_23, 'same');

% Convert to uint8 format
smooth_lenna_kernel3 = uint8(255 * mat2gray(smooth_lenna_kernel3));
smooth_lenna_kernel7 = uint8(255 * mat2gray(smooth_lenna_kernel7));
smooth_lenna_kernel11 = uint8(255 * mat2gray(smooth_lenna_kernel11));
smooth_lenna_kernel23 = uint8(255 * mat2gray(smooth_lenna_kernel23));

% Display the resulT
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

