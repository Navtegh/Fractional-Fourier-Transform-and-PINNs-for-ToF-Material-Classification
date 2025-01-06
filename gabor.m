

% Convert the image to double format
tof_image = amplitude1;

% Define parameters for Gabor filters
num_scales = 4;
num_orientations = 8;
lambda = 8; % Wavelength of the sinusoidal factor
theta = 0:pi/num_orientations:pi-pi/num_orientations; % Orientation of the normal to the parallel stripes of a Gabor function

% Initialize Gabor filter bank
gabor_bank = cell(num_scales, num_orientations);

% Generate Gabor filters
for s = 1:num_scales
    for o = 1:num_orientations
        gabor_bank{s,o} = gabor(lambda,s*lambda,theta(o),0.5,0);
    end
end

% Apply Gabor filters to the ToF image
filtered_images = cell(num_scales, num_orientations);
for s = 1:num_scales
    for o = 1:num_orientations
        % Convolve the image with the Gabor filter
        filtered_images{s,o} = imfilter(tof_image, gabor_bank{s,o});
    end
end

% Extract texture features from filtered images
texture_features = [];
for s = 1:num_scales
    for o = 1:num_orientations
        % Compute statistical measures (e.g., mean, std) from each filtered image
        mean_value = mean(filtered_images{s,o}(:));
        std_value = std(filtered_images{s,o}(:));
        % Add features to the feature vector
        texture_features = [texture_features, mean_value, std_value];
    end
end

% Display texture features
disp('Texture Features:');
disp(texture_features);
