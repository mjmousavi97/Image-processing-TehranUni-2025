% =========================================================================
% Title: RGB Image Denoising
% Description:
% In this task, we load two noisy versions of the Lenna image: "lenna noisy1" and "lenna noisy2".
% The goal is to identify the type of noise present in each image and apply an appropriate
% filtering technique to suppress it as much as possible.
% =========================================================================
clc;
clear;
close all;
%% Part a
% load the images
lena1 = imread("images\lenna_noisy1.tif");
lena2 = imread("images\lenna_noisy2.tif");

% Extract the green channel of lenna 1
green_channel_1 = lena1(:,:,2);

% Apply median filtering
green_med_1 = medfilt2(green_channel_1, [3,3]);

% Replace the green channel in the original image with the filtered one
lena1_filtered = lena1;
lena1_filtered(:,:,2) = green_med_1;

% Display original and filtered image side by side
figure(1);
subplot(1,2,1); imshow(lena1); title('Original Noisy Image');
subplot(1,2,2); imshow(lena1_filtered); title('Green Channel Median Filtered');

%% Part b

% Extract the green channel
green_Channe2 = lena2(:,:,2);  

% Define the rectangular region (you should set these coordinates)
x1 = 464;   % Starting column
y1 = 65;  % Starting row
x2 = 509;  % Ending column
y2 = 95;  % Ending row

% Extract the rectangular region from the green channel
rectRegion = green_Channe2(y1:y2, x1:x2);

% Calculate mean and variance
mean_val = mean(rectRegion(:));             
var_val = var(double(rectRegion(:)));       

% Display results
fprintf('Mean of selected region: %.2f\n', mean_val);
fprintf('Variance of selected region: %.2f\n', var_val);

figure(2);
histogram(rectRegion, 50);  % 50 bins
title('Histogram of Green Channel Noise Region');
xlabel('Pixel Intensity');
ylabel('Frequency');

% Apply Wiener filter
green_wiener_2 = wiener2(green_Channe2, [7 7]); 

% Replace green channel in original image
lena2_filtered = lena2;
lena2_filtered(:,:,2) = green_wiener_2;

% Step 5: Display results
figure(3);
subplot(1,2,1); imshow(lena2); title('Original Noisy Image');
subplot(1,2,2); imshow(lena2_filtered); title('Wiener Filtered Image');




