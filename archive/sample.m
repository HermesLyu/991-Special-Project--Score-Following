wav = wavread('eroica.wav');
wav1 = resample(mean(mid, 2)', 80, 441); %from fz=44100 to 8000
wavwrite(wav1, 8000, 'eroica_8000.wav');