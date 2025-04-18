function [HH]= bpf_bands(wc, L, plotyn)
    %wc: center frequency (at normalized frequency)
    %L: length
    %plotyn: to plot or not (0 = no, else = yes)

    w=0:pi/100:pi;

    p = 0;
    if plotyn ~= 0
        p = 1;
    end

    figure;
    % frequency response function at wc = 0.44*pi
    HH = bandfilt(wc,L,p);
    
    HH_abs = abs(HH); % magnitudes of HH
    
    % Finding H_max
    H_max = max(HH_abs);
    H_max_i = find(HH_abs == H_max); % finding index of H_max
    
    % determining passband region
    passband_region_index = find(HH_abs/H_max >= 1/sqrt(2));
    passband_cutoff_index = [passband_region_index(1) passband_region_index(end)];
    passband_cutoff_mag = [HH_abs(passband_cutoff_index(1)) HH_abs(passband_cutoff_index(end))];
    passband_cutoff_freq = [w(passband_cutoff_index(1))/pi w(passband_cutoff_index(end))/pi];
    
    % determining stopband region
    first_stopband_region_index = find(HH_abs(1:passband_cutoff_index(1))/H_max < 1/4);
    second_stopband_region_index = passband_cutoff_index(end) + find(HH_abs(passband_cutoff_index(end):length(HH_abs))/H_max < 1/4) - 1;
    stopband_cutoff_index = [first_stopband_region_index(end) second_stopband_region_index(1)];
    stopband_region_index = find(HH_abs/H_max < 1/4);
    
    
    
    
    w_pi = w./pi;
    

    if plotyn ~= 0
        title_str = sprintf('Bandpass centered at $%.2f\\pi$ for $L = %d$', wc/pi, L);
        title(title_str, 'Interpreter', 'latex');
        hold on;
        plot(w_pi(passband_cutoff_index), HH_abs(passband_cutoff_index),"r x"); % passband_cutoff red x
        plot(w_pi(passband_region_index), HH_abs(passband_region_index),"r ."); % passband_region red .
        plot(w_pi(H_max_i), HH_abs(H_max_i),"o b"); % H_max blue circle
        
        
        plot(w_pi(stopband_cutoff_index), HH_abs(stopband_cutoff_index),"x g") % plot stopband_cutoff green x
        plot(w_pi(stopband_region_index), HH_abs(stopband_region_index),". g")  % plot stopband_region green . 
        hold off;
    end
end
