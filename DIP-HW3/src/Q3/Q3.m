% ---------------------------------------------------------------
% Problem 3 – Frequency Domain Filtering: LPF & HPF Analysis
% ---------------------------------------------------------------
% This script applies different frequency domain filters (Ideal, 
% Butterworth, Gaussian) to an input image and visualizes both 
% the filtered results and their frequency responses.
%
% Steps:
% 1. Load the input image 'char.tif'.
% 2. Define cutoff frequencies (D0) and Butterworth order (n).
% 3. For each filter type:
%    - Apply Low-Pass Filter (LPF) using filter_function.
%    - Apply High-Pass Filter (HPF) using filter_function.
% 4. Display the filtered images in separate figures for LPF 
%    and HPF results.
% 5. Display the corresponding frequency responses to compare 
%    how each filter and cutoff frequency affects the image 
%    spectrum.
% ---------------------------------------------------------------
clc;
clear;
close all;
%%
addpath(fullfile(pwd, 'src', 'utils'));

% Read the image
image_path = 'data/images/q3/char.tif';
char_img = imread(image_path);

% Define cutoff frequencies
D0_values = [15, 30, 50, 150, 400];
n = 2; % Butterworth order

%% Ideal filter
% Initialize figures
figure;
sgtitle('Ideal Low-Pass Filtered Images');

figure;
sgtitle('Ideal High-Pass Filtered Images');

figure;
sgtitle('Frequency Responses - Ideal Filters');

% Apply Ideal Filters
for i = 1:length(D0_values)
    D0 = D0_values(i);
    
    % Apply Ideal Low-Pass Filter
    [filtered_lpf, response_lpf] = filter_function(char_img, 'lpf', 'ideal', D0, n);
    
    % Apply Ideal High-Pass Filter
    [filtered_hpf, response_hpf] = filter_function(char_img, 'hpf', 'ideal', D0, n);
    
    % Display LPF results
    figure(1);
    subplot(2, length(D0_values), i);
    imshow(filtered_lpf, []);
    title(['LPF D0=', num2str(D0)]);
    
    % Display HPF results
    figure(2);
    subplot(2, length(D0_values), i);
    imshow(filtered_hpf, []);
    title(['HPF D0=', num2str(D0)]);
    
    % Display frequency response
    figure(3);
    subplot(2, length(D0_values), i);
    imshow(response_lpf, []);
    title(['LPF D0=', num2str(D0)]);
    
    subplot(2, length(D0_values), i + length(D0_values));
    imshow(response_hpf, []);
    title(['HPF D0=', num2str(D0)]);
end

%% Butterworth Filter
figure;
sgtitle('Butterworth Low-Pass Filtered Images');

figure;
sgtitle('Butterworth High-Pass Filtered Images');

figure;
sgtitle('Frequency Responses - Butterworth Filters');

for i = 1:length(D0_values)
    D0 = D0_values(i);
    
    % Apply Butterworth Low-Pass Filter
    [filtered_lpf, response_lpf] = filter_function(char_img, 'lpf', 'butterworth', D0, n);
    
    % Apply Butterworth High-Pass Filter
    [filtered_hpf, response_hpf] = filter_function(char_img, 'hpf', 'butterworth', D0, n);
    
    % Display LPF results
    figure(4);
    subplot(2, length(D0_values), i);
    imshow(filtered_lpf, []);
    title(['LPF D0=', num2str(D0)]);
    
    % Display HPF results
    figure(5);
    subplot(2, length(D0_values), i);
    imshow(filtered_hpf, []);
    title(['HPF D0=', num2str(D0)]);
    
    % Display frequency response
    figure(6);
    subplot(2, length(D0_values), i);
    imshow(response_lpf, []);
    title(['LPF D0=', num2str(D0)]);
    
    subplot(2, length(D0_values), i + length(D0_values));
    imshow(response_hpf, []);
    title(['HPF D0=', num2str(D0)]);
end

%% Gaussian Filter
figure;
sgtitle('Gaussian Low-Pass Filtered Images');

figure;
sgtitle('Gaussian High-Pass Filtered Images');

figure;
sgtitle('Frequency Responses - Gaussian Filters');

for i = 1:length(D0_values)
    D0 = D0_values(i);
    
    % Apply Gaussian Low-Pass Filter
    [filtered_lpf, response_lpf] = filter_function(char_img, 'lpf', 'gaussian', D0, n);
    
    % Apply Gaussian High-Pass Filter
    [filtered_hpf, response_hpf] = filter_function(char_img, 'hpf', 'gaussian', D0, n);
    
    % Display LPF results
    figure(7);
    subplot(2, length(D0_values), i);
    imshow(filtered_lpf, []);
    title(['LPF D0=', num2str(D0)]);
    
    % Display HPF results
    figure(8);
    subplot(2, length(D0_values), i);
    imshow(filtered_hpf, []);
    title(['HPF D0=', num2str(D0)]);
    
    % Display frequency response
    figure(9);
    subplot(2, length(D0_values), i);
    imshow(response_lpf, []);
    title(['LPF D0=', num2str(D0)]);
    
    subplot(2, length(D0_values), i + length(D0_values));
    imshow(response_hpf, []);
    title(['HPF D0=', num2str(D0)]);
end