function [filtered_image, filter_response] = filter_function(image, filter_type, kernel_type, D0, n)
    % Convert image to grayscale and double precision if necessary
    if size(image, 3) == 3
        image = rgb2gray(image);
    end
    image = double(image);
    
    % Get image size
    [rows, cols] = size(image);
    u = -floor(rows/2):floor(rows/2)-1;
    v = -floor(cols/2):floor(cols/2)-1;
    [U, V] = meshgrid(v, u);
    D = sqrt(U.^2 + V.^2); % Distance from the center

    % Select the appropriate filter
    switch lower(kernel_type)
        case 'ideal'
            H = double(D <= D0);
        case 'butterworth'
            H = 1 ./ (1 + (D ./ D0).^(2*n)); % Butterworth filter of order n
        case 'gaussian'
            H = exp(-(D.^2) / (2 * D0^2)); % Gaussian LPF
        otherwise
            error('Invalid kernel type. Choose "Ideal", "Butterworth", or "Gaussian".');
    end

    % Convert Low-Pass to High-Pass if needed
    if strcmpi(filter_type, 'hpf')
        H = 1 - H; % HPF is complement of LPF
    elseif ~strcmpi(filter_type, 'lpf')
        error('Invalid filter type. Choose "LPF" (Low-Pass Filter) or "HPF" (High-Pass Filter).');
    end

    % Compute Fourier Transform of the image
    F_image = fft2(image);
    F_shifted = fftshift(F_image);

    % Apply filter in the frequency domain
    F_filtered = F_shifted .* H;

    % Compute the inverse Fourier Transform
    F_unshifted = ifftshift(F_filtered);
    filtered_image = real(ifft2(F_unshifted));

    % Return the filter response for visualization
    filter_response = H;
end
