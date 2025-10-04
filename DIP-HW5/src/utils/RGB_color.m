img = imread('images\cars.jpg'); 
img = uint8(img); 

imshow(img);
title('Click on a pixel to get RGB values');

[x, y] = ginput(1); 
x = round(x); y = round(y); 

R = img(y, x, 1);
G = img(y, x, 2);
B = img(y, x, 3);

fprintf('Selected pixel at (x=%d, y=%d):\n', x, y);
fprintf('R = %d, G = %d, B = %d\n', R, G, B);
