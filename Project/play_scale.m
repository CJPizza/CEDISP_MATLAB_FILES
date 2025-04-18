%--- play_scale.m
%---
scale.keys = [ 52 0 49 47 47 0 51 52 51 52 52 0 57 57 57 52 52 0 49 47 52 54];
%--- NOTES: C D E F G A B C
% key #40 is middle-C
%
scale.durations = [0.25  0.5 0.25 0.25  0.25 0.125 0.125 0.25 0.25  0.25 0.125 0.125 0.25 0.25  0.25 0.25 0.25 0.25]
fs = 11025; %-- or 8000 Hz
xx = zeros(1, sum(scale.durations)*fs+length(scale.keys) );
n1 = 1;
for kk = 1:length(scale.keys)
    keynum = scale.keys(kk);
    tone = key2note(1, keynum, 0.25);
    n2 = n1 + length(tone) - 1;
    xx(n1:n2) = xx(n1:n2) + tone; %<=== Insert the note
    n1 = n2 + 1;
end
soundsc(xx, fs)
spectrogram(xx, 512, [], 512, 11025, "yaxis");