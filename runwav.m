wav = mean(wav, 2); %stereo to mono
time = (1:length(wav))/fs;

env1 = downsample(abs(wav), 1000);
timeratewav = 1/(fs/1000); %about 46 data points per sec as midi

%env2 = tsmovavg(env1, 's', 60, 1);
env = movmedian(env1,timeratewav, 4);
env = env';
% % 
% % subplot(2, 1, 1)
% % plot(env2)
% % ylabel('moving average')
% subplot(3, 2, n)
% plot(env)
% ylabel(n)
% grid off
% axis([0 6000 0 0.14])

transwav = findtrans1(env, timeratewav);
