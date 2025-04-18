%% 3.1 ( a )

z1 = 10 * exp(-j*((2 * pi) / 3));
z2 = -5 + 5*j;

figure;
zvect(z1, 'b');
hold on;
zvect(z2, 'r');
zcoords;
ucplot;
hold off;

zprint(z1)
zprint(z2)

%% ( b )

zcat([j, -1, -2j, 1])

%% ( c )

z3 = z1 + z2;
figure;
zvect(z3, 'g');
hold on;
zvect(z1, 'b');
zvect(z2, 'r');
hold off;

zprint(z3);

%% ( d )

z4 = z1 * z2;
figure;
zvect(z4, 'b');

zprint(z4);

%% ( e )

z5 = z1 / z2;
figure;
zvect(z5, 'b');

zprint(z5);

%% ( f )

conjz1 = conj(z1);
conjz2 = conj(z2);
figure;
zvect(conjz1, 'b');
hold on;
zvect(conjz2, 'r');
hold off;

zprint(conjz1);
zprint(conjz2);

%% ( g )

invz1 = 1 / z1;
invz2 = 1 / z2;
figure;
zvect(invz1, 'b');
hold on;
zvect(invz2, 'r');
hold off;

zprint(invz1);
zprint(invz2);

%% ( h )

figure;

% 1.
subplot(2, 2, 1);
zvect(z1, 'b');
hold on;
zvect(z2, 'r');
zcoords;
ucplot;
hold off;
title('z1 and z2');

% 2.
subplot(2, 2, 2);
zvect(conj(z1), 'b');
hold on;
zvect(conj(z2), 'r');
zcoords;
ucplot;
hold off;
title('Conjugates of z1 and z2');

% 3.
subplot(2, 2, 3);
zvect(1/z1, 'b');
hold on;
zvect(1/z2, 'r');
zcoords;
ucplot;
hold off;
title('Inverses of z1 and z2');

% 4.
subplot(2, 2, 4);
zvect(z1 * z2, 'r');
zcoords;
ucplot;
title('Product of z1 and z2');

%% 3.3

N = 200;
rk = sqrt(((1:N) / 50).*((1:N)/50) + 2.25)
plot(1:200, real(exp(j * 2 * pi * rk)), 'mo-')

%% 4.1

A = 95;
omega = 200 * pi; %rad/sec
phi = pi / 5; %radians
dur = 0.025; %seconds

[x, t] = one_cos(A, omega, phi, dur);

plot(t, x, 'b');
xlabel('Time (s)');
ylabel('Amplitude');
title('Complex Exponentials');
grid on;

expected = 2 * pi / omega * 1000;
fprintf('Expected Period in Milliseconds: %f\n', expected);

%% 4.2.3

figure;
[xx0,tt0] = syn_sin([0,100,250],[10,14*exp(-j*pi/3),8*j],10000,0.1,0);
plot(tt0, xx0, 'b')
xlabel('Time')
ylabel('Amplitude')
title('Complex Exponentials')
grid on;

fk = [0, 100, 250];
Xk = [10, 14*exp(-1j*pi/3), 8*1j];
fs = 10000;
dur = 0.1;
tstart = 0;

for i = 1:length(fk)
    [individual_component, tt_individual] = syn_sin(fk(i), Xk(i), fs, dur, tstart);
    
    figure;
    plot(tt_individual, individual_component, 'b');
    title(['Individual Component - Frequency: ' num2str(fk(i)) ' Hz']);
    xlabel('Time (s)');
    ylabel('Amplitude');
    grid on;
end

%% 5 Lab Exercise
clc

% ( a )
[xt, t] = syn_sin([1/2, 1/2, 1/2],[2,2*exp(j*(-1.25*pi)),1-j],100,6,-1/2);

plot(t,xt, 'b')
xlabel('Time')
ylabel('Amplitude')
title('Sinusoid with Complex Exponentials')

% ( c )
phasorSum = (2) + (2*exp(j*(-1.25*pi))) + (1-j);
zprint(phasorSum)

%% 6 Lab Exercise: Multipath Fading
% ( c )
t = 0:(1/150000000)/100:(1/150000000) * 3
t1 = sqrt(0^2 + (1500)^2)/(3 * 10^8)
t2 = sqrt(100^2 + (1500 - 900)^2)/(3 * 10^8) + sqrt(900^2 + (100 - 0)^2)/(3 * 10^8)

rv = cos(2*pi*150000000*(t - t1)) - cos(2*pi*150000000*(t - t2))

plot(t, rv)
xlabel('Time')
ylabel('Received Signal')
title('Multipath Fading')


%Maximum amplitude = 0.5736

% ( d )
[rv, t]  = syn_sin([150000000, 150000000],[exp(j*(-2*pi*150000000*t1)),-1*exp(j*-2*pi*150000000*t2)], 15000000000, (1/150000000)*3, 0)
figure
plot(t, rv)

% ( e & f )
xv = 0:1:300
t1 = sqrt(xv.^2 + (1500)^2)/(3 * 10^8);
t2 = sqrt(100^2 + (1500 - 900)^2)/(3 * 10^8) + sqrt(900^2 + (100 - xv).^2)/(3 * 10^8);
x1 = exp(j*(-2*pi*150000000*t1))
x2 = -1*exp(j*-2*pi*150000000*t2);
xSum = x1 + x2;

%signal strength
ss = sqrt(real(xSum).^2 + imag(xSum).^2)

plot(xv, ss)
xlabel('Distance in Meters')
ylabel('Amplitude')
title('Multipath Fading')




