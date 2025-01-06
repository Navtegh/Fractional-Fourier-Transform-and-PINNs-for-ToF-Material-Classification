function [sigma_S_sqr, G] = sigma_S_Square(Window)

    centreR = ceil(size(Window,1)/2);
    centreC = ceil(size(Window,2)/2);

    d = zeros(size(Window));
    for i = 1:size(Window, 1)
        for j = 1: size(Window, 2)

            d(i,j) = sqrt((i - centreR)^2 + (j - centreC)^2);
            d_new = sortrows(d(:));
            d_end = d_new(end);
        end
    end

    sigma_S_sqr = (- d_end/(2*log(0.85)));
    G = exp(- d_new./(2*sigma_S_sqr));

    x = 1:numel(Window);
    plot(x,G)

end