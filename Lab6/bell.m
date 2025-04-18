function xx = bell(ff, Io, tau, dur, fsamp)
fc = ff(1);
fm = ff(2);

tt = 0:1/fsamp:dur;

A = bellenv(tau, dur, fsamp);

I = Io * bellenv(tau, dur, fsamp);

xx = A .* cos((2 * pi * fc * tt) + I .* cos(2 * pi * fm * tt));

%xx = A .* cos((2 * pi * fc * tt) + I .* cos(2 * pi * fm * tt + pm) + pc);
%Just in case the xx definition is wrong, then this is from the lab.
end
