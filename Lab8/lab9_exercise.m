A = 0.001;
ff = 2000;
dur = 1;
fs = 44100;
oldhear_sinus(A,ff,dur,fs)

%% Explanation before going into the actual hearing test
refA = 1; % reference point at Amplitude = 1
A = 0.001; % the amplitude being tested
ratio = A/refA; % math for ratio, in this case, reference point is 1 at refA, so the ratio is just A

% converting at input of dB (a relative unit)
db = -50;
ratio = dbtonum(db); % converting db to ratio
A = ratio*refA;
ff = 2000;
dur = 1;
fs = 44100;
oldhear_sinus(A,ff,dur,fs)

%% Determining the frequencies to be tested
% since we are plotting against a logarithmic frequency scale in the
% x-axis, the intervals of each frequency point might as well be
% logarithmic

starting = 20;
ending = 20000;
n= 20;

% Generate the logarithmic range
range = logRange(starting, ending, n);
figure(2);
semilogx(range,ones(n,1),'o');
grid on;
xlim([starting,ending])
xlabel('Frequency (Hz)');

%% Program for hearing test
clear;
refA = 1;   % reference Amplitude
startDB = -50; % starting dB according to relA
fs = 44100; % sampling frequency
dur = 1; % duration per sample test in seconds
startFreq = 250; % start of range of frequencies
endFreq = 17500; % end of range of frequencies
n = 1; % number of frequency values in the range 
samplesPer = 1; % samples taken per frequency

% establishing range of frequencies logarithmically
freqs = logRange(startFreq, endFreq, n); 

res = zeros(1,length(freqs)); % preallocation



for i = 1:length(freqs) % looping through all frequencies indices
    total = 0;
    for j = 1:samplesPer    % loops the number of samples to be taken
        fprintf("\nNow testing frequency %.2f (%d)\n\n",freqs(i),j);
        db = startDB;
        change = -1;
        while change ~= 0
            ratio = dbtonum(db); % converting db to ratio
            A = ratio*refA; % multiplies ratio to reference amplitude

            change = hear_sinus(A,freqs(i),dur,fs); % hearing sample

            if (change ~= 0)
                db = db + change;
            end
        end
        total = total + db;
    end
    resAve = total/samplesPer; % averages out the samples of that freq
    res(i) = resAve; % assign to result
end

close all;
semilogx(freqs,res,'-o');
grid on;
xlim([startFreq,endFreq])
xlabel('Frequency (Hz)');

% creates a save file
filename = input('Enter Filename: ','s');
saveas(gcf, strcat(filename,'.png'));

save(strcat(filename,'.mat'), 'refA', 'fs', 'startFreq','endFreq','n','samplesPer','freqs','res'); % .mat file for results
