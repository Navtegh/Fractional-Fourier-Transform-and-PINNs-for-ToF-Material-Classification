%amplitude_values = amp_imgs{5,50}(:,:); % assuming values range from 0 to 255
real_data=real(dataset{1,1}(100,:,3));
imag_data=imag(dataset{1,1}(100,:,3));

amplitude1 = sqrt(real_data.^2 + imag_data.^2);
phase1 = atan2(imag_data, real_data);

real_data=real(dataset{4,1}(100,:,3));
imag_data=imag(dataset{4,1}(100,:,3));
amplitude4 = sqrt(real_data.^2 + imag_data.^2);
phase4 = atan2(imag_data, real_data);



figure;
subplot(2,1,1);
plot(1:224, amplitude1, 'b.-');
xlabel('Frequency (Hz)');
ylabel('Amplitude 1');
title('Amplitude vs Frequency 1');

% Plot phase
subplot(2,1,2);
plot(1:224, amplitude4, 'r.-');
xlabel('Frequency (Hz)');
ylabel('Amplitude 4');
title('Amplitude vs Frequency 4');

