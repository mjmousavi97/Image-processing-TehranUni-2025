function print_texture_table(stats, title_str)
% Print texture stats nicely in a table

fprintf('\n======= %s =======\n', title_str);
fprintf('%-10s %10s %10s %12s %12s %12s %12s %10s\n', ...
        'Image', 'Mean', 'Variance', 'Skewness', 'Kurtosis', ...
        'Smoothness', 'Uniformity', 'Entropy');

for i = 1:size(stats,1)
    fprintf('%-10s %10.4f %10.4f %12.4f %12.4f %12.4f %12.4f %10.4f\n', ...
            ['Image ', num2str(i)], stats(i,1), stats(i,2), stats(i,3), ...
            stats(i,4), stats(i,5), stats(i,6), stats(i,7));
end

end
