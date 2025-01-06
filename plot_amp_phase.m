real_data=squeeze(real(dataset{4,1}(86,112,:)));
imag_data=squeeze(imag(dataset{4,1}(86,112,:)));
K = 9;
freq = linspace(0, 160e6, K); % Temporal frequencies (Hz)
amplitude = sqrt(real_data.^2 + imag_data.^2);
phase = atan2(imag_data, real_data);

% Plot amplitude
figure;
subplot(2,1,1);
plot(freq, real_data, 'b.-');
xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('Amplitude vs Frequency');

% Plot phase
subplot(2,1,2);
plot(freq, phase, 'r.-');
xlabel('Frequency (Hz)');
ylabel('Phase (radians)');
title('Phase vs Frequency');