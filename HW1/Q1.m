clc;
clear;
close all;

%% Question 1 - Here, we have an example to get familiar with MATLAB for Digital Image Processing- Part a to c
file_path = 'images/lenna_rgb.png';

% To read the image using imread
lenna_rgb = imread(file_path);

% To display the image using imshow
figure;
imshow(lenna_rgb);
title('Lenna rgb image');

%convert the image to grayscale
gray_lenna_rgb = rgb2gray(lenna_rgb);

figure;
subplot(1,2, 1);
imshow(lenna_rgb)
axis equal;
title('Lenna rgb image');

subplot(1, 2, 2);
imshow(gray_lenna_rgb);
axis equal;
title('Grayscale lenna image');

%% Part d and e:
double_lenna_rgb = im2double(gray_lenna_rgb);

figure;
subplot(1, 2, 1);
imshow(gray_lenna_rgb);
axis equal;
title('Grayscale lenna image');

subplot(1, 2, 2);
imshow(double_lenna_rgb);
axis equal;
title('Converted gray scale to double');

fprintf('Original Grayscale (uint8): Min = %d, Max = %d\n', min(gray_lenna_rgb(:)), max(gray_lenna_rgb(:)));
fprintf('Converted Grayscale (double): Min = %.2f, Max = %.2f\n', min(double_lenna_rgb(:)), max(double_lenna_rgb(:)));

output_file = 'lenna_rgb_double.jpg';

imwrite(double_lenna_rgb, output_file);
fprintf('Image saved successfully as %s\n', output_file);

%% Part f:
scale_factor = [5, 1/2, 1/4];

figure;
subplot(2, 2, 1);
imshow(gray_lenna_rgb);
axis equal;
title('Origin Grayscale Image');

for i = 1:length(scale_factor)
    resized_image = imresize(gray_lenna_rgb, scale_factor(i));
    subplot(2, 2, i+1);
    imshow(resized_image);
    title(sprintf('Scale: %.2f', scale_factor(i)));
end

%% Part g:
line_number = 150;

scan_line = gray_lenna_rgb(line_number, :);

figure;
plot(scan_line);
title('Scan Line at 150th Line');
xlabel('Pixel Index');
ylabel('Intensity Value');
grid on;

