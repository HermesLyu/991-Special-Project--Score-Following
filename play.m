t = 0;
pianoroll(mid, 'sec')
while t < max(mid(:, 6))
axis([t t+20 30 95])
t = t+0.1;
pause(0.1); %pause for 0.5 sec
end