function [xx, tt] = beat(A, B, fc, delf, fsamp, dur)

    A = abs(A);
    B = abs(B);

    f1 = fc - delf / 2;
    f2 = fc + delf / 2;

    [sin1, ~] = syn_sin(f1, A, fsamp, dur);
    [sin2, tt] = syn_sin(f2, B, fsamp, dur);

    xx = sin1 + sin2;
end
