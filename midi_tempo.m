tempo = 100;
mid = readmidi('k622_I.mid');
mid = onsetwindow(mid, 0, 10, 'sec');
playmidi(mid, tempo)
writemidi('miditest'&&tempo&&'.mid')