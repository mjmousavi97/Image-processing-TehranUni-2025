function filtered_F = apply_multiple_notch_filters(F_shifted, F_size, notches, radius)
    cols = F_size(1);
    rows = F_size(2);
    notch_filter = ones(cols, rows); 
    for i = 1:size(notches, 1)
        notch_u = notches(i, 1);
        notch_v = notches(i, 2);
        
        for u = 1:cols
            for v = 1:rows
                if (u - notch_u)^2 + (v - notch_v)^2 <= radius^2
                    notch_filter(u, v) = 0;  
                end
            end
        end
    end
    
    filtered_F = F_shifted .* notch_filter; 
end
