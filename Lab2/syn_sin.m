function [xx, tt] = syn_sin(fk, Xk, fs, dur, tstart)

if nargin < 5, tstart = 0, end

if length(fk) ~= length(Xk)
   error('Error. Lengths of Xk and fk must be equal.');
end

tt = tstart:1/fs:tstart + dur;

xx = zeros(1, length(tt));

for k = 1:length(tt)
    xx(k) = real(sum(Xk .* exp(1j * 2 * pi * fk .* tt(k))));
end

end

