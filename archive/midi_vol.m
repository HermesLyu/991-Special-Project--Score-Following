%read wave
mid = readmidi('k622_1.mid');
mid = onsetwindow(mid, 0, 135, 'sec');
% for i = (1:size(mid, 1))
%     if mid(i, 6) > 135
%         mid1 = mid(1:i-1, :);
%         break
%     end
% end
y = movewindow(mid,1,1,'sec', 'velocity','mean'); %moving window to get 

k=1;
for j = 1:(length(y)-1)
    z(j) = (y(j+1)-y(j)); %first difference of y 
%     if (y(j+1)-y(j)) > max(y)*0.4
%         segpoint(k, :) = [j, 0];
%         k=k+1; %segmentation point: [time, 0=up/1=down]
%     elseif (y(j+1)-y(j)) > -max(y)*0.4
%         segpoint(k, :) = [j, 1];
%         k=k+1;
%     end
end    
% step = 0.5*fs; %.5sec step
% for i = (1 : fix(size(wav)/step))
% %    envelop(i) = mean(abs(wav((i-1)*step+1:(i*step)))); %take the mean inside steps
%     envelop(i) = max(abs(wav((i-1)*step+1:(i*step)))); %take the mean inside steps
% end
% plot(wav, 'g')
% hold on
% plot((1:size(envelop, 2))*step, envelop)