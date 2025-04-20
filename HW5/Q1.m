% =========================================================================
% Title: Histogram Equalization and Matching for a Color Image
% Description:
% This script enhances a color image ('flowers.png') using two histogram 
% equalization methods. First, it equalizes the R, G, and B channels separately 
% and reconstructs the image. Then, it computes an average histogram from all 
% three channels, builds a single transformation function, and applies it to 
% each channel. The goal is to compare the effect of individual vs. unified 
% histogram equalization on image quality.
% =========================================================================
clc;
clear;
close
close all;
%% Part a
% Load the image
img = imread("images\flowers.png");

% Ensure the image is in RGB format
if size(img, 3) ~= 3
    img = cat(3, img, img, img)
end

% Display image
figure(1);
imshow(img);
title("Original RGB Image");

%% Part b
% Seperate the RGB chanels
R = img(:,:,1);
G = img(:,:,2);
B = img(:,:,3);

% Compute histograms
[countR, binR] = imhist(R);
[countG, binG] = imhist(G);
[countB, binB] = imhist(B);

% Plot the histograms
figure(2);

subplot(3,1,1);
bar(binR, countR, "Red");
title("Histogram of Red channel");
xlim([0 255]);

subplot(3,1,2);
bar(binG, countG, "green");
title("Histogram of Green channel");
xlim([0 255]);

subplot(3,1,3);
bar(binB, countB, "blue");
title("Histogram of Blue channel");
xlim([0 255]);

%% Part c and d




