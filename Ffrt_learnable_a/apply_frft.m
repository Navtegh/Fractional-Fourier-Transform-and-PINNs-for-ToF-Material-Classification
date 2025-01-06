function frft_data = apply_frft(data, alpha)
    % Create an empty cell array to store the FrFT results
    frft_data = cell(size(data));
    
    % Apply FrFT to each element of the data
    for i = 1:size(data, 1)
        for j = 1:size(data, 2)
            % Extract the current image data
            image_data = data{i, j};
            
            % Separate real and imaginary parts
            real_part = image_data(:,:,:,1);
            imag_part = image_data(:,:,:,2);
            
            % Combine real and imaginary parts into complex numbers
            complex_data = real_part + 1i * imag_part;
    
           % Initialize the FrFT result for this cell
            frft_real_part = zeros(size(real_part));
            frft_imag_part = zeros(size(imag_part));
            
            % Apply FrFT to each frequency slice
            for k = 1:size(complex_data, 3)
                for m = 1:size(complex_data, 1)
                    for n = 1:size(complex_data, 2)
                        % Apply FrFT to the complex number
                        transformed_value = frft2(complex_data(m, n, k), alpha);
                        frft_real_part(m, n, k) = real(transformed_value);
                        frft_imag_part(m, n, k) = imag(transformed_value);
                    end
                end
            end
            
            % Store the result back in the cell array
            frft_data{i, j} = cat(4, frft_real_part, frft_imag_part);
        end
    end