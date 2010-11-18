mode = input('please select diff level:');
hold off;
if mode == 1
    subplot(2, 1, 1)
    plot(1:0.5:123, (env1)/max(env1)*18, 'g');
    subplot(2, 1, 2)
    plot(chnums_1(:, 1), (chnums_1(:, 2)));
elseif mode == 0
    subplot(2, 1, 1)
    plot(time, abs(wav), 'g');
    %plot(1:0.5:123.5, env/max(env)*18, 'g');
    subplot(2, 1, 2)
    plot(chnums(:, 1), chnums(:, 2));
else
    error('invalid argument')
end
