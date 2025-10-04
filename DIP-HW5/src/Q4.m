% =========================================================================
% Title: RGB to HSI Conversion and Image Processing
% Description:
%
% This code implements manual RGB to normalized HSI conversion.
% Then, it applies this to 'cars.jpg' to:
% (1) Extract and display H, S, I components,
% (2) Compare with MATLAB's built-in functions,
% (3) Detect yellow cars and change them to purple using HSI manipulation.
% 
% Note: No built-in RGB to HSI conversion functions are used.
% =========================================================================
%% Part b
% Load the image
RGB = imread('images\cars.jpg');

% Convert RGB to HSI
[H, S, I] = rgb2hsi_custom(RGB);

% Display results
figure(1);
subplot(1, 3, 1);
imshow(H);
title('Hue');

subplot(1, 3, 2);
imshow(S);
title('Saturation');

subplot(1, 3, 3);
imshow(I);
title('Intensity');

%% Par c
% MATLAB's HSV conversion
HSV = rgb2hsv(im2double(RGB));
H_matlab = HSV(:,:,1);
S_matlab = HSV(:,:,2);
I_matlab = HSV(:,:,3);  

% Display comparison
figure(2);
subplot(3, 2, 1); imshow(H); title('Custom Hue');
subplot(3, 2, 2); imshow(H_matlab); title('MATLAB Hue');

subplot(3, 2, 3); imshow(S); title('Custom Saturation');
subplot(3, 2, 4); imshow(S_matlab); title('MATLAB Saturation');

subplot(3, 2, 5); imshow(I); title('Custom Intensity');
subplot(3, 2, 6); imshow(I_matlab); title('MATLAB Value');

%% Part d
% Load the image
car_img = imread("images\cars.jpg");

% Convert to HSI using your custom function
[H, S, I] = rgb2hsi_custom(car_img);

% Create mask for yellow (Hue ~ 0.12-0.17, Saturation > 0.4, Intensity > 0.4)
% mask = (H > 0.12 & H < 0.17) & (S > 0.4) & (I > 0.4);
% mask = (H > 0.1 & H < 0.19) & (S > 0.22) & (I > 0.18);
mask = (H >= 0.10 & H <= 0.18) & (S > 0.25) & (I > 0.15);

% Initialize output image
img_purple = car_img;

% Apply purple color (R=128, G=0, B=128) where mask = 1
[m, n] = size(mask);
for i = 1:m
    for j = 1:n
        if mask(i,j)
            img_purple(i,j,1) = 128;  % R
            img_purple(i,j,2) = 0;    % G
            img_purple(i,j,3) = 128;  % B
        end
    end
end

% Display results
figure(3);
subplot(1,3,1);
imshow(car_img);
title('Original Image');

subplot(1,3,2);
imshow(mask);
title('Yellow Mask (HSI)');

subplot(1,3,3);
imshow(img_purple);
title('Yellow Cars → Purple');


































