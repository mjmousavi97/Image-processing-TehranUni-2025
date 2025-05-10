function out = erosion(img, se)
    pad = floor(size(se)/2);
    padded = padarray(img, pad, 0);
    out = false(size(img));
    for i = 1:size(img, 1)
        for j = 1:size(img, 2)
            region = padded(i:i+2*pad(1), j:j+2*pad(2));
            out(i, j) = all(region(se));
        end
    end
end