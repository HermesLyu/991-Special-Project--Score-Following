function smoothed = movmedian(input, winsize)
    len = length(input);
    smoothed = zeros(1, len);
    if mod(winsize, 2) == 1
        winsize = winsize-1; %make the window symmetry
    end
    for n = 1:len
        if n-winsize/2 < 1 && n+winsize/2 > len
            error('The window size is too large for the given input data')
        elseif n-winsize/2 < 1
            smoothed(n) = median(input((1):(n+winsize/2)));
        elseif n+winsize/2 > len
            smoothed(n) = median(input((n-winsize/2):end));
        else
            smoothed(n) = median(input((n-winsize/2):(n+winsize/2)));
        end
    end
end