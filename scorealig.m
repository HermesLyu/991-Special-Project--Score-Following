%file = 'K622';
file = 'eroica';
mid = readmidi([file '.mid']);
runmidi

[wav, fs, nbits] = wavread([file '.wav']);
runwav

alig

