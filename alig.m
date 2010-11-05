resolution = 0.25; %unit of each pixel in the map. should multiple of 5
map  = zeros((length(chnumsavg)*timeratemid/resolution), (length(env)*timeratewav/resolution)); %map with midi at y and wav at x,
for x = 1:length(transwav)
    %index = size(map, 1)-round(transwav(1, i)/resolution); %round to int, start from lower left corner
    index = round(transwav(1, x)/resolution);
    if transwav(2, x) > 0
        map(:, index) = map(:, index)+1; %up
    elseif transwav(2, x) < 0
        map(:, index) = map(:, index)-1; %down
    end
end
for y = 1:length(transmid)
    index = round(transmid(1, y)/resolution);
    if transmid(2, y) > 0
        map(index, :) = map(index, :)+1;
    elseif transmid(2, y) < 0
        map(index, :) = map(index, :)-1;
    end
end
aligment = [];
aligment = findpath(1, 1, map, aligment);
aligment = [[0; 0], aligment];
aligment = aligment.*resolution;
map1 = (map+2)/4; %shift and normalize for poltting.

%plot
imshow(map1,'XData',[0 size(map1,2)*resolution],'YData', [0 size(map1,1)*resolution]); % scale the axis
set(gca,'YDir','normal') %reverse y-axis
hold on;
axis on;
ylabel('midi')
xlabel('wav')
%scatter(transwav(1, :), transmid(1, :), 'r')
plot([0, size(map1, 2)], [0, size(map1, 1)])

% [row, col] = find(map1 == 1); %mark 1's
% scatter(col*resolution, row*resolution, 'b')
% 
% [row, col] = find(map1 == 0); %mark 0's
% scatter(col*resolution, row*resolution, 'g')

%scatter(aligment(2, :), aligment(1, :), 'r')
plot(aligment(1, :), aligment(2, :), 'ro-')

hold off;
% p = 0;
% q = 0;
% if map(p)