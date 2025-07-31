% --------------------------------------------------------------- 
% Problem 4 – implement some important logical operations
% --------------------------------------------------------------- 
% This script implements basic logical operations on binary images.
% Two 200×200 zero matrices are created, and rectangles of ones are added
% to them at specified locations. Then, logical operations (NOT, AND, OR,
% AND-NOT, XOR) are applied to these binary images using custom functions,
% similar to Figure 2.33 in the textbook.
% --------------------------------------------------------------- 

clc;
clear;
close all;
addpath(genpath('src'));

%% In this section, we want to implement some important logical operations.
% Create two 200x200 arrays filled with zeros
array1 = zeros(200, 200);
array2 = zeros(200, 200);

% Define the rectangle parameters in array1
x_start1 = 20;
y_start1 = 30;
rect_length1 = 80;
rect_height1 = 100;

% Add the rectangle (set the region to 1)
array1(x_start1:x_start1+rect_height1-1, y_start1:y_start1+rect_length1-1) = 1;

% Define the rectangle parameters in array1
x_start2 = 40;
y_start2 = 70;
rect_length2 = 110;
rect_height2 = 90;

% Add the rectangle (set the region to 1)
array2(x_start2:x_start2+rect_height2-1, y_start2:y_start2+rect_length2-1) = 1;

%% NOT
% Display the arrays to verify the rectangle placement
figure(1);
subplot(2,2,1);
imshow(array1);
title('Array 1');

subplot(2,2,2);
imshow(array2);
title('Array 2');

image_not_array1 = logical_not(array1);
image_not_array2 = logical_not(array2);

subplot(2,2,3);
imshow(image_not_array1);
title('Not array 1');

subplot(2,2,4);
imshow(image_not_array2);
title('Not array 2');

%% AND
% Find the border of the rectangles (the edges of the 1's in the arrays)

image_and = logical_and(array1, array2);

figure(2);
subplot(1,3,1);
imshow(array1);
title('Array 1');
subplot(1,3,2);
imshow(array2);
title('Array 2');
subplot(1,3,3);
imshow(image_and);
title('Array 1 AND Array 2');

%% OR
image_or = logical_or(array1, array2);

figure(3);
subplot(1,3,1);
imshow(array1);
title('Array 1');

subplot(1,3,2);
imshow(array2);
title('Array 2');

subplot(1,3,3);
imshow(image_or);
title('Array 1 OR Array 2');

%% AND-NOT
image_and_not = logical_and_not(array1, array2);

figure(4);
subplot(1,3,1);
imshow(array1);
title('Array 1');

subplot(1,3,2);
imshow(array2);
title('Array 2');

subplot(1,3,3);
imshow(image_and_not);
title('Array 1 AND [NOT Array 2]');

%% XOR
figure(5);
image_xor = manual_xor(array1, array2);

subplot(1,3,1);
imshow(array1);
title('Array 1');

subplot(1,3,2);
imshow(array2);
title('Array 2');

subplot(1,3,3);
imshow(image_xor);
title('Array 1 XOR Array 2');