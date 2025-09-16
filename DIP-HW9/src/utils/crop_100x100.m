function region = crop_100x100(I)
% Crop bottom-right 100x100 pixels

[H, W] = size(I);           % get image size
region = I(H-99:H, W-99:W); % extract bottom-right 100x100

end
