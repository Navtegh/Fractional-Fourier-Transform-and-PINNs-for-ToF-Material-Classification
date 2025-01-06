function net = customTrainNetwork(x_train, y_train, layers, options, x_val, y_val)
    % Initialize network
    lgraph = layerGraph(layers);
    dlnet = dlnetwork(lgraph);
    % Training parameters
    numEpochs = options.MaxEpochs;
    miniBatchSize = options.MiniBatchSize;
    learnRate = options.InitialLearnRate;
    averageGrad = [];
    averageSqGrad = [];

    % Convert categorical labels to numeric arrays
    numClasses = numel(categories(y_train));
    y_train = grp2idx(y_train);
    y_val = grp2idx(y_val);
    % alpha = lgraph.Layers(2).Alpha;
    iteration = 0;
%
% 
    % Training loop
    for epoch = 1:numEpochs
        disp(['Epoch ', num2str(epoch)])
        idx = randperm(size(x_train, 5));
        disp(numel(idx));
        for i = 1:ceil(numel(idx) / miniBatchSize)
            % Get mini-batch of data
            miniBatchIdx = idx((i-1)*miniBatchSize + 1 : min(i*miniBatchSize, numel(idx)));
            X = dlarray(x_train(:, :, :, :, miniBatchIdx), 'SSSCB'); % Specify the format
            Y = y_train(miniBatchIdx);
         
            Y=(Y==1:14);
            Y = double(Y'); 
            alpha = dlnet.Layers(2).Alpha;
            [gradients, loss, state, alphaGrad] = dlfeval(@modelGradients, dlnet, X, Y,alpha);
            disp(['Iteration ', num2str(i), ' Loss: ', num2str(loss), ' Alpha: ', num2str(alpha)]);
            % disp(size(gradients));
            % disp(state);
            % % Forward pass
            % [Z, state] = forward(lgraph, X);
            % 
            % 
            % % Compute loss
            % loss = crossentropy(Z, Y);
            % disp(loss);
            % dlnet = dlnetwork(lgraph);
            % % Compute gradients
            % % [gradients, alphaGrad] = dlgradient(loss, state.Learnables, alpha);
            % 
            % [gradients,alphaGrad] = dlfeval(@compute_gradient,dlnet,loss,alpha);
             % disp(alpha);
            % Update network parameters
   

            alpha=alpha-(learnRate*alphaGrad);
            iteration=iteration+1;
            [dlnet,averageGrad,averageSqGrad] = adamupdate(dlnet,gradients,averageGrad,averageSqGrad,iteration);
            dlnet=updatealpha(dlnet,alpha);
            % state = updateNetwork(state, gradients, learnRate);
           
            % Update network

            % dlnet = dlupdate(@sgdUpdate, dlnet, gradients, learnRate);
            
            % Update network with new learnables and alpha
            % dlnet = updateLayers(dlnet, state, alpha);
            
        end
        
        % Validation
        if ~isempty(x_val)
            [valLoss, valAccuracy] = validateNetwork(lgraph, x_val, y_val);
            disp(['Validation Loss: ', num2str(valLoss), ', Accuracy: ', num2str(valAccuracy)]);
        end
    end
    
    % Convert layer graph to a trained network
    net = dlnet;
    % net = assembleNetwork(lgraph);
end