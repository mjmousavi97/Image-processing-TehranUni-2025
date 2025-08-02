% ---------------------------------------------------------------
% Problem 6 - Interpolation Methods for Image Shrinking
% ---------------------------------------------------------------
% Interpolation is used to estimate unknown pixel values based on known ones, 
% especially when resizing images. This script compares three interpolation 
% methods (nearest neighbor, bilinear, and bicubic) for shrinking and 
% re-expanding an image.
%
% a. The image "watch.tif" is first loaded and resized to 1/5 of its 
%    original dimensions using each of the three interpolation techniques.
% b. The shrunken images are then upscaled back to the original size 
%    using the same interpolation method, enabling visual comparison.
%
% The results show clear differences in how each method preserves image 
% details:
% - Nearest neighbor is fast but produces blocky, pixelated results.
% - Bilinear generates smoother images but with slight blurring.
% - Bicubic offers the best visual quality, preserving more detail 
%   with smoother transitions.
%
% This illustrates the trade-off between computational complexity 
% and image quality in different interpolation methods.


clc;
clear;
close all;
%%
image_path = 'data/images/watch.tif';
watch_image = imread(image_path);

%shrinking the watch image
imageA_shr=imresize(watch_image, 1/5, 'nearest');
imageB_shr=imresize(watch_image, 1/5, 'bilinear');
imageC_shr=imresize(watch_image, 1/5, 'bicubic');

%zooming the watch image
imageA_zoom=imresize(imageA_shr, 5, 'nearest');
imageB_zoom=imresize(imageB_shr, 5, 'bilinear');
imageC_zoom=imresize(imageC_shr, 5, 'bicubic');

% show shrinked image
figure(1);

subplot(2,2,1);
imshow(watch_image(:,:,1))
title('Original image');

subplot(2,2,2);
imshow(imageA_shr(:,:,1))
title('nearest neighbour interpolation technique-shrink');

subplot(2,2,3);
imshow(imageB_shr(:,:,1));
title('bilinear interpolation technique-shrink');

subplot(2,2,4);
imshow(imageC_shr(:,:,1));
title('bicubic interpolation technique-shrink');


% show shrinked image convert to original size
figure(2);

subplot(2,2,1);
imshow(watch_image(:,:,1))
title('Original image');

subplot(2,2,2);
imshow(imageA_zoom(:,:,1))
title('nearest neighbour interpolation technique-zoom');

subplot(2,2,3);
imshow(imageB_zoom(:,:,1));
title('bilinear interpolation technique-zoom');

subplot(2,2,4);
imshow(imageC_zoom(:,:,1));
title('bicubic interpolation technique-zoom');



