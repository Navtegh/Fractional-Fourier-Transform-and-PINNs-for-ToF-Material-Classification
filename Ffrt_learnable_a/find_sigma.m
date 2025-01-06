function  [sigma, dist_parameters, normal_parameter, weibull_parameter, gamma_parameter, lognormal_parameter, kernel_parameter] = find_sigma(data)

    for i = 1:size(data,1)
        for j = 1:size(data,2)          
            
            data{i,j} = permute(data{i,j}, [3 4 1 2]);
            data{i,j} = reshape(data{i,j}, 8, 2, []);
            data{i,j} = permute(data{i,j}, [3 1 2]);
            data{i,j} = reshape(data{i,j}, size(data{i,j}, 1), []);
            
        end
        sigma{i,1} = abs(cat(1, data{i,:}));
        sigma{i,1} = sigma{i,1} + 5;
    end

    for i = 1:size(sigma,1)
        for j = 1:size(sigma{i,1},2)
            
            [normal_parameter, weibull_parameter, gamma_parameter, lognormal_parameter, kernel_parameter] = plot_histogram(sigma{i,1}(:,j), i, j);
            dist_parameters{i,j} = [normal_parameter, weibull_parameter, gamma_parameter, lognormal_parameter, kernel_parameter];
            
        end
    end

end

