function net = algorithm_cnn2(x_train, x_val, y_train, y_val)

    layers = [
         image3dInputLayer(size(x_train, 1, 2, 3, 4), "Name", "imageinput")
         % FrFTLayer("frft")
         batchNormalizationLayer("Name", "batchnorm_1")

         convolution3dLayer([1 3 3], 4, "Name", "conv_1", "Padding", "same")
         batchNormalizationLayer("Name", "batchnorm_2")
         reluLayer("Name", "relu_1")
    
         convolution3dLayer([1 3 3], 8, "Name", "conv_2", "Padding", "same")
         batchNormalizationLayer("Name", "batchnorm_3")
         reluLayer("Name", "relu_2")
    
         convolution3dLayer([1 3 3], 16, "Name", "conv_3", "Padding", "same")
         batchNormalizationLayer("Name", "batchnorm_4")
         reluLayer("Name", "relu_3")

         convolution3dLayer([1 3 3], 16, "Name", "conv_4", "Padding", "same")
         batchNormalizationLayer("Name", "batchnorm_5")
         reluLayer("Name", "relu_4")
     
         fullyConnectedLayer(32, "Name", "fc_1")
         batchNormalizationLayer("Name", "batchnorm_6")
         reluLayer("Name", "relu_5")
         fullyConnectedLayer(16, "Name", "fc_2")
         batchNormalizationLayer("Name", "batchnorm_7")
         reluLayer("Name", "relu_6")
         fullyConnectedLayer(numel(unique(y_train)), "Name", "fc_3")
         softmaxLayer("Name", "softmax")
         classificationLayer("Name","classoutput")
         ];
    % layers(2) = setL2Factor(layers(2),"Alpha",0.1);
    % layers(2) = setLearnRateFactor(layers(2),"Alpha",0.1);
    % disp(getL2Factor(layers(2),"Alpha"));
    options = trainingOptions('adam',...    
        'InitialLearnRate', 0.01,... 
        'LearnRateSchedule', 'piecewise',... 
        'MaxEpochs', 1,...           
        'MiniBatchSize', 800,...
        'Shuffle', 'every-epoch',...
        'ValidationData', {x_val, y_val},...
        'ValidationFrequency', 300, ...
        'ValidationPatience', 5, ...
        'VerboseFrequency', 300, ...
        'Plots', 'training-progress',...
        'ExecutionEnvironment', 'auto'   );

    net = trainNetwork(x_train, y_train, layers, options);
      % 'LearnRateDropFactor', 0.65,...
        % 'LearnRateDropPeriod', 1,...    
     % net = customTrainNetwork(x_train, y_train, layers, options, x_val, y_val);

end
