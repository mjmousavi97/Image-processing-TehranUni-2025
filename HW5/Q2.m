% =========================================================================
% Title: Histogram Matching for Colorization:
% Description:
% Match grayscale image histogram to RGB reference image to add color.
% Uses 'dessert.jpg' (grayscale) and 'pencils.jpeg' (RGB).
% Displays histograms to evaluate results.
% =========================================================================
clc;
clear;
close all;
%% Part b
% Load images
gray_img = imread("images\dessert.jpg");
ref_img = imread("images\pencils.jpeg");

% Convert gray image(RGB) to grayscale
if size(gray_img, 3) == 3
    gray_img = rgb2gray(gray_img);
end

% Resize reference image(177*284*3) to match grayscale image size(408*612*3)
ref_img = imresize(ref_img, size(gray_img));

% Initialize output image
matched_img = zeros([size(gray_img), 3], 'uint8');

% Apply histogram matching channel-by-channel
for channel = 1:3
    ref_channel = ref_img(:,:,channel);
    matched_img(:,:,channel) = imhistmatch(gray_img, ref_channel);
end

% Show results
figure(1);
subplot(1,3,1); imshow(gray_img); title('Original Grayscale');
subplot(1,3,2); imshow(ref_img); title('Color Reference');
subplot(1,3,3); imshow(matched_img); title('Colorized by Histogram Matching');

%% Part c
figure(2);

% (2-4) Histograms of the reference image (RGB channels)
subplot(3,3,1);
imhist(ref_img(:,:,1));
title('Reference Red Channel');

subplot(3,3,2);
imhist(ref_img(:,:,2));
title('Reference Green Channel');

subplot(3,3,3);
imhist(ref_img(:,:,3));
title('Reference Blue Channel');

% (5-7) Histograms of the matched image (RGB channels)
subplot(3,3,4);
imhist(matched_img(:,:,1));
title('Matched Red Channel');

subplot(3,3,5);
imhist(matched_img(:,:,2));
title('Matched Green Channel');

subplot(3,3,6);
imhist(matched_img(:,:,3));
title('Matched Blue Channel');

% Display images for reference
subplot(3,3,7);
imshow(ref_img);
title('Reference Image');

subplot(3,3,8);
imshow(matched_img);
title('Matched Image');

% Histogram of the grayscale image
subplot(3,3,9);
imhist(gray_img);
title('Gray Image Histogram');
















