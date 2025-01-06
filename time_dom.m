% Define the complex measurements at positive frequencies
positive_frequencies = linspace(0, 160e6, 9);
%extrapolated_data_complex = complex(interp_real_f, interp_imaginary_f);
%complex_data_positive=extrapolated_data_complex';
complex_data_positive=squeeze(dataset{5,1}(86,112,:));
% Create the frequency axis
N = length(positive_frequencies);
sampling_freq = max(positive_frequencies) * 2; % Double the maximum frequency for Nyquist criterion
time_step = 1 / sampling_freq;


time_axis = (-N:N-1) * time_step;

% Mirror the data to create negative frequency components
complex_data_negative = conj(fliplr(complex_data_positive));

% Combine the positive and negative frequency components
complex_data_full = [complex_data_positive; complex_data_negative];

% Perform the inverse FFT


time_domain_data = ifft(complex_data_full);

% Plot the time-domain data
figure;
plot(time_axis, real(time_domain_data), 'b', 'LineWidth', 1.5);
xlabel('Time (s)');
ylabel('Amplitude');
title('Time Domain Representation of Complex Data');
grid on;
