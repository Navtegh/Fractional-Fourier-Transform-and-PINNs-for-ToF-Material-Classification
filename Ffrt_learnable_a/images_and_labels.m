%{

~ Function images_and_labels

Desciption: This function provides images and its labels for train, val and test
Author: Rajababu SIngh
Matriculation number: 1530580
Supervisor: Dr. Conde

%}

function [images, labels] = images_and_labels(new_dataset, window_row, window_colm, window_stride, mat_names, k,std_dev)

    images_data = cell(size(new_dataset, 1), size(new_dataset, 2));
    raw_images_data = cell(size(new_dataset, 1), size(new_dataset, 2));
    img = cell(size(new_dataset, 1), 1);
    raw_img = cell(size(new_dataset, 1), 1);
    for mat_idx = 1: size(new_dataset, 1)
        for inst_idx = 1: size(new_dataset, 2)

            image = new_dataset{mat_idx, inst_idx};
            [raw_images_data{mat_idx, inst_idx}, images_data{mat_idx, inst_idx}] = sliding_window(image, window_row, window_colm, window_stride,std_dev);
            images_data{mat_idx, inst_idx} =  images_data{mat_idx, inst_idx}(:); % convert a matrix into vector
            raw_images_data{mat_idx, inst_idx} = raw_images_data{mat_idx, inst_idx}(:); % convert a matrix into vector

        end
        img{mat_idx,1} = vertcat(images_data{mat_idx,:});
        
            
        img{mat_idx,1} = cat(5, img{mat_idx,1}{:});
        img{mat_idx,1} = permute(img{mat_idx,1}, [5 1 2 3 4]);
        disp(mat_idx);

        raw_img{mat_idx,1} = vertcat(raw_images_data{mat_idx,:});
        raw_img{mat_idx,1} = cat(5, raw_img{mat_idx,1}{:});
        raw_img{mat_idx,1} = permute(raw_img{mat_idx,1}, [5 1 2 3 4]);
        disp(mat_idx);

    end

    labels_data = {size(img, 1), 1};
    for mat_idx = 1: size(img, 1)
        labels_data{mat_idx} = repmat(mat_names{mat_idx, 1}, size(img{mat_idx,1}, 1), 1);
    end
    
    images = vertcat(img{:});
    images = permute(images, [2 3 4 5 1]);

    raw_images = vertcat(raw_img{:});
    raw_images = permute(raw_images, [2 3 4 5 1]);
    %[sigma_R_Sqr, d_new, G] = sigma_R_Square(images);
    images = knn(images, raw_images, k);
    labels = categorical(vertcat(labels_data{:}));
    
end