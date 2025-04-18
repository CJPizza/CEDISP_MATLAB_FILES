function [xx, tt] = challchirp(f1, f2, dur, fsamp)

if nargin < 4, fsamp = 11025; end;

t_up = 0 : 1/fsamp : dur/2;
t_down = dur/2 : 1/fsamp : dur;

k_up = (f2 - f1) / (dur/2);
k_down = (f1 - f2) / (dur/2);

phi_up = 2 * pi * (f1 * t_up + 0.5 * k_up * t_up.^2);
phi_down = 2 * pi * (f2 * (t_down - dur/2) + 0.5 * k_down * (t_down - dur/2).^2);

xx_up = sin(phi_up);
xx_down = sin(phi_down);

xx = [xx_up, xx_down];
tt = [t_up, t_down];
end
