function [H, S, I] = rgb2hsi_custom(img_rgb)
% Convert to double and normalize to [0,1]
img = double(img_rgb);

R = img(:,:,1) / 255;
G = img(:,:,2) / 255;
B = img(:,:,3) / 255;

% Intensity
I = (R + G + B) / 3;

% Saturation
min_rgb = min(min(R, G), B);
sum_rgb = R + G + B;
S = 1 - (3 .* min_rgb ./ (sum_rgb + eps));

% Hue calculation
num = 0.5 .* ((R - G) + (R - B)) ;
den = sqrt((R - G).^2 + (R - B).*(G - B)) + eps;
theta = acos(num ./ den);

H = theta; % Default when B <= G
H(B > G) = 2*pi - H(B > G);

H = H / (2 * pi); % Normalize to [0,1]

% Clip values just in case (due to floating point)
H = max(0, min(1, H));
S = max(0, min(1, S));
I = max(0, min(1, I));

end