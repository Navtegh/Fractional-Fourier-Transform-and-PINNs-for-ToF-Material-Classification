function transformedData = apply_ffrt(data, alpha)
    % Get the size of the data
    [dim1, dim2, dim3, dim4, numDataPoints] = size(data);
    
    % Initialize the transformed data array with the same size
    transformedData = zeros(dim1, dim2, dim3, dim4, numDataPoints);
    
    % Loop through each data point
    for i = 1:numDataPoints
        % Extract the real and imaginary parts
        realPart = data(:,:,:,1,i);
        imagPart = data(:,:,:,2,i);
        
        % Combine them into a complex array
        complexData = realPart + 1i * imagPart;
        
        % Apply FrFT to each frequency channel
        transformedComplexData = zeros(size(complexData));
        for j = 1:dim3
            transformedComplexData(:,:,j) = frft(squeeze(complexData(:,:,j)), alpha);
        end
        
        % Split back into real and imaginary parts
        transformedData(:,:,:,1,i) = real(transformedComplexData);
        transformedData(:,:,:,2,i) = imag(transformedComplexData);
    end
end
