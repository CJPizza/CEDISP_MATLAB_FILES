%% 3.1 Chirps and Aliasing
dur = 2.5;
f1 = 13000;
f2 = 200;
fsamp = 26000;

[xx, tt] = mychirp(f1, f2, dur, fsamp);

specgram(xx, 2048, fsamp);
soundsc(xx, fsamp);

%% Wideband FM
fs = 8000;
fm = 3;
fo = 900;
B = 200;

tt = 0: 1/fs: 1.35;

mod = cos((2 * pi * fo .* tt) + (B * (sin(2 * pi * fm .* tt))));

soundsc(mod, fs)
specgram(mod, 256, fs);
%%
fs = 8000;
fm = 30;
fo = 900;
B = 20;

tt = 0: 1/fs: 1.35;

mod = cos((2 * pi * fo .* tt) + (B * (sin(2 * pi * fm .* tt))));

soundsc(mod, fs)
spectrogram(mod, 1024, [], 1024, fs, 'yaxis');

%% 4.1 Generating Bell Envelopes
tau = 2;
dur = 3;
fsamp = 2000;
test = bellenv(tau, dur, fsamp);

specgram(test, 256, 'yaxis');

%%
cases = [110, 220, 10, 2, 6, 11025; % Case 1
         220, 440, 5, 2, 6, 11025; % Case 2
         110, 220, 10, 12, 3, 11025; % Case 3
         110, 220, 10, 0.3, 3, 11025; % Case 4
         250, 350, 5, 2, 5, 11025; % Case 5
         250, 350, 3, 1, 5, 11025]; % Case 6
%        fc   fm  I0 tau Tdur fs

choice = input('Enter case number (1-6) : ');

if choice < 1 || choice > 6 || isnan(choice)
    disp('Invalid case number');
    return;
end

tt = 0 : 1/fsamp : dur;
fc = cases(choice, 1);
fm = cases(choice, 2);
I = cases(choice, 3);
tau = cases(choice, 4);
dur = cases(choice, 5);
fsamp = cases(choice, 6);
ff = [fc, fm];

figure;
xx = bell(ff, I, tau, dur, fsamp);
soundsc(xx, fsamp);
specgram(xx, 256, fsamp);
title("Bell sound");




