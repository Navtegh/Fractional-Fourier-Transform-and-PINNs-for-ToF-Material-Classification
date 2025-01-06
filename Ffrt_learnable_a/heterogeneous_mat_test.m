%{

~ heterogeneous_mat_test

Desciption: This function develop a heterogeneous material to check the quality of model
Author: Rajababu SIngh
Matriculation number: 1530580
Supervisor: Dr. Conde

%}

function [raw_test_data, label_test] = heterogeneous_mat_test(branch_path, test_dataset, window_row, window_colm, window_stride, mat_names, k, std_dev)
    
    if branch_path == 'dataset_1'
        disp('heterogeneous_'+branch_path)
        input_value = size(test_dataset{1, 1});
        target_value = [20 20 8 2];
    
        image = cell(size(test_dataset, 1), 1);
        label = cell(size(test_dataset, 1), 1);
        rand_value = randperm(size(test_dataset, 2), 1);
        for mat_idx = 1:size(test_dataset, 1)
            crop_image = randomCropWindow3d(input_value, target_value);
            image{mat_idx} = imcrop3(test_dataset{mat_idx, rand_value}, crop_image);
            label{mat_idx} =  repmat(mat_names{mat_idx, 1}, [size(image{mat_idx}, 1) size(image{mat_idx}, 2)]);
        end    
        img = [[image{1}; image{2}; image{3}] [image{4}; image{5}; image{6}] [image{7}; image{8}; image{9}] [image{10}; image{11}; image{12}]];
        label_test = [[label{1}; label{2}; label{3}] [label{4}; label{5}; label{6}] [label{7}; label{8}; label{9}] [label{10}; label{11}; label{12}]];

    elseif branch_path == 'dataset_2'

        disp('heterogeneous_'+branch_path)
        input_value = size(test_dataset{1, 1});
        target_value = [20 20 8 2; 20 20 8 2; 20 20 8 2;
            15 20 8 2; 15 20 8 2; 15 20 8 2; 15 20 8 2;
            20 20 8 2; 20 20 8 2; 20 20 8 2;
            15 20 8 2; 15 20 8 2; 15 20 8 2; 15 20 8 2];
    
        image = cell(size(test_dataset, 1), 1);
        label = cell(size(test_dataset, 1), 1);
        
        rand_value = randperm(size(test_dataset, 2), 1);
        for mat_idx = 1:size(test_dataset, 1)
            crop_image = randomCropWindow3d(input_value, target_value(mat_idx, :));
            image{mat_idx} = imcrop3(test_dataset{mat_idx, rand_value}, crop_image);
            label{mat_idx} =  repmat(mat_names{mat_idx, 1}, [size(image{mat_idx}, 1) size(image{mat_idx}, 2)]);
        end    
        img = [[image{1}; image{2}; image{3}] [image{4}; image{5}; image{6}; image{7}] [image{8}; image{9}; image{10}] [image{11}; image{12}; image{13}; image{14}]];
        label_test = [[label{1}; label{2}; label{3}] [label{4}; label{5}; label{6}; label{7}] [label{8}; label{9}; label{10}] [label{11}; label{12}; label{13}; label{14}]];

    

    elseif branch_path == 'dataset_3'
        
        disp('heterogeneous_'+branch_path)
        rand_value = randperm(size(test_dataset, 2), 1);
        input_value = size(test_dataset{1, 1});
        target_value = [20 14 8 2; 20 20 8 2; 20 12 8 2; 20 20 8 2; 20 14 8 2];
        image = cell(size(test_dataset, 1), 1);
        label = cell(size(test_dataset, 1), 1);
    
        for mat_idx = 1:size(test_dataset, 1)
            crop_image = randomCropWindow3d(input_value, target_value(mat_idx, :));
            image{mat_idx} = imcrop3(test_dataset{mat_idx, rand_value}, crop_image);
            label{mat_idx} =  repmat(mat_names{mat_idx, 1}, [size(image{mat_idx}, 1) size(image{mat_idx}, 2)]);
        end    
        img = [image{1} image{3} image{5}; image{2}, image{4}];
        label_test = [label{1} label{3} label{5}; label{2}, label{4}];

    elseif branch_path == 'dataset_4'

        disp('heterogeneous_'+branch_path)
        rand_value = randperm(size(test_dataset, 2), 1);
        input_value = size(test_dataset{1, 1});
        target_value = [20 14 8 2; 20 20 8 2; 20 12 8 2; 20 20 8 2; 20 14 8 2];
        image = cell(size(test_dataset, 1), 1);
        label = cell(size(test_dataset, 1), 1);
    
        for mat_idx = 1:size(test_dataset, 1)
            crop_image = randomCropWindow3d(input_value, target_value(mat_idx, :));
            image{mat_idx} = imcrop3(test_dataset{mat_idx, rand_value}, crop_image);
            label{mat_idx} =  repmat(mat_names{mat_idx, 1}, [size(image{mat_idx}, 1) size(image{mat_idx}, 2)]);
        end    
        img = [image{1} image{3} image{5}; image{2}, image{4}];
        label_test = [label{1} label{3} label{5}; label{2}, label{4}];

    elseif branch_path == 'dataset_5'

        disp('heterogeneous_'+branch_path)
        rand_value = randperm(size(test_dataset, 2), 1);
        input_value = size(test_dataset{1, 1});
        target_value = [20 14 8 2; 20 20 8 2; 20 12 8 2; 20 20 8 2; 20 14 8 2];
        image = cell(size(test_dataset, 1), 1);
        label = cell(size(test_dataset, 1), 1);
    
        for mat_idx = 1:size(test_dataset, 1)
            crop_image = randomCropWindow3d(input_value, target_value(mat_idx, :));
            image{mat_idx} = imcrop3(test_dataset{mat_idx, rand_value}, crop_image);
            label{mat_idx} =  repmat(mat_names{mat_idx, 1}, [size(image{mat_idx}, 1) size(image{mat_idx}, 2)]);
        end    
        img = [image{1} image{3} image{5}; image{2}, image{4}];
        label_test = [label{1} label{3} label{5}; label{2}, label{4}];

    end

    
    padded_img = padarray(img, [floor(window_row/2) floor(window_colm/2)], 'symmetric');
    
    [raw_test_data, test_data] = sliding_window(padded_img, window_row, window_colm, window_stride, std_dev);
    
    test_data = cat(5, test_data{:});
    raw_test_data = cat(5, raw_test_data{:});
    
    raw_test_data = knn(test_data, raw_test_data, k);
    label_test =  categorical(label_test(:));

end