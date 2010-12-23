function trans = findtrans1(A, timerate)     
    A(isnan(A)) = 0; %remove not a number due to moving average
 
    
    
    leng = length(A);
    function diff = diffn(n, timerate, leng)
        n = floor(n/timerate); %normalize the time from sec to actual data index
    diff = zeros(length(A), 1);
    for t = 1:length(A)
        if (t-n)<1 %shrink window if the index exceed the A dimention
            diff(t) = sqrt(mean(A(t:t+n).^2))-sqrt(mean(A(1:t).^2));
        elseif (t+n)> length(A)
            diff(t) = sqrt(mean(A(t:end).^2))-sqrt(mean(A(t-n:t).^2)); %diff of consequtive windows(RMS within window)
        else
            diff(t) = sqrt(mean(A(t:t+n).^2))-sqrt(mean(A(t-n:t).^2)); %diff of consequtive windows(RMS within window)
        end
    end
    end
    
    diff2 = diffn(2, timerate, leng);
     Val = zeros(length(A), 1);
    for t = 2:length(A)-1
        if  diff2(t-1) > diff2(t) && diff2(t+1) >= diff2(t) && diff2(t) < 0
            Val(t) = 1;
        end
    end
    Valval = Val.*diff2; %peak values

    Valavg = mean(Valval(find(Valval))); %find average of peaks
    Val =Val.*(Valval < 2*Valavg); %save peaks higher than average
    Valval = Val.*diff2;
    
%     Valavg = mean(Valval(find(Valval))); %find average of peaks
%     Val =Val.*(Valval < 0.6*min(Valval)); %save peaks higher than average
%     Valval = Val.*diff2;    
    
    [row,col, pks] = find(Valval);
    trans = [row*timerate, pks];
    trans = trans';
    m = 1;
    while m+1 < length(trans)
        if trans(1, m+1)-trans(1, m) < 1 %remove peaks that are too close in time (1sec)
            trans(:, m+1) = [];
            %if removed m holds
        else
            m = m+1;
        end
       
    end
    %dynamically choose diff order
    
%     diff1 = diffn(leng, 1);
%     diff2 = diffn(leng, 2);
%     diff3 = diffn(leng, 3);
%     diff4 = diffn(leng, 4);
%     diff5 = diffn(leng, 5);
%     diff6 = diffn(leng, 6);
%     diff7 = diffn(leng, 7);
%     diff15 = diffn(leng, 15);
%     
%     Pkval = Pk.*A; %peak values
%     Pkavg = mean(Pkval(find(Pkval))); %find average of peaks,  ~isnan ignores NaN
%     Pk = Pkval > 1.3*Pkavg; %save peaks higher than average
%     Pkval = Pk.*A;
% 
%     %find valleies
%     Val = zeros(length(A), 1);
%     for t = 2:length(A)-1
%         if  A(t-1) > A(t) && A(t+1) >= A(t)
%             Val(t) = 1;
%         end
%     end
%     Valval = Val.*A; %peak values
%     Valavg = mean(Valval(find(Valval))); %find average of peaks
%     Val =Val.*(Valval < 0.7*Valavg); %save peaks higher than average
%     Valval = Val.*A;
% 
%     Allpks = Pkval - Valval; % vallies are negative
%     [row,col, pks] = find(Allpks);
%     trans = [row, zeros(length(pks), 1)];
%     trans = trans';
%     j = 0;
%     for i = 1:length(pks)-1
%         if pks(i+1)*pks(i) < 0
%             trans(2, i) = abs(pks(i+1))-abs(pks(i)); %transition
%             j = j+1;
%         end
%     end
%    trans = trans(:, find(trans(2, :))); %remove zeros from trans
%    trans(1, :) = trans(1, :)*timerate; %make the time index into sec

subplot(2, 1, 1)   
plot((1:size(A))*timerate, A)
ylabel('real')

%    scatter(find(Pkval)*timerate, Pkval(find(Pkval)), 'o', 'g') %mark peaks
%    scatter(find(Valval)*timerate, Valval(find(Valval)), 'o', 'r') %mark valleies
%    bar(trans(1, :), trans(2, :)
     subplot(2, 1, 2)
     plot((1:size(diff2))*timerate, diff2)
     ylabel('diff2')
     hold on
     scatter(trans(1, :), trans(2, :), 'o', 'r') %mark valleies
     hold off
   
%     %test to show 6 different level of diffn
%     figure
%     for m = 1:6
%     subplot(3, 2, m)
%     mm = m/2;
%     plot(1:size(diffn(mm, timerate, leng)), diffn(mm, timerate, leng))
%     ylabel(mm)
%     end
 end
