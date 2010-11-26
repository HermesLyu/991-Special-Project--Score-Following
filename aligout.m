% bar(transmid(1, :), transmid(2, :)/max(abs(transmid(2, :))))
% hold
% bar(transwav(1, :), transwav(2, :)/max(abs(transwav(2, :))), 'r')
% legend('mid', 'wav')
% grid on
figure
%subplot(2, 1, 1)
runmidi
ylabel('mid')
grid on;
grid minor
%subplot(2, 1, 2)
figure
runwav
ylabel('wav')
grid on
grid minor
