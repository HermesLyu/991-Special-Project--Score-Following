function trans = findtrans1(A, timerate)     
    A(isnan(A)) = 0; %remove not a number due to moving average
 
    
    
    leng = length(A);
    function diff = diffn(leng, n)
    diff = zeros(length(A), 1);
    for t = n+1:length(A)-n
        
           diff(t) = mean(A(t:t+n))-mean(A(t-n:t));
       
    end
    end
    
    diff1 = diffn(leng, 1);
    diff2 = diffn(leng, 2);
    diff3 = diffn(leng, 3);
    diff4 = diffn(leng, 4);
    diff5 = diffn(leng, 5);
    diff6 = diffn(leng, 6);
    diff7 = diffn(leng, 7);
    diff15 = diffn(leng, 15);
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
trans = diff3;

subplot(2, 1, 1)   
plot((1:size(A))*timerate, A)
ylabel('real')

%    scatter(find(Pkval)*timerate, Pkval(find(Pkval)), 'o', 'g') %mark peaks
%    scatter(find(Valval)*timerate, Valval(find(Valval)), 'o', 'r') %mark valleies
%    bar(trans(1, :), trans(2, :))
    subplot(2, 1, 2)
    plot((1:size(diff15))*timerate, diff15)
    ylabel('diff3')

 end