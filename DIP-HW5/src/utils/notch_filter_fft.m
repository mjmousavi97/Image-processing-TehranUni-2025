function denoised_img = notch_filter_fft(input_img, notch_coords, notch_size)
    % Convert image to double for processing
    img_d = double(input_img);

    % Get image size
    [M, N] = size(img_d);

    % Compute the 2D FFT and shift the zero-frequency to the center
    F = fft2(img_d);
    F_shift = fftshift(F);

    % Create a notch mask (initialize to 1 = pass all frequencies)
    mask = ones(M, N);

    % Loop through all user-defined notch coordinates
    for i = 1:size(notch_coords, 1)
        cx = notch_coords(i,1);  % x (column) coordinate
        cy = notch_coords(i,2);  % y (row) coordinate

        % Zero out a square area around each notch coordinate
        mask(max(1,cy-notch_size):min(M,cy+notch_size), ...
             max(1,cx-notch_size):min(N,cx+notch_size)) = 0;
    end

    % Apply the mask to the shifted FFT
    F_filtered = F_shift .* mask;

    % Inverse FFT to get the filtered image
    F_ishift = ifftshift(F_filtered);
    img_filtered = real(ifft2(F_ishift));

    % Normalize and convert back to uint8
    img_filtered = mat2gray(img_filtered);  % Normalize to [0,1]
    denoised_img = im2uint8(img_filtered);  % Convert to 8-bit image
end
