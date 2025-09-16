function stats = compute_statistical_texture(img)
% Calculate some basic texture stats from a grayscale image

I = double(img);   % convert to double
I = I(:);          % make it a vector

L = 256;           % number of gray levels

% basic stats
mean_val = mean(I);
var_val = var(I);
skew_val = skewness(I);
kurt_val = kurtosis(I);

% smoothness
smooth_val = 1 - (1 / (1 + var_val));

% histogram & probabilities
p = histcounts(I, 0:L) / numel(I);

% texture features
uniformity_val = sum(p.^2);
entropy_val = -sum(p(p>0) .* log2(p(p>0)));

% pack all into one row
stats = [mean_val, var_val, skew_val, kurt_val, smooth_val, uniformity_val, entropy_val];

end
