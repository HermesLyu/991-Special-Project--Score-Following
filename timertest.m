  t=[0]
  lh=plot(t,sin(t),'-');

   t=timer(   'Name','FebirdTimer',  'TimerFcn',@showscore,      'Period',1,   'ExecutionMode','fixedrate');

   ud=struct('linehanle',lh,'count',0) ;

   set(t,'UserData',ud);

 start(t)
 