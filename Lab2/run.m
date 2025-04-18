
clc
%5a
[xt, t] = syn_sin([1/2, 1/2, 1/2],[2,2*exp(j*(-1.25*pi)),1-j],100,6,-1/2);

plot(t,xt, 'b')
xlabel('Time')
ylabel('Amplitude')
title('Sinusoid with Complex Exponentials')

%5c
phasorSum = (2) + (2*exp(j*(-1.25*pi))) + (1-j);
zprint(phasorSum)

%%
%6c
t = 0:(1/150000000)/100:(1/150000000) * 3
t1 = sqrt(0^2 + (1500)^2)/(3 * 10^8)
t2 = sqrt(100^2 + (1500 - 900)^2)/(3 * 10^8) + sqrt(900^2 + (100 - 0)^2)/(3 * 10^8)

rv = cos(2*pi*150000000*(t - t1)) - cos(2*pi*150000000*(t - t2))

plot(t, rv)
xlabel('Time')
ylabel('Received Signal')
title('Multipath Fading')


%Maximum amplitude = 0.5736

%6d
[rv, t]  = syn_sin([150000000, 150000000],[exp(j*(-2*pi*150000000*t1)),-1*exp(j*-2*pi*150000000*t2)], 15000000000, (1/150000000)*3, 0)
figure
plot(t, rv)

%6e and 6f
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




