function range = logRange(starting,ending,n)
    %
    % yesno = true or false. True when the sound is heard
    %
        
    % Calculate the logarithmic step size
    stepSize = (log(ending) - log(starting)) / (n - 1);

    % Generate the logarithmic range
    logRangeValues = log(starting):stepSize:log(ending);

    % Convert back to the original scale
    range = exp(logRangeValues);
end