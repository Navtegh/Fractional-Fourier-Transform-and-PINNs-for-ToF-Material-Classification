K = 9; % Number of temporal frequencies
temporal_frequencies = linspace(0, 160, K); % Temporal frequencies from 20 MHz to 160 MHz
real_data=squeeze(real(dataset{4,1}(86,112,:)));
imag_data=squeeze(imag(dataset{4,1}(86,112,:)));
new_freq =linspace(180, 320, 8);
L=17
freq = linspace(0, 320, L);

model1 = feedforwardnet(5);
model1 = train(model1, temporal_frequencies, real_data');
y_predicted = model1(new_freq);
interp_real=[real_data',y_predicted];
model2 = feedforwardnet(5);
model2 = train(model2, temporal_frequencies, imag_data');
y_predicted_imag = model2(new_freq);
interp_imaginary= [imag_data',y_predicted_imag ]
amplitude = sqrt(interp_real.^2 + interp_imaginary.^2);

figure;
plot(temporal_frequencies, amplitude(1:9)', 'o',  new_freq ,amplitude(10:17)','x' );
xlabel('Input');
ylabel('Output');
title('Extrapolation using Neural Network');
legend('Known Data', 'Extrapolated Points', 'Location', 'best');