bar(transmid(1, :), transmid(2, :)/max(abs(transmid(2, :))))
hold
bar(transwav(1, :), transwav(2, :)/max(abs(transwav(2, :))), 'r')
legend('mid', 'wav')
grid on