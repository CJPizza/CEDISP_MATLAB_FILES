function [xx, tt] = mychirp(f1, f2, dur, fsamp)

if nargin < 4, fsamp = fsamp, end;

tt = 0 : 1/fsamp : dur;
k = (f2 - f1) / (dur*2);
phi = 2 * pi * ((f1 * tt) + (k * tt.^2));

xx = real(exp(j * phi));
end