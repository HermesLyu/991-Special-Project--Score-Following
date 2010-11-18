mid = readmidi('eroica_all.mid');
%mid = settempo(mid, 97); %set tempo to 110BPM which is the default of media players
mid = onsetwindow(mid, 0, 140, 'sec') %crop
writemidi(mid, 'eroica.mid', 120) %save croped
