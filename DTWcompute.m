    %for 
    DTW = zeros(length(transmid)+1, length(transwav)+1);
        DTW(1, :) = Inf;
    %for 
        DTW(:, 1) = Inf;
    DTW(1, 1) = 0;
path = [1;1];

    for x = 2:length(transwav)+1; %start from 2,2 because DTW starts with 1, 1
        for y = 2:length(transmid)+1;
            cost = abs(transwav(2, x-1) - transmid(2, y-1));
            DTW(y, x) = cost + min([DTW(y-1, x  ),    % insertion
                                        DTW(y  , x-1),    % deletion
                                        DTW(y-1, x-1)]) ;   % match
            [C, I] = min([DTW(y-1, x  ),DTW(y  , x-1),DTW(y-1, x-1)]);
            if I == 1 
                path = [path,[y-1; x]];
            elseif I == 2
                path = [path,[y; x-1]];
            elseif I == 3
                path = [path, [y-1; x-1]];
            end
   
        end
    end
    path = path-1;
    DTW = DTW(2:end, 2:end)
    DTW1 = DTW/max(max(DTW));
    imshow(DTW1, 'InitialMagnification', 'fit')
    set(gca,'YDir','normal')
    
    
