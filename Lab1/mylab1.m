%% ( a )
xk = cos( pi*(0:11)/4 )

%{ 
The array contains the cosines of different angles measured in
radians from 0 incremented by pi/4 all the way to 11pi/4. Index 1
of the array xk holds the value 0.7071, while Index 0 holds the
value of 1.0000.
%}

%% ( b )
yy = [ ];
for k = -5:5
yy(k+6) = cos( k*pi/3 )
end
yy

%{
The reason why it's necessary to write k + 6 instead of just k is 
because the for loop starts at -5, which is something MATLAB doesn't
allow to run. Adding a + 6 to the iterator makes sure that the count
in the for loop starts at 1.
%}

%% ( c )
x = [-3 -1 0 1 3 ];
y = x.*x - 3*x;
plot( x, y )
z = x + y*sqrt(-1)
plot( z )

%% ( d )
tt = -1 : 0.01 : 1;
xx = cos( 5*pi*tt );
zz = 1.4*exp(j*pi/2)*exp(j*5*pi*tt);
plot( tt, xx, ’b-’, tt, real(zz), ’r--’ ), grid on %<--- plot
a sinusoid
title(’TEST PLOT of a SINUSOID’)
xlabel(’TIME (sec)’)

%{
The real part of zz is considered a sinusoid because it obtains the real
component of the much more complex sinusoidal function initially assigned
to zz, leaving out the imaginary component. Both the amplitude and phase
shift of the sinusoid is stated in the sinusoidal equation - the amplitude
being 1.4, and the phase shift being pi/2.
%}

%% ( e )
mylab1
type mylab1

%% ( 2.3 )

audiofile = 'sound.wav';
figure;
fs = 11025
dur = 0.9
tt = 0: 1/fs: dur
xx = cos(2 * pi * 2000 * tt)
plot(tt, xx, 'b-')

soundsc(xx, fs)
audiowrite(audiofile, xx, fs)
%% Lab
% ( 3 )

T = 1/4000;
tt = T : T/25 : 2*T;

A1 = 20;
A2 = 1.2 * A1;
tm1 = (37.2  / 4) * T;
tm2 = -(41.3 / 13) * T;
x1 = A1 * cos(2 * pi * 4000 * (tt - tm1));
x2 = A2 * cos(2 * pi * 4000 * (tt - tm2));

x3 = x1 + x2;

subplot(3, 1, 1);
plot(tt, x1);
legend('Phase 1 = 2.64 pi')
title('Sinusoid x1 - Alamay, Carl Justine S.');

subplot(3, 1, 2);
plot(tt, x2);
legend('Phase 2 = 3.68 pi')
title('Sinusoid x2');

subplot(3, 1, 3);
plot(tt, x3);
legend('Phase 3 = 3.84 pi')
title('Summed Sinusoid x3');

%% ( 3.2 )

x1 = real(2 * exp(j * 4 * t));

plot(x1)
title('real(2 * exp(j * 4 * t))')

