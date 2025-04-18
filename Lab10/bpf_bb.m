function [bb]= bpf_bb(wc, L)
    %wc: center frequency (at normalized frequency)
    %L: length
    w=0:pi/100:pi;
    bb = (2/L)*cos(wc*(0:L-1));
end
