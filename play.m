% t = 0;
% tmid = 0;
% step = 1;
% seg = 1; %segment number = index number of path and speed
% speedtemp = path(:, 1:end-1)-path(:, 2:end); %diff
% speed = speedtemp(1, :)/speedtemp(2, :); %find the speed (mid/wav = tmid/t) for each segment
% midlength = max(mid(:, 6));

pianoroll(mid, 'sec')

%wavplay(wav, fs) %play the wave
speedtemp = path(:, 1:end-1)-path(:, 2:end) %diff
speed = speedtemp(1, :)./speedtemp(2, :) %find the speed (mid/wav = tmid/t) for each segment
midlength = max(mid(:, 6));


ud = struct('t', 0, 'tmid', 0,  'step',1, 'seg', 1, 'speed', speed, 'midlength', midlength, 'path', path) ;



t = 0;
tim = timer('ExecutionMode','fixedRate', 'BusyMode','drop','Period',1,'TimerFcn',@showscore ,'UserData',ud)
% set(tim,'UserData',ud);
%set(tim,'ExecutionMode','fixedRate','BusyMode','drop','Period',1, 'TimerFcn', display(t); t = t+1);
% while t < max(mid(:, 6))
%     if path(2, seg) <= t < path(2, seg+1)
%         axis([tmid-10 tmid+10 30 95])
%         %patch([tmid-10 tmid+10 tmid+10 tmid-10], [95 95 30 30], 'g') %draw the middle square
%         %rectangle('Position', [tmid-2 tmid+2 30 95])
%         tmid = tmid + step*speed(seg);
%         t = t + step;
%     else
%         seg = seg+1;
%         t = path(2, seg);
%         tmid = path(1, seg);
%         axis([tmid-10 tmid+10 30 95])
%         tmid = tmid + step*speed(seg);
%         t = t + step;
%     end
% %pause(step); %pause for 0.5 sec
% end
% t = 0;
% tmid = 0;
% step = 1;
% seg = 1; %segment number = index number of path and speed



start(tim);
