mid = readmidi('k622_all.mid')
mid = settempo(mid, 97); %set tempo to 110BPM which is the default of media players
mid = onsetwindow(mid, 0, 135, 'sec'); %crop
writemidi(mid, 'k622_crop.mid', 120) %save croped
