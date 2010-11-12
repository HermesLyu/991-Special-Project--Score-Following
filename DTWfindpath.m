function bestpath = DTWfindpath(DTWmap, bestpath)
x = DTWmap(bestpath(1),bestpath(2), 1);
y = DTWmap(bestpath(1), bestpath(2), 2);

if x <2 | y <2
    bestpath = [[0; 0],bestpath];
    return
else
    bestpath = [ DTWfindpath(DTWmap, [x; y]), [x; y]];
    %DTWfindpath(DTWDTWmap, [x; y]);
return
end
