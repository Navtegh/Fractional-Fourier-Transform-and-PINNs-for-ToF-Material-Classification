clc
clear all
% 
% base_path = "/Users/navtegh/Documents/MATLAB/Mr_Singh_Material_Imaging/";
% dataset_path = 'datasets/';
% branch_path = "dataset_3";
% full_path_dataset = base_path+dataset_path+branch_path+"/";
% mat_files = dir(full_path_dataset+'*.mat');
% dataset_name = extractfield(mat_files, 'name');
% xlsx_files = dir(full_path_dataset+'*.xlsx');
% xlsx_name = extractfield(xlsx_files, 'name'); 
% 
% mat_name_range = 'A1:A6';
% pixel_range = 'C2:L142';
% height_window = 60;
% width_window = 80;
% 
% mat_list_names = readtable(full_path_dataset+xlsx_name{1,1},'Range',mat_name_range);
% pix_ranges = readtable(full_path_dataset+xlsx_name{1,2},'Range',pixel_range);
% new_dataset = normalization(full_path_dataset+dataset_name, pix_ranges); 
% train_val_test = downSample_dataset(new_dataset, height_window, width_window);
% 
% 
% num_classes = size(train_val_test, 1);
% num_instances = size(train_val_test, 2);
% width = size(train_val_test{1,1}, 1);
% height = size(train_val_test{1,1}, 2);
% num_freqs = size(train_val_test{1,1}, 3);
% num_channels = size(train_val_test{1,1}, 4);
% 
% % Initialize the output matrix
% output_matrix = zeros(num_classes, num_instances, width, height, num_freqs, num_channels);
% 
% % Iterate over each cell in the cell array
% for class_idx = 1:num_classes
%     for instance_idx = 1:num_instances
%         % Copy data from cell array to the corresponding slice of the output matrix
%         output_matrix(class_idx, instance_idx, :, :, :, :) = train_val_test{class_idx, instance_idx};
%     end
% end

load Normalised_data.mat

x=find_sigma1(output_matrix);






% % Reshape the data for easier manipulation
% data_reshaped = reshape(output_matrix, [5*70, 60, 80, 8, 2]);
% 
% % Initialize arrays to store the fitted parameters for each instance
% A_fit = zeros(5*70, 60, 80);
% sigma_fit = zeros(5*70, 60, 80);
% decay_fit = zeros(5*70, 60, 80);
% 
% % Define the temporal frequency range
% min_frequency = 20e6; % 20 MHz
% max_frequency = 160e6; % 160 MHz
% 
% % Number of temporal frequencies (K = 8)
% num_frequencies = 8;
% 
% % Generate evenly spaced temporal frequencies
% frequencies = linspace(min_frequency, max_frequency, num_frequencies);
% 
% % Loop through each instance
% for i = 1:size(data_reshaped, 1)
%     % Extract the frequency-domain data for the current instance
%     f_data = squeeze(data_reshaped(i, :, :, :, :));
% 
%     % Fit the exponential Gaussian model to the complex frequency-domain data for each pixel
%         for y = 1:size(f_data, 2)
%             for z = 1:size(f_data, 3)
%                 % Extract the complex frequency-domain data
%                 f_data_pixel = squeeze(f_data(y, z, :, :));
% 
%                 % Define the fitting function (exponential Gaussian)
% 
%                 fitting_function = @(params,frequencies) params(1) * exp(-0.5 * (frequencies /params(2)).^2) .* exp(-params(3) * frequencies);
% 
% 
%                 % Initial guess for parameters
%                 initial_guess = [1, 0, 1]; % [Amplitude, Sigma, Decay constant]
% 
%                 % Fit the model
%                 [fitted_params, ~, ~, exitflag] = lsqcurvefit(fitting_function, initial_guess, frequencies, f_data_pixel);
% 
%                 % Check if the fitting was successful
%                 if exitflag > 0
%                     % Store the fitted parameters
%                     A_fit(i, x, y) = fitted_params(1);
%                     sigma_fit(i, x, y) = fitted_params(2);
%                     decay_fit(i, x, y) = fitted_params(3);
%                 else
%                     % Fitting failed, handle accordingly
%                     disp(['Fitting failed for instance ', num2str(i), ', pixel (', num2str(x), ',', num2str(y), ')']);
%                 end
%             end
%         end
% end
