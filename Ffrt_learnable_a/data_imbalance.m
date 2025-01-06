%{

~ Function Dataimbalance

Desciption: To classify material
Author: Rajababu SIngh
Matriculation number: 1530580
Supervisor: Dr. Conde

%}

function data_imbalance(new_dataset)
    pixels = zeros(1, size(new_dataset, 1));
    for mat_idx = 1: size(new_dataset, 1)    
        for inst_idx = 1: size(new_dataset, 2)

            [row, colm, ~] = size(new_dataset{mat_idx, inst_idx});
            pixels(mat_idx) = pixels(mat_idx)+ row*colm;

        end
    end

    total_pixels = sum(sum(pixels));
    for mat_idx = 1: size(new_dataset, 1)
        disp([mat_idx (pixels(mat_idx)*100)/total_pixels]);
    end
    
end