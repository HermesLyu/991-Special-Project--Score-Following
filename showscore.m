function showscore(t, tmid, step, seg, speed, midlength)
while t < midlength
    if path(2, seg) <= t < path(2, seg+1)
        axis([tmid-10 tmid+10 30 95])
        %patch([tmid-10 tmid+10 tmid+10 tmid-10], [95 95 30 30], 'g') %draw the middle square
        %rectangle('Position', [tmid-2 tmid+2 30 95])
%         tmid = tmid + step*speed(seg);
%         t = t + step;
    else
%         seg = seg+1;
        t = path(2, seg);
        tmid = path(1, seg);
        axis([tmid-10 tmid+10 30 95])
%         tmid = tmid + step*speed(seg);
%         t = t + step;
    end
%pause(step); %pause for 0.5 sec
end
end