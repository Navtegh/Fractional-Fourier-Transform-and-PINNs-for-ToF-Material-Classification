function F = frft(f, a)
    N = length(f);
    shft = rem((0:N-1) + fix(N/2), N) + 1;
    f = f(shft);
    if a == 0
        F = f;
    elseif a == 1
        F = fft(f);
    else
        alpha = a * pi / 2;
        tana2 = tan(alpha / 2);
        sina = sin(alpha);
        F = exp(-1i * pi / 4) * exp(1i * pi / N * ((0:N-1)' - N/2).^2 * tana2) ...
            .* fft(exp(1i * pi / N * ((0:N-1)' - N/2).^2 * tana2) ...
            .* f) * sqrt(1i / sina);
    end
    F = F(shft);
end