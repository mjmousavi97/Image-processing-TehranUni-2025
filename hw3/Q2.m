clc;
clear;
close all;
%% This exercise explores the characteristics of the Fourier Transform (FT) and implements a fft2 function in MATLAB
% Part a

% Load the images "woman.tif" and "parrot.tif"
woman_path = 'images/q2/woman.tif';
parrot_path = 'images/q2/parrot.tif';

pic_woman = imread(woman_path);
pic_parrot = imread(parrot_path);

pic_woman = double(pic_woman);
pic_parrot = double(pic_parrot);

% Calculate the Discrete Fourier Transform (DFT) of both images
fft_pic_woman = fft2(pic_woman);
fft_pic_parrot = fft2(pic_parrot);

% Shift zero-frequency component to the cente
fft_pic_woman=fftshift(fft_pic_woman);
fft_pic_parrot=fftshift(fft_pic_parrot);

% Obtain the magnitude (frequency spectrum) and phase angle of the DFTs
mag_woman = abs(fft_pic_woman);
phase_woman = angle(fft_pic_woman);

mag_parrot = abs(fft_pic_parrot);
phase_parrot = angle(fft_pic_parrot);

% Plot the results of each image
figure(1);
subplot(1,3,1), imshow(pic_woman, []), title 'Original pic'
subplot(1,3,2), imshow(log(double(mag_woman)), []), title 'Magnitude'
subplot(1,3,3), imshow(phase_woman, []), title 'Phase'

figure(2);
subplot(1,3,1), imshow(pic_parrot,[]), title 'original pic'
subplot(1,3,2), imshow(log(double(mag_parrot)),[]), title 'Magnitude'
subplot(1,3,3), imshow(phase_parrot,[]), title 'Phase'

%% Part b
R_parrot = real(fft_pic_parrot);
I_parrot = imag(fft_pic_parrot);

phi = atan2(I_parrot, R_parrot);
phi_builtin = angle(fft_pic_parrot);
% Display the phase angle 
figure(3);
subplot(1,3,1), imshow(phi, []), title('Computed Phase Angle')

% Disply the built-in phase angle
subplot(1,3,2), imshow(phi_builtin), title('Matlab Built-in Phase Angle')

% compare the two phase angle
difference = abs(phi - phi_builtin);
subplot(1,3,3), imshow(difference, []), title('Difference Between Computed and Built-in Phase Angle')

%% Part c
% Compute the Fourier Transforms
F_woman = fft2(pic_woman);
F_parrot = fft2(pic_parrot);

% Extract magnitude and phase components
magnitude_woman = abs(F_woman);
phase_woman = angle(F_woman);

magnitude_parrot = abs(F_parrot);
phase_parrot = angle(F_parrot);

% Get sizes
[rows_w, cols_w] = size(pic_woman);
[rows_p, cols_p] = size(pic_parrot);

% Create a zero-padded woman image of size 800x800 
padded_woman = zeros(rows_p, cols_p);

% Calculate center position to insert the original image
start_row = floor((rows_p - rows_w) / 2) + 1;
start_col = floor((cols_p - cols_w) / 2) + 1;
end_row = start_row + rows_w - 1;
end_col = start_col + cols_w - 1;

% Insert the original woman image into the center of the padded image
padded_woman(start_row:end_row, start_col:end_col) = pic_woman;

% Compute Fourier Transform of the zero-padded woman image
F_padded_woman = fft2(padded_woman);

% Extract the phase after zero-padding
padded_phase_woman = angle(F_padded_woman);

% (a) Reconstruction using only the phase angle of the woman image
reconstructed_phase_only = ifft2(exp(1i * phase_woman));

% (b) Reconstruction using frequency spectrum + phase of parrot
reconstructed_parrot_magnitude_phase = ifft2(magnitude_parrot .* exp(1i * phase_parrot));

% (c) Reconstruction using parrot's magnitude and woman's phase
reconstructed_parrot_magnitude_woman_phase = ifft2(magnitude_parrot .* exp(1i * padded_phase_woman));

% Display the results
figure(4);
subplot(2,2,1);
imshow(pic_woman, []);
title('Original Woman Image');

subplot(2,2,2);
imshow(abs(reconstructed_phase_only), []);
title('Reconstructed Using Only Phase Angle of pic_woman');

subplot(2,2,3);
imshow(abs(reconstructed_parrot_magnitude_phase), []);
title('Reconstructed Using Parrot Magnitude & Phase');

subplot(2,2,4);
imshow(abs(reconstructed_parrot_magnitude_woman_phase), []);
title('Reconstructed Using Parrot Magnitude & Woman Phase');

%% Part d
% Scale the image by 1.5x
scale_factor = 1.5;
scaled_pic_parrot = imresize(pic_parrot, scale_factor);

% Get new size after scaling
[rows_s, cols_s] = size(scaled_pic_parrot);

% Create a zero-padded version of the original image, centered in the new frame
padded_pic_parrot = zeros(rows_s, cols_s);

start_row = floor((rows_s - rows_p) / 2) + 1;
start_col = floor((cols_s - cols_p) / 2) + 1;
end_row = start_row + rows_p - 1;
end_col = start_col + cols_p - 1;

padded_pic_parrot(start_row:end_row, start_col:end_col) = pic_parrot;

% Compute the Fourier Transform of both images
F_original = fft2(padded_pic_parrot);
F_scaled = fft2(scaled_pic_parrot);

% Shift for better visualization
F_original_shifted = fftshift(F_original);
F_scaled_shifted = fftshift(F_scaled);

% Compute magnitude spectra (log for better visibility)
magnitude_original = log(1 + abs(F_original_shifted));
magnitude_scaled = log(1 + abs(F_scaled_shifted));

% Display results
figure(5);
subplot(2,2,1);
imshow(pic_parrot, []);
title('Original Image (pic\_parrot)');

subplot(2,2,2);
imshow(scaled_pic_parrot, []);
title('Scaled Image (1.5x)');

subplot(2,2,3);
imshow(magnitude_original, []);
title('Fourier Magnitude - Zero-Padded Original');

subplot(2,2,4);
imshow(magnitude_scaled, []);
title('Fourier Magnitude - Scaled Image (1.5x)');

%% Part e
% Shift parameters (5% of size)
shift_x = round(0.05 * cols_p);
shift_y = round(0.05 * rows_p);

% Apply circular shifting (wrapping around the edges)
shifted_x = circshift(pic_parrot, [0, shift_x]);  % Shift in X direction
shifted_y = circshift(pic_parrot, [shift_y, 0]);  % Shift in Y direction
shifted_xy = circshift(pic_parrot, [shift_y, shift_x]);  % Shift in both X and Y

% Compute Fourier Transform for all images
F_original = fft2(pic_parrot);
F_shifted_x = fft2(shifted_x);
F_shifted_y = fft2(shifted_y);
F_shifted_xy = fft2(shifted_xy);

% Shift for visualization
F_original_shifted = fftshift(F_original);
F_shifted_x_shifted = fftshift(F_shifted_x);
F_shifted_y_shifted = fftshift(F_shifted_y);
F_shifted_xy_shifted = fftshift(F_shifted_xy);

% Compute magnitude spectra
magnitude_original = log(1 + abs(F_original_shifted));
magnitude_x = log(1 + abs(F_shifted_x_shifted));
magnitude_y = log(1 + abs(F_shifted_y_shifted));
magnitude_xy = log(1 + abs(F_shifted_xy_shifted));

% Compute phase spectra
phase_original = angle(F_original_shifted);
phase_x = angle(F_shifted_x_shifted);
phase_y = angle(F_shifted_y_shifted);
phase_xy = angle(F_shifted_xy_shifted);

% Display results
figure(6);

% Original and shifted images
subplot(4,4,1);
imshow(pic_parrot, []);
title('Original Image');

subplot(4,4,2);
imshow(shifted_x, []);
title('Circular Shift in X (5%)');

subplot(4,4,3);
imshow(shifted_y, []);
title('Circular Shift in Y (5%)');

subplot(4,4,4);
imshow(shifted_xy, []);
title('Circular Shift in X-Y (5%)');

% Fourier Magnitude Spectra
subplot(4,4,5);
imshow(magnitude_original, []);
title('Fourier Magnitude - Original');

subplot(4,4,6);
imshow(magnitude_x, []);
title('Fourier Magnitude - Shifted X');

subplot(4,4,7);
imshow(magnitude_y, []);
title('Fourier Magnitude - Shifted Y');

subplot(4,4,8);
imshow(magnitude_xy, []);
title('Fourier Magnitude - Shifted X-Y');

% Fourier Phase Spectra
subplot(4,4,9);
imshow(phase_original, []);
title('Fourier Phase - Original');

subplot(4,4,10);
imshow(phase_x, []);
title('Fourier Phase - Shifted X');

subplot(4,4,11);
imshow(phase_y, []);
title('Fourier Phase - Shifted Y');

subplot(4,4,12);
imshow(phase_xy, []);
title('Fourier Phase - Shifted X-Y');

% Difference in Phase
subplot(4,4,13);
imshow(abs(phase_x - phase_original), []);
title('Phase Difference: X Shift');

subplot(4,4,14);
imshow(abs(phase_y - phase_original), []);
title('Phase Difference: Y Shift');

subplot(4,4,15);
imshow(abs(phase_xy - phase_original), []);
title('Phase Difference: X-Y Shift');

%% Part f
% Ensure both images have the same size
[rows_w, cols_w] = size(pic_woman);
[rows_p, cols_p] = size(pic_parrot);

if rows_w ~= rows_p || cols_w ~= cols_p
    % Resize the parrot image to match woman image size
    pic_parrot = imresize(pic_parrot, [rows_w, cols_w]);
end

% Convert to double
pic_woman = double(pic_woman);
pic_parrot = double(pic_parrot);

% Compute the Fourier Transform of both images
F_woman = fft2(pic_woman);
F_parrot = fft2(pic_parrot);

% Shift zero frequency components to the center
F_woman_shifted = fftshift(F_woman);
F_parrot_shifted = fftshift(F_parrot);

% Replace lower half frequency components
F_combined = F_woman_shifted;
F_combined(floor(rows_w/2):end, :) = F_parrot_shifted(floor(rows_w/2):end, :);

% Shift back the modified Fourier Transform
F_combined_unshifted = ifftshift(F_combined);

% Compute the inverse Fourier Transform
reconstructed_image = ifft2(F_combined_unshifted);
reconstructed_image = abs(reconstructed_image);

% Display the results
figure(7);

subplot(2,3,1);
imshow(pic_woman, []);
title('Original Woman Image');

subplot(2,3,2);
imshow(pic_parrot, []);
title('Original Parrot Image');

subplot(2,3,3);
imshow(log(1 + abs(F_woman_shifted)), []);
title('Fourier Magnitude - Woman');

subplot(2,3,4);
imshow(log(1 + abs(F_parrot_shifted)), []);
title('Fourier Magnitude - Parrot');

subplot(2,3,5);
imshow(log(1 + abs(F_combined)), []);
title('Fourier Magnitude - Combined');

subplot(2,3,6);
imshow(reconstructed_image, []);
title('Reconstructed Image with Parrot Low Frequencies');