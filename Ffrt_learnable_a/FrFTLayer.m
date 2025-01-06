classdef FrFTLayer < nnet.layer.Layer & nnet.layer.Acceleratable
    properties (Learnable,Access=public)
        Alpha
    end
    
    methods
        function layer = FrFTLayer(name)
            
            % Set layer name
            layer.Name = name;
            % Initialize Alpha
            a = 0; % lower bound of the range
            b = 1; % upper bound of the range
            random =  a + (b - a) * rand(); % Initialize with a random value
            layer.Alpha = dlarray(random, 'SSCB');
            
            disp(['Initial Alpha: ', num2str(layer.Alpha)]);
        end

        
        function Z = predict(layer, X)
            % if ~isa(X, 'dlarray')
            %      X = dlarray(X, 'SSSCB');
            % end
            % Apply FrFT to the input X using the provided function
            a = -1; % lower bound of the range
            b = 1;
            global alphahistory;
            layer.Alpha = min(max(layer.Alpha, a), b);
            alphahistory(end+1)= (layer.Alpha);
            % disp(layer.Alpha);            
            transformedData = applyFrft(layer.Alpha, X);
            % Z=dlarray(X);
            Z = single(dlarray(transformedData));
        end
    end
end

function transformedData = applyFrft(Alpha, data)
    [dim1, dim2, dim3, dim4, numDataPoints] = size(data);
    if ~isa(data, 'dlarray')
        data = dlarray(data, 'SSSCB'); % Specify the format
    end
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
            transformedComplexData(:,:,j) = frft2(squeeze(complexData(:,:,j)), Alpha);
            % transformedComplexData(:,:,j) = complexData(:,:,j);
        end
        
        % Split back into real and imaginary parts
        transformedData(:,:,:,1,i) = real(transformedComplexData);
        transformedData(:,:,:,2,i) = imag(transformedComplexData);
    end
end