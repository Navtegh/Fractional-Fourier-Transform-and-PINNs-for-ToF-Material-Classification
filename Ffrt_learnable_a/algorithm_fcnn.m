function net = algorithm_fcnn(x_train, x_val, y_train, y_val)

    layers = [
        image3dInputLayer(size(x_train, 1, 2, 3, 4),"Name","imageinput")
        batchNormalizationLayer

        fullyConnectedLayer(200,"WeightsInitializer","he")
        batchNormalizationLayer
        reluLayer
        
        fullyConnectedLayer(250,"WeightsInitializer","he")
        batchNormalizationLayer
        reluLayer
        
        fullyConnectedLayer(300,"WeightsInitializer","he")
        batchNormalizationLayer
        reluLayer  

        fullyConnectedLayer(250,"WeightsInitializer","he")
        batchNormalizationLayer
        reluLayer
        dropoutLayer(0.3)

        fullyConnectedLayer(200,"WeightsInitializer","he")
        batchNormalizationLayer
        reluLayer

        fullyConnectedLayer(100,"WeightsInitializer","he")
        batchNormalizationLayer
        reluLayer

        fullyConnectedLayer(50,"WeightsInitializer","he")
        batchNormalizationLayer
        reluLayer

        fullyConnectedLayer(25,"WeightsInitializer","he")
        batchNormalizationLayer
        reluLayer
          
        fullyConnectedLayer(numel(unique(y_train)),"Name","fc_6","WeightsInitializer","he")
        softmaxLayer("Name","softmax")
        classificationLayer("Name","classoutput")
        ];
    
    options = trainingOptions('adam',...    
        'InitialLearnRate',0.08,... 
        'LearnRateSchedule', 'piecewise',... 
        'LearnRateDropFactor', 0.65,...
        'LearnRateDropPeriod', 1,...    
        'MaxEpochs',50,...           
        'MiniBatchSize', 800,...  
        'Shuffle', 'every-epoch',...
        'ValidationData', {x_val, y_val},...
        'ValidationFrequency', 500, ...
        'ValidationPatience', 5, ...
        'VerboseFrequency', 500, ...
        'plots','training-progress',...
        'ExecutionEnvironment','gpu');

    net = trainNetwork(x_train, y_train, layers, options);

end