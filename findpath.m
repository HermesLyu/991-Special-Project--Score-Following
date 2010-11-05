function aligment = findpath(x, y, map, aligment)
x1 = find(map(y, x+1:end), 1, 'first') + x; %dim1 >y, dim2 >x
y1 = find(map( y+1:end,x), 1, 'first') + y;
    if isempty(x1) | isempty(y1)
      return 
    else
        aligment = [[x1; y1], findpath(x1+1, y1+1, map, aligment)]; %+1 to avoid finding points that are not cross
        return 
    end
end