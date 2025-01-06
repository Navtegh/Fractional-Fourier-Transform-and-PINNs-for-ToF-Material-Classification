%{

~ Function breakdown

Desciption: this function breaks down the images into small equal size
Author: Rajababu SIngh
Matriculation number: 1530580
Supervisor: Dr. Conde

%}

function a = breakdown(new_dataset_downS)

    % initilization
    data = cell(size(new_dataset_downS));
    dataset = cell(size(new_dataset_downS, 1), 1);
    a = cell(size(new_dataset_downS, 1), 1);

    % loop over alm materials and all instances
    for mat_idx = 1: size(new_dataset_downS, 1)
        for inst_idx = 1: size(new_dataset_downS, 2)

            i = 20*ones(1, size(new_dataset_downS{mat_idx, inst_idx}, 1)/20);
            j = 20*ones(1, size(new_dataset_downS{mat_idx, inst_idx}, 2)/20);
            % data{mat_idx, inst_idx} = mat2cell(new_dataset_downS{mat_idx, inst_idx}, i, j, 8, 2);

            data{mat_idx, inst_idx} = mat2cell(new_dataset_downS{mat_idx, inst_idx}, i, j, 8, 2);
            data{mat_idx, inst_idx} = (data{mat_idx, inst_idx}(:))';

        end
        dataset{mat_idx, 1} = horzcat(data{mat_idx,:});
        a{mat_idx, 1} = dataset{mat_idx, 1}(:)';
    end
    a = vertcat(a{:});

end