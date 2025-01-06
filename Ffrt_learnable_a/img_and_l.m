function [images, sigma_R_Sqr, d_new, G] = img_and_l(new_dataset, window_row, window_colm, window_stride, spatial_window)

    images_data = cell(size(new_dataset, 1), size(new_dataset, 2));
    img = cell(size(new_dataset, 1), 1);
    for mat_idx = 1: size(new_dataset, 1)
        for inst_idx = 1: size(new_dataset, 2)

            image = new_dataset{mat_idx, inst_idx};
            images_data{mat_idx, inst_idx} = sliding_window(image, window_row, window_colm, window_stride,  spatial_window);
            images_data{mat_idx, inst_idx} =  images_data{mat_idx, inst_idx}(:); % convert a matrix into vector

        end
        img{mat_idx,1} = vertcat(images_data{mat_idx,:});
        img{mat_idx,1} = cat(5, img{mat_idx,1}{:});
        disp(mat_idx);
    end
    
    for mat_idx = 1: size(new_dataset, 1)

        images = vertcat(img{mat_idx,1});

        [sigma_R_Sq, d_ne, g] = sigma_R_Square(images);
        sigma_R_Sqr{mat_idx} = sigma_R_Sq;
        d_new{mat_idx} = d_ne;
        G{mat_idx} = g;

    end

end