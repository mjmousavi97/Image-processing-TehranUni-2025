function T = count_transitions(p)
    T = 0;

    for k = 1:length(p)-1
        if p(k) == 0 && p(k+1) == 1
            T = T + 1;
        end
    end

    if p(end) == 0 && p(1) == 1
        T = T + 1;
    end

end