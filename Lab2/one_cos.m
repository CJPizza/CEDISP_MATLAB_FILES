function [xx, tt] = one_cos(A, w, phase, dur)
period = 2 * pi / w;
tt = 0:period/20:dur;
xx = A * cos(w*tt + phase);
end