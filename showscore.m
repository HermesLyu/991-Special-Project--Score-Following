function showscore(obj, event, t)
%disp(event.Data.time)
ud=obj.UserData;
    t = ud.t;
    tmid = ud.tmid;
    step = ud.step;
    seg = ud.seg;
    speed = ud.speed;
    midlength = ud.midlength;
    path = ud.path;   
if tmid < midlength
    if seg < length(speed)
       if path(2, seg) <= t && t < path(2, seg+1) %during const speed period
          axis([tmid-10 tmid+10 30 95])
            %patch([tmid-10 tmid+10 tmid+10 tmid-10], [95 95 30 30], 'g') %draw the middle square
            %rectangle('Position', [tmid-2 tmid+2 30 95])
             ud.tmid = tmid + step*speed(seg); 
             ud.t = t + step;
             set(obj,'UserData',ud);
       else  
          seg = seg+1;
          ud.seg = seg;
          t = path(2, seg); %meet speed change point
          tmid = path(1, seg);
          axis([tmid-10 tmid+10 30 95])
          ud.tmid = tmid + step*speed(seg);
          ud.t = t + step;;
          set(obj,'UserData',ud);
       end
    elseif seg == length(speed)
        axis([tmid-10 tmid+10 30 95])
        %patch([tmid-10 tmid+10 tmid+10 tmid-10], [95 95 30 30], 'g') %draw the middle square
       %rectangle('Position', [tmid-2 tmid+2 30 95])
        ud.tmid = tmid + step*speed(seg); 
        ud.t = t + step;
        set(obj,'UserData',ud);
    end
else
        stop(obj);
        disp('fin')
    
%pause(step); %pause for 0.5 sec

end