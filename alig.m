resolution = 0.25;
map  = zeros((length(chnumsavg)*timeratemid/resolution), (length(env)*timeratewav/resolution)); %map with midi at y and wav at x,
for i = 1:length(transwav)
    %index = size(map, 1)-round(transwav(1, i)/resolution); %round to int, start from lower left corner
    index = round(transwav(1, i)/resolution);
    if transwav(2, i) > 0
        map(:, index) = map(:, index)+1; %up
    elseif transwav(2, i) < 0
        map(:, index) = map(:, index)-1; %down
    end
end
for j = 1:length(transmid)
    index = round(transmid(1, j)/resolution);
    if transmid(2, j) > 0
        map(index, :) = map(index, :)+1;
    elseif transmid(2, j) < 0
        map(index, :) = map(index, :)-1;
    end
end
map1 = (map+2)/4; %shift and normalize for poltting.

%plot
imshow(map1,'XData',[0 size(map1,2)*resolution],'YData', [0 size(map1,1)*resolution]); % scale the axis
set(gca,'YDir','normal') %reverse y-axis
hold on;
axis on;
ylabel('midi')
xlabel('wav')
scatter(transwav(1, :), transmid(1, :), 'r')
plot([0, size(map1, 2)], [0, size(map1, 1)])

[row, col] = find(map1 == 1); %mark 1's
scatter(col*resolution, row*resolution, 'b')

[row, col] = find(map1 == 0); %mark 0's
scatter(col*resolution, row*resolution, 'g')
hold off;
% p = 0;
% q = 0;
% if map(p)