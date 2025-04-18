



function filteredAudio = bandpass(audio, f_low, f_high, order, fs)

    [b_low, a_low] = butter(order, f_low / (fs / 2), 'low');
    [b_high, a_high] = butter(order, f_high / (fs / 2), 'high');
    
    filtered_low = filter(b_low, a_low, audio);
    filteredAudio = filter(b_high, a_high, filtered_low);
    
end