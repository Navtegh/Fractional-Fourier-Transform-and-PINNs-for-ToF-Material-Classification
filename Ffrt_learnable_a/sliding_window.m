%{

~ sliding_window

Desciption: This function extracts image patches by sliding over the entire
image and simultaneously convolve the window with the bilateral weight
matrix
Author: Rajababu SIngh
Matriculation number: 1530580
Supervisor: Dr. Conde

%}

function [sliding_window_images, bilateral_weight_images] = sliding_window(image, window_row, window_colm, window_stride, std_dev)

    sliding_window_images = cell(floor(size(image,1)-window_row+1/window_stride), floor(size(image,2)-window_colm+1/window_stride));
    bilateral_weight_images = cell(floor(size(image,1)-window_row+1/window_stride), floor(size(image,2)-window_colm+1/window_stride));

    for row1 = 1 :window_stride: size(image, 1) - window_row + 1
        row2 = row1 + window_row - 1;
        if row2 > size(image, 1)
            break;
        end
           
        for col1 = 1 :window_stride: size(image, 2) - window_colm + 1
            col2 = col1 + window_colm - 1;
            if col2 > size(image, 2)
                break;
            end
            
            sliding_window_images{row1, col1} = image(row1 : row2, col1 : col2, :, :);
            %sliding_window_images{row1, col1} = sliding_window_images{row1, col1} .* bilateral_weight_matrix(sliding_window_images{row1, col1} , 8.7018, 0.5361);
            bilateral_weight_images{row1, col1} = bilateral_weight_matrix(sliding_window_images{row1, col1} , 7.5, std_dev);

        end

    end

end