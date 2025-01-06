% Load the ToF sensor image (assumed to be grayscale)
%sensor_image = imread('tof_image.png');
real_data=real(dataset{5,1}(:,:,3));
imag_data=imag(dataset{5,1}(:,:,3));

amplitude1 = sqrt(real_data.^2 + imag_data.^2);
% Compute gradients
[dx, dy] = gradient(double(amplitude1));

% Compute magnitude and orientation of gradients
magnitude = sqrt(dx.^2 + dy.^2);
orientation = atan2(dy, dx);

% Define parameters for HOG
cell_size = [24, 24];
block_size = [2, 2];

% Compute HOG descriptors
hog = extractHOGFeatures(amplitude1, 'CellSize', cell_size, 'BlockSize', block_size);

% Display HOG visualization (optional)
figure;
%imagesc(amplitude1);
hold on;
plot(hog, 'Color', 'red');
title('HOG Visualization');
