%% PreLab 2.2 a
A1 = 100;
omega1 = 2*pi*800;
phi1 = -pi/3; 
fs = 11025;
dur = 0.5;

num_samples = fs * dur;

t = (0:(1/fs):(dur - 1/fs));

x1 = A1 * sin(omega1 * t + phi1);

soundsc(x1, fs);

%% ( b )
A2 = 80;
omega2 = 2* pi * 1200;
phi2 = pi/4;
dur = 0.5;

t2 = (0:(1/fs):(dur - 1/fs));

x2 = A2 * sin(omega2 * t2 + phi2);

soundsc(x2, fs);

%% ( c )
N = round(0.1 * fs);
xx = [x1, zeros(1, N), x2];

soundsc(xx, fs);
%% ( d )
tt = (1/11025)*(1:length(xx)); 
plot( tt, xx );

%% 2.4 
[xn,tn] = coscos(2,3,20,1)

%% Warm-Up 3.1

% Test case for key2note.m
X = 1;
keynum = 40;
dur = 1;

test = key2note(X, keynum, dur);

soundsc(test, fs);

%% 3.2

play_scale;

%% 3.3
% ( a )
play_scale;

% ( b )
figure;
spectrogram(xx, 512, [], 512, fs, 'yaxis');
title('Spectrogram 1');
colorbar;

%% ( c )
plotspec(xx, fs);
title('Spectrogram 2')
grid on;