
K = 9; % Number of temporal frequencies
temporal_frequencies = linspace(0, 160, K); % Temporal frequencies from 20 MHz to 160 MHz
real_data=squeeze(real(dataset{1,1}(1,1,:)));
imag_data=squeeze(imag(dataset{1,1}(1,1,:)));
new_freq =linspace(180, 320, 8);
% Interpolate real part
degree = 2; % Set the degree of the polynomial (e.g., quadratic)
p = polyfit(real_data, temporal_frequencies, degree);
interp_real = polyval(p, new_freq);

% Interpolate imaginary part
 % Set the degree of the polynomial (e.g., quadratic)
y = polyfit(imag_data, temporal_frequencies, degree);
interp_imaginary = polyval(y, new_freq);

L=17
freq = linspace(0, 320, L); % Temporal frequencies (Hz)

interp_real_f=[real_data;interp_real'];
interp_imaginary_f=[imag_data;interp_imaginary'];
amplitude = sqrt(interp_real_f.^2 + interp_imaginary_f.^2);
phase = atan2(interp_imaginary_f,interp_real_f);

% Plot amplitude
figure;
subplot(2,1,1);
plot(freq, amplitude, 'b.-');
xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('Amplitude vs Frequency');

% Plot phase
subplot(2,1,2);
plot(freq, phase, 'r.-');
xlabel('Frequency (Hz)');
ylabel('Phase (radians)');
title('Phase vs Frequency');