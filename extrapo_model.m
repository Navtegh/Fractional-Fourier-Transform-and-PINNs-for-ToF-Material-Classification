% Load your data from the TOF sensor
% Assuming you have loaded your data into variables 'freq', 'real_data', and 'imag_data'

% Combine real and imaginary parts into a single input
input_data = [real_data, imag_data];

% Define the temporal frequencies
K = 9;
freq_range = linspace(0, 160e6, K); % Temporal frequencies from 20 MHz to 160 MHz
new_freq_range = linspace(180e6, 320e6, 8); % New temporal frequencies from 160 MHz to 320 MHz

% Create a neural network model
layers = [
    imageInputLayer([1 K 2]) % Input layer
    fullyConnectedLayer(64) % Fully connected layer with 64 neurons
    reluLayer % ReLU activation layer
    fullyConnectedLayer(2) % Output layer with 2 neurons (real and imaginary parts)
    regressionLayer]; % Regression layer

% Set training options
options = trainingOptions('adam', ... % Adam optimizer
    'MaxEpochs', 100, ... % Maximum number of epochs
    'MiniBatchSize', 16, ... % Mini-batch size
    'InitialLearnRate', 0.001, ... % Initial learning rate
    'Shuffle', 'every-epoch', ... % Shuffle data at every epoch
    'Verbose', true); % Display training progress

% Train the neural network
net = trainNetwork(freq_range', input_data', layers, options);

% Extrapolate the remaining points
extrapolated_data = predict(net, new_freq_range');

% Plot the extrapolated data
figure;
plot(freq_range, real_data, 'o', 'DisplayName', 'Real Data');
hold on;
plot(freq_range, imag_data, 'o', 'DisplayName', 'Imaginary Data');
plot(new_freq_range, extrapolated_data(:,1), 'r-', 'DisplayName', 'Extrapolated Real');
plot(new_freq_range, extrapolated_data(:,2), 'b-', 'DisplayName', 'Extrapolated Imaginary');
xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('Extrapolated Data (Neural Network)');
legend;
grid on;