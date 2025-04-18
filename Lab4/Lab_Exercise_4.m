% Section 1: Loading
load bach_fugue_short.mat

%%
% Section 2: Timing
bpm = 80;

fs = 11025;

beats_per_second = bpm/60;
seconds_per_beat = 1/beats_per_second;
seconds_per_pulse = seconds_per_beat/4;

%add a function that will determine how long the duration is per note (for
%the whole melody na)
dur_each_note = theVoices(1).durations * seconds_per_pulse;

xx_len = ceil(sum(dur_each_note)+1)*fs; %xx_len we got da total length of melody in s, then multiple to how many samples needed each sec
xx = zeros(1, xx_len);
x = 1*exp(j*0);
n1 = 1; %indicating the first pulse

for kk = 1:length(theVoices(1).noteNumbers)
   
    keynum = theVoices(1).noteNumbers(kk);
    durae = dur_each_note(kk);
    note = key2note(x, keynum, durae);

    %creating the Envelope
    Env_length = length(note);

    Action = round(0.1*Env_length);
    Drop = round(0.1*Env_length);
    Sustain = round(0.6*Env_length);
    Release = Env_length - Action - Drop - Sustain;

    Env_Action = linspace(0,1, Action);
    Env_Drop = linspace (1,0.8, Drop);
    Env_Sustain = linspace (0.8, 0.6, Sustain);
    Env_Release = linspace (0.6,0, Release);

    Env = [Env_Action Env_Drop Env_Sustain Env_Release];
    Env = Env(1:length(note));

    note = Env.*note;

    n2 = n1 - 1 + length(note);
    xx(n1:n2) = xx(n1:n2) + note; %<=== Insert the note
    n1 = theVoices(1).startPulses(kk) + n2;
end

soundsc(xx);