% % % % %% clear all the variables which has been prestored in the MATLAB workspace
% % % % 
% clc
% clear 
% % % 
% base_path = "/Users/navtegh/Documents/MATLAB/Mr_Singh_Material_Imaging/"; % change this path according to you
% dataset_path = 'datasets/';
% results_path = 'results/';
%   branch_path = "dataset_3"; % call different dataset from here
% full_path_dataset =base_path+dataset_path+branch_path+"/";
% full_path_result = base_path+results_path+branch_path+'/';
% mat_files = dir(full_path_dataset+'*.mat');
% dataset_name = extractfield(mat_files, 'name'); % extract all the availabel .mat file names
%  xlsx_files = dir(full_path_dataset+'*.xlsx');
%  xlsx_name = extractfield(xlsx_files, 'name'); % extract all the availabel .xlsx file names
% maxacc=[];
% abc=[];
% 
% if branch_path == "dataset_1" % keep adding ranges based on the dataset in this conditional loop
%     mat_name_range = 'A1:A16';
%     pixel_range = 'C2:AF8';
%     height_window = 120; % to balance dataset
%     width_window = 180;
% 
% elseif branch_path == "dataset_2"
%     mat_name_range = 'A1:A15';
%     pixel_range = 'C2:AD8';
%     height_window = 60;
%     width_window = 80;
% 
% elseif branch_path == "dataset_3"
%     mat_name_range = 'A1:A6';
%     pixel_range = 'C2:L142';
%     height_window = 60;
%     width_window = 80;
% 
% elseif branch_path == "dataset_4"
%     mat_name_range = 'A1:A15';
%     pixel_range = 'C2:AD8';
%     height_window = 60;
%     width_window = 80;
% 
% elseif branch_path == "dataset_5"
%     mat_name_range = 'A1:A11';
%     pixel_range = 'C2:V12';
%     height_window = 36;
%     width_window = 28;
% 
% elseif branch_path == "dataset_6"
%     mat_name_range = 'A1:A3';
%     pixel_range = 'C2:V12';
%     height_window = 36;
%     width_window = 28;
% end
% 
% mat_list_names = readtable(full_path_dataset+xlsx_name{1,1},'Range',mat_name_range);
% pix_ranges = readtable(full_path_dataset+xlsx_name{1,2},'Range',pixel_range);
% 
% new_dataset = normalization(full_path_dataset+dataset_name, pix_ranges);    % call function normalization
%     if branch_path == 'dataset_1'
% 
%         new_dataset(7,:) = []; % we are removing 7th material
%         new_dataset(10,:) = []; % we are removing 11th material
%         new_dataset(12,:) = []; % we are removing 14th material
% 
%         mat_list_names(7,:) = []; % we are removing 7th material
%         mat_list_names(10,:) = []; % we are removing 11th material
%         mat_list_names(12,:) = []; % we are removing 14th material
% 
%     end
% 
% disp("Imbalanced Percentage of pixels per material :")
% data_imbalance(new_dataset)    % print imbalance data by calling function data imbalance
% 
% %% Downsample data
% 
% % size of each image
% 
% train_val_test = downSample_dataset(new_dataset, height_window, width_window);    % call downSample_dataset function --"convert imbalance dataset to balance dataset"
% disp("Balanced Percentage of pixels per material :")
% data_imbalance(train_val_test)    % print imbalance data by calling function data imbalance
% 
% for i = 1:size(train_val_test, 1)
%     for j = 1:size(train_val_test, 2)
%         % Extract data from dataset1
%         train_val_test{i, j} = single(train_val_test{i, j});
%     end
% end
% % % train_val_test_2= apply_frft(train_val_test, -0.75);
% % % train_val_test_1= apply_frft(train_val_test, -0.5);
% % % train_val_test0= apply_frft(train_val_test, 0);
% % % train_val_test1= apply_frft(train_val_test, 0.5);
% % % train_val_test2= apply_frft(train_val_test, 0.75);
% % 
% 
% %         % % % 
% 
% 
%         sigma = find_sigma1(train_val_test);
%         std_Dev = std_deviation(sigma);
%         std_dev = vertcat(std_Dev{:});
%         std_dev = reshape(mean(std_dev), 1, 1, 8, 2);
%         % clear combined_dataset
%         clear sigma
%         clear std_Dev
% 
%         %
% 
% 
%         train_val_test = breakdown(train_val_test);    % call function breakdown to divide image into equal parts
% 
%         random_shuffle_for_train_val_test = randperm(size(train_val_test, 2));
%         train_val_test = train_val_test(:, random_shuffle_for_train_val_test);
% 
%         % for a=-1:0.2:1
%         % train_val_test3= apply_frft(train_val_test, a);
%         % train_val_test= train_val_test3;
%         train_val = train_val_test(:,1:end-2);
%         test = train_val_test(:,end-1:end);
%         % 
% 
%         % 
%         %% Training and Validation image patch and label dataset
% 
%         window_rows = 5;
%         window_colms = 5;
%         window_stride = 1;
%         k_nearest = 9;
%         % weight_mat = weight_matrix(window_rows, window_colms);
% 
%         [x_train, y_train] = images_and_labels(train_val, window_rows, window_colms, window_stride, mat_list_names, k_nearest, std_dev); % Extract images and labels for training
% 
%         %
%         rand = randperm(size(y_train, 1));
%         shuffle_x_train = x_train(:, :, :, :, rand);
%         shuffle_y_train = y_train(rand, :);
% 
%         %%
% 
%         n_inst_per_mat = size(shuffle_x_train, 5);
% 
%         % divide data into training and validation set
%         train_and_val_ratio = 0.85;
% 
%         x_train = shuffle_x_train(:, :, :, :, 1:floor(n_inst_per_mat*train_and_val_ratio));
%         x_val = shuffle_x_train (:, :, :, :, floor(n_inst_per_mat*train_and_val_ratio) + 1 : end);
% 
%         % x_train = apply_ffrt(x_train,1);
%         % x_val = apply_ffrt(x_val,1);
%         %%
%         y_train = shuffle_y_train(1:floor(n_inst_per_mat*train_and_val_ratio), :);
%         y_val = shuffle_y_train(floor(n_inst_per_mat*train_and_val_ratio) + 1 : end, :);
%         global alphahistory;
%         alphahistory=[];
%         % call Deep learning network (all accuracy are not fixed, it changes everytime due to random initialization)
% 
        %  % network = algorithm_cnn1(x_train, x_val, y_train, y_val); % (98% classifier accuracy)
        network = algorithm_cnn2(x_train, x_val, y_train, y_val); % (98% classifier accuracy)
        % % % network = algorithm_cnn4(x_train, x_val, y_train, y_val, n_mats); 
        % % % network = algorithm_fcnn(x_train, x_val, y_train, y_val); % (98% classifier accuracy)
        % % % network = algorithm_cnn5(x_train, x_val, y_train, y_val); % (98% classifier accuracy)
        % % % network = algorithm_fcnn_5(x_train, x_val, y_train, y_val); % (98% classifier accuracy)
        % % % network = algorithm_ResNet(x_train, x_val, y_train, y_val);
        % % % 
        % % % cnn2 has been depicted in research paper
        % % 
        % % % calculate accuracy
        % % 
        % % 
        % % 
        % % 
        [train_accuracy, ~] = accuracy(network, x_train, y_train);
        [validation_accuracy, ~] = accuracy(network, x_val, y_val);
        
        sprintf('training accuracy = %d', train_accuracy)    % print training accuracy
        sprintf('validation accuracy = %d', validation_accuracy)    % print validation accuracy
        
        %% call heterogeneous_test_Set (multiple run in this section can give the maximun test accuracy)
        if branch_path == 'dataset_5' || branch_path == 'dataset_6'
        
        else
        average_test_accuracy = 0;
        for i = 1:10
            [img_test, label_test] = heterogeneous_mat_test(branch_path, test, window_rows, window_colms, window_stride, mat_list_names, k_nearest, std_dev);
            [heterogeneous_test_accuracy, heterogeneous_test_label] = accuracy(network, img_test, label_test);
            sprintf('heterogeneous material accuracy = %d', heterogeneous_test_accuracy)    % print accuracy for heterogeneous material
            average_test_accuracy = average_test_accuracy + heterogeneous_test_accuracy;
        end
        average_test_accuracy = average_test_accuracy/10;
        disp('Average Test Accuracy:')
        disp(average_test_accuracy)
        
        %% Print confusion matrix and plot artificial heterogeneous image
        cm = confusionchart(label_test, heterogeneous_test_label);    % plot confusion matrix
        if branch_path == 'dataset_1'
            cm.XLabel = 'Predicted Class (15-Materials)';
            cm.YLabel = 'True Class (15-Materials)';
            image_height = 60;
            image_width = 80;
            cm.FontName = 'Times New Roman';
            cm.FontSize = 11;
            cm.ColumnSummary = 'total-normalized';
            cm.RowSummary = 'total-normalized';
        
        
        
            figure
            plot_image1(reshape(label_test, image_height, image_width), mat_list_names)    % plot composite material
        
            figure
            plot_image1(reshape(heterogeneous_test_label, image_height, image_width), mat_list_names)    % plot classified heterogeneous material
        
        elseif branch_path == 'dataset_2'
            cm.XLabel = 'Predicted Class (14-Materials)';
            cm.YLabel = 'True Class (14-Materials)';
            image_height = 60;
            image_width = 80;
            cm.FontName = 'Times New Roman';
            cm.FontSize = 11;
            cm.ColumnSummary = 'total-normalized';
            cm.RowSummary = 'total-normalized';
        
        
            figure
            plot_image2(reshape(label_test, image_height, image_width), mat_list_names)    % plot composite material
        
            figure
            plot_image2(reshape(heterogeneous_test_label, image_height, image_width), mat_list_names)    % plot classified heterogeneous material
        
        elseif branch_path == 'dataset_3'
            cm.XLabel = 'Predicted Class (05-Materials)';
            cm.YLabel = 'True Class (05-Materials)';
            image_height = 40;
            image_width = 40;
            cm.FontName = 'Times New Roman';
            cm.FontSize = 11;
            cm.ColumnSummary = 'total-normalized';
            cm.RowSummary = 'total-normalized';
        
            figure
            plot_image3(reshape(label_test, image_height, image_width), mat_list_names)    % plot composite material
        
            figure
            plot_image3(reshape(heterogeneous_test_label, image_height, image_width), mat_list_names)    % plot classified heterogeneous material
        end
        end
        
        

            
         %    maxacc(end+1)= average_test_accuracy;
         %    abc(end+1)=a;
         % 
         % 
         % end
        %% save important variables
        
        % %save(full_path_result+'trained_model','x_train', 'x_val', 'y_train', 'y_val', 'network', '-v7.3');
% save('var_mat_14_patch_size_5.mat', 'train', 'val', 'x_train', 'x_val', 'y_train', 'y_val', 'network', '-v7.3');