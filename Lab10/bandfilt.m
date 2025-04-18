function [HH,ww_abs,ww_angle,ww_HH]= bandfilt(wc, L, plotyn, ww)
    %wc: center frequency (at normalized frequency)
    %L: length
    %plotyn: to plot or not (0 = no, else = mag only, 2 = angle and mag, 3 = angle only)
    w=0:pi/100:pi;
    bb = bpf_bb(wc, L);
    HH = freqz(bb,1,w);

    
    %HH=((1-exp(1i.*L.*(wc-w)))./(1-exp(1i.*(wc-w)))+(1-exp(-1i.*L.*(wc+w)))./(1-exp(-1i.*(wc+w))))/L;

    HH_abs = abs(HH);
    HH_angle = angle(HH);
    if nargin == 4
        ww_abs =[];
        ww_angle=[];
        ww_HH = [];
        for i = 1:length(ww)
            index_ww = find(abs(w - ww(i)) < 0.00000001); % 0.00000001 tolerance
            abss = HH_abs(index_ww);
            angg = HH_angle(index_ww);
            ww_abs = [ww_abs abss];
            ww_angle = [ww_angle angg];
            ww_HH = [ww_HH abss*exp(j*angg)];
        end
    else
        ww_abs = NaN;
        ww_angle = NaN;
        ww_HH = NaN;
    end
    w_pi = w./pi; % plot according to normalized frequency / pi

    if plotyn ~= 0
        if plotyn == 2
            subplot(2,1,2);
            plot(w_pi,HH_angle);
            xlabel('\omega/\pi');
            ylabel('\angleH(e^{j\omega})');
            grid on;
            subplot(2,1,1);
        end
        if plotyn ~= 3
            plot(w_pi,HH_abs);
            grid on
            xlabel('\omega/\pi');
            ylabel('|H(e^{j\omega})|');
        end
        if plotyn == 3
            plot(w_pi,HH_angle);
            xlabel('\omega/\pi');
            ylabel('\angleH(e^{j\omega})');
            grid on;
        end
    end
    if nargin == 4
        if plotyn ~= 0 && plotyn ~= 3
            ww_index = [];

            for i = 1:length(ww)
                ww_index = [ww_index  find(abs(w - ww(i)) < 0.00000001)];
            end
            hold on;
            plot(w_pi(ww_index), HH_abs(ww_index),"r o"); % ww red o
            hold off;
        end
    end
end