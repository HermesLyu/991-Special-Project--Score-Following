%read wave
[wav, fs, nbits] = wavread('k622_I.wav');
wav = mean(wav, 2); %stereo to mono
%wav = wav(1:size(wav, 1)/2);
time = (1:length(wav))/fs;
step = 0.5*fs; %.5sec step
for i = (1 : fix(size(wav)/step))
%    envelop(i) = mean(abs(wav((i-1)*step+1:(i*step)))); %take the mean inside steps
    env(i) = max(abs(wav((i-1)*step+1:(i*step)))); %take the mean inside steps
end
timeratewav = 0.5; % 0.5 sec/x
%env = envelope(wav, time);

% for i = 1:(length(wav)-1)
%     wav1(i) = wav(i+1)-wav(i);
% end
wav1 = wav(2:length(wav))-wav(1:length(wav)-1);
env1 = env(2:length(env))-env(1:length(env)-1);
%env2 = env(3:length(env))-env(1:length(env)-2);
%env3 = env(4:length(env))-env(1:length(env)-3);
%env4 = env(5:length(env))-env(1:length(env)-4);

transwav = findtrans(env', timeratewav);

%plot(time, wav)
%hold on
%plot((1:size(envelop, 2))*step, envelop)