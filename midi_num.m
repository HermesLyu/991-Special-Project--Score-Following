mode = input('Please select mode(1:vol, 2:onset # 3.hold #):');
%read wave
mid = readmidi('k622_I.mid');
mid = settempo(mid, 110); %set tempo to 110BPM which is the default of media players
mid = onsetwindow(mid, 0, 135, 'sec');
% for i = (1:size(mid, 1))
%     if mid(i, 6) > 135
%         mid1 = mid(1:i-1, :);
%         break
%     end
% end

if mode == 1 %vol
    vol = movewindow(mid,1,1,'sec', 'velocity','mean'); %moving window to get 
    vol_1 = vol(2:length(vol)) - vol(1:length(vol)-1);
% i=1;
% THIS = mid(i, :); %current note
% NEXT = mid(i+1, :); %next note
% while NEXT <> null
%     while NEXT == THIS
%     end
% end
end

if mode == 2 %onset numbers
    i = 1;
    while i<= length(mid)
        nums = find(mid(:, 6)==mid(i, 6)); %find all the notes w/ same onset time as i
        chnums(i, :) = [mid(i, 6), length(nums)];% [time, # of notes]
        i=i+length(nums);
    end
    %chnums = sort(chnums);
    chnums(find(chnums(:, 2) == 0), :) = []; %removing zero rows
    plot(chnums(:, 1), chnums(:, 2))   

    chnums_1 = [chnums(2:length(chnums), 1), chnums(2:length(chnums), 2)-chnums(1:length(chnums)-1, 2)]; %first difference
end

if mode == 3
    chnums = zeros(floor(max(mid(:, 6)/0.025)+1), 2);
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
    %chnums = sort(chnums);
    %chnums(find(chnums(:, 2) == 0), :) = []; %removing zero rows
    %plot(chnums(:, 1), chnums(:, 2), 'g')   
    %chnums(:, 2) = smooth(chnums(:, 2), 'moving'); %moving average
    chnumsavg = tsmovavg(chnums(:, 2), 's', 30, 1);
    chnumsavg_1 =  chnumsavg(2:length(chnumsavg))-chnumsavg(1:length(chnumsavg)-1);
    chnumsavg_5 =  chnumsavg(6:length(chnumsavg))-chnumsavg(1:length(chnumsavg)-5);
    chnums_1 = [chnums(2:length(chnums), 1), chnums(2:length(chnums), 2)-chnums(1:length(chnums)-1, 2)]; %first difference

    %chnumsval = chnums(:, 2);
    %test 
    transmid = findtrans(chnumsavg);  

  end
if mode == 4
    chnums = zeros(floor(max(mid(:, 6)/0.025)+1), 2);
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
    %chnums = sort(chnums);
    %chnums(find(chnums(:, 2) == 0), :) = []; %removing zero rows
    %plot(chnums(:, 1), chnums(:, 2), 'g')   
    %chnums(:, 2) = smooth(chnums(:, 2), 'moving'); %moving average
    chnumsavg = tsmovavg(chnums(:, 2), 's', 30, 1);
    chnumsavg_1 =  chnumsavg(2:length(chnumsavg))-chnumsavg(1:length(chnumsavg)-1);
    chnumsavg_5 =  chnumsavg(6:length(chnumsavg))-chnumsavg(1:length(chnumsavg)-5);
    chnums_1 = [chnums(2:length(chnums), 1), chnums(2:length(chnums), 2)-chnums(1:length(chnums)-1, 2)]; %first difference
end

% step = 0.5*fs; %.5sec step
% for i = (1 : fix(size(wav)/step))
% %    chnumselop(i) = mean(abs(wav((i-1)*step+1:(i*step)))); %take the mean inside steps
%     chnumselop(i) = max(abs(wav((i-1)*step+1:(i*step)))); %take the mean inside steps
% end
% plot(wav, 'g')
% hold on
% plot((1:size(chnumselop, 2))*step, chnumselop)