% function frft_data = applying_ffrt(data, alpha)
% Load the data (assuming it's stored in a 5x840 cell array called 'data')
data = train_val_test; % load your data here

% Define the fractional Fourier transform order (alpha)
alpha = 0.5; % example value, adjust as needed

% Pre-allocate output array
output = cell(size(data));

% Loop through each material (5)
for i = 1:size(data, 1)
    % Loop through each image (840)
    for j = 1:size(data, 2)
        % Reshape the data to separate real and imaginary parts
        img_data = reshape(data{i, j}, 60, 80, 8, 2);
        real_part = img_data(:, :, :, 1);
        imag_part = img_data(:, :, :, 2);
        
        % Apply FrFT to each frequency component (8)
        for k = 1:8
            freq_data = squeeze(real_part(:, :, k)) + 1i * squeeze(imag_part(:, :, k));
            frft_data = frft(freq_data, alpha);
            output{i, j}(:, :, k, 1) = real(frft_data);
            output{i, j}(:, :, k, 2) = imag(frft_data);
        end
    end
end

% output is now a 5x840 cell array with the FrFT applied to each image