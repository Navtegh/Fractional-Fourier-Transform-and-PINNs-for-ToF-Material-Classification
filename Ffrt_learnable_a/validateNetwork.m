function [valLoss, valAccuracy] = validateNetwork(lgraph, x_val, y_val, alpha)
    % Perform validation pass through the network
    dlnet = dlnetwork(lgraph);
    valPred = predict(dlnet, x_val);
    valLoss = crossentropy(valPred, y_val);
    [~, valPredLabels] = max(valPred, [], 4);
    valAccuracy = mean(valPredLabels == y_val);
end