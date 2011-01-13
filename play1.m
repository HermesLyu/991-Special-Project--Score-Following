pianoroll(mid, 'sec')

%wavplay(wav, fs) %play the wave
wavlength = length(wav)/fs;
midlength = max(mid(:, 6)); % length of midi in sec
path
path = [path, [midlength; wavlength]]
speedtemp = path(:, 1:end-1)-path(:, 2:end) %diff
%speedtemp = [speedtemp, [wavlength; midlength]];
speed = speedtemp(1, :)./speedtemp(2, :) 

t = 0;
tmid = 0;
step = 0.5;
seg = 1;
mov = [];
while tmid < midlength
    if seg < length(speed)
       if path(2, seg) <= t && t < path(2, seg+1) %during const speed period
          axis([tmid-10 tmid+10 30 95])
            %patch([tmid-10 tmid+10 tmid+10 tmid-10], [95 95 30 30], 'g') %draw the middle square
            %rectangle('Position', [tmid-2 tmid+2 30 95])
             tmid = tmid + step*speed(seg); 
             t = t + step;
             mov = [mov getframe];
       else  
          seg = seg+1;
          t = path(2, seg); %meet speed change point
          tmid = path(1, seg);
          axis([tmid-10 tmid+10 30 95])
          tmid = tmid + step*speed(seg);
          t = t + step;;
          mov = [mov getframe];
       end
    elseif seg == length(speed)
        axis([tmid-10 tmid+10 30 95])
        %patch([tmid-10 tmid+10 tmid+10 tmid-10], [95 95 30 30], 'g') %draw the middle square
       %rectangle('Position', [tmid-2 tmid+2 30 95])
        tmid = tmid + step*speed(seg); 
        t = t + step;
        mov = [mov getframe];
    end
   
%pause(step); %pause for 0.5 sec

end
movie(mov, 1, 1/step)
movie2avi(mov, 'movie.avi', 'fps', 1/step)