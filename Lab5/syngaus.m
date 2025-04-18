function gaussian = syngaus(fc, a, frequencies)
    log_frequencies = log2(frequencies);
    gaussian = exp(-(log_frequencies - log2(fc)).^2 / (2 * a));
end
