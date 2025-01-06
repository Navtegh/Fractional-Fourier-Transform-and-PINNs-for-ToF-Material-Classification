function net = algorithm_ResNet(x_train, x_val, y_train, y_val)

lgraph = layerGraph();

    tempLayers = [
    image3dInputLayer(size(x_train, 1, 2, 3, 4),"Name","imageinput")
    batchNormalizationLayer("Name","batchnorm_1")
    convolution3dLayer([1 3 3],4,"Name","conv_1","Padding","same","WeightsInitializer","he")
    batchNormalizationLayer("Name","batchnorm_2")
    reluLayer("Name","relu_1")];
lgraph = addLayers(lgraph,tempLayers);

tempLayers = [
    convolution3dLayer([1 3 3],4,"Name","conv_2","Padding","same","WeightsInitializer","he")
    batchNormalizationLayer("Name","batchnorm_3")];
lgraph = addLayers(lgraph,tempLayers);

tempLayers = [
    additionLayer(2,"Name","addition_1")
    reluLayer("Name","relu_2")
    convolution3dLayer([1 3 3],32,"Name","conv_3","Padding","same","WeightsInitializer","he")
    batchNormalizationLayer("Name","batchnorm_4")
    reluLayer("Name","relu_3")];
lgraph = addLayers(lgraph,tempLayers);

tempLayers = [
    convolution3dLayer([1 2 3],16,"Name","conv_4","Padding","same","WeightsInitializer","he")
    batchNormalizationLayer("Name","batchnorm_5")
    reluLayer("Name","relu_4")
    dropoutLayer(0.2,"Name","dropout_1")
    convolution3dLayer([1 2 3],32,"Name","conv_5","Padding","same","WeightsInitializer","he")
    batchNormalizationLayer("Name","batchnorm_6")
    ];
lgraph = addLayers(lgraph,tempLayers);

tempLayers = [
    additionLayer(2,"Name","addition_2")
    reluLayer("Name","relu_5")
    fullyConnectedLayer(32,"Name","fc_1")
    batchNormalizationLayer("Name","batchnorm_7")
    reluLayer("Name","relu_6")
    fullyConnectedLayer(16,"Name","fc_2")
    batchNormalizationLayer("Name","batchnorm_8")
    reluLayer("Name","relu_7")
    fullyConnectedLayer(numel(unique(y_train)),"Name","fc_3")
    softmaxLayer("Name","softmax")
    classificationLayer("Name","classoutput")];
lgraph = addLayers(lgraph,tempLayers);



lgraph = connectLayers(lgraph,"relu_1","conv_2");
lgraph = connectLayers(lgraph,"relu_1","addition_1/in2");
lgraph = connectLayers(lgraph,"batchnorm_3","addition_1/in1");
lgraph = connectLayers(lgraph,"relu_3","conv_4");
lgraph = connectLayers(lgraph,"relu_3","addition_2/in2");
lgraph = connectLayers(lgraph,"batchnorm_6","addition_2/in1");;

% clean up helper variable
clear tempLayers;
    
    options = trainingOptions('adam',...    
        'InitialLearnRate',0.025,... 
        'LearnRateSchedule', 'piecewise',... 
        'LearnRateDropFactor', 0.65,...
        'LearnRateDropPeriod', 1,...    
        'MaxEpochs',30,...           
        'MiniBatchSize', 10000,...  
        'Shuffle', 'every-epoch',...
        'ValidationData', {x_val, y_val},...
        'ValidationFrequency', 1000, ...
        'ValidationPatience', 5, ...
        'VerboseFrequency', 1000, ...
        'plots','training-progress',...
        'ExecutionEnvironment','gpu');

    net = trainNetwork(x_train, y_train, lgraph, options);

end