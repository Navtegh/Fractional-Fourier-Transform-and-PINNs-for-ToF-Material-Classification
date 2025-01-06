%{

~ downSample_dataset

Desciption: This function returns a random crop of the image accoring to
the size prescribed in main file.
Author: Rajababu SIngh
Matriculation number: 1530580
Supervisor: Dr. Conde

%}

function downSampled_dataset = downSample_dataset(data, height, width)

    new_data = cell(size(data, 1), size(data, 2));
    downSampled_dataset = cell(size(data, 1), size(data, 2));
        for mat_idx = 1: size(data, 1)
            for inst_idx = 1: size(data, 2)

                real_value = real(data{mat_idx, inst_idx});
                imag_value = imag(data{mat_idx, inst_idx});   
                new_data{mat_idx,inst_idx} = cat(4, real_value, imag_value);

                input_value = size(new_data{mat_idx, inst_idx});
                target_value = [height width size(new_data{1,1}, 3) size(new_data{1,1}, 4)];

                crop_image = randomCropWindow3d(input_value, target_value); 
                downSampled_dataset{mat_idx, inst_idx} = imcrop3(new_data{mat_idx, inst_idx}, crop_image);

            end            
        end
        
end