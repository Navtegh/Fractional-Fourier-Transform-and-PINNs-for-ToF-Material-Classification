function net = algorithm_cnn4(x_train, x_val, y_train, y_val, n_mats)

    layers = [
         image3dInputLayer(size(x_train, 1, 2, 3, 4),"Name","imageinput")
         batchNormalizationLayer("Name","batchnorm_1")

         convolution3dLayer([3 3 4],4,"Name","conv_1","Padding","same")
         batchNormalizationLayer("Name","batchnorm_2")
         reluLayer("Name","relu_1")
    
         convolution3dLayer([3 3 4],4,"Name","conv_2","Padding","same")
         batchNormalizationLayer("Name","batchnorm_3")
         reluLayer("Name","relu_2")
    
         convolution3dLayer([3 3 4],8,"Name","conv_3","Padding","same")
         batchNormalizationLayer("Name","batchnorm_4")
         reluLayer("Name","relu_3")
    
         convolution3dLayer([2 2 3],8,"Name","conv_4","Padding","same")
         batchNormalizationLayer("Name","batchnorm_5")
         reluLayer("Name","relu_4")  
    
         maxPooling3dLayer([2 2 3],"Name","maxpool_1","Padding","same")
         dropoutLayer(0.2)    
    
         convolution3dLayer([2 2 3],32,"Name","conv_5","Padding","same")
         batchNormalizationLayer("Name","batchnorm_6")
         reluLayer("Name","relu_5")

         convolution3dLayer([2 2 3],32,"Name","conv_6","Padding","same")
         batchNormalizationLayer("Name","batchnorm_7")
         reluLayer("Name","relu_6")

         convolution3dLayer([2 2 3],64,"Name","conv_7","Padding","same")
         batchNormalizationLayer("Name","batchnorm_8")
         reluLayer("Name","relu_7")

         convolution3dLayer([2 2 3],64,"Name","conv_8","Padding","same")
         batchNormalizationLayer("Name","batchnorm_9")
         reluLayer("Name","relu_8")

         convolution3dLayer([2 2 3],128,"Name","conv_9","Padding","same")
         batchNormalizationLayer("Name","batchnorm_10")
         reluLayer("Name","relu_9")

         convolution3dLayer([2 2 3],128,"Name","conv_10","Padding","same")
         batchNormalizationLayer("Name","batchnorm_11")
         reluLayer("Name","relu_10")

         convolution3dLayer([2 2 3],256,"Name","conv_11","Padding","same")
         batchNormalizationLayer("Name","batchnorm_12")
         reluLayer("Name","relu_11")

         convolution3dLayer([2 2 3],256,"Name","conv_12","Padding","same")
         batchNormalizationLayer("Name","batchnorm_13")
         reluLayer("Name","relu_12")
    
         fullyConnectedLayer(128,"Name","fc_1")
         batchNormalizationLayer("Name","batchnorm_14")
         reluLayer("Name","relu_13")
         fullyConnectedLayer(64,"Name","fc_2")
         batchNormalizationLayer("Name","batchnorm_15")
         reluLayer("Name","relu_14")
         fullyConnectedLayer(32,"Name","fc_3")
         batchNormalizationLayer("Name","batchnorm_16")
         reluLayer("Name","relu_15")
         fullyConnectedLayer(16,"Name","fc_4")
         batchNormalizationLayer("Name","batchnorm_17")
         reluLayer("Name","relu_16")
         fullyConnectedLayer(n_mats,"Name","fc_5")
         softmaxLayer("Name","softmax")
         classificationLayer("Name","classoutput")
         ];
    
    
    
    options = trainingOptions('adam',...    
        'InitialLearnRate',0.08,... 
        'LearnRateSchedule', 'piecewise',... 
        'LearnRateDropFactor', 0.65,...
        'LearnRateDropPeriod', 1,...    
        'MaxEpochs',100,...           
        'MiniBatchSize', 500,...  
        'Shuffle', 'every-epoch',...
        'ValidationData', {x_val, y_val},...
        'ValidationFrequency', 500, ...
        'ValidationPatience', 5, ...
        'VerboseFrequency', 1000, ...
        'plots','training-progress',...
        'ExecutionEnvironment','gpu');
    
    net = trainNetwork(x_train, y_train, layers, options);

end