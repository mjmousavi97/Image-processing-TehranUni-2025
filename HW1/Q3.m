clc;
clear;
close all;
%% Geometric Transformations without Built-in Functions

% In this problem, we will load the "T.tif" image and apply four
% transformations: Scaling, Rotation, Translation, and Shear using 
% affine transformation matrices. The goal is to implement these
% transformations without using built-in MATLAB functions such as
% imresize, imrotate, imtranslate, and imshear.

% Load the image
img_path = 'Images/T.tif';
T_img = imread(img_path);

% Display the original image
figure;
imshow(T_img);
title('Original Image');

%% Scaling Transformation Using affine2d func.

% T-scale = [s_x, 0, 0; 0, s_y, 0; 0, 0, 1]
% S_x is the scaling factor in the horizontal direction.
% S_y is the scaling factor in the vertical direction.

sx = 0.7;
sy = 1.2;

% Define scaling matrix
T_scale = [sx 0 0; 0 sy 0; 0 0 1];

tform_scale = affine2d(T_scale);
scaled_image = imwarp(T_img, tform_scale);

% Display scaled image
figure;
imshow(scaled_image);
title(sprintf('Scaled Image(sx = %.1f and sy = %.1f)', sx, sy));

%% Rotation Transformation
% Define the rotation angle (in degrees) and convert to radians

theta = 30;  % Rotation angle in degrees
theta_rad = deg2rad(theta);  % Convert to radians

% Define the rotation matrix
T_rotate = [cos(theta_rad), -sin(theta_rad), 0;
            sin(theta_rad), cos(theta_rad), 0;
            0, 0, 1];

% Apply rotation using imwarp
tform_rotate = affine2d(T_rotate);
rotated_img = imwarp(T_img, tform_rotate);

% Display rotated image
figure;
imshow(rotated_img);
title(sprintf('Rotated Image (%.1f degrees)', theta));

%% Translation Transformation
tx = 50;
ty = 50;

translatedImage = translationFunction(T_img, tx, ty);
% Display the translated image
figure;
imshow(translatedImage);
title('Translated Image');

%% Shear Transformation
% Define the shear factors
Shx = 0.3;  % Shear in X direction
Shy = 0.2;  % Shear in Y direction

% Define the shear matrix
T_shear = [1 Shx 0; Shy 1 0; 0 0 1];

% Apply shear using imwarp
tform_shear = affine2d(T_shear);
sheared_img = imwarp(T_img, tform_shear);

% Display sheared image
figure;
imshow(sheared_img);
title(sprintf('Sheared Image (Shx=%.1f, Shy=%.1f)', Shx, Shy));



