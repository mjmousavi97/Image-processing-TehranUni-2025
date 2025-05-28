clc;
clear;
close all;
%% Part a
% Load image
img = imread("Images\text.jpg");
img_gray = rgb2gray(img);
bw = imbinarize(img_gray);

% Define structuring element
SE = strel('rectangle', [50 1]);

% Apply erosion
eroded_img = imerode(bw, SE);

% Perform morphological reconstruction by dilation
reconstructed_img = imreconstruct(eroded_img, bw);

figure(1);
subplot(2,2,1); imshow(bw); title('Original Binary Image');         
subplot(2,2,2); imshow(eroded_img); title('After Erosion');         
subplot(2,2,3); imshow(reconstructed_img); title('Reconstruction'); 

%% Part b
% Create Marker Image F 
G = false(size(bw));

% Copy values of I only on border pixels
G(1, :) = bw(1, :);         % Top border
G(end, :) = bw(end, :);     % Bottom border
G(:, 1) = bw(:, 1);         % Left border
G(:, end) = bw(:, end);     % Right border

% Morphological Reconstruction of G under I
reconstructed = imreconstruct(G, bw);

% Subtract reconstruction result from original image 
X = bw & ~reconstructed;

% Display Results
figure(2);
subplot(2,2,1); imshow(bw); title('Original Image (I)');
subplot(2,2,2); imshow(G); title('Marker Image (F)');
subplot(2,2,3); imshow(reconstructed); title('Reconstructed Border Objects');
subplot(2,2,4); imshow(X); title('Border Cleared Image (X)');


%% Part c
% complement of I^c
Ic = ~bw;

% Marker image
F = false(size(bw));

F(1, :) = Ic(1, :);
F(:, 1) = Ic(:, 1);
F(:, end) = Ic(:, end);
F(end, :) = Ic(end, :);

% Morphological Reconstruction of F under Ic
reconstructed = imreconstruct(F, Ic);

% Complement of the result to get H 
H = ~reconstructed;

% Displaying Results
figure(3);
subplot(2,2,1); imshow(bw); title('Original Image (I)');
subplot(2,2,2); imshow(Ic); title('Complement of I (I^c)');
subplot(2,2,3); imshow(F); title('Marker Image (F)');
subplot(2,2,4); imshow(H); title('Hole-Filled Image (H)');