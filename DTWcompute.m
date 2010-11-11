    %for 
    DTW = zeros(length(transmid)+1, length(transwav)+1);
        DTW(1, :) = Inf;
    %for 
        DTW(:, 1) = Inf;
    DTW(1, 1) = 0;
map= zeros(size(DTW, 1), size(DTW, 2), 2);
transwav2 = transwav(2, :)/max(transwav(2, :));
transmid2 = transmid(2, :)/max(transmid(2, :));
    for x = 2:length(transwav)+1; %start from 2,2 because DTW starts with 1, 1
        for y = 2:length(transmid)+1;
            cost = abs(transwav2(x-1) - transmid2(y-1));
            DTW(y, x) = cost + min([DTW(y-1, x  ),    % insertion
                                        DTW(y  , x-1),    % deletion
                                        DTW(y-1, x-1)]) ;   % match
            [C, I] = min([DTW(y-1, x  ),DTW(y  , x-1),DTW(y-1, x-1)]);
            if I == 1 
                DTWmap(y, x, 1) = y-1;
                DTWmap(y, x, 2) = x;
            elseif I == 2
                DTWmap(y, x, 1) = y;
                DTWmap(y, x, 2) = x-1;
            elseif I == 3
                DTWmap(y, x, 1) = y-1;
                DTWmap(y, x, 2) = x-1;
                
            end
   
        end
    end
    DTWmap = DTWmap-1;
    DTWmap = DTWmap(2:end, 2:end, :);
    DTW = DTW(2:end, 2:end);
    DTW1 = DTW/max(max(DTW));
    imshow(DTW1, 'InitialMagnification', 'fit')
    set(gca,'YDir','normal')
    xlabel('wav')
    ylabel('mid')
    hold on;
    
    bestpath = DTWfindpath(DTWmap, [size(DTWmap, 1); size(DTWmap, 2)]);
    plot(bestpath(2, :), bestpath(1, :), 'ro-')
    for n = 2:length(bestpath) %start from 2 to avoid 0, 0
        path(1, n) = transmid(1, bestpath(1, n));
        path(2, n) = transwav(1, bestpath(2, n));
    end
    path = path.*resolution;
figure(2)
imshow(map1,'XData',[0 size(map1,2)*resolution],'YData', [0 size(map1,1)*resolution]); % scale the axis
set(gca,'YDir','normal') %reverse y-axis
hold on;
axis on;
ylabel('midi')
xlabel('wav')
plot([0, size(map1, 2)], [0, size(map1, 1)])

plot(path(1, :), path(2, :), 'ro-')

hold off;

