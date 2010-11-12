aligment = [];
aligment = findpath(1, 1, map, aligment);
aligment = [[0; 0], aligment];
aligment = aligment.*resolution;
%map1 = (map+2)/4; %shift and normalize for poltting.
aligment = [[0; 0], aligment];
aligment

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