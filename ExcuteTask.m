 function ExcuteTask(obj,eventdata)

    ud=obj.UserData;
    l=ud.linehandle;
    c=ud.count;
    t=get(l,'XData');
    y=get(l,'YData');
    t=[t count];
    y=[y sin(0.1*count)];
    set(lh,'XData',t,'YData',y);

   drawnow

   ud.count=ud.count+1;
   set(obj,'UserData',ud);


  end