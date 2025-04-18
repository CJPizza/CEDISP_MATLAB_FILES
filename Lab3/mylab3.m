%% 2.4 MATLAB Synthesis of Chirp Signals
fsamp = 11025;
dt = 1/fsamp;
dur = 1.8;
tt = 0 : dt : dur;
psi = 2*pi*(100 + 200*tt + 500*tt.*tt);
xx = real( 7.7*exp(j*psi) );
soundsc( xx, fsamp );

%% ( a )
% Total duration of the synthesized signal is 1.8 seconds given by the dur
% variable.

numSamples = length(tt);
fprintf(['Number of Samples: ', num2str(numSamples)]);

% The number of samples, which can be determined by getting the length of
% the tt variables, is 19846.

%% ( b )
x(tn) = A cos(2 * pi * u * tn^2 + 2 * pi * f0 * tn + phi)

% The value for tn is given by the time vector, tt, which is 0 to 1.8 with
% an interval of 1/11025.

% A is the amplitude given by the xx variable, which is 7.7.

% u is coefficient in the phase, which is 500.

% f0 is time-varying frequency component, which is 100.

% phi is the phase shift of the signal, which is 0.

%% ( c )

figure;
plot(psi);

% By plotting the psi variable, where the equation of the signal is
% defined, we can determine that the minimum frequency is 628.319Hz and the
% maximum frequency is 13069Hz.
%% ( d )
% Just by listening to the sound of the signal, I can determine that the
% signal's frequency content is increasing.

%% 3.2 Function for a Chirp
f1 = 2500;
f2 = 500;
dur = 1.5;

[xx, tt] = mychirp(f1, f2, dur, fsamp);

soundsc(xx, fsamp);
spectrogram(xx, 256, 250, [], fsamp, 'yaxis');

figure;
plot(xx);

%% 3.3 Spectograms

fs=8000;
xx = cos(3000*pi*(0:1/fs:0.5));
specgram(xx,1024,fs);
colorbar

%% 4.1 Beat Notes

A = 10;
B = 10;
fc = 1000;
delf = 10;
fsamp = 11025;
dur = 1;

[xx, tt] = beat(A, B, fc, delf, fsamp, dur);

plot(tt,xx)
xlabel('Amplitude')
ylabel('Time')
title('Beat Notes')

%% 4.2 More on Spectrograms

%( a )
A= 10;
B= 10;
delf = 32;
dur = 0.26;
fsamp = 11025;
fc = 2000;

[xx, tt] = beat(A, B, fc, delf, fsamp, dur);

plot(tt,xx)
xlabel('Amplitude')
ylabel('Time')
title('More on Spectrograms')

%% ( b )
spectrogram(xx,2048,[],2048,fsamp); colormap(1-gray(256))

%% ( c )
spectrogram(xx,16,[],16,fsamp); colormap(1-gray(256))

%% 4.3 Spectrogram of a Chirp

f1 = 5000;
f2 = 300;
dur = 3;
fsamp = 11025;

[xx, tt] = mychirp(f1, f2, dur, fsamp);
soundsc(xx, fsamp);

spectrogram(xx, 256, 250, [], fsamp, 'yaxis');

%% 4.4 A Chirp Puzzle

f1 = 3000;
f2 = -2000;
dur = 3;
fsamp = 11025;

[xx, tt] = mychirp(f1, f2, dur, fsamp);
soundsc(xx, fsamp);

spectrogram(xx, 256, 250, [], fsamp, 'yaxis');


%% Challenge
f1 = 1000;
f2 = 0.5;
dur = 4;
fsamp = 8000;
[xx, tt] = challchirp(f1, f2, dur, fsamp);
soundsc(xx, fsamp)

spectrogram(xx, 256, [], [], fsamp, 'yaxis');
title('Spectrogram');
xlabel('Time');
ylabel('Frequency');
