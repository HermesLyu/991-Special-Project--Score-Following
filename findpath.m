function aligment = findpath(x, y, map, aligment)
slope = size(map, 1)/size(map, 2)
x1 = find(map(y, x+1:end), 1, 'first') + x 
if ~isempty(x1)
    find(abs(map(y+1:end, x1))==2);
    y2 = find(abs(map(y+1:end, x1))==2)+y
    [C, I] = min(abs(y2-x1*slope))
    y1 =y2(I) % fine y which is below 5% far than middle line
else
    return
end%dim1 >y, dim2 >x
%y1 = find(map( y+1:end,x), 1, 'first') + y;
    if isempty(x1) | isempty(y1)
      return 
    else
        aligment = [[x1; y1], findpath(x1+1, y1+1, map, aligment)]; %+1 to avoid finding points that are not cross
        return 
    end
end