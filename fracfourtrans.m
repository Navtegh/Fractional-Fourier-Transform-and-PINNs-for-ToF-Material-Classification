%load('material_rec_five_materials_PB-H0106_steps_dataset_n_setups=50_n_inst_per_setup=7_n_avg_frames=25_condensed.mat');

data = dataset;
% Define the alpha value for the Fractional Fourier Transform (FrFT)
alpha = 0.5;  % example value, adjust according to your needs

% Pre-allocate the output array
output = cell(size(data));

% Loop through each cell in the dataset
for i = 1:size(data, 1)
    for j = 1:size(data, 2)
        % Extract the current image data (172x224x9x2)
        img_data = data{i, j};
        
        % Apply the FrFT to each frequency point (9) and complex component (2)
        frft_data = zeros(size(img_data, 1), size(img_data, 2), size(img_data, 3), size(img_data, 4), ceil(abs(alpha)));
        for k = 1:size(img_data, 3)
            for l = 1:size(img_data, 4)
                % Apply the FrFT to the current frequency point and complex component
                frft_data(:, :, k, l, :) = fft2(img_data(:, :, k, l), alpha);
            end
        end
        
        % Store the result in the output array
        output{i, j} = frft_data;
    end
end