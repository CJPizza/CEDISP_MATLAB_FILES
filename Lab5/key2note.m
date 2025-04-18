function xx = key2note(X, keynum, dur)

fs = 11025;
tt = 0:(1/fs):dur;

refkey = 49;
reffreq = 440;

freq = reffreq * 2^((keynum - refkey) / 12);

xx = real(X * exp(i * 2 * pi * freq * tt));

end