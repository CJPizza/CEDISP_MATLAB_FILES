function xx = toSound(Papuri,fs,bpm)
beats_per_second = bpm/60;
seconds_per_beat = 1/beats_per_second;
seconds_per_pulse = seconds_per_beat / 1;
dur_per_pulse = seconds_per_pulse * fs;

max_dur = 0;
max_start_pulse = 0;


for i = 1:length(Papuri)
    if max_dur < max(Papuri(i).durations)
        max_dur = max(Papuri(i).durations);
    end
    if max_start_pulse < max(Papuri(i).startPulses)
        max_start_pulse = max(Papuri(i).startPulses);
    end
end

xx = zeros( 1, ceil(fs*seconds_per_pulse*(max_dur + max_start_pulse)) );

for i = 1:length(Papuri)
    for j = 1:length(Papuri(i).noteNumbers)
        keynum = Papuri(i).noteNumbers(j);
        key_start = Papuri(i).startPulses(j)*dur_per_pulse;
        dur = Papuri(i).durations(j)*seconds_per_pulse;
        tone = key2note(1, keynum, dur);
        n1 = ceil(key_start)+1;
        n2 = n1 + length(tone) - 1;
        xx(n1:n2) = xx(n1:n2) + tone;
    end
end