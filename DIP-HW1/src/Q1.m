% ---------------------------------------------------------------
% Problem 1 – Introduction to Digital Image Processing in MATLAB
% ---------------------------------------------------------------
% a. Read an RGB image ("lenna_rgb.png") using imread.
% b. Display the image using imshow.
% c. Convert the image to grayscale with rgb2gray and display it.
% d. Convert the grayscale image to double precision using im2double 
%    and discuss the differences.
% e. Save the double image in JPEG format.
% f. Resize (scale) the grayscale image by 5x, 1/2, and 1/4,
%    then observe the effect of spatial resolution reduction.
% g. Plot the pixel intensity values of the 150th scan line of the 
%    grayscale image (like Figure 2.16 in the textbook).
% ----------------------------------------------------------------
clc;
clear;
close all;
%%  Part a to c
file_path = 'data/Images/lenna_rgb.png';

% To read the image using imread
lenna_rgb = imread(file_path);

% convert the image to grayscale
gray_lenna_rgb = rgb2gray(lenna_rgb);

figure(1);
subplot(1,2,1);
imshow(lenna_rgb)
axis equal;
title('Lenna rgb image');

subplot(1,2,2);
imshow(gray_lenna_rgb);
axis equal;
title('Grayscale lenna image');

%% Part d and e:
double_lenna_rgb = im2double(gray_lenna_rgb);

figure(2);
subplot(1,2,1);
imshow(gray_lenna_rgb);
axis equal;
title('Grayscale lenna image');

subplot(1,2,2);
imshow(double_lenna_rgb);
axis equal;
title('Converted gray scale to double');

fprintf('Original Grayscale (uint8): Min = %d, Max = %d\n', min(gray_lenna_rgb(:)), max(gray_lenna_rgb(:)));
fprintf('Converted Grayscale (double): Min = %.2f, Max = %.2f\n', min(double_lenna_rgb(:)), max(double_lenna_rgb(:)));

output_file = 'results/lenna_rgb_double.jpg';
imwrite(double_lenna_rgb, output_file);
fprintf('Image saved successfully as %s\n', output_file);

%% Part f:
scale_factor = [5, 1/2, 1/4];

figure(3);
subplot(2,2,1);
imshow(gray_lenna_rgb);
axis equal;
title('Origin Grayscale Image');

for i = 1:length(scale_factor)
    resized_image = imresize(gray_lenna_rgb, scale_factor(i), 'bicubic');
    subplot(2,2,i+1);
    imshow(resized_image);
    title(sprintf('Scale: %.2f', scale_factor(i)));
end

%% Part g:
line_number = 150;

scan_line = gray_lenna_rgb(line_number, :);

figure(4);
plot(scan_line);
title(sprintf('Scan Line at %dth Line', line_number));
xlabel('Pixel Index');
ylabel('Intensity Value');
grid on;

