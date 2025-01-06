function std_Dev = std_deviation(sigma)

    for i = 1:size(sigma,1)
        
        std_Dev{i,1} =  std(sigma{i,1});

    end

end