clc;
clear;
close all;
%% Question 1 - Here, we have an example to get familiar with MATLAB for Digital Image Processing

file_path = 'images/lenna_rgb.png';

% To read the image using imread
lenna_rgb = imread(file_path);

% To display the image using imshow
figure;
imshow(lenna_rgb);
title('lenna rgb image');

%convert the image to grayscale
gray_lenna_rgb = rgb2gray(lenna_rgb);

figure;
subplot(1,2, 1);
imshow(lenna_rgb)
title('lenna rgb image');

subplot(1, 2, 2);
imshow(gray_lenna_rgb);
title('Grayscale lenna image');

