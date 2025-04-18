function aa = hear_sinus(amplitude,frequency,duration,samplingRate)
    %
    % yesno = true or false. True when the sound is heard
    %
    tt = 0:1/samplingRate:duration;
    xx = amplitude*cos(2*pi*frequency*tt + rand(1)*2*pi);
    sound(xx,samplingRate)
    pause(duration) %--wait for the sound to end

    db = numtodb(amplitude);
    fprintf('%.2f hz: %.2f db; %f (amplitdue)\n', frequency, db, amplitude);
    aa = input('Satisfied? (<num>=dBChange, 0=yes) ');
end