%% Prelab
v = linspace(-10, 10, 1000);
y = 10 * exp(-(v - 1).^2 / (2 * 3^2));
plot(v, y);
grid("on");
title('Gaussian Thing');

%% Warm Up 3.1
%(b)
ff = 2.^(5:1/12:10);

%% (c)
fc = 440;
a = (1/2).^2;
frequencies = linspace(55, 1760, 1000);

gaussian = syngaus(fc, a, frequencies);

semilogx(frequencies, gaussian);
grid("on");
xlabel("Frequency");
ylabel("Amplitude");
title('Gaussian Function');

%% (d)
figure;
plot(frequencies, gaussian);
grid("on");
xlabel("Frequency");
ylabel("Amplitude");
title('Plot function');

figure;
semilogx(frequencies, gaussian);
grid("on");
xlabel("Frequency");
ylabel("Amplitude");
title('Semilogx function');

%% Warm Up 3.2
fs = 8000;
dur = 2;
refkey = 49;
reffreq = 440;
a = (1/2).^2;

keys = [40, 52, 64, 28, 16];

signal = zeros(1, 2 * fs + length(keys));

for i = 1:length(keys)
   tone = key2note(syngaus(keys(i), reffreq, 1), keys(i), dur);
   signal(1:dur*fs) = signal(1:dur*fs) + tone(1:dur*fs);
end

spectrogram(signal, 2048, [], 1024, fs, 'yaxis');
soundsc(signal,fs);
%% Lab Exercise
tt = 0: 1/8000: 2;
fc = 440;
variance = 0.6;
fs = 8000;


c4 = key2note_func(gaussian_func(fc, variance, 261.63), 40, 2, fs);
c5 = key2note_func(gaussian_func(fc, variance, 523.25), 52, 2, fs);
c6 = key2note_func(gaussian_func(fc, variance, 1046.50), 64, 2, fs);
c2 = key2note_func(gaussian_func(fc, variance, 65.41), 16, 2, fs);
c3 = key2note_func(gaussian_func(fc, variance, 130.81), 28, 2, fs);

sum = c2 + c3 + c4 + c5 + c6;

soundsc(sum, 8000);
spectrogram(sum, 2048, [], 2048, 8000, 'yaxis');

ff = [65.41 130.81 261.63 523.25 1046.50];
xx = gaussian_func(fc,variance,ff);

semilogx(ff, xx);


