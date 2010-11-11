function trans = findtrans(A, timerate)     
    A(isnan(A)) = 0; %remove not a number due to moving average
    Pk = zeros(length(A), 1);
    for t = 2:length(A)-1
        
            Pk(t) = (A(t-1) <= A(t)) && (A(t+1) < A(t));
       
    end
    Pkval = Pk.*A; %peak values
    Pkavg = mean(Pkval(find(Pkval))); %find average of peaks,  ~isnan ignores NaN
    Pk = Pkval > 1.2*Pkavg; %save peaks higher than average
    Pkval = Pk.*A;

    %find valleies
    Val = zeros(length(A), 1);
    for t = 2:length(A)-1
        if  A(t-1) > A(t) && A(t+1) >= A(t)
            Val(t) = 1;
        end
    end
    Valval = Val.*A; %peak values
    Valavg = mean(Valval(find(Valval))); %find average of peaks
    Val =Val.*(Valval < 0.8*Valavg); %save peaks higher than average
    Valval = Val.*A;

    Allpks = Pkval - Valval; % vallies are negative
    [row,col, pks] = find(Allpks);
    trans = [row, zeros(length(pks), 1)];
    trans = trans';
    j = 0;
    for i = 1:length(pks)-1
        if pks(i+1)*pks(i) < 0
            trans(2, i) = abs(pks(i+1))-abs(pks(i)); %transition
            j = j+1;
        end
    end
    trans = trans(:, find(trans(2, :))); %remove zeros from trans
    trans(1, :) = trans(1, :)*timerate; %make the time index into sec
    plot((1:size(A))*timerate, A)
    hold on;
    scatter(find(Pkval)*timerate, Pkval(find(Pkval)), 'o', 'g') %mark peaks
    scatter(find(Valval)*timerate, Valval(find(Valval)), 'o', 'r') %mark valleies
    bar(trans(1, :), trans(2, :))
    hold off;
 end
