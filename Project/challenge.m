scale.keys = [52  49 47 47  51 52 51 52 52  57 57 57 52 52  49 47 52 54  54 52 52  49 47 47  51 52 51 52 52  57 57 57 52 57  54 51  54 52 51  49];
scale.durations = 2 * [0.25  0.5 0.25 0.25  0.25 0.125 0.125 0.25 0.25  0.25 0.125 0.125 0.25 0.25  0.25 0.25 0.25 0.25 0.5 0.25 0.25  0.5 0.25 0.25  0.25 0.125 0.125 0.25 0.25  0.25 0.125 0.125 0.25 0.25  0.75 0.25  0.5 0.25 0.25  0.75 0.25];

fs = 11025;
xx = zeros(1, ceil(sum(scale.durations)*fs+length(scale.keys)));
n1 = 1;

for kk = 1:length(scale.keys)
    if(scale.keys(kk) == 0)
        n1 = n1 + round(scale.durations(kk)*fs);
    else
        keynum = scale.keys(kk);
        tone = key2note(1, keynum, scale.durations(kk));
        n2 = n1 + length(tone) - 1;
        xx(n1:n2) = xx(n1:n2) + tone;
        n1 = n2 + 1;
    end
end

cutoffFreq = 2;
filterOrder = 2;

[b, a] = butter(filterOrder, cutoffFreq/(fs/2), 'low');

filtered_xx = filter(b, a, xx);

soundsc(filtered_xx, fs);
figure;
subplot(2,1,1);
spectrogram(xx, 256, [], [], fs, 'yaxis'); % Plot original spectrogram
title('Original');
subplot(2,1,2);
spectrogram(filtered_xx, 256, [], [], fs, 'yaxis'); % Plot filtered spectrogram
title('Filtered');
