function yesno = oldhear_sinus(amplitude,frequency,duration,samplingRate)
%
% yesno = true or false. True when the sound is heard
%
tt = 0:1/samplingRate:duration;
xx = amplitude*cos(2*pi*frequency*tt + rand(1)*2*pi);
sound(xx,samplingRate)
pause(duration) %--wait for the sound to end
aa = input('Can U hear me now? (<CR>=no, y=yes) ','s')
yesno = length(aa)>0;
if yesno
yesno = upper(aa(1))=='Y';
end