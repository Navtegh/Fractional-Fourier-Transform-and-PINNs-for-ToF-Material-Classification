% Initialize the combined dataset
combined_dataset = cell(size(train_val_test));

% Iterate over each cell in the datasets
for i = 1:size(train_val_test, 1)
    for j = 1:size(train_val_test, 2)
        % Extract data from dataset1
        data1 = single(train_val_test0{i, j});
        
        % Extract data from dataset2
        data2 = single(train_val_test2{i, j});
        
        data4 = single(train_val_test3{i, j});

        % Concatenate the data along the fourth dimension
        combined_data = cat(4, data1, data2, data4);
        
        % Store the combined data in the combined dataset
        combined_dataset{i, j} = combined_data;
    end
end