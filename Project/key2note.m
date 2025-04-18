function xx = key2note(X, keynum, dur)
% KEY2NOTE Produce a sinusoidal waveform corresponding to a
% given piano key number
%
% usage: xx = key2note (X, keynum, dur)
%
% xx = the output sinusoidal waveform
% X = complex amplitude for the sinusoid, X = A*exp(j*phi).
% keynum = the piano keyboard number of the desired note
% dur = the duration (in seconds) of the output note
%
fs = 11025; %-- or use 8000 Hz
tt = 0:(1/fs):dur;
freq = 440*(2.^((keynum-49)/12))
yy = real(X*exp(1j*2*pi*freq*tt));

A = linspace(0, 1, (length(yy)*0.2)); 
D = linspace(1, 0.8, (length(yy)*0.15)); 
S = linspace(0.8, 0.8, (length(yy)*0.5)); 
R = linspace(0.8, 0, (length(yy)*0.15)); 
ADSR = [A D S R];

x = zeros(size(yy));
x(1:length(ADSR)) = ADSR;
xx = yy.*x;

