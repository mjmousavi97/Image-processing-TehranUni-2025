function skeleton = my_skeletonize(img)
    % Initialize
    prev = img;
    done = false;

    while ~done
        % Step 1
        marker = false(size(img));
        for i = 2:size(img,1)-1
            for j = 2:size(img,2)-1
                P = getNeighbors(img, i, j);
                p1 = img(i,j);
                if p1 == 1
                    N = sum(P); % Number of non-zero neighbors
                    T = count_transitions(P);
                    if (N >= 2 && N <= 6 && T == 1 && ...
                        P(2)*P(4)*P(6) == 0 && ...
                        P(4)*P(6)*P(8) == 0)
                        marker(i,j) = true;
                    end
                end
            end
        end
        img(marker) = 0;

        % Step 2
        marker = false(size(img));
        for i = 2:size(img,1)-1
            for j = 2:size(img,2)-1
                P = getNeighbors(img, i, j);
                p1 = img(i,j);
                if p1 == 1
                    N = sum(P);
                    T = count_transitions(P);
                    if (N >= 2 && N <= 6 && T == 1 && ...
                        P(2)*P(4)*P(8) == 0 && ...
                        P(2)*P(6)*P(8) == 0)
                        marker(i,j) = true;
                    end
                end
            end
        end
        img(marker) = 0;

        done = isequal(prev, img);
        prev = img;
    end

    skeleton = ~img; % invert back
end