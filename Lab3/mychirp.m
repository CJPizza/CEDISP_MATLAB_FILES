function [xx, tt] = mychirp(f1, f2, dur, fsamp)

if nargin < 4, fsamp = 11025, end;

tt = 0 : 1/fsamp : dur;
k = (f2 - f1) / dur;
phi = 2 * pi * (f1 * tt + 0.5 * k * tt.^2);

xx = sin(phi);
end
