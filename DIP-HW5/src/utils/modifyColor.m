function output = modifyColor(img, colorType, effect)
    img = double(img);  
    R = img(:,:,1);
    G = img(:,:,2);
    B = img(:,:,3);

    switch lower(colorType)
        case 'cyan'
            C = 255 - R;
            change = 40;
            if strcmp(effect, 'weakness')
                C = max(C - change, 0);
            else
                C = min(C + change, 255);
            end
            R = 255 - C;

        case 'magenta'
            M = 255 - G;
            change = 40;
            if strcmp(effect, 'weakness')
                M = max(M - change, 0);
            else
                M = min(M + change, 255);
            end
            G = 255 - M;

        case 'yellow'
            Y = 255 - B;
            change = 40;
            if strcmp(effect, 'weakness')
                Y = max(Y - change, 0);
            else
                Y = min(Y + change, 255);
            end
            B = 255 - Y;

        case 'black'
            K = min(min(R, G), B);
            change = 30;
            if strcmp(effect, 'weakness')
                K = max(K - change, 0);
            else
                K = min(K + change, 255);
            end
            % Apply same change to R,G,B
            scale = K ./ (min(min(R, G), B) + 1e-3);
            R = R .* scale;
            G = G .* scale;
            B = B .* scale;

        otherwise
            error('Invalid color type.');
    end

    % Recombine
    output = uint8(cat(3, R, G, B));
end
