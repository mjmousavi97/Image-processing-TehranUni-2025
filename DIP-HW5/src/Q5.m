% =========================================================================
% Title: Pseudo Coloring with Intensity Slicing
% Description:
% This script demonstrates the use of pseudo-coloring through intensity slicing.
% The grayscale image "phantom.tif" is loaded and analyzed to determine its
% intensity distribution. The intensity range is divided into 5 intervals, and
% each interval is assigned a distinct color. The pseudo-colored image is then
% displayed alongside the original grayscale image for visual comparison.
% =========================================================================
clc;
clear;
close all;
%% Part a and b
% Load the image
phantom_img = imread("images\phantom.tif");

% Plot the histogram of the image
[counts, bins] = imhist(phantom_img);

figure(1);
bar(bins, counts);
set(gca, 'YScale', 'log');  % Logarithmic scale for Y-axis
title('Histogram of the Image');
xlabel('Intensity Value');
ylabel('Log(Pixel Count)');
xlim([0 255]);  % Limit x-axis to standard grayscale range
ylim([0 max(counts)*1.1]);  % Add some space above the tallest bar

%% Part c and d
% Define 5 arbitrary RGB colors (in [R G B] format, values from 0 to 255)
colors = [
    0,   0,   0;      % Black
      0, 255,   0;    % Green
      0,   0, 255;    % Blue
    255, 255,   0;    % Yellow
    255,   0, 255     % Magenta
];

% Convert grayscale image to double for processing
phantom_double = double(phantom_img);

% Get image size
[rows, cols] = size(phantom_img);

% Initialize a color image (RGB)
pseudo_img = zeros(rows, cols, 3, 'uint8');

% Define intensity breakpoints for 5 intervals (assuming range 0-255)
breaks = linspace(0, 142, 6); % gives 6 points: [0 51.2 102.4 153.6 204.8 256]

% Assign colors based on intensity slicing
for i = 1:5
    mask = (phantom_double >= breaks(i)) & (phantom_double < breaks(i+1));
    for c = 1:3
        channel = pseudo_img(:,:,c);
        channel(mask) = colors(i,c);
        pseudo_img(:,:,c) = channel;
    end
end

% Display the pseudo-colored image
figure(2);

subplot(1,2,1);
imshow(pseudo_img);
title('Pseudo-Colored Image with 5 Intensity Slices');

subplot(1,2,2);
imshow(phantom_img);
title('Original Image')
