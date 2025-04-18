%% 2.1
%Input frequency is 12 Hz.
%Sampling frequency is 15 Hz.
%Determine the frequency of the reconstructed output signal ( 3Hz )
%Determine the locations in O! of the lines in the spectrum of the discrete-time signal. Give numerical values. ( Gen formula Phik = 2pi * 3/15 + 2pi * k )
%Change the sampling frequency to 12 Hz, and explain the appearance of the
%output signal. ( becomes flat )

%% 2.4
load labdat.mat
b1 = 1/2*ones(1,2);
x2 = firfilt(b1, x1);

bb = 1/5*ones(1,5);
y1 = firfilt(bb, x1);

nn = 1:length(x1);
subplot(3,1,1);
stem(nn,x1(nn))
subplot(3,1,2);
stem(nn,y1(nn),'filled') %--Make black dots

subplot(3,1,3);
stem(nn,x2(nn),'filled') %--Make black dots
xlabel('Time Index (n)')

%%
b1 = 1/2*ones(1,2);

x2 = firfilt(b1, x1);

nn = 1:length(x1);
plot(x2);
stem(nn,x2(nn),'filled') %--Make black dots

%% 2.5

load echart.mat

bdiffh = [1, -1];
yy1 = conv2(echart, bdiffh);

figure;
subplot(1,2,1);
imshow(echart, []);
title('Original Image');

subplot(1,2,2);
imshow(yy1, []);
title('Horizontal Image');

%%
yy2 = conv2(echart, bdiffh');

figure;
imshow(yy2, []);
title('Vertical Image');

%% 3.1
xx = 256 * (rem(0:100, 50) < 10);
bb = [1, -0.9];
ww = firfilt(bb, xx);

n = 0:100;
n1 = 0:length(ww)-1; 

subplot(2, 1, 1);
stem(n, xx, 'filled');
title('Input Signal x[n]');
xlabel('n');
ylabel('x[n]');
axis([0 75 -10 260]);

subplot(2, 1, 2);
stem(n1, ww, 'filled');
title('Output Signal w[n]');
xlabel('n');
ylabel('w[n]');
axis([0 75 min(ww)-10 max(ww)+10]);

%% 3.1.1

bb = ones(1,23);
for M = 0:22
    bb(M+1)=(0.9^M);
end
yy = firfilt(bb, ww);

n1 = 0:length(ww)-1;
n2 = 0:length(yy)-1;

figure;
subplot(2, 1, 1); 
stem(n1, ww, 'filled');
title('Signal w[n]');
xlabel('n');
ylabel('w[n]');
axis([0 49 min(ww) max(ww)]);

subplot(2, 1, 2);
stem(n2, yy, 'filled');
title('Restored Signal y[n]');
xlabel('n');
ylabel('y[n]');
axis([0 49 min(ww) max(ww)]);

yy1 = yy(1:length(xx));
error = xx - yy1;

figure;
stem(0:49, error(1:50), 'filled');
title('Difference between x[n] and y[n]');
xlabel('n');
ylabel('Error');

%% 3.1.2
% a
difference = abs(xx(1:50) - yy(1:50));
worsecase = max(difference);

disp(num2str(worsecase)); % 22.6891

% b
%{
The error plot and worst-case error indicate the effectiveness of the signal restoration process. 
A smaller worst-case error suggests a closer approximation of the original signal. If the error 
plot shows consistently low values, it implies that the restoration filter successfully recovers 
the original signal with minimal changes. For the error to be visually unnoticable on a plot, 
the worst-case error should be significantly smaller than the plot's y-axis range and the 
resolution of the display used for viewing the plot.
%}

%% 3.1.3

% a
% r seems to represent the strength of the echo is 90%, or 0.9.
% P is the delay in samples meaning it's 8000 Hz multiplied by 0.2, which equals 1600 Hz.

% b
% The FIR filter will have a coefficient of 1 followed by the delayed signal's 
% values of constant 0s until P. This means that the length of the filter 
% coefficients of the FIR filter is P + 1, which means it's 1601.

% c
load labdat.mat;

fs = 8000; 
r = 0.9;
P = 1600;

b = zeros(1, P+1);
b(1) = 1;
b(P+1) = r;

y = filter(b, 1, x2);

soundsc(y, fs);

%% 3.2
q = 0.9;
h1 = [1, -q];

bb = zeros(1,23);
for M = 0:22
    bb(M+1) = (0.9^M);
end

impulse = [1, zeros(1, 100)];

w = firfilt(h1, impulse);
yy = firfilt(bb, w);

figure;
stem(0:length(yy)-1, yy, 'filled');
title('Impulse Response h[n]');
xlabel('n');
ylabel('Amplitude');
axis([0 50 min(yy) max(yy)]);


%% 3.2.2
load echart.mat;

% FIR Filter-1
q = 0.9;
h1 = [1, q];

ech90a = filter(h1, 1, echart, [], 2);
ech90 = filter(h1, 1, ech90a, [], 1);

% FIR Filter-2
M = 22;
r = 0.9;
b2 = r.^(0:M);

ech90d = conv2(ech90, b2, 'same');

figure;
subplot(1,3,1);
imshow(echart, []);
title('Original Image');

subplot(1,3,2);
imshow(ech90, []);
title('FIR Filter-1');

subplot(1,3,3);
imshow(ech90d, []);
title('FIR Filter-2');


%% 3.2.3
load echart.mat

aa = [1 -0.9];
ech90 = conv2(echart, aa); 
ech90 = conv2(ech90, aa');

figure;

subplot(2, 2, 1);
imshow(echart);
title('Original Image');

bb = 0.9.^(0:11);
M1 = conv2(ech90, bb);
M1 = conv2(M1, bb');
subplot(2, 2, 2);
imshow(M1);
title('FIR Filter-2 with M=11');

bb = 0.9.^(0:22);
M2 = conv2(ech90, bb);
M2 = conv2(M2, bb');
subplot(2, 2, 3);
imshow(M2);
title('FIR Filter-2 with M=22');

bb = 0.9.^(0:33);
M3 = conv2(ech90, bb);
M3 = conv2(M3, bb');
subplot(2, 2, 4);
imshow(M3);
title('FIR Filter-2 with M=33');


%%
Ms = [11, 22, 33];

figure;
for i = 1:length(Ms)
    bb = 0.9.^(0:Ms(i));

    impulse = [1, zeros(1, 100)];
    
    h = conv(impulse, bb, 'same');
    
    subplot(length(Ms), 1, i);
    stem(0:length(h)-1, h, 'filled');
    title(sprintf('h[n] of M=%d', Ms(i)));
    xlabel('n');
    ylabel('Amplitude');
end

%% 3.2.3 b

% M=11
difference1 = abs(M1(1:257, 1:256) - echart);
worstcase1 = max(difference1, [], "all");

% M=22
difference2 = abs(M2(1:257, 1:256) - echart);
worstcase2 = max(difference2, [], "all");

% M=33
difference3 = abs(M3(1:257, 1:256) - echart);
worstcase3 = max(difference3, [], "all");

disp(worstcase1);
disp(worstcase2);
disp(worstcase3);

