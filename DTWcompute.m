    %for 
    DTW = zeros(length(transmid)+1, length(transwav)+1);
        DTW(1, :) = Inf;
    %for 
        DTW(:, 1) = Inf;
    DTW(1, 1) = 0;
map= zeros(size(DTW, 1), size(DTW, 2), 2);
transwav2 = transwav(2, :)/max(transwav(2, :));
transmid2 = transmid(2, :)/max(transmid(2, :));
    for x = 3:length(transwav)+1; %start from 2,2 because DTW starts with 1, 1
        for y = 3:length(transmid)+1;
            cost = abs(transwav2(x-1) - transmid2(y-1));
            DTW(y, x) = cost + min([DTW(y-2, x-1  ),    % insertion
                                        DTW(y -1 , x-2),    % deletion
                                        DTW(y-1, x-1)]) ;   % match
            [C, I] = min([DTW(y-1, x  ),DTW(y  , x-1),DTW(y-1, x-1)]);
            if I == 1 
                map(y, x, 1) = y-1;
                map(y, x, 2) = x;
            elseif I == 2
                map(y, x, 1) = y;
                map(y, x, 2) = x-1;
            elseif I == 3
                map(y, x, 1) = y-1;
                map(y, x, 2) = x-1;
                
            end
   
        end
    end
    map = map-1;
    map = map(2:end, 2:end, :);
    DTW = DTW(2:end, 2:end);
    DTW1 = DTW/max(max(DTW));
    imshow(DTW1, 'InitialMagnification', 'fit')
    set(gca,'YDir','normal')
    xlabel('wav')
    ylabel('mid')
    hold on;
    
    bestpath = DTWfindpath(map, [size(map, 1); size(map, 2)]);
    plot(bestpath(2, :), bestpath(1, :), 'ro-')
    
