clc;
clear;
close all;
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

% Display the arrays to verify the rectangle placement
figure;
subplot(2,2,1);
imshow(array1);
title('Array 1 with Rectangle');
subplot(2,2,2);
imshow(array2);
title('Array 2 with Rectangle');

%%
subplot(2,2,3);
imshow(logical_not(array2));