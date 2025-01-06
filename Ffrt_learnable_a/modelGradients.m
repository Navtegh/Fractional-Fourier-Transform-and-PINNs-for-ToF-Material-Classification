function [gradients, loss, state, alphaGrad] = modelGradients(dlnet, X, Y, alpha)
    [Z, state] = forwar(dlnet, X);
    loss = crossentropy(Z, Y);
    % alpha = dlnet.Layers(2).Alpha;
    gradients = dlgradient(loss, dlnet.Learnables);
    % disp(dlnet.Learnables);
     % Assuming alpha is in the second layer
    % disp(dlnet.Learnables.Value{strcmp(dlnet.Learnables.Parameter, 'Alpha')});
    alphaGrad = dlgradient(loss, dlnet.Learnables.Value{strcmp(dlnet.Learnables.Parameter, 'Alpha')});
end