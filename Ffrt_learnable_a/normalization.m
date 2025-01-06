%{

~ Normalization function

Desciption: To function normalize the values of pixels and also crop ROI
according to pixel ranges.
Author: Rajababu SIngh
Matriculation number: 1530580
Supervisor: Dr. Conde

%}

function new_dataset = normalization(dataset_filename, pix_ranges)

    load(dataset_filename,'dataset','amp_imgs','depth_imgs','f_0','c');

    [n_mats, n_inst_per_mat] = size(dataset);
    new_dataset = cell(n_mats, n_inst_per_mat);
    for mat_idx=1:n_mats
        for inst_idx=1:n_inst_per_mat
        
            % Retrieve pixel range (only data within "valid" pixel ranges is considered)
            init_row_idx = pix_ranges{2*(inst_idx-1)+1,(2*(mat_idx-1)+1)}; 
            final_row_idx = pix_ranges{2*(inst_idx-1)+1,(2*mat_idx)}; 
            init_col_idx = pix_ranges{(2*inst_idx),(2*(mat_idx-1)+1)}; 
            final_col_idx = pix_ranges{(2*inst_idx),(2*mat_idx)};
            
            % Obtain reflectivity- and depth-independent features from raw data
            amp_data = amp_imgs{mat_idx,inst_idx};
            amp_norm_dataset = dataset{mat_idx,inst_idx}(:,:,2:end)./amp_data;
    
            % Back calculating phase from depth information
            phase_data = 2*(2*pi)*f_0*1e6*depth_imgs{mat_idx,inst_idx}/c;
            amp_size = size(amp_norm_dataset);
            new_dataset{mat_idx,inst_idx} = amp_norm_dataset./exp(repmat(reshape(1i*(1:amp_size(3)),1,1,amp_size(3)),[amp_size(1),amp_size(2),1]).*repmat(reshape(phase_data,amp_size(1),amp_size(2),1),[1,1,amp_size(3)])); %Compensate in phase domain
            
            % Cropping Region of INterest from Images
            new_dataset{mat_idx,inst_idx} = new_dataset{mat_idx,inst_idx}(init_row_idx:final_row_idx,init_col_idx:final_col_idx,:);
    
        end
    end

end