
mid = settempo(mid, 97); %set tempo to 110BPM which is the default of media players

    chnums = zeros(floor(max(mid(:, 6)/0.025)+1), 2);
    timeratemid = 0.025;
    chnums(:,1) = 0:0.025:floor(max(mid(:, 6))/0.025)*0.025;
    for i = 1: length(mid) %all the time index w/ 0.025 step
        onset = floor(mid(i, 6)/0.025)+1; %+1 because matlab index starts at 1
        holdtime = floor(mid(i, 7)/0.025)+1;
        for j = onset:(onset+holdtime) 
            if j <= floor(max(mid(:, 6))/0.025);
            chnums(j,2)  = chnums(j, 2)+1;
            end
        end
    end


%     chnumsavg2 = tsmovavg(chnums(:, 2), 's', 60, 1);
    chnumsavg = movmedian(chnums(:, 2), timeratemid, 2);
    chnumsavg = chnumsavg';

    transmid = findtrans1(chnumsavg, timeratemid);  %find transitions


