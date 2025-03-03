clc;
clear;
close all;
%%
image_path = 'Images/watch.tif';
watch_image = imread(image_path);

%shrinking the watch image
imageA_shr=imresize(watch_image,1/5,'nearest');
imageB_shr=imresize(watch_image,1/5,'bilinear');
imageC_shr=imresize(watch_image,1/5,'bicubic');

%zooming the watch image
imageA_zoom=imresize(imageA_shr,5,'nearest');
imageB_zoom=imresize(imageB_shr,5,'bilinear');
imageC_zoom=imresize(imageC_shr,5,'bicubic');

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



