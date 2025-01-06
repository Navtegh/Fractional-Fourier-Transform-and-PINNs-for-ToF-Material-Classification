function net = algorithm_cnn5(x_train, x_val, y_train, y_val)

    layers = [
         image3dInputLayer(size(x_train, 1, 2, 3, 4),"Name","imageinput")
         batchNormalizationLayer("Name","batchnorm_1")

         convolution3dLayer([1 3 3],4,"Name","conv_1","Padding","same")
         batchNormalizationLayer("Name","batchnorm_2")
         reluLayer("Name","relu_1")
    
         convolution3dLayer([1 3 3],8,"Name","conv_2","Padding","same")
         batchNormalizationLayer("Name","batchnorm_3")
         reluLayer("Name","relu_2")
         dropoutLayer(0.3)
    
         convolution3dLayer([1 3 3],16,"Name","conv_3","Padding","same")
         batchNormalizationLayer("Name","batchnorm_4")
         reluLayer("Name","relu_3")
    
         fullyConnectedLayer(16,"Name","fc_1")
         batchNormalizationLayer("Name","batchnorm_5")
         reluLayer("Name","relu_4")
         fullyConnectedLayer(16,"Name","fc_2")
         batchNormalizationLayer("Name","batchnorm_6")
         reluLayer("Name","relu_5")
         fullyConnectedLayer(numel(unique(y_train)),"Name","fc_3")
         softmaxLayer("Name","softmax")
         classificationLayer("Name","classoutput")
         ];
    
    options = trainingOptions('adam',...    
        'InitialLearnRate',0.08,... 
        'LearnRateSchedule', 'piecewise',... 
        'LearnRateDropFactor', 0.65,...
        'LearnRateDropPeriod', 1,...    
        'MaxEpochs',100,...           
        'MiniBatchSize', 2000,...  
        'Shuffle', 'every-epoch',...
        'ValidationData', {x_val, y_val},...
        'ValidationFrequency', 500, ...
        'ValidationPatience', 5, ...
        'VerboseFrequency', 500, ...
        'plots','training-progress',...
        'ExecutionEnvironment','gpu');
    
    net = trainNetwork(x_train, y_train, layers, options);

end